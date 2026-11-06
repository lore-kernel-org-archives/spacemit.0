Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958214;
	b=Ejx2hGNUUrxncnH7THGwzoWgYW1P/9U9NoykOK/nh0i5TLCLOSbc4HOjRnFZg0wE/9zQ
	 VH/i6SNNCwadoqjvXG6n2Stn0dtP6ajvLyLNlAtBlpACU4gTrYDztFju3eX7G0Cxkd6U+
	 dxGUnepO7AqjOhib8tfWXV6YYK6M+Eey5ckC6TuEpy2J2lDFAm2GkpzD91z7eW5XCLvHp
	 uj4g3oqEjb7L4SFoN647OmkFb/wwY8Y8t8ksQgF8u2MTElboMwDw4kcbVvOzXi9N4fmFy
	 CQWxvxvpaHyxq/4KQVQdvLY9sg3KvZbdPgUdhy3dbOaAdJYVN91vTUmYMLZ+I/7I7BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958214;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=9/DtOlqcnZlR+V7YT17eJeJ5DWSpW+gyRGTq+hXLQi4=;
	b=taJX24/H2/m1yl0SCPSP5O0GzFrTfrNdFJS4K29JrZa+c5AbshJwcQIAvXhvvX5bmdZd
	 Br7BH3z7OfeRpJA+4BKFHi8DcY0FwjIGkWgM77WipCCbLIIoAh1ychERZBwh971q001sp
	 fDG4Xso/3a6CyaCJAGqEO/ICLIQ5izbcKDQiaOfdf6GmDBXd36pLyJ8gR6YzZpdFbTZc7
	 ZGtq8q+2v+V+PaqJ72q+9Ek3VV6+Qb442bDp5x7wQruWBbvhxCcc8YiTEUS/A+vgcG7vy
	 IX4HaCPXoXPrtvsVB9+V+Z34/4h8wD95JSPjG5+LeEWp3UfMLZT6FfTBE+uS6uLQ9iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	arc=none smtp.remote-ip=54.254.200.128
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CB3606D80B
	for <spacemit@lists.linux.dev>; Fri,  6 Nov 2026 09:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02CB3606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793958203;
	bh=9/DtOlqcnZlR+V7YT17eJeJ5DWSpW+gyRGTq+hXLQi4=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=KfyeBrmRxZC795BGZXcsb8GC8Xj4QqIV53wl1G+HcWaXH8fT4JR/bKrKAiaoDTHer
	 qA6M4gFQFq8C5JniU6h30Cbw85wbTL9efCZx2Jpf/upGxFH8NmBJE0k4UECB3y7d46
	 9kf4o/epgJ4egOOEx84801WS4bphWTBz8EwnujRk=
X-QQ-mid: zesmtpgz5t1793958197tde09d153
X-QQ-Originating-IP: SSnJYTmBN3BhoxreIb1kPVMxIhg0JADN7bMGfACzEgM=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 06 Nov 2026 17:43:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12871150989678230177
EX-QQ-RecipientCnt: 19
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
 boundary=f1f8309b4664d3b53368ed8288ac3d7ae208ce6bdd6cde5c5354fa748c09;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 06 Nov 2026 09:43:13 +0000
Message-Id: <DMO13SWAGZAN.NYISGLGI7Y5A@linux.spacemit.com>
Cc: "Vadim Fedorenko" <vadim.fedorenko@linux.dev>, <netdev@vger.kernel.org>,
 "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Yixun Lan"
 <dlan@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 "Vivian Wang" <wangruikang@iscas.ac.cn>, "Chukun Pan" <amadeus@jmu.edu.cn>,
 "Siddharth Vadapalli" <s-vadapalli@ti.com>, "Tomas Hlavacek"
 <tmshlvck@gmail.com>, "Muhammad Bilal" <meatuni001@gmail.com>, "Maxime
 Chevallier" <maxime.chevallier@bootlin.com>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] net: spacemit: Hold RTNL lock in emac_resume() and
 emac_suspend()
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Ali Tariq" <alitariq45892@gmail.com>
In-Reply-To: <20261105123441.2524171-1-alitariq45892@gmail.com>
References: <20261105123441.2524171-1-alitariq45892@gmail.com>
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MzZqz+taJMIt9SZKFNWImxRRAgVc+h7Ws1Z+YWOGTgzf/gAmB7h2Z+vC
	7ya7owyEkVzrUS6OerFYKnbgmxjXklHiwTTHb3dQf4RCHpnfLKK/QQQ+DstHiyqVyXTXYCT
	O7YyApiICUDpsFseMG8riEC06BCOdRPNHJT02dp2SoL/GPycejYAkMGqkEQxL5VTxKBqShf
	V3TZfLBYx73ToV5BdVG/0RS4yrNVZ34KTH00OQ4pgtZSN6B2CQBKjFXq9Xr/Jf6W/KxwqMH
	XGOe45P8P4l0505rUuFFS/G90MZZElpKrY57J0rpLR1e/BUv+5dodRv2NyjjUt/lTWAjLty
	qDwB6p/xKfuIWDLbpgt5MWrOXIYoW+wsf9yFk60f/4IZ4q4zCwUrQkRFM6VJbxkSkT8AvNY
	28JhO+5YJtR4oTQK8D+HtUJMpcWYQFvyvtdO4GvkKgs5JsTKse3o84eJpvhlRecjauUstpU
	F1EKgFkBfC6F3b618T1hOfxNVscAbiN6pA8CUs4LONEdMYr3jn/hcFE1R+tfPyEfyYIHVej
	WoejMGkDWnKc1d6QMb6S/7Z9YUZNCAndXbSVaq6gXYzstvfb5+SQSfFFqZJdONKc8BRZkbU
	UWJ9gKe6bOT7o7XbxGHWOtfIBXqYZiXzUmV/y5J05UIHHj1ZvMDRSlzX4x4NzI9suSzKEFn
	bk+ixysM3xUbgf9sSQAV3ZxWhZUKGYXRgqj+S9PmvohJlr47mUojyf5zOz5Z1k2T/u5Y1hp
	8CZJq66eGxxbIXxpVXLle6t/RJPI5F4lKmq93wNGMRg2hkiswADVn6e6gOLcC2ECygsVc/J
	Gv5yn8gez+SXvzwJmRIr33eTmoq//CTclwJaktkD9ShwaPea6MG0cnQGug6ZHkqbUhH2PY0
	QwmkB0DYS776Fi3sL6dryr7Gsjg7koh5Dljxz27WSEH5MWPydnsiy2KAvIyj+hqFePgdmEk
	sTpNstbhLE1UN/weZYoqghVQokVyqEWXL/xtwi66naaG3isWoVTOs9I8hM4KNSYLVTDZLX2
	ymjMQONZKAvKsa+6g9fEvpZoL8sMZhjZf24ogIogUs2xReCa7oBgco8oh6N6sg2YIj1RAek
	OBV5U/hBQY1
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

--f1f8309b4664d3b53368ed8288ac3d7ae208ce6bdd6cde5c5354fa748c09
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu,  5 Nov 2026 17:34:37 +0500, Ali Tariq wrote:
> @@ -2056,7 +2059,9 @@ static int emac_suspend(struct device *dev)
>  		return 0;
>  	}
> =20
> +	rtnl_lock();
>  	emac_stop(ndev);
> +	rtnl_unlock();
> =20
>  	clk_disable_unprepare(priv->bus_clk);
>  	netif_device_detach(ndev);
This can deadlock. emac_stop() -> emac_down() calls
cancel_work_sync(&priv->tx_timeout_task) with RTNL now held, while
emac_tx_timeout_task() starts with rtnl_lock().=20

--=20
Troy Mitchell

--f1f8309b4664d3b53368ed8288ac3d7ae208ce6bdd6cde5c5354fa748c09
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCau2hMSEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC8JlQEAndRU8NMombSV
ki0R8/v7iIuQ+4g0XE3owkq22upYmUgA/1pcBD9aP0bGv/WS5y8ksJFFjURLLOBw
QJMXWHSubnoE
=s+my
-----END PGP SIGNATURE-----

--f1f8309b4664d3b53368ed8288ac3d7ae208ce6bdd6cde5c5354fa748c09--
