Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636890;
	b=ECBNTP7BalkAi2GSLanZcbnj/LdHi8FekIuFe15X3kwnFKf+e27TtkWBlhsDhfl55h50
	 l161WAdGeUK1jDikFYQ7qWfspbDGG2ygsrHY/zTIr9WPUQzjNqhsv7Bx6E41NLEJXCWm6
	 spbKvVpGji8aVqpPDo+YmqF9pkXyt2Nps5NbB4h/B1VWt4tWvhpkCNtZ7gCaZDBLOCEQF
	 s5H+THEHyTysLnorJ9V55nzUA9OJ3oVq5Y0CE6dFVd46MI6hdtyo29nQ4Z/MZhMrjwS26
	 FXZnH27AbTsUMRyQ9yU2W7wtRWzPclCOw420a2zA9g2s7uvJku5ZqWTnCRbawuYsN4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=9JAGDrtifzK74DUHuN7Oz65oLu+qbPYKqrM5bSwvXzc=;
	b=BJaZ+m8ZAg0VFoRUA7O0u0wz0HxYyy4koQqatKY/aiKM1s5JprycE7wdKC+JY7GwATt4
	 zRQAuL6acgwqNwxMNCBdjtTJfkH6ILYRCJF/rmaxgDVhNRF95W6TlHzKudnCshvmT+WJx
	 t/w4CyIdZMohlNKygHWt+5lfijBJD8xufKVK0IRzB/ht+wT+cPPfxbb9d4sjBpN8rpExy
	 Pdj9RsQvTeyZQgnVcb+8OfDI4QevUtEnWGexrc1SaP6tSaOVmLFuuTzliNVsl+BNEVGJG
	 4bMqZSc8jXqZoIT7RMM6qmRXOGaY3XoVVLK239bgZmeD0zH3Y7xde9j7/LCNMVaS4ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N+2tWmd8;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB50606A32A
	for <spacemit@lists.linux.dev>; Wed, 25 Nov 2026 20:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFB50606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N+2tWmd8
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so53244715e9.1
        for <spacemit@lists.linux.dev>; Wed, 25 Nov 2026 12:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795636888; x=1796241688; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9JAGDrtifzK74DUHuN7Oz65oLu+qbPYKqrM5bSwvXzc=;
        b=N+2tWmd8Djtxu2mI6U/9SuMDcDU8DzyzPWFZ+MDCUhtnV9V/FE2DctyvMXm3URsllS
         ZQB/VmSukoPIOmPTAnsVag39ep/+TXKSAbha7X5AK5K6Z9Vd+rqjG0ZnPgvwhgXFyot7
         jkgOaVjUvfw5nKUu3Jy4cIEt/1951791XhMBf2ndjMSJm8i85YK5f/DFTQ7UecJU+g0D
         6Cr2b5j0MP4pRQSEVJYxXIxJLjd7K4OZADOk55VCtRW4ANPcnMTa3Nbzvrkffxh5YUOW
         czcpGai1YRSCrArLtvCCBX6dE4kH8EaKGpvj8SCjg3GYPj8BpvrIDYz4u1Cp+AbT2bbT
         GWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636888; x=1796241688;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9JAGDrtifzK74DUHuN7Oz65oLu+qbPYKqrM5bSwvXzc=;
        b=2zFjIMmc8hfhMGVwLSE0j+fYKroLT2LNz8+8I5L1RfxOldnApSxCJ4hMsaWD3ARm9/
         x04wyv4A+2jaz2Gw2r4/G7kDCWuL1XGDJkVM5ioLFxNAd4tij+DZX1xLyr/zgslqXllu
         0X4aRMFzZb/sN3Co0il0h4x4+U1HrD5ryJhBYlmGPSZfXtNV+PGQHEwJ5VXen9rWKtRU
         A3L4k0fdjY/RPmqsuH394EX6YSZyLrIWUz14MPKGUpqWKXt3f9Bz8cD6+ZqtF/s91bLu
         gCgZFJvFvgvjIBrM52qzPLs9qMPaLE0qz2SXCZ90S4/9aSA01JhAReOZXXafKwWx3LrT
         o7SA==
X-Forwarded-Encrypted: i=1; AL+hErEHoxjxH7MXLFJsLDbgVKo2ddklazlK/0O/xjZ+Z1H9F7laXpiT8XfbCdPMlaIdvtk3sEgmx0DdHg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9itqyFOtr/2sHy1Naq4k2CQ+TBQPdNRQo4VtcG2KHObtmg+x+M
	oGqoAsHjxmYWOSNJAq9e/HCh9xsNSoaYoy87x7ZlbFJnIKbnzkV2zg1L
X-Gm-Gg: AZFdTZebQXaef/fSs+6V7v72brlx1QpeqO812juklv5eYBZfdpnjYbqCqdoBxk+AJIJ
	iFh1O2zhAnqbaSwqtjOI1NUiUOW0J99w4FK/1YgYH3ledqjFuv0Vk/6i/74mVSMAYuu36dxNAwV
	wgph4WfVtdwDcKiNy8Zc29CZU7QoK5PT45CJdamzb1HuRQ4AXfQ7/VhthUmVkYhgI8uzm/1FjQ8
	WOwIWaRz6YlCcLfDiv20hthMAZexA9Kbse/IuNvO853JORblasDeNyPlNmo8NYLGQKojn7EfxQO
	pzAi27tM4YwgpnSvNC2Y6lAwKATGhh4Q86Y0bjoChP7IEJsfxnJBW+yNpTPZON1mKOsGy2W20n0
	1jQnn4XkwFDasUe8iakzHzrzIC43eg32QidMW6TvFWXCMl/X+dVDZeSp66j29KIjLgBep+Ttv1w
	xnQtrYD1hRXP0lBVqtrH5XcrwtEkZsEc70OtEqlO/thVASM1bCyrLwYfHOBTprBF7tvNcoXtKJW
	l4dALX2O/q7b4M34jEWVGRzNdBtsUcw8zfKEdg/AKJA+zVvZlqlgoHIhRraVj38Bre9NVkEpz5u
	vAbqLDwDFEd/TFtB7FB+KeWbAcoo+3xZAtT/YU4=
X-Received: by 2002:a05:600c:4504:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4bb887fc396mr389875865e9.3.1795636887762;
        Wed, 25 Nov 2026 12:01:27 -0800 (PST)
Received: from ?IPV6:2a02:560:4e7d:300::a1e? ([2a02:560:4e7d:300::a1e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm1001738825e9.4.2026.11.25.12.01.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 12:01:27 -0800 (PST)
Message-ID: <68a8dc53-9eca-412a-8098-3f69cd7ab95c@gmail.com>
Date: Wed, 25 Nov 2026 21:01:25 +0100
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andre Heider <a.heider@gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k1: fix the EEPROM page size
To: Anand Moon <linux.amoon@gmail.com>,
 Zixian Zeng <sycamoremoon376@gmail.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Junhui Liu
 <junhui.liu@pigmoral.tech>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20261123-fix-bpf3-eeprom-v1-1-df8cce6ef2b5@gmail.com>
 <awS2-clBenE1r1a1@aurel32.net>
 <12933da0-9bc8-4f92-96d4-36c5673d3f5e@gmail.com>
 <awXUSuYOUQMPCl-5@aurel32.net>
 <CANAwSgRf0XpWnyDaoiGySFv3NPKCBYn6BODf1M+P4w58BF-duw@mail.gmail.com>
 <CAKyUbwUyYptzZrMFKD-RjmufU7Wni8-w5vQvPyxUgx9BU++vsw@mail.gmail.com>
 <CANAwSgSNuEC72PM=1ai3xj31+=veLkDhAfuNJ3pmCggBtx9v-Q@mail.gmail.com>
Content-Language: de-DE, en-US
In-Reply-To: <CANAwSgSNuEC72PM=1ai3xj31+=veLkDhAfuNJ3pmCggBtx9v-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.11.26 3:21 PM, Anand Moon wrote:
>>> Apologies, this is a different issue.
>>>
>>> I am currently working on enabling multi-DTB support in U-Boot SPL
>>> for SpacemiT K1 boards.
>>>
>>> While investigating the board detection issue, I noticed that the EEPROM
>>> on my Banana Pi BPI-F3 does not contain a Product Name TLV entry.
>>>
>>> alarm@k1:~$ sudo hexdump -C /sys/bus/i2c/devices/2-0050/eeprom
>>> 00000000  54 6c 76 49 6e 66 6f 00  01 00 20 24 06 fe fe fe  |TlvInfo... $....|
>>> 00000010  d5 52 bd 2a 02 00 02 23  0c 39 38 61 39 63 33 61  |.R.*...#.98a9c3a|
>>> 00000020  32 62 64 34 37 fe 04 3b  e3 ff bd ff ff ff ff ff  |2bd47..;........|
>>> 00000030  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
>>> *
>>> 00000100
>>>
>>> Although the EEPROM is readable, the missing Product Name TLV entry
>>> explains why read_product_name() returns `-ENOENT` (-2), assuming the
>>> EEPROM read and validation succeed.
>>>
>>> Consequently, automatic board detection fails, and U-Boot falls back to
>>> CONFIG_DEFAULT_DEVICE_TREE, which may select an incorrect device
>>> tree for the target board.

I encountered the very same issue [0]. The BPI-CM6 doesn't have a product name in there either, so we just made one up and wrote it to make the detection work... [1].

I'd be surprised if the eeprom is write protected on any board, because the vendor uboot contains code to write a mac if there is none. And I've only seen fe:fe:fe... macs so far, which is the output of the code generating one (iirc, it's been a minute).

In case it helps, here's my collected notes about the topic:

musepipro: commit 6bc75cfa56e885c2eab80e215f0a610075505846
     TlvInfo Header:
        Id String:    TlvInfo
        Version:      1
        Total Length: 58
     TLV Name             Code Len Value
     -------------------- ---- --- -----
     Product Name         0x21  16 k1-x_MUSE-Pi-Pro
     Serial Number        0x23  17 BPMIMXXXXXXXXXXXX
     Unknown              0x41   1  0x02
     Base MAC Address     0x24   6 FE:FE:FE:XX:XX:XX
     MAC Addresses        0x2A   2 2
     CRC-32               0xFE   4 0x395ECD34
     Checksum is valid.

r2s: commit ac436e6879f5bf25e971d80f96f9392b61ff54c6
     TlvInfo Header:
        Id String:    TlvInfo
        Version:      1
        Total Length: 38
     TLV Name             Code Len Value
     -------------------- ---- --- -----
     Base MAC Address     0x24   6 .....
     MAC Addresses        0x2A   2 2
     Product Name         0x21  15 x1_orangepi-r2s
     Unknown              0x41   1  0x01
     CRC-32               0xFE   4 0xE5A74B18
     Checksum is valid.

cm6-io: https://github.com/openwrt/openwrt/pull/23231#issuecomment-5943699070
     TlvInfo Header:
        Id String:    TlvInfo
        Version:      1
        Total Length: 18
     TLV Name             Code Len Value
     -------------------- ---- --- -----
     Base MAC Address     0x24   6 FE:FE:FE:XX:XX:XX
     MAC Addresses        0x2A   2 2
     CRC-32               0xFE   4 0x9775FAA7
     Checksum is valid.

f3: https://github.com/openwrt/openwrt/pull/23231#issuecomment-6339373545
     TlvInfo Header:
        Id String:    TlvInfo
        Version:      1
        Total Length: 32
     TLV Name             Code Len Value
     -------------------- ---- --- -----
     Base MAC Address     0x24   6 FE:FE:FE:AD:18:9C
     MAC Addresses        0x2A   2 2
     Serial Number        0x23  12 0ca91c835b74
     CRC-32               0xFE   4 0x85C81AEE
     Checksum is valid.

     also: commit bfce75e2345fa1ecbf046e696994132f56d6db1c
         no product name

rv2: ?

milkv: commit 77156216f1d0f57e1cfce3452410db20468edca4
     only a product name

[0] https://lore.kernel.org/u-boot/d1a8bab8-4d88-48f2-9ddb-89e8c0e323b8@gmail.com/
[1] https://github.com/openwrt/openwrt/pull/23231#issuecomment-5972395785
