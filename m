Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D0522A4CC
	for <spacemit@lists.linux.dev>; Fri, 19 Sep 2025 18:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758305180; cv=none; b=GiXgjvln/LQ7UquwvRH4kpbF7N9EWnL3Iqp/Oc4i6jSq+pN1jPD7V79Kk8NclGwmYa3Fuuzr9gtgV3dS5uv6sOtT8eAl1uldi1Bq6jQ+9ZP8bHXZoUtFzhSGAqOxpwEUBvrJPay5oeVvL/zAY3HCu2TTtebH6qB6XFIQTPWdykM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758305180; c=relaxed/simple;
	bh=hSswRjdQ+04+nrR+tOkaECVX6apGop8z+9eTH/YRAUk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=d2eEW20CiCF6mRl0rMbWIe/2FY5HV0UCHXROC2bMKfHE3vewsb5tkzQNgHEfC2/K8ssEjTlLMi8GgiJOOeoYlYgEJMPmwJ0CdaCosl2KF61+qdWVP48mRalnQWmF0nz6iIxfQuIyRMbbcfz2mrfCIulh1zgOpFrHuSxvUc/ucSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=GNUzAmDZ; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="GNUzAmDZ"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-8936326129eso91489039f.2
        for <spacemit@lists.linux.dev>; Fri, 19 Sep 2025 11:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758305178; x=1758909978; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PyDhfnNhpXNHSy1fs/Ww3WtAuz4kktx1C3rWmJRS220=;
        b=GNUzAmDZOHJ6FpqNYOwxKUcrmhmiyxT6XEmV4Sd2Sr5Pk3ngwZ03SS83L5AKVXLSDv
         +3hsMwxyCQ321Cs6QFDgRd8U0dko08P1lF3gREos3io0wy43lENcSWngfWrzgiS3y2Md
         zzU9uXmts33FwYPhsiGU9YmYxchKAdp6n7+qhCCetGGPiHe8fTOj2jg6K6/a95D1ikNP
         M0keuuRHsGWtttH3NXZX3vIjy1VZUPiC3UcF5poQD3nnP/livJEEO0TnQiliU6qywoZG
         5DLkdhxcV5rxafzwy9GjYD58eCcgsR+d+M2szpnmA/gx/36r4Zm/Mp862BvtQM6RIFRN
         yhfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758305178; x=1758909978;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PyDhfnNhpXNHSy1fs/Ww3WtAuz4kktx1C3rWmJRS220=;
        b=ZBwc8xYWJQM7uPYMJFLZjWs/iQjCzNGP+iWMhNQrXJgcBPRoBjjL7B2vEsX9iu5yRD
         1SwKcT53lvvjLv3cxgx/ClqR/T/1iPlyQtOEvuEMhUEKS8o6/98Mk7ixi0YJHDKJdN6j
         VlJUkEvTZIBR2caOzIVbNYN/xj18WaWx9oOMhMGllonvB2M4/3D67whTRn02kK48kKQa
         NSqgZeUU3eB3NJM/7HYtWaDuYI4vznJ4Ulx+WfVgAJBFuubwz6hNku6/Z/6vzn9tB5gC
         b1SutFXYdNTDlTwklLpE7CL5fA0/wRnH+G/9LjCEZW6JI2LsT6Y+/XuuxWNFl6xFfMST
         uuBg==
X-Forwarded-Encrypted: i=1; AJvYcCVHy6iMyya8eKRvuKb//T4u8jYL5FCgsJDSUYJ7JcbMxXiZZFVDFkwMpE+eN4ooHZ1iEd9Q6GIatg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwO04oO8ELtg0YYWxSy41cCuU+hLAaNmrXKAi6o3NXsIrKb8jzQ
	UODKwTn8aFWKLXUZ3+eDgyVCgMvCE5cZwIIDQhAUW/Wi5fuhdauwUtubhxlmK2cZ8Tg=
X-Gm-Gg: ASbGncspHeYFaUj123kswzrPA88aJ9kRAowq8+dB/4aVhvUctF7/skASNqvhvvaB1Ym
	WCBCn5PeSy/jN1Vxp7AyRqsqUIbVbHjwV92QtKb2OfzE/Y6UMVojXAPqbQCMoOvcMwUuetyh7mR
	6ffj858ybwdjaJnuIPUIs+Vj7TZiVLY7tMVstAwfUs0qA5D36nRL/6wNQCfsJjXVKGK1GOXEJYF
	Qb/PvdYdf4EG4JEtldti4+0WtCHPkPLab+t0N5SfnQYyxecH+P/F0CEzXvSaZT95h3bYhcDZ35O
	Y9wA/EqrTVIQ8I+vH4nPob2e9QFB5w910ypmU3jpir3/yRq1Z1YJgxiEpO3RWF9AvMw3zGyLku0
	xrh4DiOrE5+L92n3REsASS33DbBOErWT3tFegtqgsfTqtd3QkE+Ju/FDx/nhqVw==
X-Google-Smtp-Source: AGHT+IHsassX7VCPU49903k7FzEDerinifFoBfyC5zAcBlOttmj7mzgkmLRJ6A7BaHGoGe18lpW13w==
X-Received: by 2002:a05:6e02:148b:b0:424:1c30:a3a7 with SMTP id e9e14a558f8ab-4248197c46emr68662845ab.25.1758305177594;
        Fri, 19 Sep 2025 11:06:17 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d3a59103csm2326715173.6.2025.09.19.11.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 11:06:17 -0700 (PDT)
Message-ID: <5463beb7-9909-4cb0-bb39-9f2d1aa4d2fd@riscstar.com>
Date: Fri, 19 Sep 2025 13:06:14 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] PCI: spacemit: introduce SpacemiT PCIe host driver
From: Alex Elder <elder@riscstar.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org,
 conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org, dlan@gentoo.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, tglx@linutronix.de,
 johan+linaro@kernel.org, thippeswamy.havalige@amd.com, namcao@linutronix.de,
 mayank.rana@oss.qualcomm.com, shradha.t@samsung.com, inochiama@gmail.com,
 quic_schintav@quicinc.com, fan.ni@samsung.com, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250813212219.GA294849@bhelgaas>
 <5d5eacff-4c32-4df4-8da0-3b55974b74aa@riscstar.com>
Content-Language: en-US
In-Reply-To: <5d5eacff-4c32-4df4-8da0-3b55974b74aa@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/13/25 4:27 PM, Alex Elder wrote:
> On 8/13/25 4:22 PM, Bjorn Helgaas wrote:
>> On Wed, Aug 13, 2025 at 01:46:59PM -0500, Alex Elder wrote:
>>> Introduce a driver for the PCIe root complex found in the SpacemiT
>>> K1 SoC.  The hardware is derived from the Synopsys DesignWare PCIe IP.
>>> The driver supports three PCIe ports that operate at PCIe v2 transfer
>>> rates (5 GT/sec).  The first port uses a combo PHY, which may be
>>> configured for use for USB 3 instead.

I'm following up on a few things I said last month.

>> I assume "PCIe v2" means what most people call "PCIe gen2", but the
>> spec encourages avoidance "genX" because it's ambiguous.
> 
> Yes, that's what I meant, but I did try to clarify with the
> transfer rate.
> 
>>> +config PCIE_K1
>>> +    bool "SpacemiT K1 host mode PCIe controller"
>>
>> Style of nearby entries is:
>>
>>    "SpacemiT K1 PCIe controller (host mode)"
> 
> OK I'll fix that.
> 
>> Please alphabetize by the company name ("SpacemiT") in the menu entry.
> 
> OK.

I will be renaming the Kconfig option to be PCIE_SPACEMIT_K1
(instead of just PCIE_K1).  I'm renaming the source file to
be "pcie-spacemit-k1.c" instead of "pcie-k1.c" as well.

>>> +#define K1_PCIE_VENDOR_ID    0x201f
>>> +#define K1_PCIE_DEVICE_ID    0x0001
>>
>> I assume this (0x201f) has been reserved by the PCI-SIG?  I don't see
>> it at:
>>
>>    https://pcisig.com/membership/member-companies?combine=0x201f
> 
> I hadn't even thought to check that.  I will follow up.  Thanks
> for pointing this out.

I inquired yesterday about this, and was told that this
will be finalized next week.  I told them that the driver
would not be accepted upstream unless the vendor ID had
been properly reserved by PCI-SIG.

>> Possibly rename this to PCI_VENDOR_ID_K1 (or maybe
>> PCI_VENDOR_ID_SPACEMIT?) to match the usual format in
>> include/linux/pci_ids.h, since it seems likely to end up there
>> eventually.
> 
> OK.

I will use PCI_VENDOR_ID_SPACEMIT and PCI_DEVICE_ID_SPACEMIT_K1.

>>> +#define PCIE_RC_PERST            BIT(12)    /* 0: PERST# high; 1: 
>>> low */
>>
>> Maybe avoid confusion by describing as "1: assert PERST#" or similar?
> 
> OK.  I struggled with how to express this to avoid confusion.
> But I do think "assert PERST#" is better.
> 
>>> +    /* Wait the PCIe-mandated 100 msec before deasserting PERST# */
>>> +    mdelay(100);
>>
>> I think this is PCIE_T_PVPERL_MS.  Comment is superfluous then.
> 
> Excellent, thank you, I'll use that.
> 
>>> +static int k1_pcie_probe(struct platform_device *pdev)
>>> +{
>>> +    struct device *dev = &pdev->dev;
>>> +    struct dw_pcie_rp *pp;
>>> +    struct dw_pcie *pci;
>>> +    struct k1_pcie *k1;
>>> +    int ret;
>>> +
>>> +    k1 = devm_kzalloc(dev, sizeof(*k1), GFP_KERNEL);
>>> +    if (!k1)
>>> +        return -ENOMEM;
>>> +    dev_set_drvdata(dev, k1);
>>
>> Most neighboring drivers use platform_set_drvdata().  Personally, I
>> would set drvdata after initializing k1 because I don't like to
>> advertise pointers to uninitialized things.
> 
> OK, I understand that and will do it the way you suggest.
> 
>>> +static void k1_pcie_remove(struct platform_device *pdev)
>>> +{
>>> +    struct k1_pcie *k1 = dev_get_drvdata(&pdev->dev);
>>
>> Neighbors use platform_get_drvdata().
> 
> Yes, that goes with platform_set_drvdata().
Actually, many of them use dev_get_drvdata().  And I think
that's why I used dev_set_drvdata() in the first place, to
match dev_get_drvdata().

But in any case, I'll switch to setting and getting platform
driver data.

					-Alex

> 
>>> +    struct dw_pcie_rp *pp = &k1->pci.pp;
>>> +
>>> +    dw_pcie_host_deinit(pp);
>>> +}
> 
> Thank you very much for your review.
> 
>                      -Alex

