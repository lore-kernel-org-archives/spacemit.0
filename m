Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF796279DCC
	for <spacemit@lists.linux.dev>; Thu, 14 Aug 2025 21:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755208134; cv=none; b=oobryMs59M0gmDHNi3tmLLJSle03TxroGUVEKkf+YikLTV7vVzfBmN3rXkoFYFRTJOu8xxkd0mVfWFrbg7BpOblq0ufKQFdSbFK0/I0ae17OkmMMavRXQH50sXTq8K/nKKys+eQ/DRvDx3nltOwuhIhs8QOcMFheY7SOqG+8VZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755208134; c=relaxed/simple;
	bh=aeCT1ChAfnxrV4QBH+I+d7ZQyWZZMGksEWhBzA5kDbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=opPPXd45RUdxKztIy3iepMbvzK7nKXmGSKL0Do1P/ZKQ2w5fTZc35DI61xa63Jl20FE466DaKJhwAXUd0ewWlgthTWOPE4tJBchwLztbpmspcdetfUotfmGWUKReGqonjSNhyL2q7biksQvmLuEJEKIwexcCDCvb7bJtqYVVvVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=fHEjzEzk; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="fHEjzEzk"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3e57376f661so4538615ab.1
        for <spacemit@lists.linux.dev>; Thu, 14 Aug 2025 14:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755208132; x=1755812932; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XCt+/c8MTw4m0fkTKSEjZUjQW40svl96k4sq8RtcJzA=;
        b=fHEjzEzk0An6G7hLBHR+zRIUpvpsD423ZCp4gkpplgyYM/TrEqbpxoye6cZP0pSO5a
         elfGMLtrlaiB2h1wUWOrOdk2K2kRG4hXajs1cQQHrvfLUHgtyUARzgFTVkUMzsjcp6Bm
         KM1gSHBRNeQVehMMs3qnNIwvVcNlG1y6PrbWshoOkr4oQ4vkYmbkQfj77FXIo2+mVdFG
         Hfj4ECCuAlywZ/xsoTBj/kIMwoPVXmWYNsFKSyE8MYqPk6d/qNebNS/2O0iB2G3c/oP1
         S1IJdHvff2XiXrkCoTipcISoXuG64YEjaHNjJfjFCL/COD7VP/9Hwy5l+FkgnOyAaETc
         rGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755208132; x=1755812932;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XCt+/c8MTw4m0fkTKSEjZUjQW40svl96k4sq8RtcJzA=;
        b=DdYFycDyNSG0VFkmTiU9WbYCYLyFTACtm87I0/8dtEKGsulZDPwa07kkSFBbbBfscR
         /WDszvt2LDJ3pFy94TXf/f6b6UzGWh1G2fa6KPHdVCjzNLggr5JWTGK3Qwp+ZSlPellX
         qdEN31xMKyCxQKec2s1weYMfUmh/P1AXZx44zcJXOr5qn4y1LmlgyaKNNCrO5/O/NK/Z
         /4ZQ8gYqli8udfaU9EegR/fs8gJv1W3k4QRNfDqxF/dU/5hegp3tqcz/eAEI9vn0y5EZ
         BFUWcdbj0ZwIKDutmmLjMQOvRGxSYbZNGpF2I7gyHtmhl5IRgjwPWkH7xPbybBiDv5NO
         PrGA==
X-Forwarded-Encrypted: i=1; AJvYcCXEbAZG4x9F11Cn6bmYv5TJ809j/aTMrWIUkR6Mfhd2tcL0bncCQuYp2ENjIF38B0ll2Dspy6iK2A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz38AHuXHV/Fq8Q3RZdIzurpJ9E2vhOtNadvxYpV9g8fPQY89Kg
	Y3g5hN3sX+KIJ81Cd1ArGll5EzJBdi94yzQPyAAqNn4tmatrIE9fRvSBidaI5D81BfE=
X-Gm-Gg: ASbGncvwTOM5tOChWrpsOYTYkR5ioCR1eHjm+9etEmUA7NGTwJgaYW5AtEaBh8ZL4mj
	mkFgB9Ffh/7B6wBoU+pUFoNRH2t1rQLffNoM3Al3itbFTIXKeBjW0PFAB3oCXrZxoFow71hSzxM
	/3bmvZ3OxcXbqUbyLr3hCzKf/nqVAKWhEFOPtA4r7MQvgi3hTpI/WZGjjJCeGMigYOCvR10RIxG
	2tV2QssIgr0g6tlMCmQSPvRuH4I+BUpkbfNe9RX5sRr1dYZp1S+zdk0tPDG6MpGKo4B+wkGRTBk
	Bid1FIW8u3Jy5tIo2VwuKwnn4PU6nfnRWcrnQud60GtyBxUjhByQTEnGKxq0VIXFA+ZmmqBLktz
	vLnHWuYC+8EG8J35nBpxofdMWm3+hQ8V42An+Fa7EkBQ72H/5lS6RxsLWiXWzbw==
X-Google-Smtp-Source: AGHT+IFztpZaPjE0ea4cNoutzDsxWfnWI0H8yYAAWojxd3NMEw8UDJycdrDTch6nLLHh52NEA2N7Sw==
X-Received: by 2002:a92:cd8c:0:b0:3e5:4eb2:73e3 with SMTP id e9e14a558f8ab-3e57ba5c53emr13235285ab.16.1755208131603;
        Thu, 14 Aug 2025 14:48:51 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9bd3291sm4605468173.63.2025.08.14.14.48.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 14:48:51 -0700 (PDT)
Message-ID: <bc6975bd-cc1a-41ff-887c-0509bc8f03c3@riscstar.com>
Date: Thu, 14 Aug 2025 16:48:48 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: phy: spacemit: add SpacemiT PCIe/combo
 PHY
To: Rob Herring <robh@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, bhelgaas@google.com,
 vkoul@kernel.org, kishon@kernel.org, dlan@gentoo.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, tglx@linutronix.de,
 johan+linaro@kernel.org, thippeswamy.havalige@amd.com, namcao@linutronix.de,
 mayank.rana@oss.qualcomm.com, shradha.t@samsung.com, inochiama@gmail.com,
 quic_schintav@quicinc.com, fan.ni@samsung.com, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250813184701.2444372-1-elder@riscstar.com>
 <20250813184701.2444372-2-elder@riscstar.com>
 <20250814205128.GA3873683-robh@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250814205128.GA3873683-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/25 3:51 PM, Rob Herring wrote:
> On Wed, Aug 13, 2025 at 01:46:55PM -0500, Alex Elder wrote:
>> Add the Device Tree binding for the PCIe/USB 3.0 combo PHY found in
>> the SpacemiT K1 SoC.  This is one of three PCIe PHYs, and is unusual
>> in that only the combo PHY can perform a calibration step needed to
>> determine settings used by the other two PCIe PHYs.
>>
>> Calibration must be done with the combo PHY in PCIe mode, and to allow
>> this to occur independent of the eventual use for the PHY (PCIe or USB)
>> some PCIe-related properties must be supplied: clocks; resets; and a
>> syscon phandle.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   .../bindings/phy/spacemit,k1-combo-phy.yaml   | 110 ++++++++++++++++++
>>   1 file changed, 110 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml
>> new file mode 100644
>> index 0000000000000..ed78083a53231
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml
>> @@ -0,0 +1,110 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/spacemit,k1-combo-phy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: SpacemiT K1 PCIe/USB3 Combo PHY
>> +
>> +maintainers:
>> +  - Alex Elder <elder@riscstar.com>
>> +
>> +description:
> 
> You need a '>' or the paragraphs formatting will not be maintained
> (should we ever render docs from this).

OK.

>> +  Of the three PHYs on the SpacemiT K1 SoC capable of being used for
>> +  PCIe, one is a combo PHY that can also be configured for use by a
>> +  USB 3 controller.  Using PCIe or USB 3 is a board design decision.
>> +
>> +  The combo PHY is also the only PCIe PHY that is able to determine
>> +  PCIe calibration values to use, and this must be determined before
>> +  the other two PCIe PHYs can be used.  This calibration must be
>> +  performed with the combo PHY in PCIe mode, and is this is done
>> +  when the combo PHY is probed.
>> +
>> +  During normal operation, the PCIe or USB port driver is responsible
>> +  for ensuring all clocks needed by a PHY are enabled, and all resets
>> +  affecting the PHY are deasserted.  However, for the combo PHY to
>> +  perform calibration independent of whether it's later used for
>> +  PCIe or USB, all PCIe mode clocks and resets must be defined.
>> +
>> +properties:
>> +  compatible:
>> +    const: spacemit,k1-combo-phy
>> +
>> +  reg:
>> +    items:
>> +      - description: PHY control registers
>> +
>> +  clocks:
>> +    items:
>> +      - description: DWC PCIe Data Bus Interface (DBI) clock
>> +      - description: DWC PCIe application AXI-bus Master interface clock
>> +      - description: DWC PCIe application AXI-bus Slave interface clock.
> 
> End with a period or don't. Just be consistent.

OK.

> You need DWC PCIe clocks for your PHY? A ref clock would make sense, but
> these? I've never seen a PHY with a AXI master interface.

*This* is what I was waiting for.  I explained it briefly in
the patch headers and elsewhere but I expected questions.

This is needed to support USB mode, while also supporting the other
PCIe interfaces.

The SpacemiT IP requires its PCIe interfaces to have 4-bit RX and TX
receiver termination values be configured during initialization.  The
values to use must be determined dynamically by doing a calibration
step, then reading a (PCIe) register that contains the values to use.

Only the combo PHY is able to perform this calibration. and the
configuration values it determines must then be used to configure
the other two PCIe (only) PHYs.

This means that to calibrate, the combo PHY must be started (clocks
enabled, resets de-asserted) in PCIe mode.

If the combo PHY were going to be used for PCIe, this could be done
when it is initialized, because the PCIe driver would ensure the
clocks and resets were set up properly.

But if the combo PHY is going to be used for USB, the PCIe
calibration step would (otherwise) never be done, and that
means the other two PCIe interfaces could not be used.

So my solution is to move this calibration step into the PHY.
The combo PHY performs the calibration step when it is probed,
and to do that the driver needs to use its PCIe clocks and resets.
Once the calibration values are known, the clocks and resets
are essentially forgotten, and the PHY is available for use (by
either PCIe or USB 3).

The other two PCIe interfaces cannot probe (-EPROBE_DEFER) until
the calibration values are known, which means they might have to
wait until after the combo PHY has probed successfully.

I asked SpacemiT about this a lot, but their answer is that the
combo PHY is the only one that can determine these values, and
they must be determined each time the hardware is powered up.

I think this approach is less ugly than some alternatives.

Is this clear?  Can you think of a different way of handling it?

>> +
>> +  clock-names:
>> +    items:
>> +      - const: dbi
>> +      - const: mstr
>> +      - const: slv
>> +
>> +  resets:
>> +    items:
>> +      - description: DWC PCIe Data Bus Interface (DBI) reset
>> +      - description: DWC PCIe application AXI-bus Master interface reset
>> +      - description: DWC PCIe application AXI-bus Slave interface reset.
> 
> Same here (on both points).

I will remove the period on the third one.

> 
>> +      - description: Global reset; must be deasserted for PHY to function
>> +
>> +  reset-names:
>> +    items:
>> +      - const: dbi
>> +      - const: mstr
>> +      - const: slv
>> +      - const: global
>> +
>> +  spacemit,syscon-pmu:
>> +    description:
>> +      PHandle that refers to the APMU system controller, whose
>> +      regmap is used in setting the mode
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +
>> +  "#phy-cells":
>> +    const: 1
>> +    description:
>> +      The argument value (PHY_TYPE_PCIE or PHY_TYPE_USB3) determines
>> +      whether the PHY operates in PCIe or USB3 mode.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - reset-names
>> +  - spacemit,syscon-pmu
>> +  - "#phy-cells"
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/spacemit,k1-syscon.h>
>> +    combo_phy: phy@c0b10000 {
> 
> Drop unused labels.

OK.

>> +        compatible = "spacemit,k1-combo-phy";
>> +        reg = <0xc0b10000 0x1000>;
>> +        clocks = <&syscon_apmu CLK_PCIE0_DBI>,
>> +                 <&syscon_apmu CLK_PCIE0_MASTER>,
>> +                 <&syscon_apmu CLK_PCIE0_SLAVE>;
>> +        clock-names = "dbi",
>> +                      "mstr",
>> +                      "slv";
>> +        resets = <&syscon_apmu RESET_PCIE0_DBI>,
>> +                 <&syscon_apmu RESET_PCIE0_MASTER>,
>> +                 <&syscon_apmu RESET_PCIE0_SLAVE>,
>> +                 <&syscon_apmu RESET_PCIE0_GLOBAL>;
>> +        reset-names = "dbi",
>> +                      "mstr",
>> +                      "slv",
>> +                      "global";
>> +        spacemit,syscon-pmu = <&syscon_apmu>;
>> +        #phy-cells = <1>;
>> +        status = "disabled";

Krzysztof also pointed out that I can't disable it so I'll drop
the above line as well.

Thanks for the review.

					-Alex

>> +    };
>> -- 
>> 2.48.1
>>

