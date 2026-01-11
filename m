Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39357352C39
	for <spacemit@lists.linux.dev>; Sun, 11 Jan 2026 19:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768161486; cv=none; b=KC/ZjTc2sUMD2cftetjpYFct/LES+mD7L9TwfDMDdNE052exLFd7qSVKHLxtEXuhCohs8dUoncAWX9y7RwkcZlBWRm+fgTGo9FA+MhuIidA0Ve0oLJmzt03U5PbbPMREoIF5mqpMD6e9Ozf2pYJfZATCAI0YwX7E8binuUlJwWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768161486; c=relaxed/simple;
	bh=z/9aym3YtgfCN06pEMgzSWhuMz1pnW2LST7SY6XR2LY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q7KE+kAEynwqajiQM3WdjTrz9ddT0Hz5ofqV/2Fa0ug3HN1tDU9coGErBGqPhIA3tE6gVYJX8IT/piU4KzIKZLnnyY371OmSTfwtG+35hP9IZRYpqqIHdLNbBV7gzWHIwnsN3hieKm2tfDh0GvPfi/OT/LKDgaNgs25Y4BqVRvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=FSLFe76A; arc=none smtp.client-ip=209.85.222.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="FSLFe76A"
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-8ba3ffd54dbso875552185a.1
        for <spacemit@lists.linux.dev>; Sun, 11 Jan 2026 11:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768161484; x=1768766284; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rp7nIV1t3K3PnuJ7T0RnV1mDaWDy2tcwUgBfEvmqexc=;
        b=FSLFe76AhESO8zU3k4Dqxx3woL4AF5ImwmSS3BdjXQTXUFMHe3poXkuuHLsVnDUfRT
         0yBiPySV3Iss3WHbu8cb4eG7A31XeNfVO1Xj1WWuSh9z0dqLHgoW34FAklsbAyM51KfZ
         MDM6YldUIC7tRS8xE1B/7+mKMNnLMQZ2bOXeIBkuRaGMmFMaAqYWpu5zHCNnFXBMGzrM
         YIC7tSDBPkfGVTe2fmA3GaSk18lNkkicfVWYWFeGdIMOakKO3j/3jIlDamNrTyl0dHw+
         n1fklUuqSGLxr0MqYqpJiphKvxrcDBgXselNRkdqhcF+fRJR8peg7mZkXaKqF0CFQWe3
         QPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768161484; x=1768766284;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rp7nIV1t3K3PnuJ7T0RnV1mDaWDy2tcwUgBfEvmqexc=;
        b=UMUgx6Cz1g5TNOCcIrDLPwL9PZEA53mT8CpCkd4EaCMeF1tOcsTRgPwz+NfsUg2khk
         jbYnPbHV95QOEHF3Y7yS+TAFS2+g9LKdk2aoNH65WBQoFQeOpYnPf4/Mw+bHkBLIcOqe
         ZBR01U0/+anJnm+Uk4EHjAZshHb23k3n1b+Rl1pCFaz55bW74UeY+0kHJQ9tLCY2P8el
         JKPEr0c9x341CLuXoRHViSwVMvUGhFapmqss7DX7bQDo7otCTanbJifO14UZuyXbQQvf
         4i1QjQXIKxtKuqjDi3acWFnBk4/Qt2iiRFRRQifTViNd2AuN7NDy70fPW6iTusgLgdwO
         +IEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfS8AsyDaPikg6QYQh+WTYR04ZEPIhpJUNg9mRKvgkyhOpXUBAttrwDFjsUS04SnGUbk2WpqkN7A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwrGiuhiuwt+VaWeOUD6CALwhMgpPJe5vuSmf1pr+7jrH594lWy
	hxs9eYLlSEG+EqVmNHCkgVVucdjvETbTTdIMyI8GVzQdn2DeloGF76TEY3uz7+bd1P0=
X-Gm-Gg: AY/fxX6qTmwH7fi8+E5ospunVn01aXqtWbCG+dYZl6qixiYoTT+7l7W8wSCTv7A10IX
	HqJSuFzw2d4BK4dRGiBKjXr66JBvfuZxmMjal8oroEzrV7na0AKL4DckuGxBZMYScZIcp0syiOj
	ItN83kvbvEO/W0IDUkL/5Od8sWB6NFww7F75WXrRNx+EF0cxsxJp3qE0QRWbAhp+ZAMQ0xHaiUx
	3ik+9MRrSJ75OWzo7CIOuh25pgUfwoLT2kvsF7CjQ5SCRLcJnp7zA9yw3Nt9FB5eBcF33b0e8C6
	PKVjZXt5eHgXT3/Klvd2ZmeAoSN3suRVSakCl08Jz69LLijT+gJO5os+gCWxPpC9X48GrWkf0hJ
	040uwJot3fK21y+oFWc5AxsSKlNO8ZM96H7Xoc9SLbqOMd6H/28mpQdhfwed4/EPxv38mSMLfak
	7XlQALJYNfdj74XzO6KYMsCZzSGjBIe+caKcSI2RYpFXpbewZyQfyR18nuKTyWCxAH
X-Google-Smtp-Source: AGHT+IGdzsnyz2r9XcWFhgYQrFdZnMY+NLVEokAuWRYPrckTaify+dIl447b52d76HmKL9FYD5Hb5g==
X-Received: by 2002:a05:620a:4804:b0:8be:8e5a:7a6c with SMTP id af79cd13be357-8c389416effmr2293547585a.73.1768161484118;
        Sun, 11 Jan 2026 11:58:04 -0800 (PST)
Received: from [10.211.55.5] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f5312d3sm1325432385a.43.2026.01.11.11.58.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 11:58:03 -0800 (PST)
Message-ID: <efe5c5e8-6b29-47ff-a3cf-9449f03890e6@riscstar.com>
Date: Sun, 11 Jan 2026 13:58:01 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] rtc: spacemit: default module when MFD_SPACEMIT_P1
 is enabled
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Andi Shyti <andi.shyti@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20260108-p1-kconfig-fix-v5-0-6fe19f460269@linux.spacemit.com>
 <20260108-p1-kconfig-fix-v5-3-6fe19f460269@linux.spacemit.com>
 <20260109223839b59ca7ce@mail.local>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260109223839b59ca7ce@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/9/26 4:38 PM, Alexandre Belloni wrote:
> On 08/01/2026 16:38:56+0800, Troy Mitchell wrote:
>> The RTC driver defaulted to the same value as MFD_SPACEMIT_P1, which
>> caused it to be built-in automatically whenever the PMIC support was
>> set to y.
>>
>> This is not always desirable, as the RTC function is not required on
>> all platforms using the SpacemiT P1 PMIC.
>>
>> Acked-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> ---
>> Change log in v5:
>> - add Alex's tag
>> - Link to v4: https://lore.kernel.org/all/20251225-p1-kconfig-fix-v4-3-44b6728117c1@linux.spacemit.com/
> 
> See my reply on v4, this is still a NAK for me, I don't believe this
> change is necessary as soon as the default for MFD_SPACEMIT_P1 is m.

Yes I have reconsidered what Alexandre was saying and now I
agree with him, I don't believe this patch is required.

					-Alex

>> ---
>>   drivers/rtc/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
>> index 50dc779f7f983074df7882200c90f0df21d142f2..53866493e9bbaf35ff0de85cbfe43e8343eadc1e 100644
>> --- a/drivers/rtc/Kconfig
>> +++ b/drivers/rtc/Kconfig
>> @@ -410,7 +410,7 @@ config RTC_DRV_SPACEMIT_P1
>>   	tristate "SpacemiT P1 RTC"
>>   	depends on ARCH_SPACEMIT || COMPILE_TEST
>>   	depends on MFD_SPACEMIT_P1
>> -	default MFD_SPACEMIT_P1
>> +	default m if MFD_SPACEMIT_P1
>>   	help
>>   	  Enable support for the RTC function in the SpacemiT P1 PMIC.
>>   	  This driver can also be built as a module, which will be called
>>
>> -- 
>> 2.52.0
>>

