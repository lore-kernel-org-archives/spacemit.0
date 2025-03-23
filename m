Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877F42D023
	for <spacemit@lists.linux.dev>; Sun, 23 Mar 2025 13:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742736232; cv=none; b=QABF/AGgxMkT1YWHB1mx0HiGbzTd0AJ8ZXmYj4KXKgtspVGdSv5PvxfQkV3X0b51JJoYiaB9rfvbQpkJl976rTXufuENBxVbW96XTipwal1MaWM9iwQi5koUoLRTGca9g4YwZGqgGpNbqn+CR/m31Is017U7ExQ+z3427uLYHhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742736232; c=relaxed/simple;
	bh=WDHLZ4ZOpow/9eryokeFUPYvCTF9TtyU+hXACTUYy6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZCiEYXmfIgYMABQdB5GnECc21XFrimJFzhWBYmsLJhFOmmL+mawC8PJ4ZjvYT32onC8ORRl3EQWfW9eBd03kPhxrCMoH0nQwhPiCjqOX1S9B6tc17/SFquH72fTgLtnVercAABPQ7NZIk+JpLWBf1M+c9cxyV8pFGz21h0U7Zy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=MiDW4aOB; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="MiDW4aOB"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-85b58d26336so318609339f.2
        for <spacemit@lists.linux.dev>; Sun, 23 Mar 2025 06:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742736230; x=1743341030; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vOluyEJJQfX6U4qT7bfq8l8QHshCFBSDzvPzJIBTv80=;
        b=MiDW4aOBtl35ByNgxS4Rmg/LJFkvb3dZmlyt5z7TRjafMazGA/rmzKkt+0vqwl4xzF
         m6+wXTgvWEytepNAKg6WJIGcUxblMF1pLngE35h8+M3t8SmY0r+/J3tac+9BjXo9IcT6
         Z1y3PFddFldr16ZPRanCCtluW0EyKLovXtq9xAFXjDJL6y2pnzAr/tHrlhU+MmJ0in9e
         n254ZpmyQH+8gbeEWWfsfWjNnx7DY5yGEZvWCure5ifVbkfmmcfuRGXCPt5vAtWefT8l
         u9M1WxtOKYuVDf7wEsaPus4HDck3+KiHxoqBVFOHM1mN51fPI3/ebTBJVg+a5oRnhllJ
         7F4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742736230; x=1743341030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vOluyEJJQfX6U4qT7bfq8l8QHshCFBSDzvPzJIBTv80=;
        b=BjK0WBK5fdKmLw5USkoqLHodq+pJnaEpo88h6Xe9SPHKlHI26zVCgVfNRTD7r8+sHx
         MZMyB8mhmdwcq1csYFZyv0vpdkDhk9I3RVi9gbqTFQsRCWNa9RbyCrqgwl5mAzPewZLc
         oDgJJemIwexjjyu/+4Fp7tykri0bLaTJXZv71X9OZVLCbFFxMPkLky1FBkXHorcgCSIb
         yUxxHDj/d2UAu2JUe0+twTJHBlnqIzZEGcZbmqhRW8zuWJhBk7fMbauAvbZJmM95ybEX
         AAPrQAWThvCPQ4vnpAQUInrMVzveWArPjJ6mE5gTaQy/GHBsaiYrC8nagioMK/wRU3kG
         ZkcA==
X-Forwarded-Encrypted: i=1; AJvYcCW05IQbixIUNqyaSi62Bv43Dgnb8ZCXZkTPN6z8unL+oVt2NVcUAJpfWlW1u7aTsRH0jcotcmVLbg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxPrc6eIcGxgTfCkTzYVT/3X/nyn013lE6BZproM+TYRN9Yx59m
	fywo4fTxe0BQlHQ5TlLiSTUgL/XPvZrrE1s4uePmEFLelGlecji1hztjhCv44wU=
X-Gm-Gg: ASbGncuF/pv3Wsi9seTiLTbo0SpYVhCldJlHVRBRK55T4C/4av0Mw1QMxXJR6ATHUZR
	PX7TCfRaeg3dMyDvo+JlHaqyBusUQs94BuWcdT2qyHnyjO1ZMvWfoEwpI2+J1IZR2C3hizyt+GH
	THfWsvjSTQAui3MDlrTncL4muGrM/mJYKLqfRZfXP05CvCo4DWntM4bUXkZwLtyHqFagTDLbgsv
	CC6dhxzoKtSqnUXgNKQ1lA66kiGxHpE8rnnSXkozdBFzwRg9YIUDhDJFhRGY2K4RSVvB1PIrdPn
	pAleRW3rVrqWMWxT/moLXCUvGaPam9v0HVrMfTgavmweIS1qUMXXahezIHwk0LqejQjuzKSDHoB
	4at+2blLPN4NFG2cTpyAn1W1LmH7l
X-Google-Smtp-Source: AGHT+IHvNHoOTQ7GjqXvKjbkWRzMHajkOVeKgTFwJL+MCalCStZsW2aoR41uPaZSxapIX+qE0BXZHg==
X-Received: by 2002:a05:6602:7512:b0:85b:3c49:8825 with SMTP id ca18e2360f4ac-85e2ca62dd3mr974589339f.4.1742736229595;
        Sun, 23 Mar 2025 06:23:49 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85e2bc13d74sm125798039f.11.2025.03.23.06.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 06:23:49 -0700 (PDT)
Message-ID: <b5af3a7a-c5da-497a-ad67-c99edfdf665e@riscstar.com>
Date: Sun, 23 Mar 2025 08:23:48 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 7/7] riscv: dts: spacemit: add reset support for
 the K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heylenay@4d2.org,
 guodong@riscstar.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-8-elder@riscstar.com> <20250322164830-GYE11633@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250322164830-GYE11633@gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/22/25 11:48 AM, Yixun Lan wrote:
> On 10:18 Fri 21 Mar     , Alex Elder wrote:
>> Define syscon nodes for the RCPU, RCPU2, and APBC2 SpacemiT CCUS, which
>> currently support resets but not clocks in the SpacemiT K1.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   arch/riscv/boot/dts/spacemit/k1.dtsi | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
>> index 09a9100986b19..f86d1b58c6d35 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
>> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
>> @@ -350,6 +350,18 @@ soc {
>>   		dma-noncoherent;
>>   		ranges;
>>   
>> +		syscon_rcpu: system-controller@c0880000 {
> I'm not sure if syscon_rcpu is good name to go, it's AUDIO Peripherals
> in docs, see
> 
> 7.2 Main CPU Domain Address Mapping
> https://developer.spacemit.com/documentation?token=LzJyw97BCipK1dkUygrcbT0NnMg

They call it "AUD_MCUSYSCTRL section <RCPU(0xC0880000)>",
where the registers layouts are defined, and the register
names use the "RCPU" prefix by convention.

I guess I could use "AUDIO" instead, but I think it's
"RCPU" is a little better because of the way things in
the region are named.  It's a little like how "pll" is
used for the DT node name for things in the "APBS" region.
I don't really like that, because the connection between
the two isn't very clear.

>> +			compatible = "spacemit,k1-syscon-rcpu";
>> +			reg = <0x0 0xc0880000 0x0 0x2048>;
>> +			#reset-cells = <1>;
>> +		};
>> +
>> +		syscon_rcpu2: system-controller@c0888000 {
> not found this address mapping in above docs link

You're right.  I was following what the downstream code did.
I'll gladly just include this in the main "RCPU" node.

Thank you very much for the review Yixun.

					-Alex

>> +			compatible = "spacemit,k1-syscon-rcpu2";
>> +			reg = <0x0 0xc0888000 0x0 0x28>;
>> +			#reset-cells = <1>;
>> +		};
>> +
>>   		syscon_apbc: system-control@d4015000 {
>>   			compatible = "spacemit,k1-syscon-apbc";
>>   			reg = <0x0 0xd4015000 0x0 0x1000>;
>> @@ -518,6 +530,12 @@ clint: timer@e4000000 {
>>   					      <&cpu7_intc 3>, <&cpu7_intc 7>;
>>   		};
>>   
>> +		syscon_apbc2: system-controller@f0610000 {
>> +			compatible = "spacemit,k1-syscon-apbc2";
>> +			reg = <0x0 0xf0610000 0x0 0x20>;
>> +			#reset-cells = <1>;
>> +		};
>> +
>>   		sec_uart1: serial@f0612000 {
>>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>>   			reg = <0x0 0xf0612000 0x0 0x100>;
>> -- 
>> 2.43.0
>>
> 

