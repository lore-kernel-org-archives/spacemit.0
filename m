Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4043C1FDA
	for <spacemit@lists.linux.dev>; Thu, 15 Jan 2026 17:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768498049; cv=none; b=nJ28RYdvNezavmhVeljPTiRrVmiTh8es6ye9GnNNqOcKhuF+Of51rhB5TyVO5EjjP8YFOos+d9qBxx3GNC36hk8F4xlWcucp5X8vR4qLR0drSXSd6kuheJi3woDiNwVhyposrQXgl0WuM3uU4Bkf4DtS2saGlDI+nCGTtfuWu0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768498049; c=relaxed/simple;
	bh=eds14Z2/MZCL1+QgLM0PyXXkbXwDNewiolnCBTfarg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gwao0Zv5uD29ZNAvxK6fPTrSRZVTqR7WPVIItAipYvT446Aqz3XQd5PgO5GAqD/6ZcVEEJsSACoA9QggXj0y43VD2uFR4zOZzhjT6g1tbzG9P5pfup4vdv+K5VdhEsxRFez1y4ws1sTVWoVHv/9NsXBuG8OKhipnYc44FUqm7cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=tDIWMX/G; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="tDIWMX/G"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8c52c1d2a7bso239939385a.0
        for <spacemit@lists.linux.dev>; Thu, 15 Jan 2026 09:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768498046; x=1769102846; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=42fAL/1UEBk2EFpKCupqsTCz/+HBIO5aB7bXsjRGPhg=;
        b=tDIWMX/GEZGxmJ1pGvbp3bHtOxoaqVReov7ASBydVZL6KfSBw1P45rwnnQ26JuknhM
         sUCA3vaKOtq/ofvwFIZcvkcSMx/BU5/wvql3oCYDISP6AhcJMQ4cAKmyl57bJEiI4Vyb
         +4XnuB28JB/lHW90nKPoiSWjeN0jQaxrOXBN0vFPmIIMVKAJUBHpiIohMY/evZj8Mbmp
         jEvYd2OnHvlwX2dk7VR2cuwjJigGuv2GffZW1Ueexjjqemyb/q7u8QiBApBul6279Odv
         GUvER9ilTvUz+eIGbpIC5gwFLGG71le/XNwLNfaj7I41jVShzQYvZ4g+UNW7xQs+pOno
         YFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768498046; x=1769102846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42fAL/1UEBk2EFpKCupqsTCz/+HBIO5aB7bXsjRGPhg=;
        b=SGCYRRZacr8RgwOcnQzYI0y+lZx3b4gmp0jgoWXjY/iO6Ox59yKUBuSj5k5FbWzh9w
         JmYQbXmQVKTNRPK5gg4sVMFiPfbul2yPpFOD6poZxmGv/W2HYRNrXIOtjeZcE0UuwKC+
         et+ztJTa2AHS/6kdtzEHOFaKEvGuwNFfufnvg9HO4kG8JaIcXES6za0UCo8Ok2eaymBE
         I/JCPfgV2yx5TYAtisrsnqwZSzX+O2Cwk9UyZaOwrvhiFbKB7jTD920sPa8eL61F8UVP
         gG3b7XMaL2L4sdXU4WgJJz3QSOz/DFImk/WAsq6WMjX84NOMUg3DkdJiQG4u6BtnM+Oa
         vsdA==
X-Forwarded-Encrypted: i=1; AJvYcCXCTflHy+t/+lFKoVcHuIRPRyO3bGw7jkAMY/rpZGOZmnbMMVWB/VygqU2mk7tLf7Qtdt+kjXpkKQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxSSdRp+ppS9VDx6Zg5qVOTSuJ75PQeMLNrYXBRi97KiLosrx6u
	OrVZD0XyoE2zbf01SFvutGwq6XS9AoLvwpzcxM8qhPfDod1qn5f3BIEBQ5gy8GmJkJI=
X-Gm-Gg: AY/fxX71ozaPk8kAnf6rJhu6okd2xh9tsN6tHoU8F2ZHh0XEfXD0W2gYwaztYtfd7cc
	cNSTU9i15+SWkk5bnkoYKBdkEKh8zTV7UaFpin48df1djj1gf1KS4QXUUS7xD5xSAhcZIsn9p5J
	ld5s/JkQ7UXA64Dk4YnH3yTTsAdjGKATitlVmVCG6zgndD/xLzkpgjuXiagHPsSjE3/CVVqy8jm
	loAKAxMfOnNK0ZM7d4AtLqBBMBqdtuS2d6AT/cnvEYkLrmokLH/5mrYKtFEUBdFD9UYP0KI37nl
	hmXE7LAHLrAzxsiL/IYgcBkXrGWfVO76XVL441rBr6ZQ5X8THkU+m1exXNiydoQSp7z5F8jvSSr
	Hw4o34v/1VoxS7SO76CH5PqAlHK7oaRrH+ggSWPdbDo23cCo3lVTbS3wlv4stkwW5GUNnpiDttq
	zxhAtcz9Jn8Sp/JuUZ4ZORy8TwfqFPx4QFi66fZIf7P3bzIbjeHG1i
X-Received: by 2002:a05:620a:489a:b0:8c5:32a0:3421 with SMTP id af79cd13be357-8c589b97a57mr523819285a.16.1768498046417;
        Thu, 15 Jan 2026 09:27:26 -0800 (PST)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530a9e5d1sm452354985a.18.2026.01.15.09.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 09:27:26 -0800 (PST)
Message-ID: <f5a35fdc-9245-4be6-83a3-c1bfe86d30c9@riscstar.com>
Date: Thu, 15 Jan 2026 11:27:25 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] reset: Create subdirectory for SpacemiT drivers
To: Guodong Xu <guodong@riscstar.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Haylen Chu <heylenay@4d2.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20260108-k3-reset-v2-0-457df235efe9@riscstar.com>
 <20260108-k3-reset-v2-2-457df235efe9@riscstar.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260108-k3-reset-v2-2-457df235efe9@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/8/26 8:22 AM, Guodong Xu wrote:
> Create a dedicated subdirectory for SpacemiT reset drivers to allow
> for better organization as support for more SoCs is added.
> 
> Move the existing K1 reset driver into this new directory and rename
> it to reset-spacemit-k1.c.
> 
> Rename the Kconfig symbol to RESET_SPACEMIT_K1 and update its default
> from ARCH_SPACEMIT to SPACEMIT_K1_CCU. The reset driver depends on the
> clock driver to register reset devices as an auxiliary device, so the
> default should reflect this dependency.
> 
> Also sort the drivers/reset/Kconfig entries alphabetically.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

At first I thought this was too many things for one patch, but
they're all pretty simple so I guess it's OK.

This looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
> v2: No change.
> ---
>   drivers/reset/Kconfig                                      | 12 ++----------
>   drivers/reset/Makefile                                     |  2 +-
>   drivers/reset/spacemit/Kconfig                             | 14 ++++++++++++++
>   drivers/reset/spacemit/Makefile                            |  3 +++
>   .../{reset-spacemit.c => spacemit/reset-spacemit-k1.c}     |  0
>   5 files changed, 20 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 6e5d6deffa7d367040b0b380b78ce02d775a3a63..b110f0fa7bb13eff63e1939e50a926cd0106db3f 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -299,15 +299,6 @@ config RESET_SOCFPGA
>   	  This enables the reset driver for the SoCFPGA ARMv7 platforms. This
>   	  driver gets initialized early during platform init calls.
>   
> -config RESET_SPACEMIT
> -	tristate "SpacemiT reset driver"
> -	depends on ARCH_SPACEMIT || COMPILE_TEST
> -	select AUXILIARY_BUS
> -	default ARCH_SPACEMIT
> -	help
> -	  This enables the reset controller driver for SpacemiT SoCs,
> -	  including the K1.
> -
>   config RESET_SUNPLUS
>   	bool "Sunplus SoCs Reset Driver" if COMPILE_TEST
>   	default ARCH_SUNPLUS
> @@ -406,9 +397,10 @@ config RESET_ZYNQMP
>   	  This enables the reset controller driver for Xilinx ZynqMP SoCs.
>   
>   source "drivers/reset/amlogic/Kconfig"
> +source "drivers/reset/hisilicon/Kconfig"
> +source "drivers/reset/spacemit/Kconfig"
>   source "drivers/reset/starfive/Kconfig"
>   source "drivers/reset/sti/Kconfig"
> -source "drivers/reset/hisilicon/Kconfig"
>   source "drivers/reset/tegra/Kconfig"
>   
>   endif
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 9c3e484dfd81a4f7b2f156a6226d5fa233600f9f..fc0cc99f8514cac161af59389ba1cbd5490209c8 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -2,6 +2,7 @@
>   obj-y += core.o
>   obj-y += amlogic/
>   obj-y += hisilicon/
> +obj-y += spacemit/
>   obj-y += starfive/
>   obj-y += sti/
>   obj-y += tegra/
> @@ -38,7 +39,6 @@ obj-$(CONFIG_RESET_RZV2H_USB2PHY) += reset-rzv2h-usb2phy.o
>   obj-$(CONFIG_RESET_SCMI) += reset-scmi.o
>   obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
>   obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
> -obj-$(CONFIG_RESET_SPACEMIT) += reset-spacemit.o
>   obj-$(CONFIG_RESET_SUNPLUS) += reset-sunplus.o
>   obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
>   obj-$(CONFIG_RESET_TH1520) += reset-th1520.o
> diff --git a/drivers/reset/spacemit/Kconfig b/drivers/reset/spacemit/Kconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..552884e8b72afeb05cdb9b6565ad8e7fd32f990b
> --- /dev/null
> +++ b/drivers/reset/spacemit/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config RESET_SPACEMIT_K1
> +	tristate "SpacemiT K1 reset driver"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	depends on SPACEMIT_K1_CCU
> +	select AUXILIARY_BUS
> +	default SPACEMIT_K1_CCU
> +	help
> +	  Support for reset controller in SpacemiT K1 SoC.
> +	  This driver works with the SpacemiT K1 clock controller
> +	  unit (CCU) driver to provide reset control functionality
> +	  for various peripherals and subsystems in the SoC.
> +
> diff --git a/drivers/reset/spacemit/Makefile b/drivers/reset/spacemit/Makefile
> new file mode 100644
> index 0000000000000000000000000000000000000000..de7e358c74fd7b0fac3ec2c18d985331af64fcbb
> --- /dev/null
> +++ b/drivers/reset/spacemit/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_RESET_SPACEMIT_K1)		+= reset-spacemit-k1.o
> +

Didn't git shout at you for having a blank line at the end of this file?

> diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/spacemit/reset-spacemit-k1.c
> similarity index 100%
> rename from drivers/reset/reset-spacemit.c
> rename to drivers/reset/spacemit/reset-spacemit-k1.c
> 

