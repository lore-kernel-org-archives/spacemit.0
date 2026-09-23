Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD17379C4E
	for <spacemit@lists.linux.dev>; Wed, 23 Sep 2026 02:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130335; cv=none; b=t6RuuRXy+Q6nHuRb8QbEHknSFdM3+EtN67gGqqm/ilnYivMSLXu9XgyuIkNw4Q2NaeYRk4N9tuJlnUDEQ3WasRXT8skN3J3I2PIfjFN7EKD15yt8d438eq3NNop1f2Ka/hwGkZ5g10XyEzFY3GWTnQlWSzkl2WWBx3yImUpDfeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130335; c=relaxed/simple;
	bh=Bml4a70sKO3apn4qfj3MyjAUF6TLbi3VSLOK2FiWnkE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 In-Reply-To:References; b=qC7hLJweikSNXE3i5/CROmNhdZSc7L8MH/Sf7UK/GEedyP2PvhoxbreAiVKrAS0wCEj+N5T2qgHawogea1fBVpBhttthU2THbv5Xu4+gu3Ws4OmFy+H1lRfoXt7oIJ8RQKOEvT6iEVAAj6K+mMzbbyitwD9Phbbdow/94Gwf/o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=P+V+gBb1; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="P+V+gBb1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790130214;
	bh=8eBwOgT/P+WBWiIFGIYRyTHNte9OZxM1YATGcOp6ONg=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=P+V+gBb16B9JBIdJ4v8NDnqB5UogIhiCrEviGXYO6bwoUmbDRiMuCw6W/uxOZByzs
	 h5VRZZ20G7g5+fJ9kVtVuGqcgmxdUK8kAB5l+vtrviLEWYfxNq5uVmW0cefE+9ihDv
	 LqW7OaySTrSM/TGnkhzcW42Gl3y4y9yAnxl/Drbg=
X-QQ-mid: zesmtpsz6t1790130211ta5ccfb27
X-QQ-Originating-IP: Hv1VSePmG7o57TixVmzrTLL07Q9k+KrYHHFrBMvoc4Y=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 23 Sep 2026 10:23:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10725776021509883648
EX-QQ-RecipientCnt: 14
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=ac315c91ecc3c3395b0dbb991c1f84a289bae2ebd6cf0113e2bb44b50761;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 23 Sep 2026 10:23:26 +0800
Message-Id: <DLMC741RLFU5.3FF1DL7YEIFK9@linux.spacemit.com>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 Enable SD card support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Yixun Lan"
 <dlan@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>
In-Reply-To: <20260922110450.3426070-1-sandie.cao@deepcomputing.io>
References: <20260922110231.3426011-1-sandie.cao@deepcomputing.io>
 <20260922110450.3426070-1-sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Nv8rTAnDNEemZcCjp/1hlxAwrVVrzDFmrX+XzHjnZbwvjRgecRhjGDmC
	hdPaw8DVT9yGMNreHLPUonztD90Ui5Vma4c6YPwRL2UpOUCixBV1XbjVvUeEhzyJrc5ZRNN
	RXdx4ZZNUrfxllEjpUlg4gfXh5MOQXSJb28Jlp6Ok1aNqPXHtXfiNzW6qmDv3/a6Kie6A8q
	C00H3YZYN3mqbPWN7ss8rAKPf90WRbr9gRvHvEc299/OQtoAz8w3HdrZ6ZjGjjmRhEI+9w/
	VdEM+GwkHwZKv0cZ6/x03mCUArFCcvjx9D92DWStlC3bBJrVzjgKP8CkhdofVHOjxIcGJAf
	d9f6T489M3BfZfYEjf9oGDGK71oTu9/A55GCFqGhlzklWFAe4jKG0oqZCFytHCbAJLvP0zt
	aw+50oLQcis9oygbvlIVmMn5lJ/A/5/CkcD1XFY4XwTLUR2o+EfscdoLUNWwgRvVybADWUF
	mVLnYM33IoRxPlFJvH5LfFa/bQ9FJISqBz2hm2OXuTQE7QOuQ9kwy8GnUGQT3ttMVnMykcm
	pmqvw3YihtPlMV3GsyX1D58SPuWx6kje0efmyBHplTN04wJUpIg9ro+kQ3SWRU85PmGvQ1w
	RmxYkQ+W/hMnQB2LH3qUoDA4d4mC8CFoYG4r6eTJmerRBk6Cm8Bum8wwDwqyP4hzc5tTttC
	76kr7GIITAGyB7l8Lcjf9jXiwFPv4ZXTwlIrhH7yrd/j8sYzfHliviecAERZLRRuaA2CB3p
	zPRpSizHYnhxtPr2BATGpks3f/4SfBmHXymw5Y738VLyrG2O6+wc/7Q48roAQ/4XVk1k9ZF
	3AdrnEUmACxSjKNzzhxjh5g99UWoMdmLPu/mfIHChomlwogXn/E77l6XZ39Vx5J5MuqsOao
	Xj5CfvzsNMG5t7G2ijGmWeysvXRbzbmg4jTFe2sbI3tYbvMrdAox+x4OhwofdVEbPqMhQ0s
	ThsmOAonZFBiiYfLrwqcwEUBlsBIoVdq9W3NNsgsPm7dZB6XJeOwaFjuhIuwd7fc+rol/Cv
	4HHahwzfPNlXTpNUplIJXJmrPq4z0V/jj4AM6JxOHCvdPW2j7SoE1tpGmtciTW22frTk4zI
	d5HMlriVYDxQkCiYFSOvqZun5II0y2cksk5ohyYq699
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

--ac315c91ecc3c3395b0dbb991c1f84a289bae2ebd6cf0113e2bb44b50761
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 22, 2026 at 07:04:50PM +0800, Sandie Cao wrote:
> @@ -184,6 +185,24 @@ &combophy {
> [...]
> +&sdhci0 {
> +	pinctrl-names =3D "default","uhs";
> +	pinctrl-0 =3D <&mmc1_cfg>;
> +	pinctrl-1 =3D <&mmc1_uhs_cfg>;
> +	bus-width =3D <4>;
> +	cd-gpios =3D <&gpio K3_GPIO(88) GPIO_ACTIVE_LOW>;

Does GPIO88 have an external pull-up? The SDK DTS [1] also includes
mmc1_cd_cfg in both pinctrl states, with a pull-up and 3.3 V configuration.
Neither mmc1_cfg nor mmc1_uhs_cfg covers this pin. Is that configuration
unnecessary on this board?

> +	no-mmc;
> +	no-sdio;
> +	disable-wp;
> +	cap-sd-highspeed;
> +	vmmc-supply =3D <&aldo4>;
> +	vqmmc-supply =3D <&aldo1>;

Could you confirm which rail supplies the card's VDD? The SDK DTS [1]
uses p3v3 for vmmc rather than aldo4. Does that RPMI regulator map to
ALDO4, or is the card powered by a different rail?

Link: https://github.com/spacemit-com/linux-6.18/blob/k3-br-v1.0.y/arch/ris=
cv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts [1]

--=20
Troy Mitchell

--ac315c91ecc3c3395b0dbb991c1f84a289bae2ebd6cf0113e2bb44b50761
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCarM4Hg0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvSEoA/3IWr2MzSgk80d2GUorlzgVL9dN5Z5Dsq+DhOJvZ
9VreAQDXTpwPqeRJwGQFCrvEkytE3PdxYiCDEuGXLDFlGMaZCg==
=Za92
-----END PGP SIGNATURE-----

--ac315c91ecc3c3395b0dbb991c1f84a289bae2ebd6cf0113e2bb44b50761--
