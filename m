Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C113FAD4B
	for <spacemit@lists.linux.dev>; Mon, 17 Mar 2025 21:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742247778; cv=none; b=uk3moyValEWIg/dj0I2FpE1UwaIuY5CrOvgXACjzGqxQ1B9FKmNvCDq6TnqLqxEdDOcqiAq1uqa6/VbxnfE6OYSwLvYVhuJNA0OOGeIcbm5Ri4xiTJkTiEwEMUs/vPo0Fp5rg7qSIZplV4mIj2VTRy83BWM4QQYZYwPTWhfuT9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742247778; c=relaxed/simple;
	bh=zPMLSIbcEHCIBbYioUkgyTeI/GFgQyoai43qShSaFtU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ju11ydCoE8DJq2PBEESimwZio7/NMAKiaDqBO908E9H2+Vq8RpX/JOp3SbqP4ykLlhJc4qtZo9LGyXWK0ETjv0fs4xmCL1bjDpzps75TFtK5u5sTDW8aJlyBIrmXH7H77CMfCVVPHg3MemiSl89cQC0//zg39I9aivBhjw+F5Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=e2AXRX97; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="e2AXRX97"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3d3db3b68a7so54017265ab.0
        for <spacemit@lists.linux.dev>; Mon, 17 Mar 2025 14:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1742247774; x=1742852574; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/3xQ5zZmXUjhGDYgf9JDZwTpw40dRx5XKZ5GtTioiJg=;
        b=e2AXRX976RK+riQgI8TTIdkCZHeO6tW8WtnijkHyLYTmHKGnHAE0mAap3ZummHLjzP
         KcA/srYxtSwF7WgFFkynSB0JCUitZqg4xnOWqV31UQp9+X9l3j/rHyXd3YOVj4WbXc2y
         AsvGjdYzy/0PsKxv8mo9YVYDQoIdugRJ0HpJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742247774; x=1742852574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/3xQ5zZmXUjhGDYgf9JDZwTpw40dRx5XKZ5GtTioiJg=;
        b=SA35+FUBYtbD2d6sYA+S2S2SBRGXm8fEOqf/snlb+0/a/aq+9nCilKoq4+laLAF5BY
         CEyw9H08axfTiye0SEK7rkBxyxPnIRkf/KzEXBEvTcipX3+5/t/J9U3juXajuFWKjFGv
         +VNP/Fmg0iAzbk6yZRTm9aN5EP2njDqHLEURKZ73G6H2T6bHock9kS3lJUBGGLz2YU8Y
         PnxY8poldhkLyZoVH3O2tu2YzS0GjMy2KCBu50Z9bdmAxqW0tHRPSkrDi2J7BbMFCK6C
         XJK/TCEOv9VT5D6EZa3w9gL9rB/VI88LN6vmDJO0ZocDC3+sIr/E2j89Pvx5aYi1BWaY
         sJ0A==
X-Forwarded-Encrypted: i=1; AJvYcCXvhRWfDFqF5iGXeWfA47eAnEr2CTJ2DRiMQz7x0sF8UXfWjQWqY9n08YphEcws2oYq1NfkH2rTfQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmEpTDLs4VbUVGSkk0O5jL9/cpIwN+nmURyhErefZR8ZaalR+H
	LUtlHW+U0rYJxyBJInktUjbBpsP9ti+VinwN/+pBrhtLF/R6BKrzllZnTlzYTQ==
X-Gm-Gg: ASbGncsRuaN72t4NRCeWvD1rOUn1/SzSQ2qHnTiHxg1z6o1r5xQs/Po2TMnmu5Xk/Rm
	zbMZaZ47TaWI0NI+uy1WhQMkpZHshzS0IGwUN/8O5udVO8WF9E5by95VHsv1TDOeUrOufjCMegF
	hz0A7R96To5jxqr4w+5G7IXTFnbGeATVrQkhumlL7QDeTKJSpl3kCpsaghYh16KAIFq29PrH4Ri
	qXu9igJ7WqBYrC8XsaGqja+EHpOcSeq2NcWWboWbW+UqFZYp63Y9pj88dR0bbhSb96OFw9kxg28
	0L+sKuuc04j/bQhpBKyAPDpe0gwmDnYUyjN+oJPin2YYdZSV9bw4koI5oM8x5X52Q+wBlCMRijm
	FRcQ=
X-Google-Smtp-Source: AGHT+IFodoEZ0iTIZiA6FhVLkShreO9KYufA0wdJJTCzNeJU0iLZRijzbSwcc1+/UDyTpRTIB0KdFg==
X-Received: by 2002:a05:6e02:12e8:b0:3d4:6f37:3748 with SMTP id e9e14a558f8ab-3d483a6ef52mr154160345ab.16.1742247773772;
        Mon, 17 Mar 2025 14:42:53 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-4f2637faa36sm2431266173.77.2025.03.17.14.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 14:42:53 -0700 (PDT)
Message-ID: <401059d0-6b2c-4c40-8c4d-51749dca27f3@ieee.org>
Date: Mon, 17 Mar 2025 16:42:51 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
To: Troy Mitchell <troymitchell988@gmail.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, Alex Elder <elder@riscstar.com>
References: <20250316-k1-i2c-master-v7-0-f2d5c43e2f40@gmail.com>
 <20250316-k1-i2c-master-v7-2-f2d5c43e2f40@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250316-k1-i2c-master-v7-2-f2d5c43e2f40@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/16/25 2:43 AM, Troy Mitchell wrote:
> This patch introduces basic I2C support for the SpacemiT K1 SoC,
> utilizing interrupts for transfers.
> 
> The driver has been tested using i2c-tools on a Bananapi-F3 board,
> and basic I2C read/write operations have been confirmed to work.
> 
> Reviewed-by: Alex Elder <elder@riscstar.com>
> Link: https://lore.kernel.org/all/20250128-k1-maintainer-1-v1-1-e5dec4f379eb@gentoo.org [1]
> Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>

I know I said it was fine, but I'm going to reiterate two comments in
the probe function.

> ---
>   drivers/i2c/busses/Kconfig  |  17 ++
>   drivers/i2c/busses/Makefile |   1 +
>   drivers/i2c/busses/i2c-k1.c | 605 ++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 623 insertions(+)
> 

. . .

> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..ae43dcd31e8aa480766b44be91656657c7aaaf4a
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -0,0 +1,605 @@

. . .

> +static int spacemit_i2c_probe(struct platform_device *pdev)
> +{
> +	struct clk *clk;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *of_node = pdev->dev.of_node;
> +	struct spacemit_i2c_dev *i2c;
> +	int ret;
> +
> +	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
> +	if (!i2c)
> +		return -ENOMEM;
> +
> +	ret = of_property_read_u32(of_node, "clock-frequency", &i2c->clock_freq);
> +	if (ret)
> +		dev_warn(dev, "failed to read clock-frequency property\n");

If the property doesn't exist, I don't think this warrants a warning,
because it's optional.  Perhaps if a different error (something other
than -EINVAL) is returned it would warrant a warning.

> +
> +	/* For now, this driver doesn't support high-speed. */
> +	if (!i2c->clock_freq || i2c->clock_freq < 1 ||

For an unsigned value, !i2c->clock_freq is *the same as*
i2c->clock_freq < 1.  Get rid of the latter.

I'll leave it up to the maintainer to decide whether these
comments can just be ignored--my Reviewed-by is fine, even
if you don't change these.

					-Alex

> +	    i2c->clock_freq > SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
> +		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
> +			 i2c->clock_freq, SPACEMIT_I2C_MAX_FAST_MODE_FREQ);
> +		i2c->clock_freq = SPACEMIT_I2C_MAX_FAST_MODE_FREQ;
> +	} else if (i2c->clock_freq < SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {
> +		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
> +			 i2c->clock_freq,  SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ);
> +		i2c->clock_freq = SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ;
> +	}
> +
> +	i2c->dev = &pdev->dev;
> +
> +	i2c->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(i2c->base))
> +		return dev_err_probe(dev, PTR_ERR(i2c->base), "failed to do ioremap");
> +
> +	i2c->irq = platform_get_irq(pdev, 0);
> +	if (i2c->irq < 0)
> +		return dev_err_probe(dev, i2c->irq, "failed to get irq resource");
> +
> +	ret = devm_request_irq(i2c->dev, i2c->irq, spacemit_i2c_irq_handler,
> +			       IRQF_NO_SUSPEND | IRQF_ONESHOT, dev_name(i2c->dev), i2c);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to request irq");
> +
> +	clk = devm_clk_get_enabled(dev, "func");
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable func clock");
> +
> +	clk = devm_clk_get_enabled(dev, "bus");
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock");
> +
> +	spacemit_i2c_reset(i2c);
> +
> +	i2c_set_adapdata(&i2c->adapt, i2c);
> +	i2c->adapt.owner = THIS_MODULE;
> +	i2c->adapt.algo = &spacemit_i2c_algo;
> +	i2c->adapt.dev.parent = i2c->dev;
> +	i2c->adapt.nr = pdev->id;
> +
> +	i2c->adapt.dev.of_node = of_node;
> +
> +	strscpy(i2c->adapt.name, "spacemit-i2c-adapter", sizeof(i2c->adapt.name));
> +
> +	init_completion(&i2c->complete);
> +
> +	platform_set_drvdata(pdev, i2c);
> +
> +	ret = i2c_add_numbered_adapter(&i2c->adapt);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "failed to add i2c adapter");
> +
> +	return 0;
> +}
> +
> +static void spacemit_i2c_remove(struct platform_device *pdev)
> +{
> +	struct spacemit_i2c_dev *i2c = platform_get_drvdata(pdev);
> +
> +	i2c_del_adapter(&i2c->adapt);
> +}
> +
> +static const struct of_device_id spacemit_i2c_of_match[] = {
> +	{ .compatible = "spacemit,k1-i2c", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, spacemit_i2c_of_match);
> +
> +static struct platform_driver spacemit_i2c_driver = {
> +	.probe = spacemit_i2c_probe,
> +	.remove = spacemit_i2c_remove,
> +	.driver = {
> +		.name = "i2c-k1",
> +		.of_match_table = spacemit_i2c_of_match,
> +	},
> +};
> +module_platform_driver(spacemit_i2c_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("I2C bus driver for SpacemiT K1 SoC");
> 

