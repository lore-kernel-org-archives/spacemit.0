Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2567A1E49F
	for <spacemit@lists.linux.dev>; Mon, 23 Feb 2026 13:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771851642; cv=none; b=Ad146SXsoIXtCbEWXgquXpsrKsr+8RmPIYoRFAuePAURM2KNqi0G1JsGypcjm15c4zATGnsj4K7PiW4L1nV3s1+lNt7iU7zPA5kwD8iM0y9kjdLFpl5dmrtD2edLi+yfNcHoph75QYQdB2yL1ZkBLKVJUWM8DxwNBYvstoh267A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771851642; c=relaxed/simple;
	bh=YU2WehP9asV4+Ee2Gh3TxztZkaJelwycgGkKuybqiws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ijQqTgY71PqraU67eyssF6K6K/yHS0SO4yfgRzDFx8HPY5N+5cAg+InabPyM+swFEI7uWy9dyIgdHze+rPnVbK4ztE7CHOZMG7C4+Z5gIxesIpGdt7usjAJiPp4erGANkggXNZtL+IESYjGa/oBOhXsER1varW/jXJpx/TR9sw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Obly+SId; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Obly+SId"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d1890f7ee4so2598268a34.0
        for <spacemit@lists.linux.dev>; Mon, 23 Feb 2026 05:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1771851637; x=1772456437; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w/wtJj9m6xJdO/59adozKuuGhNiPpdU9Edi7GoMvpVA=;
        b=Obly+SId7iPTA2nJsy7myqO7ZyA4U03JgT/kxJttGlMHWcwenycFn5N4TLqNKYWXNa
         2hGKoyWTeRnvjDkyfW/EwGTK7k62/+FRRsWl/S34mTAub5aP/yYJocTrmCV1KQ8z1WPz
         MEbum7wUc75spTIInBiQ9nGIAGJN+R7oPhKJ4KYt8WlQPkybYRzpDk99wHds/gZq7Qh1
         Zv4Ww7f6ocdw7RrWpwaPrDRXej0/ezOaRoI2UAs0j8TOsZ+4Uhml5lUSf7v0EfY25sBs
         /+gzTY3ov3f1inhQnrUAXxht+p9BpGqpA3kWs9NCS7X4gu0FgCz9qprn3qq62CX15qjy
         9w/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771851637; x=1772456437;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w/wtJj9m6xJdO/59adozKuuGhNiPpdU9Edi7GoMvpVA=;
        b=uVsSfNGfCdLT94GihUyeF8vsulXq3bUJ/Kepq+gBST6UfQjMlUOiATSXb0NtKv2tS1
         knSc3a4odBZd/axI469QJgcXCDvfaU85YOZ13CQ6OYeGPaX2ATe+erk34Peru16DcQ1G
         B7yt8u+JRWiilkNRYoHscrKxIQU45DVIiTZCtJ5xN2B48hKjeeRpIzCKkOlHD9T5newl
         LDcXAdKxkmdxeVWZnc+9XPrl6KwREfsKSjT+DhnWW5dgcvlU7ZbwDqVgmpC6/+QZ3ky+
         aLifwJu6GywsMbLyngEqdL7Sa1UBP3hLYU+lyUc6ahWlKgNQuMTqV81ZVz0vABUaDGUM
         XTuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGp90NhyMpPfHx8uJI79QT5JU7W47x01CJGxm031MwzXOK06WLeyvHJ+KPC5tytCguovaEGqbVdg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZO2UiHkRQ2QO1kTAEVttQ1CCQgdHfFmWp8+SYfW3NKsIfMKWE
	GKoHPrn74a3lu0kv5uxjgU+rR7pyhNWKBA18vG0RTAsOurOX6/7puQMXgCymDuMIaVQ=
X-Gm-Gg: AZuq6aIOjBS3HBTKgnvlNEMl80CtaFilsku5EB4pmKcGuiKsD1Ms53xS3wivlWMB1CX
	odYtxlrBL/dbYqB+0Ok5RLgTIwgMwY9YzW+DPWr/ht8RxdsG+8KhOOPzhQ8RP+sHYvD9NtcyiUS
	DD205odn074m4WCNMx6rM9vycBlJwizmjA3AUU0eu23rHan4Y0xA+EUYfnjsgDUDAfjKgSTef/3
	ZCY0rmF19EmzzyoWjZXhc3Y4lJrcFouX96AIgBkEVRHwP2mrJOdfZF2sCWKgTgaW84mknLXU6Hh
	B+ib+c8if6LZmh8kDRiTVgqvd72BpXVuwv9ofjsJmqbUGH8IRNlRtHtorFnKoEHVdsaN6RUw3AB
	Rs3y36/7Sg1ktukIAiJL4ZTDDhBz+banrAbwND52jh8EyjSSd4WQ0C3xnrMoAUakHggeK0MU/fd
	C8zRKIj6ZGrGv5BckyszrKLoaVVIG6GguYs7meNH0xw+F2WruYi3biFl6dr8dPa1g=
X-Received: by 2002:a05:6830:1209:b0:7d1:a41a:4675 with SMTP id 46e09a7af769-7d52bdf4117mr3618378a34.7.1771851636131;
        Mon, 23 Feb 2026 05:00:36 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d52cf7874csm7719069a34.1.2026.02.23.05.00.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 05:00:35 -0800 (PST)
Message-ID: <317ffbf8-187a-478c-bd8a-a6a11367ae15@riscstar.com>
Date: Mon, 23 Feb 2026 07:00:34 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: move spacemit pcie driver to its subfolder
To: Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Oltean <olteanv@gmail.com>, Ze Huang <huang.ze@linux.dev>,
 spacemit@lists.linux.dev
References: <20260223064240.386617-1-vkoul@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260223064240.386617-1-vkoul@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/23/26 12:42 AM, Vinod Koul wrote:
> Commit fe4bc1a08638 ("phy: spacemit: support K1 USB2.0 PHY controller")
> created spacemit subfolder with usb driver while commit 57e920b92724
> ("phy: spacemit: Introduce PCIe/combo PHY") added pcie driver in phy
> folder. Move latter into spacemit subfolder and rename file to
> phy-k1-pcie.c
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Looks good.  Thanks!

Reviewed-by: Alex Elder <elder@riscstar.com>



> ---
>   drivers/phy/Kconfig                                  | 12 ------------
>   drivers/phy/Makefile                                 |  1 -
>   drivers/phy/spacemit/Kconfig                         | 12 ++++++++++++
>   drivers/phy/spacemit/Makefile                        |  1 +
>   .../phy-k1-pcie.c}                                   |  0
>   5 files changed, 13 insertions(+), 13 deletions(-)
>   rename drivers/phy/{phy-spacemit-k1-pcie.c => spacemit/phy-k1-pcie.c} (100%)
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 02467dfd4fb0..c0574e44f0a3 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -134,18 +134,6 @@ config PHY_NXP_PTN3222
>   	  schemes. It supports all three USB 2.0 data rates: Low Speed, Full
>   	  Speed and High Speed.
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
>   source "drivers/phy/allwinner/Kconfig"
>   source "drivers/phy/amlogic/Kconfig"
>   source "drivers/phy/apple/Kconfig"
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index a648c2e02a83..2773d596e543 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -16,7 +16,6 @@ obj-$(CONFIG_PHY_SNPS_EUSB2)		+= phy-snps-eusb2.o
>   obj-$(CONFIG_USB_LGM_PHY)		+= phy-lgm-usb.o
>   obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
>   obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
> -obj-$(CONFIG_PHY_SPACEMIT_K1_PCIE)	+= phy-spacemit-k1-pcie.o
>   obj-$(CONFIG_GENERIC_PHY)		+= allwinner/	\
>   					   amlogic/	\
>   					   apple/	\
> diff --git a/drivers/phy/spacemit/Kconfig b/drivers/phy/spacemit/Kconfig
> index 0136aee2e8a2..50b0005acf66 100644
> --- a/drivers/phy/spacemit/Kconfig
> +++ b/drivers/phy/spacemit/Kconfig
> @@ -2,6 +2,18 @@
>   #
>   # Phy drivers for SpacemiT platforms
>   #
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
>   config PHY_SPACEMIT_K1_USB2
>   	tristate "SpacemiT K1 USB 2.0 PHY support"
>   	depends on (ARCH_SPACEMIT || COMPILE_TEST) && OF
> diff --git a/drivers/phy/spacemit/Makefile b/drivers/phy/spacemit/Makefile
> index fec0b425a948..a821a21d6142 100644
> --- a/drivers/phy/spacemit/Makefile
> +++ b/drivers/phy/spacemit/Makefile
> @@ -1,2 +1,3 @@
>   # SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_PHY_SPACEMIT_K1_PCIE)		+= phy-k1-pcie.o
>   obj-$(CONFIG_PHY_SPACEMIT_K1_USB2)		+= phy-k1-usb2.o
> diff --git a/drivers/phy/phy-spacemit-k1-pcie.c b/drivers/phy/spacemit/phy-k1-pcie.c
> similarity index 100%
> rename from drivers/phy/phy-spacemit-k1-pcie.c
> rename to drivers/phy/spacemit/phy-k1-pcie.c

