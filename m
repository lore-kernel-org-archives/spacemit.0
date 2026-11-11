Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794390761;
	b=BpiDWmj4NDOp/j2zFx3SP8zcB07h3u2deAeWqwcGmLRN3tVZJi+dP83NQf3CG0FVYTp4
	 dVjaOUT0oX/njxWcb8scBvzimhX04zGZ/JsA+aoUHKoAMprNNvwLNyXBmY4xNunMS+G1C
	 cD5okrCYtS5vh1ywZ6XmRQiOrYZobgFGSiaEILrzQpJcfG5iwAgH7/9togkiyaeH7l4Ri
	 ameUO00zEwvVUbqxroZ6cT61E+Kh03kIj8U+MQg+2Wqnto8KZfs4uobToYD0lUezb6sc0
	 xZElsg/865JSADOvug5hblicZNqnswLpp1r5VIsKCTTwWkBedq0hSxfDSLzmJAKqtww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390761;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:References:
	 In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=DG1BenR9t2CnTlPb8/ogURcL1e6BMKuUq7sc1gbDGHo=;
	b=DxLEvWOGsXwGV7X5McvmNkZKNGgQ1jKP5yyVlEMwRtGM7YInEALWIhAnjcDwC3McoOjB
	 lzeME0AX0Tu92puv3gkGKzhPp5IzTLPLdiQDLrLAhlOdwjrl22GVZRWD4iEmLsLWU1mKl
	 fencCoWAWWXujdl2aNbWXqKeWOuCEUc0AbHHabZ2JlV+GEut3hr59I78NPYQLt1AxtdUY
	 IIZesOVJmrNjqP/2iXkKnr/EHdr2o9Trwp2tqkWan1mW0dQFIwge1VP3NXij06F5Qv2oK
	 +/5F9TzoquT2tVLI/dV7+8pA05+VbLETQqvnEamfj1ZmvUyB8Njsjm9Z/9+zQ+mw7dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b="mjG/+kMn";
	arc=none smtp.remote-ip=54.254.200.128
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A55606A333
	for <spacemit@lists.linux.dev>; Wed, 11 Nov 2026 09:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20A55606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=mjG/+kMn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794390726;
	bh=DG1BenR9t2CnTlPb8/ogURcL1e6BMKuUq7sc1gbDGHo=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=mjG/+kMnUZWetaFV2Vgby66+o7QHCPRGnJHM+Bh/iaW6tWiRlrgQtd2xeCaAP0gzZ
	 j4KvD70sugn679HzzhTC/Izg5XFeaR4rjKNu0b7IuYdxgeddjVIdqJ13P3Xj2oNdZ3
	 3n3ngqxTuJ3xejINVe1W681A6WlVncjidL7IbWUA=
X-QQ-mid: esmtpsz20t1794390724t563d4722
X-QQ-Originating-IP: fXB4PNbNwEfDwLguUILLu5oL1M0xcKGD1gmFw5eQsO8=
Received: from = ( [183.48.246.46])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 11 Nov 2026 17:52:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1931649316664943864
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
 boundary=6359a66ba761be3e5a04adee6e9d479520c40fb2731af54d02b8be3e9469;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 11 Nov 2026 09:52:01 +0000
Message-Id: <DMSAF9BN11D0.IDM8IS01DE6B@linux.spacemit.com>
Cc: "Vasily Khoruzhick" <anarsoul@gmail.com>, "Alistair Francis"
 <alistair@alistair23.me>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, <linux-bluetooth@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: enable Bluetooth on BPI-F3
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: =?utf-8?q?Fr=C3=A9d=C3=A9ric_Mah=C3=A9?= <frederic.mahe@cirad.fr>,
 "Marcel Holtmann" <marcel@holtmann.org>, "Luiz Augusto von Dentz"
 <luiz.dentz@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Yixun Lan" <dlan@kernel.org>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261111094557.443481-1-frederic.mahe@cirad.fr>
 <20261111094557.443481-3-frederic.mahe@cirad.fr>
In-Reply-To: <20261111094557.443481-3-frederic.mahe@cirad.fr>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MQATRXU0qUVPtMJGdV/qYTqHVHYqtOb/+8WoFrBTaqq+ETn+zwvGt12e
	jAap32TdQuikSDDRXc0uznT5uAUwCr2P/ZUlr8iJ2rwGTb6V8BgJE+iFrPcBHulhC4X9EbE
	D3u5LQXFmzXULkNAyslr77brZ2cFoUDzPRXgamKRGyyoWlhhe5fbSty5LYarOKSnmkWdEVC
	YqHnsSZ+VopkKAGHvPFLpUT/UMGwQoyu4WSnuS6JHbVKJ7mxQ0ZQv+9M3mSLTsaBhUBrP4e
	CLy5s6grLFbF7VtffsL01J2w/q6XcoSIOOrc1hBzG8dO743sWUb0YtFDBn9+12MT4gHDnfB
	lFv/gbBFWilS8far+1/DVtLzzMEWGs/NKPE+zniTOnL3ePPLutoRh00fXYFbf3XCfFimA0T
	Y0TN7KRfLh7GuyIzrLyUqxpmbiSn8nuPnfet1Z7wsrB22XY5UdbQsMXAw1EHONLgXc0KY3Q
	/DknF6ft5eBBTr2fAVx1ui7OdzE9SVDOfXW/LNzqfTEXwzAWBIgLVhq9sfN90l2MbJ2Cjay
	63BJJWLVFrefBmXYCfr+dIzGdR2GxY/iN1y/SNlcpHTicnZkjp38Gvr78G6v7snFLvVV3L5
	pJui0ETk8VGkhBXBRMfnPL1gx1HihvLz7gJM8eLXpMDVVJtz0K9XBzVbbYodB8pliGyS487
	Z/4DF8i/G0CIWQgNzTrvDz0RfmFa3+4OPdL9G45kaUCd4XbSoyIZ9Yg+r4PJuCN/DKnShAv
	VlXu5JNP7eCS61AwCGOrCZV4jbywshcnD1r5ccA3N6+ToABYB6awhv9xUV1oNfuxJ81m9MF
	mQmKXS2kOgH6o7eqd7vbhnFA9dxB/hTrJp8qEU8CT8cbbybKPq3HFIy77BNVa6MfuaA2qz+
	pn6tO+0UmnPRBN23OlKh/q+o88sBmF/p2KijUYWuhftFrRXRFT3YFWFGXVHHw5+YxmW0jWM
	mqpkrX+6kJC7oSyCFdwYYGF8VSgfufvomqgF3xN51P+ZU/X3yZQdvPSpuR+nfimVLUYRCv4
	YKdwFdW5aJO061sef03Y+2+nk25uNf+44pNE3ZK+19rmWVJViKlnfThxZMEZ1XXTAYd3WS8
	wt5nFb17B84g7MNTSISy8Q=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

--6359a66ba761be3e5a04adee6e9d479520c40fb2731af54d02b8be3e9469
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 11, 2026 at 9:45 AM GMT, Fr=C3=A9d=C3=A9ric Mah=C3=A9 wrote:
> The BPI-F3 has an RTL8852BS module whose Bluetooth part is on UART2,
> with hardware flow control. GPIO 63 powers Bluetooth on and GPIO 64
> is the device wake line.
>
> The firmware config switches the UART to 1.5 Mbaud, so take the UART2
> clock from slow_uart2, set to 48 MHz.
>
> Tested with a laptop: scan, pairing, and l2ping in both directions,
> including incoming connections while the UART is runtime suspended.
> An 8-hour soak (an HCI command every 20 s) showed no errors.
>
> This patch was prepared with the help of an AI assistant (Claude),
> which also ran the tests.
>
> Signed-off-by: Fr=C3=A9d=C3=A9ric Mah=C3=A9 <frederic.mahe@cirad.fr>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--6359a66ba761be3e5a04adee6e9d479520c40fb2731af54d02b8be3e9469
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavQ6wSEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+EYAD+PVfe6aNSkOPl
AkTo/K9XuL9d/7QM1aSnDy4F1QOkuwsA/36C73njG07WkyEjw5wg2ulhtMmt7wNc
2/e/DVeUUG4B
=v4s2
-----END PGP SIGNATURE-----

--6359a66ba761be3e5a04adee6e9d479520c40fb2731af54d02b8be3e9469--
