Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A1B4207F
	for <spacemit@lists.linux.dev>; Thu,  8 May 2025 02:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746670801; cv=none; b=ERAexqD6zd5HDIFO4DzF7BBjVZjlnHTUXL/Hd33tzYCLY15FnjO7ouA+GOFJXgVTEQ5uEoW9KPbmS9jPO70o4UEJkbPycc2sSln2QmCFS3J/0uPnPVTJ5SCSEecXmlm6zCPioXjw2lzTGCTUeDNmlPkqzsvOPMNBF21O0VnqdaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746670801; c=relaxed/simple;
	bh=hvUBXCA/umxDjIK9pHNEIf1Jrg+wptYYmF9fdTlFkc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VvIZ3PwNfiFWvFqKmB4F5J2P/pSHyei+edGvjnNVp8o+zuA1UxHcr1emZAGt35lrX7QH7mPU8YlFUrpFEz1ii8Q9WbgrRw4EFpHi+gZVlVU7TrS8/gVOuSUjsrfgjOWak3CsaX+5EIvuyu8BCSHiqXI4AnhSZMLNoDfulPVdHYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=AA726P+W; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="AA726P+W"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-867355d9c4eso10625239f.0
        for <spacemit@lists.linux.dev>; Wed, 07 May 2025 19:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746670797; x=1747275597; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BLdPkGjCt3zHlhnTHlv9FcwC/B6Ceh0B+t68w+L9rVI=;
        b=AA726P+WfpR/3LeKBHLGgrl5+VI3ihjpvp+TyNq31IX513akU3ovCdCGgswLpfSkT9
         y63njOMOxqNiVl+1NJJeb8LPRpLMdAxQ4B8A+Za6M+M/XP6OxPScL74f52XnNX2KqhAp
         8qo3hsyBL9icms/Wr3Qetlz17iUMqzmYKhrWqUBeL1CQJ8/ZV9sopN92/6Ov4QF2iRvg
         eBW2SNL/Clykz5iV88u7qwm8j8f3+y1YlQIzREbpvwDcMcLShKDexleIk6LohDs0mBbE
         kAQZ/pQOHoGmGPPpbMpHq8w2++LgkUe/s26ufQM9tQmxPUVSHVTtUsT6UDh58HcYCcTB
         /vDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746670797; x=1747275597;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BLdPkGjCt3zHlhnTHlv9FcwC/B6Ceh0B+t68w+L9rVI=;
        b=AtAn1BD3apOOWRuFm5AuW/jh4CUjofviExSkJ523N3QussHoRxX9WO0a5wr/4+kwLk
         xoDqg4BF7JGzo9o4o9c4HU3KJ1Gsc2I0lme/+riFPBCApwk3zUlADFHWW5Bbw8GBe5cv
         ivW6jJIRqFw2i0fOAqXM9E3W2cHUqFHNwLS76+c/laV7/hOs1bXZ+/jbY8671Rvguxsb
         1+gMRxoCoGxn5ZBgyUG/QjAYlqKSVrNdOeDUfWOSsALHOZ6b0SlapnSZYa8xkt2i1B8j
         3Fo+aGnmoAOFfNM3MXBCpoJjlOY3SjDKxqAT5XwZjgg9rw4+T449V6qsONJ+CGbvztoL
         hxtg==
X-Forwarded-Encrypted: i=1; AJvYcCWnoGhF6s3PVTaX/PFFr8mSFwOQv5RRR3XwbV5fLpXam2u2OZn10dMsaOyFCHZMWm+zR2E9asZGEQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxouAUO73L/V/kHftcM1OtEjj4aOJDODFNfXd7+dE7Iu4Lou81q
	1LP7Nn1Tyj9Xr6l5l9Z0Bv0LnbQolEuRyVfyyYvh8JqNVBb9KJDDVCFbyurb2/0=
X-Gm-Gg: ASbGnct9g/mSOQJPju4bAPI0hb3nHRCGD0TtB8qh4EMca87ADf/m4W16uruDWJUcqNs
	KfQTducEGUUhXyR9P/5KEuwW0c2c7ESNMo6ws8dPBaW7WLPIiin4kz2U3VDE2rOFkC+0GLw7AQr
	p8AgWK+cxHrTkIvH/GiZvILuB4f66dAkRbiIoYv//EZ+mvl3Os5z79UTkxQuM5kxS3VVTZlbsIc
	y8gdiJCTywxxrhJKCKfanHR3DYemUdqkas6G5A2g8RthZ4r+XsLESaxfHuJQ+cph9vsV3r51umy
	Tfkjxg01FWx3aI1r7/0Q4aDM2xBqDhw1MdoJj5tyGT5kNJ4zQXjFObylq7sdV2tbm9jCmFhWRor
	p4m16
X-Google-Smtp-Source: AGHT+IHghU5JB92rQb5/laIi7WxHhA2dq9+e76tP2eBE8wVgOV2VIOrFMw9IYclbvj3Kg1D1ug4KfA==
X-Received: by 2002:a05:6602:1589:b0:867:40d9:bf7e with SMTP id ca18e2360f4ac-867473b3bf4mr660105739f.9.1746670796681;
        Wed, 07 May 2025 19:19:56 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88a8d0071sm2975776173.1.2025.05.07.19.19.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 19:19:56 -0700 (PDT)
Message-ID: <c9aac0f1-7fed-4d12-b80a-767df7168a43@riscstar.com>
Date: Wed, 7 May 2025 21:19:54 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] dt-bindings: soc: spacemit: define spacemit,k1-ccu
 resets
To: Yixun Lan <dlan@gentoo.org>
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
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250507223554-GYA505240@gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/7/25 5:35 PM, Yixun Lan wrote:
> hi Alex,
> 
> On 16:06 Tue 06 May     , Alex Elder wrote:
>> There are additional SpacemiT syscon CCUs whose registers control both
>> clocks and resets:  RCPU, RCPU2, and APBC2. Unlike those defined
>> previously, these will (initially) support only resets.  They do not
>> incorporate power domain functionality.
>>
>> Previously the clock properties were required for all compatible nodes.
>> Make that requirement only apply to the three existing CCUs (APBC, APMU,
>> and MPMU), so that the new reset-only CCUs can go without specifying them.
>>
>> Define the index values for resets associated with all SpacemiT K1
>> syscon nodes, including those with clocks already defined, as well as
>> the new ones (without clocks).
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 +++-
>>   .../dt-bindings/clock/spacemit,k1-syscon.h    | 128 ++++++++++++++++++
>>   2 files changed, 150 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
>> index 30aaf49da03d3..133a391ee68cd 100644
>> --- a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
>> +++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
>> @@ -19,6 +19,9 @@ properties:
>>         - spacemit,k1-syscon-apbc
>>         - spacemit,k1-syscon-apmu
>>         - spacemit,k1-syscon-mpmu
>> +      - spacemit,k1-syscon-rcpu
>> +      - spacemit,k1-syscon-rcpu2
>> +      - spacemit,k1-syscon-apbc2
>>   
>>     reg:
>>       maxItems: 1
>> @@ -47,9 +50,6 @@ properties:
>>   required:
>>     - compatible
>>     - reg
>> -  - clocks
>> -  - clock-names
>> -  - "#clock-cells"
>>     - "#reset-cells"
>>   
>>   allOf:
>> @@ -57,13 +57,28 @@ allOf:
>>         properties:
>>           compatible:
>>             contains:
>> -            const: spacemit,k1-syscon-apbc
>> +            enum:
>> +              - spacemit,k1-syscon-apmu
>> +              - spacemit,k1-syscon-mpmu
>>       then:
>> -      properties:
>> -        "#power-domain-cells": false
>> -    else:
>>         required:
>>           - "#power-domain-cells"
>> +    else:
>> +      properties:
>> +        "#power-domain-cells": false
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - spacemit,k1-syscon-apbc
>> +              - spacemit,k1-syscon-apmu
>> +              - spacemit,k1-syscon-mpmu
>> +    then:
>> +      required:
>> +        - clocks
>> +        - clock-names
>> +        - "#clock-cells"
>>   
>>   additionalProperties: false
>>   
>> diff --git a/include/dt-bindings/clock/spacemit,k1-syscon.h b/include/dt-bindings/clock/spacemit,k1-syscon.h
>> index 35968ae982466..f5965dda3b905 100644
>> --- a/include/dt-bindings/clock/spacemit,k1-syscon.h
>> +++ b/include/dt-bindings/clock/spacemit,k1-syscon.h
> would it be better to move all reset definition to its dedicated dir?
> which like: include/dt-bindings/reset/spacemit,k1-syscon.h?

That's fine with me.  I should have thought of that.

Krzysztof, I'll drop your Reviewed-by if I make that change,
but if you say I can before I post v7 I will keep it.

I'll wait a bit more before I update so others can comment
(on this or anything else).

Thanks.

					-Alex

> 
>> @@ -78,6 +78,9 @@
>>   #define CLK_APB			31
>>   #define CLK_WDT_BUS		32
>>   
>> +/* MPMU resets */
>> +#define RESET_WDT		0
>> +
>>   /* APBC clocks */
>>   #define CLK_UART0		0
>>   #define CLK_UART2		1
>> @@ -180,6 +183,59 @@
>>   #define CLK_TSEN_BUS		98
>>   #define CLK_IPC_AP2AUD_BUS	99
>>   
>> +/* APBC resets */
>> +#define RESET_UART0		0
>> +#define RESET_UART2		1
>> +#define RESET_UART3		2
>> +#define RESET_UART4		3
>> +#define RESET_UART5		4
>> +#define RESET_UART6		5
>> +#define RESET_UART7		6
>> +#define RESET_UART8		7
>> +#define RESET_UART9		8
>> +#define RESET_GPIO		9
>> +#define RESET_PWM0		10
>> +#define RESET_PWM1		11
>> +#define RESET_PWM2		12
>> +#define RESET_PWM3		13
>> +#define RESET_PWM4		14
>> +#define RESET_PWM5		15
>> +#define RESET_PWM6		16
>> +#define RESET_PWM7		17
>> +#define RESET_PWM8		18
>> +#define RESET_PWM9		19
>> +#define RESET_PWM10		20
>> +#define RESET_PWM11		21
>> +#define RESET_PWM12		22
>> +#define RESET_PWM13		23
>> +#define RESET_PWM14		24
>> +#define RESET_PWM15		25
>> +#define RESET_PWM16		26
>> +#define RESET_PWM17		27
>> +#define RESET_PWM18		28
>> +#define RESET_PWM19		29
>> +#define RESET_SSP3		30
>> +#define RESET_RTC		31
>> +#define RESET_TWSI0		32
>> +#define RESET_TWSI1		33
>> +#define RESET_TWSI2		34
>> +#define RESET_TWSI4		35
>> +#define RESET_TWSI5		36
>> +#define RESET_TWSI6		37
>> +#define RESET_TWSI7		38
>> +#define RESET_TWSI8		39
>> +#define RESET_TIMERS1		40
>> +#define RESET_TIMERS2		41
>> +#define RESET_AIB		42
>> +#define RESET_ONEWIRE		43
>> +#define RESET_SSPA0		44
>> +#define RESET_SSPA1		45
>> +#define RESET_DRO		46
>> +#define RESET_IR		47
>> +#define RESET_TSEN		48
>> +#define RESET_IPC_AP2AUD	49
>> +#define RESET_CAN0		50
>> +
>>   /* APMU clocks */
>>   #define CLK_CCI550		0
>>   #define CLK_CPU_C0_HI		1
>> @@ -244,4 +300,76 @@
>>   #define CLK_V2D			60
>>   #define CLK_EMMC_BUS		61
>>   
>> +/* APMU resets */
>> +#define RESET_CCIC_4X		0
>> +#define RESET_CCIC1_PHY		1
>> +#define RESET_SDH_AXI		2
>> +#define RESET_SDH0		3
>> +#define RESET_SDH1		4
>> +#define RESET_SDH2		5
>> +#define RESET_USBP1_AXI		6
>> +#define RESET_USB_AXI		7
>> +#define RESET_USB3_0		8
>> +#define RESET_QSPI		9
>> +#define RESET_QSPI_BUS		10
>> +#define RESET_DMA		11
>> +#define RESET_AES		12
>> +#define RESET_VPU		13
>> +#define RESET_GPU		14
>> +#define RESET_EMMC		15
>> +#define RESET_EMMC_X		16
>> +#define RESET_AUDIO		17
>> +#define RESET_HDMI		18
>> +#define RESET_PCIE0		19
>> +#define RESET_PCIE1		20
>> +#define RESET_PCIE2		21
>> +#define RESET_EMAC0		22
>> +#define RESET_EMAC1		23
>> +#define RESET_JPG		24
>> +#define RESET_CCIC2PHY		25
>> +#define RESET_CCIC3PHY		26
>> +#define RESET_CSI		27
>> +#define RESET_ISP_CPP		28
>> +#define RESET_ISP_BUS		29
>> +#define RESET_ISP		30
>> +#define RESET_ISP_CI		31
>> +#define RESET_DPU_MCLK		32
>> +#define RESET_DPU_ESC		33
>> +#define RESET_DPU_HCLK		34
>> +#define RESET_DPU_SPIBUS	35
>> +#define RESET_DPU_SPI_HBUS	36
>> +#define RESET_V2D		37
>> +#define RESET_MIPI		38
>> +#define RESET_MC		39
>> +
>> +/*	RCPU resets	*/
>> +#define RESET_RCPU_SSP0		0
>> +#define RESET_RCPU_I2C0		1
>> +#define RESET_RCPU_UART1		2
>> +#define RESET_RCPU_IR		3
>> +#define RESET_RCPU_CAN		4
>> +#define RESET_RCPU_UART0		5
>> +#define RESET_RCPU_HDMI_AUDIO	6
>> +
>> +/*	RCPU2 resets	*/
>> +#define RESET_RCPU2_PWM0		0
>> +#define RESET_RCPU2_PWM1		1
>> +#define RESET_RCPU2_PWM2		2
>> +#define RESET_RCPU2_PWM3		3
>> +#define RESET_RCPU2_PWM4		4
>> +#define RESET_RCPU2_PWM5		5
>> +#define RESET_RCPU2_PWM6		6
>> +#define RESET_RCPU2_PWM7		7
>> +#define RESET_RCPU2_PWM8		8
>> +#define RESET_RCPU2_PWM9		9
>> +
>> +/*	APBC2 resets	*/
>> +#define RESET_APBC2_UART1	0
>> +#define RESET_APBC2_SSP2	1
>> +#define RESET_APBC2_TWSI3	2
>> +#define RESET_APBC2_RTC		3
>> +#define RESET_APBC2_TIMERS0	4
>> +#define RESET_APBC2_KPC		5
>> +#define RESET_APBC2_GPIO	6
>> +
>>   #endif /* _DT_BINDINGS_SPACEMIT_CCU_H_ */
>> -- 
>> 2.45.2
>>
> 

