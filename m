Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.19.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794206339;
	b=jEzL2BNehBEiPWaYEBNoUcZAfjwsCuRbQfEDk3d0dsLBFA4rLZYb43imy4NSHXp9IzDA
	 D6bALSIhJzgNLDpoWtEMM458fHT4PL8vD4SWJMXKe7uX/3Pn9YkY07g9izrW1C/KkM3z5
	 3itVJDLF/0FqIoZxVh4CteL0mPt6NQYrvanqCcx8FxaWDZDF0LrTJJDKqwX4nzZU+MMjQ
	 SsjVcXqOGu8t6iBqYsLiwsOIiPMdC6rF2GKP7pCF2FM2DqypImKLpmiIau0Qz7TeQNbSw
	 VshalyiLYDZ7ajEdFluxHVXRbwBMqc80BSxXklviho4188JDZ1OXuVEPKabpykwyILg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794206339;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:X-Mailer:References:
	 In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=CR3tvAfi/vhuKX2kubcVJ3VNLkta73TBFdrMFqobo34=;
	b=GOpPvBPovqTf7T3tWIomcZIlmK6jKiV0Af6NLrWhfrEcxz3swHrWBzDr/TBITuyWwFmF
	 xnPNKTqUN/IGWUt1rvrpVzAS7pBZxG57SbduDTfSEcdAGJcuxIs4Hkb+N5q7QdrD3EKml
	 m/q80qyuWFRZ/U//dANtHKuDXSvnoEvsxqqLL2rGIiklSb8bjFS6Qqewc4GPcDLjFy0Nu
	 wH1FhdRJNaJvmcPaqxp0aE8cLNQdN8yDQw/VjisEMort2UmaQNwDNs1YYXUee/wtXI9At
	 qkQYCBIlIctleGQoDR9ODFwGjgBhJFfiT9TQEJnzEWYoYL7vj0+Sbv8bdwsAiUZiQ6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=tNUoeoqN;
	arc=none smtp.remote-ip=54.207.19.206
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645A6606A31C
	for <spacemit@lists.linux.dev>; Mon,  9 Nov 2026 06:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 645A6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=tNUoeoqN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794206287;
	bh=CR3tvAfi/vhuKX2kubcVJ3VNLkta73TBFdrMFqobo34=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=tNUoeoqNa4wA9S9m4DBhVEGO5Cpv558U6ybNvQ0TQzFl7XXVHvCc1nmfmy9I9WlnG
	 M+HsP60llAOcGqLthINaxrlJCQNwAV/R83zWhVvChmHpdipYQcqpwWgkC9zGNLgBHb
	 AlESYVbztRdVcRdxWz8L3bEQ8hoKnjBFs3WBKxKM=
X-QQ-mid: zesmtpgz9t1794206285t825dde49
X-QQ-Originating-IP: IwUfJm6QB9d8NP+i4b6UrZEEoyyhvenPAmFqfQ3k46w=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 09 Nov 2026 14:38:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15929030815488421648
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
 boundary=a45515cc26bb2c3e16f7ddb138529dcefe17028f2f8a02fc6d43a5237aa2;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 09 Nov 2026 06:38:02 +0000
Message-Id: <DMQH1N9VV1IY.2Q1NMMIKR2MIN@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Yixun Lan"
 <dlan@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 add P1 PMIC regulator tree
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io>
 <20261109033240.361416-1-sandie.cao@deepcomputing.io>
In-Reply-To: <20261109033240.361416-1-sandie.cao@deepcomputing.io>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NSHCtT0FCjNonoUS38tup7qoV7fkZLU4pU9zA2YNDpCpPph1p4IGfk8z
	VfNYiSjWB9BuK/wb16J2gXqNhWGcGDEBu0bzyEMkZhyzNWzzlgzUE4TPZVr/W7kxEb3s8Oj
	hD9RPNou+7en59iP6vGNpY4Oyf/EMV4+lF23rBqSOLXZzD4epYoNqhN3NWrQz747OYl6NaD
	Vc+ryZkmP2mD7C56lMmzKHXCwRuIYnm/gnM5Q9ASwv8thhK75RDxtbnJsJ8iYP9TUhKvpz4
	P8iolNnCEG0lJi1TzUJ+0OS9wFONTqMZatJsZwePeJ2GC9xq4C3yfPO2qXzGx/35Y+mncpn
	KjIFySMiax5YXgwEl6Anig6joTK8EKXu07pbq2GLnhEka3zlUE/FgciQEyypd02de3frakG
	jDorUBxI4SuoCe+HRw0qjwrluJsxTlZ6oZIs/X6DIsApVcSVfhVKsAcFbr8lYMvSBnkbe/r
	RFdISNni4sgw+6Kxjn3EvgMKhAYof7RS8WVnnEmIB5L6jv2/97YeYeZxb625uPCNSj7ayet
	TzibmdJ2d4vB11uEolR6uSQ1dZ6peIw3p3lRSFl1yrea/YSQEiY8WRDc/X1+Pu/PMq6o9Rh
	8wKBhaG5gNhWgRhvucsaoEwGpe4YZCzI84pThNhSuskcXT6++3JVbZF/huNc/oG2yBOtzBy
	W0B4VqTVwrTUB/p+0i0l5dxig8IQJnPmiI/YPlQX5GYsdEkRdOdtCOuy2XwDbI1WE2KnVC9
	GGC26Q3g8UTxDrvszHYgONSmem1/io8ycg0av1nb6YeiL7V8z48vH8QtmD/GGQN9VMBGUIi
	otRR4qYJjn/ea0YaB6QVfYzaiY6NDK3fkUsx44KpSo6gd9j23QjI6auR3TxFND1uBm9shhn
	MYoc3lIRtMrkGbo8b9evmbIFn3CYfLflKlN0Q404lnKdEPEXcbf7fIzqNsJeK6XsJfPAA4V
	jbg91SgdR5zCH45W4LavaS4WTpsVSI3ks4mi7C5JvmkKsGamcYKttSv7zZMhGNry4mCp73A
	acyUjh2oJjBiNsgAa9OgZCHcIpXwzDigHpnUvTN7GfzJKU+O7QeekjHO956G9zFZ5h2xSIN
	bqIQCamVHq5gOnXEs9VEDAg59X4eErx/bDlbEja24KN
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

--a45515cc26bb2c3e16f7ddb138529dcefe17028f2f8a02fc6d43a5237aa2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Nov 9, 2026 at 3:32 AM GMT, Sandie Cao wrote:
> Add the P1 PMIC's regulator topology tree for DeepComputing FML13V05 boar=
d
>
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--a45515cc26bb2c3e16f7ddb138529dcefe17028f2f8a02fc6d43a5237aa2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavFqSiEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+cawEAmuTbJIBqSbKS
j8uuHL7iWjyMcnsLj7MKWkndH8HZa/IBANz9W4bE/oiXueScqETBLZGFyktM9kC8
/G7QkwtLUPUD
=s9s9
-----END PGP SIGNATURE-----

--a45515cc26bb2c3e16f7ddb138529dcefe17028f2f8a02fc6d43a5237aa2--
