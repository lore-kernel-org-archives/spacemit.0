Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E090D1C5D7D
	for <spacemit@lists.linux.dev>; Mon, 29 Dec 2025 00:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766969885; cv=none; b=Fn1feK8wdZ9FzBiryRhtkKwtFLArSKk8fMOuvpwSUPw74CSuYEhgUTCao24u48JRxedWaPa57OovsaCQOTAU6/QW0fcnfz0gKF4j91wft008ZgVDQP5yGK60EFPfwWpr/0nWA14QsWZsldPYW0BDw+w3r4uB9A+02ObjKAWl8ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766969885; c=relaxed/simple;
	bh=eXOy10oeUU64eQXYQ70XYcx1sMmIGm1IbQQLP4gGXVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WqFivNcpOOADe7oG/TXr9+V4CgB6gDtryvPBW9YtePUyHL1LvewVF1LCrSIuOgfk3CZJWMpw40eC9otDiRLhHxKvsKxMgK/vKSQHSO6QL/Pwh3I7EuwPdmG4lEjDkuLj5Y4V4ZhONFQDHozf0PC7OeOdrGoJLFOhy86YfiDMlbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=yeGJehoe; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="yeGJehoe"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8b31a665ba5so959799785a.2
        for <spacemit@lists.linux.dev>; Sun, 28 Dec 2025 16:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766969883; x=1767574683; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=udz/Ywp00lT4GZoeinIo9QMm0ZTiY0IiwK5PiD3CPXA=;
        b=yeGJehoe6aeSwcqwwnWXoCFE5cMQFic0lt2zgogqdQZBd7NI59pnxJwawjWOWk5srS
         FwxfcR95Q85LrL0NiNcxF0lYd64WrjRIhfwDE1HTr3wqx0UplRPOyrvK7nPa8kdQS298
         9F/Rk2uuCiLd0bwhHdEQixjERURRc3pL03N7OU2XM1zhKfSGoeL4A0Qe4f2mDrzp0iki
         nDJU0MIZjRGpTIUbriNkxBDRE/aNlOu2Z5+0EFzO6f/NnwSUVdmCwYjtJridmhF67XAD
         9r0y/GN/8at+hUQA4Hf3dztD9+feUvyu6tEmAXjb/x8n5IjyLezK+fjCht/gSe5z+QD0
         3lvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766969883; x=1767574683;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=udz/Ywp00lT4GZoeinIo9QMm0ZTiY0IiwK5PiD3CPXA=;
        b=ZIX/aUULv+GhQpzkgR5MiDCfJG6VV48s/qyxyLICGH4LKaOFxGE2B9TZ/4Duo27wb7
         1BN30drrsjRSmy6pC4Xc5G1IYUU4lJ8Gs+2pMRUbmrUHNXMUBGW0Z1HuFrQWVoGlBiUy
         725sA0W7xf+UQ5PfxGl7Ix3kEm1C/A2BOAH4zBTxoFNo2TscVeaUPi0k9/Yl/vm5dwCX
         rNbFAgIIw2Fu72W+IgC5oxotVpnBNIhg7KLutrVjG/Pk8y6+1HuMgIQYY30Nma5Wll4T
         u9ff5LyQax05Uxdoh5Um9UN5/g0RHa58laOO9pDBdHBxSUYCLskvF7VEDmLGNKYGOpe1
         mbiw==
X-Forwarded-Encrypted: i=1; AJvYcCV95iyKObmQ2rRe6/0EpJs7D9OGt+aVSzPGQgoffXWBX/tIaCwDW/vAxpjDm5ZUYNRy/zJx83P2Ug==@lists.linux.dev
X-Gm-Message-State: AOJu0YxEc31C0hrJ6t00SHSxT6kEkDoOFbMJN3h9mxSHrpAGhZjtl7Yu
	cjUbILg32+fISboulO+DKhSezZs3Hr2j9eAMfkdDc6pvc99h0hyA56qVQu6cD2WQe4g=
X-Gm-Gg: AY/fxX7RMdWm42W09f4Ed9Fb9IlQ2RHIRjErvCQ42tXxfo8YzS+sPU9wTr+Y8Eb747W
	Ggwd5+0a8Vk2xumdxat4S8VKSywKrL0RRzeY0chFch6BEmN9uXaWr3bm/2lZmCgwjsfb/FZNv2E
	VGCxvRx9mJyFMbJoxt5kIHTbxGaFX+4/d24RHLCjywCaBbcPVAR3vJNStQidPYOmsj0aoksB7TF
	OgFXF5qFhEE+DaV8yMo8f1A5x9RheSHCLiFDYJ0Rdu1e7B4NidXF157WqjyrbgBm2cEum9ktqpA
	GMK02w5yj/UTOv2wAK/xK6IJRqE70M08KV4FSLpXbMdx43PXqOVfJAYtWZTqltfiuwGLLv4DuA1
	EUglco2/JAEEqoNcqDVvsTpdRVsRLAy7Q8leVd2CQcSpE2PvZwUMLf6HVamQzNSzqjyMxEApqxz
	PwUlnXYAZeD5cyR/RZ1hZxeDixNnAvJdJcPh0N5n5wb+mJQmhPtk8=
X-Google-Smtp-Source: AGHT+IHrk3/Wb1Ax/7CDf4gB7goVnIoiHZHZswEwc447eGOnME6q7KBjOR0207MAY/FczYBzti0BEg==
X-Received: by 2002:a05:620a:4706:b0:8b2:ec00:7840 with SMTP id af79cd13be357-8c08fbde57cmr4105632385a.27.1766969882882;
        Sun, 28 Dec 2025 16:58:02 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c09689246asm2268104285a.20.2025.12.28.16.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 16:58:02 -0800 (PST)
Message-ID: <4a76e9bf-926e-4b77-a2f8-ee4a72b2f1dd@riscstar.com>
Date: Sun, 28 Dec 2025 18:58:00 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] i2c: spacemit: configure ILCR for accurate SCL
 frequency
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
 <20251118-p1-kconfig-fix-v3-1-8839c5ac5db3@linux.spacemit.com>
 <81eca0ab-47a3-4b12-98ae-fbd46a15ff93@riscstar.com>
 <BD74A47E5BB66010+aU4j6CgGxebcBV5I@kernel.org>
 <569E6DA87DE510D5+aU4-1Jl9XxjAWQq4@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <569E6DA87DE510D5+aU4-1Jl9XxjAWQq4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/26/25 1:52 AM, Troy Mitchell wrote:
>>>> +static int spacemit_i2c_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>>>> +				     unsigned long parent_rate)
>>>> +{
>>>> +	struct spacemit_i2c_dev *i2c = container_of(hw, struct spacemit_i2c_dev, scl_clk_hw);
>>>> +	u32 lv, lcr, mask, shift, max_lv;
>>>> +
>>>> +	lv = DIV_ROUND_UP(parent_rate, rate);
>>>
>>> Would DIV_ROUND_CLOSEST() give a more accurate value?
>> I'll test it.
> Same result. So I'll keep it.

Is that true for all clock rates?  Anyway, it's not
a huge deal, but especially when the number of rates
isn't very high this can make a difference.

					-Alex

>                          - Troy

