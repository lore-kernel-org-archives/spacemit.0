Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.16.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793936383;
	b=OG+PmRCMCOMrNnQ4NMB8HxAiCuk8tvSVtdAMUREcUjWnckziDXysxc4EM/lm+OWl4N8q
	 02/xYlMonJTgYvx3T5Qc3mY1EhAO1q5i0sUqDlEmTZ8pe46yXzxMB611fV0DC5HOElcg2
	 zRBdGL71zWq8mHv4vEBckpl5eUONsrhfS88p8FHLzCl7/eSLOz5b8cn87MX3ewFNjTDMz
	 1vHe0qnCBSEggSH/WV6sDxIm5VaX2QMuj6IOb+w4aqGpO0FUdtg7uGiOIdbEpYoGuWIrx
	 hcVR0QdVRToPKgQ+9Ho5sexcGnD9eP3UhfNhN1bC3G1zFdZEUIaoEjOavbH59ICLvJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793936383;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=YWjCVMH6QOR8U1HdP5g2Ap2iHKmTUMycrvWqvC+OZSg=;
	b=LlX374RJ5KS2xvSC/4mTt1jymcetAI4L38K0M3HRXUCpJ8AEmL2x3jyE7QtpON6H1Q2q
	 cSu7KpKV79YrWZPL2pq5wYD+rwDQ1EN+b6flx7osV1iL3jx7/6PcS1GFDLFOK5WIQcAh0
	 hdW7rjgHmbnCyxg+UzpeB3U+KrK5EkyMAQUdHgQEDWNyw5bByrTzVVANLRtklkj2y0QAs
	 uwLk1sd+w22rPKD1pPoHfZ6/qS7n230A0gK8kHKMtq1QPpOcMgj/F3ZAXl0VZgizO5IxN
	 lYBfPeqTzJZ7F8ZNaVl3rCcUGBbKWFBPX5lpHcxLwIB7C6PWRkuXZJr/EVTBDwnt5jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=NdgnQtfW;
	arc=none smtp.remote-ip=54.206.16.166
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF85606A31B
	for <spacemit@lists.linux.dev>; Fri,  6 Nov 2026 03:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AF85606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=NdgnQtfW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793936358;
	bh=YWjCVMH6QOR8U1HdP5g2Ap2iHKmTUMycrvWqvC+OZSg=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=NdgnQtfWQTdDDLxkFVmyZenAyc2QFWutEtKY0BPTYdVsReEfuLs6n6HfLluLvXXlF
	 2pJUBmMf1oyVBznkOa4Xwuld6C7+vfbTQBhDrNNOH2Gi5VxUUxExHJfcaEAfXXJree
	 G95gYU4uFb6TEW6BRxQSSOpLKKGcnX5Vu0N4N6Ec=
X-QQ-mid: esmtpgz13t1793936357t36e91489
X-QQ-Originating-IP: C3yEeWDAIm4PyjGi5UJr3LByUX02//lzDscXXGL1zXk=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 06 Nov 2026 11:39:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9883087005053734820
EX-QQ-RecipientCnt: 16
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=fa641b20d767eb6dfceae802e81e79246e3b4039a9ed52a8760cf69df47f;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 06 Nov 2026 03:39:13 +0000
Message-Id: <DMNTD3S9CNW1.1H4CMNHDJM69D@linux.spacemit.com>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add K3 BS01DCMA support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Emil Renner Berthing" <emil.renner.berthing@canonical.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Guodong
 Xu" <docular.xu@gmail.com>, "Yangyu Chen" <cyy@cyyself.name>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
In-Reply-To: <CAJM55Z9nuO3MneQqBm3K2V2SjOXqXsZcDx9pMzVhxMJJ73xc9Q@mail.gmail.com>
References: <20261104-k3-bs01dcma-v1-0-794025247e4a@linux.spacemit.com>
 <20261104-k3-bs01dcma-v1-2-794025247e4a@linux.spacemit.com>
 <CAJM55Z9Yj87hqwMugqRsf_RL9np=KqzCj-J9RyutuWKd-w-n+g@mail.gmail.com>
 <CAJM55Z9nuO3MneQqBm3K2V2SjOXqXsZcDx9pMzVhxMJJ73xc9Q@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NHLGb615Ee/ro7mEPxFyPT/euJjKyX5DrkSw9FAZqTBtDcM7sc8I3DMu
	AE1/DV7bgQpR3g++m0bMtvu6v5lFl4fUFHssGtqnaRtVWEPfOJmIQIbc7y25gSDrSYE+VUf
	Og9huuxlj/WC9a51hQaiowE6fqHYA6S/tVQxiZvDclUWoIDM9hO12Y/Q0P4G1Yz7/6tX6jf
	a96E7bRck+x3YLEL+Cpz0s/RcI6uyqKR4sIS1T+2+9OHY5FSJG5nYZMfmYrmmIrkF1YROAS
	JOsRH3kOt9/OUoYaGVtg+69G0xWCvfJ19ZN+gDELXlr/MIyawGe887xvX7u+Bu4y3BJN5Be
	z07ST+UrPOm4mqMxc0PyQjJ9t+zcN4idxYDmm/BGRHInolOk4SECT5I9mfflhu7fKq5xzzp
	IlIvkbBTFKCv42ZLKy26e0OHEAOaSpER5nV9JfrDIvaeCXbXecTmUHX73lFy70p7j2ve01h
	lDahcqtREuEmqhPLR0CXfOOy3dETqG5c8M7IYl6tLo4ywobQJvdQoP+LylwFR6ib/P5urL6
	LSJ2TNFTnXFeZ9dLKZBEJAENtoKCJZWQVFxdy6kycF4OZ4X7A6aECBH5xhUqnFSLq36lqMA
	RQUKp0k+1MEyEFQcfoUKNrbtJXZQ36w645+5hjwVDFIMhmFfWaKRA3/BgNMKhbrOxm2fXuP
	CDsF7BlSOOFGdBxwz/yWa8IViHeGa1OsfWtPeyOBQ5EZ7wJBeChJWDIjLjYgdQpg6KFX7lX
	fwx2f1DfnRyY/eb3km4ujzEv7P5d83YdFW4NhTbfIdy3FfOcNfc76sPZdcZ+5uN9k3OtUM8
	PcJ9Znd0RSgjp73sRw83Qz62e7IovqUzKxfa7iXlTSPFrhi8EesdakRXEqwLiYV5XYQN63I
	JEIi1w24BKZaOnnRpC6u9N9V20VmJUDVA7WuTrbEGWHhIGADoyp5RhNXYsdVA+zA5Hs1iIb
	fIVfbZTspW6BS+G85P8v/RQBxDABOK8hHlRWrJEjZ7V1Ok+2N01vxEZAqTEScO2E2jB0ZZ8
	IO74eqMeF/EaGPt0Fh34frBhaVbAaZIVm7NRZRQzKWVVR24mwJTILTUXkYW8xexVbxcJ/Qf
	rnO/VQhm4CGC0P5z/OL0yQEx/cGw/DyF+Jauoj9nWpd/b1bDFrjtd0=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

--fa641b20d767eb6dfceae802e81e79246e3b4039a9ed52a8760cf69df47f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed, 4 Nov 2026 07:43:03 -0500, Emil Renner Berthing wrote:
> > I just had a talk with Dong from Spacemit. He tells me the
> > BS01DCMA is the name of a module similar to the com260, only it has
> > a different form factor and each module consists of 2 separate K3
> > nodes. Similar to how the com260 module can be used in a small
> > carrier board (spacemit,k3-com260-ifx) and in a 10-node server
> > (spacemit,k3-com260-tq), I'd expect to see a
> > common arch/riscv/boot/dts/spacemit/k3-bs01dcma.dtsi describing the
> > module itself, and then an
> > arch/riscv/boot/dts/spacemit/k3-bs01dcma-<something>.dts that
> > describes the extra peripherals that can be accessed when the module
> > is plugged into the server.
> >
> > [...]
>
> Ah, it's called the Cluster Server RV2768
> https://spacemit.com/community/development-kit/cluster-server-rv2768

Hi Emil,

I've checked with our hardware team. BS01DCMA is indeed a module, so
the "board" wording in this series is wrong and I'll fix it in the next
version.

I'd still like to keep a single k3-bs01dcma.dts though. The module is
only used in the RV2768, and that carrier is essentially just cabling
to PCIe network cards. Those are found by enumeration and there's
nothing else on it for the K3 to control, so a
k3-bs01dcma-rv2768.dts would have nothing to describe.

Does that work for you?

--=20
Troy Mitchell

--fa641b20d767eb6dfceae802e81e79246e3b4039a9ed52a8760cf69df47f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCau1L4SEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC8bHwEA/wJFXrKpYftH
FB5kzcPBx6DamUD5F+4zMd1bZudAqVUBAKPNyObrwunkgozWj9HWqQMnkYJyk6XD
Wmy765878T8H
=dLV/
-----END PGP SIGNATURE-----

--fa641b20d767eb6dfceae802e81e79246e3b4039a9ed52a8760cf69df47f--
