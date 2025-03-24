Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C30C25DCF8
	for <spacemit@lists.linux.dev>; Mon, 24 Mar 2025 12:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742818642; cv=none; b=gBoFP65IuZM0AHjq/12jPRbgbTrIX0OyDKXwG9BRy0ZIk+j+Ayy5vTJg7gNh6aDIS+92QG9MVLYWPMzJb/T/ozzhU4qcBYeIRCd5iOHpvMsAoKSC+wNAGrirP5q5ugEGmdG8h9DCNiaOngp1Pni5/enrBSpGVldMpGZlUyXfIsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742818642; c=relaxed/simple;
	bh=EoiGMOryV4mIY4EbvcMo7ArzQaAHcSCytklybxuMWPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ay8VKD4pzbBKHbXbVHMxwpi2yB3uzQdaOjeVO6bnkS9XDJX/u3oNOHSmZlDkS3/m2cRBm+mXA3YZxs5S/Q/wkj9Tjd290tEWUsdieR5OgU+dbQqONNypNx7O4k86GfxKwbsmhaQpNF/q5G8fKRf+neImHEBSS9oyMcQcOW2zE8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=MLV99tVt; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="MLV99tVt"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-855fc51bdfcso146852439f.0
        for <spacemit@lists.linux.dev>; Mon, 24 Mar 2025 05:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742818640; x=1743423440; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pQjy7+DZqFOo8SThpv8muVN+XmMk5JDMXBX8K79zwoY=;
        b=MLV99tVtuoOaX7hDu1Co2EmRTVmyxhJcaUGJ2XHPet21ySQrMSvPFTD6bB6UbRZs7e
         BjzW8KWiUGPsgyoh+O7c2cCyGVcRUI4Bw+mz2bWU0u6pISxp1DmR8g1tu+sRuV07VJMY
         JxBG3w8HKENzRVt9LdV9JY6vFaz6jfRjADQw8ZNC8LGm3pkMIVPAn+yxBePWdHGmEwRV
         q+eyqimxd03hGscIsBs2cFphf1rBLgYXvpqUIdbimEouA7k+maKLVBQhaOVjBdOf8CYD
         uJTmd39koOq86tyvPntUy9o7myRIkA2f+nk5hzhMT0Wlzdyr0blXBsNA7rr9D/Bby0Im
         Ftzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742818640; x=1743423440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pQjy7+DZqFOo8SThpv8muVN+XmMk5JDMXBX8K79zwoY=;
        b=fEVF0xM415jDx3XcqqSmNmkM58aZJXemdm3ZeDm3SSp7BZgP7pVvYdpSMi8iXNpKp+
         2puAgkhdwYSM1XVZKm5sar9n9i27Dmb4mG0Sb+dvzQ2zceCNu742QTaZEhXPs0LPvJ57
         be0imqD5eYfjsc9o4ARkyeXCHm/ly1KasUKUxRxV2ygubMGQiHDEF4gs8ibTs7xsX2xm
         4mQ4sOhKnFlsIIrGGeuI6NmlqU1hZELoQ5ei4yi51+yQ4FpiBjb1ZIJ0RmMH8c0HOmE6
         pV26ojYHUt8dYJKN/BMqwnWxaONIBBk/sQRdyoGUub6MNfUVEICYyuqJoLw+QOy6ztkj
         zV/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXlGQRmyQtJsLBabg4VXQHnIAnLZ5E8CFlD+Lo60q+0ViJ/5YNsJYyt7Jj5hLIo6+7hD6O2GDqmpg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMMDlFQ4ApTiHa/CraoiNvBtw921bCGO7usP2+YXa1hLAzzy1W
	RIARSBqDBIO2STkYKGHmsw1/pLxkqrOeZiXuDAf/1hRy+/mT0B07HiqG7TUd7r4=
X-Gm-Gg: ASbGncsQJq0n6ToQikgC1mXOznOBx3IbN2ksja/taS6SvyY7bHicovRyr/Df+75UnxF
	V7y4fL5mHnVlOT42OvxAHhVhk+AxPtPn5zS/B74ieQHD1KDRuMkRHa7Wom4YfVteUYoU83BdTYf
	LRpB5ctr+4TJCPNizHkDnP73wJ48GpB+8BTLxiJCaKEYItCWT2J2r93s2hiwwCQ0zb5jgUzOYdp
	TY4EzUygux41EGO/IWwLg/Dkl6j9GkBCQWLMOtHl7hpNMwW3Urnz2gSKDyYfy3zhObG5AMiWCdj
	z0wIyrKKL9xEWHFPaBd2tkoW0HTPibbE/lRC1axXUvmwPN+wlMgU2A7TfIXYFABX1TYcdpTkNg+
	GZw0oAgQ6TTM3ERIMkyKICVvzhlK/
X-Google-Smtp-Source: AGHT+IFRMWJu8cQwf/wCsj/90WfTQghFt/WjaXKq/fnbgU/ftzK6xeINV2Af8c2Selfxs/zF8TcQyA==
X-Received: by 2002:a05:6602:7410:b0:85d:ad56:af88 with SMTP id ca18e2360f4ac-85e1ee299f1mr1629181439f.1.1742818639889;
        Mon, 24 Mar 2025 05:17:19 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85e2bd8c42esm160016039f.30.2025.03.24.05.17.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 05:17:19 -0700 (PDT)
Message-ID: <b8edc46b-bc99-47c1-8900-0e08c97de9d6@riscstar.com>
Date: Mon, 24 Mar 2025 07:17:17 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 2/7] clk: spacemit: define struct k1_ccu_data
To: Haylen Chu <heylenay@4d2.org>, p.zabel@pengutronix.de,
 mturquette@baylibre.com, sboyd@kernel.org, dlan@gentoo.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 guodong@riscstar.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-3-elder@riscstar.com> <Z-FHt3mDyEBKpa8O@ketchup>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <Z-FHt3mDyEBKpa8O@ketchup>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/24/25 6:53 AM, Haylen Chu wrote:
> On Fri, Mar 21, 2025 at 10:18:25AM -0500, Alex Elder wrote:
>> Define a new structure type to be used for describing the OF match data.
>> Rather than using the array of spacemit_ccu_clk structures for match
>> data, we use this structure instead.
>>
>> Move the definition of the spacemit_ccu_clk structure closer to the top
>> of the source file, and add the new structure definition below it.
>>
>> Shorten the name of spacemit_ccu_register() to be k1_ccu_register().
> 
> I've read your conversation about moving parts of the patch into the
> clock series, I'm of course willing to :)
> 
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
> 
> This is something like what I've dropped in v5 of the clock series so I
> doubt whether it should be added back in clock series again, as at that
> point there's no reason for an extra structure: Alex, is it okay for you
> to keep the change in reset series?

That's perfectly fine with me.  It's not necessary yet, so it's
just fine for you to do things the way you did, and I'll add this
in as part of the reset series.

> ...
> 
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
> 
> This error message definitely should go in the clock series.
> 
>> +	return ret;
>>   }
> 
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
> 
> Looking through the reset series, I don't see a reason that
> of_device_get_match_data() could return NULL. This is also something
> you've asked me to drop in v4 of the clock series, so I guess it isn't
> necessary.

You are correct.  I'll drop it.  I contemplated this and thought
it's useful to tell the reader it's necessary to not be null, but
you can tell it has to be by inspection.


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
> 
> For using ARRAY_SIZE() to simplify runtime code, it's mostly okay since
> binding IDs are continuous 0-based integers. But I split the handling of
> TWSI8 into another patch, which creates a hole in the range and breaks
> the assumption. Do you think the TWSI8 commit should be merged back in
> the clock driver one?

I didn't understand the reason why you separated the TWSI8 into a
separate commit.  Now I know.  The hole in the range doesn't really
matter much; you already initialize your ->hws[] array of pointers
with ERR_PTR(-ENOENT), so any holes are handled properly.

					-Alex
> 
> Best regards,
> Haylen Chu

