Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B864034DB59
	for <spacemit@lists.linux.dev>; Wed,  8 Apr 2026 06:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775628429; cv=none; b=qqoLZQrxy1h8b/aR9F1I46EHV7mvojZ+UFL7L1AjOY1fX8HgnCqh1AajKxx35kcslhyYfI/oi5apLSg0Tv91pJgz+RNChzHE6Fp5ZztB4Nb9Bg5OxSLTDStNKqcbAWIWtV3l+pRRpG20gFVAOz8rOnVakrUi5p20BFSQ5iNml24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775628429; c=relaxed/simple;
	bh=S3QQXiRqjK1BHl+f95m4obDrrs2B8WCdGACzEmFEU90=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=ePMm2V2BIvJOjYzL035HH+PC8torIXLqwch1LKI/zcy7F1rYQa6bJc/cj7hbvWugQo1GJERgz3uG/B5f8hZ+JcwLz1UfOvLovq5yUVt4812LetStT7zAcvNHwn2FbghPBXC/M15kSy/ZLLhtQBnAbjbY6ixuR/bjLQ/1NdpbMaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=SxXBYudO; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="SxXBYudO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1775628415;
	bh=no1dg2bhGU2mzkCqgY19UTI25nEWspHV7sUY1GVTWhI=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=SxXBYudOYE0oLS47kABmhjvAWTHk2t8bu3UJgbBHvTC+jrYky5L4UUHmGQk1t6ZIo
	 6n8vgt35uyVDjkfqCrMhQPR8+FyHYCwwtzpSU7/xnVySOX2PECzLqvfO++vHx9KZmG
	 vgGEk1B83QU10TUqN8WO9DbvsY+jgZsKnCeW+LUY=
X-QQ-mid: zesmtpgz1t1775628413t4a8fe448
X-QQ-Originating-IP: QkEPQATJLhwf83tFudRqpareIp2YizfiakDOlTwdVtg=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 08 Apr 2026 14:06:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5636326700936019550
EX-QQ-RecipientCnt: 19
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 14:06:51 +0800
Message-Id: <DHNJQN4PPTH8.MEVXM2TL2MT7@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Yixun Lan"
 <dlan@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Emil Renner Berthing"
 <kernel@esmil.dk>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, "Michael
 Opdenacker" <michael.opdenacker@rootcommit.com>, "Guodong Xu"
 <guodong@riscstar.com>, "Hendrik Hamerlinck"
 <hendrik.hamerlinck@hammernet.be>, "Yangyu Chen" <cyy@cyyself.name>,
 <spacemit@lists.linux.dev>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] riscv: dts: spacemit: add DeepComputing FML13V05
 board device tree
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260407055557.1202713-1-sandie.cao@deepcomputing.io>
 <20260407055738.1202750-1-sandie.cao@deepcomputing.io>
In-Reply-To: <20260407055738.1202750-1-sandie.cao@deepcomputing.io>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: ONxAANmvJS6UvJv35o7ECvp1joAN3F8iZis02vIe9iyv8l8Mvs5HZ9c5
	X7pP2xlZ/So/V4B1P7BkqSWzA3PKMeUqyNKTRmbYy1PLH7kHcIaCTq2QVtVZ9jftkQPWv0C
	j7HYGzTpLzbo0uy/lTwm97OucccWfYt/6Qv07vWKVceTdF7g7cSYmqC444TsQdjaFBImJCU
	hAlCZB5ItC8HWhyl/gWXbw6pEy6d8Sh2aASy8h6N7FBscnSo8CnwJlAwqwAXmBjbjtL5+MW
	0//dROzyoOfqJT5t58ByFmjLKfY9Z7KZHG9DBTrMel+U4r/RD8kdSZSsMBlGnLR8BQ16Gop
	WaHJha5Z1gI+Cf5uehyKDTPgKEllTs2q6X/m514VelI5GZVMAOtz6+CxYBUlTBDyVFfjWl0
	5+ncSWbzh/n1kHxHSgUm2nEfWwdFDKDN6hPFzUxxV3u6DwKSB7N5+zbbLpRFsRyLHYvgFVH
	PN9qL1FBsD8DImkp8rQWOD1lFMQG15gWWcTXFvdmKPs48Vp2dlJRhDrEB+l/BckJeCgX35D
	O+SyeGnvrHbnCsUSYnf2WQDlcjfPjEwYK3iz2j2UpANHc54C3U6T+5EpPl07Kz3/mWR+bOt
	67b0cBgSLy6UgbIvXw1lEgWrrvHpWxSEBmciH2NyTU+zV3DRr3kf0eh3PD9CR/jBXavPxk7
	MbdMtRRyx9+BRFTKWJ/5Jcc5XxppXON5hDdvSV/t0A3cFjdrPSMDDBrn6onDU8HJjvF48aS
	IF6NMTkr5mi68RhKVeqeXEQRWPW8+cKjq1R41z2yUAugpkpTqkpBkrMtH80XCEZOOGp5yHd
	3q2/P2Du+CnLCNC4tcL8DsPLEGOYi5blF2FIrN3TrvN+KzYmGRuieo2Ij1WJ638PU6hdpYU
	T5B91SwXeX6lyrCqQhsjQSHKEsGyyyyimnyPs93TlqunOe1Owt4uYEn8iYqTfYWZFIdblTI
	F4Xp2s4KBztgI1ZHOEno5aIgPXeaIAoLyYClfjvKpYijFRpbMV54UMKmF++CNiCt8VR9XLp
	SgY9IRk6+Wsb8wMkGz1HHdgo0WOsJKHTQzDsEIo6zR52kELs291BJmzAG6EpScTa93OdwMR
	4KMp8vWIIYEo7hTCfKHzQTwGkv59b/FnY7in4Ik2jKKf5CX+OR7gc8fKYP5nIe8nQ==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

On Tue Apr 7, 2026 at 1:57 PM CST, Sandie Cao wrote:
> The FML13V05 board from DeepComputing incorporates a SpacemiT K3 RISC-V
> SoC.It is a mainboard designed for the Framework Laptop 13 Chassis,
> which has (Framework) SKU FRANHQ0001.
>
> The FML13V05 board features:
> - SpacemiT K3 RISC-V SoC
> - LPDDR5 16GB or 32GB
> - eMMC 32GB ~128GB (Optional)
> - UFS 3.1 256G (Optional)
> - QSPI Flash
> - MicroSD Slot
> - PCIe-based Wi-Fi
> - 4 USB-C Ports
>  - Port 1: PD 3.0 (65W Max), USB 3.2 Gen 1
>  - Port 2: PD 3.0 (65W Max), USB 3.2 Gen 1, DP 1.4 (4K@60Hz)
>  - Port 3 & 4: USB 3.2 Gen 1
>
> This minimal device tree enables booting into a serial console with UART
> output.
>
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> ---
>  arch/riscv/boot/dts/spacemit/Makefile         |  1 +
>  .../spacemit/k3-deepcomputing-fml13v05.dts    | 31 +++++++++++++++++++
>  2 files changed, 32 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v0=
5.dts
>
> diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/=
spacemit/Makefile
> index 7e2b87702571..acb993c452ba 100644
> --- a/arch/riscv/boot/dts/spacemit/Makefile
> +++ b/arch/riscv/boot/dts/spacemit/Makefile
> @@ -4,4 +4,5 @@ dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k1-milkv-jupiter.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k1-musepi-pro.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k1-orangepi-r2s.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k1-orangepi-rv2.dtb
> +dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k3-deepcomputing-fml13v05.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k3-pico-itx.dtb
> diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b=
/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> new file mode 100644
> index 000000000000..783066fc7ad7
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> @@ -0,0 +1,31 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2024 DeepComputing (HK) Limited
                    ^^^^
Just like Yixun said, it needs to cover this year.

                          - Troy
