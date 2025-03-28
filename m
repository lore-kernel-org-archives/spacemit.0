Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB2D23CB
	for <spacemit@lists.linux.dev>; Fri, 28 Mar 2025 17:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743182678; cv=none; b=lyViINqkBvTJPJd8SnF94+Bvw/ZUhSY0QkLf6bvR+/jjw6vRVJ0alcZA3oW3iBPj6z1iipkQjAJpQDWGhZZSjrovJNj1yoGma/+UWAiIPVqyZHhN6dJAPKZZRAulRk94RSkBbKvGS8+tAZfpm2cA3NEe2glEssL+Fyb5u2qmoMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743182678; c=relaxed/simple;
	bh=nEklW06M3v53fdnzxP4T3kBexookIkVk+rhEw0JCwpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ptYuTBnj30rjpIV+/CFtDgvbr1/PheeWe8kw0I3fAQZ6ro8eggEMyMN8tiMriUmAvBcn8Htwpg5lSR/vKHW0Ia7MaEg3thyI/EBbhC4cCTbTudihDaghtnjWhfTYcYbEGPvaRp7oei4HJ5P2JLPIRfW4iJF9kOSGtOVAzIzSiaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=bTZshjT3; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="bTZshjT3"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-72a4793d4e2so1553485a34.2
        for <spacemit@lists.linux.dev>; Fri, 28 Mar 2025 10:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1743182674; x=1743787474; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mzrxTuw1glnQc1Rwu7OVa3OJ84tPcZV4rNFQcBi3m6A=;
        b=bTZshjT3IGUGZgdZSuyVGBTGBeu0WQ6HBKy806QBbnAqN0omyR0zMSPGaio9tuSlqR
         PQqLIr8f1h/p2ka4TTKBGokdKZVZoymxCjSJyNTja9xXPmmRFnvkHs7YHq382Xxx/2xL
         EMB0QepFN28vc7V1EBf1JbaQ7Vgi2IU+16EtKUuL7NodAEuijVRGhmIfGxQkLJlvaego
         kRtaVTTS3hYkKNZ1jYSSHGZnr8eWxY5qUMeXUxh8uNydsjcQWJxDo1XXwSHJZFaHHdum
         A+i3Gia8VFtGaoaVBPVdPwRldE3zSXDEW/c7rZZygmdEDSjYSIYwrLSaIOimp2FT6Jub
         Zcsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743182674; x=1743787474;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mzrxTuw1glnQc1Rwu7OVa3OJ84tPcZV4rNFQcBi3m6A=;
        b=Yt+NiyGuC+4otjeC2vPNLGXpTPqOpzNpMtCJoPxp+Io/7CKUlDHrbwT8RzAyj/db+y
         ydEGQmtscxqnP3FGgeCRIoNLR3S994eELjA2VSS8duiPXMOXpo1Fu5kKsmiHbqmPyZJA
         v4kDvZzWlSiPBq77Uve+PTCpxZcfqYw5so9B2Dz0WJ5gzCbUy/K89Adzv6EoBwGaezJt
         AzMfLylBpgwvYnfdnLIifHzWLQT35GEdBeCy493ol+Qp4tt61C02lOX+KmCWhVZYyZa0
         LfyhOszAPP5GNQD2g2/AVy9JgSInS9APW/dCswe669Unb5zUxGMZCS5JMYS+9K41FsJj
         8h6w==
X-Forwarded-Encrypted: i=1; AJvYcCX4/4oaRje7cAzoGGr1/cTlt88x5/HI/1Z9YrayLoJt+teWppwLaU4iHvYN4jlp6wp8bzRMq0959A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQPEA0vCMFJTDznNZZ+OHfxoXFdnsRBrzSRHZoZwUP8z+hVVhY
	KFsS4XEtpvh+3SUtuWEuDl35CDBnspgnuXJEBBLBbMJJ4MqEzVHXM2P2w6vYQHw=
X-Gm-Gg: ASbGnctz+Hso805kFAxbDpsxtAnduW5eWpIEHEDUP5IDVXEC9i7S32cGo+PxYzQ6laZ
	yH+kKgmWvWOAk+kUXsabNr+aZsAvgt3M0LOi1xY4UxTZJxwvf6vNegJ87c5vLt+r0MKU4xhtfUk
	D+/6txia5p6NHuBba/ywWZYLkRVxzIWB9V9iACQKgn7gTMHe5G0ucgFLKsuv5YtJWD78P+bHGH6
	/EadxBqDsTUN1KLBK5e3ZxQ80IijMOP3ZRC/hmn9VBrQaBultfm3mGVuQwS6sobjovOzFEa1sNk
	gD+olhOGP8MrEdwun+pYvPiIWROttyVBqWSAKWPtbgN9bWxw5X7uiQGqoQm8nCwRl2PZvoaw9fX
	dYy44AE1V
X-Google-Smtp-Source: AGHT+IGyjy8B7DadiigM/xeS79qe+47ot9k7yWzDBDqfQeQidZF7a2d8EVjKnnq/rTcqt3/OlQlrZw==
X-Received: by 2002:a05:6830:264f:b0:72a:1a9f:7dc7 with SMTP id 46e09a7af769-72c6378f5b5mr131526a34.7.1743182673484;
        Fri, 28 Mar 2025 10:24:33 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-602844e6574sm401475eaf.2.2025.03.28.10.24.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 10:24:33 -0700 (PDT)
Message-ID: <3cccf190-112c-47d4-997e-3b3cf5e7a29e@riscstar.com>
Date: Fri, 28 Mar 2025 12:24:31 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 2/7] clk: spacemit: define struct k1_ccu_data
To: Yixun Lan <dlan@gentoo.org>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heylenay@4d2.org,
 guodong@riscstar.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-3-elder@riscstar.com> <20250322155034-GYB11633@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250322155034-GYB11633@gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/22/25 10:50 AM, Yixun Lan wrote:
> Hi Alex:
> 
> this patch change relate to clock only, so how about let's fold
> it into clk patches (which now has not been merged), so we make
> the code right at first place? cause some moving around and renaming

I realize now I didn't respond to your other comments.

You suggested incorporating this change in the clock patches,
but I believe Haylen wants to avoid doing that (or doesn't want
to use all of it, anyway).

> 
> On 10:18 Fri 21 Mar     , Alex Elder wrote:
>> Define a new structure type to be used for describing the OF match data.
>> Rather than using the array of spacemit_ccu_clk structures for match
>> data, we use this structure instead.
>>
>> Move the definition of the spacemit_ccu_clk structure closer to the top
>> of the source file, and add the new structure definition below it.
>>
>> Shorten the name of spacemit_ccu_register() to be k1_ccu_register().
> any good reason to change this? it make the code style inconsistent,
> do you just change it for shorten function, or want it to be more k1
> specific, so next SoC - e.g maybe k2? will introduce another function?

I think I was trying to shorten things.  At this point it's hard
to know which things are K1-specific and which things will be
generic for anything from SpacemiT.  Once something new comes
along the code will be updated based on what needs to change.

That said, I'll not rename this, and I will use "spacemit" rather
than "k1" in all of the new symbols I create.

>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/clk/spacemit/ccu-k1.c | 58 ++++++++++++++++++++++++++---------
>>   1 file changed, 43 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
>> index 44db48ae71313..f7367271396a0 100644
>> --- a/drivers/clk/spacemit/ccu-k1.c
>> +++ b/drivers/clk/spacemit/ccu-k1.c
>> @@ -129,6 +129,15 @@
>>   #define APMU_EMAC0_CLK_RES_CTRL		0x3e4
>>   #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
>>   
>> +struct spacemit_ccu_clk {
>> +	int id;
>> +	struct clk_hw *hw;
>> +};
>> +
>> +struct k1_ccu_data {
>> +	struct spacemit_ccu_clk *clk;		/* array with sentinel */
>> +};
>> +
>>   /*	APBS clocks start	*/
>>   
>>   /* Frequency of pll{1,2} should not be updated at runtime */
>> @@ -1359,11 +1368,6 @@ static CCU_GATE_DEFINE(emmc_bus_clk, CCU_PARENT_HW(pmua_aclk),
>>   		       0);
>>   /*	APMU clocks end		*/
>>   
>> -struct spacemit_ccu_clk {
>> -	int id;
>> -	struct clk_hw *hw;
>> -};
>> -
>>   static struct spacemit_ccu_clk k1_ccu_apbs_clks[] = {
>>   	{ CLK_PLL1,		&pll1.common.hw },
>>   	{ CLK_PLL2,		&pll2.common.hw },
>> @@ -1403,6 +1407,10 @@ static struct spacemit_ccu_clk k1_ccu_apbs_clks[] = {
>>   	{ 0,			NULL },
>>   };
>>   
>> +static const struct k1_ccu_data k1_ccu_apbs_data = {
>> +	.clk		= k1_ccu_apbs_clks,
>> +};
>> +
>>   static struct spacemit_ccu_clk k1_ccu_mpmu_clks[] = {
>>   	{ CLK_PLL1_307P2,	&pll1_d8_307p2.common.hw },
>>   	{ CLK_PLL1_76P8,	&pll1_d32_76p8.common.hw },
>> @@ -1440,6 +1448,10 @@ static struct spacemit_ccu_clk k1_ccu_mpmu_clks[] = {
>>   	{ 0,			NULL },
>>   };
>>   
>> +static const struct k1_ccu_data k1_ccu_mpmu_data = {
>> +	.clk		= k1_ccu_mpmu_clks,
>> +};
>> +
>>   static struct spacemit_ccu_clk k1_ccu_apbc_clks[] = {
>>   	{ CLK_UART0,		&uart0_clk.common.hw },
>>   	{ CLK_UART2,		&uart2_clk.common.hw },
>> @@ -1544,6 +1556,10 @@ static struct spacemit_ccu_clk k1_ccu_apbc_clks[] = {
>>   	{ 0,			NULL },
>>   };
>>   
>> +static const struct k1_ccu_data k1_ccu_apbc_data = {
>> +	.clk		= k1_ccu_apbc_clks,
>> +};
>> +
>>   static struct spacemit_ccu_clk k1_ccu_apmu_clks[] = {
>>   	{ CLK_CCI550,		&cci550_clk.common.hw },
>>   	{ CLK_CPU_C0_HI,	&cpu_c0_hi_clk.common.hw },
>> @@ -1610,9 +1626,13 @@ static struct spacemit_ccu_clk k1_ccu_apmu_clks[] = {
>>   	{ 0,			NULL },
>>   };
>>   
>> -static int spacemit_ccu_register(struct device *dev,
>> -				 struct regmap *regmap, struct regmap *lock_regmap,
>> -				 const struct spacemit_ccu_clk *clks)
>> +static const struct k1_ccu_data k1_ccu_apmu_data = {
>> +	.clk		= k1_ccu_apmu_clks,
>> +};
>> +
>> +static int k1_ccu_register(struct device *dev, struct regmap *regmap,
>> +			   struct regmap *lock_regmap,
>> +			   struct spacemit_ccu_clk *clks)
>>   {
>>   	const struct spacemit_ccu_clk *clk;
>>   	int i, ret, max_id = 0;
>> @@ -1648,15 +1668,24 @@ static int spacemit_ccu_register(struct device *dev,
>>   
>>   	clk_data->num = max_id + 1;
>>   
>> -	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
>> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
>> +	if (ret)
>> +		dev_err(dev, "error %d adding clock hardware provider\n", ret);
>> +
>> +	return ret;
> I'd use "return 0;", nothing different, just explicitly short

That would mean the caller doesn't know about this error.
Why do that?  The caller is free to ignore it (but really,
shouldn't).  I think it's important to pass this information
back.  I'm going to keep this "return ret" in v2.

> 
> ok, I can understand this change ease debug procedure once there is problem.
> (but I'm fine with either way, failure should rarely happen & will
> identify early)
> 
>>   }
>>   
>>   static int k1_ccu_probe(struct platform_device *pdev)
>>   {
>>   	struct regmap *base_regmap, *lock_regmap = NULL;
>>   	struct device *dev = &pdev->dev;
>> +	const struct k1_ccu_data *data;
>>   	int ret;
>>   
>> +	data = of_device_get_match_data(dev);
>> +	if (!data)
>> +		return -EINVAL;
>> +
>>   	base_regmap = device_node_to_regmap(dev->of_node);
>>   	if (IS_ERR(base_regmap))
>>   		return dev_err_probe(dev, PTR_ERR(base_regmap),
>> @@ -1677,8 +1706,7 @@ static int k1_ccu_probe(struct platform_device *pdev)
>>   					     "failed to get lock regmap\n");
>>   	}
>>   
>> -	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap,
>> -				    of_device_get_match_data(dev));
>> +	ret = k1_ccu_register(dev, base_regmap, lock_regmap, data->clk);
>>   	if (ret)
>>   		return dev_err_probe(dev, ret, "failed to register clocks\n");
>>   
>> @@ -1688,19 +1716,19 @@ static int k1_ccu_probe(struct platform_device *pdev)
>>   static const struct of_device_id of_k1_ccu_match[] = {
>>   	{
>>   		.compatible	= "spacemit,k1-pll",
>> -		.data		= k1_ccu_apbs_clks,
>> +		.data		= &k1_ccu_apbs_data,
>>   	},
>>   	{
>>   		.compatible	= "spacemit,k1-syscon-mpmu",
>> -		.data		= k1_ccu_mpmu_clks,
>> +		.data		= &k1_ccu_mpmu_data,
>>   	},
>>   	{
>>   		.compatible	= "spacemit,k1-syscon-apbc",
>> -		.data		= k1_ccu_apbc_clks,
>> +		.data		= &k1_ccu_apbc_data,
>>   	},
>>   	{
>>   		.compatible	= "spacemit,k1-syscon-apmu",
>> -		.data		= k1_ccu_apmu_clks,
>> +		.data		= &k1_ccu_apmu_data,
>>   	},
>>   	{ }
> 	{ /* sentinel */ }

I think this is unnecessary but I'll do it--you're the SpacemiT
maintainer so you can define the style you want.

					-Alex

>>   };
>> -- 
>> 2.43.0
>>
> 

