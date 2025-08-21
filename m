Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EA22727E7
	for <spacemit@lists.linux.dev>; Thu, 21 Aug 2025 08:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755763937; cv=none; b=GldEiVJzWYERNyiOjgD4ZIJIfZzcsdmD0w/3wqV1VfFaIoKzliCsFtk1AG1g5j3mrDkPgHKCCxThbwUBDCVgthBoXKOy3zT+e8IBSZoPQm6dKIuLLAk6ub2qz2rRRTNe3Gb2KCw79uGDEsa4gcjQZzpsd+xKNQLrOyMIOekkFj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755763937; c=relaxed/simple;
	bh=Ib5rwP8vabBmjTB2gHFRufvV/brLouRfcpTeVRXGdAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lM1Oug7h8lZoW0FeBT1mJ0fzV8fyg3xZJq9b3N8GkVhZKLfQ0BuC/u9jtQRFXJeoQ635kySwHTWU2Ij9j1v9+Ws0LYxFRyYdbIkAi+DiOWI2iyINI7VcTCkme/7NsEFsCHFWE34RZecOBx57+iBkJrosxUWKiBW7adwJO0ispTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=rdB7mbha; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="rdB7mbha"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3c51f015a1cso97549f8f.1
        for <spacemit@lists.linux.dev>; Thu, 21 Aug 2025 01:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1755763933; x=1756368733; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RnPqNwnRdJMIc37XxiVZSImeUH9HHnzjQda0KVcM9Yc=;
        b=rdB7mbha8Uv9crQxY/bZ714CZld3pN2AUmT9z4Xv9InMFwB0jgjHvoIDMoBubRpUl+
         /YFCXx/tPZ0s37d2JjOL8oOCwMFkac41qm1TxEGLTzDfTuFdtOLqKMD8TENChrdpYmoO
         DjIfHQBf4STzyItdnY6GoiJBNdHue52gh3hrvr8ZxXHx5KaNlbBzhj86mx4sUw2Qc/NO
         hHXx80bkaTCsaECvsu8ELtuPcf2ik1nwJyhMNp4w9erKNNpQpwnS6VUnO1bju43P5wfj
         eLCWj0s3NfLPsoaDkXIdSQckBStDW4g/67bnVA7ygFi5IKYCicpK+bf2D504rFcshnsM
         gBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755763933; x=1756368733;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RnPqNwnRdJMIc37XxiVZSImeUH9HHnzjQda0KVcM9Yc=;
        b=Y3YxHsV322DQyw9D+WlD7MXhH7Bz35hSO7FJBSb8Zg9h7G+vcrFGIbJVWTFW1fzzHU
         1DHmMmgkmGIpGzCiD74vNOVawvJaZ0ottR0G5E8XfCHvbyTZlUIVeUDB4ce8Ps9D4rQE
         QTVPa1HprOxz26rM4WRA3dA1j8mmmLy8j2ypUfNaHSy7D8JR7CtnhzvzegVYfI8C1iNW
         aqBF4NzbVhY8HzQpgdFBV9oqnKrn6c9gUfCd+IE7FNRUfES+A/lRL5/+xe2N9DzJ7qQ7
         pkOGtTg7iai5Opa9eMQjmbTxSaLyHrFOofL2lLT78y1AMMdcDsBFe1OVrtnfZ9gAcjjt
         hBSA==
X-Forwarded-Encrypted: i=1; AJvYcCXDz2/1eTOXbNYH1WuglxOGFD5raTV/N0/4WPEVlM9RLKENaMaa7a3IISyPgzivCm1k+vr+PGmuig==@lists.linux.dev
X-Gm-Message-State: AOJu0YxnqkXLm47r1m6gMw4ITobKCQzepNemiReqCoL4g4xMOOaReZHg
	8QOBWezx9bjptWjejwXZ/rfN3ePXyApcWCiLwIfcow8a8aLeGamWmq9T/8STdZm6fDI=
X-Gm-Gg: ASbGncuvm4v0qRgZgnqBSYa/MLCRuwOMVLZfupG+WrTkA+FRtJGBft8JQdGXDs9qaWI
	tkC4fGwGjqS3fqyOegdZn7C+vyjPcYeN+BxbDT5vjy6Wx09ZoLeAU0N6+gt6ujHsxJq+lUtWqd0
	i128SnWzHsDB0dD79nuyhQQSr/bK5MeOx+ljuNmkJYuxIpaa8LuRgppFO2yrSvxdkUfXnJ2JHaG
	+Y3IoVwwqNMxOmTjd9gqYUjiy99bqFy8lxihJHdFGyxgMxrOEsPsokyXybKhl0nnR5PITUp7vTE
	GQrIBRLskJofxRrjD/RPCnmk0dsYQydV1ed30W0fFQXc4RC78KRrLr/tend6CD0Kq5/HBMArdyo
	2dfyh7UFgN8zERa13omTL8CpH4TCVGqiCV7ZiWzI6T6n3FY07cgxrVNoqzGgJ1OalOAEKMBLF5b
	j4Rdxpm4hKlGrt
X-Google-Smtp-Source: AGHT+IHdhYS0MRSPzzW3UprEmG6p659Pq++hTQXcf3C6FUIxInpMAwyfL1/KDCaz5DbATd0JncFKyA==
X-Received: by 2002:a05:6000:4283:b0:3c3:8e05:f72d with SMTP id ffacd0b85a97d-3c496da8a46mr1312520f8f.33.1755763932852;
        Thu, 21 Aug 2025 01:12:12 -0700 (PDT)
Received: from ?IPV6:2a02:1807:2a00:3400:b63f:533e:fab7:5343? ([2a02:1807:2a00:3400:b63f:533e:fab7:5343])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c074879fe5sm10591690f8f.2.2025.08.21.01.12.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 01:12:12 -0700 (PDT)
Message-ID: <b98cfa73-c6ec-4006-bf84-febbbdea8804@hammernet.be>
Date: Thu, 21 Aug 2025 10:12:11 +0200
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: spacemit: add UART resets for Soc K1
To: Yixun Lan <dlan@gentoo.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250807191817.157494-1-hendrik.hamerlinck@hammernet.be>
 <20250820231917-GYB1065530@gentoo>
Content-Language: en-US
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
In-Reply-To: <20250820231917-GYB1065530@gentoo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Yixun,

On 8/21/25 01:19, Yixun Lan wrote:
> Hi Hendrik, 
>
> On 21:18 Thu 07 Aug     , Hendrik Hamerlinck wrote:
>> Add reset control entries for all UARTs in the SpaceMIT K1 SoC Device Tree.
>> UART0 was functional as it did not need a reset. But the other UARTs were
>> unable to access their registers without the reset being applied.
>>
> ..
>> Although perhaps not needed I did add the reset for UART0 as well,
>> to ensure consistency across all UARTs. With the current-speed set to
>> 112500 baud rate, it matches the factory U-Boot settings.
>> This should not give issues with early console usage. But perhaps it could
>> be a good idea to let somebody else confirm this as well.
>>
> Adding reset to UART0 is just fine, so we don't need to presume it will
> rely on bootloader to de-assert the controller
>
> please write changelogs in imperative mood, you can follow
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#changelog
Ok, I’ll update the changelog accordingly in v2.
>
>> Tested this locally on both Orange Pi RV2 and Banana Pi BPI-F3 boards. 
>> I enabled the UART9 and was able to use it successfully.
>>
>> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
>> ---
>>  arch/riscv/boot/dts/spacemit/k1.dtsi | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
>> index abde8bb07c95..7a5196a98085 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
>> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
>> @@ -667,6 +667,8 @@ uart0: serial@d4017000 {
>>  				clocks = <&syscon_apbc CLK_UART0>,
>>  					 <&syscon_apbc CLK_UART0_BUS>;
>>  				clock-names = "core", "bus";
> ..
>> +				current-speed = <115200>;
> please drop this property, dtsi file should contain generic info for SoC,
> even in real cases, all boards use UART0 as serial output and configured
> at baudrate 115200, it still be able to alter to different frequency..
>
> besides, if you really want to set baudrate, then I'd suggest to configure
> it at board specific dts file, 
>   stdout-path = "serial0:115200n8";
Understood, I’ll drop the `current-speed` property. It works without it.

Thanks for the review.

Kind regards,
Hendrik

