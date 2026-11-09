Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.59.177.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794206266;
	b=BenpZrcgblBftW22WgBkhtnOZATcHDOXJqFjGumoiPoxb3TNOP4MEaOVQ5To8Qr4YHG4
	 k1aNhrvQiNTgU0kfyB/U1mAXi/eo/ndaXGQiOcxe0Ioq+zjTFmMJiiMpGP9ARZy3OKs4I
	 8vJ6qASw+0S/Zo1PEoHr6tjBcoK00GXjWqRIJ8eEMGwj9RrvXL83Dz9myLZJMYnX7gBeB
	 Yp+kHjiLNVm8AxozKfC+tZj66o4Zvg5VEoNKw3yG/xYGnIJQ+ujrNpLRLwkXVkiEy3rdD
	 z8vqav1s5g7/7Ye2qtFL027DWeArx2aUkwr/xGgfgJTeAcuq7xpFc01402/j+ApLIXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794206266;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=63Wz6ya2Ub8ladEeQkfoYbpXC+w/iRW/EVIKhqbn83Q=;
	b=yDjOB4Or+X0V5NKiQWctDbmMO5YZd2tzcxiwzMmlNWJsEp4AvzZopTmD+lYIPN2KHM2H
	 6QVAiCJL/CKADOUAnz4YhhhNsMikUqBE7wzeD1+hyxq43YmbnuS3y0j53jeW+rtSi2FMW
	 R2TcazbWS0kHi249ZItTt+AtZVeoUOlLdbrb42b5k8PWRpGSt/YKIvLuSG3ZQXhoqYptv
	 n9Er0D9bt65GOQendiiVCC9OKJREiQaXZbWx9lUv421asXEo4SBHfe2fzKgEcW87iij3R
	 ObhDFwAVGVbjTnwv3IqhqnQbjlz4w0pp4ScED5SuMX7JzcjAZixGHlqYQ/+yfIh+0Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Ax4+Nkf6;
	arc=none smtp.remote-ip=52.59.177.22
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17E2606A321
	for <spacemit@lists.linux.dev>; Mon,  9 Nov 2026 06:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A17E2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Ax4+Nkf6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794206210;
	bh=63Wz6ya2Ub8ladEeQkfoYbpXC+w/iRW/EVIKhqbn83Q=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=Ax4+Nkf6SlyJQVrqU8AOFCa29lZAIFOq45qmtxyFF3ZkKV/7vD8kXbksR6cRDDwqD
	 MSK3ifLWilMBhigQnVA+nle3PZ6byPJmL7KXdiHTX692AJjF6sjvdIRFEGyc+iBLXN
	 U8O78SZkH6OnHUvShtMHGWqSqN8E7nysNpND3aS4=
X-QQ-mid: zesmtpgz9t1794206208tf88a23fc
X-QQ-Originating-IP: 4Kw80jsSiSoIoW3m3hnDtE89tjQ7Tcvag4h7VzdEA+o=
Received: from = ( [183.48.247.17])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 09 Nov 2026 14:36:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2280427375327430452
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
 boundary=07ff8aa27cbd94e52b83dc30c3f2c614bf3b214041dadeca72e11e5b6b3c;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 09 Nov 2026 06:20:18 +0000
Message-Id: <DMQGO2MLJM8M.27VP8Y08N5IXY@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>
Cc: "Yixun Lan" <dlan@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Conor Dooley" <conor+dt@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 add USB controller and USB phy support
In-Reply-To: <20261109033310.361435-1-sandie.cao@deepcomputing.io>
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io> <20261109033310.361435-1-sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Np0qb5kW85KCN6RNczVOG8oaLXglSpzXXuAybWojuRYr1mg7jMUi6E2D
	gTlc5jvpRRMCB/rDeskvsCr2p0U0CgezIW0didKXvhtHdismfcF7qg3Ha0kSPHi9UVofOO2
	RKo12Np2gNacKzyPGvgoc2Gsrl98FqctqhfF8V0TTNemPAMSknhDWUChrwwk5nXlePelnyS
	5Q79cD1+av2ArzEOHBycKkgub1lrSronvtSna5lc+uQOYACZQ+yHYf7dBdkIBEa+5UYOhmp
	mIK47rLQbhEpuIKD9on6d0ZgHoL0pICm8GMGvnVkfS0QNjxF4SxpvZimCJIhO2op+pZ3to5
	sGimaMmWcz+CXFNPn4XsF9lyJtVUXjVT2DZC0xTDMoEoK/43A36S4HzDrXa1EQpeVJomzLK
	2etwF1o7KaA1720BLmIdiW29y45m6bV+nv6wp1VO8hvGfjpOgi5cuYUaUeoQVn6pdbr90r6
	3O4Tgj7qNzTcGrkQcvQ25pO0zOfrysrA6QjTHHrA9PfRfwPAHswyBOC19UrAw88HJAM14vZ
	Q+0doWCYpg2b4E/6/AbXpef3iTlVW2xEKjT/5G6/NDI83nhBjjuzj9px3cDlSVkR3GGPnOg
	XSiybRz/E3o3tR1Hu2WPy6nkg3tWGE23GbgeaHEum0XKrL/EAKEDr8DNUG1S+BCqCctkukr
	u0RL4SJC3q1K3PWFudlRa+nnLyTW9+t5DGtXhFDICysNL88cY/kttxCKTcy7ejzrbsn94/5
	hv8mLa5vCdVP6bR5TUiisH1BZBjE48PIr80Ui3ZOFALoODS22MVGgMsMTEWMvjhq0WEmSU2
	uceWwbzyXRbDBPgjOXuiFThe10F12thAViTm8GO2k19nStzLZZO6J/kDM+cksXRZM8S8t7f
	yMCXgZW+4SYEJPAQxj0jw/cF+HMzxLrlUYjUCPy1uSMr/2Uepk3ORvfhe2qdDJZsMEZowNA
	yV2c93Csuc6w/M6fCGOxXxHln7NlM2NiMv0I4X6mh3mZ9S6L/Xbxuj/5LlxEgaYard60P1I
	OhmJ9W0B5X2jJrLE/50TGHb2guS+O7e+y3tKCxSoZqCvzHp7kNEBro4FHZeVAnkswKO2JJs
	Q==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

--07ff8aa27cbd94e52b83dc30c3f2c614bf3b214041dadeca72e11e5b6b3c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon, 9 Nov 2026 11:33:10 +0800, Sandie Cao wrote:
> Add USB device node (b, c, d) to DeepComputing FML13V05 board.
> USB A works on otg mode, it isn't configured currently.
> - 4 USB-C Ports
>      - Port 1: PD 3.0 (65W Max), USB 3.2 Gen 1
>      - Port 2: PD 3.0 (65W Max), USB 3.2 Gen 1, DP 1.4 (4K@60Hz)
>      - Port 3 & 4: USB 3.2 Gen 1

This patch also enables usb2_host with a GL850G hub, which the commit
message doesn't mention.

Otherwise, LGTM.
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell

--07ff8aa27cbd94e52b83dc30c3f2c614bf3b214041dadeca72e11e5b6b3c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavFmIiEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC8tWQEAvywcD7bi0gZG
WU0K8onUqh+/3IEyc9XrO53vzNr+45sA/jcO9Mg0Q8AqUYEJVihVUDygV2P5RiZj
MjJz0ZzzqV0A
=YdL4
-----END PGP SIGNATURE-----

--07ff8aa27cbd94e52b83dc30c3f2c614bf3b214041dadeca72e11e5b6b3c--
