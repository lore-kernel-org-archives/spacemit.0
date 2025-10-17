Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C127F2E36E1
	for <spacemit@lists.linux.dev>; Fri, 17 Oct 2025 16:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760718074; cv=none; b=RFv9DGfgz2lbzAM5kBoibI2ww8QonJeR9W1JbN3CkWPhGTjNchnfzVznR5lZVOyVqRiPr9jAD7SNMubDngWfTxpIepe99seJOMSGYQeHh8dQENYYQ4FsxMpfmFb0/Itt781dkZIxPIfN2tHjnpBenSeZE0Kglnf8/MLzS9VrHos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760718074; c=relaxed/simple;
	bh=a1NVbX4HwLDN8rNhr+HKeFlbDVEvCUamvM/dlLKhGKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=USBVfdzUDoPFWUU0QDcIbKzj6Aon1Ekxb7XmGG3f1kAZvDP2G4JICI8OHuxCqZ/keIaTxSKg+NudGLcxjVdj/Mrhurl+ahGDF1zQvmemY++oRyuQ0joSJ3NlwuFdlUXwW/LF4mdyj+0v1O/sWpnKlSd2r2oBHr1UFiDpMxb8VgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=RNT0Uqjy; arc=none smtp.client-ip=209.85.166.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="RNT0Uqjy"
Received: by mail-io1-f65.google.com with SMTP id ca18e2360f4ac-93e7ece3025so29835839f.1
        for <spacemit@lists.linux.dev>; Fri, 17 Oct 2025 09:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760718071; x=1761322871; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a7+Wio6b8w1yNg9Tem9uVrRYlYIL3Mf5C/3BZyCBdIc=;
        b=RNT0UqjyGnNHBB0q6OiBnnW5D1/SvhjIEmEZkizz9VLgeyBJPKfWJouw5KJftpcphG
         3rMWWDHIAsD9mBjaX+WyvFcsX6cofcBrybO8AWT0O+i02ATyGg29ky0DgqNRPJaSx4L5
         vS+oleANrP2dF9znHti2ku9/oyrQaGxx7xwpVuUgnHkkzuFgi6WfzsVlcA15/8VpM6Qo
         SwBKNQ9sDRQw0t6XUIgRzVxoA3/FfySt52Z/fx/l6QWv+jlQ99Xy1inKUTCS572fJPfq
         pIGwZhykol/jaS0efP7ey0oQ+SG7+OM6s5+ECnv3JNsvoiM0h1h6kWjK6GWIqWZmfZTO
         zQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760718071; x=1761322871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a7+Wio6b8w1yNg9Tem9uVrRYlYIL3Mf5C/3BZyCBdIc=;
        b=llqFALb/q0wkztf+xFBo87Oz34W2Eg6L3pGW9p7mDqwJLC+0vvnqq2fpsqSI3Is7XL
         lyCKkfT6zYPiBS8QITHIjE2kIpCQ84btR+XYwlfPPFUWUFvpyBy/LzLcbyZDg8gtMjYW
         URtfNHWoVMqdOAn6u6BK4OKC5ekpGBsLDd3eiFv8AU60lhMqUmb46txO4J9B76F3Lv5v
         7BZsxVB4jrwuDgtlmCZBLI3pTk7pvhsOQeu0b/G+TY5d51Tghux5CuKc8dl6GSBzsXIf
         0BrenfhNcxQqRdb9B+PkzLRZ/QYK/w2KFO0IrksjfOo18/nou4k8mCQNQGiFx9xCUlE4
         /5CA==
X-Forwarded-Encrypted: i=1; AJvYcCVcu6OUpgBF74j9tHHzSQcEQEBvVSTA4+bcBY32xs2vcx5VMGs37MX7w4XC31WeuXUkFNWJghu52A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1w9lE/HKg8x1ApjKPVou/OxzhGKDdVnMRgVq+w38s/+r3dwj/
	3Kvmpwc999NpQn1bV3ssv6hIdCiRu0Kdrrcpul98meFBuA8t+FKPViasrhaB9SgyajY=
X-Gm-Gg: ASbGncse1dlFD61cZH4vGz5jOTGIeJ6QU6XppMsFzUoR+gFHhgvADgC8oRN4aG68qPo
	IhHWyr18JM/Zo9u6DCms92yH/w480aMOppodRQBZZaq0zQFTAD//+Bjc5j4atDd+2uvVZ6aPz1o
	LEKQ8VIfAEj58kcUTEN16dvSRphc0GQ2NbXcFRI6RN1iSQwLuXtkRGO5OR8nWraBly/FehJk+1c
	SrCeFJrDqa6HL6/VW54i6kH1OIAnr3e2LBwR01NDPxMnhj+IBrU/ngYaI06YDKxoi2yoRdHVZBs
	AjxcK5OPGcO5yiH37vDc1tzmAuV4PaEFhWfiGpy2jpq7JKAhjZ7dPE6h+SYrxFi9QCJr5NL8BgP
	46H8D/uELHdmz/2+2tLW2+fOJlVGWr2/oJ8o7VWZDU442CXLlLqNIKEkx6tXHIOjNou4uDR7584
	/NaVctAAednQNrIkqPZvsfAyDazV+tPSStqWfcbcg=
X-Google-Smtp-Source: AGHT+IEIgP2oHx8F177Q7uZqnuNLPeZz2b0M8yBXR1aqrI1laVD3XEel+UPyfoDNXtqbVVX4QNo+pg==
X-Received: by 2002:a05:6e02:440b:10b0:430:bf84:e94c with SMTP id e9e14a558f8ab-430bf84e9e5mr60046655ab.13.1760718070850;
        Fri, 17 Oct 2025 09:21:10 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a97b92b1sm10677173.68.2025.10.17.09.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 09:21:10 -0700 (PDT)
Message-ID: <92ee253f-bf6a-481a-acc2-daf26d268395@riscstar.com>
Date: Fri, 17 Oct 2025 11:21:08 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Introduce SpacemiT K1 PCIe phy and host controller
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, vkoul@kernel.org, kishon@kernel.org, dlan@gentoo.org,
 guodong@riscstar.com, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
 christian.bruel@foss.st.com, shradha.t@samsung.com,
 krishna.chundru@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
 namcao@linutronix.de, thippeswamy.havalige@amd.com, inochiama@gmail.com,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251013153526.2276556-1-elder@riscstar.com>
 <aPEhvFD8TzVtqE2n@aurel32.net>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aPEhvFD8TzVtqE2n@aurel32.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/25 11:47 AM, Aurelien Jarno wrote:
> Hi Alex,
> 
> On 2025-10-13 10:35, Alex Elder wrote:
>> This series introduces a PHY driver and a PCIe driver to support PCIe
>> on the SpacemiT K1 SoC.  The PCIe implementation is derived from a
>> Synopsys DesignWare PCIe IP.  The PHY driver supports one combination
>> PCIe/USB PHY as well as two PCIe-only PHYs.  The combo PHY port uses
>> one PCIe lane, and the other two ports each have two lanes.  All PCIe
>> ports operate at 5 GT/second.
>>
>> The PCIe PHYs must be configured using a value that can only be
>> determined using the combo PHY, operating in PCIe mode.  To allow
>> that PHY to be used for USB, the calibration step is performed by
>> the PHY driver automatically at probe time.  Once this step is done,
>> the PHY can be used for either PCIe or USB.
>>
>> Version 2 of this series incorporates suggestions made during the
>> review of version 1.  Specific highlights are detailed below.
> 
> With the issues mentioned in patch 4 fixed, this patchset works fine for
> me. That said I had to disable ASPM by passing pcie_aspm=off on the
> command line, as it is now enabled by default since 6.18-rc1 [1]. At
> this stage, I am not sure if it is an issue with my NVME drive or an
> issue with the controller.

Can you describe what symptoms you had that required you to pass
"pcie_aspm=off" on the kernel command line?

I see these lines in my boot log related to ASPM (and added by
the commit you link to), for both pcie1 and pcie2:

   pci 0000:01:00.0: ASPM: DT platform, enabling L0s-up L0s-dw L1 AS
PM-L1.1 ASPM-L1.2 PCI-PM-L1.1 PCI-PM-L1.2
   pci 0000:01:00.0: ASPM: DT platform, enabling ClockPM

   . . .

   nvme nvme0: pci function 0000:01:00.0
   nvme 0000:01:00.0: enabling device (0000 -> 0002)
   nvme nvme0: allocated 64 MiB host memory buffer (16 segments).
   nvme nvme0: 8/0/0 default/read/poll queues
    nvme0n1: p1

My NVMe drive on pcie1 works correctly.
   https://www.crucial.com/ssd/p3/CT1000P3SSD8

   root@bananapif3:~# df /a
   Filesystem     1K-blocks     Used Available Use% Mounted on
   /dev/nvme0n1p1 960302804 32063304 879385040   4% /a
   root@bananapif3:~#

I basically want to know if there's something I should do with this
driver to address this.  (Mani, can you explain?)

Thank you.

					-Alex

> Regards
> Aurelien
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f3ac2ff14834a0aa056ee3ae0e4b8c641c579961
> 

