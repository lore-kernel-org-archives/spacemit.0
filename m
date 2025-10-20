Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4ECC194C86
	for <spacemit@lists.linux.dev>; Mon, 20 Oct 2025 02:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760926953; cv=none; b=GaE5NiGOTpEa1oLj0+HusRReHERI4AM3WfMORXBKAFxlr+Es0LGQWof9OxI46vLbWyC+sTQ2uBQwl2nPr5BeaGtEWtravVgRWSnRpS3bEAHQWu1Vbh/nSDVNEkkBr9Cr+BnZtXZUPL+2ZONsO5Zc23f1yiJdpgFt0mQ2Y5GBOek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760926953; c=relaxed/simple;
	bh=BIa5EgOPw4ajYBRbLnJWbtkALVb5ei1vgmx+sAXuj9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ruR0XwIxTsxvtX1QHX13SE/e+FW4sEyW3HBQSxNwGwkdEMZNOVXMWr/GG2xOZQJ33EEisA4NkprB0FIJoK6lZzNz5X52AFJzKShxleoo6bpQRsqFX9ta49QsBcAUyveRYyU/ZDZmfZlETx++1vGg0tRmrHztQFZTNsLN8hR2zpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=q9vXr2nZ; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="q9vXr2nZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1760926855;
	bh=bsEnjHoM06iVNxKJujvN5KqKt3gikmfLFHIz5VO2vUY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=q9vXr2nZzwyf1HaUynq2ukl7+FQF4ejUeQm/Ikn7LPDaYw1hxLTEx2YYRTzH71oNo
	 wXfAmaWUOGk6A/FdfymCczElyreI7lGvdPB62BWrm1idhN7j+b//OGgoeCB6kHGFT9
	 LKAKP68ybQMKtuZj1kmF3h/VE9AtxlWLOd/wvawQ=
X-QQ-mid: zesmtpsz4t1760926846tf33a5c17
X-QQ-Originating-IP: 34Afq1jEbXgyQF21XpjRvyPm0b5xHTb1ciTJuNmoGVM=
Received: from = ( [14.123.254.135])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 20 Oct 2025 10:20:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11458405615915761153
EX-QQ-RecipientCnt: 14
Date: Mon, 20 Oct 2025 10:20:44 +0800
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
Message-ID: <28DCD6FACACACFCE+aPWcfFSvEsFfw4AD@kernel.org>
References: <20251017-k1-musepi-pro-dts-v3-0-40b05491699f@linux.spacemit.com>
 <20251017-k1-musepi-pro-dts-v3-2-40b05491699f@linux.spacemit.com>
 <20251020015204-GYF1506524@gentoo.org>
 <52A7E982E5B11F53+aPWYHMbImTxJy7pJ@kernel.org>
 <20251020021846-GYG1506524@gentoo.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020021846-GYG1506524@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OQhZ3T0tjf0aflwSfNotEEsE5cmD2yfFFm5SnUpoY11nFjNaIhRuFsoY
	zLszG50LpQVw5oNu/r/3opa6eVYYx0V1zGFn96opRDgM5FfEsDWgxFEPZWXCk3+/8mhZu5P
	RCaaJRZ+GEyKLkhw/TW7Wc+VjyxsKN/ONcBo3DL/RWSnFQd/UmejnLsoq4/q4UKNJkI80Xj
	hCyG8rpi3Y13btPU870Z58Q59xOnGf6A2TVfLbKMJvpx/BKXmLhCoySKSU/nhNW6tUyNYZe
	PyEkKveuudMLZ0bSOTExW1llvLMLYa+Ao/Qs8rI5FfaPFSSyyWbW6Nkb6XelNVBZ6+kPvKd
	f3+oiIQT9j2BCO+zCPOGeVL12oPovyxHU/9YcDJf1gqMfG6yadugZxdPHW1zUESRvo08f/X
	lm87ooGlFKtBNp8pvFg0Gooootkg7L4fe79sQ9Kboei8c8Rk5+9Xxe7Se2jPDiJRb8P8I4t
	hw+vbMYrFO+LDToXK+h2HqO5ZF3pqTIkHk9TXvsAN6ZD6NdbFKhy7L6LC0nfZn137MyP4d1
	xN/5LUh3/2o60kVaUMWLXxLk0kcVcqkRBqy9NorWEbzEIkRLizB9b6Zr3eSABgbKwNRPbOr
	RslENobjimSWo3gYYwcSLEBjb++0BzArwyevbHE4G6dCaQyl2wEovPawgbN8ROHXWwozqqo
	JOFSPdg4ANCzYHN6W0xQszuZEmJCQpdXXdTwYwWwJMrrwHjhxYE/uJzIxFeerzdc5Tu9X/G
	3Uqw5bfplLA+eqzOiUHNEGVUH8WUXTPQsuzVZ7TjEb9vxDcxHMd3dRLAQC0X2pVQUgjPrpn
	Q28vbGEoS7Qsm+RNApbhOF5DJuQyhKqMWbASH6rYO6WANkv2ay6b5nWXzoyNyZE7+7QWIG/
	HC00eFzaMdf6+r4jtUG+FAVycdlzMZR7tXna1vGncnblW1rW8GvMvJIn+ez7R6d/04P8+qj
	+YDlPq1LSvLX8xULLu33+vglOa5PErphcCu+C5gAadzpwRQE190EIa3kbo8qvr79QY58+ui
	yPE8ulLwjRn4jtj7hTx2VzlihpWVa5xFGpdmPi40mHHVrTIRQ2n6tAVUJTrR/XusByjtkuc
	KiCgeCcPLORZof4d66Zi64l1O3OzKCsOw==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

On Mon, Oct 20, 2025 at 10:18:46AM +0800, Yixun Lan wrote:
> Hi Troy,
> On 10:02 Mon 20 Oct     , Troy Mitchell wrote:
> > > > +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> > > > @@ -0,0 +1,78 @@
> > > > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > > > +/*
> > > > + * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
> > > ..
> > > > + * Copyright (C) 2025 Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > > this isn't a big problem, but I think it would be better to use SpacemiT
> > > Corp's Copyright, to reflect you're not doing as individual contributor..
> > I understand. Since I originally wrote and now maintain this DTS,
> ..
> > would it still be acceptable to include my own copyright line along with SpacemiT’s?
> I think this is good
Thanks for your confirmatioin. I will update the copyright line.

                    - Troy
> 
> -- 
> Yixun Lan (dlan)
> 
