Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958223;
	b=buFfpvBYIiJgr0tCP8vlJzNUreHjl2BVNjrrgGX5sv4EYQwbkK4KWa9d7AgBNlAwTQAS
	 XmAWYP2NwxS79JcJBRLRmwYeakosUsw95xsSlrMGdn/MmCsr857EGwivhlTb8vUNYBUAL
	 NaN6IbYpEyQrE1HBGkjkA3/neFrjaX8vizdO8co5rNteH8VyYIThqdtEXV6ESnkcH3CWN
	 hUDRN5kVyiIsFyz6eCq3QcaM7xhHdzG9YbgViLs9immvUqMA5Uheb16wYPnkHWDqmJ39i
	 yn520jF22LhhTStfCIMUH5NBnUOieJmf0/Zm5UC6iv+TglB8ce1ZOti9D4fjOO7e5Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958223;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=blMJGbxMwm6av2/iDvDL9moahXaJKRpPkibjKFYQdkI=;
	b=jYJEJgWgNPYBoiKy7iazolvhHWqjPY/TE+fPbyrHqTceqnu4UfvjwKGEm/P1R5UkYsIO
	 SxuRy0w/r6Mj18lJdlbIR5pha2IijA1YdN/Q0xNCQ/nwkf4fcW0Iqbh/gZbiO/wyHepds
	 +cP9yexsVC3my7Ep7wC9di9FI+zFzDlMdhrOVR6tlmSJWUHxG4Ksu+8rk2mFjpfa9wjXg
	 Yr83pcHViFALFuc10gLDOcRc15ymRzM7es9mYARRwF2Gaw826P1pnA31fJg3plvdj8Dlz
	 31vD+1gFPCcGMKTbh6bIhpoxRKbDykjlk2F3aKJvvBMNwuNAPBqedi3X66GzTDLtAZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=fguBcwZu;
	arc=none smtp.remote-ip=54.254.200.128
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB30606A33B
	for <spacemit@lists.linux.dev>; Fri,  6 Nov 2026 09:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DB30606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=fguBcwZu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793958204;
	bh=blMJGbxMwm6av2/iDvDL9moahXaJKRpPkibjKFYQdkI=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=fguBcwZuma/+ZTYPeBCBS+YwpzOB/uE6cevPzKfZJUSFEbY6XwfJbNJbEXCJLmLY+
	 mKGW+Lhby4ramecbS+iIUioq+YKNeaTiFGSbivos/UzPTVy6f94sWZhaOo6KIY1DH/
	 xb4E+ZF9OB1eQVXts7u40vw1rCVnlq6hc4Z40rKY=
X-QQ-mid: esmtpgz15t1793958202t3e9cd9d6
X-QQ-Originating-IP: jIuZSmu909T2mXIbvXI+whezccbjBGBVhrC1Z/FFRxU=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 06 Nov 2026 17:43:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8979647044632498265
EX-QQ-RecipientCnt: 20
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
 boundary=a74825bda5efc2129772b0dfb928ded8e9c9b2e043bd604a7be0814b50ab;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 06 Nov 2026 09:41:31 +0000
Message-Id: <DMO12HWY5N64.2IJ5XMUKM8WWR@linux.spacemit.com>
Cc: "Breno Leitao" <leitao@debian.org>, "Ali Tariq"
 <alitariq45892@gmail.com>, <netdev@vger.kernel.org>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Yixun Lan" <dlan@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Vivian Wang"
 <wangruikang@iscas.ac.cn>, "Chukun Pan" <amadeus@jmu.edu.cn>, "Siddharth
 Vadapalli" <s-vadapalli@ti.com>, "Tomas Hlavacek" <tmshlvck@gmail.com>,
 "Muhammad Bilal" <meatuni001@gmail.com>, "Maxime Chevallier"
 <maxime.chevallier@bootlin.com>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] net: spacemit: Hold RTNL lock in emac_resume() and
 emac_suspend()
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Vadim Fedorenko" <vadim.fedorenko@linux.dev>
In-Reply-To: <6c36ec6d-5bc8-4ac3-8ad0-79eac7873b67@linux.dev>
References: <20261105123441.2524171-1-alitariq45892@gmail.com>
 <auyG7hGJtMzV0Gbi@gmail.com>
 <6c36ec6d-5bc8-4ac3-8ad0-79eac7873b67@linux.dev>
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Nt9jTSMqbQyw7EzQ8rBzq4Z9Zp4Alencx3ESmXDi8+V3mLaZZKAMQxag
	eMH/LEvUPhGMVz7ZJLR824JShUJQPkUwqRJrIqVQR8I+1vO1nnybph8pvo/4ASeUSejXE9s
	Fmdyu1SlYhXey1BW+R8MtZTV7/MepWDoy/+A9mLyPstGL8fXZznbExmEe7WVV6+1Mq2pmdX
	ukmf6WfY/X9MtRoJWdOVnOWquAk/TPWndOik7BoV8QR5kzbYGK1P/sMgffHeN1giaUlByfs
	02qFY+770r7A91OYa6+i6wWHeTnhrNFp6N3xJEVTb67IekgpUAsdIHn6b3JGAF/80WVJw00
	OTtwMp13ToR+CSXODrzteBTBRSZ8USDlYEb3UCzrYN/b7amLZkudY3wy6DcniHPRIJZg7es
	s4B4jB5euwKb2KFCPGw6vFmcKRGnsapzAKw5A36UQQwk6ApnwnH75rwyXvA3KrmYQFcLUlc
	Ll8gRK7GZvfzrJZlXkqX1b5nkAfDuCU+wvaEMfOUSqO2IJ/Z2j3I9AQb0afLUrDwnKpviY5
	dDeWAstsXz1nLcrZz+oqDVC9kX08NjUtwvSWeOiokRZYFUXJRiBD8mMbm8Ah0MTAxq3jabs
	XFh6IgD/Kbedgm/oqfEQZODcAadSNlzMeRvhJ19T+aIRPJYprZUsLFmm3kFMgNWTNNP2Pku
	0lUlAV1Ti/Ee0dQuIpHd7Md5HvfFnj0m3tHcqSrxJwQ65jDTPlQGkBA+qG3F+OqL+kysm7i
	cHvxRnUO197e9QnSMFpzqAD/j9YUHB8UZ/zRDlB/0CecNnzlRghzXULKm/uk2gsel2HvtUI
	K1bItrZ03usGjV07KDUAbRuttFUnzgyyavWvkUHoSv0UwVzumMoqk0mWccv2SBJeA5GzBeh
	k58gg+4IdTIXdOsvjm7zxaQUSVIN0lTE7GAXvu9iaD1IkAUIrgyTCoC/SZx5iF+Gzc2eSaN
	vWGf9+uMDzvoiqhzwcNgO6LWC94e59IplSC0rOixxp3HbPg7JiEH2QV3oD3OF35/uKcMJ57
	JQ7CM05sUha82fzRAIKckKwM/G/8pvpEVaGVQePkn60bZKdeVabLFCkfspO5VsqWqZkICvN
	agVX6jrGf0WUHwL39XMBR7++mlRm4d0CY5RZRvb0nrW
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

--a74825bda5efc2129772b0dfb928ded8e9c9b2e043bd604a7be0814b50ab
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu, 5 Nov 2026 23:28:31 +0100, Vadim Fedorenko wrote:
> > This would work, but I am wondering if it would be possible to call
> > rtnl inside the _open function, when dealing with the PHY? in other
> > words, shrink the time rtnl is held.
>
> +1, especially in emac_open() rtnl is needed only in error path case

emac_open() and emac_stop() are also the driver's .ndo_open and
.ndo_stop, which the core already calls with RTNL held, see
Documentation/networking/netdevices.rst +214. Taking rtnl_lock()
inside them would deadlock on every open and close, so the lock has to
stay in the PM callbacks.

--=20
Troy Mitchell

--a74825bda5efc2129772b0dfb928ded8e9c9b2e043bd604a7be0814b50ab
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCau2gyyEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC/sYgEArnzrvoEorz2G
Y2hnIBkthr/roqcA3mN1Myib4RGNrAgBALHeFO9LRWtQPHq465XKysk/b8m4tfA+
3Ot7ASy+eIcE
=2hA2
-----END PGP SIGNATURE-----

--a74825bda5efc2129772b0dfb928ded8e9c9b2e043bd604a7be0814b50ab--
