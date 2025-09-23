Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFC6323F7D
	for <spacemit@lists.linux.dev>; Tue, 23 Sep 2025 12:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758631779; cv=none; b=cdoo767xbXRCAVaEvY6Ah/3XR5BAe/4eCsTaa3EWNwVv6SwjrjNtLpxYP2HBYOsKs/lC1b/zN+n6lCMZXAqZTYYaZwYos/nXGLjkAfdOUhzg9NyorH1dB2/ITyruu2deZQDDWppNeZPuaz8XaQxTWuAYtLT65ZSfUp4c4dG+1bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758631779; c=relaxed/simple;
	bh=2uX98Zc/lh21ANJqrjffGwf/v9w/8F5ahBMBEj5Ebds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oOO3nlZyBxjssLKSYWc2uBB/ijPcf2gNidkHJSMmo6P9O+nJpBCXywElQJhN/WDocJl6y+a9uELUcQYjNlghVm4xicBQ9wGI3MNVCw6u5+AYVX8pB+C4m7T/qldHbafyYk4hhDNCrM14Iz0YeEKtLLraLLMQXKHmQh1lRUWqVy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=XAyuSgyC; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="XAyuSgyC"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-8eeeeb37cc5so5568839f.0
        for <spacemit@lists.linux.dev>; Tue, 23 Sep 2025 05:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758631776; x=1759236576; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RBPJgYIx7v6+v01N0CRR0tlRD9SDBXZtLGM0u4Al3EM=;
        b=XAyuSgyCu6KJpckjmsyEHEdSl4rp0mUTn8Zo6NX408IeyIdm+Ob2ZW7AyeUV+NyUw+
         Z0DNYNiXeBlR4324B71AurHwgUjZ+UoSbtEsqjytj3kK4dYfLX1f/PpUyhM6SEajlGCq
         HTyGvGk7kk9q1EkwLVTqMAN2SAQewh3VX51KNWDIWNXpT4hQ0kX8L0fR4HFXIx3Pjh1+
         D3P0KaL1uwI4NIJpncU5ytzFIkqQsjVPpdouTuLaTLfs/uibsPuSl64dByScorlJ5CmY
         QrTa1Ji7CSqtTFH/KESmVOYRvUK8U2L8P6Y1vwlGl5PpzfEf1DaS7+y+7Vv3YUgtre3V
         f78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758631777; x=1759236577;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RBPJgYIx7v6+v01N0CRR0tlRD9SDBXZtLGM0u4Al3EM=;
        b=bmhXJdRUOSzj2LWVTI+tj1aVs/X0/Uty82zmSTZY0AwfwL4lGn6w7tW+SiRa+c/nd/
         pEUv+JsSG94LWfRPyh46zYescsaT9RoUuuJJk49hMEo+7EujXB2IenIYapQx96gm5aCL
         tOu2oHxMq6vhmuW7g5eE1lKqxiSE1B42U/aTeRVJE3gkUKB4O3JIctUtUybKnLNgK85x
         s97SVo0AY3+536FIa6Acje3XT3UMpUyaxJWqZZ6OBaPcOrB3vi008ypZhbv4k6m5M7Ln
         WU1aOuHeJC7YxT3BXb+fGWjxU/SsF7W4V93zaIF9wVEhcluTnLwUQW1Zsx941+Ze0JWx
         2ISw==
X-Forwarded-Encrypted: i=1; AJvYcCXy+pE7KnT5Bsy1pTgZyHfG2v0p67xkfXDrF3NWD2FArv4QF1Kn+Nf/9GqgBz0CtIBc5QZNLLPFuw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxSBKspvyq3YYvrh65mDhVqNU9BZE3KaWVEiYjjyR+CmOlqt1pI
	IPKQYp7PdXexxN6pFH01rfWhc5HQM2hAmCVAAKYoPMv+gwY1mpUMh4S7Tnq0wccUBRk=
X-Gm-Gg: ASbGncvV6EvEKGlNwgJVxtGKbZjaj+jryFWPs5RrrWItj1tp2yN23ynYONe4RPPlK2y
	/C3Q8gqAJlUBuZCdYuKLPzP0Fc6odn6CeXxxcxiyvD2JUQbPlvg/+AOj4q+CAyw3zv2OR8OsKam
	7Ro3MyQ3lFUnbIL5hK9qjEhipQgJF+QHm/4Et61bBPnJOs6JwXrT5o59CgNCLE8oAX82XNXzYlG
	8aV6uJ7PwTH2bgC1A+tVwnauYrjN2SQiajEWKaTliIe09xeYdEYnCzTEDaZ2chSqFYyfnS+dh5M
	lCa+T0mlcK1H8L6WjMGRJ97k6Gyos1sQ2pA8b5Gf+RUiZWrEJaW4cdO9m9FNXArIMX6nQQM+1zc
	Y3+pZiDiFpqQmL1K16PEoNlkoJIBc3yok7zVn3f5GsGbK17av/1ToIQnEW/Z9bw==
X-Google-Smtp-Source: AGHT+IHYa5DWzxweqTSWrCllRHx+UhSsxFOlpmwhlInRnbMBAW55bHyqIh4dQEHaUgu4d93X0h+kNg==
X-Received: by 2002:a5d:93c1:0:b0:884:1e28:904e with SMTP id ca18e2360f4ac-8e1d1a12e35mr361506139f.12.1758631776567;
        Tue, 23 Sep 2025 05:49:36 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-556f74174cfsm3556602173.57.2025.09.23.05.49.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 05:49:35 -0700 (PDT)
Message-ID: <1aa28123-cfa4-415a-9d1b-4d9edd62489b@riscstar.com>
Date: Tue, 23 Sep 2025 07:49:34 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] riscv: dts: spacemit: define a SPI controller node
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Yixun Lan <dlan@gentoo.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, ziyao@disroot.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250922161717.1590690-1-elder@riscstar.com>
 <20250922161717.1590690-4-elder@riscstar.com>
 <20250923001930-GYB1303776@gentoo.org>
 <ED4C67FD136DEB19+aNINJJVYbNnT87va@LT-Guozexi>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <ED4C67FD136DEB19+aNINJJVYbNnT87va@LT-Guozexi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/22/25 9:59 PM, Troy Mitchell wrote:
> On Tue, Sep 23, 2025 at 08:19:30AM +0800, Yixun Lan wrote:
>> Hi Alex,
>>
>> On 11:17 Mon 22 Sep     , Alex Elder wrote:
>>> Define a node for the fourth SoC SPI controller (number 3) on
>>> the SpacemiT K1 SoC.
>>>
>>> Enable it on the Banana Pi BPI-F3 board, which exposes this feature
>>> via its GPIO block:
>>>    GPIO PIN 19:  MOSI
>>>    GPIO PIN 21:  MISO
>>>    GPIO PIN 23:  SCLK
>>>    GPIO PIN 24:  SS (inverted)

Note that the pin numbers I'm mentioning above are the numbers
(1-26) on the 26-pin GPIO header on the BPI-F3 board.

>>>
>>> Define pincontrol configurations for the pins as used on that board.
>>>
>>> (This was tested using a GigaDevice GD25Q64E SPI NOR chip.)
>>>
>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>> ---
>>> v3: - Moved the SPI controller into the dma-bus memory region
>>>
>>>   .../boot/dts/spacemit/k1-bananapi-f3.dts      |  7 +++++++
>>>   arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 20 +++++++++++++++++++
>>>   arch/riscv/boot/dts/spacemit/k1.dtsi          | 16 +++++++++++++++
>>>   3 files changed, 43 insertions(+)
>>>
>>> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>>> index 2aaaff77831e1..d9d865fbe320e 100644
>>> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>>> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>>> @@ -14,6 +14,7 @@ aliases {
>>>   		ethernet0 = &eth0;
>>>   		ethernet1 = &eth1;
>>>   		serial0 = &uart0;
>>> +		spi3 = &spi3;
>>>   	};
>>>   
>>>   	chosen {
>>> @@ -92,6 +93,12 @@ &pdma {
>>>   	status = "okay";
>>>   };
>>>   
>>> +&spi3 {
>>> +	pinctrl-0 = <&ssp3_0_cfg>;
>>> +	pinctrl-names = "default";
>>> +	status = "okay";
>>> +};
>>> +
>>>   &uart0 {
>>>   	pinctrl-names = "default";
>>>   	pinctrl-0 = <&uart0_2_cfg>;
>>> diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>>> index aff19c86d5ff3..205c201a3005c 100644
>>> --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>>> +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>>> @@ -76,4 +76,24 @@ pwm14-1-pins {
>>>   			drive-strength = <32>;
>>>   		};
>>>   	};
>>> +
>>> +	ssp3_0_cfg: ssp3-0-cfg {
>> ..
>>> +		ssp3-0-no-pull-pins {
>> I'd prefer not to enforce "pull" info inside the name, you can't embed
>> all property info, besides, what's if you want to change/override later?
>>
>> how about just name it as ssp3-0-defaul-pins or simply ssp3-0-pins?
> uart: uart0_2_cfg and function is 2.
> pwm: pwm14_1_cfg and function is 4
> spi: ssp3_0_cfg and function is 2
> 
> I’m a bit confused about the meaning of the second number here.
> Is it intended to be an index, or the function number?

It is an index, and it seems arbitrary but it is based on the
order in which they occur in a spreadsheet that defines a set
of possible pin configurations.

For example, SPI3 lists 2 possible pin combinations:
SCLK	GPIO[75] function 2	GPIO[59] function 2
FRM	GPIO[76] function 2	GPIO[60] function 2
TXD	GPIO[77] function 2	GPIO[61] function 2
RXD	GPIO[78] function 2	GPIO[62] function 2

> If it’s an index, should it start from 0 or 1?

It starts with 0.

> The starting point seems inconsistent across pwm/spi/uart.
> If it’s supposed to be the function number,
> then the spi and pwm parts look incorrect.

The first one (index 0) shows up earlier (lower line number) in
the spreadsheet, even though the GPIO numbers used are higher
than those in the second one.  They're grouped, and the first
one is in GPIO group 2 and the second is in GPIO group 5.

					-Alex

> Could you clarify this? Yixun.
> 
>                  - Troy
>>
>>> +			pinmux = <K1_PADCONF(75, 2)>,	/* SCLK */
>>> +				 <K1_PADCONF(77, 2)>,	/* MOSI  */
>>> +				 <K1_PADCONF(78, 2)>;	/* MISO */
>>> +
>>> +			bias-disable;
>>> +			drive-strength = <19>;
>>> +			power-source = <3300>;
>>> +		};
>>> +
>>> +		ssp3-0-frm-pins {
>>> +			pinmux = <K1_PADCONF(76, 2)>;	/* FRM (frame) */
>>> +
>>> +			bias-pull-up = <0>;
>>> +			drive-strength = <19>;
>>> +			power-source = <3300>;
>>> +		};
>>> +	};
>>>   };
>>> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
>>> index 6cdcd80a7c83b..eb8a14dd72ea4 100644
>>> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
>>> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
>>> @@ -797,6 +797,22 @@ uart9: serial@d4017800 {
>>>   				status = "disabled";
>>>   			};
>>>   
>>> +			spi3: spi@d401c000 {
>>> +				compatible = "spacemit,k1-spi";
>>> +				reg = <0x0 0xd401c000 0x0 0x30>;
>>> +				#address-cells = <1>;
>>> +				#size-cells = <0>;
>>> +				clocks = <&syscon_apbc CLK_SSP3>,
>>> +					 <&syscon_apbc CLK_SSP3_BUS>;
>>> +				clock-names = "core", "bus";
>>> +				resets = <&syscon_apbc RESET_SSP3>;
>>> +				interrupts = <55>;
>> ..
>>> +				dmas = <&pdma 20>,
>>> +				       <&pdma 19>;
>> can we also squash the dmas into one line? but, do split if there are too many..
>>
>> yes, it's simply a style change that I'd like to keep them consistent at DT level,
>> besides you might also want to adjust dt-binding examples to align with them here..
>>
>> thanks
>>
>>> +				dma-names = "rx", "tx";
>>> +				status = "disabled";
>>> +			};
>>> +
>>>   			/* sec_uart1: 0xf0612000, not available from Linux */
>>>   		};
>>>   
>>> -- 
>>> 2.48.1
>>>
>>>
>>
>> -- 
>> Yixun Lan (dlan)
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

