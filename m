Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC02A3939C5;
	Mon,  9 Mar 2026 10:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773053519; cv=none; b=GQPlFkByKgPhxGKeIsznpWXrIIPcIiv7cKUMXs+mO+iSXoyA8FvEMyy5C3kenIIZG9ECkp3v5U+1ITc7tFu6w1ZQSR926wPBBV1heH5NawHe2j0eovmdy033FKblaqqZt4KWp5mE2z32KJQE12KWD+iL1prVsc5Aa97Y/+KFvhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773053519; c=relaxed/simple;
	bh=1EZLF6reVfsACLYhIQJ/1CQNkvrzppvUxxc05yyeYb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DG+kkgo/A1eZZbe/Kl92OC+/M3dZfjgSTopvbniTwAR/pzG+zBN0IfpXoV+nqNUPf9tcdMRq/bfFTmN7q64cU4VnCEtn96KExbDbv5w+jn/s+kRuA2CVMRRK4xI0iusHdVW6G90a9Ddm26LMG9w6BRt7ya+FMqWjK1cZuQesKyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mtnX8aKY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mtnX8aKY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85023C2BCAF;
	Mon,  9 Mar 2026 10:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773053519;
	bh=1EZLF6reVfsACLYhIQJ/1CQNkvrzppvUxxc05yyeYb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mtnX8aKYF8J8EJ/PpgyRiq1sJOJs0RxjAILcEBg8ndDCUMOUIm4c4qULmL1yXqr9h
	 PpcoPSxnWm2RJ9N4on+2YOGaH6nLDubl/XlkqZXRpBQ8qeI7LWothi+HMFDAYtbq+h
	 B67Wmf3Krm9doChxb7DgFxh6U+qpqgIAkxellFcOFDt4xr+JQbDA0oezgCyDG16Vcp
	 xTU8VXIGGxSzhuVADDudB0w9400TEaMePZNZ8pKf+FgEXqbOjNPHBuf10/Ubkeac3p
	 2Ww3+r0BpAssO5F4qO1VORZEYFO39m7Q3859BFSj1nSiv/0pj4kE5ZrfU8cEcOVsNn
	 R5IHr1/9Ul4QA==
Date: Mon, 9 Mar 2026 18:51:56 +0800
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 1/1] riscv: dts: spacemit: Add 'linux,pci-domain' to
 PCIe nodes for K1
Message-ID: <20260309105156-GKD302167@kernel.org>
References: <20260309030000.1157040-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309030000.1157040-1-amadeus@jmu.edu.cn>

Hi Chukun,

On 11:00 Mon 09 Mar     , Chukun Pan wrote:
> The SpacemiT K1 SoC has 3 PCIe EP controller nodes. Add the
> 'linux,pci-domain' property to assign a PCI domain number to
> each of the controllers instead of assigning it randomly.
> 
> This creates a stable sysfs path, allowing userspace scripts
> to reliably target specific PCIe devices (such as PCIe NICs).
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
Looks good to me

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
> Changes in v2:
> - Improve the commit messages
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 529ec68e9c23..d2015201f8e5 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -1033,6 +1033,7 @@ pcie-bus {
>  			#size-cells = <2>;
>  			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
>  				     <0x0 0xb8000000 0x1 0x38000000 0x3 0x48000000>;
> +
>  			pcie0: pcie@ca000000 {
>  				device_type = "pci";
>  				compatible = "spacemit,k1-pcie";
> @@ -1044,6 +1045,7 @@ pcie0: pcie@ca000000 {
>  					    "atu",
>  					    "config",
>  					    "link";
> +				linux,pci-domain = <0>;
>  				#address-cells = <3>;
>  				#size-cells = <2>;
>  				ranges = <0x01000000 0x0 0x00000000 0x0 0x8f002000 0x0 0x00100000>,
> @@ -1087,6 +1089,7 @@ pcie1: pcie@ca400000 {
>  					    "atu",
>  					    "config",
>  					    "link";
> +				linux,pci-domain = <1>;
>  				#address-cells = <3>;
>  				#size-cells = <2>;
>  				ranges = <0x01000000 0x0 0x00000000 0x0 0x9f002000 0x0 0x00100000>,
> @@ -1130,6 +1133,7 @@ pcie2: pcie@ca800000 {
>  					    "atu",
>  					    "config",
>  					    "link";
> +				linux,pci-domain = <2>;
>  				#address-cells = <3>;
>  				#size-cells = <2>;
>  				ranges = <0x01000000 0x0 0x00000000 0x0 0xb7002000 0x0 0x00100000>,
> -- 
> 2.25.1
> 

-- 
Yixun Lan (dlan)
