Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657E02C1595;
	Fri,  5 Jun 2026 08:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780649888; cv=none; b=gfrJu8Qn3r2mklesUw3iOQaPBXxPTnjg8qfRFAEZ6iDeEDgcdpJ/p1nZBXQ3Qx/MeeEqKk39ZdzNq4lI0MX2Fgqco3OgyMfyzEaGL4MHkmoBNXtUFma6Uym+nfAQ5PrhGSXaXWLwHh6esoxaVcp8X0MrfXaopiYBki1XNiJu/H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780649888; c=relaxed/simple;
	bh=C3/r97cvGGhLJX1Xn8jXPRnoiEseV6sdbd3P2WAeicE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jtCJypdd91Azhz7AM66H9chaFt9d5bplR8tz7zc2cg+P1xwdSC9BiasTQ3Vv1lN+gf7Stcidvw/QiZfSFLW2+N+WfJKYqrZpVTz8H1Vzhs7WkDd3kwfJuz3GUPiziIaJHon+R/GSdiGlXgyVRK9MUYdtPWnMuu9TVkV/5Vvr03Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eZooJwy7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eZooJwy7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 763EC1F00893;
	Fri,  5 Jun 2026 08:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780649887;
	bh=vrTp+Zp3JQ83tPZI8WFTcJrcku+BrM25I8gPXoRu00s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eZooJwy7No+NiA5mGCXKPhhxRgkfbPnq1r1z/VZHxsSyt3aAFEyzw7+/EyQvPjA+/
	 e9lBR4zEV2LfDztZB+44URcKzJnHDE+LKQ6E43HN8zqzLnURRwxrpq86XBZoPxKWih
	 coCzmeGl+gyY6LvwdgKuaizZqeNpLDS7lYLjw7YluJPl4TcdNljJBb0KL8moPk2FJI
	 RA7x6DKl6v4ZglbX8s3hAqTPg8xDPVsTP6W3diVP78F9GXTTVXKg/E92vKo/OMXhc+
	 QK2w3FHqncGdfgaiw9D3TSzmDQaXg5/gsPFbpEZdVk4WEBOBtGau1NXmo84qpYNUPd
	 gZEBgLjBsrwMg==
Date: Fri, 5 Jun 2026 08:58:02 +0000
From: Yixun Lan <dlan@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>, Han Gao <gaohan@iscas.ac.cn>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dts: riscv: spacemit: k3: Fix I/O power settings
Message-ID: <20260605085802-GKD3727415@kernel.org>
References: <20260518-07-dts-pinctrl-io-power-v1-1-abe19c14a726@kernel.org>
 <9585b7c7-100c-4d77-bed1-d2b6b25b3940@freeshell.de>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9585b7c7-100c-4d77-bed1-d2b6b25b3940@freeshell.de>

Hi E Shattow,

On 13:17 Wed 03 Jun     , E Shattow wrote:
> 
> Hi Yixun,
> 
> This property on its own does not seem to be enough to get the ethernet
> network port functional on Sipeed K3 Pico-ITX 32GB model that I have,
> when it is loading Debian 13 Trixie debian-installer netinst initramfs
> (with cross-compiled Linux kernel and modules from -next 20260602).
> 
I don't think your problem directly connect to this pacth..

> Reproducer instructions for cross-compiling and debian-installer netinst
> initramfs modification at:
> https://wiki.debian.org/InstallingDebianOn/SpacemiT/K3PicoITX?action=recall&rev=2
> 
> In addition to those instructions above I am using within the factory
> pre-installed vendor U-Boot the following commands to try what your
> patch does:
> 
> fdt addr $fdt_addr_r
> fdt resize
> fdt header get filesize totalsize
> fdt rm /soc/pinctrl@d401e000 spacemit,apbc
> fdt get value spacemit_apbc_phandle /soc/system-controller@d4015000 phandle
> fdt set /soc/pinctrl@d401e000 spacemit,apbc <$spacemit_apbc_phandle>
> 
> I then verify within Linux environment the presence of
> /sys/firmware/devicetree/base/soc/pinctrl@d401e000/spacemit,apbc
> 
> The same Linux kernel and modules as modified into the installer then do
> have functional ethernet networking on that board if running from the
> installed system and with the spacemit,apbc devicetree property. Is this
> a dependency or ordering issue of the modules, or the Kconfig options?
> 
I've checked with the failure kernel dmesg log (you provided offline),
the dwmac driver has been probed twice, with first time failed, it
might be the PHY driver not been initialized, adjust following 
configuration works for me..

CONFIG_STMMAC_ETH=y
CONFIG_REALTEK_PHY=y
CONFIG_I2C_K1=y

the PMIC/Power Regulator rely on I2C driver..

> Also, the more general problem is that cycling rmmod and modprobe on the
> ethernet networking related modules fails:
> 
> rmmod dwmac_spacemit
> rmmod stmmac_platform
> rmmod stmmac
> rmmod mdio
> modprobe dwmac_spacemit
> 
> [ 1487.618517] mdio_bus stmmac-0: MDIO device at address 1 is missing.
> 
> [ 1487.623815] spacemit-dwmac cac80000.ethernet end0: renamed from eth0
> 
> rmmod dwmac_spacemit
> rmmod stmmac_platform
> rmmod stmmac
> rmmod mdio
> modprobe dwmac_spacemit
> 
Need to investigate, could be problem of resource deinitialization issue..

> [ 1539.374486] spacemit-dwmac cac80000.ethernet end0: cannot attach to
> PHY (erro
> r: -ENODEV)
> [ 1615.299451] spacemit-dwmac cac80000.ethernet end0: stmmac_dvr_remove:
> removin
> g driver
> 
> Please advise how to troubleshoot?  Thanks,
> 
> - E Shattow
> 

-- 
Yixun Lan (dlan)
