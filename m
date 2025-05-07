Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B1125D523
	for <spacemit@lists.linux.dev>; Wed,  7 May 2025 12:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746619794; cv=none; b=kHt2Xw1k7O8gYsr2SrMabMiYuiu48mnOBmIoh/U0bXDyVCHa2iSHcXJoLwdaSG2s0PP2CCSC16Th89Sr9vmBCkznaXD5xD87KqGz0TzhJTZD+hgUOXHiR82gZMIc6ISmRWG8gFPEgXp1sEwiRuQ0t5iHRYXyPXToDdPSSa9C1MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746619794; c=relaxed/simple;
	bh=soIZGu6TRK2l02DX9aX6wOFip886FCWVOON52muT2Ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G1k+qOk3JHi4ad6qswhRcgxm68N6kb4IB2LRqTEPboHpPI/lTIHb0SFrnmwPRO9yhZzdBgUc4s9WWt/NhC2kI/BOQ0lAbInT61IbNPlrERIEMnXf17auFqoz1CN5D4g1bkTh6uWzJf3XzSk6/Ve4EsbkXxQ3IIcVc/+GlcSGxMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mpF3L1VP; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mpF3L1VP"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-477282401b3so75238551cf.1
        for <spacemit@lists.linux.dev>; Wed, 07 May 2025 05:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746619791; x=1747224591; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wzvCqlM6V4NoRraLw8v4M7ajYBzOkSRv0bJeZomdZWU=;
        b=mpF3L1VPO2JRQYc91dHOcr/9kwNpgwcFabTUAZ+rcfQ305FLT/0iUpihl3GI5D1iui
         tQM3ualwqIRirhnRl2Nt37bnxsGa8rrWrA9T0CLodnjkNzSVwD6X/d4YPRe8ftgyaky6
         wqDvoMWKZtX6gfaXPMkocJ3RXd53cVvpBnW/H/CqaRQbJshhv4OCLCJTMJad7IDf+A+7
         M5ViA8NfTB3V6QcBGeNwSoBOJv2NjushdKe6AGH7u/olFvHKynVozyTVrx7UZoEN52BY
         BPFFQWDxjmK+XEgdmOcCaUcebkmy0WyitKpJfAFpYrB+tr+UUfnDXkjul4wYutlCpxKB
         FkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746619791; x=1747224591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzvCqlM6V4NoRraLw8v4M7ajYBzOkSRv0bJeZomdZWU=;
        b=Nddb2QeRPc32GS+MTnHTCYkEcjB9yGUh/uZVmHkZB1LgdzWFURl5tQTPZ5nXXB+yyk
         MPnNRknuWvNdcV83GLXBHE3nTXa0K+yemwpuTMN6tSV2YeC6hqueMU13yiNg44PNIFnn
         DeFKTJjrYgDMNik/BrENuJlNVchGCTyGLa1PNMY00n0qkg10Yqf7K2ptbXNfrnPPqHPh
         bNmytFGJTAMaSFXzDwQM3fZHWdEQeRaZp5zdWsmo1IjPixGzOICm/Pi27aIRAhchddkW
         cqBksoMoLVfCKtMMZ7gfJ8gd1pi1YO0pdwhlxR3eZNgMGK3WO7ni9uklxi1qVDcUyKa/
         neeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEKWs90ILNoV4JVYlI7OVbS0PmZorNXgiNOSH7EXDzG95k/wQ5iFZb36/AeVfcbCPxhHuxpBNMKQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzz8e4OnQ8SkcEN3z9PW1CgpfIuUH1trlztJcB+0WBIOwi/EQmb
	0iXoKjdIItFVOis7/tYEvLNtgBMmwbk+I7jUv5e/XzJuBT95b4Yq
X-Gm-Gg: ASbGncu5MPDTKI+82iZHncY75WIq8qa+RSBwHiiIl3iMAYGpOZwxm1MNTkBhjDkl3IK
	NxO4fe+cC7M2dpnGzWTg0P2JmAs5quDy7CtjGBsMFGtt/FJzGfA7zO7nz9xf34uB4/isVBxQ/QC
	GyfmZUTA4I8EYegHw7qrXZbPgQ8dWisjGAeTAm/ikpLP7ws3WQomL+pqmlkyW0jmG0uFfqh/C3A
	Xg8RFnxKt9l3e+A1DbhhzhRMt4zccqjwmJRbvwf1dVZxeBA/ylNEDrzpok7X2mLwwnZdvYsHlfp
	oFoa7uZcH2n3wZZ9
X-Google-Smtp-Source: AGHT+IH7wKlghg8C9MW5UbE15J0DCcdrY3Ipd1gx5YTdMrj+JDWaSANUBcKoxE/1t95TYjo8l1Xxyw==
X-Received: by 2002:a05:622a:cd:b0:476:9847:7c73 with SMTP id d75a77b69052e-492265e977fmr37240231cf.26.1746619790754;
        Wed, 07 May 2025 05:09:50 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-49222da009dsm13199261cf.58.2025.05.07.05.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:09:50 -0700 (PDT)
Date: Wed, 7 May 2025 20:09:25 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Alex Elder <elder@riscstar.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mmc: sdhci-of-k1: add support for SpacemiT K1 SoC
Message-ID: <acvqiaaptw4s54zekvbkdpfzam4x7juiajcxyohzpfcuf5xpxs@addpa5x73efo>
References: <20250501-20-k1-sdhci-v2-0-3e7005fae29b@gentoo.org>
 <20250501-20-k1-sdhci-v2-2-3e7005fae29b@gentoo.org>
 <gfrdvfencetztdmkxmeo5q5vdnp3yxmggnuewfprjyxsldzhv2@eur5wtlltqtm>
 <20250506225720-GYA499202@gentoo>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506225720-GYA499202@gentoo>

On Tue, May 06, 2025 at 10:57:20PM +0000, Yixun Lan wrote:
> Hi Inochi,
> 
> On 06:37 Wed 07 May     , Inochi Amaoto wrote:
> > On Thu, May 01, 2025 at 04:50:22PM +0800, Yixun Lan wrote:
> > > The SDHCI controller found in SpacemiT K1 SoC features SD,
> > > SDIO, eMMC support, such as:
> > > 
> > > - Compatible for 4-bit SDIO 3.0 UHS-I protocol, up to SDR104
> > > - Compatible for 4-bit SD 3.0 UHS-I protocol, up to SDR104
> > > - Compatible for 8bit eMMC5.1, up to HS400
> > > 
> > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > > ---
> > >  drivers/mmc/host/Kconfig       |  14 ++
> > >  drivers/mmc/host/Makefile      |   1 +
> > >  drivers/mmc/host/sdhci-of-k1.c | 306 +++++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 321 insertions(+)
> > > 
> > > diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> > > index 6824131b69b188cae58c8f48076715ca647ca28c..0ce78f22c33cfff916a2d4d680c79e9d19637e0e 100644
> > > --- a/drivers/mmc/host/Kconfig
> > > +++ b/drivers/mmc/host/Kconfig
> > > @@ -250,6 +250,20 @@ config MMC_SDHCI_OF_DWCMSHC
> > >  	  If you have a controller with this interface, say Y or M here.
> > >  	  If unsure, say N.
> > >  
> > > +config MMC_SDHCI_OF_K1
> > > +	tristate "SDHCI OF support for the SpacemiT K1 SoC"
> > > +	depends on ARCH_SPACEMIT || COMPILE_TEST
> > > +	depends on MMC_SDHCI_PLTFM
> > > +	depends on OF
> > > +	depends on COMMON_CLK
> > > +	help
> > > +	  This selects the Secure Digital Host Controller Interface (SDHCI)
> > > +	  found in the SpacemiT K1 SoC.
> > > +
> > > +	  If you have a controller with this interface, say Y or M here.
> > > +
> > > +	  If unsure, say N.
> > > +
> > >  config MMC_SDHCI_OF_SPARX5
> > >  	tristate "SDHCI OF support for the MCHP Sparx5 SoC"
> > >  	depends on MMC_SDHCI_PLTFM
> > > diff --git a/drivers/mmc/host/Makefile b/drivers/mmc/host/Makefile
> > > index 5147467ec825ffaef3a7bd812fad80545e52b180..75bafc7b162b9e1d4c6c050f5d28b9d7cb582447 100644
> > > --- a/drivers/mmc/host/Makefile
> > > +++ b/drivers/mmc/host/Makefile
> > > @@ -88,6 +88,7 @@ obj-$(CONFIG_MMC_SDHCI_OF_AT91)		+= sdhci-of-at91.o
> > >  obj-$(CONFIG_MMC_SDHCI_OF_ESDHC)	+= sdhci-of-esdhc.o
> > >  obj-$(CONFIG_MMC_SDHCI_OF_HLWD)		+= sdhci-of-hlwd.o
> > >  obj-$(CONFIG_MMC_SDHCI_OF_DWCMSHC)	+= sdhci-of-dwcmshc.o
> > > +obj-$(CONFIG_MMC_SDHCI_OF_K1)		+= sdhci-of-k1.o
> > >  obj-$(CONFIG_MMC_SDHCI_OF_SPARX5)	+= sdhci-of-sparx5.o
> > >  obj-$(CONFIG_MMC_SDHCI_OF_MA35D1)	+= sdhci-of-ma35d1.o
> > >  obj-$(CONFIG_MMC_SDHCI_BCM_KONA)	+= sdhci-bcm-kona.o
> > > diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..8988053eeb33a476fa484d145579db6214b2d0b7
> > > --- /dev/null
> > > +++ b/drivers/mmc/host/sdhci-of-k1.c
> > > @@ -0,0 +1,306 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2023-2025 SpacemiT (Hangzhou) Technology Co. Ltd
> > > + * Copyright (c) 2025 Yixun Lan <dlan@gentoo.org>
> > > + */
> > > +
> > > +#include <linux/bitfield.h>
> > > +#include <linux/clk.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/iopoll.h>
> > > +#include <linux/init.h>
> > > +#include <linux/mmc/card.h>
> > > +#include <linux/mmc/host.h>
> > > +#include <linux/mmc/mmc.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/of_device.h>
> > > +#include <linux/platform_device.h>
> > > +
> > > +#include "sdhci.h"
> > > +#include "sdhci-pltfm.h"
> > > +
> > > +#define SDHC_MMC_CTRL_REG		0x114
> > > +#define  MISC_INT_EN			BIT(1)
> > > +#define  MISC_INT			BIT(2)
> > > +#define  ENHANCE_STROBE_EN		BIT(8)
> > > +#define  MMC_HS400			BIT(9)
> > > +#define  MMC_HS200			BIT(10)
> > > +#define  MMC_CARD_MODE			BIT(12)
> > > +
> > > +#define SDHC_TX_CFG_REG			0x11C
> > > +#define  TX_INT_CLK_SEL			BIT(30)
> > > +#define  TX_MUX_SEL			BIT(31)
> > > +
> > > +#define SDHC_PHY_CTRL_REG		0x160
> > > +#define  PHY_FUNC_EN			BIT(0)
> > > +#define  PHY_PLL_LOCK			BIT(1)
> > > +#define  HOST_LEGACY_MODE		BIT(31)
> > > +
> > > +#define SDHC_PHY_FUNC_REG		0x164
> > > +#define  PHY_TEST_EN			BIT(7)
> > > +#define  HS200_USE_RFIFO		BIT(15)
> > > +
> > > +#define SDHC_PHY_DLLCFG			0x168
> > > +#define  DLL_PREDLY_NUM			GENMASK(3, 2)
> > > +#define  DLL_FULLDLY_RANGE		GENMASK(5, 4)
> > > +#define  DLL_VREG_CTRL			GENMASK(7, 6)
> > > +#define  DLL_ENABLE			BIT(31)
> > > +
> > > +#define SDHC_PHY_DLLCFG1		0x16C
> > > +#define  DLL_REG1_CTRL			GENMASK(7, 0)
> > > +#define  DLL_REG2_CTRL			GENMASK(15, 8)
> > > +#define  DLL_REG3_CTRL			GENMASK(23, 16)
> > > +#define  DLL_REG4_CTRL			GENMASK(31, 24)
> > > +
> > > +#define SDHC_PHY_DLLSTS			0x170
> > > +#define  DLL_LOCK_STATE			BIT(0)
> > > +
> > > +#define SDHC_PHY_PADCFG_REG		0x178
> > > +#define  PHY_DRIVE_SEL			GENMASK(2, 0)
> > > +#define  RX_BIAS_CTRL			BIT(5)
> > > +
> > > +struct spacemit_sdhci_host {
> > > +	struct clk *clk_core;
> > > +	struct clk *clk_io;
> > > +};
> > > +
> > > +static inline void spacemit_sdhci_setbits(struct sdhci_host *host, u32 val, int reg)
> > > +{
> > > +	sdhci_writel(host, sdhci_readl(host, reg) | val, reg);
> > > +}
> > > +
> > > +static inline void spacemit_sdhci_clrbits(struct sdhci_host *host, u32 val, int reg)
> > > +{
> > > +	sdhci_writel(host, sdhci_readl(host, reg) & ~val, reg);
> > > +}
> > > +
> > 
> > > +static inline void spacemit_sdhci_clrsetbits(struct sdhci_host *host, u32 clr, u32 set, int reg)
> > 
> > updatebits?
> > 
> IMO, it's more ambiguous to use updatebits(), so I will just keep it
> 
> besides, these above helper functions should really be carefully used,
> setbits() only set bits of 'val' while preserve other bits,
> clrsetbits() will first clear bits, then set, while still preserve others
> 
> I will try to put a comment for them while updating next version

This is like something "regmap_update_bits". I think "update_bits" may
be better? I agree that it is good to put a comment here, whatever the
function name is. So this is fine for me, do it in the way you prefer.

Regards,
Inochi
