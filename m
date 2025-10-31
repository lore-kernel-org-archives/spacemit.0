Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895D824C068
	for <spacemit@lists.linux.dev>; Fri, 31 Oct 2025 01:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761874642; cv=none; b=aeudThVXkG8gDdYvc2ON4Mc0arR6Jk5VvlYMfYlXI6TlGepXlKYSyKdA7WLavSAf7BOUPXF6k/rfYAbtU4ltZ0jhL/HRXvQXvN3HEMt4B8BQKxRer9vPZEAz/d+6NR3VsE/bbPY5JfumOdb7kXTB4supXjRbN9ZPR6u4AThNiF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761874642; c=relaxed/simple;
	bh=nQ29tceSmQ4urDG0IsVFtbhp5svpPgNTCQfprJofihs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Son6UUULesDy94Bd/lEIGEn58vNuX1FJj7Cpl0Ow+XSCYVdJ8uzjDx/8tI7cJ1KWFU60pqGe0x2t5GXCvdWBoL6/m6rmPPL4QiNv2Z9HXSrA2FSqds300xYeavPPitZx41CsAmHIUnvCK1vR0OzbCPh+q/Wzg8DacMw2eHAKnb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=HhiPeEtC; arc=none smtp.client-ip=209.85.166.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="HhiPeEtC"
Received: by mail-il1-f196.google.com with SMTP id e9e14a558f8ab-430c151ca28so7798485ab.2
        for <spacemit@lists.linux.dev>; Thu, 30 Oct 2025 18:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761874638; x=1762479438; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MZXfwu/E+BC+JAhEUtk1GdLUOAn+XEVcnmRSn9TxWj8=;
        b=HhiPeEtCoDBeDZx5NVstMNQFSO8PdgWDTDrxv7DzNjYslhXp0CPSrARXLq/KZsMiNj
         6NatKBIaKHlLHkf0OzpUsHCWW465JnAuopURpLxosb35FXLiUHIZfuQyJxN55F1tggo5
         0fmIVKjxmBQdNDm3YSS7D5liYRV3DUCYjSbkGebn0Yiw6xeq0FMn5bAi3gg1kMPSdDOs
         bO3He0yN1MMlVa7iXXV86edIa0G+43Sw+rMNyBnuydjIdlMTRkqfYz3zaMfaKswtgt0W
         c+PaWBu2DmLNTrkMFkdsMqSPqlXBnkbdzuMI9/tIyug7J9uvH9iatHq5h9H/LYzpJ5No
         7NUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761874638; x=1762479438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MZXfwu/E+BC+JAhEUtk1GdLUOAn+XEVcnmRSn9TxWj8=;
        b=czeX5vchR0g9nG2B8aE6fxnb1B7lXbauvrogGuasRfXmnABMTLyv/HsElmLM65a+Wp
         CcxHhMSP/ssTJ5iBqCpUCudT1CbQXw721zzUQ5jQVJ0Zx4AU/T50v/2mhEBGsna/yRtd
         Z5FgKnFQ5NrEL4mXFshubZiU+wFJQ8QLvzgQ5MQ3q+xHueeSYlNhpAQDGN4TQzuQW9cR
         6FTsYjZf7ERhqSI88HMh0SZo4O+umTmJdcLKA8KQljiSyMeWJlGJCD/WE+IM+2kvNxnh
         XzdEaitKD+fcDbmcn43V+YkkpjtIK/LvjsDIhOqPFbInQc5G5hKRbV/ihM/7rp7nDC6E
         5V8g==
X-Forwarded-Encrypted: i=1; AJvYcCVUtLMeSGbQLaHUvSZowb8WiO9aqfcScBFrUcJOd1oVno0DeiWMj+XLZFe2kUkg2P37SQjsUriQVA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywn8+fZhyHUMIf5DErxRZcBlhrWgPi5JhS6tbUjVsOe/yj2W+NA
	bCtgWfzYjWZE27iiuiawd7CXl4R7OM8BKVYVQh1JBCG1JqRjTgl9vgWWrzlgJeLv/2c=
X-Gm-Gg: ASbGnctjSYyElhqdm0ULJQLo4RQp7fbteD3s/CItgP/KvFj80BbVz2u8W5gV+btpnAb
	I0qDD+cs+H63lABNCxWIE5SYmkCBQt2x/kx0/2XuhkJ2zbcnro9I1EtLtffz1aQ4TW0SvPeJ+h6
	Cb3TbQ3rXUyG/q6X230Z+FmpU/zsUFGWYRo5xZFOexXrM/qSrksxEkXbV6REAREPvxSWOmblR1t
	+5gytt0EdpdhhZfYt8ltyNz9F3T4z1+RZ6y5g9M5AFcD1efobGEwn33ugJFJW+46wiOBm2/Mhvd
	UeRXupx1+QjW5aro7OrpuSENdtzMEHmrC+A8iVds00h9asefSK1yk1xRAVPP+3Xi/3jfr2+f0oW
	mv47Q2wmu8Lg3Jg2iXn6tyjHz2EnfAbe2NklEiWK+O48EfwsiJgG/L7G6LRb7Tm+B7t3jxXOqKI
	1SNA+Q6O7AsDUPJ7agdv0tp98AAj6ZMjJh/9JyHzcF
X-Google-Smtp-Source: AGHT+IF8jKPMcN4haMJfj2iiZ24svqDtow1spkbfII1MB862Q9VVregRX2uRZw72R6OIomLop1+AMQ==
X-Received: by 2002:a05:6e02:b27:b0:430:af13:accc with SMTP id e9e14a558f8ab-4330d1280afmr28635775ab.7.1761874638596;
        Thu, 30 Oct 2025 18:37:18 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-43310245c34sm1321815ab.2.2025.10.30.18.37.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 18:37:18 -0700 (PDT)
Message-ID: <9e60f7ed-7afc-4151-a301-4a0832b9105f@riscstar.com>
Date: Thu, 30 Oct 2025 20:37:16 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] dt-bindings: pci: spacemit: introduce PCIe host
 controller
To: Rob Herring <robh@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 dlan@gentoo.org, guodong@riscstar.com, devicetree@vger.kernel.org,
 linux-pci@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251030220259.1063792-1-elder@riscstar.com>
 <20251030220259.1063792-4-elder@riscstar.com>
 <20251031005718.GA539812-robh@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251031005718.GA539812-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/25 7:58 PM, Rob Herring wrote:
> On Thu, Oct 30, 2025 at 05:02:54PM -0500, Alex Elder wrote:
>> Add the Device Tree binding for the PCIe root complex found on the
>> SpacemiT K1 SoC.  This device is derived from the Synopsys Designware
>> PCIe IP.  It supports up to three PCIe ports operating at PCIe gen 2
>> link speeds (5 GT/sec).  One of the ports uses a combo PHY, which is
>> typically used to support a USB 3 port.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   .../bindings/pci/spacemit,k1-pcie-host.yaml   | 157 ++++++++++++++++++
>>   1 file changed, 157 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
>> new file mode 100644
>> index 0000000000000..58239a155ecc0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
>> @@ -0,0 +1,157 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pci/spacemit,k1-pcie-host.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: SpacemiT K1 PCI Express Host Controller
>> +
>> +maintainers:
>> +  - Alex Elder <elder@riscstar.com>
>> +
>> +description: >
>> +  The SpacemiT K1 SoC PCIe host controller is based on the Synopsys
>> +  DesignWare PCIe IP.  The controller uses the DesignWare built-in
>> +  MSI interrupt controller, and supports 256 MSIs.
> 
> Wrap lines at 80.

OK.

>> +
>> +allOf:
>> +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: spacemit,k1-pcie
>> +
>> +  reg:
>> +    items:
>> +      - description: DesignWare PCIe registers
>> +      - description: ATU address space
>> +      - description: PCIe configuration space
>> +      - description: Link control registers
>> +
>> +  reg-names:
>> +    items:
>> +      - const: dbi
>> +      - const: atu
>> +      - const: config
>> +      - const: link
>> +
>> +  clocks:
>> +    items:
>> +      - description: DWC PCIe Data Bus Interface (DBI) clock
>> +      - description: DWC PCIe application AXI-bus master interface clock
>> +      - description: DWC PCIe application AXI-bus slave interface clock
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
>> +      - description: DWC PCIe application AXI-bus master interface reset
>> +      - description: DWC PCIe application AXI-bus slave interface reset
>> +
>> +  reset-names:
>> +    items:
>> +      - const: dbi
>> +      - const: mstr
>> +      - const: slv
>> +
>> +  interrupts:
>> +    items:
>> +      - description: Interrupt used for MSIs
>> +
>> +  interrupt-names:
>> +    const: msi
>> +
>> +  spacemit,apmu:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description:
>> +      A phandle that refers to the APMU system controller, whose
>> +      regmap is used in managing resets and link state, along with
>> +      and offset of its reset control register.
>> +    items:
>> +      - items:
>> +          - description: phandle to APMU system controller
>> +          - description: register offset
>> +
>> +patternProperties:
>> +  '^pcie?@':
> 
> It's always PCIe, so drop the '?'.

I'll fix that.

> With that,
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Thanks for the review.

					-Alex
