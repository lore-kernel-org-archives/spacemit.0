Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557275;
	b=WthJirlfivoBRyu9OfKCcbHoJAkH7RHQxwhgLf6NspM8aS9Et9IHKobNfjyP59g/37Ow
	 rkkqDcLeFhHLywFH6iilBr0R2sAhVErByAecQRQ3ks0o9YmCLyE38Km3M7ejRCUe8Tpdr
	 xsDMNqp6c5LM+smDjMdQ+LZ0PJVgVGYsBCBnLBWfkB1xdsi7/a31NEj+H0VcCPz5nl/mW
	 XtpLuj848mgzYGTf434naoEFws6UXYR1B0BYS5QW2SXyX/8Y5ZiIORemabwdRPhPMyeLL
	 reDtKl8SvkmQcuaWij3m2koaigKmpkIOk1CUQzyLqreiXNiDOFEMbspBaTG9ugPOz0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557275;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 Content-Transfer-Encoding:In-Reply-To:References:X-QQ-SENDSIZE:
	 Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=4hU5uldfxHAYDoQxeLuo91xKme7lL3iEklihd2gkQEM=;
	b=zZhg9JeqZ/A846YU6x45yRM9XF62Ek97dSzloT+Ai3L14Mu88BBoM/ei2JxCsdDit72f
	 YMRC+dKSRUKGoH55uJBHFU+77z9LtcGjrx7eSXLMseaP31POrMPTsAwTcf/DgpCaJ9ZoM
	 NlTnqPH6iY3I054yKkcACn9NbbzmB0vRWvubjrY6Beb1H/ts7eW1Wpm0rTds1v4D3UAwh
	 6o/YDd3YFMfGedymhSKzLPH3zcuylthuNIwRSpgW7ih9HK4VUCIK2o436ZIsXYY+rSCVt
	 IyaxuP0yQbgfTNAUQ94e2f8gIrj4sG+Ifc2BtchW/st6+wBs4KD7skJxkqFW/LDduNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b="wxXP4u/S";
	arc=none smtp.remote-ip=54.254.200.92
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0323606A331
	for <spacemit@lists.linux.dev>; Fri, 13 Nov 2026 08:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0323606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=wxXP4u/S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794557255;
	bh=4hU5uldfxHAYDoQxeLuo91xKme7lL3iEklihd2gkQEM=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=wxXP4u/SOHkkTVCbN0JxSi3W0+e6cE6K7IVz6X56g7rE/nObaFm/FQuOlC6jP8VBv
	 Qxd/bovAsV05sMy4xJuX1jJx/laJ2sXm1wx5cJnmHNqyJa1Gyq0L9/8IneGjG8P5v5
	 X/aOBSvwgil1Sa8CMsNiL/hQ4GHWsN9t73XK5HdI=
X-QQ-mid: zesmtpgz5t1794557253tbc5d26c9
X-QQ-Originating-IP: FjNqnou82m/a4LkyUcHcc9Tuhz5TiqOdNLxcrb8zkf0=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 13 Nov 2026 16:07:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13851320892259870204
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
 boundary=55ddbb8033dcf0d44c3f2031ef165224813818d398fd0f2c0b9d3848268d;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 13 Nov 2026 08:07:29 +0000
Message-Id: <DMTXGBJLGVER.1WG847Y2M9AJM@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Guodong
 Xu" <docular.xu@gmail.com>, "Yangyu Chen" <cyy@cyyself.name>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add K3 BS01DCMA support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Emil Renner Berthing" <emil.renner.berthing@canonical.com>
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAJM55Z_HOuvxNmAi2m3kjtQ3tuYEDNtfyvrcb=F-Z1p6K1VSCQ@mail.gmail.com>
References: <20261104-k3-bs01dcma-v1-0-794025247e4a@linux.spacemit.com>
 <20261104-k3-bs01dcma-v1-2-794025247e4a@linux.spacemit.com>
 <CAJM55Z9Yj87hqwMugqRsf_RL9np=KqzCj-J9RyutuWKd-w-n+g@mail.gmail.com>
 <CAJM55Z9nuO3MneQqBm3K2V2SjOXqXsZcDx9pMzVhxMJJ73xc9Q@mail.gmail.com>
 <DMNTD3S9CNW1.1H4CMNHDJM69D@linux.spacemit.com>
 <CAJM55Z_HOuvxNmAi2m3kjtQ3tuYEDNtfyvrcb=F-Z1p6K1VSCQ@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NFQMG86uACrUzvxdUHdia0jpfQuv8DhlfyGHUK4MPHJi2fy17q/BQejn
	EWOCs9NMotANKU2R0YSiV823QZbFi8NoGrQG298mAySMsdyP03gmwH+BlYJQvGtQgyzfBrc
	9VXHBiiU6Oq+xJvussGMeymBhZj3lVvZWS1FQnmGipK6n40zh/kdfaMWJRhO92oAeJOLe6t
	arZBIIOP34gsjOxZtjFDQ30QvRmeD3Ublwxm25f7dEpoUP+uB5Stask4T/ph51lU0NICchr
	md20Qz33GOIB4lWHo8n7rjimUnwphH3cKMWUCca9k/KgJ+IDx/DO7sHR9opIkN9rjXgN6bz
	x12AbgKpFugeb7vFzZzAaWY2MVEbo7SgezdIYbt2X0lKYRMdF6+XHf2I3E6BzMcU32VTZUh
	00MB3JW+rvZw89XV1EJjTo50vgB4w9bJPY69HoOaPjBlI2BhJZwScgyVAZGY+ncPKnp+6wU
	THOoWoZRywiOjzmP8Svu0+L4U4XgBF1XWQS4xvWXD2OvNBUmjDExb8uClTfSwjJ3OwILUle
	B8BKVRUHqXXoambzfB4pTLg9GtsoZXytGlY/ZtwX0y7zSBCzL7uF3K2lTfMFdsd83qU6Hpn
	HGY3ErRoHSrh/EIW7bka5cfIxOQj8zalUOOig5+RNS5exySwdLYPlEVf6d0VTIrzGZhArTE
	DR8Qz5xqvOkx3tihRf7jOiQrm5qXfPD1+8N3Afargof2gop3HIwV8wmgPeDbR4Fzn6tSEVe
	zh609XhqxUr8LtwSRv5wSQZ9aUhyJ3vR8vipCi48dXWzWYRO48/FrqJf5EEuMAeUHF1FMoV
	nMg7dwyTcH9IhcfPQJtuxwL58QL/E3EZn/lrd/MaFsa8Vpr1KWXEyHTWA2pHBgvc1lGfZlq
	teOCsPdRb5myym1W0KWBKzWzTg2FGdEcvTIlEmOyQN65RoFxCH+Xro7TiPswCaskouFSI1L
	kGUk7p+ptustxSyZjf2vChf8TycNHz+fIGrOb9G1IgZFjnFOs5f0WlRj+u3CfmKSQD6A1qc
	UQsEKVlLf++O92trg1lcAzxCryy3wbIlWF+CQdAxX1A4ElU0bdr4iTQvbLxHos3rqElc41A
	w==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

--55ddbb8033dcf0d44c3f2031ef165224813818d398fd0f2c0b9d3848268d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon, 9 Nov 2026 12:10:10 +0100, Emil Renner Berthing wrote:
> Honestly I'd still rather have the k3-bs01dcma-rv2768.dts. It's hard
> to predict the future and I think having the extra file is a very
> small price to pay compared to the confusion of having
> 'spacemit,k3-bs01dcma' describe the RV2768 server and then something
> else to describe the module, that's actually called just BS01DCMA if
> someone ever makes a different carrier for the module. Also it makes
> the physical reality of the RV2768 being a server of multiple BS01DCMA
> modules more obvious from just reading the device trees.

Fair enough, I'll split it in v2: k3-bs01dcma.dtsi for the module and
k3-bs01dcma-rv2768.dts for the RV2768, with
"spacemit,k3-bs01dcma-rv2768", "spacemit,k3-bs01dcma", "spacemit,k3"
as the compatible.

--=20
Troy Mitchell

--55ddbb8033dcf0d44c3f2031ef165224813818d398fd0f2c0b9d3848268d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavbFQSEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+bJwD/cTWK4yfvLKek
iKSpvbRgeuw9ugOpMKbp6SIUnby8dr0A/35wZ+z92YfzDXXxb6U2HKJ4nANco/5l
wL8UcakcR7wB
=1j0q
-----END PGP SIGNATURE-----

--55ddbb8033dcf0d44c3f2031ef165224813818d398fd0f2c0b9d3848268d--
