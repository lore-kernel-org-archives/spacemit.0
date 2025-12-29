Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AEC1D86FF
	for <spacemit@lists.linux.dev>; Mon, 29 Dec 2025 18:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767031348; cv=none; b=Dm5UaHvEP14M60pJw9XoKMSIlp6L+XVHTr6YXJIS6XMFTTzpv/axCLfxZg5GHJIiV0J0MCCQZ6pmrSF4gKDZK4c2EmYYDPE8PbiHg6vh1lfnXGOmcMdkHK4kUhSnlIapfxvb3fW4bqQWeNGEU3GNSdmygmKlN5cH6uFpWTY9jJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767031348; c=relaxed/simple;
	bh=Wq4FNyNXdL2dOO4wrLWKkEOSeqpU9XuvsacZ1Is3UGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k2eoerhzK2+2VNeKZlMkH5KXa5UA+WmmRzzMGNX7f9hJ+3G3sLr9kcsPnSkHgV7hwVudNkr5/3hF0C5yYziE/Fzo9AX/W5Z0iJM6tbgkCIZU0VzvR3zu/hqUo8v0aJKdVHFSJ82CF91zGjxRCjqohxjOvvUadBkwHUmBooiNZqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ms3PjTF7; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ms3PjTF7"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-88888c41a13so118393356d6.3
        for <spacemit@lists.linux.dev>; Mon, 29 Dec 2025 10:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767031345; x=1767636145; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xDy1M86lySMiZB+6e+NfnSGr5v4JHWbEjB5Zb9z5vPo=;
        b=ms3PjTF7kre9m7Mmup1BMzlbxaiylffHOlg/yfpo74VxF4cox32zpuK4oo+nuq3Dh7
         vXGnS93gO1W0j5EoIpqIq4NPwiXOngVsjktJ9Hbgo/VcEkuS0+1jlol1D1RNQ0ucUgu0
         UMot/H1kPIdtI+/p/HRoMYOqBLFchfVXRrHyPUxnxLqr/0iT6tziOXb5+NLRYsexGoXq
         3YG8F9yMoZALQfCyv1cbw5/y16FIABjVx+wmIQOzrCNvHkxMWCgXU8ztrUaj2vgZrBae
         MbWInJ5OOiswLEVmwFp4pL1kdzZ/RTOfLqqNK08UsQjLWXodAwYdk/8yWILzS4b+kG0j
         5U4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767031345; x=1767636145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xDy1M86lySMiZB+6e+NfnSGr5v4JHWbEjB5Zb9z5vPo=;
        b=MXlXKjVjxvUBnW5Dl3L6gNUoqHrFVufOtVroJZNKrPFIKJUhNBreUGEZgW8LGlvLrm
         +T8xf7KdaSqnSsyZud7y8dEP5BjC95/6w1tFIwqHHFPrtVNC/5koogqhsn8u2jiw9f+C
         AN/J1I7O59vi71T5rugF7TvIRQ+QsAEqIoPNjcz9i8topaI5eiWSFmvMNn9wsLf1Ul3h
         aNRZgsvi/V7Qi//xyLVmy6jJB/t1+1tcJaSDdG49mELzTkcesSB3ZJdRuHA9mjP2Isqc
         r5uh4ybhsyJUvsyr10Ixm1kT3G/BZwavwLWY1yf+9P2v27lBpBt3kqQsxTX3Acj5gI3H
         aOgg==
X-Forwarded-Encrypted: i=1; AJvYcCVUGPBTpKB2Vel7Yx/5n/RHnH2BKGlx7JF3cxTO56HGBpSoOVMIjx/EAVix0VR/4U+MxnNDckFIYQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxybluBGcZs6b0OdUPb8p1QLBmaLxjo3XaJD0gm3pMjZNBNT3AO
	GoD7KRbbzN84XmTiY0SEGf9fTSW8xgD/+tujcu7y3iADm+9LR3kQx2ZweznLWivGGQI=
X-Gm-Gg: AY/fxX6loMws2mYfj8JzFoFIQzOdHzY4RTk++lepxMzPEGlNuyFez6yV/OLK67nyFUu
	Aa2mZlt65168wRkak0m2e6X+8ZO5MXSleUa+l/EXY20VsE3BwWRilulc8jxJx5JxvM7uXxKmnKk
	R9cgQGwZ6QdfJJV3t3dF87MyvbMuqjCJk+JNm0WMlrMGDHnk2zrofhsdXbqSDU1DdeeDLQSGh7X
	QO6Bv5eCiYMKPcvQNuJD0ii6Lo/LHQPdMzLfsb0tl8jKGjhHtdTZwyS3pn4VWDyQxZgJ7Me5gvl
	2OIvCSe54PiNUOsobFp1DrZJNKenxi2MKG62kUS2UwM6u5fLfcHKAD4uu6EmrEMBmObTtlK+1Bv
	zWwHUbyYuVoPq0V7ielSvpYNBbX4pgS11qdCqSvHkxtkeHEQzFX9iv6Lyen54lb7cgIocB7FzI/
	NPDm/YPD8FeooMMM2gu15nVScWmA==
X-Google-Smtp-Source: AGHT+IGXtGMT6O6A6KaQIdzPXBUgINz+WinbQ4cwEL4NneioBCpZL0bLeOv1X+9oO0ye3ANqbf5YQw==
X-Received: by 2002:a05:6214:3a83:b0:888:7d0a:18db with SMTP id 6a1803df08f44-88d83a78234mr548804566d6.48.1767031345078;
        Mon, 29 Dec 2025 10:02:25 -0800 (PST)
Received: from [10.211.55.5] ([209.81.125.20])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d997ada77sm231925916d6.37.2025.12.29.10.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 10:02:24 -0800 (PST)
Message-ID: <4c7c0f69-4732-4f62-970a-2a9273b3b5c7@riscstar.com>
Date: Mon, 29 Dec 2025 12:02:23 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] rtc: spacemit: default module when MFD_SPACEMIT_P1
 is enabled
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Andi Shyti <andi.shyti@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20251225-p1-kconfig-fix-v4-0-44b6728117c1@linux.spacemit.com>
 <20251225-p1-kconfig-fix-v4-3-44b6728117c1@linux.spacemit.com>
 <202512251653368b33c7e7@mail.local>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <202512251653368b33c7e7@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/25/25 10:53 AM, Alexandre Belloni wrote:
> On 25/12/2025 15:46:33+0800, Troy Mitchell wrote:
>> The RTC driver defaulted to the same value as MFD_SPACEMIT_P1, which
>> caused it to be built-in automatically whenever the PMIC support was
>> set to y.
>>
>> This is not always desirable, as the RTC function is not required on
>> all platforms using the SpacemiT P1 PMIC.
> 
> But then, can't people simply change the config? I don't feel like
> this is an improvement.

It's not an improvement for people who want to use the SpacemiT
P1 PMIC, but it's an improvement for all the other RISC-V builds
using "defconfig" that would rather have that support be modular
to avoid needlessly consuming resources.

I haven't done any testing on this but it looks fine to me.

Acked-by: Alex Elder <elder@riscstar.com>

I think it's a small change worth merging.  I don't think
doing so does any harm.  Your call or course, Alexandre.

					-Alex

>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
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
> 

