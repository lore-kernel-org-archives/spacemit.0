Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B975F2C324A
	for <spacemit@lists.linux.dev>; Wed, 13 Aug 2025 21:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755120448; cv=none; b=qs5QA9P6tD5yKC11nWaeOAgzJNZv/qFor+GSCsFIkb9KaNEk6n+VI9jN+Ajre0KSkxLRYL/ForS7uoh0vGj+IyhJT1s/6q15ZiHl1vOoL3nnWOZ/6xYkLFu+yDC/ywPx+yKykcUDhYD6BSRjH7YY/fEkEdUN6ISXPhUSWUSF63s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755120448; c=relaxed/simple;
	bh=Id+QsQELyg+pEjz6bWvXIyl5zJr/tcJ4oL7E4R2FyZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I73Khbx11/L1K9df7R9B6yefSEpGlaaaMKEoHuE6wGP1RHaUToRZd06RFJ4I0z5Hsgpnj4EZE/IHlHLlgePO3xaYYfMYnyjR/+Pq8uDKRM+SHRHagfDW2mGmVnDq/CfbMPyqEuAFH38/slZ6HBmS3s4OFKk4av6+Xe0tOsdwCSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=yqwnuNl2; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="yqwnuNl2"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3e56ffceab3so2758495ab.1
        for <spacemit@lists.linux.dev>; Wed, 13 Aug 2025 14:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755120445; x=1755725245; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HrFzekosij5RO32ErAHxgIo8Kdw6RXeQrtvQE1dGiUY=;
        b=yqwnuNl2fSE+61PTiVgRQVcAvxChzKejQDRgXNp5RxOiax2T/k0QxtHwbkVEdkTmiA
         9oG8+WONgq5WhbiJCwlPBXrDymAWgYi6wHHBpXKn3GYjklGq9ZuiHfuC7K7ayhPiX0e8
         FqWAR3+zTrpF7im9P/YUH5QbtK/mZ9arjgiXYCApBMskhtkb/ERN6WTPdKtMIDDzMHkw
         lszLlgNcyM5oSLshKd1Cl9qaJeJukkm7nbdHH2oKMI79yEIBkzM+ylLYVE+dg7ENnhNp
         yis9N1poZzU6aswaFUl3qQHy760riDcuvF1+8Mts+0dayxJun2kAbvsKpH8acmqlP3Gf
         XshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755120445; x=1755725245;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HrFzekosij5RO32ErAHxgIo8Kdw6RXeQrtvQE1dGiUY=;
        b=NuAtzvxowrYCRDNfCnqmYV1SS1jWd/higGnR57JZ3O4FPkQ7uiQr2b1UJKVs+gJGDd
         PU8/ciTelY7U7r1jAsgQqitIuS9ZZuSKotZ6h++vH30132yHwYwRX4NgcOFQlNFmFRDx
         VJOFpj7HjzMu4+zKorg5c6hupgjOMua2677hF2lCElFpA/YY3mhgCneuqUJ7fFGEGghj
         jftTcB9xY87OBo8/xx241o5Jmg/Zz8fvm7mHOdJ/+xccgnAMTnX2dv0m188Nr7epeCsX
         q0YeRTpq4QPFoVvhRxg2y8KC6mF9Ro68b1ehmywWfxgBJXOnNBrRmwe+5X144MxQ/j0e
         zrZg==
X-Forwarded-Encrypted: i=1; AJvYcCWBG9faAWhKIDxbd7oJoOQMG6yKDSwwNbLRTA3Wk58WxgsLGla3N1r1AKIRjyft08NtNImibt5Nrw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3U8Rz+4gMpyqPpm6YoeyM6R27UhPg4r0aBd0+KMKpVmBjUk3F
	0xWIVCESyl2Sn5M+Z19ONTwSBxTUQFqHkE3H0Etc8+M4Hxk5VWHRe27UqUvVsCx/Iyw=
X-Gm-Gg: ASbGncu8nrdoiqhC1BMIBkEBS5JDFtELr9lewJQ0RC49qfsxltdhro7r/3TQiW8XOVI
	STjbv/c9mQa927kGDb5D41zHShHVETFuc7h90BrEAoQzxTxgp4+GHUoNMU/kvW3Z4Gl3kV11waA
	x5uDa5ezE2eoWlfDeBooZW3n4xQrc6TZ+JzWU2/06zRZrYXQFCCYfWMZVLLY0yzGmw+rIP8N10I
	IZb3cvLALIUbVB6PcZ8ytsq6UixMNjCB+NVEsOBs1tgufcK5sV+l6gFW7ALpiNwyB5++Yiq+ohg
	VdM9TV+eyNImHhp+UpYwDU9Mkpruzpbekr2JsYGH0NMXAPrT3w+AkB5bY4Qt4fWVh+BgrCMciax
	CBVP0RAYm9R6BNA4Fd78zo0TG904RWu6g5QUpdLIcZP6jdTaYCPPcIPYHjEA29O/eg4biKNNf
X-Google-Smtp-Source: AGHT+IHhxOnH0kTjTpaPF32KB8bFgpsjlYZNdzvmJrAc6sUo4I9UVSc/FXuQewT8WYi7PJE6uX0raQ==
X-Received: by 2002:a05:6e02:b27:b0:3e5:4869:fdd3 with SMTP id e9e14a558f8ab-3e570810a71mr11947605ab.7.1755120445360;
        Wed, 13 Aug 2025 14:27:25 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e56ddf9ad0sm4921475ab.34.2025.08.13.14.27.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 14:27:25 -0700 (PDT)
Message-ID: <5d5eacff-4c32-4df4-8da0-3b55974b74aa@riscstar.com>
Date: Wed, 13 Aug 2025 16:27:22 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] PCI: spacemit: introduce SpacemiT PCIe host driver
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
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250813212219.GA294849@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/13/25 4:22 PM, Bjorn Helgaas wrote:
> On Wed, Aug 13, 2025 at 01:46:59PM -0500, Alex Elder wrote:
>> Introduce a driver for the PCIe root complex found in the SpacemiT
>> K1 SoC.  The hardware is derived from the Synopsys DesignWare PCIe IP.
>> The driver supports three PCIe ports that operate at PCIe v2 transfer
>> rates (5 GT/sec).  The first port uses a combo PHY, which may be
>> configured for use for USB 3 instead.
> 
> I assume "PCIe v2" means what most people call "PCIe gen2", but the
> spec encourages avoidance "genX" because it's ambiguous.

Yes, that's what I meant, but I did try to clarify with the
transfer rate.

>> +config PCIE_K1
>> +	bool "SpacemiT K1 host mode PCIe controller"
> 
> Style of nearby entries is:
> 
>    "SpacemiT K1 PCIe controller (host mode)"

OK I'll fix that.

> Please alphabetize by the company name ("SpacemiT") in the menu entry.

OK.

>> +#define K1_PCIE_VENDOR_ID	0x201f
>> +#define K1_PCIE_DEVICE_ID	0x0001
> 
> I assume this (0x201f) has been reserved by the PCI-SIG?  I don't see
> it at:
> 
>    https://pcisig.com/membership/member-companies?combine=0x201f

I hadn't even thought to check that.  I will follow up.  Thanks
for pointing this out.

> Possibly rename this to PCI_VENDOR_ID_K1 (or maybe
> PCI_VENDOR_ID_SPACEMIT?) to match the usual format in
> include/linux/pci_ids.h, since it seems likely to end up there
> eventually.

OK.

>> +#define PCIE_RC_PERST			BIT(12)	/* 0: PERST# high; 1: low */
> 
> Maybe avoid confusion by describing as "1: assert PERST#" or similar?

OK.  I struggled with how to express this to avoid confusion.
But I do think "assert PERST#" is better.

>> +	/* Wait the PCIe-mandated 100 msec before deasserting PERST# */
>> +	mdelay(100);
> 
> I think this is PCIE_T_PVPERL_MS.  Comment is superfluous then.

Excellent, thank you, I'll use that.

>> +static int k1_pcie_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct dw_pcie_rp *pp;
>> +	struct dw_pcie *pci;
>> +	struct k1_pcie *k1;
>> +	int ret;
>> +
>> +	k1 = devm_kzalloc(dev, sizeof(*k1), GFP_KERNEL);
>> +	if (!k1)
>> +		return -ENOMEM;
>> +	dev_set_drvdata(dev, k1);
> 
> Most neighboring drivers use platform_set_drvdata().  Personally, I
> would set drvdata after initializing k1 because I don't like to
> advertise pointers to uninitialized things.

OK, I understand that and will do it the way you suggest.

>> +static void k1_pcie_remove(struct platform_device *pdev)
>> +{
>> +	struct k1_pcie *k1 = dev_get_drvdata(&pdev->dev);
> 
> Neighbors use platform_get_drvdata().

Yes, that goes with platform_set_drvdata().

>> +	struct dw_pcie_rp *pp = &k1->pci.pp;
>> +
>> +	dw_pcie_host_deinit(pp);
>> +}

Thank you very much for your review.

					-Alex
