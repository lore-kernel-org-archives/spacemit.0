Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185E52749C8
	for <spacemit@lists.linux.dev>; Mon, 19 May 2025 11:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747654492; cv=none; b=TYNDCrWQY22i/XeiXTQ24SCaTlRoM9lC8vI2xpmp1Xg3fqzSGbPvZ9NHGxSpp5Ae3q1/u9npk4QQJ/vZ/+Oy5ioNHm1+tsRpENllzz5iLNC0WLgNsfONvNzNva0k42BzyhZ3KlUPSXW16K5qFgCV4X39sFUeFjHnR52u22sPTgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747654492; c=relaxed/simple;
	bh=udfUTmlF3isj8UVHWPBs361Rv5VOxzJppL60XaV+YLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I+doRGWPY4nXk80W3kDAF59wZwkZGUy9Mjj8z/ELYDKeqzQaXlX2MgB6WVoSpH0PQVyGSgG3vpy8SNE/B/MzJOYG1CSafMhEFqGBnhXRSAnfCW1e8+mPxxp+gfn8X968TysLk/1ejAm7Zdfj05gK7pdvz7BhIYgrHX4DNs5YN14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CWNvIStO; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CWNvIStO"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e740a09eb00so3625252276.0
        for <spacemit@lists.linux.dev>; Mon, 19 May 2025 04:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747654490; x=1748259290; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T9ifYnJEHZkjugzgP1AAhyx3RM0Rc1N5KhZmwX4DzcA=;
        b=CWNvIStOkX36Ueq9VVYL5RgETEB01h27p73v4Kfdkviw4WUgwpezn1TKtxIHPhihHX
         uR0XmRrme5Zu+Uqi4qO61O6xtDow/6NBWqCuK5I5YZORAjojyKT1g9WI5uDZTh19NE/W
         ss//Rap+SMi8UslwMjsJA186QnG1b/sh6nZAdfqPJijMjTvAh9ByR2E40wf7o+WF0JTg
         zPdkudYEM/6UuB6Ja90hzY7NRF9JlebkxXEAg+M2lj16vqttazZhuoi5qgpgvqdcxeGB
         tDV4cqRbq0NmwCDLGEkjoOLPQZWNsNYa5kALQ1JxvXqbhTQt4UuW8TZk0zoOp/TbE+vr
         22sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747654490; x=1748259290;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9ifYnJEHZkjugzgP1AAhyx3RM0Rc1N5KhZmwX4DzcA=;
        b=wdvgfPU66Z/DvIeF3juc8dUwyVPFo0kkAUAsBe/Vxoa8Cjq2R8hng1D4MfOjU4PnTn
         5Wx9055sB8ADqBtqPaQ5E7zPg0QJMtI3HnXrVcQbCiiSBIaOQXue51ZtJ1atwu+3yf0k
         aL1n2o1gVy0wFllxDD+J6+hHZeSZzOqV1WOWaBhHHRAUSa9JgQNxInJwBAfWTeEgL3oK
         CaVKpVubvkZ00RoYDWRX038HxfRu2fPZqYMEFoZm7ztzD6mhxfxdPJH818ASqkEuteRR
         8RbhWE00K8y+Tz9f979Kx+6JZr5j7xIcViy+h9BhLpbenKSng4t66XCoHeOiQgBd1oq1
         arAA==
X-Forwarded-Encrypted: i=1; AJvYcCUagCK26++Qcc/40rmXSpS9pygzRH5nHJwdwi3JutjFJaWK7udgyew0Q6XsT2VgC/8Dh+UyBpi9Vw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzn8LT8m1EeyJH2o0baU5UkgFlP5qffkS2DYpl4PnS2PIJ5nu0z
	RDNsLoVb74pSobzsff+NGRGft0XVQp+KqLpKsQJ4my9p/KjF7l3kBPxUC2PDvF7reKN0HmyrUJr
	Nm56wgTpewprI268rnAc0FqZiQCEZjMZTH2NE75e6KA==
X-Gm-Gg: ASbGncuIFd6kwrZAekXkl2atcwDP4OKkmOc4EmEBzmreksTYiggkXUELqIwYg25If7l
	5+wl7a7enDb3gEHA6g2BxcS89ymRG6ACYvIMOWCsJtVSeyGrHeNCCCtn2zgqq+E0RrVpOdC0kzH
	B3/tZqUiOZ8Wh4l3aQtUuzRwijSvxpzYlvKQ==
X-Google-Smtp-Source: AGHT+IEzdVLtO9YBa5+IVyduAY6NRSx7ulnCzcRUIF50EVMFrKD1g2sNV/MU3FaCc/lVmOV0bCCHQy4wQPIgDk2szp8=
X-Received: by 2002:a05:6902:2181:b0:e75:c2d7:53d6 with SMTP id
 3f1490d57ef6-e7b6a0821b5mr17229222276.13.1747654490027; Mon, 19 May 2025
 04:34:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250501-20-k1-sdhci-v2-0-3e7005fae29b@gentoo.org> <20250501-20-k1-sdhci-v2-2-3e7005fae29b@gentoo.org>
In-Reply-To: <20250501-20-k1-sdhci-v2-2-3e7005fae29b@gentoo.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 19 May 2025 13:34:14 +0200
X-Gm-Features: AX0GCFsNpQorB3Le9i73KErfl_8y60Wp1PR0WslTHu1cwMkDy6FRe6Gb1knvm-o
Message-ID: <CAPDyKFoDWS6DWdKOaxTDEYeKv3hjVDoR7XGi19nESVssc-RG8g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mmc: sdhci-of-k1: add support for SpacemiT K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Alex Elder <elder@riscstar.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 May 2025 at 10:51, Yixun Lan <dlan@gentoo.org> wrote:
>
> The SDHCI controller found in SpacemiT K1 SoC features SD,
> SDIO, eMMC support, such as:
>
> - Compatible for 4-bit SDIO 3.0 UHS-I protocol, up to SDR104
> - Compatible for 4-bit SD 3.0 UHS-I protocol, up to SDR104
> - Compatible for 8bit eMMC5.1, up to HS400
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/mmc/host/Kconfig       |  14 ++
>  drivers/mmc/host/Makefile      |   1 +
>  drivers/mmc/host/sdhci-of-k1.c | 306 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 321 insertions(+)
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 6824131b69b188cae58c8f48076715ca647ca28c..0ce78f22c33cfff916a2d4d680c79e9d19637e0e 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -250,6 +250,20 @@ config MMC_SDHCI_OF_DWCMSHC
>           If you have a controller with this interface, say Y or M here.
>           If unsure, say N.
>
> +config MMC_SDHCI_OF_K1
> +       tristate "SDHCI OF support for the SpacemiT K1 SoC"
> +       depends on ARCH_SPACEMIT || COMPILE_TEST
> +       depends on MMC_SDHCI_PLTFM
> +       depends on OF
> +       depends on COMMON_CLK
> +       help
> +         This selects the Secure Digital Host Controller Interface (SDHCI)
> +         found in the SpacemiT K1 SoC.
> +
> +         If you have a controller with this interface, say Y or M here.
> +
> +         If unsure, say N.
> +
>  config MMC_SDHCI_OF_SPARX5
>         tristate "SDHCI OF support for the MCHP Sparx5 SoC"
>         depends on MMC_SDHCI_PLTFM
> diff --git a/drivers/mmc/host/Makefile b/drivers/mmc/host/Makefile
> index 5147467ec825ffaef3a7bd812fad80545e52b180..75bafc7b162b9e1d4c6c050f5d28b9d7cb582447 100644
> --- a/drivers/mmc/host/Makefile
> +++ b/drivers/mmc/host/Makefile
> @@ -88,6 +88,7 @@ obj-$(CONFIG_MMC_SDHCI_OF_AT91)               += sdhci-of-at91.o
>  obj-$(CONFIG_MMC_SDHCI_OF_ESDHC)       += sdhci-of-esdhc.o
>  obj-$(CONFIG_MMC_SDHCI_OF_HLWD)                += sdhci-of-hlwd.o
>  obj-$(CONFIG_MMC_SDHCI_OF_DWCMSHC)     += sdhci-of-dwcmshc.o
> +obj-$(CONFIG_MMC_SDHCI_OF_K1)          += sdhci-of-k1.o
>  obj-$(CONFIG_MMC_SDHCI_OF_SPARX5)      += sdhci-of-sparx5.o
>  obj-$(CONFIG_MMC_SDHCI_OF_MA35D1)      += sdhci-of-ma35d1.o
>  obj-$(CONFIG_MMC_SDHCI_BCM_KONA)       += sdhci-bcm-kona.o
> diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..8988053eeb33a476fa484d145579db6214b2d0b7
> --- /dev/null
> +++ b/drivers/mmc/host/sdhci-of-k1.c
> @@ -0,0 +1,306 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023-2025 SpacemiT (Hangzhou) Technology Co. Ltd
> + * Copyright (c) 2025 Yixun Lan <dlan@gentoo.org>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/iopoll.h>
> +#include <linux/init.h>
> +#include <linux/mmc/card.h>
> +#include <linux/mmc/host.h>
> +#include <linux/mmc/mmc.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +
> +#include "sdhci.h"
> +#include "sdhci-pltfm.h"
> +
> +#define SDHC_MMC_CTRL_REG              0x114
> +#define  MISC_INT_EN                   BIT(1)
> +#define  MISC_INT                      BIT(2)

These define-names look a bit too generic to me. Please add some
additional prefixes so it becomes more clear what they are.

This applies to all the others below too.

> +#define  ENHANCE_STROBE_EN             BIT(8)
> +#define  MMC_HS400                     BIT(9)
> +#define  MMC_HS200                     BIT(10)
> +#define  MMC_CARD_MODE                 BIT(12)
> +
> +#define SDHC_TX_CFG_REG                        0x11C
> +#define  TX_INT_CLK_SEL                        BIT(30)
> +#define  TX_MUX_SEL                    BIT(31)
> +
> +#define SDHC_PHY_CTRL_REG              0x160
> +#define  PHY_FUNC_EN                   BIT(0)
> +#define  PHY_PLL_LOCK                  BIT(1)
> +#define  HOST_LEGACY_MODE              BIT(31)
> +
> +#define SDHC_PHY_FUNC_REG              0x164
> +#define  PHY_TEST_EN                   BIT(7)
> +#define  HS200_USE_RFIFO               BIT(15)
> +
> +#define SDHC_PHY_DLLCFG                        0x168
> +#define  DLL_PREDLY_NUM                        GENMASK(3, 2)
> +#define  DLL_FULLDLY_RANGE             GENMASK(5, 4)
> +#define  DLL_VREG_CTRL                 GENMASK(7, 6)
> +#define  DLL_ENABLE                    BIT(31)
> +
> +#define SDHC_PHY_DLLCFG1               0x16C
> +#define  DLL_REG1_CTRL                 GENMASK(7, 0)
> +#define  DLL_REG2_CTRL                 GENMASK(15, 8)
> +#define  DLL_REG3_CTRL                 GENMASK(23, 16)
> +#define  DLL_REG4_CTRL                 GENMASK(31, 24)
> +
> +#define SDHC_PHY_DLLSTS                        0x170
> +#define  DLL_LOCK_STATE                        BIT(0)
> +
> +#define SDHC_PHY_PADCFG_REG            0x178
> +#define  PHY_DRIVE_SEL                 GENMASK(2, 0)
> +#define  RX_BIAS_CTRL                  BIT(5)

[...]

> +
> +static int spacemit_sdhci_pre_select_hs400(struct mmc_host *mmc)
> +{
> +       struct sdhci_host *host = mmc_priv(mmc);
> +
> +       spacemit_sdhci_setbits(host, MMC_HS400, SDHC_MMC_CTRL_REG);
> +       host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY;

At least this deserves a comment. Isn't MMC_CAP_WAIT_WHILE_BUSY
working for all cases?

> +
> +       return 0;
> +}
> +
> +static void spacemit_sdhci_post_select_hs400(struct mmc_host *mmc)
> +{
> +       struct sdhci_host *host = mmc_priv(mmc);
> +
> +       spacemit_sdhci_phy_dll_init(host);
> +       host->mmc->caps &= ~MMC_CAP_WAIT_WHILE_BUSY;

Dito.

[...]

Kind regards
Uffe
