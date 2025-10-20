Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EFF1ACED7
	for <spacemit@lists.linux.dev>; Mon, 20 Oct 2025 01:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760925357; cv=none; b=LughqPnNsWhztB8vArnshuWOrzeJ7c1da/s9sk1H0DpHfnMB3ORGyOGvH3gqHVQqJkh/UMl7gfsnkavtMCmrYzpRpeuZ2+dMmNwmzCetw6qTjGcKAW0IquoemTdfjVpUhwENs8yaHXnHXpo3bigEVQQyCA4YsnGJHwWWBGSPj4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760925357; c=relaxed/simple;
	bh=E5CFjS+FLJA9VAM8OWnJP7UELXzDJdDIiwbZOT3J7Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QxWEuoUHisH3nwH6bRP4G31A+oUbAjufGfPMWrJ8pFdttIsHeLHs0MfKrSngFDacznrwawxHPM6CGgx313QpOpn+eHfvnRBcBSjdZEFvmhzknwRZiJCQOfMmRWBl5ynkrO6c2VWGiUzI6OePPkByGf1U0MLMXZL1FZuplbHs6sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=aJ4AS9pw; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="aJ4AS9pw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1760925265;
	bh=PHQXMd97MnTG8yBwsciGWWANd35WJk6gSCdTScCji0w=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=aJ4AS9pwBuiXB537LkuEvoXvY0bGJWhpkRWqJRLE9dyK0ElxNcNrHJNIg/sF/HdXY
	 S3Sz3xMze+jAixt1IqefTAmBngl0r1aeFgwtRiaC2XcAf/Rw8ve0tJyKRV3W02vRe1
	 19vzMAK4Cn7JBIbTdHIL4JKix/6TjBprrPOfMyKI=
X-QQ-mid: esmtpgz15t1760925263t112ed490
X-QQ-Originating-IP: ZuqEQVrvPyjcqO5ccy9yBkk58y5T6FF/58EnwbXksTs=
Received: from = ( [14.123.254.135])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 20 Oct 2025 09:54:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8184163125021412626
EX-QQ-RecipientCnt: 15
Date: Mon, 20 Oct 2025 09:54:21 +0800
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
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: riscv: spacemit: add MusePi Pro board
Message-ID: <D20EEBFFFF06649D+aPWWTSN4LByos8Qb@kernel.org>
References: <20251017-k1-musepi-pro-dts-v3-0-40b05491699f@linux.spacemit.com>
 <20251017-k1-musepi-pro-dts-v3-1-40b05491699f@linux.spacemit.com>
 <20251020014132-GYE1506524@gentoo.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020014132-GYE1506524@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NdOiMXD9pMVqCEhq2LH3/PewXrAaKXxAULAMoDu/2B3ljHKGwZqfdHGq
	nH/J+TIZBb8DG6sUQtoovS29nTeYY9IScsH/3gr4EjnVoE3UziLOuXmUYFQ7k+xthAVxBI7
	YkWMELQaCOgwxiuOgh9QPqXIskZmmL98kuxce9gJwlAioNxlESYQc5NvDs55RofU26dh1CK
	fTne64e5Q3igyeijaRStOVxzuMj9IOUa9oVQcn5t7LCAhpZn8r0n9m/e9DtLDbV2k8/1d17
	Eh6em43GApoYDvA92tYefwKgrz3hGxx0iOnSL/FuKRZuYFqfLWrTk5dT3reHTJSDhN/ZU4C
	erQTo82Be7ra4ZIhCOK1jBKrC7KQfJCyZ5WMMUMI8EznbVvez4jcHk0OOClRzztsatuNmbN
	dv3VEdHnv4SR8t+Y2+hul9Yu2VHi6eZMRgcwVt8uRQ8UIpaPizpWXR5mvm3UFgU/dKo9mpi
	/7HkMq2mdi1C5TNOMOGvPhHl1j+O+TzFlqO/uvItwR/TfVS0PakH9dY+QJwB2OZZ5zMvYhW
	l2mgbpRF5oKkp0cS+bmVLcR43OsekDF+jYPzhjZ99X0ZD+vTq1tjy09PNAh0yc6T4fZ7OXs
	Wv9jAAIfDo2qDGYMtY9xRGHsMLNvR6N4Zfut6ccAf0utkLylxcQrLNMWAEyiSPKF5/bin5D
	ID5V2lSTthiBD1xdeaqXChuOA4CNeJlNROsld0wxb9Irwzr4yiA+hrVB6/X/7AB5gAEKtoO
	inxbd2YP8yWyRntttE6e31i9grZeLYZIaoDD6cUCZcc15m5EcBXrPfKALRNp8QI7a9lDStP
	/UFgmP1qBQ11hVPbvI3XynCxwLQWGBSFRhS/5LB/1GoaoOtRM3u82VnwTERXJ1bk26bRKef
	hLHLppzO5Poej70q7ArA74ahdvYbIkKzhGdGL6cNrXi1Kuit7Pf5hQBDONkBFTabWLr5vLn
	BKc0QR2MhzrwG1PFIM+VbxEnfn2LpKz/U4lcFy2FKuj2F+YHTEPdtsoodsgaSw0BJ5rRbqZ
	fC8Jyp57BhHX4qlzg42M/Q6BhobdmuTlPAQkIED5O4eCWFZirY
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

On Mon, Oct 20, 2025 at 09:41:32AM +0800, Yixun Lan wrote:
> Hi Troy,
> 
> On 13:52 Fri 17 Oct     , Troy Mitchell wrote:
> > Document the compatible string for the MusePi Pro [1]. It is a 1.8-inch
> > single board computer based on the SpacemiT K1/M1 RISC-V SoC [2].
> > 
> > Here's a refined list of its core features for consideration:
> >   - SoC: SpacemiT M1/K1, 8-core 64-bit RISC-V with 2.0 TOPS AI power.
> ..
> >          This suggests potential for light AI/ML workloads on-device.
> drop these additional marketing info, just give neutral technical description
> >   - Memory: LPDDR4X @ 2400MT/s, available in 8GB & 16GB options.
> 
> ..
> >             Sufficient for various workloads.
> ditto
> >   - Storage: Onboard eMMC 5.1 (64GB/128GB options). M.2 M-Key for NVMe
> >              SSD (2230 size), and a microSD slot (UHS-II) for expansion.
> ..
> >              Good variety for boot and data.
> ditto
> >   - Display: HDMI 1.4 (1080P@60Hz) and 2-lane MIPI DSI FPC (1080P@60Hz).
> ..
> >              Standard display options.
> ditto, please check more bellow yourself..
> 
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
> > 
> > Link: https://developer.spacemit.com/documentation?token=YJtdwnvvViPVcmkoPDpcvwfVnrh&type=pdf [1]
> > Link: https://www.spacemit.com/en/key-stone-k1 [2]
> > 
> no blank line here

Thanks, I'll fix them in the next version.

                        - Troy
