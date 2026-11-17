Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794898000;
	b=gJBzkgVOSiC4+iNpxyB3R+Ym3InqyYEm/I14NVxDHENrrpQkrT2IHvMGFAzh6+YU70Pm
	 D+Mml7z9bMwxgEibXSRdS4BbDsVkq9PlPFspQaRqSz+ZZcI4/Bv66QoSC5v6HqcWYB99W
	 zCzdrD2YfO+bRSvpbXKP7vyPd5CedN+FoW7UoaztoMnxVk4zW1gjFpWIsuYucAYpybj3/
	 SNr1uRFrcHN1x4C8o48eqRXIVN8RXqrgTXkn8MRIYlPIuiMcR71aS0x4Q50xTCa2K9zw/
	 0xx8XsrUU0ArsTlp2KtHU2XwyhorIW7BDn2/RLHJBUsaf6CEsI53/lj9WxnIvdpx0aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794898000;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=Q+gF1IpQxY3Ah+YgluhpyTuzIbzQciSEK4mZyW1nqNs=;
	b=zXyYwqNTF0jllcu4C+GcPMT7hMbrPflYxxf1Lafg8flfTvhvQ645E+pLbhJ0dUG+PryB
	 efTqqiWR79UIH5ubkhly3VQDx7Tmuy28ufUAUwfc6FCjuyTUb5St8COJ6ERT3OWhee0/I
	 bFxxaI/+yq3SYYxO2/xEIbveuhC5X7Oo66M/+Snkhs0DqkINR35Vh4fvbkDdLuQqU/pvH
	 KR2yyDTGJTzPuhTJz+HBDk8BbTGVSFuLEZEGcqMfBc7cpwRM8ld6oMIR1AzR1ANN1qdwI
	 8lR5BmirnFDEJVGlRfQP86AC+nmXyZrh2gJiKIz2Sbhg3YhhLuUS7yIQNhMqrO4kkJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=izwbJya4;
	arc=none smtp.remote-ip=54.254.200.92
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44195606A31C
	for <spacemit@lists.linux.dev>; Tue, 17 Nov 2026 06:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44195606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=izwbJya4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794897969;
	bh=Q+gF1IpQxY3Ah+YgluhpyTuzIbzQciSEK4mZyW1nqNs=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=izwbJya4Pxyd3RK3GSchVQ9kH6RHkXfc/xKaVRxklhelB363uhnKDHzgoxPW9th4r
	 UgCFxTCvcsfff4tCipY/+pTeUDf6waKV7F/nYCBRNY0BU8SXAWphj/Zl4SBhL96VQN
	 4k7V42p0wiwxumILpguiN09ILkeYSJVQbjevkraY=
X-QQ-mid: esmtpgz13t1794897968t2ce933a8
X-QQ-Originating-IP: xAtSpxecaocUxTGnDA10G8x8aHp91+CaQjY0yRXZ998=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 14:46:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10056131255817741553
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
 boundary=7b521a11c60c864c881ef5d8eb32564a68a084993eb79986689971bdd4fd;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 17 Nov 2026 06:46:04 +0000
Message-Id: <DMXA85POOYLH.3L9L2Q53OUJ1T@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Sarah Emery"
 <sarah.emery@canonical.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Guodong Xu" <docular.xu@gmail.com>, "Yangyu Chen" <cyy@cyyself.name>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add K3 CoM260 IFX TQ support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Yixun Lan" <dlan@kernel.org>
In-Reply-To: <20261114082802-GKC100523@kernel.org>
References: <20261105-k3-tq-dts-based-on-com260-v1-0-aa0b7714aed0@linux.spacemit.com>
 <20261105-k3-tq-dts-based-on-com260-v1-2-aa0b7714aed0@linux.spacemit.com>
 <fcd2fc41-5af8-4256-8296-a5435fdf41db@canonical.com>
 <DMTY56PU7CP2.JGIZ9XDXII9E@linux.spacemit.com>
 <20261114082802-GKC100523@kernel.org>
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M49ymMyQ5YfuZg6AHji/LxP0UDNTO7r2jo98+M0qvUX4dif67OklTrti
	6woR+EJMu/y5pS6acK8mM6gXVqd6TEVKgyiGUEzYSV6397JK+J3EtEAyZOGiInLruUkmviS
	sVjVrcNqvU1DlJxspttEshw62Iuv6HJN6DJ3iMwHeXwvqcTcEvHwcrPi3gOfya7x//uJTcz
	xLJNBDpM9Q2SbwQrYfar5BwWsquhJUIqtLFtK1co7fK7hx0RnaWpGEKETDY2HDIG4KaaoqB
	Za9tJrDpxzdGHsHiJgXlJWBbsjybGyku6fE9zTdAtn6CXriUReGAgjav1TXE1tfeJGZ+2MO
	7DMXvphl6+nWBITujelevxOLpRYXdpUOjzkGfbM7xTgp/va9EUmVdREED5vrpLrZ96Z9xl6
	J3fp477KVkKq1ukC+Y25FpkfHJ3jWeUZ32g7aVperHtcvYOu/yijnFtChQY2tj6Ykb6Xbqn
	98xtt0E4ADM2CQ0ZvO5Rd69BF7q/kVOz+GRkwMJ7u5JnJmFOAa+NkOq7Ko4DymuVrhNQ0/x
	HzmoZ5U7rRlmx85VWQqaeBr4Bi+7QqIdZt/+AHDR1VZ9Q5aHbAyVQcGXTahmleaRhy2WI7R
	Ha8TxNhMibgihLs8DIbGotj+f34/VYR32C4EEs0dsK6PSyj9vbiChQSADJx5asY3w8yFWbb
	VT7Rr/QLjjRIOWSHX/Rb6kFCn+nsRdCjnENV3saFnYgo3pdyY3PGFiLz59nw5BaKJD4Lawg
	+IApcur6J/oCW1bKIcrFy8bYiwKr/YII2Xy1vrKuPiuAbJty3+vsQCnNZ14DSF/JGgBz+v6
	mHTLcFVKkjz1zYhhNIS1vuWwPPGQKLwgxjg3X56S9EmpjILCYPTtScgGjx5GJjfWPJzBzuE
	6np4hkGGQpi+1MNt8K5VsLgUtEzJjxZ/yjIBSRBP0CnXnht1JwMI2cLGRodXw1/Qh++2uaX
	wuVstoJ42krnZFBYFsYnCgAvL0hsD/KVwsteeJg9c6R/GAKkF8bbbTcIZc+W4PdEYDsA8pm
	C526P5oG8r22tVTq+AhryMMdbEoGqtB+dZIbGI6XPdhwoRs5gVznhpguflHUhZzEPN1Tcgr
	yF8ORU5FLmn
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

--7b521a11c60c864c881ef5d8eb32564a68a084993eb79986689971bdd4fd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat, Nov 14, 2026 at 08:28:02AM +0000, Yixun Lan wrote:
> On 08:39 Fri 13 Nov     , Troy Mitchell wrote:
> > They are the same carrier board. The only difference is the power schem=
e
> > of the CPU clusters. The bootloader programs those regulators at boot,
>
> If they are physically same carrier board with same CoM260 module, but on=
ly
> the power setup configuration is different? then no reason to introduce t=
wo
> different compatible strings, if still need to differentiant, please find
> other way out?

Agreed. v2 will only add spacemit,k3-com260-tq and k3-com260-tq.dts.

Once the regulators are supported, I plan to describe each power scheme
as an overlay and build the other variant as a composite DTB, i.e.
k3-com260-tq.dtb plus its power overlay, so it keeps the same
compatible.


--=20
Troy Mitchell

--7b521a11c60c864c881ef5d8eb32564a68a084993eb79986689971bdd4fd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavv4LCEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+fyAEA32fW5Y/DoYv2
3Cu2McB1vRv5wspPyKSABjOcL99SY0cA/1W5fQ8Axd/DB/a+Y7vunNMxiHzELf2l
tN8+CTlqC5QL
=RSI3
-----END PGP SIGNATURE-----

--7b521a11c60c864c881ef5d8eb32564a68a084993eb79986689971bdd4fd--
