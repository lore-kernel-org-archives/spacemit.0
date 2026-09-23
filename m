Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1E954788
	for <spacemit@lists.linux.dev>; Wed, 23 Sep 2026 02:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130074; cv=none; b=PBmcBfp332Qq4+IlqbvhomvVkLqqHczszixtSjKTMTf09BUGsCACPrOzVvN1NUMjQfAAyy2gokJM4Jg1d34x/4uHreFmJngHe49CFNCSVj1W7RYStFoM7I1yMX0klhVzhmiiLJmTT+0B7afsoPebHAACdTwiWPWNFQbXoy8bR6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130074; c=relaxed/simple;
	bh=sbdU4Q5D/LstC2WUTuiP3pcjcK0GAJxb3ROux06l8Xs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 In-Reply-To:References; b=jH70uamQgLAirkZtFUU6N1duxOCdVN8lnq8aFL6Slb8V5jQTQpxOEXfx3YmLZ+i9TfkqHouBHbHaN62pjmO1BeHvPNnz1TptyleJQO978JWZe1Fw9x904TONS8/MEYFuAeFLQ82zhFaOxL6l0dDZcHdcRUvCXVHhxCfwmU73XeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=KVFE9CVE; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="KVFE9CVE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790130046;
	bh=HsUHDmsVehcHWKUK7oJBtX9pkySO3eKim9u+3rp9Bko=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=KVFE9CVE2l7NekTkRU8Xsp76B17NmYtspEBXmuOvly90h4B1ifss45HIYxkQxTMnZ
	 D4oK1jm1ePrzY5+l5ebO2y9+iW1ipyL4Abg3/t09a3Z4hTTGO/uE4UcmFTRRlsQGQF
	 ZMjldwF6gW+97eNwfDUorbSpvAnws+prhIGVqwrk=
X-QQ-mid: esmtpsz10t1790129894t25376d77
X-QQ-Originating-IP: 0Lfhv4AIErF+dHYAdIw4Ywjd5xgJufwHFdrpdtg487M=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 23 Sep 2026 10:18:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12085916592293753369
EX-QQ-RecipientCnt: 14
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=57b5d87d32bc9ece3cb6ef40e4dde09507a22fc2dba109df05cb5c4a9b74;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 23 Sep 2026 10:18:09 +0800
Message-Id: <DLMC322TOCGJ.2GTJG14AFBACW@linux.spacemit.com>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 add USB controller and USB phy support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Yixun Lan"
 <dlan@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>
In-Reply-To: <20260922110434.3426051-1-sandie.cao@deepcomputing.io>
References: <20260922110231.3426011-1-sandie.cao@deepcomputing.io>
 <20260922110434.3426051-1-sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: McJfg7Aee/FZmk3AFvIgxeSdDF77JygcDnElywhRc5RPF2pQAhpElP1H
	fjg5GYl25tMSO4wR5MIcNKKl7efwy5GXlj0e2Wu+knY1gRfA11F6gapE5D1Dackhg18folg
	Wzk7PaiTTDOgB1Q30PyPqPWMJFJ9A9QgcPysRVgj0erzR+J7N0ZOyhmi8h/das7Y6xHr5kE
	8rXdUWlw/Uie93/QFsgsLEC8uUtDzTkv/tKQFtbDqKlxt5jgbeXvoB5oYixoJu2YnwPWkST
	Iw8rEu0g6jLEmPTL6cq+ooEPPMFsw68Eh21si6byS4NQMGpMOgbZiwYY1gWZ2K28g0+lagu
	1iSbSdVmHfjaB6QSe6BCNnjcNGYDYgrmRgnzTbdgpZw9k/KUuNuVMUj8fkAE/7YLn5TUPuK
	sqq80d1Zc5zjshv1xKAPpUF0ydZ+kTpiuOKJ/wVPC3s3MGpyNlqK9++/L2Zl2VmExqSAuKk
	E1PYBSsq4T9MT5OfJM8v7W8wM4zP2SgrjtMnS7hia6VndVn+/MYctfPaRGelfSkbAbOW88J
	DvRodcHCUbMNbs6oUIq2RgXb2UXRn3jHLC895AZCIDLfV59OSAhfwk6iWI8dQvelPIWXzco
	79Ofl2b4L1Tn1991lRwM8rqeC3Wv1GQ1Ifaac5+U9bpifL6CNd2wVOHb9hdkBhIOd7wT1gA
	8uuk0um6N97puYPni8iGRvVGHPkl/reS8Eh4uLxUZ0NF4RVyD4caXUAudzG/SSRRe8/g9wN
	NlfmXG0kgJf9TJsDqvT5xZC3SVAqlTjrA4IRX8mCMc81QFmhNU/Z16ccZCcrbqn1XQWOFur
	2j4+Ro5ajXhIQr3wQleZmX1akYOFtuo3CsEg3oNGT7xCj6WX0Jebpk/xpf/DCB4uLY7zfhQ
	NnbOp809JYbtMN9G4slanEX/X8L27xXA8MqPlvBqKUiQkNcTc/WSZeKnnMBHUGmbLiTkJBT
	joMLCqpCTs6pX2W5PfZh/LIo0EafXeGQN2tH7zpUtufcBbazEtEI2XTRPQXqklUN2tElEbD
	cyUgX+MMvQugExL41XZDbRqZqh+ZCemrYpxb6CK12uBXUPx6upIZOex9MXh/G2DbCJDgwHL
	QlQce7YMMoR
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

--57b5d87d32bc9ece3cb6ef40e4dde09507a22fc2dba109df05cb5c4a9b74
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 22, 2026 at 07:04:34PM +0800, Sandie Cao wrote:
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/s=
pacemit/k3.dtsi
> [...]
> @@ -441,6 +441,72 @@ soc: soc {
> [...]
> +		usb3b_u2phy: phy@81500000 {
> +			compatible =3D "spacemit,k3-usb2-phy";
> +			reg =3D <0x0 0x81500000 0x0 0x200>;
> +			clocks =3D <&syscon_apmu CLK_APMU_USB2_BUS>;
> +			#phy-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> [...]
> +		usb3c_u2phy: phy@81800000 {
> +			compatible =3D "spacemit,k3-usb2-phy";
> +			reg =3D <0x0 0x81800000 0x0 0x200>;
> +			clocks =3D <&syscon_apmu CLK_APMU_USB2_BUS>;
> +			#phy-cells =3D <0>;
> +			status =3D "disabled";
> +		};
Should these use CLK_APMU_USB3_PORTB_BUS and CLK_APMU_USB3_PORTC_BUS,
respectively?

--=20
Troy Mitchell

--57b5d87d32bc9ece3cb6ef40e4dde09507a22fc2dba109df05cb5c4a9b74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCarM24Q0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvAmYA/iFLvoo8oOH/IDlcVXEOznjisdfEqNwOm+oJljGB
ZmcGAQDPw3wYW5xpApTx/6vIfixeGWSBTL26yVlHUBqZlx8QBw==
=zTrC
-----END PGP SIGNATURE-----

--57b5d87d32bc9ece3cb6ef40e4dde09507a22fc2dba109df05cb5c4a9b74--
