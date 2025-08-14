Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9072405F8
	for <spacemit@lists.linux.dev>; Thu, 14 Aug 2025 12:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755174659; cv=none; b=eFxoMhNzTBfOBWtXMX2SWWqftTMRIKtgLZKPEbpDMkPrh1IcxiqmjHaeHsUrNTfA5zqpRh7JqemN7HfAlr5kXedXW6jFLqmOkpDW3QOEWXHiF3OJ77y9tS1+GQ3p7p6v1/oi1gihBEvt6t0XIxYnTqyVKgnu7gQY8/mkkqzT7Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755174659; c=relaxed/simple;
	bh=ehYxh88qbynkJXrnR7yfu3EhZJI6SZZ9KH93azTco3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y8ECIKCnaV0IMX8zCn4FBm/YqnxlP/U9OGKs6RaX00lXP/SgsnRiq4lRffx0eA9Cuiw/sfA5F5gxIPkIPC6NTkmfQlHcJEQjBonqODKeQd/ehW3oJTPtkfWZoOQFN+TTo9Fn6jJFVmLY/luu67MwWZoZMLzAcy7v42Z/ZL09UIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=c6vxVcMo; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="c6vxVcMo"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-74382027898so481473a34.3
        for <spacemit@lists.linux.dev>; Thu, 14 Aug 2025 05:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755174655; x=1755779455; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ywvq4778+XMT9D9uuqrnqBrIL1jeEJwzcsXhXKprWOg=;
        b=c6vxVcMoRQQHG3UJxDIrjNW52bmNgbhjUkbg/IFb1Z45IQGKUlQ6AmB3KGt/50whBf
         0IMyhFSrOan2iz4mJGUAXaFJXL3mIZyb+sCFmryxan+OvJraksmiiCg7VxJI0JjyhVum
         FhWQJIljVxRfIn10ApTKIS1itKES3vat1EmblXJJGPiLtKs5wz2pLXPGuj9LfA3HU9J3
         KfwB+vKN6EylyBi7MaNWAmX59mJ4xODr2r/ISZR+HeUUbqgYmaixhdK5fkMPh7vcI3N5
         bHwLtPb8g4SfWB87rp2z7+Ipch9r6L1CUNd4/teFvGbOt9t77LKVrWyfTj+JcrIMx5KP
         KkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755174655; x=1755779455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ywvq4778+XMT9D9uuqrnqBrIL1jeEJwzcsXhXKprWOg=;
        b=hB9+pgi7gEJXc/gxZluiD1az+I3OxCKf8qlZoNBNEuBSBMJ+nVHT8wskDySImMj2WL
         XMt0t7H0GZdmY0Rl4j3uxZjHP98eU0JDmTYj2i0ePVQ3Q9hBusaqWr8MGlZtZ5s5bUom
         8cjR5l68IsR6Z3VADoge7JCFkH5zrdwwF6laLjfBnr9gzsLPjho/w4FFvplB8+AOFw9u
         5pRvsVJAxbYh+6WK0dr4146TCw3kmNV+7iUvHF+wrDxHUs/O75ouFK25ed6arGAbfk9B
         HCoC3wxlEVxY78OQoS3tyQbrlcx6ZMnlLZKOPLkkZ2TL7k3X2mEf9PDq22LpVV56zS0o
         ak3A==
X-Forwarded-Encrypted: i=1; AJvYcCXUPw376000enntxt1GJik//ATTm5XORjlRDWJxCjVbba9tgYfejK7+KZg05WIfLI6SqeXOtmWU2g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwmYNgKVNqsJu97u2bsm/FhZyb2lHY67XqBFDbOXIwU9qE43vUn
	5WFi7cD+yaz3u35WZPJewFjyaX2rhTVUf+L15mEp2wfVPPd21jhYkl4t56QStyoH6cw=
X-Gm-Gg: ASbGncvgj0ErMIVYdFaWDqGy1cyIXP22ijUwdqBLwpdKX0vD0TCgSOcGAXbob6uV3IP
	H8MHMzixxPSIbKkUvuVqvQVjkSW14qmtsSfngyAAiVP8ixcLOHcmUijI9j4ZzCSqi+jXZqyGYCc
	FYTk/NAlDX18LIeFzmUB/pzbxjpqEUNARyut2vI6JiVPFvF3xssbJSmxwUDHv/udOL4Zp6Gisx0
	3iA91jYoENUZ9mb2qY3hJWM8WB/qDS2jqoLC0l+mKWcWjtx/oSgKwqvALITe+qDsEkyeluBGuNu
	CLOIM5TuP9ShD+38vuhGYaHhCubR+FHfCI6W5oQFppLipFFyn/dDQbvJiNHR6W4KnKklhIxydvq
	HF12TKMWH3EoSjR9cznLwDZLf1rUmSJYsqKfdiSPHfuEQUHcChsyviNgnXGZj6g==
X-Google-Smtp-Source: AGHT+IHBzdCRrljPnkfDW8jmr3rpPTUxAN1tCDdoZAzws2zd3haB25jvZwxqllCVG7gPmDZID86wtg==
X-Received: by 2002:a05:6830:3497:b0:727:3439:5bdf with SMTP id 46e09a7af769-74382bc3f86mr1632907a34.13.1755174655075;
        Thu, 14 Aug 2025 05:30:55 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae997ea9fsm4538196173.17.2025.08.14.05.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 05:30:54 -0700 (PDT)
Message-ID: <8f7bac84-623b-47dc-bc58-dc0013a85877@riscstar.com>
Date: Thu, 14 Aug 2025 07:30:52 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: phy: spacemit: add SpacemiT PCIe/combo
 PHY
To: Yao Zi <ziyao@disroot.org>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, bhelgaas@google.com, vkoul@kernel.org, kishon@kernel.org
Cc: dlan@gentoo.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
 tglx@linutronix.de, johan+linaro@kernel.org, thippeswamy.havalige@amd.com,
 namcao@linutronix.de, mayank.rana@oss.qualcomm.com, shradha.t@samsung.com,
 inochiama@gmail.com, quic_schintav@quicinc.com, fan.ni@samsung.com,
 devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pci@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250813184701.2444372-1-elder@riscstar.com>
 <20250813184701.2444372-2-elder@riscstar.com> <aJ1PJBax-Pj983OZ@pie>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aJ1PJBax-Pj983OZ@pie>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/13/25 9:52 PM, Yao Zi wrote:
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
> 
> ...
> 
>> +  spacemit,syscon-pmu:
>> +    description:
>> +      PHandle that refers to the APMU system controller, whose
>> +      regmap is used in setting the mode
>> +    $ref: /schemas/types.yaml#/definitions/phandle
> 
> Clock controllers and ethernet controllers all use spacemit,apmu to
> refer the APMU system controller. Do you think it's better to keep them
> aligned?

I do think it's better to keep them aligned.

And I appreciate your noticing this.  I don't see anything
that's accepted upstream that defines properties like this,
but I now see this:
  
https://lore.kernel.org/lkml/20250812-net-k1-emac-v5-2-dd17c4905f49@iscas.ac.cn/

I did a quick scan for what others do when a property's
value is a phandle, and other than just "syscon" it seems
that word is omitted.

So unless someone else suggests otherwise, I'll use
"spacemit,apmu" for this property in my next version.

> ...
> 
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/spacemit,k1-syscon.h>
>> +    combo_phy: phy@c0b10000 {
> 
> This label is unnecessary.

OK.  I used it when testing USB but we can add the label
back when that driver gets reviewed.

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
>> +    };
> 
> Best regards,
> Yao Zi

Thanks a lot.

					-Alex

