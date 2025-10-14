Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF3826560A
	for <spacemit@lists.linux.dev>; Tue, 14 Oct 2025 01:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760407040; cv=none; b=O9zlWNWPRsW8st8vmnl7zOI9TBdM5N2ru2/FO93fra3HCojqt9HbZSfq+AxQ6ULPu/JJRMNEeUr3/t9t2RtGCzMTDDUY/R0CU+M5MyAqZzW/WmqPkjcxi+iu0SZusZ5lRdmGYFlG7mqi7fXBuWMDPs8g5wEWngzKH3ZBnEOq3Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760407040; c=relaxed/simple;
	bh=i3JH/UyTwdORR76plBkkx4i80jRqEPvGe7n87tMkr6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cCiP0I20J4mH/b2hnlHa4091R4dxbnJ4MqmCgiGfV+i2wBCGljrJQ6YpePrr1UMQjNl525BRS9ONa+sbMXgw6vQK3v3sZ/LdaNlPh5B3cmMouMWMO1/+5PxgAUPIIRVspfQqSqc8T7s67jrNiEJgpVLIaKBOLPFbZA5I8Y8BpzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=HYRaONvS; arc=none smtp.client-ip=209.85.166.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="HYRaONvS"
Received: by mail-io1-f68.google.com with SMTP id ca18e2360f4ac-93bd394fab0so120472939f.0
        for <spacemit@lists.linux.dev>; Mon, 13 Oct 2025 18:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760407037; x=1761011837; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DRqpVkhMILdGgOXoNXOKPLRF82QFKKsH1zKrfan+k9o=;
        b=HYRaONvS41gzdqgW1CdBN8Yx68fIoYZs633rtLwnfzTSDGHTvQ+hZMblBS7PBzZ1rL
         qy3YnNyW0rpBSfr2eRDHTKOMP6o1EH8dJo7iRudTXCFeVQGm2V1k2XxWCw3phNVA8d2f
         +W+eZcmWjMFb7AKAWj86cYI3jci875rBSwZpkHULm+tEmL1hda/uFY0aGD7ml5KhWR4s
         krBYqy/b3iQ+NPok34MWGJgRXeJM3B9LwwrogQQK0n4U3fK8Gmeux767B9OMjBd9wBTy
         8a9HOg3HhY5HTfVw/jHZlLwx5MXNnnxrF/tePzIlkYGCO0qGArnjB9lBa+d3sSuxZNM0
         ix6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760407037; x=1761011837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DRqpVkhMILdGgOXoNXOKPLRF82QFKKsH1zKrfan+k9o=;
        b=CONzJdXcfWWwlx/2EiESwfldMl3CllbkVosX4qKYYTAEI+JocPdqd0KpbyBd9BrV3T
         +Z/GT5uZuOldTDVCE7hk0vmXV6werbC6TDR62RWRB80Ekv+sAQoHrhDpDZcxiErx0/Te
         uUhCnOAylWFo0ArRBks08h4YW3PgDVz8oSuLThpf93ENihkYlURkAwm3t0iCwJVaAt1U
         Vtm6vopfcv32eNTUYF2p6eaDfPkNioETgPeWNNQsSRBaRNt9k0ZUCp9UGNYOgoHYf3Q6
         M0pKw6b9LJHKMKLjI0W89kUHZ2Ugu2gQjRrCdavcbxUO4GirYoN6ZuuCQ8pFLRHmGAep
         tOig==
X-Forwarded-Encrypted: i=1; AJvYcCVBFVR/6JaqCVU1DvD0/3PeBKP61DsiX51BeA4MrocAM9Onlf+Cabzsyp16KIRkzQ72hzEN5Fwhew==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyngz3GUThsuhaZpxpV/p/aL2QIibz6k+fs23Poq8Vhg9bqLfEU
	eAvRafSegX6opNe5eEZHJ0hrSSoRa63cnx/g07/MB8Y81YCqASu4ZwqWk8Afzu3uHNw=
X-Gm-Gg: ASbGncvQzHOieX8FJvCQso74HXAtq1tBdiOM0NqCcJeokIl+vRJx/hVPIyzZ4jfOb/I
	QlW216reK395ibBweQp1zl0ErHPizFBQ2/0JidLQNH4JMghmBaDnsYaQ3QKlJ8dlHBdMfA8d5ND
	Uq1QU/Ccc3pAjkpkky9WxU7e4MrOw2wkO81wHtSyrdi5LCZXaF5fyS622FoPQS8otS06SWw8SWu
	8CL/XRze1l+VwSIBbzoPknIwVCWfDo3ahBT5bM4d7fYP8CacoDYtIDMK57YmZV72GpKItKMEJRt
	gRGyb0Q529xLFdaZ/14/cdCM5W5MVGVBYg33hl2ETLDFOhNiGhBkUkUNNWXz8UZYwVSH4tQNekp
	AjYSNqOjaRPfZ1kc89DLdvA6VIGhyb1Ww3ZUI+LttnadctxtF/tjZx9z7wkyobSLprM8M3rEStt
	mVMSPaDXud91XIeg==
X-Google-Smtp-Source: AGHT+IFz+6u4FT7mXO0HjOe5eXpI34wWI1ZFKrY/cjEseejOQH/7Ctss1Fp2rB13acyyKvsMsu5OOA==
X-Received: by 2002:a05:6602:811:b0:87c:2a76:4cf9 with SMTP id ca18e2360f4ac-93bc4074509mr2599466339f.1.1760407037052;
        Mon, 13 Oct 2025 18:57:17 -0700 (PDT)
Received: from [10.211.55.5] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-93e25a659a0sm455091539f.17.2025.10.13.18.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 18:57:16 -0700 (PDT)
Message-ID: <860df9d7-9791-40de-903d-0f62d34533e7@riscstar.com>
Date: Mon, 13 Oct 2025 20:57:14 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] dt-bindings: pci: spacemit: introduce PCIe host
 controller
To: Yao Zi <ziyao@disroot.org>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, bhelgaas@google.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, vkoul@kernel.org, kishon@kernel.org
Cc: dlan@gentoo.org, guodong@riscstar.com, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 p.zabel@pengutronix.de, christian.bruel@foss.st.com, shradha.t@samsung.com,
 krishna.chundru@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
 namcao@linutronix.de, thippeswamy.havalige@amd.com, inochiama@gmail.com,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251013153526.2276556-1-elder@riscstar.com>
 <20251013153526.2276556-4-elder@riscstar.com> <aO2tkGSUTYssSaVf@pie>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aO2tkGSUTYssSaVf@pie>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/25 8:55 PM, Yao Zi wrote:
> On Mon, Oct 13, 2025 at 10:35:20AM -0500, Alex Elder wrote:
>> Add the Device Tree binding for the PCIe root complex found on the
>> SpacemiT K1 SoC.  This device is derived from the Synopsys Designware
>> PCIe IP.  It supports up to three PCIe ports operating at PCIe gen 2
>> link speeds (5 GT/sec).  One of the ports uses a combo PHY, which is
>> typically used to support a USB 3 port.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v2: - Renamed the binding, using "host controller"
>>      - Added '>' to the description, and reworded it a bit
>>      - Added reference to /schemas/pci/snps,dw-pcie.yaml
>>      - Fixed and renamed the compatible string
>>      - Renamed the PMU property, and fixed its description
>>      - Consistently omit the period at the end of descriptions
>>      - Renamed the "global" clock to be "phy"
>>      - Use interrupts rather than interrupts-extended, and name the
>>        one interrupt "msi" to make clear its purpose
>>      - Added a vpcie3v3-supply property
>>      - Dropped the max-link-speed property
>>      - Changed additionalProperties to unevaluatedProperties
>>      - Dropped the label and status property from the example
>>
>>   .../bindings/pci/spacemit,k1-pcie-host.yaml   | 156 ++++++++++++++++++
>>   1 file changed, 156 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
>> new file mode 100644
>> index 0000000000000..87745d49c53a1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
>> @@ -0,0 +1,156 @@
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
>> +
>> +allOf:
>> +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
>> +
>> +properties:
> 
> ...
> 
>> +  num-viewport:
>> +    const: 8
> 
> This property has been deprecated for a long time, and the driver now
> detects viewports at runtime since commit 281f1f99cf3a (PCI: dwc: Detect
> number of iATU windows, 2020-11-05), IOW, it makes no effect with the
> current mainline DWC PCIe driver. Is it really necessary?

Based on what you say, the answer is "no" and I'll gladly remove it.

Thanks.

					-Alex

> Best regards,
> Yao Zi

