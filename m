Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB2429A9FA
	for <spacemit@lists.linux.dev>; Thu, 18 Sep 2025 20:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758225743; cv=none; b=fozQU1UA9hdD13iQthjX4E9EzEX53aTOaeVn658+tXnHqtXsnnuIw+0gh888KWjzuziA5tz1BB4IG5R3Df70R1gw5YYQ0tHq+qsTI0QKxquCbC+TRE/1F0BYY/bFj83T9q3B7Swzur4x9U9rWHNlrRUK/3d+F2Qc6HnMvuLu3Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758225743; c=relaxed/simple;
	bh=xTNSF63U6F8F9m5v5OzYH8+/3s+qw3mzFt4E/qP4T/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ScEVFIVeJFKfUMucTGtL/xb9nuaUo0lnxb2r7YzOXQoV+URq9ObYHWM+IBNWbbUprZlAlyMr1KZabUlbwrCTXUz48nH2IEmNwL5h4lj/nVxbzHwAf3dNaLzjotasuyatAlF6eQctih6JDZKAUmIfbN+FPrJ6sxGiN+BksGmBQog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=PY64N+U8; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="PY64N+U8"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-8876de33c86so120483439f.3
        for <spacemit@lists.linux.dev>; Thu, 18 Sep 2025 13:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758225741; x=1758830541; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6x/DmZz/Njy3XkRZzK24IecqRgfFtgXHR4AlKqnaji4=;
        b=PY64N+U872Y/fhgkfy8cEFqqfahvqExSd0m+FwcHspWa3q5qOOh/+Rng6LiH6Pu5T3
         n9nJOkv8gjJtJ71kPtYgiJ/qHNN+s0yV6w0cmh+0g1ZfFy76BT6fym+O6XzzotngYG6p
         6zjLDgQL0JqVI51Z0xVqDykpwaG4opiQQfe9RvsvtJ+26bBOt3CLPixExtUxC6PboE8Q
         nIbAAjSdcE8AV0Es5pxBZENpfXYpEEvrNPSoAmCa7qp4har6BSQxExmkzZ7PLXBBOqCj
         aKeLNEvL5kOW6Py3CmBL0IjQeCPVN6WU5gFIL6QI3Ei9SkkExEgQxxEbgl276ubXwS5q
         NLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758225741; x=1758830541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6x/DmZz/Njy3XkRZzK24IecqRgfFtgXHR4AlKqnaji4=;
        b=LgZ1BP6mpUGF/OivbND2ah+Xm1lwnS1LWCYIxq07Zf7CRGhAF15JWNipc0pvI5OEQS
         Yr+31Y+4hz+1F7ImPtZHf+QaKZVN11qM/akgyXUwKoduVnQLxXm5Khby3Jyp0d3Y1n4D
         d6xYgJDz+na93dWCzcxrRcP+Oy1Hnqw2qgebUGNQMrfoluJUpqIJqFho5256OPcFHmna
         irh6Du0uSUkxd1K8/BtOXMRz/j6oPGxdzgbgFXRU3WsFvCS+wrAPjIBhedwI5lib45IM
         YraeZHik+ndYP2ZS2z56TNK1/NxQ/QC+mITdTvMulJ9lyGN6CjT1DCdss6SLlIhtCGtV
         SamQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVwhAANNVFL67T05xVTSiV1EQAZx1oh/Ygnru3KZq/lMQZL6TabYnpcyYyFjPmBXXlOcdA2L0iVw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5/cRJkI5uIfjImIU6TguVHvrKnL7QINP0qS5nacenua3Gfc/X
	Uo2GsxBk/wduqfjGBdiyMcstaAMS24fhsEhazTsQUQONU3dKi1FP/gA5v/l8pVN2rkY=
X-Gm-Gg: ASbGncuFjevwSMqSKyKLkzlM2Wcm3JTH1VfcPGXZ97Xr7JsOPciON/ZKU/n0t/z0B3Q
	j0i49AJS+HFrIMa4LBr6SBV7WiFzuEvIroY6ySLKQWEvcst5jUjaM03hLy2f5KTmJ/pn/XW09TT
	cmGEbcx9DUUvu1955VWRK8YxWCQkkFG5JaoPmXFgV9ypTwTDquk6gnI64tCi2OiLPBSFTDKuHBd
	MVhy5F2inVan2uzoAprjTzftZtXYbGFu+V4RoxIBdBsSWBrQmZ0UK2KF1BWFE9dMihFRd0nB8dG
	xg8Z4hRnf1j13yWfRGHc0Bxep2akzp3y/cEfaFJeELLBCF1+jrIAavGPfYRCushq/woE+5xsjv6
	SreRdxbDYje/k55tl/21hf5J6VXVKTOlDS4dbo0x8WkQNOMry5xPMaIc4Vt7aAbV0bahob5JRFu
	etPISf
X-Google-Smtp-Source: AGHT+IH5Ia06wxmm99cv33bY0baM2MmODAlEl3RzPF2cL4hY1LNf+MZF/EoTF1/TFOE6KV6P7E2YRw==
X-Received: by 2002:a05:6602:1693:b0:887:2a8c:9226 with SMTP id ca18e2360f4ac-8ade617c22bmr125297339f.16.1758225740767;
        Thu, 18 Sep 2025 13:02:20 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8a46b2f3405sm111352939f.1.2025.09.18.13.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 13:02:19 -0700 (PDT)
Message-ID: <88623738-4279-45f3-bcbc-7a69f5c3d0d0@riscstar.com>
Date: Thu, 18 Sep 2025 15:02:18 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
To: Rob Herring <robh@kernel.org>
Cc: Yixun Lan <dlan@gentoo.org>, broonie@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-2-elder@riscstar.com>
 <20250917231520-GYA1269891@gentoo.org>
 <3b815302-21f2-4ee2-bf83-c1dba77ce3d1@riscstar.com>
 <20250918195716.GA2521514-robh@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250918195716.GA2521514-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/25 2:57 PM, Rob Herring wrote:
> On Wed, Sep 17, 2025 at 06:40:31PM -0500, Alex Elder wrote:
>> On 9/17/25 6:15 PM, Yixun Lan wrote:
>>> Hi Alex,
>>>
>>> On 17:07 Wed 17 Sep     , Alex Elder wrote:
>>>> Add support for the SPI controller implemented by the SpacemiT K1 SoC.
>>>>
>>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>>> ---
>>>>    .../bindings/spi/spacemit,k1-spi.yaml         | 94 +++++++++++++++++++
>>>>    1 file changed, 94 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
>>>> new file mode 100644
>>>> index 0000000000000..5abd4fe268da9
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
>>>> @@ -0,0 +1,94 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/spi/spacemit,k1-spi.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: SpacemiT K1 SoC Serial Peripheral Interface (SPI)
>>>> +
>>>> +maintainers:
>>>> +  - Alex Elder <elder@kernel.org>
>>>> +
>>>> +description:
>>>> +  The SpacemiT K1 SoC implements a SPI controller that has two 32-entry
>>>> +  FIFOs, for transmit and receive.  Details are currently available in
>>>> +  section 18.2.1 of the K1 User Manual, found in the SpacemiT Keystone
>>>> +  K1 Documentation[1].  The controller transfers words using PIO.  DMA
>>>> +  transfers are supported as well, if both TX and RX DMA channels are
>>>> +  specified,
>>>> +
>>>> +  [1] https://developer.spacemit.com/documentation
>>>> +
>>>> +allOf:
>>>> +  - $ref: /schemas/spi/spi-controller.yaml#
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - spacemit,k1-spi
>>> one enum is effectively equal to const..
>>
>> OK.  That's an easy fix.
>>
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  clocks:
>>>> +    items:
>>>> +      - description: Core clock
>>>> +      - description: Bus clock
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: core
>>>> +      - const: bus
>>>> +
>>>> +  resets:
>>>> +    maxItems: 1
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  dmas:
>>>> +    items:
>>>> +      - description: RX DMA channel
>>>> +      - description: TX DMA channel
>>>> +
>>>> +  dma-names:
>>>> +    items:
>>>> +      - const: rx
>>>> +      - const: tx
>>>> +
>>>> +  spacemit,k1-ssp-id:
>>>> +    description: SPI controller number
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> could you explain a little bit why this vendor specific property should
>>> be introduced? I took a look at the code, and didn't get the reason
>>> behind.. or what's the problem of simply using "pdev->id"?
>>
>> This property was carried over from the vendor code.  It is
>> optional, and if it isn't specified, the platform device ID (-1)
>> will be used.  It's just intended to provide a well-defined ID
>> for a particular SPI controller.
>>
>>> we should really be careful to introduce vendor specific property..
>>
>> If there were a standard way of doing this I'd love to use it.
> 
> The standard way is we don't define made up device indices in DT. Well,
> except /aliases allows you to do that.

Yes, Yixun already pointed out using the aliases node to
accomplish this.

I'm still not clear why or when something like this is needed
though.  I presume it's so we can say "SPI 3 is always the one
that's exposed on the GPIO block" or something.

					-Alex



> 
> Rob

