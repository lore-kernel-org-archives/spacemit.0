Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F2530ACEE
	for <spacemit@lists.linux.dev>; Fri, 24 Oct 2025 16:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761321971; cv=none; b=dsNjgRXo93AGiZN7NVmwWXqFwTgE5R0/M5HJsQJFWlUjMSTG3OrKSfWySD7/7JWf7gU6GWB2vEUCfgB2JdKQdfVVr34ChEL43pberRSqM09RFMqd6G53pvc0rZWrNVGsRKV97SAXSXqJP4Ynb5x22IG9auBZok2cVXLsBasSbuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761321971; c=relaxed/simple;
	bh=3c7bOwm7cR8w0+Jt/bY89sbewv1n9qT9ayt2xE6Ure4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZH/Rali+l1NjVIy3tvBBnLQHuV3vuuVpLRVHiytyy/ucRJpqaxXjOU8FasPl8Vyxj1ZIIBqaVHoOnYfVCyC3KpNUdoAN/ZcyA5vuprJ5EYEPEaUPNnFSfmXHFkWS3+EadUD+ZVbSb+Rx/nKwlM3nbSUuyZHCaRViBW3ULDkbx/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=ABx1ZvSE; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="ABx1ZvSE"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-940d9772e28so89035739f.2
        for <spacemit@lists.linux.dev>; Fri, 24 Oct 2025 09:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1761321968; x=1761926768; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DqiQwabN7+SNaCM6YCpwJPboZ1StVYh2yuL/aC6ivg4=;
        b=ABx1ZvSES7pQtIW5Xl1Z9K+oaWRjqVvBrXR1PllRohtDGM0SXituHvLlLQsNQnQ/k4
         khAST7+Vo6TG475R/6EWvkOZRNX04ge+HKfLVQ9X2QPftqs5+PHGGMxHyIE3S9IWL4kl
         q7IYR/ibSUDB/cMlDClkhUA5HlmiuFzmFs7JY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761321968; x=1761926768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DqiQwabN7+SNaCM6YCpwJPboZ1StVYh2yuL/aC6ivg4=;
        b=pZUS3Vq6dmgVpsV2ytiefb/cCvozRcTWUYBUU3ZXOAXerFJRZGj60uO/HkEksXQcgD
         r4H7RmYkE66ySdBydJNxtGvqoDXlt+PBDDgpXYk55pzmW06utrH8Wf+aGxfd7pZOyUKR
         0VWVE4qkbRJh/Iovq2sxFvAr/2Dfezm+aTaDeMW5PEfkl9MtcsbxKJauGPomAYrvyZ72
         4M4HHBZkggbDKUtgxqPhZXHSYnjgfOrnD39lswpzKwZ5J1Qtx2WByPzPlUCrwJh5+CqV
         IqZal1f3H3gjAgij2r3VkK0jQpkR3orwyO9p3GWBxd4oN57JLTEgheAr1V4L8Q0b9gnU
         1L+w==
X-Forwarded-Encrypted: i=1; AJvYcCXrAVBHlkdb4OrI+Ewub2q6f6+oVO/zpavAT66yejtoqR5BTOaI426eUGgMFISGsiwnMINDeEXadA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxgo8dNiLVm7/bFzAb2Ebgm7v6VmZCFfIDcaxroZE7xPoRYS46r
	B90EnJQLlZRXMp9wBUAuKEwiDQc37haHyq2ScZrRFEabOSKH3xIl0VEqTASAYoEY7g==
X-Gm-Gg: ASbGncvR1K1wIpWcWlvM9Nr1FvYiFZtxBo4HJKt4g5MWbLMm1GndVa2yC90JKsIO4+p
	QpUajFPSG+q+058TZnKGKZdC9dveXlZ1BqQXvrcMrxykOisZU24zxmhit4d5r56TL4Oypq+Wqht
	o8a4Ftn+uUHffIHatK8taPbOKvrsW7gbHkVvaa9gWEf5HsUACHmUGOIeKTwGBTWjyXsYveve44X
	qI+56heTnigL0k+uZdg8cpb6TxkT9CLVC3/vPLRF71lx0zdIZHFrZk4bq4zTNGhSEjYjjEbFRH4
	B9tgVKaMgdzIC6mn6Z9mo8bFgfxiUikzPvves/pj8MluwCI/uweivB7/8smxthflTrTqDOi6WdG
	9i8wtWwcLcNLPLZWZruoUl/EbqGXClIr/Wt1bjWGiUKxllG7zEUbifi351nqfIc4qd5PQ7va0ge
	A1e506YGzecTakSizzbeINKZjeHno1qIOKB/dh5u8birXNijRoRKSy+ddpay4=
X-Google-Smtp-Source: AGHT+IFmAZGPxYIrzjo/bVeYrd6msMNtUtiLRt6F5A4V5iIvDEZmEFUheqr1kCxRWvtPHxZLRSm8ow==
X-Received: by 2002:a05:6602:3426:b0:93e:8817:dac1 with SMTP id ca18e2360f4ac-93e8817de47mr3939194039f.8.1761321968049;
        Fri, 24 Oct 2025 09:06:08 -0700 (PDT)
Received: from [10.211.55.5] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.googlemail.com with ESMTPSA id ca18e2360f4ac-94102f86196sm191322139f.18.2025.10.24.09.06.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 09:06:06 -0700 (PDT)
Message-ID: <eee35fa0-0a5f-4730-b6e4-a1b92dc5000f@ieee.org>
Date: Fri, 24 Oct 2025 11:06:04 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] ASoC: spacemit: add i2s support for K1 SoC
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-sound@vger.kernel.org, spacemit@lists.linux.dev
References: <aPtiNCZ_KBezL2Dr@stanley.mountain>
 <E26A36F90026E89B+aPtkgbhoPoTzVnRN@troy-wujie14pro-arch>
 <aPtmbe9uoHIPfZz7@stanley.mountain>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <aPtmbe9uoHIPfZz7@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/24/25 6:43 AM, Dan Carpenter wrote:
> On Fri, Oct 24, 2025 at 07:37:51PM +0800, Troy Mitchell wrote:
>> On Fri, Oct 24, 2025 at 02:25:40PM +0300, Dan Carpenter wrote:
>>>      424         i2s->reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
>>>      425         if (IS_ERR(i2s->reset))
>>>      426                 return dev_err_probe(i2s->dev, PTR_ERR(i2s->reset),
>>>      427                                      "failed to get reset control");
>>>      428
>>>      429         dev_set_drvdata(i2s->dev, i2s);
>>>      430
>>>      431         spacemit_i2s_init_dai(i2s, &dai, res->start + SSDATR);
>>>                                             ^^^^
>>> dai is not initialized on failure.  Generally in the kernel we always
>>> check for allocation failures.  Even when they can't happen in real life.
>>> I was hoping they were going to make a rule that allocations under 4k
>>> wouldn't have to be checked but it hasn't happened yet.
>> Should I send a fix patch now, or should I wait for the maintainer to
>> revert it first, and then fix this error and send?
>>
>> Thanks for your report!
>>
> 
> You should send a follow on patch which just fixes the one issue.  If the
> maintainer wants to squash them together that's very easy to do in git.

Yes I agree, send a new patch, no point in reverting.  But I think
a fix commit is better than squashing (for what that's worth).


A very simple fix is assigning *dp to NULL in spacemit_i2s_init_dai().

         if (dp)
                 *dp = dai ? : NULL;

Also:  Why aren't you checking for spacemit_i2s_init_dai() returning
an error?  (Another--separate--suggested fix.)

					-Alex

> 
> regards,
> dan carpenter
> 
> 

