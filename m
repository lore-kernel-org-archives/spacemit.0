Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71D719CC2E
	for <spacemit@lists.linux.dev>; Wed,  5 Mar 2025 04:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741147274; cv=none; b=Bfmjl8KvIGT+1G8FWGthYncki/3znn1kAVluzkMPRKiVQKxZhmoZZtVMNSDaScgJ4eJLf2hI7iNZGc35UCGdcBhIAMF5KkFmaxTdPlYTt1dRJ9hRvy/ihTXNOhp+6Uc6p2Ik0evA9Ay26b6s+lVksJ+jRaGBKzzsInBeT6KjZN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741147274; c=relaxed/simple;
	bh=c7n8loHullD7JXhQoqt6oq4ipwinlvGcRtIih2cRmuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ou0xlGEEMW4d07Pq8K4mUg+gF/XoKWnBoRJGTnQ/uK9cuOMDZ0a1a26GWC6HWLdhi+2xpKJ8UIqVGyUxuFal3VhBb108cEkeXXYoY74Xl6W+fXPVDc7Y+zQz5c8W71YzW4Sm6E+8y9rp//dSQju2InilpntW2ssvGGpIPdyflrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=cHtp20Z7; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="cHtp20Z7"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3d1a428471fso50814755ab.2
        for <spacemit@lists.linux.dev>; Tue, 04 Mar 2025 20:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1741147272; x=1741752072; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IAzReoWSx6Ky4BsTRXhDGhpk0Fac7rFxEYq0+DJkXWk=;
        b=cHtp20Z7kchBVRqNRMHghYiTkVbWRmuESFWtn5jKbyOPQaEOuZRXHafo4kIrLsNqsy
         GBe/cYS6QaMXIMZ4AElpocSMR7B3g7p04/Jnnb7/IM2LkMrpFqwZhFBdHYBOlXppKVSJ
         TdEayg6LHF9aOzQF9aot5czlvaL1qdi2XbedoTgXCTunDHLqUMvWYePAJz1kh3nF8Qlc
         WJ4Bqp71cxYZvGCYeRAZ++/04SHh6ers/H4nqXx0yRcKtyctgO16CpwRzaybDD0CLpUz
         ODTpUuvvD+flmDcW6uEHQgT0EUsoxMPJdMBJ0GuXi19lbNysjQJKlz2W5qEa+B7yHQyV
         t3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741147272; x=1741752072;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IAzReoWSx6Ky4BsTRXhDGhpk0Fac7rFxEYq0+DJkXWk=;
        b=SKoiDF4Iuf+DZeySYu/SO+/YdasHK8TfA5HirUY7yHIdEFkpssN0Y1bK4rCNGLYioU
         rQl5UveL70iIHdPZqkjNars6CJ6B5SlZouQDLzw4BOctPLvqc5AvjI+M7yb+WdAn78hs
         jQCM5v/F+ygNJspGQADYaHLyMJvxVSQapGTiDVl5PpZlGlWB6Vfk+XCaiWko+X4p1IZd
         H5sA6H1gvGrR8MoIQ3ZT3sQP/DAIUcYhojBl7TAWN9HzD5+ybGr0jGTZ5zo+iH1HZCXT
         5tJDWtIvrrwWGh6JP6UfKBSwgnqZMvObjIzsNVceLSTkVRb3vzkUKOJLUWNqh4FboLCs
         b/Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUAfZKuhnxocax+Q8GiFzHI2bPM8IfAnhtz+GpFX9HKlGcBX3LS+O1nT4MJK5evmqF1QGd/k1n8Bw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6Dvb1Mt/cSq0K13DNYKPN8mPqQJSiyzqy1ilqSCywjSZ/h6b2
	iHtfvheoTXkdIDHMwkxcbyteMWixPERx00MTwXk+yLavrBpgAdkhXCugT052OUQ=
X-Gm-Gg: ASbGncsilasd38+YtAlWppgOxVtSyHTz9vFFzuR8pkoAbv/2UmOodD7XvRzn0NFDS3i
	8kunex9MAMSGX+gXXBR+f+f6wVhZhvHlwbPjYwzqNQqMPVELWOe0nMHL8ss6W4Q7y9nEoMZefC+
	dYkg6sgBT/Xvh6ELc3Dp18HBvBTyl8Blu9d9+z8FuSYSL/rkgyEyepwrRLnIOsN/ycPwoB3vwgn
	FndmXfvwweuAgP+PQLdyfDkM7uRn5UR3oH0VuOYs8hbe6bs2FNzPkDrzA1flU9T0QfAhy7XlG29
	r4WfDjTB7U+gbE/dzB3UmVL6UluB4a6OtKUs9cg=
X-Google-Smtp-Source: AGHT+IHu3MJTjF5+qGVR/U5nf98lXZ/G6BYq/rEMfIvyKQ41zfGyelWGxeEJNcGMavArNtzdZ37kIw==
X-Received: by 2002:a05:6e02:1d03:b0:3d3:e2d9:5a58 with SMTP id e9e14a558f8ab-3d42b97c976mr17539195ab.17.1741147271939;
        Tue, 04 Mar 2025 20:01:11 -0800 (PST)
Received: from [100.64.0.1] ([170.85.6.166])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d3deee5121sm34666245ab.65.2025.03.04.20.01.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 20:01:11 -0800 (PST)
Message-ID: <eda41d6d-fa08-413b-8f3c-ce044e171615@sifive.com>
Date: Tue, 4 Mar 2025 22:01:09 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 1/2] dt-bindings: i2c: spacemit: add support for
 K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Troy Mitchell <troymitchell988@gmail.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
 Conor Dooley <conor.dooley@microchip.com>
References: <20250303-k1-i2c-master-v5-0-21dfc7adfe37@gmail.com>
 <20250303-k1-i2c-master-v5-1-21dfc7adfe37@gmail.com>
 <20250303093506-GYA58937@gentoo>
 <ab10e069-d9e1-4df7-9454-8b0fc910443d@sifive.com>
 <20250305030540-GYA62563@gentoo>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20250305030540-GYA62563@gentoo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-03-04 9:05 PM, Yixun Lan wrote:
>>>> +        clocks = <&ccu 176>, <&ccu 90>;
>>>> +        clock-names = "apb", "twsi";
>>> 9.1.4.61 TWSI0 CLOCK RESET CONTROL REGISTER(APBC_TWSI0_CLK_RST)
>>> https://developer.spacemit.com/documentation?token=LCrKwWDasiJuROkVNusc2pWTnEb#part594
>>> from above docs, there are two clocks 
>>> bit[1] - FNCLK, TWSI0 Functional Clock Enable/Disable
>>> bit[0] - APBCLK, TWSI0 APB Bus Clock Enable/Disable
>>>
>>> I'd suggest to name it according to the functionality, thus 'func', 'bus'
>>> clock, not its source.. which would make it more system wide consistent
>>
>> Also in that same register is:
>>
>> 2	RST	RW	0x1	TWSI0 Reset Generation
>> This field resets both the APB and functional domain.
>> - 0: No Reset
>> - 1: Reset
>>
>> Which means you need a 'resets' property in the binding as well.
>>
> right, there is reset needed
> 
> I'd suggest to add it as an incremental patch later, when we
> implement real reset driver, and also complete the calling reset
> consumer API in i2c driver
> 
> but, let me know if this is not the right way to go

If you add the resets property later, that's a breaking change to the DT,
because existing devicetrees will not have that property. So you would have to
make the reset consumer in the driver optional, even if it's not really
optional, to work with older DTs. So it is _possible_ to add incrementally, but
not recommended because it adds "legacy" code that never really goes away.

It's okay to define the binding as requiring the resets property now, even
before the reset controller driver is merged. You just won't be able to add the
I2C controller to the DTS until the reset controller binding is merged. But
since the reset controller is the same IP block as the clock controller, its
binding should be available soon anyway.

Regards,
Samuel

