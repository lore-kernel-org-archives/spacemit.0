Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7D5205E02
	for <spacemit@lists.linux.dev>; Wed, 25 Jun 2025 11:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750852100; cv=none; b=c+0iTAknTIIte9aeIoQq0pKOmP67KbLlbfSoiO6CBWfxAcis8hUcJowo1AlrgMZRr02/TO4yD5cOJWEz8j4cC82pIcjh5McD6lGfMzRnOBrpt0I3TL1dnFGcRjlikA3CXxgPILdswDsgqK3P7LGtQFWqcbKj7u5weHeBvm5Dmr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750852100; c=relaxed/simple;
	bh=iubtQzSGaL5IT9evDDu/ispcoI51l6N0oykEk0q0Lgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sEMA93RIk56Pwn4LcXnaoETKTy1B5cuqR37N1W2FdlQPG7MJTOsjnE4aK+Xy1DDHtYvOTyMpeIDTN1Mh4lPGYo5BHO7nM0eKVNi0e+AYhWAReBBuk6PY1sZzA+iZtnyXxr3BP04lKkKpEeZf+oxpi4eiGFAAyC54WTkP9j1GtII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=uWcmHchp; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="uWcmHchp"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3df30d542caso5413185ab.1
        for <spacemit@lists.linux.dev>; Wed, 25 Jun 2025 04:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750852098; x=1751456898; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JkGM3U0bOIiDIPecsvnKSmSyDzqRmOLHZH3WgTAbQFY=;
        b=uWcmHchpnWeSkItl5o214xfzF5oPwYkgyE4YGAPDewyJlTmNLDPOg8jb13sW4QpDT+
         d7uRyLt6hSPdE+EjB6xndR4VCP33GqQ0RRdeR2SzZDnIPV0ntjmOeHfO+gjmI41lmRhD
         h9MBo9RdkVZIGb+JrPSsv0nEPOaKbAXz6m8ucunVbNOvR//vNh7Wdc6jZywbbEjeFF5N
         euP2xudlYCkp8n4XPm4wPRIKf9dsMkl9bIPagcFUPeZ5oKJqJVNm3ap1H67OlyIeUE2R
         nL6Q7pRzlyDM0dkkXF2TLnRr7DDHR9ITJwLXBtEWmFd0eJOVGoCtDqlDu2Omr4zBHt8W
         KhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750852098; x=1751456898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JkGM3U0bOIiDIPecsvnKSmSyDzqRmOLHZH3WgTAbQFY=;
        b=cZtzZ0+HveqnyZdVoGztC9QJhKcwXENDxXSvwe3yPgan/pGK2yMSxNz1V5TFUmKS/C
         mCmhib16RL64H9LmX9AOyVaazesK5duXpBEnasvf/FRmgP37eN5rqfbl6eGnfT/e9ck6
         4K3q2Ue3OrUrZR+HrHCyzoHS2EOJX4LTvCwesoqh/Lfsg6dROOamJBk/tVh5BvvBYEMT
         CXFxGFDmc1Rczuh4Gq9Cyg0iwdyzR2TM+P3u4skeII6n2UmKu4vatsQJa0bc1TSPwNr+
         e/F6DTYo/EpS4SyBTKAJwjduaxt4pzgF6osQftvJzTk8rlbef7EpDLABiREY07fgj8gI
         nopg==
X-Forwarded-Encrypted: i=1; AJvYcCVSbfLhwyBaz2hPB+zuorIfzcht2nPoWot6iX0AuvDZ1SDCT31K5l1N240WZh2ekpKktevrpmbbSg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxQzVbV55ejhTT8epBiaVqqnFYsEAMFBJlHt/xXCwmleMo+YG2v
	dHkcQ8yqmqM1hItJ/TkblVsr5brZLIkocYh66boNi8YGuhWaKNbaIxjxMZ56orMkVX4=
X-Gm-Gg: ASbGncv0KYtSNCxT7OqWHdYJbkeulJxb3cVEPf9MB1dN3fozan7l5llzfKPM4l6Hyom
	cacyBGTDqnr2jIcrENO2+a94LvCwMmmaGXOMpknMSepniSjfWZXUCpxp28ujXAZJ2//kINpF/8x
	L4GGmVhahW5QzGmpnzyu62zKgyKU+axE+ld+ZJKWQuYpvFztuEE1XVafrXlzkDEcJa9p1oDpw6L
	AvZv7CFO74vhIwZGGWzL9Wli6nBNXHvmtUEMRjWto80ww4DXjrnoNFv+w9m5E0q0GW6gs4/nlCC
	fHmB5q5aKeajwZYTCQK4ERWesosS9qzl8e5q78c2ic1S15vaRqdE2RY3CMWGswPu/Kh2aLKXLRc
	G1Z4z7y/dTThyih82ZpgfZFBX3w==
X-Google-Smtp-Source: AGHT+IGF27PdZyeg1EvX94pFQxAflTBu48c8D8WbPdR0KPQVaTt6mijyvklij71b/3o9/nVYsvtdaA==
X-Received: by 2002:a05:6e02:2389:b0:3dd:8663:d19e with SMTP id e9e14a558f8ab-3df32936eb5mr24619895ab.10.1750852097696;
        Wed, 25 Jun 2025 04:48:17 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de37618a92sm45180245ab.2.2025.06.25.04.48.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 04:48:17 -0700 (PDT)
Message-ID: <5005ba79-d5a5-4d6f-ab0c-4df51407a549@riscstar.com>
Date: Wed, 25 Jun 2025 06:48:16 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] mfd: spacemit: add support for SpacemiT PMICs
To: Lee Jones <lee@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, troymitchell988@gmail.com, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250613210150.1468845-1-elder@riscstar.com>
 <20250613210150.1468845-3-elder@riscstar.com>
 <20250619144023.GG795775@google.com>
 <8126de92-0338-4cd0-98fc-4f8c37500201@riscstar.com>
 <20250625082149.GO795775@google.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250625082149.GO795775@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/25/25 3:21 AM, Lee Jones wrote:
> On Fri, 20 Jun 2025, Alex Elder wrote:
> 
>> On 6/19/25 9:40 AM, Lee Jones wrote:
>>> On Fri, 13 Jun 2025, Alex Elder wrote:
>>>
>>>> Add support for SpacemiT PMICs. Initially only the P1 PMIC is supported
>>>> but the driver is structured to allow support for others to be added.
>>>>
>>>> The P1 PMIC is controlled by I2C, and is normally implemented with the
>>>> SpacemiT K1 SoC.  This PMIC provides six buck converters and 12 LDO
>>>
>>> six or 12.  Please pick a format and remain consistent.
>>
>> "Numbers smaller than ten should be spelled out."
> 
> Never heard of that before Googling it.  Formal writing is odd. :)
> 
>> But I'll use 6 and 12.

. . .

>>>> +/* The name field defines the *driver* name that should bind to the device */
>>>
>>> This comment is superfluous.
>>
>> I'll delete it.
>>
>> I was expecting the driver to recognize the device, not
>> the device specifying what driver to use, but I guess
>> I'm used to the DT model.
> 
> Even in DT, the *driver* compatible is specified.
> 
>    .driver.of_match_table->compatible

I guess I just interpret that differently than you do.  I think
of the device compatible string as saying "this is what I am,"
much like a VID/PID in USB or PCI.

Then the driver's of_match table says "if a device claims to
be compatible with any of these it should be bound to me."

Meanwhile, the MFD device method has the device (cell) saying
"I should be bound to the driver having this name."

>>>> +	/* We currently have no need for a device-specific structure */
>>>
>>> Then why are we adding one?
>>
>> I don't understand, but it might be moot once I add support
>> for another (sub)device.
> 
> There are 2 rules in play here:
> 
>    - Only add what you need, when you need it
>    - MFDs must contain more than 1 device
> 
> ... and you're right.  The second rule moots the first here.

What the comment meant to say is "we have no need to kzalloc()
any special structure here" as most drivers do. Simply adding
the set of MFDs defined by the cells is enough.  The same is
true in "simple-mfd-i2c.c".

But this entire source file is gone now, so it's moot for that
reason.

. . .

>>>> +static const struct of_device_id spacemit_pmic_match[] = {
>>>> +	{
>>>> +		.compatible	= "spacemit,p1",
>>>> +		.data		= &p1_pmic_data,
>>>
>>> Ah, now I see.
>>>
>>> We do not allow one data from registration mechanism (MFD) to be piped
>>> through another (OF).  If you have to match platform data to device (you
>>> don't), then pass through identifiers and match on those in a switch()
>>> statement instead.
>>
>> I haven't done an MFD driver before and it took some time
>> to get this working.  I'll tell you what led me to it.
>>
>> I used code posted by Troy Mitchell (plus downstream) as a
>> starting point.
>>    https://lore.kernel.org/lkml/20241230-k1-p1-v1-0-aa4e02b9f993@gmail.com/
>>
>> Krzysztof Kozlowski made this comment on Troy's DT binding:
>>    Drop compatible, regulators are not re-usable blocks.
>>
>> So my goal was to have the PMIC regulators get bound to a
>> driver without specifying a DT compatible string, and I
>> found this worked.
>>
>> You say I don't need to match platform data to device, but
>> if I did I would pass through identifiers.  Can you refer
>> me to an example of code that correctly does what I should
>> be doing instead?
> 
> git grep -A5 compatible -- drivers/mfd | grep -E "\.data = .*[A-Z]+"
> 
> Those identifiers are usually matched in a swtich() statement.

OK now I see what you you're talking about.  But these
compatible strings (and data) are for the PMIC.  I was
trying to avoid using compatible strings for the *regulators*,
based on Krzysztof's comment.  And in the process I learned
that the MFD cell needs to specify the name of a driver,
not a compatible string.

>> One other comment/question:
>>    This driver is structured as if it could support a different
>>    PMIC (in addition to P1).  Should I *not* do that, and simply
>>    make a source file hard-coded for this one PMIC?
> 
> This comes back to the "add only what you need, when you need it" rule.

Yes, and I agree with that rule.  Thanks for your clarifications.

Using simple-mfd-i2c.c is much better.  I was surprised (and I guess
pleased) to see that it was almost *identical* to what I came up with.

					-Alex
. . .

>>>> +module_init(spacemit_pmic_init);
>>>> +module_exit(spacemit_pmic_exit);
>>>
>>> Are you sure there isn't some boiler plate to do all of this?
>>>
>>> Ah ha:
>>>
>>>     module_i2c_driver()
>>
>> Thanks for Googling that for me.  And thank you very much
>> for the review.
> 
> `git grep` is my bestie! =:-)
> 

