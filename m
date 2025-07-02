Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D053196AF
	for <spacemit@lists.linux.dev>; Wed,  2 Jul 2025 15:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470516; cv=none; b=ZoVNgmXbRTmOr8hewdKqyIruUdZY5vnwUJGWuTHgy2thDhrTQfgEamfCR2pAEt6JB2q2tliH13CzyVoay3Q/PpAm1tEA1Fc6nb7SlhDhUHvuqdMnty42b926A0lizF3NhnR9HEvff68jdF3CCNJFmEEbEmI2ovUP5rDr8DNk46w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470516; c=relaxed/simple;
	bh=vZBo5y77HrfZLAHPXYjDTUFcXmXB+C/GAhGYxUKToUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g55ZQlO0hjPd1dHUHS6JasnOn/9LV4D2imGEr0LlOSdQe09PrgteVDS6jtO3Va765crItfTTugoEdrGRuyPwc/uRl5YZ987P03o3GR2UdokHu5sihATsRs3GsxC8GBX14DJvH831yfdGNkHvHTQMSR3AOHrGWKuAG+jmajFSClU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=knUbXS6O; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="knUbXS6O"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3da73df6c4eso53683205ab.0
        for <spacemit@lists.linux.dev>; Wed, 02 Jul 2025 08:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751470513; x=1752075313; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gFYak3rqG4/IzwuHtJ+AVvA3da7cWc6pCiZ9Z7+J3C0=;
        b=knUbXS6OC5P2H5DcpyZ1+X/JeeaRRkdF+yCz1B8IgM5UqZi+mM0qIIJX3qaJmBWWtC
         8y8QQuNwNlRy2sFzHb+MmjpesCie1s7E2D9YkxV3BqEaE+bOt9CF7kvVnkqSdr2lqPYU
         2cFRZbhCUhMPKuf4JGwFB6zfEN3E8BHLv6l9la9ae2pEK2Brs61Ei4WhwgnpwvPjmJX5
         BoDd1gz4VJQ+4rP3t7UCVCih6QyKqCeO1ishu6uJNeeJGonNSTHi74owM7BJyaT+TDES
         wqjXcbEXQRk+dwKuYE9YL9MQI2DT1ZTbFjSgxM4FLS4CmZT0uOLIGgqym7WnSyy+ylPe
         IurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470513; x=1752075313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gFYak3rqG4/IzwuHtJ+AVvA3da7cWc6pCiZ9Z7+J3C0=;
        b=TxLronolXYbO+C0Paar0Y8/PInHp0qWaLdaMex4Ln08q+pbX/s/rhopO5g2pQiuKfc
         VHs02AP6CTcpulGtaakn6eNWjs94GZSTSGQBXaj9LX3a+nqYBjFNzjUpIt9oVTKROakp
         +MHYCs47+BGTIpQ9gq/DRPLSOR9ZEOv0Wd0JTiM/GZvXNezQrFY3HefAq1P7qDyghVd8
         U93g9CnuOrZ2iWGzT51wSHw7l7iZLoi3Jj8kcnBigEhxWOcXDQH40uIUrfRjgoVJbnOd
         XqX7Xt6Hl+8vhcsrURRrNujOC/A4/UvtFE4ZnIrNPpB+PVwPKW4dwkpmHTjXWGIPs13Q
         BQwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjJqa7MVMNR2/TLEGV5uiYlpTUwED2uU/1kltHytn2C79vfAHYePjIBlmOEzuQiYmxhkYRKMveBw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPm+MJcLySxXujNJT5wrxSSDFkhgRq4nYXygLAglmDVe5IhpvD
	W3s58Zg4ITqLXPiil/G3lUrnfln6/ReLmJNGNV4Xb4hC38hCnOg972DvIiTWDJevaho=
X-Gm-Gg: ASbGncsEIdVPBeBKZdPjzI41Ow2Tlgd9v2S76O8deLbjZhRYnWdJrcWccsX8wxRIMFd
	lAhf+eDvhsO3kYL7iFelRKAn1CxV/tqyjtHxqWKtI85AD9snFPl+1El54HtZCJwTdohFSmeS6nD
	4x/gCSLn03g4gB2oJMz0cM5JZgM3pQDL+fi1BG+R7Yl61t5CVrUWm+umMwqtbnWwsJuGMt/Fzdy
	GQXsXEp20A2YnIfvfBUP/sIdmmwLGZ6DMFKT+ON3/GTyaHGjGCf93CDeZbnsAM76DutloR8GrEe
	USFXYaD90yqMU0n4FQPBHx+/iU68DFlD9ol1QkhVFR1hyT9JC9vN3RBRBKOacQW0G33TLEr27e2
	34I5QmbKSgwtDAn4V8cyNTJLENw==
X-Google-Smtp-Source: AGHT+IHJuXwDnuIr4bYWYjj6GSVyHqNZGbb2KEkdO8qfJX0ywzKr09z0X9AaMr3NQzkZvnOS8IhlQQ==
X-Received: by 2002:a05:6e02:17c6:b0:3dd:920f:d28e with SMTP id e9e14a558f8ab-3e0549d82c5mr32653675ab.13.1751470513525;
        Wed, 02 Jul 2025 08:35:13 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5039f2f95a1sm161358173.85.2025.07.02.08.35.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 08:35:13 -0700 (PDT)
Message-ID: <0219b698-2f1b-4fcd-bce7-0ba6f6895b11@riscstar.com>
Date: Wed, 2 Jul 2025 10:35:11 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] mfd: simple-mfd-i2c: specify max_register
To: Lee Jones <lee@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, mat.jonczyk@o2.pl,
 dlan@gentoo.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, troymitchell988@gmail.com,
 guodong@riscstar.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250627142309.1444135-1-elder@riscstar.com>
 <20250627142309.1444135-3-elder@riscstar.com>
 <20250702152618.GU10134@google.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250702152618.GU10134@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/2/25 10:26 AM, Lee Jones wrote:
> On Fri, 27 Jun 2025, Alex Elder wrote:
> 
>> All devices supported by simple MFD use the same 8-bit register
>> 8-bit value regmap configuration.  There is an option available
>> for a device to specify a custome configuration, but no existing
>> device uses it.
>>
>> Lee Jones suggested modifying the simple MFD implementation to
>> remove the generality of the full regmap configuration and add a
>> max_register value to the simple_mfd_data structure.  This can
>> be used in the regmap configuration to limit the valid register
>> addresses if desired.  It's simpler, and covers all existing and
>> anticipated device types.
> 
> Woah, not like this.  I wanted to make the framework _more_ flexible.

OK, sorry I misunderstood.  I'll send another new version today
that does what you suggest.

Thanks a lot.

					-Alex

> Just this should do what you want:
> 
> diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
> index 22159913bea0..f43be10c0e60 100644
> --- a/drivers/mfd/simple-mfd-i2c.c
> +++ b/drivers/mfd/simple-mfd-i2c.c
> @@ -44,6 +44,9 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
>          else
>                  regmap_config = simple_mfd_data->regmap_config;
>   
> +       if (simple_mfd_data->max_register)
> +               regmap_config->max_register = simple_mfd_data->max_register;
> +
>          regmap = devm_regmap_init_i2c(i2c, regmap_config);
>          if (IS_ERR(regmap))
>                  return PTR_ERR(regmap);
> 
> Plus the one line change in drivers/mfd/simple-mfd-i2c.h.
> 
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> Suggested-by: Lee Jones <lee@kernel.org>
>> ---
>> v6: - New patch, changing the simple MFD functionality
>>
>>   drivers/mfd/simple-mfd-i2c.c | 18 ++++++------------
>>   drivers/mfd/simple-mfd-i2c.h |  2 +-
>>   2 files changed, 7 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
>> index 22159913bea03..c1dc315d44dcf 100644
>> --- a/drivers/mfd/simple-mfd-i2c.c
>> +++ b/drivers/mfd/simple-mfd-i2c.c
>> @@ -24,27 +24,21 @@
>>   
>>   #include "simple-mfd-i2c.h"
>>   
>> -static const struct regmap_config regmap_config_8r_8v = {
>> -	.reg_bits = 8,
>> -	.val_bits = 8,
>> -};
>> -
>>   static int simple_mfd_i2c_probe(struct i2c_client *i2c)
>>   {
>>   	const struct simple_mfd_data *simple_mfd_data;
>> -	const struct regmap_config *regmap_config;
>> +	struct regmap_config regmap_config = { };
>>   	struct regmap *regmap;
>>   	int ret;
>>   
>>   	simple_mfd_data = device_get_match_data(&i2c->dev);
>>   
>> -	/* If no regmap_config is specified, use the default 8reg and 8val bits */
>> -	if (!simple_mfd_data || !simple_mfd_data->regmap_config)
>> -		regmap_config = &regmap_config_8r_8v;
>> -	else
>> -		regmap_config = simple_mfd_data->regmap_config;
>> +	regmap_config.reg_bits = 8;
>> +	regmap_config.val_bits = 8;
>> +	if (simple_mfd_data)
>> +		regmap_config.max_register = simple_mfd_data->max_register;
>>   
>> -	regmap = devm_regmap_init_i2c(i2c, regmap_config);
>> +	regmap = devm_regmap_init_i2c(i2c, &regmap_config);
>>   	if (IS_ERR(regmap))
>>   		return PTR_ERR(regmap);
>>   
>> diff --git a/drivers/mfd/simple-mfd-i2c.h b/drivers/mfd/simple-mfd-i2c.h
>> index 7cb2bdd347d97..4121fe1bc1d70 100644
>> --- a/drivers/mfd/simple-mfd-i2c.h
>> +++ b/drivers/mfd/simple-mfd-i2c.h
>> @@ -24,9 +24,9 @@
>>   #include <linux/regmap.h>
>>   
>>   struct simple_mfd_data {
>> -	const struct regmap_config *regmap_config;
>>   	const struct mfd_cell *mfd_cell;
>>   	size_t mfd_cell_size;
>> +	unsigned int max_register;
>>   };
>>   
>>   #endif /* __MFD_SIMPLE_MFD_I2C_H */
>> -- 
>> 2.45.2
>>
> 

