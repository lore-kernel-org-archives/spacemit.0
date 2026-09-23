Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4C838838B
	for <spacemit@lists.linux.dev>; Wed, 23 Sep 2026 07:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790146997; cv=none; b=ITWotvmLs6nS0DHxSxkwmyWMfBL5EyY2YHVntZz4DSeVo1r2u6tixHbJo4Vykko+z3u7ws2ScvX84tTx0IfLv0oiFakpDWWDrd0hSZ4YvoY25Hf0eE9mxLPTm9U3WolwC+ZHCmClkPv2r8fwKvpPPQpBiS/gvmLL4ZUkXRtHgPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790146997; c=relaxed/simple;
	bh=vV1f8XOtnhd4PUrG7fI1WwmGeEfJB8B4vF5GJJspy7w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 In-Reply-To:References; b=ZlAnTlnu78zc/QkFc+C5lYIPegVUBfwhwHFUvHHfCY3yMyJOjb1h0FhAr4n2/4lAgjda+7J3DAj6Nlx9CqErZSv6MHlUTm1+mnsJ5hhwkwIkc7ZBZ6oiWyy7drB1bzRtUuGHacJ67SdqVV9e3t/CKdTxBXMsTupSlV7sn9WsFEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=GmpybhRJ; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="GmpybhRJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790146938;
	bh=vV1f8XOtnhd4PUrG7fI1WwmGeEfJB8B4vF5GJJspy7w=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=GmpybhRJZLnP/9/jb4XSUy7O32pj4B3yhNJVR2LvRoowBjsTu3k33P33u55vgKoRh
	 LJX4XuGWBOAmgBIx0erzZGXQmy3EVUAv5mIpLq6uxkGxDXv6vtqlPtrYfJL5e0lYin
	 Jo6YalOWSWi6Gc05xP7y0DSpkUzg1s5pHC3UUcJg=
X-QQ-mid: zesmtpsz7t1790146937t51512584
X-QQ-Originating-IP: 6YGW9d+Woa+ee2SDpHWKexzNo7pMSO7+fqf4Wn3ed+Q=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 23 Sep 2026 15:02:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5313365158734513458
EX-QQ-RecipientCnt: 14
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=1d5c24782d6347cbf5fcdf0c6fbf3eaef92642292ff9818598bdb521dc6b;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 23 Sep 2026 15:02:12 +0800
Message-Id: <DLMI4JHT5Q8L.2MHI30VCCP3W9@linux.spacemit.com>
Cc: "Yixun Lan" <dlan@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Conor Dooley" <conor+dt@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 Enable SD card support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.2bcc8e57.b8bf.421b.9230.3eea00252952@feishu.cn>
References: <20260922110231.3426011-1-sandie.cao@deepcomputing.io>
 <20260922110450.3426070-1-sandie.cao@deepcomputing.io>
 <DLMC741RLFU5.3FF1DL7YEIFK9@linux.spacemit.com>
 <407ce3d77416bb2522b7906b0df3d5adf02c27ee.2bcc8e57.b8bf.421b.9230.3eea00252952@feishu.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MX+1SEN3H+wAUfb4Ey5q4ZrmV6yQqozBu/17RdL0+kSNSqdqFk/k2wfE
	hrNcx5S/e6tJ4OjSYyM6DIbMsr449EUy2LKBuXuHC0kVUD/VKDs+EAgMdYmD673rr1V4xLX
	yykITqKDcrNqGbnFgkaMo0GJj8NXSS1Jn6/2YFhoKSgI8O4NAQBDs3CCPCN0H9Ts6AhPgqu
	y//SnxcP3fuCRpCsckyDI5cLcmMADzyFsBxZC0L1Q9zbay7fMfZXp2yKYnfWAEdSIRPDhBa
	frSvXXCQ9lQrnJ25iPXFaa+k2szOKlXAAy05uWETc/kO/huQi73XqCDJ5s5Rrzv1GUBDuws
	mc8rgIA2FjsosAWjkJhmpeAjQ6Lj2ewcHWbblRH4q75CwRpwtlkFhAmDkPRgcfAHa7UMHLn
	3XslGjk/BUUrqhB7P4iG4mtMQ/7j5QFdrV7RTfhyCafO5uL98BEeax2UEj5cP8SHrlW7cMR
	Ds6ZGyBCyzl4bMuvdtE/PK+yyPHVKcaqC52XDuJv0g+FsDQONUoc7+jP1y3Q+3EJO20l1N7
	UAuDHjJybvD4ZK//NpsfKG4z/urJI2GM7GKJ1jZA/O73aAXajk6RUX0OQYfgb3DnrgirksI
	w3zsKg1x6nTE+SUtfeuo4FS3cimIzIO6HRZ+xPsa0BSIHKXyN3J2rdh1729jaRZzmPMbSWG
	8riTXOJi1BRVbeeYxAYl7s9RZneNNqiiGzrR7zL1S+3WU4G+p9Pb/Bz8MxpRid+6WrUOf0z
	XvspBZiWYm3fqOVmHeUGXExbOSwCqfQ2qOLDF7qgVbIClSn8jG/EAnzAY/V6QcO/T/R6mhk
	y/BGjxz1plcJ4D7I/y6V1W3BIFtzJWDmzkSfsaYwD3jMxykDsZ0Fi6WPOV7Bb6a23hp2Djk
	or5C8rRZoUdUZUVJRzKu0Q75Mr8e4NFbiEK9DpwP2L+qRjfQqpBnUQE1AK+Nf+kjuKS0FIw
	G6Y6aesXpIjH+VZKVYPWhxoyfcLKEOYsdr11FH7irZRHHSl3Vo9SxYhxZhKgz60Q5MROJr5
	BbMPLzWc7SwXvKfb3SphUQAm0SeR2DlI2zK2iMkLRq8+8aD7DBZLESDnyBLP6zrMhGvimVb
	MGX9BO7H5rDyqFCV188aC0=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

--1d5c24782d6347cbf5fcdf0c6fbf3eaef92642292ff9818598bdb521dc6b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 23, 2026 at 02:35:20PM +0800, Sandie Cao wrote:
> FML13V05 SD card slot is inside the board, it doesn't need cd-gpio,
> FML13V05 Keeps GPIO88 to low, Then SD card is always on for SD Card
> driver.

An internal slot does not necessarily mean the card is non-removable.
I don't think its location alone justifies keeping card detect asserted:
GPIO88 would report a card present even when the slot is empty.

> We check the vmmc-supply is p3v3. We have the same SDK DTS config with
> k3_com260[1] , so, this patch follows the SD card patch of k3_com260
> dts[2].
>
> If this is not correct, we will change it.

Could you confirm from the schematics that the SD power wiring matches
CoM260 and that the card's VDD is actually connected to ALDO4? If so,
this supply reference is fine. The same SDK configuration alone does
not establish the wiring.

If the card instead uses a fixed, always-on supply with no software power
control, vmmc-supply is optional for the MMC core; it should not point to
an unrelated ALDO4 rail.

--=20
Troy Mitchell

--1d5c24782d6347cbf5fcdf0c6fbf3eaef92642292ff9818598bdb521dc6b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCarN5dA0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQv0SkBAJoTYlHEntw6qzTvJySy6HApBMRe5LlDuAd7JRLO
XP9NAP0XoDVs3rpymXWxOxY0Su4MGjNUGi1VGG4nipsub909DA==
=Ux3W
-----END PGP SIGNATURE-----

--1d5c24782d6347cbf5fcdf0c6fbf3eaef92642292ff9818598bdb521dc6b--
