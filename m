Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.243.244.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795759509;
	b=2i/8Wfm8dL54+BSFKXeS/MA8DOOduKiZjQW2bMonPwl+X1ko9lHlYunc8nOXn7Tpze7r
	 UID5QHd+VYwsNTuAf8NmQVX9Tl+yH0HhpqXr+8yYUbf3wpOQfd2gnwhQ210hLA6Ag4aoz
	 CsJUPOi3PVLkpaVM78vp5xFanWXvReY7VxCAJuEjJUyqVoZ+qIbfjmetLr9aK2/Qntqk8
	 Nv6vGkpsp7+Qvm6oRbEJ5OslOKk+i566SmPynsCwatQJoZD6IPU/oxv1v8K1H+IDVNaUC
	 Nu30qSJFhNQYPpFetyujLrywAGp+yoAwiUBqVBQSHak7r8Hhk6Is46sWrHrlYH8VdfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759509;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 Content-Transfer-Encoding:X-Mailer:References:In-Reply-To:
	 X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=6JumvAHOP2AK1HGwC7E01j70Ya2ecZb8F2RHmqR9Yyw=;
	b=bxH12SRa12nhdfuJHCvdKHEAxG1Ogs/1kSGMWWn1HPlShi+y9PvWF7sjpeTSAUowTuKs
	 hWcki33AMndQ0rYMkuctGlK0E7NLrL7w2jG+/Dj3vTXX5OGIiX5mhqan1wEQxoGWFgpYL
	 nn0mCbWaL2TTyeFcKhDb5S73RUWmRYtD/NshZ3ePXepi9J9q9oK63f1VQGOoZYApzv5WA
	 1zqwQMqOG0vRQjpr3W1a+ozl7eZ3LAFEgtmKEZQzYGSMk4C26CfqFWOY3+ssJSykCqPZn
	 UC5zsUu3aRmRB/EZkSqjKgcyuiuvD01m2enppjDm7WKC84kXvmZLBl75HiQJbeMF3wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=SjWbyELg;
	arc=none smtp.remote-ip=54.243.244.52
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F34D606A31C
	for <spacemit@lists.linux.dev>; Fri, 27 Nov 2026 06:05:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F34D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=SjWbyELg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795759440;
	bh=6JumvAHOP2AK1HGwC7E01j70Ya2ecZb8F2RHmqR9Yyw=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=SjWbyELgTsWeWED3jYmyArOL8yB1+WDYq+9RBmOewKxunZh2NytCzai5KEfDfB0Ug
	 s4zqxPYS2Sf7JLEsp4dHdXWi1lcg/wDrioOfiGWOPLONq6pQoaOSId08PvGMtku1Wa
	 Ia+E7vAb5VcxJzA/74dUR8ttZ+jUOj5drKj8MaLE=
X-QQ-mid: esmtpsz11t1795759439t27ceb795
X-QQ-Originating-IP: XwpB4emc8zy9NTegUDS57CqD1DRQzcVkx6sNW/aBB/8=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 27 Nov 2026 14:03:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 934310561638399512
EX-QQ-RecipientCnt: 13
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
 boundary=bd6d9cb74dbeb1ab2a51de9674e51bbc31851864f70b55408179a52ed7d6;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 27 Nov 2026 06:03:55 +0000
Message-Id: <DN5RLC1L2N0Z.1ME02BVHS65GB@linux.spacemit.com>
Subject: Re: [PATCH 2/4] riscv: dts: spacemit: k3: Use Pin Macro
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Yixun Lan" <dlan@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261125-09-k3-dt-minor-misc-v1-0-dd887a8eb326@kernel.org>
 <20261125-09-k3-dt-minor-misc-v1-2-dd887a8eb326@kernel.org>
In-Reply-To: <20261125-09-k3-dt-minor-misc-v1-2-dd887a8eb326@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OdIVOfqOaVcrmUNXitjS6/aXuZkeD+O5Viuy63Ul8Kw8M2DoJGz9VPB0
	CPUcqyoEzyEpJ5qwdp1NFOAuAi4Yx3M7dQoxCi3rnqEtuiS+1SSMA3Ciskn4GG7fHSENBbo
	tS1oDp2ctJWxYLp3T4g3BtNd7U/45fZVoxXC7Sd0gYripEVQ8xvzoFp5DYyDg8xSeXhXLoz
	knwmZHxwAL5ADuN0kVFAJ7+e8hltbCPgVZ9TMHtq1ZjMWUVt11OuhfCdfs64ppp7jkdFXaK
	m0v8u7Mb0BpttOSN7s3PeWvzumjYVG9bH4izPpx7PtoGxtoWq7cthz+89argfIGGw6uWg3V
	v897SvxWeJXYdSszoR0BGK8UU2UCyMU6FOcEa7ZKpv/QDD3gJLQxtTB1SNk/rdlfsdZps+e
	8NnjckpewPEB5lkOIatS1pO7yS/6l21Taerpodt/R+KFsTuRFvCEclEBy0D6rwKCt4IZjUw
	+mWXUrRKxsYlQVz5DKCJjd24NQkgXYSBKGvFKkpaCnMZHPxBPOSSb9kdOUcdq2TSaYo/2mZ
	S2COtGL7ZNEGmTwSQkrtjcTW+nRmbSeno/rd4Rfg3IaAeF4qKnyS4lCtC+LbflRqfnDR4AI
	TGivqW1Y0ZPLv6LG+7Zlf2vf6e3kqJCkbtyBqvS928ddCHHRI9+0tZwii+QGLxLFgu/4qdt
	sSdQ1IfLIEWHMOqCif9TzeHu9wHq+DUZRn8puPYOB+Pg2h2k9KOdimFtsi5wuopNRLBOFb5
	amf4r5hTgSUXRJTCFe+Tzp7fzMF26mPp6i7OsDz+bFKEro/oG1m1wZS8SA3cOb8a+fOYUef
	bywOS9m1PQA4g2/WPtYzQEkxHIjjopYqkBuwd0Y57lm8+DaM/6X9jBL3QPT8lTLOy5VQkml
	9yNKilH+pDaA7MEOT5yPyH/jDA8L8jrOD+jBwGG9n92PAqFdOYg2LcImbz/GYjdlcTlrc9E
	SQNzDnwt9EyJuEaKMjXdQlc/UZIfd8SU4GtKM+oV8Sig3FECDTPUDFi4paqLxxx3WdBMx7x
	KaPYG2bHoJbdrSr5Uyxa3hp3EsCGCSP5733YCaz1/gDY3Yp91BoIcPXthebLbT0hkgp/V9r
	V5+hq9ptSaEiVFxZhuJfeDc9BhCOtvCmIXImpcdy/tZ
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

--bd6d9cb74dbeb1ab2a51de9674e51bbc31851864f70b55408179a52ed7d6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 25, 2026 at 7:46 AM GMT, Yixun Lan wrote:
> Use Macro for the GPIO Pin definition, which match enumeration from
> pinctrl driver and make people easy to grep for debugging purpose.
>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--bd6d9cb74dbeb1ab2a51de9674e51bbc31851864f70b55408179a52ed7d6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCawkdSyEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC/PhAD+MjsNYLaaUSS+
jnOaXI3bd6fSlgrwHfaHd0YUBnotjDcBAIENH5z4d1y4JP/lnkqh0ElpBLFje1LC
PTNC3ih9fLwP
=j3if
-----END PGP SIGNATURE-----

--bd6d9cb74dbeb1ab2a51de9674e51bbc31851864f70b55408179a52ed7d6--
