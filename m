Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794206276;
	b=fSYRQHU35Y65KPbdkwlGWnqcOg/dmorzNj4+sb+fJWSTktGWuEtXJwlBhY9o3p9y/hih
	 IzOrLBsqIaQwTKKkIepEVTwqv3K9S3U12oqTI48+XCttfz4pl/EzcAzot1Ph7yl4RGjfE
	 NN6zJNVLrHcgWfSNt1819ju6M2pF5yLTjERD/pwR2jKtCwf9u+MctEpyFVe8a/McKg2Fw
	 or9jnwGFAxREUe24BsyEYcG6p2/xLgu7WAvOfgQQu0qoKazQKdhyfo6jRMNJMRGtgrLaR
	 M8x1AjGDSVD4FMja+5zPJMFe7IGsETkW6N+mU4SO5hRPQSCy89q0WChp6rOAoiQH9LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794206276;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:X-Mailer:References:
	 In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=hb7HGbX0oSahgSBh/HsCEGBA4WObvvoSCDVjmlK2qNw=;
	b=YrXm6FFn59yGkvptw1UQG+H2PaxhlEjmG17LAK00dp2WRPrwIFsxXgl41XLH7XQRNzG/
	 eJJ9Jn9A7MlW5iKNyVE6OAlMM70JP4tRNHak/2mZwxxABZlD13ak9YohsaCkY/JqvfgmB
	 dMBs1ekz09EMVZPGsEJcNxez8i7RJt/f6E9NE5EM69K1n3baJbvdXTtDEh4DvSOriJfUK
	 3Oq0imFG9T/7LNtfDxs5feaSuqkOg4cSj9aPY34cFdto7l37mAQ1zuAme1vbAtcn2hA2/
	 rF3qsIjmpuU+m7RqotTW2H8ETPzH9NEMGfAOoxOGkoL6pIewok+KDMQJJ8kbEasLoKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=e00NYSWw;
	arc=none smtp.remote-ip=54.204.34.130
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A68606A332
	for <spacemit@lists.linux.dev>; Mon,  9 Nov 2026 06:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67A68606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=e00NYSWw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794206215;
	bh=hb7HGbX0oSahgSBh/HsCEGBA4WObvvoSCDVjmlK2qNw=;
	h=Mime-Version:Date:Message-Id:To:Subject:From;
	b=e00NYSWwXhqlXUw/bJrllbR2ZdnMeumI2uEKFADgiMyDE1SjH3KeOSFnveVkLWvL1
	 q8eGre7GOTW+O3EMy8EiWboV7YwzCgn9zAxWzMiuanfKFtJ+pzjrV0nA5d0XzZnv8V
	 y5OZ9zfXBtXlapOpMyLRDgfi/Xml4TX5xOAejXSo=
X-QQ-mid: esmtpgz11t1794206213t932fa143
X-QQ-Originating-IP: uNnEt3FdwN2rX55aSzOWdv/vmKtzNzVEL643pzBitQ8=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 09 Nov 2026 14:36:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14632916415313039984
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
 boundary=78dedb1dc94b18e0f8a4169292210791aa26539c13513ec0cf52409d3674;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 09 Nov 2026 06:20:55 +0000
Message-Id: <DMQGOJQ78RU7.NI4IASG2PBGO@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Yixun Lan"
 <dlan@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 Enable SD card support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io>
 <20261109033348.361452-1-sandie.cao@deepcomputing.io>
In-Reply-To: <20261109033348.361452-1-sandie.cao@deepcomputing.io>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OLsBWtCIHsg6SofOgZXJhA1zQ7RMvyJ6xPalg27ZygpG9xmlXkitp0yD
	zaFhREgLxU/zqPP+LlbwGf4pN/OIjUkB9ia8ZVBG4m9439PgZcxnkzcZVerriEH8NpDjrW1
	GzNI4ysxfheiR9/iQetleRMzqQqwyUWi1W6H1EQKVPkgBr7A62nQ7lBxnaB9jY2BLe72OvP
	ktH6ge0Od1ILD7hHBlI8eydOlPqlkZ8lXiFaPwTGogPkiq9uSHi/rpQNxRgEpI+OBN1GtAZ
	UnuxVAtX9P9Xn/aU2pE7NxwgI7sE6AzHtROdh6WClTmt1XWUQfWcQJ9xdcUy8DwUv94LdZo
	qsvurFoaJ8cIVRHAsDUggTD0YRrbN7GF14Ijy1rKOC2eHnzczHXQXapKLeFiPDK+cKwn2G4
	AhxIpGJ06Tbt1i+d1txTS3XdJF01OS9bA172syncguvFHAts+gOpBDyI/yxP2WmjDjMfFSH
	PhQVaM0JKvntpf1/AdMVP1a5uq3G/phnwJ8PhRTyGhxb9Zr4idhMj+qiUsRO6OEJwhzq3dK
	u97M1e2lDfxYjDvZEaYjZ5+hPW/O369ncNnMCFNRFnwvLTKS0cZv/MYH7Ioz8wBxmNXRmZj
	43XQByUqyJFi7eP3NQ4ZkfWXQpqCpevHQoKsotUIHUvPj2hNOo2wUATCWnVlLdcjGpsA7E+
	sIse0C5VXXnlcL4ECyHsaReOVs62g7kCo9PdveCNJbc+9bPr/CFTmeY5kKUzl6VB1U846+M
	RpBZa5pVOIwbOd1cae6+BW8vkAdauZOyXHVrnHTC8KfkGyBaWa5GIuQtEXV8UBEkDDIGZgF
	eDN64mzxsYkjgYd96IoWiLPzv6Zt6puTpMg1Qc8oeKU0KqKGmWtfZi24kXOdUHn+yNQxDFZ
	UnGf8fig+1nM3xAPelLgowfYqj0XPa7/DrHDx+34ok+LFpbMIN+tjMT5snha+l0npKq3LqZ
	uyB253rM5M/Uki6Fgj4o8PmKxx75rAoh2GMDjju05+lKJd2oiby1HCFIq8L1YQPTG2QZMQQ
	BzDIbifeloRZZ/QZzZ4fS9Mm0OtGZ5UFOpSgCfIjis41Y83aXNXIjwvmC6HuIfdJENeu1o2
	2UapgubO+CU
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

--78dedb1dc94b18e0f8a4169292210791aa26539c13513ec0cf52409d3674
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Nov 9, 2026 at 3:33 AM GMT, Sandie Cao wrote:
> Add the device tree node SDHCI-0 controller for onboard Micro SD card slo=
t.
>
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--78dedb1dc94b18e0f8a4169292210791aa26539c13513ec0cf52409d3674
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavFmRyEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC8TRQD/QnNxKjP9gh5K
HAnHWjTo2zHzwTp4TNY9rvjpSYQ9RO4BAOY3+m+hFCumO8ziKLwAT6WNAUI+BNIs
sETLiVSYc0AP
=OKWu
-----END PGP SIGNATURE-----

--78dedb1dc94b18e0f8a4169292210791aa26539c13513ec0cf52409d3674--
