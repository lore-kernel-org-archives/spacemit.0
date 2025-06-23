Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A6A2D3A9C
	for <spacemit@lists.linux.dev>; Mon, 23 Jun 2025 19:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750708645; cv=none; b=Qkku6xp56nNjZ0/Y+4+3l6UjZ+gJavWj92nUbbPg5gp94mhsASyGSZ51vcR+U+Q+4G/V3gY/UsLa8TUP1WzSu6QNNuVKUQzBlWf1qz8bsor5alQeSgiD33iw6ItmDK+KNx3gP27WqNxsWJalvsHxXuEernZuAW2xW1W5JSg/awY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750708645; c=relaxed/simple;
	bh=Es1Ftq9XeYJygiQJKvxxzs7y3+Oamn8vfWLNo8sYtQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n2+0JjOVMjhptzcE9fKWbcKq05FiL4oZRStfUYiKGToZp2iPSO1lAnxOw/8KCCU8fcs4+J4JI9VPpIlytSZGLiMxj9yYJ7e+gA3m9wNpk7ra5gbnL19UP6xKmPP5ERscAmrJsfEbRiwzP8rhIHEy8Zt5/XCB6lG+3b7xSpXXo80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=QnT/09Wq; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="QnT/09Wq"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3de39d642a9so32216085ab.1
        for <spacemit@lists.linux.dev>; Mon, 23 Jun 2025 12:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750708642; x=1751313442; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qhCtv/W1YilWrYjCUxSunc8+8p4TVEIkoBhp1MF2Z8o=;
        b=QnT/09Wq66csauAmNpFFRHOShQ6r1GD6o5Mtvap7OKuI96/4Uh4HnE4MXmc8+yv+Y0
         HIgFNxiGrE1kynlzoHX0fEZRFq0VKkZ+ZKAHOKCoheovTu5Z/uUhsMSMPwzXl/NL8nm7
         y6IUOKL+BUNXD2pvXooh3mitEeFwvSHoOFQuPHbkqt/DBBicePTqGl6m82DGDUkttd5C
         TqONAZkUYbd9zDJFL4oW9pzhMi6BymXbJXrl4miIo/3V7CnJ24uDw4fJFj06m7vYRPw+
         7aUD8czNCWMia/HIzd1m8ayo+Ab8SZhTR4ndTbAc5/TvvcrYB5XXBbrM8sIO8XHJU6sL
         V/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750708643; x=1751313443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qhCtv/W1YilWrYjCUxSunc8+8p4TVEIkoBhp1MF2Z8o=;
        b=HBl5J7Ni04BPLFoljoT1FZVpFnVkcNy6+L+dhhk9Q6LqqGtvVrA88d7PUFQAGZnKG/
         vfHZR//amgDdNpsy0WB/ObsnPY/RYQLNqEjhUdHp3zTKt1P3rFnNbmPdjUsTNrZEvHVC
         riJSVUezL9IIQD5X4YBpZmTcUFCcuEjX9kWsSp9A//1ZOqhEQPaPukhI7Cbe4C3iPfbE
         Xg+zkVMY3+aH1HgPtym3kPTB7jXN2FKdI3/Mel8ar6/ICuNa+l1Sv4XVvYXzxnb5xbCE
         s1HQlrbEkVGD4/Tbie18peBglCPHmMOcz3R0oX/CrdpCrG981oD8TN6vwXnbX/R0ugwV
         VMDg==
X-Forwarded-Encrypted: i=1; AJvYcCX9k9HaXmKtQZ/4wCo+Jf9WQr2QCDKiPYXxk8YAZFDjDuAMuhrfxcPV+Jr7EuGJ3VPb0nGOv2fb0w==@lists.linux.dev
X-Gm-Message-State: AOJu0YymTJn/i4zFEpTKuX3fK140s3O716LmpR5Gk2Dag/7yy6fn9EeT
	yzG2f5466ZwJn1PL3wFHtBMsUtgpMT0BC1mGOE7spJChdO27vInexWZkY8TTKUTD7Sg=
X-Gm-Gg: ASbGnct7dZwWb3og8f+OZwL9tXNAJyoKcS1VEYXDuQWzlpVHQt6jdcd841H3qh8/KJz
	61dodsM9N07oeIQU3DEuQmA7UQbFg/U4QOBmVjcugQhI2VmBkNAIXxOtB0iXfs/0lvE/OPbL/xt
	LRRLGuYWRlCAGOuI4x9IVclWZwkZ6TXSSVg5AoYG3U469+5nQX5Bjq+/3Wn2gSc9LrXsXtys/63
	7P7ThzQY6bhDcT4GKEXUm0AUE17NWyXLCXpCRj9JG080yNqthYYEnj9oYctnlneIvz+S2W1fW8j
	YZxLxvePaDbFShVNU1tdrGmB4DOy5RC7xeF9iFq3yqzkY/0vz9l7CUuKr+AWKePK4BPcrW6zpzH
	xGBpnhA4GPYLLzBZIgjlWwGj7ZQ==
X-Google-Smtp-Source: AGHT+IEjrZfqFnrATrpmzrnCBPEt3gJFXHl6kwuKElD8eQ70QsQ57w3LAu8TuunEO8GEQ3e+/ulOLg==
X-Received: by 2002:a05:6e02:3c03:b0:3dd:b808:be68 with SMTP id e9e14a558f8ab-3de38cbfe51mr160467165ab.16.1750708642553;
        Mon, 23 Jun 2025 12:57:22 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de37768c8esm30846015ab.68.2025.06.23.12.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 12:57:22 -0700 (PDT)
Message-ID: <2f66c3ae-bd55-4835-86a1-1f9daa391e09@riscstar.com>
Date: Mon, 23 Jun 2025 14:57:20 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] rtc: spacemit: support the SpacemiT P1 RTC
To: =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>, lee@kernel.org,
 alexandre.belloni@bootlin.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dlan@gentoo.org, wangruikang@iscas.ac.cn, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 troymitchell988@gmail.com, guodong@riscstar.com, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-rtc@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20250622032941.3768912-1-elder@riscstar.com>
 <20250622032941.3768912-5-elder@riscstar.com>
 <d35922c4-fbd0-4d13-9bcd-2688b48c0045@o2.pl>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <d35922c4-fbd0-4d13-9bcd-2688b48c0045@o2.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/23/25 1:54 PM, Mateusz Jończyk wrote:
> W dniu 22.06.2025 o 05:29, Alex Elder pisze:
>> Add support for the RTC found in the SpacemiT P1 PMIC.  Initially
>> only setting and reading the time are supported.
>>
>> The PMIC is implemented as a multi-function device.  This RTC is
>> probed based on this driver being named in a MFD cell in the simple
>> MFD I2C driver.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v3: - Added this driver to the series, in response to Lee Jones saying
>>        more than one MFD sub-device was required to be acceptable
> [snip]
>> +static int p1_rtc_read_time(struct device *dev, struct rtc_time *t)
>> +{
>> +    struct p1_rtc *p1 = dev_get_drvdata(dev);
>> +    u8 time[tu_count];
>> +    int ret;
>> +
>> +    ret = regmap_bulk_read(p1->regmap, RTC_COUNT_BASE, &time, 
>> sizeof(time));
>> +    if (ret)
>> +        return ret;
> 
> Hello,
> 
> Are you sure that you read the time parts consistently here? I mean:
> is there a risk that the clock is updating below you - so that for
> example during the transition

The documentation says this:

   If need to read the calendar value currently recorded inside
   the PMIC, need to read RTC_COUNT_S first. At the same time,
   this operation will latch all current calendar values to the
   registers RTC_COUNT_S ~ RTC_COUNT_Y.

The RTC_COUNT_S register is the first one read in the I2C
bulk request.  So I concluded that the request would record
a consistent timestamp in all 6 registers.

That said, the downstream code did a loop as you describe.  I
will ask the vendor about this.


Related:  I disabled the RTC while updating (which is what the
downstream code did).  But based on what the documentation says
I shouldn't need to do that either.

   If need to reset the current calendar value, need to
   configure each calendar value (RTC_COUNT_S ~ RTC_COUNT_Y)
   in order. After finally writing the register RTC_COUNT_Y,
   PMIC will update the calendar value configured by the
   current user to the internal timer of the RTC module, and
   so on.

Here too, the last register written in the bulk request is
RTC_COUNT_Y, so again I think a consistent value stored in
the 6 registers will be updated at once.

Either way, I'll make an inquiry about both of these.  I'll
explain what I learned in the next version of this series,
and will update the code accordingly.

> 12:59:59 -> 13:00:00
> 
> you are going to read 12:00:00 or 12:59:00?
> 
> If so, you could for example read the time in a loop until you get
> two same readouts.
> 
>> +
>> +    t->tm_sec = time[tu_second] & GENMASK(5, 0);
>> +    t->tm_min = time[tu_minute] & GENMASK(5, 0);
>> +    t->tm_hour = time[tu_hour] & GENMASK(4, 0);
>> +    t->tm_mday = (time[tu_day] & GENMASK(4, 0)) + 1;
>> +    t->tm_mon = time[tu_month] & GENMASK(3, 0);
>> +    t->tm_year = (time[tu_year] & GENMASK(5, 0)) + 100;
> 
> Is it necessary to use the bitmasks here? Are the higher bits undefined
> in hardware? If so, is it necessary to mask them while writing the time
> in p1_rtc_set_time()?

It is probably not necessary to do the bitmask.  But the upper
bits are marked "reserved" and so I the correct thing to do is
to explicitly ignore them (by masking them off).  Is there a
reason you'd rather they not be masked?

There should be no need to mask them in the set_time() function.
The core code verifies all values are in range before it calls
rtc_class_ops->set_time().  So the upper bits should all be zero
by the time p1_rtc_set_time() is called.

>> +    /* tm_wday, tm_yday, and tm_isdst aren't used */
>> +
>> +    return 0;
>> +}
>> +
>> +static int p1_rtc_set_time(struct device *dev, struct rtc_time *t)
>> +{
>> +    struct p1_rtc *p1 = dev_get_drvdata(dev);
>> +    u8 time[tu_count];
>> +    int ret;
>> +
>> +    time[tu_second] = t->tm_sec;
>> +    time[tu_minute] = t->tm_min;
>> +    time[tu_hour] = t->tm_hour;
>> +    time[tu_day] = t->tm_mday - 1;
>> +    time[tu_month] = t->tm_mon;
>> +    time[tu_year] = t->tm_year - 100;
>> +
>> +    /* Disable the RTC to update; re-enable again when done */
>> +    ret = regmap_update_bits(p1->regmap, RTC_CTRL, RTC_EN, 0);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_bulk_write(p1->regmap, RTC_COUNT_BASE, time, 
>> sizeof(time));
>> +
>> +    (void)regmap_update_bits(p1->regmap, RTC_CTRL, RTC_EN, RTC_EN);

> Perhaps you shouldn't ignore any errors here - failing to restart
> the clock should make p1_rtc_set_time() return an error code.

I intentionally return any error from the bulk write call.

But you're right:  if that doesn't have an error and re-enabling
the RTC does, that error should be returned.

I'm hoping there's no need to disable the clock after all,
and that will simplify things here.  But either way, I'll
take your suggestion (but still return the first error if
more than one occurs).

Thanks a lot for the review.

					-Alex

>> +
>> +    return ret;
>> +}
>> +
> 
> Greetings,
> 
> Mateusz
> 

