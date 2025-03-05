Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E375130AC8
	for <spacemit@lists.linux.dev>; Wed,  5 Mar 2025 02:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741140682; cv=none; b=GgabfJgHyxukDI6lxCrXYVKFe+NVpXiYHkH/RfMnQEpK/LW+FsKqh7v4GB6IppbEzMfe+UBJQrHsjE6Je+u9pZrv818I5e5LIyQ5jQZuSH/bKekVrPCGZ8ck/bKWuNN0QTO+rWwuHtS+Q/RSsuq3rAR1ty+XnA4Yw7w3v+tXi1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741140682; c=relaxed/simple;
	bh=Q8WmlKeJj7M60YHkpMu1VvFfgzxwRdhcvmDLZvH+Xvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pd3pzYJYqfMpSYTyR3HSU9FiJ6uKh3pJVrnRvaePVXAEg+TtzBJaMv4hjzfnWanqbdiMUJBbi9L4ZcfuMY47JdjYQBBgZLu2Zc50Wd5GaNIDKSJ5tgfM85HtL3+7SdOvofY522SKO3Bmgt5Y3LLS15/fsLi0IWajWxB+tje6V5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=Bz0nKzjk; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Bz0nKzjk"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-85ad83ba141so246071539f.2
        for <spacemit@lists.linux.dev>; Tue, 04 Mar 2025 18:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1741140678; x=1741745478; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+IPu6iJQJZK/agzAsjhgRU4s3OBRGcgTM6nYh8CRHfM=;
        b=Bz0nKzjkTrmPYGaVDurH3hhuHOzgWkfgnW0kPLAJxLHBjFfnKLE1Dyf+RFXNOGthyv
         gMImHSMK5gijUnhzBCK5K3+EBFKE+LG2jzvuV5b4ELP7S71bFJlcveTDgLJL4oPFqu1G
         Gis7v11ZdQHzcqbaaMFRG197uzuObQROIqp13nnRruSieTkysOaax45r57ghuT9XEu8i
         gNK1KXy8OZA7wPUgaeWBAkaH+/iwu88hT9dQsMf+xFS3FnEN8t3DR0Ok3ZBPV+5IFKf2
         3znTMZ39XsrALKAibjQVa2kW2AdEO1/FPRPjDsAPsbOmxM0G271QkZg8XLJweViqwAYZ
         psVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741140678; x=1741745478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+IPu6iJQJZK/agzAsjhgRU4s3OBRGcgTM6nYh8CRHfM=;
        b=tL5n63dDOlsfM7bDzp9XrhmMsToCOcoxZ8wZhneIOf/XKEuFTBpwYIVsbR/qiAUq2w
         ogIxKsva5symJqN559cJfYCv1KwjFVvFim/140dJRWY87O93gzOhj+HGEFy4v2wJ+VgI
         T18eNWaXNmlaghQ38yUrJdgHFW0zjn/L+ozIwupaFExQTfQctAQoxaClx27KHuQTdIwF
         OkjarVsYJE6ATeeI8UO1jpSZVaI0govAGYfT764+rQsJut7nYH4wee46K9kx/CrqjtIn
         xCdnoUYWj5wQlyWz5Zqhv4ZWtWjyGlHGnhFJZBfGSzwjKBY5tymZo48WxAho+vAqBsOu
         efzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtLTrE2BLlnlUmxmy+eQh9ss5qAtrdyahvYXfO3vSkHGQ/f/1Mdwz/Hn2U3i7zwwdKxndh0xYccw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxs27ITLjWL003ftFG//Iv7Zmp29fEBuDeXkoE7V8KniBHJ3DbX
	wxRNY1XXNmJnb9Gnw0zY4hzIbqrFOrDnenTSR1OE7c+vMxGnrmqBo52LICzg+A4=
X-Gm-Gg: ASbGncuyBQb6lsHXD9rV7WidFlHuSf17xXKZ8WH5SkNKyRqtDI3ixO9wP2wkplSA5XG
	Omp+7Mel7hK5XHQ7XjEkiHDuy+I3ETqx1orps4YteFSQAjJjiOLT+73KxlJNWwqLfaMzoZA71HZ
	6A9qtdGaM3FMbuLTteA1W8Ikln3/ZUEDcQycAjTFGBiFVjwm14jEW7EOZkN6PsKLYLH2a5ztZB6
	LadLaPjT2VJhrFkmYohVT/aluf33WsVjwiN+HOJlioUzUzovi1VwV5FMswa01cBZVnZOFXRCoei
	yiPuYDEr/6nkpbmKW625F0lKpTLHYtQx7ANbsjc=
X-Google-Smtp-Source: AGHT+IG15YhzjdJR2FqfaMtHfCYjpuXOjr2GugugmrdEVDdT7gY0ODZ6/4j012jh/Swg9m4eJ6IseA==
X-Received: by 2002:a05:6602:388c:b0:85a:fd37:1c6d with SMTP id ca18e2360f4ac-85aff8abd43mr226317839f.6.1741140678617;
        Tue, 04 Mar 2025 18:11:18 -0800 (PST)
Received: from [100.64.0.1] ([170.85.6.166])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f07cd84f06sm2387028173.67.2025.03.04.18.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 18:11:18 -0800 (PST)
Message-ID: <ab10e069-d9e1-4df7-9454-8b0fc910443d@sifive.com>
Date: Tue, 4 Mar 2025 20:11:16 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 1/2] dt-bindings: i2c: spacemit: add support for
 K1 SoC
To: Yixun Lan <dlan@gentoo.org>, Troy Mitchell <troymitchell988@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
 Conor Dooley <conor.dooley@microchip.com>
References: <20250303-k1-i2c-master-v5-0-21dfc7adfe37@gmail.com>
 <20250303-k1-i2c-master-v5-1-21dfc7adfe37@gmail.com>
 <20250303093506-GYA58937@gentoo>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20250303093506-GYA58937@gentoo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Troy,

On 2025-03-03 3:35 AM, Yixun Lan wrote:
> On 13:30 Mon 03 Mar     , Troy Mitchell wrote:
>> The I2C of K1 supports fast-speed-mode and high-speed-mode,
>> and supports FIFO transmission.
>>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
>> ---
>>  .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   | 59 ++++++++++++++++++++++
>>  1 file changed, 59 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..db49f1f473e6f166f534b276c86b3951d86341c3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>> @@ -0,0 +1,59 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: I2C controller embedded in SpacemiT's K1 SoC
>> +
>> +maintainers:
>> +  - Troy Mitchell <troymitchell988@gmail.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: spacemit,k1-i2c
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
> ..
>> +  clocks:
>> +    minItems: 2
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    minItems: 2
>> +    maxItems: 2
> I'd suggest to give a brief description and explicit clock name here,
> you can consult marvell,mv64xxx-i2c.yaml for example
> 
>> +
>> +  clock-frequency:
>> +    description: |
>> +      K1 support three different modes which running different frequencies
>> +      standard speed mode: up to 100000 (100Hz)
>> +      fast speed mode    : up to 400000 (400Hz)
>> +      high speed mode    : up to 3300000 (3.3Mhz)
>> +    default: 400000
>> +    maximum: 3300000
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    i2c@d4010800 {
>> +        compatible = "spacemit,k1-i2c";
>> +        reg = <0xd4010800 0x38>;
>> +        interrupt-parent = <&plic>;
>> +        interrupts = <36>;
>> +        clocks = <&ccu 176>, <&ccu 90>;
>> +        clock-names = "apb", "twsi";
> 9.1.4.61 TWSI0 CLOCK RESET CONTROL REGISTER(APBC_TWSI0_CLK_RST)
> https://developer.spacemit.com/documentation?token=LCrKwWDasiJuROkVNusc2pWTnEb#part594
> from above docs, there are two clocks 
> bit[1] - FNCLK, TWSI0 Functional Clock Enable/Disable
> bit[0] - APBCLK, TWSI0 APB Bus Clock Enable/Disable
> 
> I'd suggest to name it according to the functionality, thus 'func', 'bus'
> clock, not its source.. which would make it more system wide consistent

Also in that same register is:

2	RST	RW	0x1	TWSI0 Reset Generation
This field resets both the APB and functional domain.
- 0: No Reset
- 1: Reset

Which means you need a 'resets' property in the binding as well.

Regards,
Samuel

>> +        clock-frequency = <100000>;
>> +    };
>> +
>> +...
>>
>> -- 
>> 2.34.1
>>
> 

