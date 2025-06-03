Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436C52698BC
	for <spacemit@lists.linux.dev>; Tue,  3 Jun 2025 07:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748936283; cv=none; b=QozrfmZAJzmb2ryau92MPIR1hAfJCJqqFPqU6/1oThPcbAl9t8Cx8POi+Rls3HelVbmcwyOghQLe7tBeqoioyFuxmy+DkBGmda4AP5TvkumR2CZQzDX2p2d/DzcuDdDRoGEP2tQwJFilkhr9rlmf/r6FjJL0M0rbKsnNZY31WQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748936283; c=relaxed/simple;
	bh=hTmJ/2k2ZC0/0KiI3YLpg4Ygz9xcwNv/P+U6rdV/+js=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=g45emEY0WfGc7uzM4JloFlYf6M/baMbZDRoz+/EZAlKF2/RAxu2ulWMZI4DXHYQAHr1+0O8BNAYXeZmYMjnegoReohL6qMSyDiU7PrqiFE49OHAj4p9WCglu+FMfwHTEDssKNL8aiPWxmMrk/BsmY9RRh9+mDtWzS9+iQ60rgtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LoOsCrAg; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LoOsCrAg"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so1581915f8f.1
        for <spacemit@lists.linux.dev>; Tue, 03 Jun 2025 00:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748936279; x=1749541079; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=seUOhsZbDhvoYHw0d4ANGqPOk9QNGhZ8LAEm2oPsOKc=;
        b=LoOsCrAgUBuNEoQzWh5/GetSLIiRH9GI8tS+cG2A/hmdXs2QSD4QnjvCXzoLaP5B/a
         Un+MmDUCoH2w/v6lzUO2Fg7WRGa4X8VlQ02AP/bFUKugr5otNy9CzDSfNogHMO+0YVxb
         IBvW81msUsUZYZRqEYVx4wrCfSn3aGFjeb3ueWvMSPxtjtlDNJmuh7bjjZEwfZoeqUNS
         z/GOLVMcJdcZgcLt1j/DAn4LjmUs9y/NUzOqWEIqJGklFmrnH+MvPNMimdyPcBsaivDo
         VAh6XRaUguP3QESKcUlo9Nso9fzFuaZfQJlRnS4W0KjhFpQ1lD5KgDIEKoji3SOrpu0e
         /VDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748936279; x=1749541079;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=seUOhsZbDhvoYHw0d4ANGqPOk9QNGhZ8LAEm2oPsOKc=;
        b=ijSMs9Ys1gO7iYd5cY/0ZEs+j+5oFxkLMvGLEm6Tb3nqDM0Mqw1RO3sPRDR54GDqvk
         /W49/PWwCJv2wDotWKL8xUQTN/ww8icyJ4NyQpglWoWDDToqxp+Wm2rOiUcNdELKCBCZ
         OLwMzUxNUB2xdJxvM+ewdWETUhdF6CXfG8bRnzwdxrsBvuQJnttqn/FWdU328jP1jlOA
         lrRHyGTTI2+EGlR4kM+6dolXkrBJtjGhF90M+Vr9TmeyYAhWrQMub61sDVOSXWwmqXtt
         a5ZVvQ94Qy1kVVhOBYRoWAeibsZuJy/D5YWKtjFKDZ0bUjAcMRD0dD7gSQH51pntTDJY
         9XKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWieUfWRL6hy8vJxkw8UJ6YkaS16WPdybZQCkwpbLM9lw6TgiDFP6LWDZKrO2KaQTZc2TmTSbQjVg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3UFxDKu3NO4ojTDwFcGYxKdPVwJl3GamS70YR5k1gU15GW73y
	11hDqZlucURgM4A/gwzMk/5Pd1gL0KV07OLcNRPySpYAug9gi5N3FwbKpjO6EN7sQOE=
X-Gm-Gg: ASbGnct/1MbeLhc96eOXvpSXDD2yjcq/rcG5JX5HArtwrtYCSh0enPm36yrw3HyVIfd
	goORwJbz2iiG9Cg6E/nUZ3d8vm9KrHzwsbwIoNrL7QgcPR2wTUNfsNwmo2I7V9Q3KbKBqLRApA2
	17oG1Xs49v+uScnM4MS5eBl5pnJGkmft5MtpEiUBBhj+SqeAkfa42zaC6faGbKDrVPMa2IK0Gwi
	9enr/7qWGEaycblA08P6GX6jOEKPyOlqEvE9BkwROH5iUC5Km9aIMxID9mSUH9DIHEKBPUe+AaS
	nKyk79u7g67vFY8m9TmJ6dX/H35tmJuakRYkCinZhGe6iEp1dVaSHfuSJFl7E/NX02ugc62ZWLg
	op2hyzlpSJp7o1CL01ERIMlJwmQ==
X-Google-Smtp-Source: AGHT+IFi3znTnYqUQeguNV73hNktDEyFtGLlBraRs30TSORf/tbD4lhEKTMlcOzfM/MZjLWwmBXuNA==
X-Received: by 2002:a05:6000:18aa:b0:3a4:d953:74a1 with SMTP id ffacd0b85a97d-3a4f7a653damr12282665f8f.23.1748936279301;
        Tue, 03 Jun 2025 00:37:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:563:3654:17de:c930? ([2a01:e0a:3d9:2080:563:3654:17de:c930])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009ff11sm17075482f8f.86.2025.06.03.00.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 00:37:58 -0700 (PDT)
Message-ID: <d9be98db-9196-4a15-896f-d802f8251f3d@linaro.org>
Date: Tue, 3 Jun 2025 09:37:58 +0200
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 3/4] phy: spacemit: support K1 USB2.0 PHY controller
To: Ze Huang <huangze@whut.edu.cn>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250527-b4-k1-usb3-phy-v2-v5-0-2d366b0af999@whut.edu.cn>
 <20250527-b4-k1-usb3-phy-v2-v5-3-2d366b0af999@whut.edu.cn>
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
In-Reply-To: <20250527-b4-k1-usb3-phy-v2-v5-3-2d366b0af999@whut.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/05/2025 14:01, Ze Huang wrote:
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
>   drivers/phy/spacemit/phy-k1-usb2.c | 144 +++++++++++++++++++++++++++++++++++++
>   5 files changed, 161 insertions(+)
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
> index 0000000000000000000000000000000000000000..ee64af07478ea02b421473e6f73fd37a3a135e7d
> --- /dev/null
> +++ b/drivers/phy/spacemit/phy-k1-usb2.c
> @@ -0,0 +1,144 @@
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
> +#include <linux/regmap.h>
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
> +	struct regmap	*regmap_base;
> +};
> +
> +static const struct regmap_config phy_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = 0x200,
> +};
> +
> +static int spacemit_usb2phy_init(struct phy *phy)
> +{
> +	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
> +	struct regmap *map = sphy->regmap_base;
> +	u32 val;
> +	int ret;
> +
> +	ret = clk_prepare_enable(sphy->clk);

clock is already prepared, should be clk_enable

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
> +	regmap_write(map, USB2_PHY_REG26, USB2_PHY_REG26_VAL); /* 24M ref clk */
> +
> +	ret = regmap_read_poll_timeout(map, USB2_PHY_REG01, val,
> +				       (val & USB2_PHY_REG01_PLL_IS_READY),
> +				       500, USB2D_CTRL_RESET_TIME_MS * 1000);
> +	if (ret) {
> +		dev_err(&phy->dev, "wait PHY_REG01[PLLREADY] timeout\n");
> +		return ret;

clk_disable on error ?


> +	}
> +
> +	/* release usb2 phy internal reset and enable clock gating */
> +	regmap_write(map, USB2_PHY_REG01, USB2_PHY_REG01_VAL);
> +	regmap_write(map, USB2_PHY_REG0D, USB2_PHY_REG0D_VAL);
> +
> +	/* auto clear host disc */
> +	regmap_update_bits(map, USB2_PHY_REG04, USB2_PHY_REG04_AUTO_CLEAR_DIS,
> +			   USB2_PHY_REG04_AUTO_CLEAR_DIS);
> +
> +	return 0;
> +}
> +
> +static int spacemit_usb2phy_exit(struct phy *phy)
> +{
> +	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
> +
> +	clk_disable_unprepare(sphy->clk);

clk_disable

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
> +	void __iomem *base;
> +
> +	sphy = devm_kzalloc(dev, sizeof(*sphy), GFP_KERNEL);
> +	if (!sphy)
> +		return -ENOMEM;
> +
> +	sphy->clk = devm_clk_get_prepared(&pdev->dev, NULL);
> +	if (IS_ERR(sphy->clk))
> +		return dev_err_probe(dev, PTR_ERR(sphy->clk), "Failed to get clock\n");
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	sphy->regmap_base = devm_regmap_init_mmio(dev, base, &phy_regmap_config);
> +	if (IS_ERR(sphy->regmap_base))
> +		return dev_err_probe(dev, PTR_ERR(sphy->regmap_base),
> +				     "Failed to init regmap\n");
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
> +	{ /* sentinel */ }
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

Thanks,
Neil
