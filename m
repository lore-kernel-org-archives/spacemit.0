Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675C528C867
	for <spacemit@lists.linux.dev>; Tue, 13 May 2025 12:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747139089; cv=none; b=KArzE6HIlMUDyIuOZSz3glDFiuPUvMLNyr0GKPTuAtn/qRtuhOBwLKg4tMvEjf/o7dM4J/QW7cXOdS9VPhFBO5tPsEky8+xjEKHxEETDIokR6Ae5txfHr7UMj00226nYl9iguaYlqweqJiRGIP50ncpCrVzZjdDlt7hzxec9ssc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747139089; c=relaxed/simple;
	bh=nCH0DieIdmLcW3j4bl0vM0PoHomAZV2rslViEgt6WTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G7D+UeNeYUvinAJQH5PhzKsaEE4m/c5Lq27Yhyuk9t/Ii5fsayTRxfjpyqGwMntiJceFwJNuQ9Q0NCM5XZu2m7NBhl3xkodOZRPphHmfG+5m+JIz7QSHJ+po4JdPCDbipYml99M9zlAH2ZpPl32F6YMkphqL7zDFPyKt7Jh2r64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=0RNoH3Fi; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="0RNoH3Fi"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3d93deba52fso15740875ab.0
        for <spacemit@lists.linux.dev>; Tue, 13 May 2025 05:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747139085; x=1747743885; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oUukzgPxDimVlAEltPxV3Oz6fjf8xuwBqI/ZvbSdWbk=;
        b=0RNoH3Fi5T78Cp6Bc4lOLaDBmRs2xjpQ5sJ5lI+4Zdk12H0pRyYmUj+t2oVeM8q1K4
         bB1de7pM09v/WHTC0lCETUPM0nifwtTwvo18yO6O2hzrYOfJufdPuwSaTjLH107F18+1
         zR2wVJJ2AmXFS8X8EQGT6ovtUxqKUEP7PFRaFAzloDIZ10b46jRuu2fM87th0hIN68xu
         Zy6DzQZ7elGcfXj+tUYfUOotZxyRm9HeO7pEWlVx5CMntRnDlf4HuVfj9wA7IembDxYl
         Rf7sLv7zRL7ol0OzTkXsakfmn3geC5209U79l1WFTpkAbbfGTpYsJ/EcX4gZLs+0fo0Y
         vwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747139085; x=1747743885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oUukzgPxDimVlAEltPxV3Oz6fjf8xuwBqI/ZvbSdWbk=;
        b=CjeuR1lLUxdjXH2uhb9PNWWEMguZzziNBI59Zv2OyUqXCav/ME4zznEMOKqGyYcMa0
         xgAcUtsPO+Is1DWyjmUXXq9C19LBowwGnuktLBmgFE29VjHZWfplW1l82a1xo/NlPlvP
         uGrXzRmlRdPp6KR/LBytgShHNx/2lLSwjnNVXm2tx2mi3hzwQ7teKGsv/8PPT+mOhQ2t
         pDF3NSfBXArORXAfYf2U6dBFe+575zpM77WCzaW1eVEVcxx09eeSXKmjJWctp+/9bPff
         RkxjCu0k7g0gg1WybWJIXEbi1roBP8zOm7LmsjAzuzG7ZlAKUmPYCoMKEIPApxiN7eNe
         ebBA==
X-Forwarded-Encrypted: i=1; AJvYcCUwP6M0hYy6RDaYitolRIqQ+5XRomgy8YKqVaeA8iYHBYKp9MhvT2OiNWyLsIZdVcv3xVT+01hfpQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyTArSPskba+fc1beuTk4N2ynbVGimVKI7uHeRPlk/mq2Glw8uB
	1FNzZwzKINaffb7YURNDDbxvOjF0qV+gxO0DRDSoiQbOMIsri91UIfrup9bDUgM=
X-Gm-Gg: ASbGncvwhyEVcTJIRd5oxNaHiQD736r650Mq/2tvnmiOU1Ctg2vUQMPsH64VP9Bdhr1
	Pev0DSxNqWk6RFcS6t0DWtF9oKQySrOPx1d8qeXMZKfT36vzOLMRS7YLLQoz192CEuRX8BCrS5v
	/EIGnFoZVUyuYxqC7R3DFii8aXvP/BE1c0WClkP4TX/jFS/BIEKqz/UbmTuK2/Li8kSlPBUw/H5
	7n8Y77bWV67oU6Q72SuaeeKCbK5m+qPOVEhoW4ZsACJDNkyIen/tUY7Ieg1jU72jOoFCAeNgQUz
	t2pdqQ9WDKfMt1/loxTIAP1Lo7P8REz39x7ZoU/Zry0R794/Lyyxv5JgPn3IqpUqB3tnolS+Cxo
	KkCNloO9ea+/3ZB8=
X-Google-Smtp-Source: AGHT+IFa99yDPla8yOwa2Lb0IIWEjfvTvZm04RmCYhnJ6t18LZAeThH57cdW66O3OAMcaFau7kC0qQ==
X-Received: by 2002:a05:6e02:1a08:b0:3d9:644c:e3b0 with SMTP id e9e14a558f8ab-3da7e20dd8dmr165655765ab.14.1747139085428;
        Tue, 13 May 2025 05:24:45 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3da7e158bfcsm26965915ab.58.2025.05.13.05.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 05:24:45 -0700 (PDT)
Message-ID: <560c33a8-4917-4c89-a8f3-ed7810fd675f@riscstar.com>
Date: Tue, 13 May 2025 07:24:43 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/6] reset: spacemit: add support for SpacemiT CCU
 resets
To: Philipp Zabel <p.zabel@pengutronix.de>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com,
 sboyd@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, dlan@gentoo.org
Cc: heylenay@4d2.org, inochiama@outlook.com, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250512183212.3465963-1-elder@riscstar.com>
 <20250512183212.3465963-5-elder@riscstar.com>
 <d25aa4b10e2ebefb36e0db03123b404044e71ec1.camel@pengutronix.de>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <d25aa4b10e2ebefb36e0db03123b404044e71ec1.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/25 4:21 AM, Philipp Zabel wrote:
> On Mo, 2025-05-12 at 13:32 -0500, Alex Elder wrote:
>> Implement reset support for SpacemiT CCUs.  A SpacemiT reset controller
>> device is an auxiliary device associated with a clock controller (CCU).
>>
>> This initial patch defines the reset controllers for the MPMU, APBC, and
>> MPMU CCUs, which already define clock controllers.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/reset/Kconfig          |   9 ++
>>   drivers/reset/Makefile         |   1 +
>>   drivers/reset/reset-spacemit.c | 246 +++++++++++++++++++++++++++++++++
>>   3 files changed, 256 insertions(+)
>>   create mode 100644 drivers/reset/reset-spacemit.c
>>
> [...]
>> diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/reset-spacemit.c
>> new file mode 100644
>> index 0000000000000..eff67bdc8adba
>> --- /dev/null
>> +++ b/drivers/reset/reset-spacemit.c
>> @@ -0,0 +1,246 @@
> [...]
>> +static int spacemit_reset_controller_register(struct device *dev,
>> +			       struct ccu_reset_controller *controller)
> 
> Align to open parenthesis, line length is fine.
> 
>> +{
>> +	struct reset_controller_dev *rcdev = &controller->rcdev;
>> +
>> +	rcdev->ops = &spacemit_reset_control_ops;
>> +	rcdev->owner = THIS_MODULE;
>> +	rcdev->of_node = dev->of_node;
>> +	rcdev->nr_resets = controller->data->count;
>> +
>> +	return devm_reset_controller_register(dev, &controller->rcdev);
>> +}
>> +
>> +static int spacemit_reset_probe(struct auxiliary_device *adev,
>> +				const struct auxiliary_device_id *id)
>> +{
>> +	struct spacemit_ccu_adev *rdev = to_spacemit_ccu_adev(adev);
>> +	const void *data = (void *)id->driver_data;
> 
> Unnecessary (void *) detour. Just cast to (const struct
> ccu_reset_controller_data *) directly. Otherwise,
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Thank you very much for your review.  I'll update to incorporate
your suggestions and will add your Reviewed-by.

					-Alex

> 
> regards
> Philipp

