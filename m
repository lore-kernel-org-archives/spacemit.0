Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.16.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795759483;
	b=cUdxbENpZ85qcG0V+xlDoX8bb6ReBp3ZDWQ7JR4u8g8mhLiTXn2ENE0fWoUlVno7TJj5
	 lnc5y4p9Il35wvCLf/3W19iub9MGg1W94qRU3sGdGMDzaotmIGe25So7FG3d8Yy1QJn1M
	 ZpCr6QByILBG+6Lk5w8Daz9LJZqhRjrqmqApKVK7tfK7SHfCBDSa2IrbniKZdOrBRecut
	 ig9xQkVD9Tz/EnLZL+cbGDHfqvrw9F7+ccPeBZRI3CePA7IiCevA14Iw7v931BoE8YEX2
	 iSjuWm5OD7bNjUW6lpwAtbIEsgB0IqZoDH+LpMJROkDKg7QO2F3yyGoc3wKyd0P83Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759483;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 Content-Transfer-Encoding:X-Mailer:References:In-Reply-To:
	 X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=+CoxtxAlXXTcTP7hM4mxLxfWNCL2jUGH6jwViGvzmUI=;
	b=RrSSJtsAobAY2QP3j9ZTBDQI6m236bvS1v9K7ZnLLW3V6XMGQjL9QUkZW6k4YhY1xloD
	 nl6WqCnXkTq3TVcsi2fsHh3OOqgG25wpg7jg6J2/5XyzF97g2AxBWo0QMm7GWzL/BWmWE
	 Hx2g7dbMGbAHxVSSNsudQf99MObRlgv3B6wmOcSYOLOZtBykz4IGuHpy7qWd9CdTuJe68
	 dBxHSPhIKDG2qoOUNaVjAx1vyv063UBxKfIrA8qTM8hmcchwjBeOWaOHkl/9q1wgFFhVe
	 koz25zWQ26e4hh+pR96ZJAIAzlvhRTkdMBGBIiTN52z/2uTfG7vqUk5WiAJ/GJGyqjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=tXS0Nw4X;
	arc=none smtp.remote-ip=54.206.16.166
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BAF606A31C
	for <spacemit@lists.linux.dev>; Fri, 27 Nov 2026 06:04:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39BAF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=tXS0Nw4X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795759432;
	bh=+CoxtxAlXXTcTP7hM4mxLxfWNCL2jUGH6jwViGvzmUI=;
	h=Mime-Version:Date:Message-Id:To:Subject:From;
	b=tXS0Nw4Xh93ckj4dHg2s9gfumIK+tCYENS/w+vSfjDY95VlhYalh0UCoxWKswujT8
	 jryN6i+a/4gxkZt05y/jXjRrGlOIyu4ZMFNt1lPX//XqzojRgGizTFIvEPG+YAzeli
	 Le34vxYXx4A38aaws+rFjg5nnro61kNCzECPJnnQ=
X-QQ-mid: esmtpsz20t1795759430t6776662d
X-QQ-Originating-IP: mpmvFh0R3UtSvg9VqO4lkFODjR/FTtIIYNG//MpBlWc=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 27 Nov 2026 14:03:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3646035124795458743
EX-QQ-RecipientCnt: 13
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
 boundary=dea23099e5428f6b7ac3e4e3b106bb44ea01804eae0a8ac0d378e215a0ec;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 27 Nov 2026 06:03:47 +0000
Message-Id: <DN5RL82O9EER.3GGSSOY5NFUOP@linux.spacemit.com>
To: "Yixun Lan" <dlan@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] riscv: dts: spacemit: k3: Rename PMIC node
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261125-09-k3-dt-minor-misc-v1-0-dd887a8eb326@kernel.org>
 <20261125-09-k3-dt-minor-misc-v1-1-dd887a8eb326@kernel.org>
In-Reply-To: <20261125-09-k3-dt-minor-misc-v1-1-dd887a8eb326@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NsUaodqEUTWoj1zWXQnIiGb2wHGiDeEtl6G4+Fo8NP0WjBT6PPK8TEmR
	jNO6LhA96Yl/6RrDEVkdFhthaSeNis1ed0JZXF1B6seUfZ/BvGx+2e/mwXpojt8qKsMp53I
	uxf1U1b7ybXHi+Gq8Sw8RQVUGmNhGL5a53zB7Rd3lqF7/nIAWlQZfgeeYgjjG8vM5oxt7Xo
	fch1MrhnUzUOem0BU79Pjn5reFvv5ic7VeygIWgzkh4glFk8xf+pujk1zW9/yzl1sBWp2Bp
	QLz0FdmkCt+jhQOMmfcL2zZhbva7XxhVW1RbSsJIHkzhwWIoMuXvfdmyq+U7km2DAIeB8Mj
	djqFcgMrH/b2XLNAY7F4iOOjNELtkPCsevE6DrulpSEwXw7MaGuNvHIQ52UQl8CEqccKXkD
	VIRfZFf/i2Wtl/eIs3Nyor6oRiLpMRtIkHMOB8QN+cvJJen30abhx5ViOy2EJbMb2HvlD70
	BAjnVtzgInWv4kxh6Lv1jOJJldJuPLRdt1/wcq8ma0H2Vf52uIyvZ0iLb3XBtJqTgeDzQD2
	Mm3FvQM6xNSoE9JI0QN91lppLEto9U2CAJSSItCC0NyWF35Vflj25UCeQJbEM72+WGNTtTf
	xvjshH5seKOBbAC152UKArx/HjEWEUwClOB0w8Dn9j7u3uMPIIAlFGeSE7/r7sUlnY5OJKG
	6PvZJoi8QtdjV33Yv4SPjoJTqH0RN3Y2ew3vDU6mOHUeOX9UCABaSQ7DfQXUBinRWKHYRfU
	jqpf9EScl7gLyvzoEcaL/N+mY6mm4Ef6d65lZuSjMs/LgEtnGlomifurswahQXagIAcEI8p
	/408Z6Ry4YwnY4xSQzsuQlkb1oq9zeKt+mV+59VqtgFj+Ln1kiSKCTzANJsgsSG9yTLMHOm
	RAvy4BZm1aY4uIyL4Nfmv4vP9IKCZejuEfMxVSEfQANTe5E/51refOFxhra9WBhwd5Hp/nY
	qmy2ro2O6+dIbnMvhWPmMr1m5u6rFwIFEVLAPM/mJM9n5uPh02GAih0Ffj/qkba1JizHHON
	ReM/GMvwUD+foLVZ3UZt1YWCSAEzxKXFaKlyg+kC6PkdJ1zNuXsye1yUjtakPRxzkUD42ol
	hNkxG33wFGF
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

--dea23099e5428f6b7ac3e4e3b106bb44ea01804eae0a8ac0d378e215a0ec
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 25, 2026 at 7:46 AM GMT, Yixun Lan wrote:
> Replace to a more descriptive name which follow Device Tree docs.
>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/bo=
ot/dts/spacemit/k3-pico-itx.dts
> index 8d1cd468cf8c..a4afe24130ae 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -100,7 +100,7 @@ &i2c8 {
>  	pinctrl-0 =3D <&i2c8_cfg>;
>  	status =3D "okay";
> =20
> -	p1@41 {
> +	pmic@41 {
>  		compatible =3D "spacemit,p1";
>  		reg =3D <0x41>;
>  		interrupts =3D <64 IRQ_TYPE_LEVEL_HIGH>;
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--dea23099e5428f6b7ac3e4e3b106bb44ea01804eae0a8ac0d378e215a0ec
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCawkdQyEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+72AEA6xeu93yEEa++
vdfWOF3LBT8G/QTUIuZMu/R3YlMKumEBAIRz1wtpkYvXtXK4vzdoyfE7b3gN3mcS
f2FUy2P9NF0A
=YDVA
-----END PGP SIGNATURE-----

--dea23099e5428f6b7ac3e4e3b106bb44ea01804eae0a8ac0d378e215a0ec--
