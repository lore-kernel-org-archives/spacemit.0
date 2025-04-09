Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878848BEA
	for <spacemit@lists.linux.dev>; Wed,  9 Apr 2025 22:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744238854; cv=none; b=X2sz3PwA4e0nfEhX/wkJi2/tZj7XZXw2EHhRN8eQ3vHqf3q0ispsqlIJFWLSvcIKaTqNHohIlGTj7IDb8e9f0ehrNLnPJOBjUqdKvpm9OTILDPYfB27uqRE0dPrm2xMYhEtV58b4B31SQWvtQREuJO/GPre3RwDswUtFrSGiA+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744238854; c=relaxed/simple;
	bh=oNLYs8RldHGiV+Ttyc4FGdeq7MI4/Y2X5VhBOa6M9dA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FFXQ+Ta9Vc7tXuNoxHvkyKGTHxmOGSJNM+m1qo8/4Hr3Yj4Jlwjl348srb8wLvnsNn5+zyoUOSqZAfEnA6nDOR0gp8kX+RSlA793Nu+VKB4aV2gA14NxovFwM9kCIC1R769G7XaXtBEfnJ/cAQpVEIw5pxcCK5vXQMCUzNElKSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=H8jdvLaI; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="H8jdvLaI"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-85b4170f1f5so8470039f.3
        for <spacemit@lists.linux.dev>; Wed, 09 Apr 2025 15:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744238851; x=1744843651; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yVcdr20nWkY3wqDgMeVyQ5I/xgJY//hgFMEqnYMOHQU=;
        b=H8jdvLaINbVUTKMB3CuL0bZEoxke2Ku1yV1ILXeI05pvFDfdD9SlxSdG94U+5rNRjO
         4+GLZhOPWhDBHQH/7s12xUyNrJ6DleIVDmpwrBO5kXc61YXoBaGuupU+LxKxTdyD/bMx
         XBezwpeeXdyNe8jr2KdVAbEqTsSwTJaC7wNk/5PmKegSQAQqR94XCNFdDMRUrKbQUo3C
         7J/w/mngd5oI4Q1OHQorOMcVze7Roh2ofwyE0G2Np3Po8wXfvIZ5C3s4NWvgVafQovOr
         sgjVFO+rmA8XQrD0oyoCJ02cO5yQH6avYnHE2Zqmoj4wIUDRPhhxxMVt1gS/8R439X62
         Vsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744238851; x=1744843651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yVcdr20nWkY3wqDgMeVyQ5I/xgJY//hgFMEqnYMOHQU=;
        b=EiT7CsiU/inz10h8kS5SHBITi/Kb2+WArcfETctpS9MyQE57r3ZVo232yY4mAo5HlC
         7W2fF5Pc89HzjMnaU5vpgvu/SI9G7HGrM6NY12lMcZCfy+m9vHi9AQfYZSlzbFWvHUBT
         O6+mdvk5a1lZsrNFPrUjRSFE47e2lTW73zOfr7LZiVm/t/mOTq5+fwUxgdHDulo/FCXB
         EJf8AAY9UCBv1bMdvAm0WmHpELSpHmh8ZdjGPz5hBPFHThPwQLdXKqlf4OGceGtYwxQP
         EXKMiKVsz93cfTY3QNQZZdfrD4Etv+Ue7ssARDdZM85jNorv7nrCsZvbUgspTICis3xa
         oAtw==
X-Forwarded-Encrypted: i=1; AJvYcCWw1vTiwbJ4gYqjt6/2GqGabqpAQDBt8kO2pFauHHiw8UATZR+t06rAupRQDH7mHVoWJUhymIXTMw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxWbtCvic5R5hKfPWJzfz0OjA25M38jx9HU5S6hwWknkWOVXBfK
	Mp9QEsWUotDjTkc0eEa7vGw95lRF3WB8OoLSkLhGsNA7kj42rhN9+ejcaA6dvLE=
X-Gm-Gg: ASbGncuDJb2ggAh9DLjXhlCW6OsMG2jnHmJa1NXtQ5grvETHxmQYsYjSQB/jFFO9o3F
	Fj1kBkMg9BffQ6i4HVbB9Q8gen2E6XsnbbPl0Xa6U4H+Yvt4oD65WyQo2dYeEgLDW2Y05jVbVTQ
	AAqaV0Tid6w/pFJhi0+CtFHyHZVC/+WH1Fhx5NFtaadtG/En0omLdfhIvBiBcnJQkbMJBr7tYqk
	YX8215DNtlx801AWF44/UbHhXdTCtJib40LGMO8zIVboU8WssOidzmtQ3GxDj+9JrteSRiDQ9cD
	XeGjtILHGRNwQN0IC0sSTbSFTYVBYfX+vme4AX5+h6GotNDptL5ZU930Fcg7Su1dic18XV+kIct
	K0wVo
X-Google-Smtp-Source: AGHT+IG6GzcOAqS71lWGBgliY3BflDHFXTzjPUW02nvTUPuHcgKnnG0i35pjn6+lhawWiv/PEkLKdw==
X-Received: by 2002:a05:6602:481b:b0:85d:a173:323c with SMTP id ca18e2360f4ac-8616ed25521mr77175039f.8.1744238851471;
        Wed, 09 Apr 2025 15:47:31 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e7da54sm448971173.140.2025.04.09.15.47.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 15:47:31 -0700 (PDT)
Message-ID: <04facbe3-cd40-4d79-a204-2b91880da331@riscstar.com>
Date: Wed, 9 Apr 2025 17:47:30 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] serial: 8250_of: add support for an optional bus
 clock
To: Yixun Lan <dlan@gentoo.org>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, benjamin.larsson@genexis.eu,
 bastien.curutchet@bootlin.com, andriy.shevchenko@linux.intel.com,
 u.kleine-koenig@baylibre.com, lkundrak@v3.sk, devicetree@vger.kernel.org,
 linux-serial@vger.kernel.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250409192213.1130181-1-elder@riscstar.com>
 <20250409192213.1130181-3-elder@riscstar.com>
 <20250409214345-GYA19066@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250409214345-GYA19066@gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/9/25 4:43 PM, Yixun Lan wrote:
> Hi Alex,
> 
> On 14:22 Wed 09 Apr     , Alex Elder wrote:
>> The SpacemiT UART requires a bus clock to be enabled, in addition to
>> it's "normal" core clock.  Look up the optional bus clock by name,
>> and if that's found, look up the core clock using the name "core".
>>
>> Supplying a bus clock is optional.  If no bus clock is needed, the
>> the first/only clock is used for the core clock.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v2: Update logic to more check for the optional bus clock first
>>
>>   drivers/tty/serial/8250/8250_of.c | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/tty/serial/8250/8250_of.c b/drivers/tty/serial/8250/8250_of.c
>> index 11c860ea80f60..a90a5462aa72a 100644
>> --- a/drivers/tty/serial/8250/8250_of.c
>> +++ b/drivers/tty/serial/8250/8250_of.c
>> @@ -123,7 +123,16 @@ static int of_platform_serial_setup(struct platform_device *ofdev,
>>   
>>   	/* Get clk rate through clk driver if present */
>>   	if (!port->uartclk) {
>> -		info->clk = devm_clk_get_enabled(dev, NULL);
>> +		struct clk *bus_clk;
> we also need to handle clk in suspend/resume procedure, so
> I think you need to put bus_clk inside struct of_serial_info..

OK, I didn't do anything for that in previous versions of the
series.

I think that means we'd call clk_disable_unprepare() on
the bus clock after doing so for the function clock.  And
clk_prepare_enable() on the bus clock before doing that for
the function clock in of_serial_resume().  That's easy.

Is there anything further you think is required?  There is
no clock rate associated with the bus clock that I know of,
so even if the function clock rate changes, the bus clock
can remain as-is.

> 
>> +
>> +		bus_clk = devm_clk_get_optional_enabled(dev, "bus");
> for the 'optional', we can interpret it's optional for other vendor
> UART, but a must required clk for SpacemiT's k1 UART controller
> 
> would it better to guard this inside a compatible test or even introduce
> a flag in compatible data?

I don't personally think so. We could, but the DT binding is going
out of its way to define when the bus clock is required.  This is
simpler, and generic.

					-Alex

> 	if (of_device_is_compatible(pdev->dev.of_node, "spacemit,k1-uart")) {
> 		bus_clk = devm_clk_get_enabled(dev, "bus");
> 		..
> 	}
> 
> }
>> +		if (IS_ERR(bus_clk)) {
>> +			ret = dev_err_probe(dev, PTR_ERR(bus_clk), "failed to get bus clock\n");
>> +			goto err_pmruntime;
>> +		}
>> +
>> +		/* If the bus clock is required, core clock must be named */
>> +		info->clk = devm_clk_get_enabled(dev, bus_clk ? "core" : NULL);
>>   		if (IS_ERR(info->clk)) {
>>   			ret = dev_err_probe(dev, PTR_ERR(info->clk), "failed to get clock\n");
>>   			goto err_pmruntime;
>> -- 
>> 2.45.2
>>
> 

