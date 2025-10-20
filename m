Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6F1354AE6
	for <spacemit@lists.linux.dev>; Mon, 20 Oct 2025 02:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760925824; cv=none; b=nX0NygFmiBJFDRP76RwjEKLiDp1TrTmPRlVKW6JiJ/OCjWnwhEb9GMrDrZ16Tt6C2lP9K24ZpUETRTMDkyy/DRf8gxyYfFBe70zSQ4Fyaz+MsjzQyrvs16ikeAgjO7AtGXHIs2RGMpHuKCAZtCCo2NhiTGWtobfU2GkBqAi4wW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760925824; c=relaxed/simple;
	bh=bZpVhHp5/N6pg05JlUoGB10FHYF1j6tBORdhLrGRSxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XQNFBQRhSrtPt7OAsvHQmoVpJERmmj90Ix+G3tpNSsRSQJlnIHZS17jvejpV0zRhLr9VA54E1qiq+G/hV5wYFO00IWlQhv/A32cQXUPrGZHyt82tG2bI6x9XosMu0XWMD1TV8xqJgifouKvv28XWpG19xj+0GkjxIp8KbskoMDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=FmMMbrKm; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="FmMMbrKm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1760925737;
	bh=tDrZLdBW9vlAha4ObE832pRI4SlMcSGwYcFakX4Jvgg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=FmMMbrKmmKBkFkvp7wnkIfcXn3ZjXoyyj4ETMl6gk4cDjb/k3k69lhncQ30hJP32S
	 NpwHlQaRpKENFDF0MX4CGqE/C/+uKoO7B+uCVhjB36RTsMfnH9EmQwozFEDNFFqLIt
	 SzPCttSEwYXxHChMbF1fImYYhHmLpJ3++3NF/MO4=
X-QQ-mid: esmtpgz14t1760925726tab82be72
X-QQ-Originating-IP: JztUbLLiixmarjYZDA3tn8Rw/nWdOn2trEbtlH9vQgE=
Received: from = ( [14.123.254.135])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 20 Oct 2025 10:02:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14701641022016592372
EX-QQ-RecipientCnt: 14
Date: Mon, 20 Oct 2025 10:02:04 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] riscv: dts: spacemit: add MusePi Pro board device
 tree
Message-ID: <52A7E982E5B11F53+aPWYHMbImTxJy7pJ@kernel.org>
References: <20251017-k1-musepi-pro-dts-v3-0-40b05491699f@linux.spacemit.com>
 <20251017-k1-musepi-pro-dts-v3-2-40b05491699f@linux.spacemit.com>
 <20251020015204-GYF1506524@gentoo.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020015204-GYF1506524@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MWLCkAjnYYm52MwQO1MzuikG0zi5dnWMx7NRP0Pj21LqkNMMOi3FDnk2
	p03ikV/jo/UoZ1V42T7z0ld9ADHS8ZUjbbaHf6NYizd8XCD6UY0/PZHijUccCo8eOHXAWhe
	gSwxYHoNVjSUf32YZ7yHHuf1z0erKOXPn+8zS9A18hS7k62uj1nqZEXoPeZKCvsgAgr9V19
	84i5+Ra+mHUCNGzV44MqJs+uFwtUx2ExRn9fwaQZvtE+4iSP8nGdRF7r71T+D/xH0iZx6nn
	SbGQLDpgtQcZ5N5bnKvxZGE/atcXZFpZguGPjBK549UCibM9RnK59G9FO1KDg+yla3StXsS
	+Px4+L7c25rPnGWve7z2/mzXPfW1ushiR5MEWLFlfzSPxXa0i0US3Z4gFlyABGY/pOHOvah
	A4Q/WFhIKcDLqS9YflvK41lZM31Bgao2Lc0/4EG+chbLCrh2+w5cO6COgJ/WK/KvJWIaHuO
	7vfwun9VYWF0V2wspuX+m9DnQkx6rSb3V8YXRAZTkjtUuJH/RocnC6HTQScWo69kKM6jGeJ
	tEpNMM3IAyQE6+gSOWtOvxtzusNXQlewD/3LNhLAPu8stdPXmWUXhjJmLybj4KXhwwna6nM
	N70HiLsvYM3doYWvmHiQt3LYfOb4rKMRF1HBtm31BvQBmnmFlrlJPWQ7hrnOEgD/CEiAufH
	A3jYgtQOiUf3rkyudjyX++tfPIEwaTZfMNtJDAU/zhxlnyydK/WxKFjqMN+gPOfc7Mu3YCI
	P7RAUnt0MOnMdebfgthvBhXsWKjm047QmxIL9ToJmOMNkn2OS7xaro0Zy/FyY/nkxMDvuHa
	uo1qdMNnH1EIaq79q2K0ghlrBBqHIjtHmQPVMNu1GKjmZHKtQoehu9MsDpGbqoM3JuaLPCr
	tEq0oMCdlMpj6u+s7eM1ah1tEFM3ZgFJnhW9JTohGV+Zaf0+g9ScHjErim3CMwKC8JDqiqa
	yK+Ti/5pTNmimRWcNBVRz7wvZOh0leuDr4DWP1JeL0D0sUIDdsf98RiwsjAP+9YNMcsfjTY
	W/YAHInkzJvLpYq5BitcGOnBJEv2p3OCsjsbu8oxRUKBX2mv9ei9JvKqEPMhhtXUngHta0K
	C7tUiDW4pUA
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

Hi Yixun, thanks for your review.

On Mon, Oct 20, 2025 at 09:52:04AM +0800, Yixun Lan wrote:
> Hi Troy,
> 
> On 13:52 Fri 17 Oct     , Troy Mitchell wrote:
> > Add initial device tree support for the MusePi Pro board [1].
> > The board is using the SpacemiT K1/M1 SoC.
> > 
> > The device tree is adapted from the SpacemiT vendor tree [2].
> > 
> > Here's a refined list of its core features for consideration:
> >   - SoC: SpacemiT M1/K1, 8-core 64-bit RISC-V with 2.0 TOPS AI power.
> >          This suggests potential for light AI/ML workloads on-device.
> >   - Memory: LPDDR4X @ 2400MT/s, available in 8GB & 16GB options.
> >             Sufficient for various workloads.
> >   - Storage: Onboard eMMC 5.1 (64GB/128GB options). M.2 M-Key for NVMe
> >              SSD (2230 size), and a microSD slot (UHS-II) for expansion.
> >              Good variety for boot and data.
> >   - Display: HDMI 1.4 (1080P@60Hz) and 2-lane MIPI DSI FPC (1080P@60Hz).
> >              Standard display options.
> >   - Connectivity: Onboard Wi-Fi 6 & Bluetooth 5.2. A single Gigabit
> >                   Ethernet port (RJ45). Given the stated markets,
> >                   this should cover basic networking.
> >   - USB: 4x USB 3.0 Type-A (host) and 1x USB 2.0 Type-C (device/OTG).
> >          Decent host capabilities.
> >   - Expansion: Full-size miniPCIe slot for assorted modules
> >                (4G/5G, wireless etc.). A second M.2 M-Key (2230) for more
> >                general PCIe devices (SSD, PCIe-to-SATA, comm boards).
> >   - GPIO: Standard 40-pin GPIO interface, as expected for an SBC.
> >   - MIPI: Includes 1x 4-lane MIPI CSI FPC and 2x MIPI DSI FPC interfaces
> >           for cameras and displays.
> >   - Clock: Onboard RTC with battery support.
> I think you've already gave an overall description for MusePi board in
> patch [1/2] which is sufficient, in this patch you could better focus on
> what it actually done here? enabling mmc, ethernet, led, pdma, uart..
Yes, I'll remove these.

> 
> > 
> > This minimal device tree enables booting into a serial console with UART
> > output and a blinking LED.
> > 
> > Link: https://developer.spacemit.com/documentation?token=YJtdwnvvViPVcmkoPDpcvwfVnrh&type=pdf [1]
> > Link: https://gitee.com/bianbu-linux/linux-6.6/blob/k1-bl-v2.2.y/arch/riscv/boot/dts/spacemit/k1-x_MUSE-Pi-Pro.dts [2]
> > 
> ditto
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
[...]
> > +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> > @@ -0,0 +1,78 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
> ..
> > + * Copyright (C) 2025 Troy Mitchell <troy.mitchell@linux.spacemit.com>
> this isn't a big problem, but I think it would be better to use SpacemiT
> Corp's Copyright, to reflect you're not doing as individual contributor..
I understand. Since I originally wrote and now maintain this DTS,
would it still be acceptable to include my own copyright line along with SpacemiT’s?
Or company-only?

                                       - Troy
