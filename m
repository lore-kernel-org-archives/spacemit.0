Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2972741A1
	for <spacemit@lists.linux.dev>; Mon, 14 Apr 2025 16:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744648935; cv=none; b=hc/nw6vHpKQ0zh3AG4URNzTKn20uVYtG6vuQTcBOSb9HIeJlEv/hkrWRzsQTxhqWQl06tsF6+gjH9FdzRx3Z+lhVizssMqolZryaLONKFxYE4wohcHQ3tPMFCmu2uvBlgnG3MvvWJcBaeN7E59EO+qaVijwmYAAKqF+rpizEbXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744648935; c=relaxed/simple;
	bh=/66OOPt3HW87DIGt0O3zeDKL07onErJWuovRqfFxozI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aRqLxa5cjhBsNhAWffpz26IP3ytxXwB7xibu0xGGyxQBEAxUT5yljxdD5i/jIDiAKAqfJ/uKOI/Xck3GERdTL15J6ITaE2Aa9OdIEUwThKCXqGMGgx32+O0ICHBlIeeXCWVYS4Bczoa7u6vCgxUykTzd0wn20oyY2kfYYKNucAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=Hw+Wx4hL; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Hw+Wx4hL"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3d6d6d82633so14986185ab.0
        for <spacemit@lists.linux.dev>; Mon, 14 Apr 2025 09:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744648932; x=1745253732; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Nkt4V2QTjnSapTTILkS8+oLHV4hk8aXAHawaxgiQGU=;
        b=Hw+Wx4hLo4XW2Wq8m7UKJkKBmGVDJVBWdZ5mW/wnKh0XeH2sYg+HNJiiTZZjr7dp67
         uXQK+OmnyqqWy5/VglSZ87l2HdKJULGxhi3mJWkpVf9Yg0ganwaW8QrH5IcWaI53IeN6
         TbwwRrOG4/RZqfeVkeSDYddfeZAJ8E0JCwFEA+T/IIUo55iZddXSxGMIlP4jkJTB8Cfh
         j9G2C1ud9RrH5B2BGwLPBnh4RxM2pBuBEiOzh7EI5Nqh4LEyUnQRNyGiPCF20+lx7lJp
         qNxB0TE+GZznYoFKjbIKDnimuEobpUesTWm6P/UTajrYBdfDFroW8PjQyyudEx8Miu6G
         k71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744648932; x=1745253732;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Nkt4V2QTjnSapTTILkS8+oLHV4hk8aXAHawaxgiQGU=;
        b=UG7bOI6xxHB4lXMjSTNVFSOmCxtVYpu0jWedr+znzz2lSz/e6PGADRM6UWKDXV9yM9
         4zxqrhvRdwtLeHlWdZLsx25XIAjL7SSS6RCs5kZFyzc0vtOONPnIomD1uhEr143QS2QQ
         JX+Fz544a2vMC1eFI3zzThuSbmqePcQBTFnSXoXKH1ugn8KsXb2r/a9w/J+KQFhgKCf6
         2S9MlcKckpJNLJ7qdWaSOBGS5PrxuXuHaSliowo9toj5VfMLD/KWxyo2LuyDMmq+BAsj
         LEEbtJHFjWco/p2hkB4D9Y8APODdzsbmSmojBDWHBInR6BwBaN0WXOeG21oBjCmkobQD
         8jXg==
X-Forwarded-Encrypted: i=1; AJvYcCXLPsV7HIBnTXrwYKci9eFfMwqlXafVFyS/f1Ua0xyrlteaSYwxmNX0fo7L9vv8c/zhXcOFnzR7Nw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzCxVF4nTlQuI1Cb/gfCPQI9eyhJ5fTuF2cxCq+Oy12nEW6GP4d
	HQNmJlvPOXMPp4A5IR8sGTJQgoIGE8LNvn70Nm4oqjip+He/dgmm5R2NtzFtQOM=
X-Gm-Gg: ASbGnct11Qnak1lK4e39+1wauIkC4F1kimr6ozVELOXTKwjlkYuXAqq10DCd5PVQULn
	TXgc1S+OsJKa8tHRLIEQsHdPpTOOY023iXb30Av9mdUevmwueOWNjZ2NnWT+nzjSpa3r6++s6s0
	hlDhUgqZ2p4w0gK+NtcMmZoZOIFnzH+niUFppcYYphHUkWBiklLemgnofVm1epW+Jn/lfWW3Ny2
	vFAy2xCysAP49ZJd9VvCMfdvwvYdjHetxXCtEYtTcVOQ5Y1dLlxco7x1ugh5ePdQFGYLQcYoF4K
	Ct3UAxSfl0BNDpY/lgKKBLRGaAmHs5K/M4RVOrUg6VTK1YcEmTZeDnW4UA==
X-Google-Smtp-Source: AGHT+IHXcv1gAGtPs5um9SWMJJd18WOJ6IiYOGvEA56wWlYHbTbN9OhrdEHa3Nng5MJO18XCSyHZBw==
X-Received: by 2002:a05:6e02:338b:b0:3d5:bdac:c927 with SMTP id e9e14a558f8ab-3d7ec27c9eemr148288925ab.18.1744648932034;
        Mon, 14 Apr 2025 09:42:12 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.166])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d7dba9bb63sm27527735ab.38.2025.04.14.09.42.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 09:42:11 -0700 (PDT)
Message-ID: <9a51fbfb-cd06-489d-8deb-4323eca496fe@sifive.com>
Date: Mon, 14 Apr 2025 11:42:09 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] riscv: dts: spacemit: Add pinctrl configurations for
 PWM0-PWM19
To: Inochi Amaoto <inochiama@gmail.com>, Guodong Xu <guodong@riscstar.com>,
 ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, dlan@gentoo.org,
 p.zabel@pengutronix.de, drew@pdp7.com, geert+renesas@glider.be,
 heylenay@4d2.org, tglx@linutronix.de, hal.feng@starfivetech.com,
 unicorn_wang@outlook.com, duje.mihanovic@skole.hr
Cc: elder@riscstar.com, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-7-guodong@riscstar.com>
 <ujkfb3ajvoebrkvoepztgh3afzw5dq7djefvdddiboo5gxu63x@dlflpzwpv26u>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <ujkfb3ajvoebrkvoepztgh3afzw5dq7djefvdddiboo5gxu63x@dlflpzwpv26u>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Inochi,

On 2025-04-11 5:50 PM, Inochi Amaoto wrote:
> On Fri, Apr 11, 2025 at 09:14:20PM +0800, Guodong Xu wrote:
>> Add pinctrl configurations for PWM0 to PWM19 in the SpacemiT K1
>> device tree source file. Each PWM instance is assigned multiple
>> pinmux configurations corresponding to different GPIOs and
>> function modes.
>>
>> Configurations include:
>> - Mapping GPIOs to appropriate pinctrl nodes for PWM functionality
>> - Specifying bias-pull-up and drive-strength attributes
>>
>> These updates ensure proper pin multiplexing and drive strength
>> settings for PWM signals on the SpacemiT K1 SoC when selected.
>>
>> Signed-off-by: Guodong Xu <guodong@riscstar.com>
>> ---
>>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 315 +++++++++++++++++++
>>  1 file changed, 315 insertions(+)
>>
> 
> I think this is too much, I think it is necessary to leave
> already used one.

If your concern is about compiled DTB size, you can use /omit-if-no-ref/ for
each of these nodes, so only the pinmux nodes actually referenced by a
controller are included in the DTB.

Regards,
Samuel

