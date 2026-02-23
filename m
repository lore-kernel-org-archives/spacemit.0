Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414DE280317
	for <spacemit@lists.linux.dev>; Mon, 23 Feb 2026 14:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857521; cv=none; b=AC2fsIyN2p2C/gesiW+xibe60sYjyUaEUT7AH9doiY+E0oxSygqVQZSq6UBJNwJywFOPbZkmiwp0llzui6v8wsASO+0DzAkHvUnZvtdXKG6DzBFfmuYvBYw/lOsLD8WIFMKwqSj3Ufe9bfWXhO+UOuNeYEq8cOeKwXE8Pj2acpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857521; c=relaxed/simple;
	bh=kdP5EttDcynG8swMrF1Ca5QeEDVK8y3yg/juEgym6hc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NXx8xivkCQWwH2C/dshDF35aO0ZgQshcX2lRODBNBgnCzzEZZVtnHv13M7KPipTVGTxSEsc88g8l0dGtqtkwxv1gOudHdmxJ8MuZ/Htro4OknBv/TDarvubsIbirDxx3/ZzpFVCXT2BdWZPo2G2x+twA0SEdwGiJv24+XRSYiQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UbFxIzkF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UbFxIzkF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE43EC116C6;
	Mon, 23 Feb 2026 14:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771857521;
	bh=kdP5EttDcynG8swMrF1Ca5QeEDVK8y3yg/juEgym6hc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UbFxIzkFzN9D02sfhiEIunEhNGdXiavpqUHuKBIlZ+vNrLxE8yqI386DKuaMAvHjS
	 r8A3efG+gXeysmaOZM3aVOJ/I96kgNYt200QKfrWFpk/mpCj2jSEtYw77lNzsTCaiU
	 lijVgwJfZ1LkVkyHJ/afdumn4IARYNL7dlKaLABG3UICbLEsvtC4jj4/NTpiXTU2XN
	 2XMyxVxFZEQL4NRXdtg/pRrSxKGUUZip0KBwWmFpQmuJxC+etA364ntlD07lQosraO
	 AejuVn+3kmAYy12+wzAhJHkLkFVJHFaMoqj9t8elzcgStZL76iYYL1llTgOVgBVeWW
	 I3kusZ/wicdeQ==
Date: Mon, 23 Feb 2026 22:38:38 +0800
From: Yixun Lan <dlan@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-phy@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Alex Elder <elder@riscstar.com>, Ze Huang <huang.ze@linux.dev>,
	spacemit@lists.linux.dev
Subject: Re: [PATCH] phy: move spacemit pcie driver to its subfolder
Message-ID: <20260223143838-GKA220920@kernel.org>
References: <20260223064240.386617-1-vkoul@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223064240.386617-1-vkoul@kernel.org>

Hi Vinod,

On 12:12 Mon 23 Feb     , Vinod Koul wrote:
> Commit fe4bc1a08638 ("phy: spacemit: support K1 USB2.0 PHY controller")
> created spacemit subfolder with usb driver while commit 57e920b92724
> ("phy: spacemit: Introduce PCIe/combo PHY") added pcie driver in phy
> folder. Move latter into spacemit subfolder and rename file to
> phy-k1-pcie.c
> 
Make sense, this looks better, thanks

Reviewed-by: Yixun Lan <dlan@kernel.org>

> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/phy/Kconfig                                  | 12 ------------
>  drivers/phy/Makefile                                 |  1 -
>  drivers/phy/spacemit/Kconfig                         | 12 ++++++++++++
>  drivers/phy/spacemit/Makefile                        |  1 +
>  .../phy-k1-pcie.c}                                   |  0
>  5 files changed, 13 insertions(+), 13 deletions(-)
>  rename drivers/phy/{phy-spacemit-k1-pcie.c => spacemit/phy-k1-pcie.c} (100%)
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 02467dfd4fb0..c0574e44f0a3 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -134,18 +134,6 @@ config PHY_NXP_PTN3222
>  	  schemes. It supports all three USB 2.0 data rates: Low Speed, Full
>  	  Speed and High Speed.
>  
> -config PHY_SPACEMIT_K1_PCIE
> -	tristate "PCIe and combo PHY driver for the SpacemiT K1 SoC"
> -	depends on ARCH_SPACEMIT || COMPILE_TEST
> -	depends on COMMON_CLK
> -	depends on HAS_IOMEM
> -	depends on OF
> -	select GENERIC_PHY
> -	default ARCH_SPACEMIT
> -	help
> -	  Enable support for the PCIe and USB 3 combo PHY and two
> -	  PCIe-only PHYs used in the SpacemiT K1 SoC.
> -
>  source "drivers/phy/allwinner/Kconfig"
>  source "drivers/phy/amlogic/Kconfig"
>  source "drivers/phy/apple/Kconfig"
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index a648c2e02a83..2773d596e543 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -16,7 +16,6 @@ obj-$(CONFIG_PHY_SNPS_EUSB2)		+= phy-snps-eusb2.o
>  obj-$(CONFIG_USB_LGM_PHY)		+= phy-lgm-usb.o
>  obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
>  obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
> -obj-$(CONFIG_PHY_SPACEMIT_K1_PCIE)	+= phy-spacemit-k1-pcie.o
>  obj-$(CONFIG_GENERIC_PHY)		+= allwinner/	\
>  					   amlogic/	\
>  					   apple/	\
> diff --git a/drivers/phy/spacemit/Kconfig b/drivers/phy/spacemit/Kconfig
> index 0136aee2e8a2..50b0005acf66 100644
> --- a/drivers/phy/spacemit/Kconfig
> +++ b/drivers/phy/spacemit/Kconfig
> @@ -2,6 +2,18 @@
>  #
>  # Phy drivers for SpacemiT platforms
>  #
> +config PHY_SPACEMIT_K1_PCIE
> +	tristate "PCIe and combo PHY driver for the SpacemiT K1 SoC"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	depends on COMMON_CLK
> +	depends on HAS_IOMEM
> +	depends on OF
> +	select GENERIC_PHY
> +	default ARCH_SPACEMIT
> +	help
> +	  Enable support for the PCIe and USB 3 combo PHY and two
> +	  PCIe-only PHYs used in the SpacemiT K1 SoC.
> +
>  config PHY_SPACEMIT_K1_USB2
>  	tristate "SpacemiT K1 USB 2.0 PHY support"
>  	depends on (ARCH_SPACEMIT || COMPILE_TEST) && OF
> diff --git a/drivers/phy/spacemit/Makefile b/drivers/phy/spacemit/Makefile
> index fec0b425a948..a821a21d6142 100644
> --- a/drivers/phy/spacemit/Makefile
> +++ b/drivers/phy/spacemit/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_PHY_SPACEMIT_K1_PCIE)		+= phy-k1-pcie.o
>  obj-$(CONFIG_PHY_SPACEMIT_K1_USB2)		+= phy-k1-usb2.o
> diff --git a/drivers/phy/phy-spacemit-k1-pcie.c b/drivers/phy/spacemit/phy-k1-pcie.c
> similarity index 100%
> rename from drivers/phy/phy-spacemit-k1-pcie.c
> rename to drivers/phy/spacemit/phy-k1-pcie.c
> -- 
> 2.43.0
> 
> 

-- 
Yixun Lan (dlan)
