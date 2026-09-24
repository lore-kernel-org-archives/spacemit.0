Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655092ECD35
	for <spacemit@lists.linux.dev>; Thu, 24 Sep 2026 01:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790213078; cv=none; b=Qgu3yOWXFZ03WrE3LbSpAEaQURwbyfW2pZcvjDHvc+AzjYGD9ZXuwSMwsr4KOg712FX21WWxUk4kuEN7fjPJMDA/Vs5Bd5yIa5cdiXRBsvkeebYcqzUXSmwjJhYbU4kaLlF1sFwhps9lk9sSFpP6Lkh33ub1JrvPzVJumYL3rSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790213078; c=relaxed/simple;
	bh=CmRkFAun0V9z4Fs3pLZbUq6i5bmcTNIxlCj9GMS9tOA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=iSX9qJMfgEImFgcDOBcwV/O6ciZ/NVKes9qe+BWM3kS/LjIipU7ciGyuJeGmBupgx1fRhz52cCVENgotcz2SH2YDkPUWC0AVgy9S5QQHbs9u9XwVrppJZr33CNUa1Vewquy+BmC8Dr6+PgtPDUALGxz+2nMUuB+xi80d57oWEgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=DmmrbHZD; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="DmmrbHZD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790213034;
	bh=CmRkFAun0V9z4Fs3pLZbUq6i5bmcTNIxlCj9GMS9tOA=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=DmmrbHZDfQ5ZTy0N+gPPvaI1B16JpL52nEyCIQLLCDmSlF/cKnT7qKt5/mn6PZnNe
	 7OIvIpKnzz3bW2nVLnpO3DNltmHD4TwNJlglzeQCKrN52+/V9xLD5bqLmYx3u522d4
	 r4LHVLXiAW3uNuemXFu36pAGfIF8cn9yDlyFgFuI=
X-QQ-mid: esmtpgz11t1790213032t84085d1a
X-QQ-Originating-IP: +sZ5XpyEU1H6ti2hpFw0dmpKe5uv2nQk2odQ0iZ9VMA=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 24 Sep 2026 09:23:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17327670691509300226
EX-QQ-RecipientCnt: 14
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=095ac3c6058a4dc13a950a888a02e4afa37cd9095f0740980bfd89424564;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 24 Sep 2026 09:23:47 +0800
Message-Id: <DLN5JZ9OM1FJ.3BTU3OU6JAQ7H@linux.spacemit.com>
Cc: <alex@ghiti.fr>, <aou@eecs.berkeley.edu>, <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <krzk+dt@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <palmer@dabbelt.com>, <pjw@kernel.org>, <robh@kernel.org>,
 <spacemit@lists.linux.dev>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: set ETH MAC from eeprom for
 OrangePi
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Chukun Pan" <amadeus@jmu.edu.cn>, <dlan@kernel.org>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20260922072910-GKB353745@kernel.org>
 <20260923064020.210794-1-amadeus@jmu.edu.cn>
In-Reply-To: <20260923064020.210794-1-amadeus@jmu.edu.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Nt9LS5Tya5fq8TboVJQPCgH28Apz8OQMmnsRwAPZjjquZPoGueXMutIq
	mSwlkcJB6Q9Ms2ingIuZdRHxnea/UOL9h4hW+9BLQOKOmtxC+cgRgd7mH6vyor6/suhy9X8
	CzFAYTrgXwvSWR2yd3/l35kk0php1G4ehDdYqN/YTd9kgjR4GrN8rds/KTwef3z2dY/ILpw
	6U8cUKkR5fm08Hm/5KGimcW+zm6yCNqLSy5w80thWb+x60Mo/MmTWNorMG9+jscSduMhaYs
	zKq3xrUFvaGrufJg3F6BR4EmygOKBkgZd1RCuvdKwP4kiiBv8nJ1S42J8S1CxDEtIXk4Cwd
	lfBBS2xq/SyElNhgPpAn6o2o20cxG2Eax0LwxN6e/pbIs7dKIh2zQYfBpXA+IKwD+5ttjwx
	ZZT+FXOL4lOrYIvS+6WLA2M/Zt+Hv0X17zFpz+29BdFLH7sWhfs6bBm4reZgJXwNx2Dpzos
	GA8dyUD+cajke8QP/wfBeiQ0tf0adhyJ69a6iYQByNNiF88pz7Sm7otnyjEX+qHgDnMgxkC
	4xM9NZTQXJyNnfz6LIDax1MyJ4HPF7lcPd2l6od/j4iRTw+Um+aMxPn+pg8Nmr6iFhrfBpB
	5o0di6cz6eaNiX2Rv7HAsjgNlJWnSYNOCVQMP5DufBlYScPO2YBCnKselBeJQBXW7UlSXPj
	E/KqkFshl8IJ2wB5zt+kHY9rEk0PbApPyVSmxmbANbvHKtEL9+TPCvAbi+7wCqYFM2bTYZ/
	1u8NbLmVodt3k5hbifgFkuArTlxSbppZcpSoci1Wb/sTlFGos30lsEIdcBHrd7/gX7iOIvd
	i45sf56RG3CPAWYAO4HXtU9I2iUR1zBnqOylrRpZWWJJ81Dq1DDVKHfoEcyg8Yhwk0vFjEC
	h8RQ/86rnrWKTzIxXglVYzsJsmEQmZCnz1VaOGCa7aYFB4keaaTgb7zvSdFnD2BW4TqcItE
	/fHc9Vm2GYZLr/5/iHSxugHX5cBN72p4VNfQwHT2YWrO4k4r3jd7nn6Qz+5nG/2URE7ZGii
	VAJFoDzWq1E+O358c4nnZbjSsGD9/S3m1qcOge90xpktm2x0b4DL40BQwA5a4FpzX0RZ2yG
	P4lhgyKaMq2TjVRwt5QIJEjkobEMZzdT3neB0OUzjkIb1wPsKBhgMZbl8jdWMR3ZxeaFDtl
	HmWc4Fu66hkbAtVHyn1kbNl/+g==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

--095ac3c6058a4dc13a950a888a02e4afa37cd9095f0740980bfd89424564
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Chukun,

On Wed Sep 23, 2026 at 2:40 PM +08, Chukun Pan wrote:
> Hi,
>
>> So checked the code, it's not a direct problem of /alias, but due to the
>> env variable provided to override the mac address, see
>
>> In this case, I don't think it's necessary to drop the ethernet alias,
>> I mean it's totally fine if there is uboot ethaddr env and it wins
>
> Once U-Boot overwrites the MAC address in the DT, of_get_mac_address()
> will return 0, and of_get_mac_address_nvmem() will not be called.
> Then I think this patch is useless.
Please check my reply in this thread [1]. Fetching the MAC address from the=
 bootloader is a
permitted user override, which is not meant to be guaranteed or provided 10=
0% of the
time.

Link: https://lore.kernel.org/all/DLLPWUHF8WRQ.13YQTP32MG59Z@linux.spacemit=
.com/ [1]

--=20
Troy Mitchell


--095ac3c6058a4dc13a950a888a02e4afa37cd9095f0740980bfd89424564
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCarR7ow0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvlRABAKmj+L1V4Z5eC4+F9m0y5qC7dgH8ES0DV1DHZrpN
lctUAQClrhCE5p5Rdjn9s6JZB7M2JKrP6IVzowMjcs5TbYmjBA==
=x1MS
-----END PGP SIGNATURE-----

--095ac3c6058a4dc13a950a888a02e4afa37cd9095f0740980bfd89424564--
