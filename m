Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517863112B4
	for <spacemit@lists.linux.dev>; Wed, 17 Sep 2025 23:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758152436; cv=none; b=junyFVoZXxR5tn5/sq5afnKEtEI2RR/SamzPjH9eQfE7bVIjHzEU5vpzh03a27zFgAIUGYWiTkOCxlu8OqPTZGOSzeDuCJ+3NiOOZvFqhYiPo5dqfCV9FejEbAIpTizys71JG8szkFZXqlmyRBWgfzGFdVwLgRKaFQupPB9YG+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758152436; c=relaxed/simple;
	bh=WSUDTo2YPrsMhanXvD2WU2viqGWsoO+MKY+Xv+c2P7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jefW2iXQdsijeni39XZesJw2G7pcSLTeJBzknoBozSeaq2wPIVEIfCaVUfb0Dug6HSj+kvUhwZBXdZtkH6BwM52pZcbUCuIcBcb0rHQfI/GBL2r3EFf2vVgUn/IT6ntroI80wAe1ZEGRF7dC/37FUFLR5m9H25ZBNFMhv5FIMEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Omy1fRX/; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Omy1fRX/"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-88432e60eebso13514439f.3
        for <spacemit@lists.linux.dev>; Wed, 17 Sep 2025 16:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758152433; x=1758757233; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U4LnKnBe0mUrdxdcBF4M/llb4IeQlPfA2whttLuEB5Q=;
        b=Omy1fRX/iHVKEVP8hUZ5CRyU5R7ad1YTbpWoycgt0gM0fCnD4jhw3m4a7pDtmuQfWu
         cgn8HSrt0VVrWYpoFULjZoWz+C7LVI+/rO4kemOajrvY1z+odq1rJmea/XWZL1sk58BN
         LSN1ENgfrsyMTbvAvIzyVbhm6tdqnvXdiz+7V18tQZlouIAELEQdu6ABwk9tdAnT/7AM
         N17pcErdyBaThkuI8sjkDdRhQoyBQBZcs1HXEGSpyvhVXEJBKGrZ8ceECfBrjeNlyij2
         EsqCFhTOsvVfQvVbJ66kEfQu4tpDOmxCe+hTCwM/T4rgbUduqyoITdJs8YZyxuy98OJH
         Hx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758152433; x=1758757233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U4LnKnBe0mUrdxdcBF4M/llb4IeQlPfA2whttLuEB5Q=;
        b=RCaU0uMf2lvgooeyyRuRriIB2f27nyvHV4dJdi4x3LsMvpGkltFUKl9LmL1yuNCrKm
         9f+v1n9qkDY8Oz9cCQWCV3TEvsWsQLHJdrnlDfJlqqOG/+N5XZsq1WCazsCFsqY2oOHl
         U1j9CtPkA7EuarF4n1WMbNC9aYg4l9l/F3mmaeRvc52mqGQQ87Y1h9Zh5O41MwyRzaA6
         lYPj3DiJDE3UCYrCypjQCCmIdAHNbJ3hsptL68/pyh4GqD2Ed1LdeKwfQDss3tIsnQBw
         q0y7lr6gbxgJUIZcLfMyzKnKFunHLWO8AH/VBsJvQd+Ha39T+cHQdiCO4mDQgrQ2Zd5P
         YvSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwaDkgA9qXLo+tpqCdNw09Juetg4giaeQaqt4P73LvjkoJ2B/g24lJUlNHVj+ogdBtdlN0uma2Ew==@lists.linux.dev
X-Gm-Message-State: AOJu0YwcDR1t8kygfFxeE1785CpbHtrY8Q1Z4lH9i4g/ZKaZOFv+evS1
	9xL9XPexlWVKp7FCVxZCPFzQ/lAh4C6J/Jm4UkNrlcst9t6w5jgeZBPvdlM/UbGs9XQ=
X-Gm-Gg: ASbGnctmUTFCYlVz9SZq9UVr3Itn1xP70zCZIqk7iOVacs1SkwgEPSxnSAzIlsz4+ut
	dIVzSxUroMIEfFAtWgdhd+5aO1nZfbKv1NlGtGXn1ft6kuEBRZBQ3XvOLksPQl6WVXPivxNDBGE
	Gv6ei9B+5q6xqN+RIwV8aDDMgk0hfv7FAlzBJY0GB1y7Ph36cfur6UMkIVc4KBTAEVzRlThEMMY
	sMk8FR1HLnbFvNRg3ncdIT4XNZ0k2q5+t51AdfnmsAwP8Ji/MWpAh9uvYtijFSvDmTFs/baIXOQ
	Qca805tWSXU8LIid4r5yn+bU3ehiSbCYB+EygtDXz/ePPgYQG512fg13VSSZA9/KfHZxyZ4jlug
	K/q60+pKxl2GI15q+XvnGWx6jEwSrHs5K3RqaXYjUITKvhfQZjc2jHw==
X-Google-Smtp-Source: AGHT+IFIMlPua7p/TY9YMSKjXsZOBX/5j6z1IJQ7nS5dT8sO4hABWq+/kl4R3zdjJi/vT1pYQ+i8NA==
X-Received: by 2002:a05:6602:6c10:b0:86d:9ec7:267e with SMTP id ca18e2360f4ac-89d1a7c97eamr718446339f.4.1758152433403;
        Wed, 17 Sep 2025 16:40:33 -0700 (PDT)
Received: from [10.211.55.5] ([131.212.251.230])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8a46fea3353sm31238739f.12.2025.09.17.16.40.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 16:40:32 -0700 (PDT)
Message-ID: <3b815302-21f2-4ee2-bf83-c1dba77ce3d1@riscstar.com>
Date: Wed, 17 Sep 2025 18:40:31 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
To: Yixun Lan <dlan@gentoo.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-2-elder@riscstar.com>
 <20250917231520-GYA1269891@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250917231520-GYA1269891@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/25 6:15 PM, Yixun Lan wrote:
> Hi Alex,
> 
> On 17:07 Wed 17 Sep     , Alex Elder wrote:
>> Add support for the SPI controller implemented by the SpacemiT K1 SoC.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   .../bindings/spi/spacemit,k1-spi.yaml         | 94 +++++++++++++++++++
>>   1 file changed, 94 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
>> new file mode 100644
>> index 0000000000000..5abd4fe268da9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
>> @@ -0,0 +1,94 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/spi/spacemit,k1-spi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: SpacemiT K1 SoC Serial Peripheral Interface (SPI)
>> +
>> +maintainers:
>> +  - Alex Elder <elder@kernel.org>
>> +
>> +description:
>> +  The SpacemiT K1 SoC implements a SPI controller that has two 32-entry
>> +  FIFOs, for transmit and receive.  Details are currently available in
>> +  section 18.2.1 of the K1 User Manual, found in the SpacemiT Keystone
>> +  K1 Documentation[1].  The controller transfers words using PIO.  DMA
>> +  transfers are supported as well, if both TX and RX DMA channels are
>> +  specified,
>> +
>> +  [1] https://developer.spacemit.com/documentation
>> +
>> +allOf:
>> +  - $ref: /schemas/spi/spi-controller.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - spacemit,k1-spi
> one enum is effectively equal to const..

OK.  That's an easy fix.

>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: Core clock
>> +      - description: Bus clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core
>> +      - const: bus
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  dmas:
>> +    items:
>> +      - description: RX DMA channel
>> +      - description: TX DMA channel
>> +
>> +  dma-names:
>> +    items:
>> +      - const: rx
>> +      - const: tx
>> +
>> +  spacemit,k1-ssp-id:
>> +    description: SPI controller number
>> +    $ref: /schemas/types.yaml#/definitions/uint32
> could you explain a little bit why this vendor specific property should
> be introduced? I took a look at the code, and didn't get the reason
> behind.. or what's the problem of simply using "pdev->id"?

This property was carried over from the vendor code.  It is
optional, and if it isn't specified, the platform device ID (-1)
will be used.  It's just intended to provide a well-defined ID
for a particular SPI controller.

> we should really be careful to introduce vendor specific property..

If there were a standard way of doing this I'd love to use it.

And if it isn't necessary, please just explain to me why.  I
have no problem removing it.

>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - interrupts
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +
>> +    #include <dt-bindings/clock/spacemit,k1-syscon.h>
>> +    spi3: spi@d401c000 {
> label not needed for DT example

OK.

>> +        compatible = "spacemit,k1-spi";
>> +        reg = <0xd401c000 0x30>;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +        clocks = <&syscon_apbc CLK_SSP3>,
>> +                 <&syscon_apbc CLK_SSP3_BUS>;
>> +        clock-names = "core",
>> +                      "bus";
>> +        resets = <&syscon_apbc RESET_SSP3>;
>> +        interrupts-extended = <&plic 55>;
>> +        spacemit,k1-ssp-id = <3>;
>> +        dmas = <&pdma 20>,
>> +               <&pdma 19>;
>> +        dma-names = "rx",
>> +                    "tx";
> ..
>> +        status = "disabled";
> ditto, drop it

OK.  Thanks a lot for your quick review.  I'll wait a bit
(probably until Monday) before I send an update.

					-Alex

>> +    };
>> -- 
>> 2.48.1
>>
> 

