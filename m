Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.243.244.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794057597;
	b=CalGIyE27AaiNz20fV7CY5rIljR3uQTJtkwrx2vTSxQpGBwdtiK9BsQ/2kYduVGSLXoy
	 qvMl/MB+K51I76ybldxh0lwIilRlFSI2Cb4WqvZMyGOV4LhHBlt2g3Ho1QTf4p9vl285q
	 xUPS3vjA30NslcLjB3nbITFWKs4b5jcs3bLUkIImj5cLQcxodgi+Bwa8tb+0InnibFJeK
	 Q5Pi6ISAQCqIswG16yqT/DTCFAhXUEjUygzlNwUzi/i9YImW9RJCix0rDKMNgOm5hncJW
	 gNCnbH4+SQZY7R5ZqWxXKXDflk2EZIIcwQC+3IsqwAIHdHBHCZ2F6TW7j37sv0yoXdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794057597;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=Vv1qxZPlk0vkh8L3xJUWyUVlD4vXJ4Gcl2ZuiOio4dw=;
	b=AEYYbQpSmyvJJNxMUECHTJiRX+ui286aDKjCWzHDRTUupWnjDn4YGdI1A4rLkQXmJffY
	 KWoN3/sI7sj3hGsvFMUd6OFFjNtG1WZGL0Wg4i5T2oJpukHy/0ot2NwaGtu7hv93u2Fgf
	 5pFZe7Z5obkaAMmSBJFz3NFP+9o/qj88l70p7gfk81MszsfF3EaxuZPmR5UJZI+L13tfL
	 yfd6tZFhj6Q9anppqlGmrdlFsGQSXtY1S5Q4emSDf5ap6K8P0KAvsJRMSiOF1BUqqXUJu
	 2ZRKfjk5HfI2DURjpXSiXl+caDhmAwwPPth7mJcODtBBe1UiwXF3bElSJRxb6NnSJ+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=CYldCipq;
	arc=none smtp.remote-ip=54.243.244.52
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54359606A32F
	for <spacemit@lists.linux.dev>; Sat,  7 Nov 2026 13:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54359606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=CYldCipq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794057586;
	bh=Vv1qxZPlk0vkh8L3xJUWyUVlD4vXJ4Gcl2ZuiOio4dw=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=CYldCipq5BagZLXme6wuPePkCbHZaFQx6CDcKEdW3CR4GoNL/AHcndA1sl2gxuRe5
	 NJ1VEzr7H45Me1JjNlboBfvsFVZoD2cZB+MHP7MXQlBIfzmyTaqVhQ1sPOA91VOdbO
	 wj59PrxeUrFQcEH9SIbPo759rX5u7NxVELeGaA9E=
X-QQ-mid: zesmtpsz2t1794057585t8b0d7424
X-QQ-Originating-IP: MnVFJSGk3Q8VFD+XQqbWfmBpJkYvSe1EFIeqkTdJt6o=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 07 Nov 2026 21:19:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9492300081805224949
EX-QQ-RecipientCnt: 14
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
 boundary=cd90495969691536a859394151b1932e9ba645d5efb1309eed502dd53e7b;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sat, 07 Nov 2026 13:19:39 +0000
Message-Id: <DMP0C29S8OJL.3SBBFOOCLLE1K@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/5] riscv: dts: spacemit: k3-com260: Add SPI NOR flash
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sarah Emery" <sarah.emery@canonical.com>
In-Reply-To: <DMOZO92UHE9L.2PC9QE72225NX@linux.spacemit.com>
References: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
 <20261105-k3-com260-module-sd-nor-mac-v1-3-138b39d74602@linux.spacemit.com>
 <79211469-cf77-414c-9a10-2b684833ad64@canonical.com>
 <DMOZO92UHE9L.2PC9QE72225NX@linux.spacemit.com>
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M4rL4XrBLbwKcgXYdAzZ7Fj6FVw1625bw40kZxg7X4sx8Glm5iKgFLbu
	JRv02fxx+nleACDZUEeAsmaIbfB5o0fJzIUJ8MqBoPk65EYJ7ErruHTZYR3rt1I+uKhLLyg
	NmLKva/uKBCJQ4IeyxhaGzPqopPfs+65b3mutcVidU5/Zk3NhKk+U5iMvAf599HR+ySpPtW
	q8lluW8WAhpSN0S0W521eyH01fsuBeQSQIGkb4VN5Mvv5j+BTlJEgzZUXs/Mx+BCYzQJHek
	T5B7NjAWfg9SmpV76YFHk5l3bv3zKyFcBLc3VJ8GqKH6fLrEk1rk2CzthS+62ZrWkLI3k2f
	OSfIwNIzaqdrtAx+J6BVp2P1YL/xTh1I8Wry00tN0bxFJormasLMnFV3ZWK3bEUe2iTpNxM
	eLiI/5Zt1x352uEydV24id6CieljO4T61HaVGcZ2tGMhXHtOXaM3eQCEbm4xAnBUKJDH9q3
	vbVtpjdkZWtkZWKEDAqCr00KFyrySyEDXgkNKPd1r8fAzFXy7BED7jQTpy4rU46tmn3o+ST
	MxlJRBI5vUD8d5WK3D52Q+rnwCjMPUqrFvCyYra3JCNYBd2T6bbLHup/ZVjg+Sacg3dLZV+
	OgpEyn/n5NSfwtz/S7Rvf88LRMncaSF1h9SuUPUpLBg9DrqTXflXkeiEk4JLbh5nJ8L191d
	N5utkRoVK6xJyHGYcdG8IwPKr4338sEpFeCKbEgZ0GsKrn2NVF+VHdXriFcBDc76up/i35F
	kXz/yK+ae0x8yG9dvdrhHXbS3QfWZEi0ueOq6QNyXWfz6e66fyeMtNB2tuX/olM6+fcEUXV
	SgXoza3IOdSKbyMd7J+aTx6qmGvUMvkKhD++GffcI5edcGmhIKKBGhaxyntRIk6B1KeWsEc
	zeLQKd4ich+tM43zBbvMR0NzFuseQH7ZzmJlSOMtzfVh7e28ZJRFkBfsZDFjb5hu3R6ioJr
	wcv4E/cUq+ATOPb7x0KZXfOkVG+so55BNDwOF3R3/rcurVeGo8XpbCxeefLyuAQL2drHYpT
	RaKLzpU98JXxf7Qm5Atwros0YfXsCWlYGel/V8NQ6OWEjCcYxAAyxPckHGJUzQCvr6cu7MO
	/ig7WIwhGlVWBmqMV/AqLc=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

--cd90495969691536a859394151b1932e9ba645d5efb1309eed502dd53e7b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat, 07 Nov 2026 12:48:33 +0000, Troy Mitchell wrote:
> On Fri, 6 Nov 2026 17:25:48 +0100, Sarah Emery wrote:
> > > +			uboot@210000 {
> > > +				reg =3D <0x210000 0x5f0000>;
> > > +			};
> >
> > This partition ends at 0x800000. On the CoM260 with EDK2,
> > 0x700000 to 0x7c0000 holds the variable store (NVRAM and FTW), so
> > reflashing this partition from Linux would erase it.
> >
> > I think we could split it like this:
> >
> >     uboot@210000 {
> >        reg =3D <0x210000 0x4f0000>;
> >     };
> >
> >     var@700000 {
> >        reg =3D <0x700000 0xc0000>;
> >        read-only;
> >     };
> >
> > What do you think?
>
> The layout here is the one used by the SpacemiT boot firmware for K3,
> where U-Boot owns everything from 0x210000 to the end of the flash.
> The EDK2 that SpacemiT ships for K3 (including the CoM260
> configurations) keeps its variables in memory and does not use the
> flash for them, so it has nothing at 0x700000.
>
> Which EDK2 build places the variable store at 0x700000?
Sorry, I checked an outdated EDK2 tree. The current SpacemiT EDK2 for
K3 does store the variables in flash, in a separate region pinned at
0x700000 with size 0xc0000, and the firmware image itself goes at
0x210000. So you are right, and I'll split the partition the way you
suggested in v2.

> > The Pico-ITX node also uses 0x5f0000, but I think it should be
> > modified to split out the var part too if it makes sense here.
>
> Same answer as above.
For Pico-ITX, the same layout applies, so its DTS should get the same
split in a separate patch.

--=20
Troy Mitchell

--cd90495969691536a859394151b1932e9ba645d5efb1309eed502dd53e7b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCau8layEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC8mjAEAgs2JcthFsP1D
X0CRVNci79azmcIjmw43lI/q3Mp1We4BAJiF7dDYWSszpFNzPWE068epMe+unJfn
VBoMajSNo8cN
=FnAV
-----END PGP SIGNATURE-----

--cd90495969691536a859394151b1932e9ba645d5efb1309eed502dd53e7b--
