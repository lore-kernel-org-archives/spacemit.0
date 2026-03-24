Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBAD25F984;
	Tue, 24 Mar 2026 06:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774332327; cv=none; b=OeQ5l0C+RMKv9QTyWxoQocQYc7xog9LXHiDk9KG5Xmd0MnOelthOXV+iyCGGn9CovQ7fOePu5WkYBOidCTzrfkSBmQOd5M8aqudGSR/puQ+jVsa1PuGMa0vVtU+z3cluxHveAqrFV9cdWYKgDmyy03GAfmZlA0k10EF0ySbbuTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774332327; c=relaxed/simple;
	bh=GHYCd8DhKH7FMGi+EYhx3JiIcXCyUlisc6Q9Y86WCgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PTEr/Qfir4QPRGVV1hdgwA9XO0fP+Rsq5/rfUfOMeKb21rfwXFzC+2u9Hy9vThU/U+ozP0zrJWq0sse0zS11FL2JApS4RtfQxTniq2qCR7iOq9DvYO1G7F04nB0BtnsJSN6FtKbjI86kmdaRUlRveIEYvPmq0KeYNaXotLQAS+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sBw2sgMV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sBw2sgMV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01700C19424;
	Tue, 24 Mar 2026 06:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774332326;
	bh=GHYCd8DhKH7FMGi+EYhx3JiIcXCyUlisc6Q9Y86WCgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sBw2sgMVR/zTQXLmw8RXpRwD3hZ4sZkbB96sxnm/HdZ90prALXYyih5rs7DyMTKUF
	 hbIUfMQhWp5u728xz98K9Z1PkSEAme4OlrstzTfzpimtjXfebO59Znt3WAcfRTz3YU
	 Q+cTL4XWCQx+ATM5Os7TU97uLORQ/PMjITxv+8oYxm4U5QiV4cYsyiC+Lm/ZqU2dDl
	 /TLyhkE/ivmR5DpltBnTZy6EjxAjUVMtuaAfAr773sqeo/9IILSoE35FOKATX+I4YA
	 GPi+eZlbzYSEubo5guEZRjkBlAozyPBrMNeovq2crIjV+9yc/xPWAJEShoOpvo8tfP
	 HsXMUXpDnriuQ==
Date: Tue, 24 Mar 2026 14:05:24 +0800
From: Yixun Lan <dlan@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alex Elder <elder@riscstar.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH] riscv: dts: spacemit: drop incorrect pinctrl for combo
 PHY
Message-ID: <20260324060524-GKA533070@kernel.org>
References: <20260322202502.2205755-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322202502.2205755-1-aurelien@aurel32.net>

Hi Aurelien, 

On 21:25 Sun 22 Mar     , Aurelien Jarno wrote:
> The combo PHY on the Banana Pi F3 is used for the USB 3.0 port. The high
> speed differential lanes are always configured as such, and do not
> require a pinctrl entry.
> 
> The existing pinctrl entry only configures PCIe secondary pins, which
> are unused for USB and instead routed to the MIPI CSI1 connector.
> 
> Remove this incorrect pinctrl entry.
> 
> Fixes: 0be016a4b5d1b9 ("riscv: dts: spacemit: PCIe and PHY-related updates")
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>

Thanks for doing this, I thought Chukun was planing to submit a fix, CC him

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 404b69c47b91f..5790d927b93db 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -81,8 +81,6 @@ usb3_hub_5v: regulator-usb3-hub-5v {
>  };
>  
>  &combo_phy {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pcie0_3_cfg>;
>  	status = "okay";
>  };
>  
> -- 
> 2.51.0
> 

-- 
Yixun Lan (dlan)
