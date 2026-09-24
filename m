Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4D7175A6D
	for <spacemit@lists.linux.dev>; Thu, 24 Sep 2026 01:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790212747; cv=none; b=H0n/wkgBsn/IiJTAXuCK0qSEKfWZI/V0S7xFyII/rO4JA5ozglKRmtFn5CHy0FywYvVRtdpjk8j+UxUjC7zdQqfg4LcgmVo9R2Fu6kmx20DpBdxK7CorBYc/quc+Y48IgELaNPPn7zrwSCtp40QIpC0b/3UpHSVX5rdaaQ/W3kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790212747; c=relaxed/simple;
	bh=wcjqT5zLGdrrSIrk7hVbs9nJEwefguc5ABHFpulyxt0=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=bGe4scY+GVZH6RR0X63KFoOWOSc8+k3WUYU13Rc96pW7NRwzqTdrCNMr2SgtibkbUp5ERWs1KT+LZtyTvBccJZPbD6pb3ONwQxXahka9hmrY+07SgL8i4kwdBnb19fLt3DUphK1MxQaRxSa9ZynTb2GQYP2hPLCJ5SIV+ojV9Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=onsFNss0; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="onsFNss0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790212697;
	bh=wcjqT5zLGdrrSIrk7hVbs9nJEwefguc5ABHFpulyxt0=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=onsFNss00ZtWNw/KyuXqFw9UhOW6T7I8ZEEtNTIeqWeW21U4KLrUyw8a+pMYHO3dg
	 /GPtHAj3vnJozM6TmIuexWyWQgM67ZEB+G/Cpx264P75KX5DEgaq9E8jNPcLJgCi3K
	 8bXAdlq0HVSbZit4HjHVaFjNc2FZeVApfA1AF548=
X-QQ-mid: esmtpgz11t1790212695t9b09bd1d
X-QQ-Originating-IP: /sHGXt0TDi1uFlPSWcx4jxzF2o8dTubagV/rfHW7MDg=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 24 Sep 2026 09:18:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1097969116973290679
EX-QQ-RecipientCnt: 14
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=09e63298bdd63c1cd28b1e0ce1b67eb7db8835fe229092788c9f41ea3312;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 24 Sep 2026 09:18:10 +0800
Message-Id: <DLN5FOFSNKV7.3NL9LZ0FYRPHV@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Cc: "Yixun Lan" <dlan@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 Enable SD card support
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20260922110231.3426011-1-sandie.cao@deepcomputing.io>
 <20260922110450.3426070-1-sandie.cao@deepcomputing.io>
 <DLMC741RLFU5.3FF1DL7YEIFK9@linux.spacemit.com>
 <407ce3d77416bb2522b7906b0df3d5adf02c27ee.2bcc8e57.b8bf.421b.9230.3eea00252952@feishu.cn> <DLMI4JHT5Q8L.2MHI30VCCP3W9@linux.spacemit.com> <407ce3d77416bb2522b7906b0df3d5adf02c27ee.64156e26.f1af.46d5.a18c.19bc541257f8@feishu.cn> <DLMKXCP8EDNL.JW6NFGCTMJVN@linux.spacemit.com> <407ce3d77416bb2522b7906b0df3d5adf02c27ee.a37d568d.f88e.4fdb.8c5f.8da4b148415f@feishu.cn>
In-Reply-To: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.a37d568d.f88e.4fdb.8c5f.8da4b148415f@feishu.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NRN3UPsLzYKVeqioKSywiEBXiXfXwMcaXKv+Z3c/q0Tp2rROSJ5kffO0
	/SRUoFTIJZcPmdwGAesTK4xTIAveY3vuCBn+v/Zq2oATseQX7LVVq6JhV/assjTL7xPKJf6
	5bhKjTjEn19LWVf5Znajmuu2K3A3/R0ZLPcZMFIWDUt5sQ+BdvtQ4sP2BqmWHvcE8HnPC38
	sj4msajjwYRYkfWDlz7sYae41JjBa4bllgUJ0IqK/k1Gz3YyLRWX5lO+QWAMzygWxSxKKRa
	YuzDSXm32weIGwhaoUi+ibkL4aODxgOrEJDErjDTJP5OK5MXZ+hAAZ0ht1LCNGTie83Lcia
	PB7FqVMMPQuaaQgvST4MUaIsuihEC0g1lIZodTEPUEun6q1cEvVKJWM9My9DyjtxGqJZvlf
	Q19xD6rlCKwuV+rUu0M7qfzS25TOd7DsQjTIleXu8sf0P+5LKgiaYYu0YbsNDOdYVLtD8Bj
	r5gLwfnXvysPRvrbfG8EJR42k64ECA5eHU07saA9FEsbWx67EdC/zSzznfJZQaanorsYPMX
	1A2i2EKQ7YFh3XeGF3IbGH71syL6cSWLFuK730hJ0JuxZxM4AqBRymLN/0Fe5gq8SYbNCP2
	SpvLtKcxkwdhI1yqvTZQrJvIRc34F9EY8KkEa21awQ5T0PeJBtZAE+TX+zLrNASH6dpnJQB
	8qFqbyUTMn1/9kFANAGpaIgFdbBhV/MVAnigBT2uiKIgk+aU1tLhRxVE/is4Cqp7+1eVMgL
	aa0N37oAWlDgTOBlPe7pIIFkhrAHa1aawUQeyJk0hbGl9HGpJDuitV05j+6OD6jcHGF22Ni
	jnCL3snUE47U/M8CRUfRX2FdGSvSPJ1Gegtfco+VxAheajX3qngg3HfWgOoVDmcunJQX0Mo
	sqSTe8I1yYgTx2jdrzUpi9zxlL2JMxJiCmy2hceZIkbWere5eNrOScXkw2iV5+UuG9w66cD
	O505a1nZCoDT7kOt/osc2hZbgFVHMYUoldEDRwUNS0BXcZ0BfEK7B9e99vZgtGDGqNr9DiC
	RUzMas3H3GYskLJHq7PBR8Ut6f26mlc2UoRkvLsYjZFPZ8lW1iMj7eywo/J+juF8d+5IECN
	g==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

--09e63298bdd63c1cd28b1e0ce1b67eb7db8835fe229092788c9f41ea3312
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Sep 23, 2026 at 5:51 PM +08, Sandie Cao wrote:
> Hi, Troy:
>
>> From: "Troy Mitchell"<troy.mitchell@linux.spacemit.com>
>> Date:=C2=A0 Wed, Sep 23, 2026, 17:14
>> On Wed Sep 23, 2026 at 4:01 PM +08, Sandie Cao wrote:
>> > Hi, Troy:
>> >
>> >> From: "Troy Mitchell"<troy.mitchell@linux.spacemit.com>
>> >> Date:=C2=A0 Wed, Sep 23, 2026, 15:02
>> >> On Wed, Sep 23, 2026 at 02:35:20PM +0800, Sandie Cao wrote:
>> >> > FML13V05 SD card slot is inside the board, it doesn't need cd-gpio,
>> >> > FML13V05 Keeps GPIO88 to low, Then SD card is always on for SD Card
>> >> > driver.
>> >>=C2=A0
>> >> An internal slot does not necessarily mean the card is non-removable.
>> >> I don't think its location alone justifies keeping card detect assert=
ed:
>> >> GPIO88 would report a card present even when the slot is empty.
>> >
>> > Yes. The FML13V05 hardware is designed for this. We can't change it.=
=C2=A0
>>=C2=A0
>> I may not have been clear: an internal card slot does not necessarily
>> mean the card is non-removable. If GPIO88 is connected to the
>> card-detect switch, it still needs a pull-up. Is GPIO88 tied low on
>> the board, or does it reflect the state of that switch?
>
> The FML13V05 SD card slot doesn't have cd-gpio. But the K3 SD card driver=
 need it, so the GPIO88 is tied low on board.=C2=A0

Sounds like you should use non-removable or broken-cd instead of
cd-gpios.

Note: Please limit line lengths to 80=E2=80=93100 characters.

--=20
Troy Mitchell


--09e63298bdd63c1cd28b1e0ce1b67eb7db8835fe229092788c9f41ea3312
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCarR6Ug0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvlDoA/A6waB73+9c0ODRYFcFHDTW3c1NvzQiWzYM32t0A
jGw9AQChT/NpSJCNvmUJTbcRlbZfurFIO90wLjsaHzuQy5IeCA==
=iXb7
-----END PGP SIGNATURE-----

--09e63298bdd63c1cd28b1e0ce1b67eb7db8835fe229092788c9f41ea3312--
