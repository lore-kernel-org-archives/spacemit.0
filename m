Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA93F3431FD;
	Fri, 20 Mar 2026 09:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773998378; cv=none; b=EeQVGo2XFgBQmR1TGkjNtj9RETc+mUdWAZqoNKQcc0fMIGlti8ICLizWv51PZdyue2lDORij1x+1fbVbQmXMWBxgoe/2Bcsh3c9mXXlPcLzNCw2xJvsquZHXKhJ5f31r6X09PFwG/T6xenDq7bg7MQbIegJjMVHCjTGaAftxEh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773998378; c=relaxed/simple;
	bh=ykmhVLHFaVW6VL0kFqfY/5bJbeu59kIBa0Np560J1r0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZKz1Yf47zTNSApCWjvjimg+iWEno+ThPwOxJIrrYnptQjdEPwrV2ydT42miB51q4EJxTZ77CVkK7RsPdtJJ10N/9yvmCCjZ/mO29kUfXnz8WMSDTunfIAPNXrVaM7y1XjClpsxTWDWZ6e+fM0uQ975KHYjNNoO2367ysvccg/RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p2SHTXDw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p2SHTXDw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0FB6C4CEF7;
	Fri, 20 Mar 2026 09:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773998378;
	bh=ykmhVLHFaVW6VL0kFqfY/5bJbeu59kIBa0Np560J1r0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p2SHTXDwJKQk8EgpT/xYlgQiw6SSOEC+/0hqE1VfRxsyolPrXWYSA7fJLnwKgeBOk
	 WNp1M+cbScGMlEMqpRBDjfEK9oydKmJCJG9PPCJ0VivFv8d+m3Nwc5hl0ePDlJdqen
	 h22qg1Y5Q5VXjmesk+Pkih5XnhLxUy7XisXEowHuwdkV4iRy0xvTsBmGtqQU42dra2
	 CM+poPsSMg4QPsekNX8P1PlsMZbzusk4kEUcRuEYouZ+zzh0jSzAxtMHCtK+wtlkin
	 AcHLL0iFnNViYUa6GBLfHlA+spDUVK0z2cz1V5Av1nGQ9WfkRbMbkV62NEtxW4F8g7
	 YXBmPsMJZc00Q==
Date: Fri, 20 Mar 2026 17:19:36 +0800
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: Add PDMA controller node for K3 SoC
Message-ID: <20260320091936-GKB525649@kernel.org>
References: <20260317-k3-pdma-v1-1-f39d3e97b53a@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-k3-pdma-v1-1-f39d3e97b53a@linux.spacemit.com>

Hi Troy,

On 15:55 Tue 17 Mar     , Troy Mitchell wrote:
> Add the Peripheral DMA (PDMA) controller node for the SpacemiT K3 SoC.
> The PDMA controller provides general-purpose DMA capabilities for various
> peripheral devices across the system to offload CPU data transfers.
> 
> Unlike the previous K1 SoC, where some DMA masters had memory addressing
> limitations (e.g. restricted to the 0-4GB space) requiring a dedicated dma-bus
> with dma-ranges to restrict memory allocations, the K3 DMA masters have
> full memory addressing capabilities. Therefore, the PDMA node is now
> instantiated directly under the main soc bus.
> 
..
> This configuration defines the essential hardware properties:
> - Register base address and size
> - High-level triggered interrupt
> - Associated APMU clock and reset controls
> - 16 hardware DMA channels
> 
> The node is disabled by default and should be enabled by specific
> board device trees as needed.
I would suggest to drop above, as they are quite obvious, and easy for 
people to grab from the code..
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  arch/riscv/boot/dts/spacemit/k3.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index a3a8ceddabec..f90d34a81be0 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -438,6 +438,17 @@ soc: soc {
>  		dma-noncoherent;
>  		ranges;
>  
> +		pdma: dma-controller@d4000000 {
> +			compatible = "spacemit,k1-pdma";
I think here we should introduce a new compatible for K3 SoC,
it would avoid ABI breakage if something different with K1?
cases exist even same PDMA IP integrated into different SoC..

The commit message tells some difference, although no code changes
introduced so far..

> +			reg = <0x0 0xd4000000 0x0 0x4000>;
> +			clocks = <&syscon_apmu CLK_APMU_DMA>;
> +			resets = <&syscon_apmu RESET_APMU_DMA>;
> +			interrupts = <72 IRQ_TYPE_LEVEL_HIGH>;
> +			dma-channels = <16>;
> +			#dma-cells = <1>;
> +			status = "disabled";
> +		};
> +
>  		syscon_apbc: system-controller@d4015000 {
>  			compatible = "spacemit,k3-syscon-apbc";
>  			reg = <0x0 0xd4015000 0x0 0x1000>;
> 
> ---
> base-commit: 95c541ddfb0815a0ea8477af778bb13bb075079a
> change-id: 20260317-k3-pdma-7c1734431436
> 
> Best regards,
> -- 
> Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 

-- 
Yixun Lan (dlan)
