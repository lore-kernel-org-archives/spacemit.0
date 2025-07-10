Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE05024C068
	for <spacemit@lists.linux.dev>; Thu, 10 Jul 2025 12:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752150092; cv=none; b=paJUya0Ms+B1ALEbFmnPjHvfCwvNYI0l9fGoArEMPNmqMAaMEi/wvfuk8FyfWBsFC4z8i5utdEO1nexz/l0Vnupb4dg4UT0I6v/41GUz6IkscXkkSglyPwFdQOITBZktOVpsqrkXHpj+gttI+auR1NyKRZLS8Nu9sRsOr+lSsyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752150092; c=relaxed/simple;
	bh=k0sNT1J2hfShDmZMd5oQVwbeYhLtHhM5ZG7gUd/6Xi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FCHIpfVew0hFcMgmK2nICgiG0IBlFeLsU765j7lW8vkOZkeZK6uxsArSJuTA38ZzRxD5/mtuC4iTK6cFTtnKw0Rl1D7PfZSQR7/ZbQNSS5JNW87nYLbrPA885Rg6zM2xr/txO1rcJ08FmhKbkAe/VjyTflMdB6u0pitWoFScUpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=yrThFr7x; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="yrThFr7x"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7d0a0bcd3f3so99243885a.1
        for <spacemit@lists.linux.dev>; Thu, 10 Jul 2025 05:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752150090; x=1752754890; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ykmA4VtBEf4m3I9yh9SrcV1DzXur6jCxtcYH7LJI2a0=;
        b=yrThFr7xWlWD0rEQ8/VTE9yh96fBaLTPh/ouxn8+CXJmKTnteeZ6NndQNe8fUiduyk
         +D6POu5lFwaAgL6ILU8emiTjpNH7Z3UGXAOGBZure14pjwFX71uazP/kxUga7AAR6Hgk
         NY/6HQFQF4laM84NF90V2gERC1Xm9QTEO7QxUESkTQ2ZS8/UZX3sIaNnz7vv3zq60DPk
         qG9QgUxcO/hbN/Hzq9sKDyswWW3NxgVnMXTu8ipT9+p22Cg2JFlFg5vZFIo3AeNQSoo5
         h4Lfr60DmkSXafJY9gIajSVsBLQfp/LZMwKCOOsrYhcrb4jddDcoZS98wQauw8NR3buD
         f+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752150090; x=1752754890;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ykmA4VtBEf4m3I9yh9SrcV1DzXur6jCxtcYH7LJI2a0=;
        b=cfM8wvrisfsmNlZ2sW/rkQdQ8PFA+3O7PaV9S/NGI0tpJkSPnCxYAEA5vSoW6LtQgc
         BaJzRbPMWxpCA2DDYun3rhbXIEcNQKiPMofPx2Adf8cR104eH2j9x8vqzWePNFF7priT
         qGaEB96c70FAlTypbqX6eIY+s5ZbBrQfkW9WhZVwoXHgLbtLXXweDjJDF7A9nijf6YQR
         YvpnUZq9HQJ2GHwhLbeFtg/fgbpZ33yofIIP7Exp+HEqQCGxNPzS5h8W/7n3V6MREt/o
         O5rP36Tc0DYPG/MAoXo7a7bOlMaVP7wlsHl3iOtZcSctEmLr1oZqArhrU+Ha+untSz3j
         iwyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+snnxltvr1EPzTSYA7SvgmxxQQj7jltLe5MBlCWyG2Ea7hm/Adms5si3MfeU5dEYu8V1q0765aw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy846KtX4RrWjMRMVNU8Mt70ja6AreZFl91rWdlFENEnVPK8e00
	utE5waCOfwKVwoKtG5vK5mwCUgnzf6VEnWRaIjw0+b+bzilW5/feENjwTKxfrN5QGHg=
X-Gm-Gg: ASbGncvCX49u708YBCBMdL/f3mqulcS9KskLITtUUO3vfpHtFSWTH1veOqF7fcU/EuX
	MvAwk3q1/iyNH7iSOy7u6ZGdpcpxpcxf7+9IeqdpniVJNLvdzssWyXq8w8trotno8w1GOL3amtV
	CHdwGBNa2D+g9uQOTrX6AlIkmrGkh3/kb0d4I5vEtaoZ44Dks+GsYAmP1lLV64sOex4DrViqNBQ
	8PENVc/Tn5K8EfTAoiSxa9M3ZIZExvjdGrRCG7xydZnzSVqdqUhAZfBJyUG0S6Niw690ce20O3N
	U+4CqIPS4+eF5fksqYdThCegyPJpy339cudtCalxZr3tZHX9pf1lSZ004gtsUaell9zNixBmvPT
	wvd60v5CAWA5eoReh5Yv8bpJ6gg==
X-Google-Smtp-Source: AGHT+IHAaGLj0dorD8TmmT+oXd6EpUTGrwAVYRSrLza6IYfI1rY0XCuwxUpREHQ/PIg/XOc23Vol9Q==
X-Received: by 2002:a05:620a:4408:b0:7d3:d8c8:1e32 with SMTP id af79cd13be357-7dc977d8fe3mr492098085a.3.1752150089600;
        Thu, 10 Jul 2025 05:21:29 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcde8fd479sm90171685a.99.2025.07.10.05.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 05:21:29 -0700 (PDT)
Message-ID: <f68067fd-328d-496a-8b39-9d0cc6cd05d7@riscstar.com>
Date: Thu, 10 Jul 2025 07:21:27 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/8] mfd: simple-mfd-i2c: specify max_register
To: Lee Jones <lee@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, mat.jonczyk@o2.pl,
 dlan@gentoo.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, troymitchell988@gmail.com,
 guodong@riscstar.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250702213658.545163-1-elder@riscstar.com>
 <20250702213658.545163-3-elder@riscstar.com>
 <20250710092448.GA1431498@google.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250710092448.GA1431498@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/10/25 4:24 AM, Lee Jones wrote:
> On Wed, 02 Jul 2025, Alex Elder wrote:
> 
>> All devices supported by simple MFD use the same 8-bit register
>> 8-bit value regmap configuration.  There is an option available
>> for a device to specify a custom configuration, but no existing
>> device uses it.
>>
>> Rather than specify a "full" regmap configuration to use this
>> option, Lee Jones suggested allowing just the max_register value
>> to be specified in the simple_mfd_data structure.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> Suggested-by: Lee Jones <lee@kernel.org>
>> ---
>> v2: - Allow max_register *and* regmap_config to be supplied
>>
>>   drivers/mfd/simple-mfd-i2c.c | 15 ++++++++++++---
>>   drivers/mfd/simple-mfd-i2c.h |  1 +
>>   2 files changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
>> index 22159913bea03..3f959f4f98261 100644
>> --- a/drivers/mfd/simple-mfd-i2c.c
>> +++ b/drivers/mfd/simple-mfd-i2c.c
>> @@ -33,16 +33,25 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
>>   {
>>   	const struct simple_mfd_data *simple_mfd_data;
>>   	const struct regmap_config *regmap_config;
> 
>> +	struct regmap_config config;
> 
> Why do we need another regmap_config?
> 
> Can't we just remove the const and make use of the one above?

If we change the global one, it changes for all users.

In my next version I will modify the global one temporarily and
zero the max_register field again after the devm_regmap_init_i2c()
call.  That doesn't protect against concurrent probes but I don't
think that's a problem.

>>   	struct regmap *regmap;
>>   	int ret;
>>   
>>   	simple_mfd_data = device_get_match_data(&i2c->dev);
>>   
>>   	/* If no regmap_config is specified, use the default 8reg and 8val bits */
>> -	if (!simple_mfd_data || !simple_mfd_data->regmap_config)
>> +	if (simple_mfd_data) {
>> +		if (simple_mfd_data->regmap_config)
>> +			config = *simple_mfd_data->regmap_config;
> 
> 			regmap_config = simple_mfd_data->regmap_config;
> 
>> +		else
>> +			config = regmap_config_8r_8v;
> 
> 			regmap_config = &regmap_config_8r_8v;
>> +
>> +		if (simple_mfd_data->max_register)
>> +			config.max_register = simple_mfd_data->max_register;
>> +		regmap_config = &config;
>> +	} else {
>>   		regmap_config = &regmap_config_8r_8v;
> 
> I suspect we don't need to have this line twice.
> 
> Either re-jig the if () above (I suspect this explains the existing
> complexity [multiple conditions]) or pre-set regmap_config to
> regmap_config_8r_8v and only over-write it if the conditions are met.

Sure, that would work, but it won't be needed if I just use
the (non-const) global config.

Thanks for the review.

					-Alex
		
> 
>> -	else -		regmap_config = simple_mfd_data->regmap_config;
>> +	}
>>   
>>   	regmap = devm_regmap_init_i2c(i2c, regmap_config); if
>>   	(IS_ERR(regmap)) diff --git a/drivers/mfd/simple-mfd-i2c.h
>>   	b/drivers/mfd/simple-mfd-i2c.h index
>>   	7cb2bdd347d97..706b6f53155ff 100644 ---
>>   	a/drivers/mfd/simple-mfd-i2c.h +++
>>   	b/drivers/mfd/simple-mfd-i2c.h @@ -27,6 +27,7 @@ struct
>>   	simple_mfd_data { const struct regmap_config *regmap_config;
>>   	const struct mfd_cell *mfd_cell; size_t mfd_cell_size; +
>>   	unsigned int max_register; };
>>   
>>   #endif /* __MFD_SIMPLE_MFD_I2C_H */ -- 2.45.2
>>
> 

