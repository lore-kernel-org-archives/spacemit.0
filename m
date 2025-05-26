Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7631A213E74
	for <spacemit@lists.linux.dev>; Mon, 26 May 2025 15:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748274719; cv=none; b=kzyRy15yiLPBnoSrSPzARaE/wITVwiGeALAFh9bS1SmAnH2Fe1DpqYSPdt4TN4F/KGBUu2znsjYlwY4wM68O7RNXpLNSDpyHX7pGhGxLIh51V5loEMHf7CQDs9aPxnKW8HjFyeQg0fVBhhwNn4F1rbCbAbrZnbx32iQnu3BCCdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748274719; c=relaxed/simple;
	bh=oST7vwu2iWEVU9gbcP/xMOfJ8AUX2KtkwXYYYBLCPZY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=epejIzQJD9ZRXWFT+BWOM7vP/eE6c2DCGIv2PIP9IBBLUc1cI9mcMlskF2e2Itb+ks5tHXRY6Hbbsn1RnMhlmTn5RmLAgOFXZmckE0qOgOIeCygnCSmFACwJlPg3rPd3mZCk0NL05Hxsb8UXWGtu9wLLF6G82Gq9Dy3Ug7583vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R57L5V63; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R57L5V63"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a3798794d3so2421555f8f.1
        for <spacemit@lists.linux.dev>; Mon, 26 May 2025 08:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748274715; x=1748879515; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7bjzoIIXG8TdggAgokiJNFRsdiocEQaRnkKiyhSlsH0=;
        b=R57L5V63A7C7pR4WM0fPDiBhpcsViKw6Pnm2zvtpQQJJzDbNEff+3teP8NJbrkpFfB
         KqjlpSzEVMZAqCEiuHmsGDCTK7wqlP6kkHZxzgqL391ImZELqPDCeOi01Cteeok7lfcr
         IEyYBGqMv+HM9KH5OiJh49KA8ebrm2VwPLA2kk3fiv3U3VczJHSvmJgPI90psmi9VGEH
         gdapxx3OYqkCGlSgTARdnZY5p65WZ27UTLXnukTYfRlMEDdC5uLcJgEBV7EH2NgmRrx1
         jerDNhE40fArvwXtGFnEnCbMeNbRiVUxOVGHaA6Gs1I519+Q0aUarBFugGALj7ZljZ4V
         O46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748274715; x=1748879515;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7bjzoIIXG8TdggAgokiJNFRsdiocEQaRnkKiyhSlsH0=;
        b=cVPfy3nSuHC+pCfMY2eKngCNjIJDTVsY8/hQ6Akh+uldieThh7yk6fZfBb5NIgUSL2
         5URNj3+a8CHPvtISTgSeZCb9yc3afmJSfYjuy8s7qQSm7SYcmZJVQ9bp1+U63/3iLBqR
         X/ViVbkk+pACP5xHivONLBOrIOzHN5n9k7EvvDhzo7ISzmW2+CXVlb+5E9rMWhiubLe/
         wFBqrtiJoSTkeJ8d2sT0PSzAgiRY+A8ll2oZ52h/Rq3bfX5aI6T4kJrp6QGj35wYYsuM
         J+OSzW37uQ100bXP/O94dIZo/dXes6XXFV8bkR1LUTd3AXBoBrIV9kpaXjCJkSg3qFj0
         CM1A==
X-Forwarded-Encrypted: i=1; AJvYcCVVlYZ2KmWtiudjHqtJ9byIIAd69madEP13Q/WTWNOlCzVUjKAHy+P4RE/xvPiZs+UI+C4BRgXoiQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzN2h2x1sfQcNwRhseDF9qnFMyt0JmBzXTHaT2otOndGS0BYqwX
	fp9mUpl0UmgNcDiQK22jUhOUnC5CaLNrbSNee0cEEPSvbAVUoG2xrWrfwy/uYUIR4m8=
X-Gm-Gg: ASbGncskWTftR/QJT6a38so+JEXloPbz9MoKZ1sZkgP2ZrIYIrYSLyPZ2zSdn1EGreB
	DqgBtMceXde69q9kCqzuBBmeF0U2+2jxh94P9oG+Fbf1/GRcgCv/CX342Hce9EmKfD0WXhxg+JB
	hStyvPaJWTW3PZjOpHSFKdnBu29lR1pEvvCCapeqN+wsBj/dsVUu8sicrNwnFlVxmjpNVl5MKEJ
	jN56o5TSUWB8BmXAga8IAonH6GlpvVtul4pgTlx8znTY5WB7v0UtSbPwxLsnEU8Ms0YsFkfB4cL
	JLnpFkvDzdbdlBBIrmj9ZKG9driRTr5/sIVQa7Vea6EUhiOFTxDhl+tgLVWcmXlpWQ/PPZK7XNf
	gMYbNWot1LQZUhPeQzvgCKpkUi9T2
X-Google-Smtp-Source: AGHT+IH1epXCOIUG/iYdu3e9sbMDiReRn+5q8Cf6MYskS62ZGRXKqLb43uikJKqhdCgcIn6FoAJgfg==
X-Received: by 2002:adf:ee43:0:b0:3a4:cea0:7ec9 with SMTP id ffacd0b85a97d-3a4cea07f3bmr6470899f8f.54.1748274714508;
        Mon, 26 May 2025 08:51:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:485c:38a6:3d01:f4a4? ([2a01:e0a:3d9:2080:485c:38a6:3d01:f4a4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d90912d4sm3325921f8f.47.2025.05.26.08.51.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 08:51:54 -0700 (PDT)
Message-ID: <39e6b2e7-2aae-4f11-8cb0-2e911c2d7793@linaro.org>
Date: Mon, 26 May 2025 17:51:53 +0200
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 3/4] phy: spacemit: support K1 USB2.0 PHY controller
To: Ze Huang <huangze@whut.edu.cn>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250526-b4-k1-usb3-phy-v2-v4-0-eca668fc16a2@whut.edu.cn>
 <20250526-b4-k1-usb3-phy-v2-v4-3-eca668fc16a2@whut.edu.cn>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250526-b4-k1-usb3-phy-v2-v4-3-eca668fc16a2@whut.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26/05/2025 16:31, Ze Huang wrote:
> The SpacemiT K1 SoC includes three USB ports:
> 
> - One USB2.0 OTG port
> - One USB2.0 host-only port
> - One USB3.0 port with an integrated USB2.0 DRD interface
> 
> Each of these ports is connected to a USB2.0 PHY responsible for USB2
> transmission.
> 
> This commit adds support for the SpacemiT K1 USB2.0 PHY, which is
> compliant with the USB 2.0 specification and supports both 8-bit 60MHz
> and 16-bit 30MHz parallel interfaces.
> 
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> ---
>   drivers/phy/Kconfig                |   1 +
>   drivers/phy/Makefile               |   1 +
>   drivers/phy/spacemit/Kconfig       |  13 ++++
>   drivers/phy/spacemit/Makefile      |   2 +
>   drivers/phy/spacemit/phy-k1-usb2.c | 131 +++++++++++++++++++++++++++++++++++++
>   5 files changed, 148 insertions(+)
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 8d58efe998ec5fd50054eed2c90d6ecce6bd5dd8..fca589aa7926eb5bce14e99785cf32cf0395202e 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -114,6 +114,7 @@ source "drivers/phy/renesas/Kconfig"
>   source "drivers/phy/rockchip/Kconfig"
>   source "drivers/phy/samsung/Kconfig"
>   source "drivers/phy/socionext/Kconfig"
> +source "drivers/phy/spacemit/Kconfig"
>   source "drivers/phy/st/Kconfig"
>   source "drivers/phy/starfive/Kconfig"
>   source "drivers/phy/sunplus/Kconfig"
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index e281442acc752820fe0bd638dfe38986a37c2a78..05993ff8a15daf7e2583b5f9b9b37ac584a30609 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -34,6 +34,7 @@ obj-y					+= allwinner/	\
>   					   rockchip/	\
>   					   samsung/	\
>   					   socionext/	\
> +					   spacemit/	\
>   					   st/		\
>   					   starfive/	\
>   					   sunplus/	\
> diff --git a/drivers/phy/spacemit/Kconfig b/drivers/phy/spacemit/Kconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..0136aee2e8a2f5f484da136b26f80130794b992c
> --- /dev/null
> +++ b/drivers/phy/spacemit/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Phy drivers for SpacemiT platforms
> +#
> +config PHY_SPACEMIT_K1_USB2
> +	tristate "SpacemiT K1 USB 2.0 PHY support"
> +	depends on (ARCH_SPACEMIT || COMPILE_TEST) && OF
> +	depends on COMMON_CLK
> +	depends on USB_COMMON
> +	select GENERIC_PHY
> +	help
> +	  Enable this to support K1 USB 2.0 PHY driver. This driver takes care of
> +	  enabling and clock setup and will be used by K1 udc/ehci/otg/xhci driver.
> diff --git a/drivers/phy/spacemit/Makefile b/drivers/phy/spacemit/Makefile
> new file mode 100644
> index 0000000000000000000000000000000000000000..fec0b425a948541b39b814caef0b05e1e002d92f
> --- /dev/null
> +++ b/drivers/phy/spacemit/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_PHY_SPACEMIT_K1_USB2)		+= phy-k1-usb2.o
> diff --git a/drivers/phy/spacemit/phy-k1-usb2.c b/drivers/phy/spacemit/phy-k1-usb2.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..3485064a77baac8bb857aff3da45838c0da28f03
> --- /dev/null
> +++ b/drivers/phy/spacemit/phy-k1-usb2.c
> @@ -0,0 +1,131 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * SpacemiT K1 USB 2.0 PHY driver
> + *
> + * Copyright (C) 2025 SpacemiT (Hangzhou) Technology Co. Ltd
> + * Copyright (C) 2025 Ze Huang <huangze9015@gmail.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/iopoll.h>
> +#include <linux/platform_device.h>
> +#include <linux/usb/of.h>
> +
> +#define USB2_PHY_REG01			0x04
> +#define  USB2_PHY_REG01_VAL		0x60ef
> +#define  USB2_PHY_REG01_PLL_IS_READY	BIT(0)
> +#define USB2_PHY_REG04			0x10
> +#define  USB2_PHY_REG04_AUTO_CLEAR_DIS	BIT(2)
> +#define USB2_PHY_REG0D			0x34
> +#define  USB2_PHY_REG0D_VAL		0x1c
> +#define USB2_PHY_REG26			0x98
> +#define  USB2_PHY_REG26_VAL		0xbec4
> +
> +#define USB2D_CTRL_RESET_TIME_MS	50
> +
> +struct spacemit_usb2phy {
> +	struct phy	*phy;
> +	struct clk	*clk;
> +	void __iomem	*base;
> +};
> +
> +static int spacemit_usb2phy_init(struct phy *phy)
> +{
> +	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
> +	void __iomem *base = sphy->base;
> +	u32 val;
> +	int ret;
> +
> +	ret = clk_prepare_enable(sphy->clk);
> +	if (ret) {
> +		dev_err(&phy->dev, "failed to enable clock\n");
> +		return ret;
> +	}
> +
> +	/*
> +	 * make sure the usb controller is not under reset process before
> +	 * any configuration
> +	 */
> +	usleep_range(150, 200);
> +	writel(USB2_PHY_REG26_VAL, base + USB2_PHY_REG26); /* 24M ref clk */
> +
> +	ret = read_poll_timeout(readl, val, (val & USB2_PHY_REG01_PLL_IS_READY),
> +				500, USB2D_CTRL_RESET_TIME_MS * 1000, true,
> +				base + USB2_PHY_REG01);
> +	if (ret) {
> +		dev_err(&phy->dev, "wait PHY_REG01[PLLREADY] timeout\n");
> +		return ret;
> +	}
> +
> +	/* release usb2 phy internal reset and enable clock gating */
> +	writel(USB2_PHY_REG01_VAL, base + USB2_PHY_REG01);
> +	writel(USB2_PHY_REG0D_VAL, base + USB2_PHY_REG0D);
> +
> +	/* auto clear host disc */
> +	val = readl(base + USB2_PHY_REG04);
> +	val |= USB2_PHY_REG04_AUTO_CLEAR_DIS;
> +	writel(val, base + USB2_PHY_REG04);
> +
> +	return 0;
> +}
> +
> +static int spacemit_usb2phy_exit(struct phy *phy)
> +{
> +	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
> +
> +	clk_disable_unprepare(sphy->clk);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops spacemit_usb2phy_ops = {
> +	.init = spacemit_usb2phy_init,
> +	.exit = spacemit_usb2phy_exit,
> +	.owner = THIS_MODULE,
> +};
> +
> +static int spacemit_usb2phy_probe(struct platform_device *pdev)
> +{
> +	struct phy_provider *phy_provider;
> +	struct device *dev = &pdev->dev;
> +	struct spacemit_usb2phy *sphy;
> +
> +	sphy = devm_kzalloc(dev, sizeof(*sphy), GFP_KERNEL);
> +	if (!sphy)
> +		return -ENOMEM;
> +
> +	sphy->clk = devm_clk_get_prepared(&pdev->dev, NULL);
> +	if (IS_ERR(sphy->clk))
> +		return dev_err_probe(dev, PTR_ERR(sphy->clk), "Failed to get clock\n");
> +
> +	sphy->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(sphy->base))
> +		return PTR_ERR(sphy->base);
> +
> +	sphy->phy = devm_phy_create(dev, NULL, &spacemit_usb2phy_ops);
> +	if (IS_ERR(sphy->phy))
> +		return dev_err_probe(dev, PTR_ERR(sphy->phy), "Failed to create phy\n");
> +
> +	phy_set_drvdata(sphy->phy, sphy);
> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +
> +	return PTR_ERR_OR_ZERO(phy_provider);
> +}
> +
> +static const struct of_device_id spacemit_usb2phy_dt_match[] = {
> +	{ .compatible = "spacemit,k1-usb2-phy", },
> +	{ /* sentinal */ }

=> sentinel

> +};
> +MODULE_DEVICE_TABLE(of, spacemit_usb2phy_dt_match);
> +
> +static struct platform_driver spacemit_usb2_phy_driver = {
> +	.probe	= spacemit_usb2phy_probe,
> +	.driver = {
> +		.name   = "spacemit-usb2-phy",
> +		.of_match_table = spacemit_usb2phy_dt_match,
> +	},
> +};
> +module_platform_driver(spacemit_usb2_phy_driver);
> +
> +MODULE_DESCRIPTION("Spacemit USB 2.0 PHY driver");
> +MODULE_LICENSE("GPL");
> 

It looks fine, but why didn't also convert thid driver to regmap ?

Thanks,
Neil
