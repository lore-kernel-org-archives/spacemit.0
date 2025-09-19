Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE9E2874FF
	for <spacemit@lists.linux.dev>; Fri, 19 Sep 2025 20:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758312851; cv=none; b=UXcIdg3ctanH7OXENra48gErDD5EFJh90Vrwq/IWQXX0VCpFwo7wPwWoOlW/KZGcMnD+23TX4l8vzt1vj43uSInhQG5o/3E3Zg/VrP9T22fuw5L49O2iZrDap1HrOpa1oCWDyT+9XuKzHfYBokxLuS8mFEMVcSBRHDySnMAEFig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758312851; c=relaxed/simple;
	bh=VRK+pmEe7PbC45zTMGIrHgpzmAUjzNw9/dwoa9Zpgsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jcBYZdvuqLlr0Zw3qF2HpzhSlUw1fBCUfWZyaTNJs0diXn2CV3NrBJroUOEWb4P3twht8in9Pbz8obEnBAi0I8Xo8eQZFLz7ddl4fEWjWnZWKcG9m2ahvLzAe3rBvwFyhoVmoAO02yZp3xoO9vJsg2OszxKh9WbluARGaW6uXms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=n2S4tNyx; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="n2S4tNyx"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-42401f30515so14128515ab.0
        for <spacemit@lists.linux.dev>; Fri, 19 Sep 2025 13:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758312848; x=1758917648; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=laoMcSCfK07azaBjCslDo0m3+R/kL+S83GK1yKfDxF8=;
        b=n2S4tNyxEmh29USX0PC7pQCfeosCaQPZG9I6MSfU56hjQ0+F1eOBUZAQS5i6lu9qVn
         AwdyyD0eJ1cZBVIxB6m3oA5ewIMaaYsUzkPoy4n4gPJMCYaZBC+Ge5EU6Tdrbgv97JSz
         TkJsfBZmlYNfHd4YTptJzZoSq/aEXdFJR5v6SuqSBLmw30Oe/JmMPGlOgaz0Usev+1Cw
         3zOLyC+utA242uf4bOb8OLSneD47esBzPFZrTGE2zSbSKzjA2deV6U967gpvX2kS7zOq
         KallgYjnNF2CEQeZfhAkWlQCLSgDxwrLVqy4t2VSiJV3rM7v2X4J74/EK0anJm06H/YB
         DOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758312848; x=1758917648;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=laoMcSCfK07azaBjCslDo0m3+R/kL+S83GK1yKfDxF8=;
        b=ZFQgEp+/c11fa0z1bgxSlPrj7TOS1GS2VQNDg+jUIbpnNy2lrVzoUf7BERLrT0zJ3l
         bApq5BtKJX37DoYOu8KB3vliip4P9fAEpvAMjL2R/it+RGwcXn0+Y4jhKSh9a8J6klFb
         itMyCFUoLtQlhG09V7T5TAJT3fqaIvJdaVRcWpgW1fELv0HaJ9YS9aO9r9E+zqR4GUOV
         l91n1C/EBx4ifSx3XvbM8TiUKEnbYHuc2BOKFgEG7uwOywopVaZfwBk41a3h5JDfiYhU
         7woKgXteQodLbzBMAnkjYiBATax33xCO112T9Zz45rduI6NseoAidFi3JriK2XM0rvKX
         8CkA==
X-Forwarded-Encrypted: i=1; AJvYcCXJVBh80USnSBWaC+fgmdmI1vDLR6L7wwMyHmkahOluvoJahbG7X17Pbj6qjYUpyBLNtYKskeKaYw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwSWSEHjVVswbXr4D+kws1AmGZuxT12mHbzWS8Q1es55sLkFx6v
	l/gm4YLOuGHjYhIrMLq9CgsVd9TdRNjTVkqqNl+TvScdAQG4DPwo1aTiQBdHZ/Z2dzQ=
X-Gm-Gg: ASbGnctQX7r6gHsKKR09q+EfNuLLhjyJEsotpDaX5RRolUseYNUaX1i16lN/mDegrL8
	crEyK1J6kRcHHE+abbe5JC9AqOu6AmpKSSFFWRRl09LTpOqoisqiJTMYpCfb6h/tGEN75f9wGN6
	l6SKg2H3DRSLps182QENBhIThGsTWdCFrZIkefduYIVfEeEJ1LWKVLL4q9tbSuvdzOAdl0zsV+E
	AjHcGheHnincJgGBzB810Ypc322ZU8GGQDC9h/DWDyFyEN179P4nklD5M5vaX60Oq8ykeMFJ+9V
	GA4LBnegceyUUiphqGOCSrH94NvCv1QvA5IMOLTWZ80P9VlHHAS8n7aeH45Pkq8ltf0QzuAgdqD
	8u22RYFf5vfBuQsClh6gfxabU5i5biP+sV6yl50WJYe1Nvo7h5cKz/jro5hlgkA==
X-Google-Smtp-Source: AGHT+IF/1Bf6FjG2s85ZEcZvlS57Mzf5kDdUZySVUGALWKCNyJGWzPVLZfqNWOxGh/9d2jvI0LV4rw==
X-Received: by 2002:a05:6e02:2163:b0:424:2c9:26b5 with SMTP id e9e14a558f8ab-42441af5e02mr127967325ab.9.1758312847889;
        Fri, 19 Sep 2025 13:14:07 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d5399014dsm2475887173.59.2025.09.19.13.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 13:14:07 -0700 (PDT)
Message-ID: <804ea57f-699f-41cc-a27c-844f107e627f@riscstar.com>
Date: Fri, 19 Sep 2025 15:14:05 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: phy: spacemit: introduce PCIe root
 complex
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
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
 <20250813184701.2444372-4-elder@riscstar.com>
 <tmdq6iut5z2bzemduovvyarya6ho2lwlxvvqqhazw6dnnyjpq3@72xrd2pij42h>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <tmdq6iut5z2bzemduovvyarya6ho2lwlxvvqqhazw6dnnyjpq3@72xrd2pij42h>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/25 3:14 AM, Manivannan Sadhasivam wrote:
> On Wed, Aug 13, 2025 at 01:46:57PM GMT, Alex Elder wrote:
> 
> Subject should have 'pci' prefix, not 'phy'.

OK I'll update that in the next version.

>> Add the Device Tree binding for the PCIe root complex found on the
>> SpacemiT K1 SoC.  This device is derived from the Synopsys Designware
>> PCIe IP.  It supports up to three PCIe ports operating at PCIe gen 2
>> link speeds (5 GT/sec).  One of the ports uses a combo PHY, which is
>> typically used to support a USB 3 port.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   .../bindings/pci/spacemit,k1-pcie-rc.yaml     | 141 ++++++++++++++++++
>>   1 file changed, 141 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-rc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-rc.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-rc.yaml
>> new file mode 100644
>> index 0000000000000..6bcca2f91a6fd
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-rc.yaml
>> @@ -0,0 +1,141 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pci/spacemit,k1-pcie-rc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: SpacemiT K1 PCI Express Root Complex
>> +
>> +maintainers:
>> +  - Alex Elder <elder@riscstar.com>
>> +
>> +description:
>> +  The SpacemiT K1 SoC PCIe root complex controller is based on the
>> +  Synopsys DesignWare PCIe IP.
>> +
>> +properties:
>> +  compatible:
>> +    const: spacemit,k1-pcie-rc.yaml
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
>> +      - description: DWC PCIe application AXI-bus Master interface clock
>> +      - description: DWC PCIe application AXI-bus Slave interface clock.
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
>> +      - description: Global reset; must be deasserted for PHY to function
>> +
>> +  reset-names:
>> +    items:
>> +      - const: dbi
>> +      - const: mstr
>> +      - const: slv
>> +      - const: global
>> +
>> +  interrupts-extended:
>> +    maxItems: 1
> 
> What is the purpose of this property? Is it for MSI or INTx?

It is for MSIs, which are translated into this interrupt.
I'll add a short description indicating this.

Is there a better way to represent this?

>> +
>> +  spacemit,syscon-pmu:
>> +    description:
>> +      PHandle that refers to the APMU system controller, whose
>> +      regmap is used in managing resets and link state.
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +
>> +  device_type:
>> +    const: pci
>> +
>> +  max-link-speed:
>> +    const: 2
> 
> Why do you need to limit it to 5 GT/s always?

It's what the hardware overview says is the speed
of the ports.
     PCIE PortA Gen2x1
     PCIE PortB Gen2x2
     PCIE PortC Gen2x2

But I think what you're asking might be "why do you
need to specify in DT that the link speed is limited".
And in that case, I realize now that it is not needed.
I will specify dw_pcie->max_link_speed to 2 before
calling dw_pcie_host_init().

If that's not what you meant, please let me know.

>> +  num-viewport:
>> +    const: 8
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - reset-names
>> +  - spacemit,syscon-pmu
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - device_type
>> +  - max-link-speed
> 
> Same comment as above.
> 
>> +  - bus-range
>> +  - num-viewport
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/spacemit,k1-syscon.h>
>> +    pcie0: pcie@ca000000 {
>> +        compatible = "spacemit,k1-pcie-rc";
>> +        reg = <0x0 0xca000000 0x0 0x00001000>,
>> +              <0x0 0xca300000 0x0 0x0001ff24>,
>> +              <0x0 0x8f000000 0x0 0x00002000>,
>> +              <0x0 0xc0b20000 0x0 0x00001000>;
>> +        reg-names = "dbi",
>> +                    "atu",
>> +                    "config",
>> +                    "link";
>> +
>> +        ranges = <0x01000000 0x8f002000 0x0 0x8f002000 0x0 0x100000>,
> 
> I/O port CPU address starts from 0.

First, I'm not sure what this comment means.

But second, this ranges value (which I'm sure I just copied from
the working DTS file) somehow got munged.

I know there were other errors in this YAML file that I have
to fix, and I'll fix this too.

Thank you Mani.

					-Alex

> 
> - Mani
> 

