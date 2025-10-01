Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B953E27602A
	for <spacemit@lists.linux.dev>; Wed,  1 Oct 2025 02:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759286420; cv=none; b=aJdhgCFxJS/fCK0edUzVnePVch2ZyCdY47oDqPHu9U1YUSk66N6U8TqvUPMP4nViPz/GGVw4Uyhb1PkAnaBUtw8tb9btZDA8fMfzUUbZp9+KLEE0PkHSrCbcaNuXCL3i6nGyMtUHMifpA9DWWSXnbznwr8lK4yuTztdf6lLKoNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759286420; c=relaxed/simple;
	bh=jDbkyBlcNbK/IRWIsqyyXB+3OTJLzUTI8ugMTZvEqWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cwDlSTYFQyZX2tMa6viK38YQZ59WPyqdzfHdz3qxXHA4YBEVJpahJVeanHEs7Sk7Q4ObxXhV8M5QXY6sApYJB/v5rOXzQQWOYtvgWw/97X16GsUJEbd9sYDQJj++T1OJaj0ZJohMKw947BAbFvuKGc9Sa4FE9IO5lH51SLndk20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=pnQAjKsw; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="pnQAjKsw"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-91c93719deaso348485539f.3
        for <spacemit@lists.linux.dev>; Tue, 30 Sep 2025 19:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1759286416; x=1759891216; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zxQ2zgdrHb7uD7qDfrNlnD3XXSfWmfO7hzlzDTfXqcQ=;
        b=pnQAjKswvPrEUy+R4a5bZGbD6RaaVLnlFqsr5RdRW8xxTAtHN5iRPWy77rDD0vyI0m
         cK+Dqk9PUP2zuEf6Rg4weRHgqJP2c213/yPW/as+CVLay+vzaiGkUHuwxL51FrtVYKz/
         CjbaLKGNuxGnblblOeyAukyJcD8m2unBwinxwXcPjqslSI+w7SZgMafZ5IkDYLWsg0Hj
         UxZOYxwaNapsIpfPcfu3XX++sxKxZQ5hqw+pud45Z/e/pIdKGJc7lPSVnknO0PAZqhDa
         wGDivkwZei3OBV0bAQdXyc2STJSOsDMSxP2At0vCNNtd291yOiMq0O2h5vrBse/j8orL
         6LvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759286416; x=1759891216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zxQ2zgdrHb7uD7qDfrNlnD3XXSfWmfO7hzlzDTfXqcQ=;
        b=jqzk5jckmWcozSmuInPLml7ziShsBWZNxpnxYbU94RBMq1T1Lm22kYfguTejc7hoyj
         O0PJkVLZqEm7I0eEIDXYfvqinXfpF3O7TxuvvITMrnoJ1XBBQSjnKaEpjdrvy8SKul/y
         LVWV2qUNWutjqrejem+o/zw5D9WIqicUD0ssy++MNiIFfResElrJAsoRbh0SeHsESYzv
         aUaui923vmGL3ReM/udNCD7nA8hLFE73IL8M3aVlH8S9fooA0UojpSwcfglQsm4OUrDc
         5B5k7n1zx/TOFub2gjjSa2aDMfUZ7TYfdaqS7Fxy+KO4+hhvIoFeSWOZJkvFtGroSwo0
         8tRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEnF6189WV0DuEX71csjP+wsEmHRBYomMYnJnqo03MQauWxmx04j5ErKSYGA5BnuuefYJ1DnZLUw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwnTjThv0mhvvAHgQeukfSyrfR4s7Gd8ywypYCi30ZMXWtuVQHp
	PWZFBKbkl2gaB82t300Fd+kLZxlXq5Oeg4wVSZLMs6wwD7BNu9kW/CIu7U56tANIArw=
X-Gm-Gg: ASbGncvAVCVBHbcWGxVvGiUdoETzZLtH0JAd5dENI7cy34jsELSMQdZn6qKykGlWW5X
	U6PCTlaNX3tjSBmQ9ObJ9VZqer0IcMZzN/+HDfyjeFmRhFkOAUeyBXF9kcYL2/vBLcvyrnE1Cz2
	/ohOaw1EYmlLg2UDd+X9RP5+9eniPlqMCCFTUx+2kM92Og1b7zDeQLDm+LxeSIax83b/uJOTovo
	uAOwywnAR/NjJ6EAMbYBP06UqymPOCGGhRUgGuupMjUzFoXZoDSqnpuQvgW6ddR4WqmvaWcH6GK
	pXejvimveudmNt7Lv/YQ8KRVS1WSIeisoxRghVgzBmPxj+5jUG1srA52bNvuLxow+kJclIOlwbT
	w75yzPB9hWXZiNIhqipvzdL6azZ2Q1hvQMhwMuadePIZ2dzfA/pwGFCF4sBV3uYJFroNMSNKcAk
	c5x4VUjgfwDPnhexG6BS8P
X-Google-Smtp-Source: AGHT+IFQFvztbn8UfbzR8C12GJuYMM6yN5QwMW7n9lxY6XdpjQ/LdhbflFmYGAY5ytHhPYAVoI2Qfg==
X-Received: by 2002:a05:6602:2c08:b0:935:90f6:892e with SMTP id ca18e2360f4ac-937aebad412mr291037439f.17.1759286415752;
        Tue, 30 Sep 2025 19:40:15 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-92d06cc3b9esm184392139f.12.2025.09.30.19.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 19:40:15 -0700 (PDT)
Message-ID: <365ade7c-bb2c-42ff-a2e7-9a291b1faab7@riscstar.com>
Date: Tue, 30 Sep 2025 21:40:12 -0500
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
 <804ea57f-699f-41cc-a27c-844f107e627f@riscstar.com>
 <kam6fgc7ykxwnksu562etrib2z4w3sucvr27ojxq62iwyrdai3@i76ygp2anscy>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <kam6fgc7ykxwnksu562etrib2z4w3sucvr27ojxq62iwyrdai3@i76ygp2anscy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/20/25 12:55 AM, Manivannan Sadhasivam wrote:
> On Fri, Sep 19, 2025 at 03:14:05PM -0500, Alex Elder wrote:
>> On 9/15/25 3:14 AM, Manivannan Sadhasivam wrote:
>>> On Wed, Aug 13, 2025 at 01:46:57PM GMT, Alex Elder wrote:
>>>
>>> Subject should have 'pci' prefix, not 'phy'.
>>
>> OK I'll update that in the next version.

I have a new version of this code ready, but I'll delay sending
it until the end of the merge window.

>>>> Add the Device Tree binding for the PCIe root complex found on the
>>>> SpacemiT K1 SoC.  This device is derived from the Synopsys Designware
>>>> PCIe IP.  It supports up to three PCIe ports operating at PCIe gen 2
>>>> link speeds (5 GT/sec).  One of the ports uses a combo PHY, which is
>>>> typically used to support a USB 3 port.
>>>>
>>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>>> ---
>>>>    .../bindings/pci/spacemit,k1-pcie-rc.yaml     | 141 ++++++++++++++++++
>>>>    1 file changed, 141 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-rc.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-rc.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-rc.yaml
>>>> new file mode 100644
>>>> index 0000000000000..6bcca2f91a6fd
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-rc.yaml
>>>> @@ -0,0 +1,141 @@

. . .

>>>> +  interrupts-extended:
>>>> +    maxItems: 1
>>>
>>> What is the purpose of this property? Is it for MSI or INTx?
>>
>> It is for MSIs, which are translated into this interrupt.
>> I'll add a short description indicating this.
>>
>> Is there a better way to represent this?
>>
> 
> For external MSI controllers, it is recommended to use 'msi-map' property as the
> client often need to pass RID, RID length and other sideband data to the MSI
> controller.

This implementation is using the DWC built-in MSI controller, not an
external controller.  It implements 256 MSIs, and they're handled by
dw_handle_msi_irq().  The interrupt will be given name "msi" in the
next version and I hope that at least helps clarify things.

> 
>>>> +
>>>> +  spacemit,syscon-pmu:
>>>> +    description:
>>>> +      PHandle that refers to the APMU system controller, whose
>>>> +      regmap is used in managing resets and link state.
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>> +
>>>> +  device_type:
>>>> +    const: pci
>>>> +
>>>> +  max-link-speed:
>>>> +    const: 2
>>>
>>> Why do you need to limit it to 5 GT/s always?
>>
>> It's what the hardware overview says is the speed
>> of the ports.
>>      PCIE PortA Gen2x1
>>      PCIE PortB Gen2x2
>>      PCIE PortC Gen2x2
>>
>> But I think what you're asking might be "why do you
>> need to specify in DT that the link speed is limited".
>> And in that case, I realize now that it is not needed.
>> I will specify dw_pcie->max_link_speed to 2 before
>> calling dw_pcie_host_init().
>>
> 
> You only need to specify this property if you want to limit the link speed to a
> certain data rate by the controller driver than what is supported by the
> hardware.

Yes, this makes sense.

> Looks like your hardware supports 5 GT/s by default for all ports. So you can
> omit this property and also no need to set 'dw_pcie->max_link_speed'. In the
> absence of this property, 'dw_pcie->max_link_speed' will be populated with the
> hardware default value, which will be 2 in your case.

You are correct, and I verified this.  I won't specify the link
speed "manually," and the hardware default (which is 2) will be
used.

>> If that's not what you meant, please let me know.
>>
>>>> +  num-viewport:
>>>> +    const: 8
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - clocks
>>>> +  - clock-names
>>>> +  - resets
>>>> +  - reset-names
>>>> +  - spacemit,syscon-pmu
>>>> +  - "#address-cells"
>>>> +  - "#size-cells"
>>>> +  - device_type
>>>> +  - max-link-speed
>>>
>>> Same comment as above.
>>>
>>>> +  - bus-range
>>>> +  - num-viewport
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/clock/spacemit,k1-syscon.h>
>>>> +    pcie0: pcie@ca000000 {
>>>> +        compatible = "spacemit,k1-pcie-rc";
>>>> +        reg = <0x0 0xca000000 0x0 0x00001000>,
>>>> +              <0x0 0xca300000 0x0 0x0001ff24>,
>>>> +              <0x0 0x8f000000 0x0 0x00002000>,
>>>> +              <0x0 0xc0b20000 0x0 0x00001000>;
>>>> +        reg-names = "dbi",
>>>> +                    "atu",
>>>> +                    "config",
>>>> +                    "link";
>>>> +
>>>> +        ranges = <0x01000000 0x8f002000 0x0 0x8f002000 0x0 0x100000>,
>>>
>>> I/O port CPU address starts from 0.
>>
>> First, I'm not sure what this comment means.
>>
> 
> Sorry, I meant to say 'PCI address' not 'CPU address'. The second element in
> your 'ranges' example corresponds to the PCI start address of the I/O port and
> it should always start from 0. Also, the encoding for both tuples are wrong. It
> should be:
> 
> 	ranges = <0x01000000 0x0 0x00000000 0x8f002000 0x0 0x100000>,
> 		 <0x02000000 0x0 0x80000000 0x80000000 0x0 0x0f000000>;

Simply switching to what you show works just fine.  PCI
addresses show up being zero-based, as they should be.
What I don't fully understand is why it worked before.
Maybe because this is simply defining bounds in the
mapping?

In any case, I am using ranges properties like what you show.

Thanks Mani.

					-Alex

> - Mani
