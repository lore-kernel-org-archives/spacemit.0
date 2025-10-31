Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA87F4369A
	for <spacemit@lists.linux.dev>; Fri, 31 Oct 2025 01:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761873384; cv=none; b=sgwl83O5x2gz8TblLwiclWVvwVRagHbG+fyHQzQps9Ia7q9bYqaqNIlLz7j1NIcRG5oEfpjt2dD5yrw4KhvI6LP5GSm6aSelQVkBLZZZxNwOOZmZMQApjHRZDFt0OCUt/RoF9IvHFg6tR6I/T/U5iaZBSI53opTH5NIwBt6z5Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761873384; c=relaxed/simple;
	bh=4Q2e8S4JOkL/lipbI1pDbE41ejOeT3F2JXftXOKS9SY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aaP6pHDRmPCRh3C99jN4Fq7p6xFrWwNpjGF5utRCpV1zFWvAD1lwW1zWdglyyZuKNRBT7Cav/ZfwNcdZBR2LfJf3M64+FcRuS1wntlVxBqxlGdX2h8fDN2GAnHsNGM8008uyIF+ld9Eo2mcM2iLalctRQTotcLBAKLLEitDE8oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=UnizsR73; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="UnizsR73"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-93e8834d80aso72251839f.1
        for <spacemit@lists.linux.dev>; Thu, 30 Oct 2025 18:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761873381; x=1762478181; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BNmWvB1sse+ll8fu7wLpbE6Pu2iBxbQUEY600bj95+Y=;
        b=UnizsR738AsccifL+egW6l/fO76boBKCHlX81ROTuRtLBn3xf66l8mHozInF4vUqEe
         asjeTjG5uR/4Ngvz/CdJUiwXodsHOcDpFjIcwGl+RmXBLj6KU4HTdZYlGt/7/C4sGtIE
         4te6waqzy8fUumy2FI8ryuAH/5fiJEchDrt3uOEtR1enMp1u/zEuktWZdX/U3DE5idmB
         t5VNg/PuYYVHJv9ZhJMjSruFLMtrLNzplc3bJEJ7yjV862nSalFUqvkDMIww+1uG0VdH
         c52rXe5GwINu6OcbCUwAIlF/nkd4DLQGQ4IfI89tD7oI6KqgYMxeJ0jTF+Wfe5vlZGgW
         VwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761873381; x=1762478181;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BNmWvB1sse+ll8fu7wLpbE6Pu2iBxbQUEY600bj95+Y=;
        b=xQ1+ROPPMyM3hWmHwwUoDK1kPWYWFzSo8OvfkZV6ku2Z/o635mVTzZMjEHxV0r+1QW
         miFYmVbIkbYC6kBD1Vy4qxQFQDOaPTQb3hBOJW10BPKsxDRIp6U2h4uQCz4ctzmXQM7m
         7Y3hGjvo6tsSyK/vHk5dGXVrnInUBXSNLBswCtphtnSoz4DS0iQDuScnhCSMR9ioht/p
         tfYB09M2J5NODrWto5mMNJ45brzB1g1zX0e2V0Ox6cbldCy3/dDLGgptapVOo3aFYuCA
         CuMuZ8n8NhPQxCC9z1NzUl4XpOg9mVW5efCDyn/a/E78EZVCPTyyc3k0uMSDKjNRxMzS
         59mw==
X-Forwarded-Encrypted: i=1; AJvYcCU67NdWx9159OBgP+XDxGwBqnBEbjnU2ReICY4tafDaFIbmg5083PxbwZH7mlynJYC0SCe7KPcUbA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhJi7YQyMdtZHN9BBhsbj9EbPxVteHWsi+pdpo24V4HYzMJ3x5
	/8ozslyU8T03LKGlHiKcYeAjLXta/NcReeYNNW0HmKP0FtB5Kp5SGKiQo3eblb19sqk=
X-Gm-Gg: ASbGncvr/YvT/BL+GjjK461eCEtF09AhKcX4j6aSa6pUgHK3J/LrWljOuBzA5Agm5mI
	YQmV/ICIZwhVh7rTVyiTzTnNJ1DK/g3NdqpmvxMCR40rGuyFvANFNdNaoRfrPYnDsi2wcDMSvQm
	NjKJfMcLbuZX59FSxvLzzWQhecO///0G8Tmd0+f5zBgZP8bUh8bjIfdcij1sX9lG8T1qAmTZ3ea
	ZDGD/dofJ6v4ELCUPhekBQPeB0dM1IgjnPh8AoKiCTgOTqjHqTVPc//uSxPO/3cKt92ZGjmRQF0
	mfj8PAX3EsiCEMGwaYrZlSdquCsBbooP/6J/8OETcX8wc2mKd6sBwf3xOfUMWl3rJQnxDVzXF4I
	mZ4knRcFv2NE4zDK/Al1w8YdqmNG2ursud3krfFWDpJDin/d3K1gAT5qhM+lsb1SuGR6Ognnf6d
	Luzm/438b2su0otu24X1/6kyiXJ0Kma6flMs+gVN9v
X-Google-Smtp-Source: AGHT+IF4xxWwH/4LfxxdEtp/ZJLyhKDeHy5QKQAhJFjWBy4txu4y5k6mqZ7NiiibuaIjhND7W09bcg==
X-Received: by 2002:a05:6602:2c01:b0:940:d7cb:139a with SMTP id ca18e2360f4ac-948228fff16mr371985839f.7.1761873380679;
        Thu, 30 Oct 2025 18:16:20 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5b6a5a981f5sm144822173.46.2025.10.30.18.16.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 18:16:20 -0700 (PDT)
Message-ID: <f1bec6f4-bf44-4cbf-a676-fa81d81531d4@riscstar.com>
Date: Thu, 30 Oct 2025 20:16:17 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] PCI: spacemit: introduce SpacemiT PCIe host driver
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, bhelgaas@google.com, dlan@gentoo.org, aurelien@aurel32.net,
 johannes@erdfelt.com, p.zabel@pengutronix.de, christian.bruel@foss.st.com,
 thippeswamy.havalige@amd.com, krishna.chundru@oss.qualcomm.com,
 mayank.rana@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
 shradha.t@samsung.com, inochiama@gmail.com, guodong@riscstar.com,
 linux-pci@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251030230801.GA1660222@bhelgaas>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251030230801.GA1660222@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/25 6:08 PM, Bjorn Helgaas wrote:
> In subject, capitalize "introduce" to match history.  Or you could
> just use "Add ...", which has the advantage of being shorter.

OK.  I'll capitalize all of them in this series.

> On Thu, Oct 30, 2025 at 05:02:56PM -0500, Alex Elder wrote:
>> Introduce a driver for the PCIe host controller found in the SpacemiT
>> K1 SoC.  The hardware is derived from the Synopsys DesignWare PCIe IP.
>> The driver supports three PCIe ports that operate at PCIe gen2 transfer
>> rates (5 GT/sec).  The first port uses a combo PHY, which may be
>> configured for use for USB 3 instead.
>> ...
> 
> I guess this doesn't support INTx interrupts at all?

It can, but I removed that support first to simplify the task
of converting the original code, and second because I had no way
to test it.  I planned for it to be added at a future date.

>> +++ b/drivers/pci/controller/dwc/Kconfig
>> @@ -509,6 +509,17 @@ config PCI_KEYSTONE_EP
>>   	  on DesignWare hardware and therefore the driver re-uses the
>>   	  DesignWare core functions to implement the driver.
>>   
>> +config PCIE_SPACEMIT_K1
>> +	tristate "SpacemiT K1 PCIe controller (host mode)"
> 
> Move this to keep the menu items alphabetized by vendor.

OK.  I was going by Kconfig option name, but now I see
what you mean.

I'll put it between PCIE_SOPHGO_DW and PCIE_SPEAR13XX.

>> +	depends on ARCH_SPACEMIT || COMPILE_TEST
>> +	depends on PCI && OF && HAS_IOMEM
> 
> I don't think you need PCI or OF.

You're right.  PCI for sure, but it doesn't look like I make
an direct OF calls either.  I'll drop them both.

>> +	select PCIE_DW_HOST
>> +	select PCI_PWRCTRL_SLOT
>> +	default ARCH_SPACEMIT
>> +	help
>> +	  Enables support for the PCIe controller in the K1 SoC operating
>> +	  in host mode.
> 
> Most help text includes both the vendor and the product line names.
I guess I didn't include "SpacemiT".  I'll add that, and will try
to come up with a few more words in the description.

Thanks for your quick response.

					-Alex

