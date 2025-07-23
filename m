Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE392E543E
	for <spacemit@lists.linux.dev>; Wed, 23 Jul 2025 12:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753274572; cv=none; b=urJthozXtepixJ/6K4JRPkS74GaacBtO+QidGpgs+5+XlNlxCER5iq881BPiIqrk3PMZfGVpCWafK9XgjB00dzcs4Cr/3RIXYHI3fud0WC0sYho2KircBasdWcNpq4rmCwaaMJ5nlVktQhqO6lJJS30HKdjYPg8wKqYKIBk1gVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753274572; c=relaxed/simple;
	bh=s3GF7BZK1IbnAZRMzTFfekDE+ccoYiXy3ZkZDb60ad8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pwWuMq9WXheE9ITsiU+dy53aFLfz4tKVW2kb2a+Pb6iwBE/GJj8UI9SiMHLULveRfLCijUP2hRkZboSh0h3SQaRbsTg6hM7cGxR7x8pGlXRl4Ip//VtNWlDiBTFiBCbjcvKTR/HHEWpeAmPky8xAVc0BaeKAXYU1WCDQ4LFgIA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ZeEgkgbN; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ZeEgkgbN"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3e2c521efddso11847095ab.3
        for <spacemit@lists.linux.dev>; Wed, 23 Jul 2025 05:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753274568; x=1753879368; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G0Ew/UlImyFN4HlGy+L8fhyDF3AVGX/UG84SYw3xHZQ=;
        b=ZeEgkgbNLdPeOUmaiP2dJd6wRqidUcdCcLD78FCSLO+I6DQjv3gJqdWF7rHfdL6mPH
         CpMaD9hrucpoU9r9jgk/R/MvsjAN4BchbxIpUsRoxZuRF2ojmIQ+iOorEuiRwwENBLss
         ubK7XJdjqheIGcIAU+5G+EyDilMXgiNNJuQpz1+SUG0gKHEGCgr33Fgh7zz5FW40Z+ZQ
         Zi82zwaTsCauqpOq/dn7kZIbdVRpm7s3KZq1IP0SurRwcs4HpZlxnI8MS8kUs7//w9Qn
         BJu6swp64flci1da/B/07F8fNKy5XbO4qULWod/TJrSMNX7f4rYVEvKwTR1i/BAjMhnW
         6yhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753274568; x=1753879368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G0Ew/UlImyFN4HlGy+L8fhyDF3AVGX/UG84SYw3xHZQ=;
        b=TnA3+L3Dg21mlzCtGnJ4em2kQJBmrkK54QeUQqjXsuRImcnETPEkeiGwynZc66JYAY
         AK61FNAMGQiua/C8Vezm5pBOO44tb9OPVdWuzkut2KX2M/9MQsl6OCHUahOhi5fVoMyg
         11cDrH1mFVMNA0KBu9cALtCKCwhCPQs73tGntjpVic2+voJGEMxFI8/hA5T2vAAj8a0A
         NaILj46FyOvhdC86PtuxVS9hjejp2359m957sYfIB2azwyjVdqgzSo95ElD3V9ia9mBQ
         UzKbDQLUWZ7hoQWTsvsknCHdVgTasuS3t3sGG3FaxF6rbGaol20H80JFk2uOrxEu/OiP
         FJlw==
X-Forwarded-Encrypted: i=1; AJvYcCV7g9TefhXTnx4dVti/1Lh8+68GlXtVWgfI+ha7k84wuhTX+BaDoV3NePJX39WtG4jYRKMuPQvjVg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2CP05qbW0fYYsWaeIS8DNH2XdMp/36xENmqQOkrvN3iGDRb3Z
	RXQcDyTOT/lM7+yAGsMoZLxLw7MjLFSj7ID+7a5Dwy6N+v/ohzVqzIFIYngqA8J9GT0=
X-Gm-Gg: ASbGncv6Nrun69OAn9Tt6JnRJ6FVHxMT0Eg2ERDVruToXWTY/pt5xKhsKwk2LPABG+5
	X246B05/SZtTNXs/9olrS+CVouHv1P961wgT3XGr/3QZ/tC23Bel0hLHr6Gwv0Bps0sluXXyP7U
	WTAfKt5L7ThTYvsZgLKOhVr6R1ldqqSBXk4nIWV1Y6hN1x2rAW6TbQpLYacPES1J6ws1lRAQGDa
	ETZBURtCZlwOGgVwx0hrmP3KUhnRiCd4nSNe1BIcGtqg1lPR/B3zR7MPfDfr40lJfKqHcdaPDQx
	C4BiU3PdEWVF0lFEiA3dy4DUfjxtTG5gJzqMj88USIq9TSHYiNbbJh9f0/z+cuTdth9eFE9zJ34
	6m3hKDhGpEA6xYuwGazEF+c5aN9dHeVohTw==
X-Google-Smtp-Source: AGHT+IEqaLJWveuGtuwL6xUVomxEyO/I/mq75BNTRkLodb+q0fudHO2/No8ZaCo9o8H/kGbU5GpHqw==
X-Received: by 2002:a05:6e02:1f82:b0:3df:3d1a:2e76 with SMTP id e9e14a558f8ab-3e32fc22705mr56940445ab.1.1753274568312;
        Wed, 23 Jul 2025 05:42:48 -0700 (PDT)
Received: from [10.211.55.5] ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e2982aff75sm38954785ab.54.2025.07.23.05.42.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 05:42:47 -0700 (PDT)
Message-ID: <877dcf99-107e-4d96-8790-6608976d13ca@riscstar.com>
Date: Wed, 23 Jul 2025 07:42:45 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/8] mfd: simple-mfd-i2c: specify max_register
To: Lee Jones <lee@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, mat.jonczyk@o2.pl,
 dlan@gentoo.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, troymitchell988@gmail.com,
 guodong@riscstar.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250710175107.1280221-1-elder@riscstar.com>
 <20250710175107.1280221-3-elder@riscstar.com>
 <20250723095125.GR11056@google.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250723095125.GR11056@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/23/25 4:51 AM, Lee Jones wrote:
> On Thu, 10 Jul 2025, Alex Elder wrote:
> 
>> All devices supported by simple MFD use the same 8-bit register 8-bit
>> value regmap configuration.  There is an option available for a device
>> to specify a custom configuration, but no existing device uses it.
>>
>> Rather than specify a "full" regmap configuration to change only
>> the max_register value, Lee Jones suggested allowing max_register
>> to be specified in the simple_mfd_data structure.  If regmap_config
>> and max_register are both supplied, the max_register field is ignored.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> Suggested-by: Lee Jones <lee@kernel.org>
>> ---
>> v8: - Use regmap_config_8r_8v, modifying it if max_register supplied
>>
>>   drivers/mfd/simple-mfd-i2c.c | 8 ++++++--
>>   drivers/mfd/simple-mfd-i2c.h | 3 ++-
>>   2 files changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
>> index 22159913bea03..5138aa72140b5 100644
>> --- a/drivers/mfd/simple-mfd-i2c.c
>> +++ b/drivers/mfd/simple-mfd-i2c.c
>> @@ -24,15 +24,16 @@
>>   
>>   #include "simple-mfd-i2c.h"
>>   
>> -static const struct regmap_config regmap_config_8r_8v = {
>> +static struct regmap_config regmap_config_8r_8v = {
>>   	.reg_bits = 8,
>>   	.val_bits = 8,
>> +	/* .max_register can be specified in simple_mfd_data */
> 
> Drop this comment please.
> 
>>   };
>>   
>>   static int simple_mfd_i2c_probe(struct i2c_client *i2c)
>>   {
>>   	const struct simple_mfd_data *simple_mfd_data;
>> -	const struct regmap_config *regmap_config;
>> +	struct regmap_config *regmap_config;
>>   	struct regmap *regmap;
>>   	int ret;
>>   
>> @@ -43,8 +44,11 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
>>   		regmap_config = &regmap_config_8r_8v;
>>   	else
>>   		regmap_config = simple_mfd_data->regmap_config;
>> +	if (simple_mfd_data && !simple_mfd_data->regmap_config)
>> +		regmap_config->max_register = simple_mfd_data->max_register;
> 
> If max_register is set in simple_mfd_data, it should take precedence.

I don't really agree with that.  If simple_mfd_data->regmap_config
is provided, why not use the max_register field already available
there?

This is why I said above that I think this feature doesn't add
much value.  It provides a second way to specify something, but
in the end it complicates the code more than it's worth.

The only time this new simple_mfd_data->max_register field seems
to make sense is if it were the only thing provided (without
simple_mfd_data->regmap_config being supplied).  In that case,
I see the benefit--a null simple_mfd_data->regmap_config means
use regmap_config_8r_8v, and overlay it with the max_register
value.  The new max_register field avoids defining another huge
but mostly empty regmap_config structure.

Anyway, back to your original point:  I said in v7 "If both
are specified, the max_register value is ignored" and I think
that's the simplest.  Specify one or the other--if you want
to define things in regmap_config, then that's where you add
your max_register.  If you like regmap_config_8r_8v but want
to define a max_register value, just provide max_register.

If you insist, I'll do what you say but before I sent another
version I wanted to explain my reasoning.


> if (simple_mfd_data && simple_mfd_data->max_register)
> 	regmap_config->max_register = simple_mfd_data->max_register;
> 
>>   	regmap = devm_regmap_init_i2c(i2c, regmap_config);
>> +	regmap_config->max_register = 0;
> 
> Does max_register definitely have persistence over subsequent calls?

It is a global variable.  Isn't that how they work?  When
it was read-only there was no concern about that, nor about
any possible concurrent access (though I don't think multiple
probes can be using this code at once).

We could allocate a new one each time instead.

I think what I offered in v5 was acceptable.  If you're
willing to accept that I will be happy to keep discussing
(and implementing) the max_register feature.

					-Alex

> 
>>   	if (IS_ERR(regmap))
>>   		return PTR_ERR(regmap);
>>   
>> diff --git a/drivers/mfd/simple-mfd-i2c.h b/drivers/mfd/simple-mfd-i2c.h
>> index 7cb2bdd347d97..ea2a96af8bce4 100644
>> --- a/drivers/mfd/simple-mfd-i2c.h
>> +++ b/drivers/mfd/simple-mfd-i2c.h
>> @@ -24,7 +24,8 @@
>>   #include <linux/regmap.h>
>>   
>>   struct simple_mfd_data {
>> -	const struct regmap_config *regmap_config;
>> +	struct regmap_config *regmap_config;
>> +	unsigned int max_register;	/* Ignored if regmap_config supplied */
>>   	const struct mfd_cell *mfd_cell;
>>   	size_t mfd_cell_size;
>>   };
>> -- 
>> 2.45.2
>>
> 

