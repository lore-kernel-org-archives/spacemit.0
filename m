Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8267C78F4F
	for <spacemit@lists.linux.dev>; Thu, 30 Oct 2025 00:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761783012; cv=none; b=u4ERSvC0mK3Aiq7AOk+DMFse2NLjcDl4GQu2qJe/Hnunz/F1oUvpjqyaWSg97XtjFg/XS7hWivwP7gmO70OhJJze7THfH4QgZJpAfWyRL2fYN+f5vjcFKCTUIe/4AFrQt1rkCCIIiWo1MU3UA5uLkus5p2UPQnVOCMtuLdp5GXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761783012; c=relaxed/simple;
	bh=Af6a4lUTdazPKyx9U/7AMEnzKrT4Vry00gENco6p7w4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k+tpf+qtJ0+rQM6wzDzrTPO40xsXQSVWdQ8Lgp2Q3x7GaYCgS+IWJIG1joJvFpTQMMUognKSi41uc4M4jvsCugHdJtmSgPZhNnx9auT4+dVilvLsLSvzVOis+yRAEMN5oFAlI4CGixSfDNYK8Nrw6X5c3NXBvqbnx/uZ0IGVtAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=NdShKkjG; arc=none smtp.client-ip=209.85.166.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="NdShKkjG"
Received: by mail-il1-f193.google.com with SMTP id e9e14a558f8ab-430b6a0eaeaso4094765ab.1
        for <spacemit@lists.linux.dev>; Wed, 29 Oct 2025 17:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761783009; x=1762387809; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OxyxNUOgrblEElGmyEA4sep5LlBoVO7BBRw8igevJ6s=;
        b=NdShKkjGIxkq6M4LBeF6Q0nmpG1ZBe2MtSi6dJirr3j0+zZmpeQq0vk3jAEky8pEPm
         SqPn+XCNGptnjmOx+ZeXzwCObqlkua4FrINsABKOud986WVJ3wEcK+r/rMFqa2hoTuul
         WUofCZ3jaQ1magjC/1ZRrP6TPCu4Fsefms9aV4XsTijc3ODp5yd+nKMoNHeWKIR+ByBo
         mibkKobLeCt81rkXxA6Z0MFHo9Plqq+hFJihJK5rgk7uifDRCZpypb/gHnlkxaqW7/9F
         048btnakrvhZ6qe7k6Pv97/JP9WaaHcgx2AUA+R7kbLtQAZ4pJMYPinVVwn8lE9ZeL4m
         m0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761783009; x=1762387809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OxyxNUOgrblEElGmyEA4sep5LlBoVO7BBRw8igevJ6s=;
        b=p7+A37Tzx39YXPPN+5u2uuw1QNINlAzPmv4xUcag12CvHKBytacWUZPzsfZsQVVS5h
         +DnAyjbg3ZbImINXl2GRo+NtS9ysQRUZ9oPq6I4GuB/DfMphBZS/H9h6TqODy0GyYr0R
         4igYbTEadVhCGV+oLIf3TejR8EDpKgIFOCFuK+l3A08iIT7KUaDuwYfPCr53XhIwqSwD
         bBQhXWUx+o43jV7z9h72lHvGUlpU6NHhd7LUqfuNGi7sI2+zJScuIRcjyO9p2SlFwHls
         tUg2HdDyz/dcYxJRutkhvPS/vbImzyAKz9iAJvoQV7DokbDFH47ZFfiXuBvv5xnDqU9V
         HWSA==
X-Forwarded-Encrypted: i=1; AJvYcCU+2H0PFIfCbyrHXU6xwpLtYz+BYsIooaX6GcAd8bNkD+EKYNrjCf1cHvxIO0qcCwX71/48AvU0LQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzY0oRGiZpg9aVNr+mPGSKdzOaNcauBMXDkmmJFAhnqWT+9y0Q/
	sc4aRqNjfC6PsuH87Qh/ov6wZdBFogb/o5L6QlIIknzEVeblFdHX0ChH1pzXkDngXOw=
X-Gm-Gg: ASbGncsehP1zK4BpyK77YPoMvGqhh0XgJi+MXPgkzl0X8C5PYhxR4Gj+1RgVL4ll8mZ
	Cn0N3pqghlRHzMZFdrQMqMtVWCySYiUrmV3DJs3Z1oogLZbssrjgxpMUOcr7puC3oJcUT2zzxJv
	1wE2ZbDfCkc6jfLbb08+pWNHMytFif5GQ36krUP4sLlgT68ikbt+lIxRVx5X9ftv2/YdSP9KKUl
	gLzD6WQlviJj2oOaAamYCsKarJInYD26WzxayD/ZTfKBPMy7gNQCM3NUq58RonJy26g4oQ+0nTI
	GZdqWzAhvW5NbpbtTOLm7/73te1800KmL0qQ1tPHNqSn7K5Ty3pw0iN8HaqKOww+2Fu6WnpW+TK
	3mB7TxIowAyYLYcv3w0TJxxC1q5joA6EuzTzkQmI+vXmEXs6x7GxMMcBXat9PKBcPaHt649Wn/o
	gCXwdlC9m1BnZqFHeR1BfGc0RSiN2Np588348H+ulK
X-Google-Smtp-Source: AGHT+IGo5/UX7J0ClNKidKN2YOwDqgsyx0nxeraSSzCU9ZW8jr+AVU5FOLaQI0Rlsn9hweZUzGxIew==
X-Received: by 2002:a05:6e02:2162:b0:431:d83a:9ba with SMTP id e9e14a558f8ab-432f9045398mr62043485ab.26.1761783009512;
        Wed, 29 Oct 2025 17:10:09 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5aea946de57sm5939330173.34.2025.10.29.17.10.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 17:10:09 -0700 (PDT)
Message-ID: <6a8e8e43-c86f-4c46-851b-858e5deec8ac@riscstar.com>
Date: Wed, 29 Oct 2025 19:10:06 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] dt-bindings: pci: spacemit: introduce PCIe host
 controller
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 vkoul@kernel.org, kishon@kernel.org, dlan@gentoo.org, guodong@riscstar.com,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 p.zabel@pengutronix.de, christian.bruel@foss.st.com, shradha.t@samsung.com,
 krishna.chundru@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
 namcao@linutronix.de, thippeswamy.havalige@amd.com, inochiama@gmail.com,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251013153526.2276556-1-elder@riscstar.com>
 <20251013153526.2276556-4-elder@riscstar.com>
 <u53qfrubgrcamiz35ox6lcdpp5bbzfwcsic466z5r6yyx6xz3n@c64nw2pegtfe>
 <ae92d3f4-5131-46be-b9b1-e8ec437c9ae9@riscstar.com>
 <tjnc4wwpdwlziboonlmki6nm7t523k5atemygwyg7ck5knsde4@anjrtcf5gcq7>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <tjnc4wwpdwlziboonlmki6nm7t523k5atemygwyg7ck5knsde4@anjrtcf5gcq7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/25 12:58 AM, Manivannan Sadhasivam wrote:
> On Mon, Oct 27, 2025 at 05:24:33PM -0500, Alex Elder wrote:
>> On 10/26/25 11:38 AM, Manivannan Sadhasivam wrote:
>>> On Mon, Oct 13, 2025 at 10:35:20AM -0500, Alex Elder wrote:
>>>> Add the Device Tree binding for the PCIe root complex found on the
>>>> SpacemiT K1 SoC.  This device is derived from the Synopsys Designware
>>>> PCIe IP.  It supports up to three PCIe ports operating at PCIe gen 2
>>>> link speeds (5 GT/sec).  One of the ports uses a combo PHY, which is
>>>> typically used to support a USB 3 port.
>>>>
>>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>>> ---
>>>> v2: - Renamed the binding, using "host controller"
>>>>       - Added '>' to the description, and reworded it a bit
>>>>       - Added reference to /schemas/pci/snps,dw-pcie.yaml
>>>>       - Fixed and renamed the compatible string
>>>>       - Renamed the PMU property, and fixed its description
>>>>       - Consistently omit the period at the end of descriptions
>>>>       - Renamed the "global" clock to be "phy"
>>>>       - Use interrupts rather than interrupts-extended, and name the
>>>>         one interrupt "msi" to make clear its purpose
>>>>       - Added a vpcie3v3-supply property
>>>>       - Dropped the max-link-speed property
>>>>       - Changed additionalProperties to unevaluatedProperties
>>>>       - Dropped the label and status property from the example
>>>>
>>>>    .../bindings/pci/spacemit,k1-pcie-host.yaml   | 156 ++++++++++++++++++
>>>>    1 file changed, 156 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
>>>> new file mode 100644
>>>> index 0000000000000..87745d49c53a1
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
>>>> @@ -0,0 +1,156 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/pci/spacemit,k1-pcie-host.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: SpacemiT K1 PCI Express Host Controller

. . .

>>>> +  interrupt-names:
>>>> +    const: msi
>>>> +
>>>> +  phys:
>>>> +    maxItems: 1
>>>> +
>>>> +  vpcie3v3-supply:
>>>> +    description:
>>>> +      A phandle for 3.3v regulator to use for PCIe
>>>
>>> Could you please move these Root Port specific properties (phy, vpcie3v3-supply)
>>> to the Root Port node?
>>>
>>> Reference: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml
>>
>> OK, I'll try to follow what that ST binding does (and the
>> matching driver).
>>
>>> For handling the 'vpcie3v3-supply', you can rely on PCI_PWRCTRL_SLOT driver.
>> I looked at the code under pci/pwrctrl.  But is there some other
>> documentation I should be looking at for this?
>>
> 
> Sorry, nothing available atm. But I will create one, once we fix some core
> issues with pwrctrl so that it becomes useable for all (more in the driver
> patch).

Sounds good, I think it's necessary.  I might not get it completely
right on the next try but I trust you'll help me understand what I
need to do.

>> It looks like it involves creating a new node compatible with
>> "pciclass,0604".  And that the purpose of that driver was to
>> ensure certain resources are enabled before the "real" PCI
>> device gets probed.
>>
>> I see two arm64 DTS files using it:  x1e80100.dtsi and r8a779g0.dtsi.
>> Both define this node inside the main PCIe controller node.
>>
>> Will this model (with the parent pwrctrl node and child PCI
>> controller node) be used for all PCI controllers from here on?
>>
> 
> The PCI controller (host bridge) node is the parent and the Root Port node
> (which gets bind to pwrctrl slot driver) will be the child.

That makes sense to me.

>> Or are you saying this properly represents the relationship of
>> the supply with the PCIe port in this SpacemiT case?
>>
> 
> We want to use this for all the new platforms and also try to convert the old
> ones too gradually.

OK, understood.

Thank you.

					-Alex

> 
> - Mani
> 

