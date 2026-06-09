Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5503375ADF
	for <spacemit@lists.linux.dev>; Tue,  9 Jun 2026 16:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781021485; cv=none; b=jA6NWZ6B85yXTW7b3oXqlfT5yMKP1cmcKqKyCih3qn3r5y4wV+7IViagbpAViqrodt7UVsR4vdeIt/NupgWeN1WuMpvy7JZmLB1kEN65w5WAo3Yq/1GuIUMzNGi+U4XxtJn61PcncYLg0kgLDRUnbPVkuvD2L99cnCC9TYzYKrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781021485; c=relaxed/simple;
	bh=zBz50Ykka4AVz+QNBsQ5oDdeIq0rYJLLgX1yaLOkoHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GP0V2n6pDnWGyeWHh83gYylwASk7G9tBzx1O0flZrVVpE+K6hg9PhVT/74Y9Z0Abfh6cTZc/kiLu9u1YYLZrElZiOELLkm8V5+o28xtMd/FyYfW0W2W1qZhR3T2CQlJPIUHaN4uCg2gFQ43vHnU9aWvKmmWOsKTr+ynGVcDWciw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=jKlS+OaP; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="jKlS+OaP"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-486b95fcdc7so1352373b6e.2
        for <spacemit@lists.linux.dev>; Tue, 09 Jun 2026 09:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1781021483; x=1781626283; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H1jWZCzmLm9wzBxE++FfHpmTEYKEQ9CFhlrClkcQyz0=;
        b=jKlS+OaPr0mLQwCkgTOYrOnyQoN1IXE8QV35G69J3dSOqUfgVdH2p47WTBxdwHtfoy
         TZ/fyLGl84PHOtRqvQGCYxn5ohPlOqx7IMAuVvLWmEYyk/sU8Tq4ga92ZRdeR129oQ71
         pxjxB7tYWd9ehRYQp2vbAnMOPX/sJTEWq5bwJzUFyP7rUIrYdVuynuHZIK+N+GXgXR3H
         jfWuwF3SnGLr56KziDfNfgQfM21jMuAetpSIJxrkuTgHrNP5jpQ90fQcTNtL0ujvg/KW
         43mRcjoH/nv5AG6mRJY73bkVziCQyLQS4HrvFAlfLDWJRRIqW4hIOv9GsB2/qPstM99u
         yCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781021483; x=1781626283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1jWZCzmLm9wzBxE++FfHpmTEYKEQ9CFhlrClkcQyz0=;
        b=hHBUlUUk9uOiQPPf2sj5z3EZPOlKRFZtuk5YRdoDHo+LyxMT5SctHIyFNixGce1GLM
         RmYNglRQvlyXViJq9+1q3VqXitFXsj+ArjUPM3pCHX5dHL6p9IExqsdPC/CSAiNC3TTG
         aqOX9emx4die19vZQXzH50SC9Y1TFCp1t504or1aGPDoQrCs7oK/Ekgsk/Of/Y6IKd8I
         5QwNQSl4HQa8/iBt5iKvitoZikk+n8PAA+6TnEzpZUjgaJ72D44u+AKreJ/lPraHLJyO
         h5OWgfJQN0g8xdlKYYqKrY4dZbvmRM2uj4d2CqeT+5ZgqvkwvgwmZv2G7uGF/f0yTlja
         xnWg==
X-Forwarded-Encrypted: i=1; AFNElJ+pp3RQ5krAVtm1VtKMvGAozR25Uj8K9xFAARrCJxtI5p/vXwO3/bcJSogIsSOFJZ4WrG5x+0fhSA==@lists.linux.dev
X-Gm-Message-State: AOJu0YydqzWhAY1bzvIfsjexCfRYZ+PRoeNbIBNr8SBpbYHG5y8D6dV1
	UeT8jz6n9/1Cmwr++BXZ8FqI6zYXXDG+FjaLnJi8dfp1HijPtL0EvDmjv5tx1nFz7/I=
X-Gm-Gg: Acq92OGTmW23mCvcdRRTf6x+3+SeQNCwrBrxK68qwCf9mn0fruFilvMpW8aVLjxkhbR
	a8uXGvGxGQjbaoChfESulyN4fa/m46crO+VZx+Y6UYnu4DKu7tpnQiotjAHOFEK7jc6tq/HrvvZ
	LNzHEnyAJTV9UkQSUL9wcwYitGwppRxaw5Q7FwTYZHbCV8RpejIUeVKDw1CyXAsvvwFEIxZhw1k
	ynFU9sEqZTXd0pPqBngIojwAGhJ+1n4E8FyeLzzQKsMXdFCrLPqabjy+bETwYPoilaDSy5qLcC0
	kHOXkte7PYZZwjTm61wbrxI1YMKu2x/IiPJM3093GwRmGi5NOrpm+eWgPdVb90lxa9WhuKFyNpC
	JT5ETk9ZuUR5R0ZB2VDep0+/yt5NNrCKrp/HQeSOcb9GXFp/zffdJDdTEgBmCvUhq+bfoQEEvVU
	bknoVUdQcljs+AiEokXnyUS7uZLjCq/dlj+A==
X-Received: by 2002:a05:6808:251a:b0:464:3d5d:d9d4 with SMTP id 5614622812f47-4868df031d7mr13579710b6e.39.1781021482752;
        Tue, 09 Jun 2026 09:11:22 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b91f944sm16430240b6e.9.2026.06.09.09.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 09:11:22 -0700 (PDT)
Message-ID: <8010bb91-77e1-42b4-9f19-d9e70e385d00@riscstar.com>
Date: Tue, 9 Jun 2026 11:11:20 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] dt-bindings: PCI: spacemit: Introduce Spacemit K3
 PCIe host controller
To: Manivannan Sadhasivam <mani@kernel.org>,
 Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
 Nam Cao <namcao@linutronix.de>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Randolph Lin <randolph@andestech.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Vidya Sagar <vidyas@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20260517014841.254085-1-inochiama@gmail.com>
 <20260517014841.254085-5-inochiama@gmail.com>
 <kwan2ci7umcckod2623tt2ebwaz6v7ypczz3bqmhfxc6awrkfc@jrjf73wzehcc>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <kwan2ci7umcckod2623tt2ebwaz6v7ypczz3bqmhfxc6awrkfc@jrjf73wzehcc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/9/26 9:03 AM, Manivannan Sadhasivam wrote:
> On Sun, May 17, 2026 at 09:48:39AM +0800, Inochi Amaoto wrote:
>> Add binding support for the PCIe controller on the SpacemiT K3 SoC.
>> This controller is almost a standard Synopsys DesignWare PCIe IP,
>> with some extra link and reset state control.
>>
>> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> 
> Why can't you reuse the existing spacemit,k1-pcie-host.yaml binding? I see very
> few differences which could be added using conditionals. Also, this binding
> defines the PHY property in the controller node, which is a way backwards as we
> now prefer to define these in Root Port node as spacemit,k1-pcie-host.yaml does.

I agree.  I have another couple of comments below, including several
things that just point out what's the same and what's different.

					-Alex

> 
> - Mani
> 
>> ---
>>   .../bindings/pci/spacemit,k3-pcie-host.yaml   | 135 ++++++++++++++++++
>>   1 file changed, 135 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml
>> new file mode 100644
>> index 000000000000..46147a37a9ce
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml
>> @@ -0,0 +1,135 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pci/spacemit,k3-pcie-host.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: SpacemiT K3 PCI Express Host Controller
>> +
>> +maintainers:
>> +  - Inochi Amaoto <inochiama@gmail.com>

If you would like to maintain the (common) SpacemiT K1 host
controller binding I'd be OK with that.

>> +
>> +description:
>> +  The SpacemiT K3 SoC PCIe host controller is based on the Synopsys
>> +  DesignWare PCIe IP. The controller uses the external MSI interrupt
>> +  controller.
>> +
>> +allOf:
>> +  - $ref: /schemas/pci/pci-host-bridge.yaml#
>> +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: spacemit,k3-pcie
>> +
>> +  reg:
>> +    items:
>> +      - description: DesignWare PCIe registers
>> +      - description: Data Bus Interface (DBI) shadow registers

The above is new (different from K1), as is "dbi2" as its name.

>> +      - description: ATU address space
>> +      - description: PCIe configuration space
>> +      - description: Link control registers
>> +
>> +  reg-names:
>> +    items:
>> +      - const: dbi
>> +      - const: dbi2
>> +      - const: atu
>> +      - const: config
>> +      - const: link
>> +
>> +  clocks:

Clocks and resets are the same as K1.

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
>> +  msi-parent: true

msi-parent and phys are not present in the K1 binding.

>> +
>> +  phys:
>> +    description:
>> +      PHY phandle from the Combo PHY, the lane number does not depends
>> +      on this, since the number of lanes provided by Combo PHY can be
>> +      1 or 2.
>> +    minItems: 1
>> +    maxItems: 6
>> +
>> +  phy-names:
>> +    minItems: 1
>> +    maxItems: 6
>> +

The following property is the same as K1.

>> +  spacemit,apmu:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description:
>> +      A phandle that refers to the APMU system controller, whose regmap is
>> +      used in managing resets and link state, along with and offset of its
>> +      reset control register.
>> +    items:
>> +      - items:
>> +          - description: phandle to APMU system controller
>> +          - description: register offset
>> +
>> +required:
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - reset-names
>> +  - msi-parent
>> +  - spacemit,apmu
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    soc {
>> +      #address-cells = <2>;
>> +      #size-cells = <2>;
>> +
>> +      pcie@80000000 {
>> +        compatible = "spacemit,k3-pcie";
>> +        reg = <0x0  0x80000000 0x0 0x00001000>,
>> +              <0x0  0x80100000 0x0 0x00001000>,
>> +              <0x0  0x80300000 0x0 0x00003f20>,
>> +              <0x11 0x00000000 0x0 0x00010000>,
>> +              <0x0  0x82900000 0x0 0x00001000>;
>> +        reg-names = "dbi", "dbi2", "atu", "config", "link";
>> +        device_type = "pci";
>> +        #address-cells = <3>;
>> +        #size-cells = <2>;
>> +        clocks = <&syscon_apmu 89>,
>> +                 <&syscon_apmu 56>,
>> +                 <&syscon_apmu 57>;
>> +        clock-names = "dbi", "mstr", "slv";
>> +        msi-parent = <&simsic>;
>> +        ranges = <0x01000000 0x00 0x00010000 0x11 0x00010000 0x0 0x00100000>,
>> +                 <0x02000000 0x0  0x00110000 0x11 0x00110000 0x0 0x7fef0000>,
>> +                 <0x43000000 0x18 0x00000000 0x18 0x00000000 0x1 0x00000000>;
>> +        resets = <&syscon_apmu 76>,
>> +                 <&syscon_apmu 78>,
>> +                 <&syscon_apmu 77>;
>> +        reset-names = "dbi", "mstr", "slv";
>> +        linux,pci-domain = <0>;
>> +        spacemit,apmu = <&syscon_apmu 0x1f0>;
>> +      };
>> +    };
>> +
>> -- 
>> 2.54.0
>>
> 

