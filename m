Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D719226D19
	for <spacemit@lists.linux.dev>; Thu,  8 May 2025 12:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746708174; cv=none; b=oS+H8kZiyrAxEMnMlh2SfX2JdzSkCwIi48tV+QMSHjg0t7/b7YgoRHFILoKY3ZtrCFJVmKZfp9wDS8kogKhvPJsnTJBK5FL88UMXKEb8XLhNgCsi/GBTQi7YA/6BFS02LI8vrAEtLw/wV6psEM5BA2hrBpvkLYLeixRxHfEoySk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746708174; c=relaxed/simple;
	bh=FJft4ykFn4r+3Ixy2UkaLsf7DlcyK2asv15fMXuVTE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B/Y9r8qlcdyI46jSCqEqH7ZhQyNYT0u6LSHh32NQn6FViSUB7S601r7Yaa3uezCY+11PoSr6sDJd9mj4xIwO+JDqLPLPuBRUwCgqShxi+vYgQ8Lk5M4l4E8qXg6iepZ3vagOCGtgMEAFPy46L6WxjjYAMa/sJIgJKid+oTbdAP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Xl4ToY9h; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Xl4ToY9h"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3d9189e9a06so3775615ab.2
        for <spacemit@lists.linux.dev>; Thu, 08 May 2025 05:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746708170; x=1747312970; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZPxzY778BTzrpTVkXEIU0dpBm2FrQRvJ11cMwg4f8Tc=;
        b=Xl4ToY9hhKnbSd4TBxX9Uw+gJ2kp/RH+4aIcKJPJALbrMFszdtEBLvopnRN57JeoEo
         czx+zbZqwzZLaNmg1qe15GgbBhmMzTwgMBW6lpR2n/+lvbKEJByVA9vnxRYoAW0Fkuwv
         3Ni/d2D0l15Blfe3kc2YWlYZ2R/FwcUcmHS6sljeN9aHYiu+nnjL1wG4kw1w0GBmrZsl
         5I2MbYI6tH0whm48bcadnHBXLH3Brcg+B66yudn8Qo5rqOdiFUUb2QcfzWqGIzrMos1d
         pXD5jnIjKLk3YF5qSFHzexxMoekig8RmwDTnRTOEb93eZTynXnEewOiOApS299JNQafe
         W1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746708170; x=1747312970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPxzY778BTzrpTVkXEIU0dpBm2FrQRvJ11cMwg4f8Tc=;
        b=utlyJIjNfpZw5EimTWpBCmlisyaSDooCBDcXUMTVJ9Y2Nc7KUp6zv81LJmXJ4RBM6Q
         q5ckYMvCuiaa5se9SAAuckb+A2ZFvFffbNUK8y4KKLmXSIVY6LS3U8ESq4Crl8cdrTEV
         srTagoP/yJ72D1PHL2FQFFhiVZ94cPyvKA0UGehs29yhpNHaBQOY0ktwcb4CgyneDt3c
         +hN0HApfKQTyZVTap03Bzr7n33v/jxx5zOHnggBiy87XZ3w3C6o2fhvGi5am+ka6H9Ps
         odX31JBKMU0HIkdBbhE3viwurD7ic2u1cuRhLRNqtyiim7VVcUB61u6nhqm/yaXF07G2
         fHGw==
X-Forwarded-Encrypted: i=1; AJvYcCWjRzheHF5+zZQ9OGgYnwqHUIR+QU1G+5QHGM3cZirwsGhrUEgN5rQmYWAzJw58EFWRvLmQUp671A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJbsm61EYCfY1/5OJL90sxFhTDYWs8gPBe7HIrnfKR44H/jffk
	ISCqlzfLL2z8Ld15XNSL5MzkTA+ks1++3n9oHiQabQAikD7BiI9FlNq1x9lMUbY=
X-Gm-Gg: ASbGncsjwKrPeBmD15Zx/aQRcJJvQ45UX2r2XCPKhpr+4ZaJ0vfkfazyKEcaqrfuiqb
	i0VfmIA+XXv1qD7v8SENrc31kyc9HZQvxoVldY9CpmDS79JplXBsW/KKDWEwtKUdn4gjmnGsI/P
	5vd+oOBf3yHfnnhnhJH4rQa12vH4Zu5PxfFjk2M1BK+IWgjc/wDDaNeLi0Zia7PzsXzR8oTESdK
	x9dNm3FmBkmoM8vcE6vpuetwsRMlcT/WxBig7vXfREXw556b72pawIBlgCTIHhldcglMVvZTRcb
	iSvAzFWKmX/x4gT/13Ruuld+iIUJfPbYyHgxz7ekJiIPukeaYvE25WxJ4bHQE4me+7C5SheHW/R
	y1tbg
X-Google-Smtp-Source: AGHT+IHinvHLNqxRhaY2b6afbVsRjVu3/5Tnou0kd+6vPsXAPuyDnBpQ8CoLFULaXpnrzUsemLIJvg==
X-Received: by 2002:a92:cdaf:0:b0:3d8:975:b825 with SMTP id e9e14a558f8ab-3da738d5b28mr84407595ab.5.1746708170546;
        Thu, 08 May 2025 05:42:50 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88aa8e068sm3135636173.108.2025.05.08.05.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 05:42:50 -0700 (PDT)
Message-ID: <5799153a-c9dc-4145-9993-7e5d99a6a0b8@riscstar.com>
Date: Thu, 8 May 2025 07:42:48 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] dt-bindings: soc: spacemit: define spacemit,k1-ccu
 resets
To: Krzysztof Kozlowski <krzk@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, heylenay@4d2.org, inochiama@outlook.com,
 guodong@riscstar.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250506210638.2800228-1-elder@riscstar.com>
 <20250506210638.2800228-2-elder@riscstar.com>
 <20250507223554-GYA505240@gentoo>
 <22b7b5fc-6f5a-4ce8-ae12-a7423925c113@kernel.org>
 <1521c828-31f3-4e45-a651-750ce2e37364@riscstar.com>
 <2ce8b9e5-562e-454f-9e2b-f2796d309063@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <2ce8b9e5-562e-454f-9e2b-f2796d309063@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/25 7:36 AM, Krzysztof Kozlowski wrote:
> On 08/05/2025 14:17, Alex Elder wrote:
>> On 5/8/25 7:02 AM, Krzysztof Kozlowski wrote:
>>> On 08/05/2025 00:35, Yixun Lan wrote:
>>>>> +  - if:
>>>>> +      properties:
>>>>> +        compatible:
>>>>> +          contains:
>>>>> +            enum:
>>>>> +              - spacemit,k1-syscon-apbc
>>>>> +              - spacemit,k1-syscon-apmu
>>>>> +              - spacemit,k1-syscon-mpmu
>>>>> +    then:
>>>>> +      required:
>>>>> +        - clocks
>>>>> +        - clock-names
>>>>> +        - "#clock-cells"
>>>>>    
>>>>>    additionalProperties: false
>>>>>    
>>>>> diff --git a/include/dt-bindings/clock/spacemit,k1-syscon.h b/include/dt-bindings/clock/spacemit,k1-syscon.h
>>>>> index 35968ae982466..f5965dda3b905 100644
>>>>> --- a/include/dt-bindings/clock/spacemit,k1-syscon.h
>>>>> +++ b/include/dt-bindings/clock/spacemit,k1-syscon.h
>>>> would it be better to move all reset definition to its dedicated dir?
>>>> which like: include/dt-bindings/reset/spacemit,k1-syscon.h?
>>>
>>> Please kindly trim the replies from unnecessary context. It makes it
>>> much easier to find new content.
>>>
>>>
>>> I don't get why such comments are appearing so late - at v6. There was
>>> nothing from you about this in v1, v2 and v3, which finally got reviewed.
>>
>> Stephen Boyd said "please rework this to use the auxiliary driver
>> framework" on version 5 of the series; it was otherwise "done" at
>> that point.
> 
> Stephen is a subsystem maintainer so his comments are fine or acceptable
> to be late.
> 
>>
>> Doing this meant there was a much clearer separation of the clock
>> definitions from the reset definitions.  And Yixun's suggestion
>> came from viewing things in that context.
> 
> Weren't they applicable to v1 as well? How bindings could change with
> change to auxiliary bus/driver?
> 
>>
>> Given the rework, I considered sending this as v1 of a new series
>> but did not.
> 
> Sorry but no. Bindings headers at v1 are exactly the same or almost the
> same as now:
> 
> https://lore.kernel.org/lkml/20250321151831.623575-2-elder@riscstar.com/
> 
> so this idea could have been given at v1, v2, v3, v4, v5 (that would be
> late).... but at some point this is just unnecessary late nitpicking.
> 
> So what then? Imagine that you prepare v7 and some other person gives
> you different comment about bindings or bindings headers. Then you
> prepare v8. And then someone comes with one more, different comment,
> because that person did not bother to review between v1-v8 (that
> imaginary future v8), so you need to prepare v9.
> 
> I don't think this process is correct.

We'll stick with the original binding definition.	-Alex


> 
> Best regards,
> Krzysztof

