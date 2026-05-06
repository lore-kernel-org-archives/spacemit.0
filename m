Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1958A3368A9
	for <spacemit@lists.linux.dev>; Wed,  6 May 2026 15:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778079808; cv=none; b=QWZGc2lrNEoUYfxwJs39vSQAEMok10GYDg/swu7yN1SMEPRBqD8tIAtZ2t2MqxqoNM6vw+XfokuOJIJje9ucHzG69UIV246RiqdUrwnC5BHViRscxMJdt4z1Z96oa5p+MIejQg2GhnDMYEu2ap5t5j9txt0lHS0aWz+Zqvn35Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778079808; c=relaxed/simple;
	bh=B87l/+dXX9ZwdipiWVnNUuu8nCGR2/ZMqtA9tPmwvi4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pD66A5/qLPM824kCwRdb9ETFP2i86d62dbf0fCuyd22t12x3CwxjThp6MieDs9g1G1gjqpUFZBC1FO7msQ89SzkEdfazDcM6ZOkM4dHiIoXwQsF69V/yDwsvSa60OE3HsniCoATl9Xiu+uG/tVe6GtKcVO3/nD53Z4s3t4JMACc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E4iO/5Lb; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E4iO/5Lb"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b936331786dso792436166b.3
        for <spacemit@lists.linux.dev>; Wed, 06 May 2026 08:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778079805; x=1778684605; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J2mDJXIFYlupSX9LmHl3D1F2SQl0bbq2hvtOpkX4whw=;
        b=E4iO/5LbVI7GvUXTdf8CDZneOdXmykItdUePSp1R1F76fsVE2o+G2zQRwJh5oazqU1
         KEZH3pmH1bsUOuE7z3oSTedZ4WS+t4Bfht+++z36eD11yZJx432iTJ2vEHQak76IYh63
         qdQiPoPer4/4gK9+e5iqgfknzy+hA/pkUKRb/X6mLdypOVketnt9rvP90/77T3x1oP4Q
         gyQyzxtg+rsNPDntOXK4ESUyBxyUfxhPiDcJ1I0/QxnKJEIDwFD/8ajBnvuTUWwhyyKI
         h/acuAM3fASU6xChRhM+H5IwW92odLJvSxfmCsUrT4Ds+sjGrM1+pZGh/ddlJRkcTHeV
         rApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778079805; x=1778684605;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2mDJXIFYlupSX9LmHl3D1F2SQl0bbq2hvtOpkX4whw=;
        b=cqMxLEwDAu3+45w69FJ1cPwhzvRCKtUJPFtoLsIXjou7ggqT4WeGbKzSjHkFQ09KSl
         WBhcUPW3Hs3UEKTBlphKfmZN6Yg7THL5L/STH2YVDKV8qmXOASPP8mfa85fh9RIJCj37
         AWcOan6snusT5LRgnOQ7EjBZYKFGIqQgaIl9XJ/KIunkNjkTpRdaZLaVic+KErt/40Hi
         cMYqKjVzzcGTIiXubE9pC7/e4yFvH/FUbIIwSZ7QIlqNhe3OS43gx6QswZrbeEYoMZRd
         BKsigyw5k/2Fn6Z4zf/ElPzQjqtXpwF+PNFv2P8500IaXi8wif53fy9A7ZTyO3viAv+S
         Dzow==
X-Forwarded-Encrypted: i=1; AFNElJ/XK0lN85ItLwcI7evuN4xYeRJZ8UpYo7gT6w3q64kogGXjHtfSIf58uLzN6KwJrGQe/byulJLVnw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9o2/mdb+M7yiSAlu1lEI4ll8rkAdhz7ksGL/s9mm9OxsJsTI3
	DVdWuHjru0K/pc7/OfKBM1DxhJyOLopDa29HQQ6UEaQ8LHMSUCaMNr/Mdm7f9FMvkso=
X-Gm-Gg: AeBDievuIh7O/AZ9h3Hoxqgj8InhaKv00d11yymAs/7SuV/r2VfwE5m8Bx/wxd4SwqE
	NBrO8O21iurd9DQp4pAC5cZiALrbexjdm36AWBOqKlacYTionafl68EmpW7xAmMXvchF0QJJyK3
	LP1qEVmTjwd2MFlU+J9a18oGbpqq3N6cqGj83Y0tUJFOqhjr+t1stDh125k4d3V8AyBSNAPsHqr
	OjJ+MB8oeqJw0ENl//Nx2gLE7ZpKLUImbKTviMUmCsZbNINJpb5q9hHFBkT6AQcdOOxgC6pFppR
	1b8xEJRtUNtAAddRW0Vznp5RN+MCsiqIeo9/sMaXtrL94GAgUiMrX4aiDswbYL44r2QD7RQU8ZA
	QjkcwMejRFAvAGeTdRORufFUUaibneerUFufiEP4EnJjWGVHiWsSOvVUUVKKzIjTiGfF1nySZOl
	oTJnK5t1tKvxSNlDVQUOlK+XeHGr4Un8Y/OXhdHv27dN0qVS/jlgadqjhXqHWC2zBTb5jN18CiT
	ll73wU4BIKNASk4kA==
X-Received: by 2002:a17:907:fd8a:b0:bba:3bd7:17c7 with SMTP id a640c23a62f3a-bc56ac3654amr180224366b.7.1778079805146;
        Wed, 06 May 2026 08:03:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5798:67fd:c866:b378? ([2a01:e0a:106d:1080:5798:67fd:c866:b378])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052953383sm12652260f8f.13.2026.05.06.08.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:03:24 -0700 (PDT)
Message-ID: <e2427d64-c7dd-4184-8824-f79cf15773d5@linaro.org>
Date: Wed, 6 May 2026 17:03:23 +0200
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/2] phy: k1-usb: k3: add USB2 PHY support
To: Yixun Lan <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, Yao Zi <me@ziyao.cc>
References: <20260305-11-k3-usb2-phy-v4-0-15554fb933bc@kernel.org>
 <20260305-11-k3-usb2-phy-v4-2-15554fb933bc@kernel.org>
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
In-Reply-To: <20260305-11-k3-usb2-phy-v4-2-15554fb933bc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/5/26 02:00, Yixun Lan wrote:
> Add USB2 PHY support for SpacemiT K3 SoC.
> 
> Register layout of handling USB disconnect operation has been changed,
> So introducing a platform data to distinguish the different SoCs.
> 
> Reviewed-by: Yao Zi <me@ziyao.cc>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>   drivers/phy/spacemit/phy-k1-usb2.c | 34 +++++++++++++++++++++++++++++-----
>   1 file changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/spacemit/phy-k1-usb2.c b/drivers/phy/spacemit/phy-k1-usb2.c
> index 9215d0b223b2..87b943d9111f 100644
> --- a/drivers/phy/spacemit/phy-k1-usb2.c
> +++ b/drivers/phy/spacemit/phy-k1-usb2.c
> @@ -51,6 +51,9 @@
>   #define PHY_K1_HS_HOST_DISC		0x40
>   #define  PHY_K1_HS_HOST_DISC_CLR		BIT(0)
>   
> +#define PHY_K3_HS_HOST_DISC		0x20
> +#define  PHY_K3_HS_HOST_DISC_CLR		BIT(8)
> +
>   #define PHY_PLL_DIV_CFG			0x98
>   #define  PHY_FDIV_FRACT_8_15		GENMASK(7, 0)
>   #define  PHY_FDIV_FRACT_16_19		GENMASK(11, 8)
> @@ -145,7 +148,7 @@ static int spacemit_usb2phy_exit(struct phy *phy)
>   	return 0;
>   }
>   
> -static int spacemit_usb2phy_disconnect(struct phy *phy, int port)
> +static int spacemit_k1_usb2phy_disconnect(struct phy *phy, int port)
>   {
>   	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
>   
> @@ -155,10 +158,27 @@ static int spacemit_usb2phy_disconnect(struct phy *phy, int port)
>   	return 0;
>   }
>   
> -static const struct phy_ops spacemit_usb2phy_ops = {
> +static int spacemit_k3_usb2phy_disconnect(struct phy *phy, int port)
> +{
> +	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
> +
> +	regmap_update_bits(sphy->regmap_base, PHY_K3_HS_HOST_DISC,
> +			   PHY_K3_HS_HOST_DISC_CLR, PHY_K3_HS_HOST_DISC_CLR);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops spacemit_k1_usb2phy_ops = {
>   	.init = spacemit_usb2phy_init,
>   	.exit = spacemit_usb2phy_exit,
> -	.disconnect = spacemit_usb2phy_disconnect,
> +	.disconnect = spacemit_k1_usb2phy_disconnect,
> +	.owner = THIS_MODULE,
> +};
> +
> +static const struct phy_ops spacemit_k3_usb2phy_ops = {
> +	.init = spacemit_usb2phy_init,
> +	.exit = spacemit_usb2phy_exit,
> +	.disconnect = spacemit_k3_usb2phy_disconnect,
>   	.owner = THIS_MODULE,
>   };
>   
> @@ -167,12 +187,15 @@ static int spacemit_usb2phy_probe(struct platform_device *pdev)
>   	struct phy_provider *phy_provider;
>   	struct device *dev = &pdev->dev;
>   	struct spacemit_usb2phy *sphy;
> +	const struct phy_ops *ops;
>   	void __iomem *base;
>   
>   	sphy = devm_kzalloc(dev, sizeof(*sphy), GFP_KERNEL);
>   	if (!sphy)
>   		return -ENOMEM;
>   
> +	ops = device_get_match_data(dev);
> +
>   	sphy->clk = devm_clk_get_prepared(&pdev->dev, NULL);
>   	if (IS_ERR(sphy->clk))
>   		return dev_err_probe(dev, PTR_ERR(sphy->clk), "Failed to get clock\n");
> @@ -185,7 +208,7 @@ static int spacemit_usb2phy_probe(struct platform_device *pdev)
>   	if (IS_ERR(sphy->regmap_base))
>   		return dev_err_probe(dev, PTR_ERR(sphy->regmap_base), "Failed to init regmap\n");
>   
> -	sphy->phy = devm_phy_create(dev, NULL, &spacemit_usb2phy_ops);
> +	sphy->phy = devm_phy_create(dev, NULL, ops);
>   	if (IS_ERR(sphy->phy))
>   		return dev_err_probe(dev, PTR_ERR(sphy->phy), "Failed to create phy\n");
>   
> @@ -196,7 +219,8 @@ static int spacemit_usb2phy_probe(struct platform_device *pdev)
>   }
>   
>   static const struct of_device_id spacemit_usb2phy_dt_match[] = {
> -	{ .compatible = "spacemit,k1-usb2-phy", },
> +	{ .compatible = "spacemit,k1-usb2-phy", .data = &spacemit_k1_usb2phy_ops },
> +	{ .compatible = "spacemit,k3-usb2-phy", .data = &spacemit_k3_usb2phy_ops },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, spacemit_usb2phy_dt_match);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
