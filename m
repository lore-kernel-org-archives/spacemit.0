Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D9C418365
	for <spacemit@lists.linux.dev>; Wed, 23 Sep 2026 06:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790145444; cv=none; b=e0g2dGmLJCr2XuOU8DPhlXrwjYeMAjUjhTD7VEr0wrHxiL9srTKtJUOJDu4LGl7xFtz1aMzC6hrTakR0vwfsfpCHUI7drUIiOIvku65LJ5mzaPf56USQodLV3ll19WZ1UNqOorzPERi97H9e4/Wau1D1BQKlNTtzIGdyVf5eOVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790145444; c=relaxed/simple;
	bh=QXk6sqnpswcMUyDd2kkQEilIhi7zKKxDdYh0LaPA8n4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 In-Reply-To:References; b=o6sibL56va64c5VHwJUNGCRcyGPBFt0bM/5/vh3+uLWTPmTnNZI6hy1Bd4VCWT/JWb7ADDKN3jN2kYMNPbesNN42/PSwkd+IOw66IHUwci0kZy1L/zUXXapWFCnYzdYtWFcbRC+wK8WlQpa5aMqkN0/btfKuyBhHE8fq+CgW8eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=pkAuUzkj; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="pkAuUzkj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790145368;
	bh=7TD6kaLOIkHCV7biWJRQxBpxr+dO2L1mtrMOe3kFMLE=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=pkAuUzkjIzH0Eu4mN5KL1bNpIF324ba3qVPlQkGaqc21tXb+GuTK50+x0azsk1a5o
	 M9CDc/3pfHBcfvpIHOgl6qRzWt9HDPExJRnjHB0Z3AV1b7vYtuXclYK/diWuT8+atW
	 J0hzB3WGAqYFqpyOSNYH5wSxqrOl1BaNijUHOadM=
X-QQ-mid: zesmtpsz4t1790145366t12895b09
X-QQ-Originating-IP: iQ++3uqmOnABX9dDUWqAzmBVlnJU4UKa65BUSd0vL6E=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 23 Sep 2026 14:36:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7840022773498223728
EX-QQ-RecipientCnt: 14
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=93fc701ceb312486caf8efcda37d3e33c17510886787078030b0fde4394e;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 23 Sep 2026 14:36:01 +0800
Message-Id: <DLMHKHTDP2W9.3GX33KSJ2YIJM@linux.spacemit.com>
Cc: "Yixun Lan" <dlan@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Conor Dooley" <conor+dt@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 add USB controller and USB phy support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
In-Reply-To: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.b414918c.4333.4215.b208.49d99e9be044@feishu.cn>
References: <20260922110231.3426011-1-sandie.cao@deepcomputing.io>
 <20260922110434.3426051-1-sandie.cao@deepcomputing.io>
 <DLMC322TOCGJ.2GTJG14AFBACW@linux.spacemit.com>
 <407ce3d77416bb2522b7906b0df3d5adf02c27ee.b414918c.4333.4215.b208.49d99e9be044@feishu.cn>
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OYxOaBiafLsHcQgqPYdhxLg3ws54Z+8sS373nS1CDeQL5ZxjczNGkjv0
	M6Xwfb6h3szFA13ze86I5GXlNWXp99ImE2Y44vlFfvLcMUxoYP0cLDXlESDfPVERWQPbg62
	o42YTgl58VyyRlK4YRjhExLUKnEqQBSVTmMOuCkPtuhdE2FfCB0/OIk2rOzWo2QpEG2fSpq
	o0fTJvss3BVtEAqvHydrBkvR/HYbpRlhFJLgxPzT4f67ctki4RjXnCTVKG0d6660Hbf7hI/
	LP+a9D/Jb4fI62oaf3pkvl5ZPrfV+xxDVF4fBTmnicGZ43SiW4RAQF4lqa4Rj8LrFmLZdF3
	C3eE5m9UVhxapznOXktcQ8m7SiZI/rymvd/+hlPvRb9jFUr7dD4cLLgQauPQWwSi9c7exQt
	geTB7jMvwfEVbW8Fb2TLauE+wQNkyrhRoc5fXQEOCgw5MCA8axcLJF4CVsL3JnX+wuho6+C
	//sP5bZWiXFe1XMXgM2gcA/otQ4Vd5iCJrTMti+Z4tB3V6vH/8UZ1VYMoh5y7SuodPzsXj7
	bFymdlcZVzOTJ2RbhRFZfC6AxUzv8GtgYYsZ9J5CZwU6IKYv0iBxeR0YCbOCj58hl55hc9O
	QIqcZfzW9v/XJ/Nmq/kEFR/DW3ou19AULZUORMahdO2dC/L3s8Q8fL3kldJ0gLjZyTxiz1P
	fvtf66bYdZ9LOePQ/+ArEvjp1LI/O9q2qr0olmhipJ51+MiRr/kOra/DlTPgYskM5JZdg3E
	OZ1/U0eHHM9BEbey5dzbk1D5/BNN1e4b9VqorMwBGOXwg+sjGnzZIIw6yyBZNngnI2r1Iab
	T4U++v1ROVWARSV11g8cpOfGqpxOt6Gl5ED6zZ8uxD/wqespULKYcpD7Zcn0YJ/vkMwUWUq
	w95mn+BmwollzMxsWHEW1iz3e9kQhTtK7+0+d+RC0vpWlN32a8OapyV9miGrWvieFnXhQMO
	G7ZRk5cbV0qelXdWoIcl4Z3ZeoyGkYxIr2F25Fa+4E8awNXbD/heesPZdvJaY3CfzuxuNv3
	Z2RlnWZQeNcuiNDhcY1yCk43wWI3xDcvecr7VK3Zctnxj6IsCNC+BmN55/Se8o6qnuY+wA+
	WcbrFVrxc5TMZjTCMeUju54bgkJXDaEz//1j7RwF/2CH6tg4I1EXOec5xRbTT+gblpOKdUj
	eNzLKL0BtSZnNN4OkjNkFj6jb8jXLExe/NU5
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

--93fc701ceb312486caf8efcda37d3e33c17510886787078030b0fde4394e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 23, 2026 at 12:07:20PM +0800, Sandie Cao wrote:
> Please note: usb3d_u2phy also use CLK_APMU_USB2_BUS.

Could you share which tree and commit this snippet comes from? I checked
k3.dtsi at the base-commit listed in your cover letter,
3f2425f5b5bbbdd991ca9cdfd5502e68d8895998 [1], and usb3d_u2phy has:

        clocks =3D <&syscon_apmu CLK_APMU_USB3_PORTD_BUS>;

Are we looking at different versions?

Link: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-n=
ext/+/3f2425f5b5bbbdd991ca9cdfd5502e68d8895998/arch/riscv/boot/dts/spacemit=
/k3.dtsi [1]

--=20
Troy Mitchell

--93fc701ceb312486caf8efcda37d3e33c17510886787078030b0fde4394e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCarNzUQ0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvjqoBALC+90I9O3Z9aQ/60lX4RPaKN48M1FU69LCQe/6g
LaTFAP42AzJ4bt274kIyxURFDfOEeXt9JY4yYAl2jx9atadhBQ==
=Tjxm
-----END PGP SIGNATURE-----

--93fc701ceb312486caf8efcda37d3e33c17510886787078030b0fde4394e--
