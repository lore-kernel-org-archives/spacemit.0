Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF81C2550D3
	for <spacemit@lists.linux.dev>; Wed, 25 Jun 2025 22:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750889464; cv=none; b=WmMCszPsjA/9VqVKPXjMkLJLVciIkfvuW9JX2IvmCkmvne1IEDtiTmaY6MmhWUxLtApUKAg61WtHAinsf32CenWiMlsV+BU6BeHYu2QAnFtg0wpXZ+9C6SNCbmKmdd14y1TAOre7McmMGpDrodQExbv17KkrtzJDcqaaqFfRcSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750889464; c=relaxed/simple;
	bh=fMV7Fv3bE5reYHrMs+H+GDgGCXhMWYwP1GPWJORDReU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MlwPdFnL6mR2uRVcLu0lekD0gAzt53r28ZfsQO/4dpCxyAPsBPicHRXxxiCwDLxBVPyiKcUWVQ8UMJNNMsJeJw6QOFGWSGkGRgTyhmj8sj+ZpPsDfVAXgJkjuZJdlApKCcm2xjNjSNrSqqk2nbPtF/ULP0VeIU+pZPykDPeXwAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=uHbONxVo; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="uHbONxVo"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3df2f937370so1558225ab.3
        for <spacemit@lists.linux.dev>; Wed, 25 Jun 2025 15:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750889462; x=1751494262; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XPg8khamQ0n3Un0f5D3NLY/jQXcOqvv2U1B/Sm+t1ps=;
        b=uHbONxVo57aoeTv+k+hy5GGnRcSATVdTxT2wmv95cLzUzcEIIj+AqTobSglK2Js4hy
         8Cf7GQSF1Xg2Pfj7kafiD7hDxDoAj4vhtOpit9Fl+K9RZynBhjwxUTeHHnuS8tO12vTt
         448VLjBuPT6/2DEcem6Y/sLrJenFyezeNgqVYqRShxMebW6QxDReR38ro3MR67qK+OyE
         BDa0zbBt2iJHnRaBOvr0FVAsTl+YElHHvQ8y8IFwE0Bvqh66In1hlP66goc/mIeuOx4S
         UfQA3G2p0MkIIMfH2VPvCoQ1dgWDQ4Cpn99Isq5zdlFBZwvdBciEB/rvrQ2ff+IibIxT
         P6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750889462; x=1751494262;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XPg8khamQ0n3Un0f5D3NLY/jQXcOqvv2U1B/Sm+t1ps=;
        b=i69NbM4aazXXyqyX5qM4apJmxE7lp2w9FQ3/OsydJoc3WkG+q5WpqtvWKJ+AstdoeT
         GQ2z7eExODNB9CJ9sPQb8zCpjeHc8HfR/yn7DmC+dTogXb1bN1TZXDAR+RCe/sxbO5K6
         V3ELN5xvcWKcjPztzSvbzuamVIV5zCAwFdIbGlVkndjRfi7Uz0NfzVEb4BxlYe12B221
         O4OrWtce+YsFpJABbjO5i79up2tw+1wc4WFzgz3f+Dkd8aZAgUo8HexpBAcqC5fdAzNP
         HJUls3+sMVboHaConTJ+AAEnxDS9mM467o8H1xVGcJsjvtC5MQM3MqCsM49Ub6BfMbdG
         0ZiA==
X-Forwarded-Encrypted: i=1; AJvYcCV7ifhtboviFKZRw2YvVtpvsDkO8myJ5HKTQiUtZyTU5kOuBBltzU85WuBWY3ry0OMvrgRKQS8LVA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxzT4WdP+cjX0F+B5T/2pxO4w7dmd5bRizezooihNHrC8ShqEdo
	tSzd45U7UOiVTNXuX2JnLF3tSqY5u1oQXGz8xu+9gc+N0IAruvK/5rQL2k+M8v2S6eU=
X-Gm-Gg: ASbGncslbSsOO01NJlZKGTIu1kby6JeZx4Pn62Ypvn9zZtQU2iS82OgdJoqPr5HPHdt
	DAaaNs6zaElwxHorRUpCiycUzggYPThDulNnd3JAiYBF0FQUNNZjtbPt6VnckjFVC0yk5rLpGWB
	JhoWSZzfsmwWt6U90zq0MztgW8QEbQzH0uOz6/71/eIv5Ln2AzCPVVyDdpFQHa6LGKM7YmE4GiL
	pK+Xs/hIAh46UDnqPk8tf49M5NvP8GbW0agXHfJJGPyqJAxVjCHOQlzkIJcNXQzy6BImDiqgsW+
	/pKHxt4SJEs2CODouDiorE2ldDbvBlxAfh/GZZgKSAtQzwzAJNMuWB3MywNH1cLXXV0R0lOuqmj
	o68kCTfZisX4Gh0bzBCXlG2rkkQ==
X-Google-Smtp-Source: AGHT+IE+u9IjJy5DnG3IQAouxiGs+RqUt0Ha90G1K5TW/7uCSs9nbBzWj+oWsSVfWQZ0oTWVcwd35w==
X-Received: by 2002:a05:6e02:16cb:b0:3df:3be7:59d1 with SMTP id e9e14a558f8ab-3df3be7658cmr35101075ab.11.1750889461833;
        Wed, 25 Jun 2025 15:11:01 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3df2d32d228sm13202125ab.41.2025.06.25.15.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 15:10:56 -0700 (PDT)
Message-ID: <a99ad08a-99b2-4e39-a2d1-28302d312735@riscstar.com>
Date: Wed, 25 Jun 2025 17:10:54 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] rtc: spacemit: support the SpacemiT P1 RTC
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: lee@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, mat.jonczyk@o2.pl, dlan@gentoo.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, troymitchell988@gmail.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250625164119.1068842-1-elder@riscstar.com>
 <20250625164119.1068842-5-elder@riscstar.com>
 <202506252201262779aa6c@mail.local>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <202506252201262779aa6c@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/25/25 5:01 PM, Alexandre Belloni wrote:
> On 25/06/2025 11:41:15-0500, Alex Elder wrote:
>> +/*
>> + * The P1 hardware documentation states that the register values are
>> + * latched to ensure a consistent time snapshot within the registers,
>> + * but these are in fact unstable due to a bug in the hardware design.
>> + * So we loop until we get two identical readings.
>> + */
>> +static int p1_rtc_read_time(struct device *dev, struct rtc_time *t)
>> +{
>> +	struct p1_rtc *p1 = dev_get_drvdata(dev);
>> +	struct regmap *regmap = p1->regmap;
>> +	u32 count = RTC_READ_TRIES;
>> +	u8 times[2][6];
>> +	size_t size;
>> +	u32 i = 0;
>> +	u8 *time;
>> +	int ret;
>> +
>> +	size = sizeof(times[0]);
>> +	ret = regmap_bulk_read(regmap, RTC_TIME, times[i], size);
>> +	if (ret)
>> +		return ret;
>> +
>> +	do {
>> +		i = 1 - i;
>> +		ret = regmap_bulk_read(regmap, RTC_TIME, times[i], size);
>> +		if (ret)
>> +			return ret;
>> +	} while (memcmp(times[i], times[1 - i], size) && --count);
> 
> Simply checking the seconds is enough, unless you expect regmap_bulk_read to ake
> more than a minute so you don't need a two dimension array.

I hadn't thought it through, but you're right.  I'll still
do bulk reads but will save only the seconds register and
compare it to the previous.

> 
>> +
>> +	if (!count)
>> +		return -EIO;
>> +
>> +	time = &times[0][0];
>> +
>> +	t->tm_sec = time[0] & GENMASK(5, 0);
>> +	t->tm_min = time[1] & GENMASK(5, 0);
>> +	t->tm_hour = time[2] & GENMASK(4, 0);
>> +	t->tm_mday = (time[3] & GENMASK(4, 0)) + 1;
>> +	t->tm_mon = time[4] & GENMASK(3, 0);
>> +	t->tm_year = (time[5] & GENMASK(5, 0)) + 100;
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * The P1 hardware documentation states that values in the registers are
>> + * latched so when written they represent a consistent time snapshot.
>> + * Nevertheless, this is not guaranteed by the implementation, so we must
>> + * disable the RTC while updating it.
>> + */
>> +static int p1_rtc_set_time(struct device *dev, struct rtc_time *t)
>> +{
>> +	struct p1_rtc *p1 = dev_get_drvdata(dev);
>> +	struct regmap *regmap = p1->regmap;
>> +	u8 time[6];
>> +	int ret2;
>> +	int ret;
>> +
>> +	time[0] = t->tm_sec;
>> +	time[1] = t->tm_min;
>> +	time[2] = t->tm_hour;
>> +	time[3] = t->tm_mday - 1;
>> +	time[4] = t->tm_mon;
>> +	time[5] = t->tm_year - 100;
>> +
>> +	/* Disable the RTC to update; re-enable again when done */
>> +	ret = regmap_update_bits(regmap, RTC_CTRL, RTC_EN, 0);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_bulk_write(regmap, RTC_TIME, time, sizeof(time));
>> +
> Honnestly, I'd simply go for
> 
> 	if (ret)
> 		return ret;
> 
> Here, you are trying to set the time, I'm not sure it is worth trying to
> reenable the rtc while hoping the previous time has been kept.

OK.  I normally at least try to return to the original state
even when errors occur.

I don't know who updates the RTC, but I suppose if any error
occurs writing a value they should assume it's "not working".

> This also shows that p1_rtc_read_time should check that RTC_EN is set, else it
> knows the time has never been set and is invalid.

That's a good point.  I'll add a check.  And with that it should
be fine to return without re-enabling.

Thanks for your review.  I'll wait until tomorrow to send the
next version.

					-Alex

>> +	ret2 = regmap_update_bits(regmap, RTC_CTRL, RTC_EN, RTC_EN);
>> +
>> +	return ret ? : ret2;		/* Return the first error */
> 
> 
>> +}
>> +
>> +static const struct rtc_class_ops p1_rtc_class_ops = {
>> +	.read_time = p1_rtc_read_time,
>> +	.set_time = p1_rtc_set_time,
>> +};
>> +
>> +static int p1_rtc_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct rtc_device *rtc;
>> +	struct p1_rtc *p1;
>> +
>> +	p1 = devm_kzalloc(dev, sizeof(*p1), GFP_KERNEL);
>> +	if (!p1)
>> +		return -ENOMEM;
>> +	dev_set_drvdata(dev, p1);
>> +
>> +	p1->regmap = dev_get_regmap(dev->parent, NULL);
>> +	if (!p1->regmap)
>> +		return dev_err_probe(dev, -ENODEV, "failed to get regmap\n");
>> +
>> +	rtc = devm_rtc_allocate_device(dev);
>> +	if (IS_ERR(rtc))
>> +		return dev_err_probe(dev, PTR_ERR(rtc),
>> +				     "error allocating device\n");
>> +	p1->rtc = rtc;
>> +
>> +	rtc->ops = &p1_rtc_class_ops;
>> +	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
>> +	rtc->range_max = RTC_TIMESTAMP_END_2063;
>> +
>> +	clear_bit(RTC_FEATURE_ALARM, rtc->features);
>> +	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->features);
>> +
>> +	return devm_rtc_register_device(rtc);
>> +}
>> +
>> +static struct platform_driver p1_rtc_driver = {
>> +	.probe = p1_rtc_probe,
>> +	.driver = {
>> +		.name = MOD_NAME,
>> +	},
>> +};
>> +
>> +module_platform_driver(p1_rtc_driver);
>> +
>> +MODULE_DESCRIPTION("SpacemiT P1 RTC driver");
>> +MODULE_LICENSE("GPL");
>> +MODULE_ALIAS("platform:" MOD_NAME);
>> -- 
>> 2.45.2
>>
> 

