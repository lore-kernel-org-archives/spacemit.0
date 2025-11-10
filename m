Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC0A1AAE13
	for <spacemit@lists.linux.dev>; Mon, 10 Nov 2025 15:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762788019; cv=none; b=UCIG1Vm/4ZtkUY0e7k4e0rl0dysedca6zMyLG1Qjo4CiTFTD5wA3e9EPwUW3W2Q1aVG6Umf/JjbV1LQuCHmzcOMpDAbLUDt+PrXLns4F02LvPpbxxSpUaODUkbij+hUVm+yUzPGoMps5TnUvl+j81TeKoWcnL7IkblVRmKfOGKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762788019; c=relaxed/simple;
	bh=sO2EwoD/iYNjfdcI7NveTHw7NYQaesuq9uoAsC4fvXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kVpTWK6qsGKqBh4UuMY0TcTnrb0W6iorF7UTYg0oQqBZh7u1MqwVeyDrbRw/Oi/xaT2ONaoY9/YJbdiQ6u0fd+HvzUqEHI6kTet8X+EUZM7Evn8iu1ruvdxDxLsi1sdjvX59Wn6cNMpyKHI8PMUAS5uwkbsnAe2tv5O34gL1Zpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=dU7sS3eC; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="dU7sS3eC"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-43376624a8fso17941485ab.0
        for <spacemit@lists.linux.dev>; Mon, 10 Nov 2025 07:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1762788016; x=1763392816; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wHqCJdsR7z6UGezYu2PLRy2EX3z1OohmVvws0HQYrFQ=;
        b=dU7sS3eCMeTP5vM2lhZmxUtGA+QmZ40dmGWwoGfqArrXGe/pKskThYcsxvdB7O7p0v
         Haw++/vGUxIkidVgox5P3NtadJOoCTxRi3z8Il1+tPwjHdxF4zw6NWAoAVfOxZ72Wt6r
         7gzd684OOa4pp+txTqOalpOoUa9pvoil6bDYn/5nJ3OHAyAZQpfbqe4nHp/+BuR2xgZo
         Keo3C1Zbquu8VLnc7C18SUtJZekBL1AWc0PiD9RRkHft5uehcXovfg/nTwTQIzFrgceq
         b7aFd96YPso/Zj4WOIlS8a6Mfy6EvM3MkMQ42YFNsh9aFzwUcgrrBcO0FzZDb5hgP3PI
         6Ybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762788016; x=1763392816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wHqCJdsR7z6UGezYu2PLRy2EX3z1OohmVvws0HQYrFQ=;
        b=tTVwS3FjFSGqn/uBbH7QQkFAhB41r0rS2x34+lwVvHQNUtghXGbBoNXoG2bVrq7/EJ
         DE9CT3cD38Yy/URTn7Oryla5LTFT2yMFsebWx3x+34imxAf8elaN3HYSnFKbW4Kp6QQa
         F2eM4loCkAJYF9zAlHT5sjBmSH73EA3qxrg8rbdlkIkGGqN746j3S9KexJndpY/XiWzn
         gi6Q/LgwDFyeMI6B3/uqDXXxFDc40vHwFW+bA9kQLsY0jkMHsGNPDA9DuIcsKZptfKEx
         b2c7E2lYkEmsyunq3VAfGVMsVjCFrPxwZQCOwQ2vZnofyqW++V7w9GdzMGirnrhPeuCB
         G2tw==
X-Forwarded-Encrypted: i=1; AJvYcCVjhvHWAMw1iKWU73STk/A6RkJo8zlgl4Z67WllvdAtOLEf9bSYErCmp2DSLcFCfZfJZt5RvKVI5w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6gFgqPjT1mF6bk1cIBKBHHiOlMoFeLqqqMxu8WxHY3Jn0S4GZ
	QoxMe5R37e0AdqPo36wrSX60LwlOKJzxyIykwMtvBPTXoS9HJPxTnCvA5yfR6hJV0jo=
X-Gm-Gg: ASbGncu9vFkK6yW/ysNRwUsNDVbq/hT3aRf8bENMCfZv6HGNw9rqaqINISArvLpcvwZ
	ZzpfzqVJ6sgyRYxoguftpLd7DEPb3SpYgJmYxZ9UG9uvgcmhDq4UGuJhPEqprzcHnwr2uYRRyaK
	A1TLV+lfYoN6AKc+nrNfUSzLX6sHUKV0NkR0sABVq2qInYMffDtcAlP7bk5h+ubEaZOuuoaPp++
	HjuOyYUBmoWPgOcN5RHYh4tWS+PzYinIKarrJzZxNnBY9grZhzVfGBPfTGXZQhPQRcKlaeVhZej
	Cii6PgoOh/EsrMT8sUQIoo+FXIDLyZfgDgEWeBdErZwndgu2Ly5AUAqFiR6pSoYZj/YwTyMF0zP
	erpLQ7KZqH5CtnS2zBdyiuCy2TjqHISU2aKG6Mb+M8BPtD5KBFTBL3yIcYs2mPc7Pz/PMo7luOs
	MWTmMdbhSOZSE3l7579+6sxCjl3eDIqhEhPztRNFU=
X-Google-Smtp-Source: AGHT+IEbu7UkRnaq1HAZF7KJE8mC7YX4IT4qsm04tHRZF/RRVkDmdBo8SVYWqOjog8FiLYEn3hk8pw==
X-Received: by 2002:a05:6e02:1aa2:b0:433:3034:e88 with SMTP id e9e14a558f8ab-43367e48c8bmr107760915ab.21.1762788016218;
        Mon, 10 Nov 2025 07:20:16 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-4334f4f5b90sm56357735ab.33.2025.11.10.07.20.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 07:20:15 -0800 (PST)
Message-ID: <66ab3a48-5d5a-47c7-b8eb-b477fd987314@riscstar.com>
Date: Mon, 10 Nov 2025 09:20:13 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] Introduce SpacemiT K1 PCIe phy and host controller
To: dlan@gentoo.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org,
 bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, ziyao@disroot.org, johannes@erdfelt.com,
 mayank.rana@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
 shradha.t@samsung.com, inochiama@gmail.com, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 p.zabel@pengutronix.de, christian.bruel@foss.st.com,
 thippeswamy.havalige@amd.com, krishna.chundru@oss.qualcomm.com,
 guodong@riscstar.com, devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251107191557.1827677-1-elder@riscstar.com>
 <aQ8kqIljwGZfkF8M@aurel32.net>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aQ8kqIljwGZfkF8M@aurel32.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/8/25 5:08 AM, Aurelien Jarno wrote:
> Hi Alex,
> 
> Thanks for this new version.
> 
> On 2025-11-07 13:15, Alex Elder wrote:
>> This series introduces a PHY driver and a PCIe driver to support PCIe
>> on the SpacemiT K1 SoC.  The PCIe implementation is derived from a
>> Synopsys DesignWare PCIe IP.  The PHY driver supports one combination
>> PCIe/USB PHY as well as two PCIe-only PHYs.  The combo PHY port uses
>> one PCIe lane, and the other two ports each have two lanes.  All PCIe
>> ports operate at 5 GT/second.
>>
>> The PCIe PHYs must be configured using a value that can only be
>> determined using the combo PHY, operating in PCIe mode.  To allow
>> that PHY to be used for USB, the needed calibration step is performed
>> by the PHY driver automatically at probe time.  Once this step is done,
>> the PHY can be used for either PCIe or USB.
>>
>> This initial version of the driver supports 32 MSIs, and does not
>> support PCI INTx interrupts.  The hardware does not support MSI-X.
>>
>> Version 5 of this series incorporates suggestions made during the
>> review of version 4.  Specific highlights are detailed below.
>>
>> Note:
>> Aurelien Jarno and Johannes Erdfelt have reported seeing ASPM errors
>> accessing NVMe drives when using earlier versions of this series.
>> The Kconfig files they used were very different from the RISC-V
>> default configuration.
>>
>> Aurelien has since reported the errors do not occur when using
>> defconfig.  Johannes has not reported back about this.
> 
> Unfortunately, while it is true with v4, this is not the case with v5
> anymore :(

That's too bad, but thank you for reporting it.

> Fundamentally in the generic designware driver, post_init (which is used
> to disable L1 support on the controller side) is called after starting
> the link. The comparison of the capabilities is done in
> pcie_aspm_cap_init when the link is up, which happens a tiny bit after
> starting it.
> 
> In practice with v4, the link is started, ASPM L1 is disabled and the
> link becomes up. With v5, the move of the code getting and enabling the
> regulator changed the timing, and ASPM L1 is now disabled on the
> controller 2-3 ms after the link is up, which is too late.

Yes in v4, we relied on the root port driver to enable the
regulator, but (on my system anyway) that happened too late,
*after* the PCIe controller driver held PERST# asserted for
100 msec.  PERST# is not supposed to be de-asserted until
power is known to be stable.  So v5 went back to having
the controller get the regulator in k1_pcie_probe().

I am supposed to receive the WD Blue SN570 on Wednesday, and
when I get that I'll have a chance to try to reproduce at
least one of these problems, and can ensure there are no
timing-related issues like this.

Thank you for your continued testing and feedback about this.

					-Alex

> I have added a call to pci_info to display the moment where ASPM is
> disabled. This is without the regulator change:
> 
> [    0.386730] spacemit-k1-pcie ca400000.pcie: host bridge /soc/pcie-bus/pcie@ca400000 ranges:
> [    0.386970] spacemit-k1-pcie ca800000.pcie: host bridge /soc/pcie-bus/pcie@ca800000 ranges:
> [    0.387017] spacemit-k1-pcie ca800000.pcie:       IO 0x00b7002000..0x00b7101fff -> 0x0000000000
> [    0.387047] spacemit-k1-pcie ca800000.pcie:      MEM 0x00a0000000..0x00afffffff -> 0x00a0000000
> [    0.387062] spacemit-k1-pcie ca800000.pcie:      MEM 0x00b0000000..0x00b6ffffff -> 0x00b0000000
> [    0.400109] spacemit-k1-pcie ca400000.pcie:       IO 0x009f002000..0x009f101fff -> 0x0000000000
> [    0.490101] spacemit-k1-pcie ca800000.pcie: iATU: unroll T, 8 ob, 8 ib, align 4K, limit 4G
> [    0.494195] spacemit-k1-pcie ca400000.pcie:      MEM 0x0090000000..0x009effffff -> 0x0090000000
> [    0.850344] spacemit-k1-pcie ca400000.pcie: iATU: unroll T, 8 ob, 8 ib, align 4K, limit 4G
> [    0.950133] spacemit-k1-pcie ca400000.pcie: PCIe Gen.1 x2 link up
> [    1.129988] spacemit-k1-pcie ca400000.pcie: PCI host bridge to bus 0000:00
> [    1.335482] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    1.340946] pci_bus 0000:00: root bus resource [io  0x100000-0x1fffff] (bus address [0x0000-0xfffff])
> [    1.350181] pci_bus 0000:00: root bus resource [mem 0x90000000-0x9effffff]
> [    1.358734] pci_bus 0000:00: resource 4 [io  0x100000-0x1fffff]
> [    1.362033] pci_bus 0000:00: resource 5 [mem 0x90000000-0x9effffff]
> [    1.368289] spacemit-k1-pcie ca400000.pcie: pcie_aspm_override_default_link_state
> [    1.375967] pci 0000:00:00.0: [1e5d:3003] type 01 class 0x060400 PCIe Root Port
> [    1.383043] pci 0000:00:00.0: BAR 0 [mem 0x00000000-0x000fffff]
> [    1.388927] pci 0000:00:00.0: BAR 1 [mem 0x00000000-0x000fffff]
> [    1.394826] pci 0000:00:00.0: PCI bridge to [bus 01-ff]
> [    1.400061] pci 0000:00:00.0:   bridge window [io  0x100000-0x100fff]
> [    1.406460] pci 0000:00:00.0:   bridge window [mem 0x00000000-0x000fffff]
> [    1.413245] pci 0000:00:00.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
> [    1.421012] pci 0000:00:00.0: supports D1
> [    1.424948] pci 0000:00:00.0: PME# supported from D0 D1 D3hot D3cold
> [    1.432718] pci 0000:01:00.0: [1987:5015] type 00 class 0x010802 PCIe Endpoint
> [    1.438698] pci 0000:01:00.0: BAR 0 [mem 0x00000000-0x00003fff 64bit]
> [    1.445426] pci 0000:01:00.0: 4.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s PCIe x2 link at 0000:00:00.0 (capable of 31.504 Gb/s with 8.0 GT/s PCIe x4 link)
> [    1.464897] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
> 
> And this is with the regulator change:
> 
> [    0.410796] spacemit-k1-pcie ca400000.pcie: host bridge /soc/pcie-bus/pcie@ca400000 ranges:
> [    0.410836] spacemit-k1-pcie ca800000.pcie: host bridge /soc/pcie-bus/pcie@ca800000 ranges:
> [    0.410889] spacemit-k1-pcie ca800000.pcie:       IO 0x00b7002000..0x00b7101fff -> 0x0000000000
> [    0.410917] spacemit-k1-pcie ca800000.pcie:      MEM 0x00a0000000..0x00afffffff -> 0x00a0000000
> [    0.410932] spacemit-k1-pcie ca800000.pcie:      MEM 0x00b0000000..0x00b6ffffff -> 0x00b0000000
> [    0.424651] spacemit-k1-pcie ca400000.pcie:       IO 0x009f002000..0x009f101fff -> 0x0000000000
> [    0.436446] spacemit-k1-pcie ca400000.pcie:      MEM 0x0090000000..0x009effffff -> 0x0090000000
> [    0.513897] spacemit-k1-pcie ca800000.pcie: iATU: unroll T, 8 ob, 8 ib, align 4K, limit 4G
> [    0.559595] spacemit-k1-pcie ca400000.pcie: iATU: unroll T, 8 ob, 8 ib, align 4K, limit 4G
> [    0.839412] spacemit-k1-pcie ca400000.pcie: PCIe Gen.1 x2 link up
> [    0.847078] spacemit-k1-pcie ca400000.pcie: PCI host bridge to bus 0000:00
> [    0.857600] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    0.868702] pci_bus 0000:00: root bus resource [io  0x100000-0x1fffff] (bus address [0x0000-0xfffff])
> [    1.146409] pci_bus 0000:00: root bus resource [mem 0x90000000-0x9effffff]
> [    1.373742] pci 0000:00:00.0: [1e5d:3003] type 01 class 0x060400 PCIe Root Port
> [    1.380963] pci 0000:00:00.0: BAR 0 [mem 0x00000000-0x000fffff]
> [    1.386883] pci 0000:00:00.0: BAR 1 [mem 0x00000000-0x000fffff]
> [    1.392808] pci 0000:00:00.0: PCI bridge to [bus 01-ff]
> [    1.395394] pci 0000:00:00.0:   bridge window [io  0x100000-0x100fff]
> [    1.401811] pci 0000:00:00.0:   bridge window [mem 0x00000000-0x000fffff]
> [    1.408583] pci 0000:00:00.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
> [    1.416354] pci 0000:00:00.0: supports D1
> [    1.420294] pci 0000:00:00.0: PME# supported from D0 D1 D3hot D3cold
> [    1.428220] pci 0000:01:00.0: [1987:5015] type 00 class 0x010802 PCIe Endpoint
> [    1.434034] pci 0000:01:00.0: BAR 0 [mem 0x00000000-0x00003fff 64bit]
> [    1.440772] pci 0000:01:00.0: 4.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s PCIe x2 link at 0000:00:00.0 (capable of 31.504 Gb/s with 8.0 GT/s PCIe x4 link)
> [    1.463390] pci 0000:01:00.0: pcie_aspm_override_default_link_state
> [    1.467000] pci 0000:01:00.0: ASPM: default states L1
> [    1.472093] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
> 
> Note how the line pcie_aspm_override_default_link_state arrives too
> late.
> 
> Regards
> Aurelien
> 

