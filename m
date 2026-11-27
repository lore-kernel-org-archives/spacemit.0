Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.194.254.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795759516;
	b=4wVZ85/uL8ApHFH4ZjjHnhhO8qlKoaDW7upgWc48u0zGyLmDgR9UgcNQopgj3TfZFIWx
	 XFnwPRBKrPtWZEV24u4Nb4zMmn3fKG+wey13e4eMYat+DoKHkZqXaYlaxyyGfQYyTd7QZ
	 2M3S9k0p9Q8MXnO2crQg1tYB/QXdXd6ZudNs5ENJ3Z/eSkpMco4c1zTLa7DRgYnRdW3Fc
	 aSu72ObvW31Et0LnM02DXEKq9e8ZsqpSIzSkiNYd0NEh12XljQvkBBJ9wmbTvyYYz6B9p
	 khXzRB4oJmeUA1e1Hk/TVS8wdw0VNxfY+u2tHtXdSiRUuoUaiZ0ubxUe41A9+8vMDKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759516;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 Content-Transfer-Encoding:X-Mailer:References:In-Reply-To:
	 X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=7MogPv/8rDNnLROh2lJqUbjxxMwzFQktEETGe7LKoj8=;
	b=xO/gRr/28RGhIqWrtKrHuaZ50R/jSHyvrDILxaiIpZzYyjwK4rH8LkOpz7wVgefdCFXp
	 RzBBxqoIDaepsQ//xeBc0m2b76Z2vHmlb8BM2pN6swIi05+ETO36jgrwvQyYNPyfoMXcv
	 GxIzjhryxVm1o83x5m363JLvzgrh1LhyAJ4VZcB+2YEf1V3I395Fup3mUjj+jPetqomkd
	 yD07buj7/ucJvY3GIt3Vi0IaMNwH3JhlqkQ2B65Lw3C/y1avX3Wzd98r7B+TaucqrOorz
	 gQo5OtDXdY0o89Px47y14Vpd8xv5tAz3nmC7HL8P7Meb8zUS/NBA2dPnGDxtDkjT4NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=KcAjQ0Si;
	arc=none smtp.remote-ip=18.194.254.142
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0C7606A31C
	for <spacemit@lists.linux.dev>; Fri, 27 Nov 2026 06:05:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D0C7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=KcAjQ0Si
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795759445;
	bh=7MogPv/8rDNnLROh2lJqUbjxxMwzFQktEETGe7LKoj8=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=KcAjQ0Si0uqyawIDoZlyH5MMR3Cj4jedNyeUQLbcacXQb87gJymIiEnk7EHw+WFmN
	 g7eej1bwZqfqtsV0Lakx9m1mMgisIwCbnYBMwSwut9+pAYU+jjbWK0EL8brtsnpI8e
	 qYI0OzIKwHsxZt/SA5ptBY/kCrW1SyBQiekD/qdc=
X-QQ-mid: esmtpsz16t1795759443te5c7fabc
X-QQ-Originating-IP: w9ScYnFOG3tL2kivETE6oRptnE7ii6xkMYvcHsfyRpU=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 27 Nov 2026 14:04:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5566147713049927069
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
 boundary=511ec13c2b7141be0104885f7a52a1b4dfa31b6f2847b9143b414700b4f6;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 27 Nov 2026 06:04:00 +0000
Message-Id: <DN5RLE33ZA2I.31YRV21UEQO2T@linux.spacemit.com>
Cc: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] riscv: dts: spacemit: k3: Add alias for MicroSD
 Card
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Yixun Lan" <dlan@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261125-09-k3-dt-minor-misc-v1-0-dd887a8eb326@kernel.org>
 <20261125-09-k3-dt-minor-misc-v1-3-dd887a8eb326@kernel.org>
In-Reply-To: <20261125-09-k3-dt-minor-misc-v1-3-dd887a8eb326@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Ne6A6eRT3vSHjLBydMUawiFpAPx1wjo4FjP0zt1A++O0f22aAFsb+WCq
	pNiYYrWHNbABgGylE4FxhVKSJvQJcbTRlGc78OAtVxxPljcwqvMzxT+G4ROOjTqoPmRxjZ1
	iGQ1cUS6LN9oH/UHm0thEQxB2u/SncJQTv89gjnublLr8cIx/QvI1mpkHfnWQIjZl5GNc+W
	z4rOfjeoqvUGtBcF8suV+eocrlx8dEoiVwGRRVx9li9ohf0VhuomeqCGuIzRmA0EGXBzGVY
	qMB11Yt2DbhXTAsC+B9ZkxajOnc+cuuQQiWMS492UYYITq7arWcS2lJPnumhwFSxO8IezVs
	828gR3H0dctcwWxmwPtDW3EeTt2wnyNn6uQhSoPt+5OfRVIaI1tvXKKN7VPKsAxty6AGfT4
	3xC5wa6YotCeT2vPCJBIzghrr56ksJEcEyW0oAxck8S/1tYuOL26Nlib1BKlnKOXOEocIvw
	7IWAqfJRtAOkucNYFiGKh1Q9SWvmsgzDZIrVLoWk38kSRYzRCwm76pit4arah/kOlT5DkNs
	xSY6Zc4kMnvnk1xp/2b+6+0gXLXDHt5ylC6vLfkEEdDvUZ31s3yeUURKh7XAwcdONwmzU71
	4+S6ijR6iBqi4aQGoef0QNMEEACNnmEdsEgcuqXQDnQCZ5oIKXg9r3euXOMESKTwjfpfAsa
	C+WN2LmD7mx4nIurP8l6OgylfbymA6UXNUX4g7Ffm5Kr85eP0TukqfPDDOHcKwKznXFNUXk
	Rsd3sokgJnLZRGbGuNs/e5IF6h+nd+8il2FLNWKqqfGHjmtsU74mZ0CfOEoNDzoskjrRUUd
	Z+TQezRI7wzOQ32aACh8zk+XMJhumWfhRTjcveAuu/Q8Grb76mw+udQZX9ZS0v4GSu7K+x9
	Ha351s8qy8zdzLqiNLOlttm1SPuKGU4c7LH4ZdPaQ1r9167tmPM11HUvzTjU7KG9F1P3Kv8
	HF9KDKwwMw6f6WdMLvzKiSGTn3rG+uz0F/63fKMLbBsqyFu9QP/RGjdgXaRNEdtGYRJ0l1a
	vghvBZFQW+E5WKPAYVA6i7xkExT3D9umLTcnqr3oVV50S85TeOBK8sxRHhhT5HDaJb4QQwy
	il5ukVL76XiRJSAykEme0VR7wf32SzZ+3Dk2fFl08jHTn+yzObmrRI=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

--511ec13c2b7141be0104885f7a52a1b4dfa31b6f2847b9143b414700b4f6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 25, 2026 at 7:46 AM GMT, Yixun Lan wrote:
> Add an alias to the MicroSD Card for CoM260-IFX board.
>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--511ec13c2b7141be0104885f7a52a1b4dfa31b6f2847b9143b414700b4f6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCawkdUCEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC/ntwEAta30V/NVIohc
hMoxmKN0JKEAvLmQLLUpsNQ2ycAEFqwA/jDC2OlAs1T+oRQtn9mzwDtIxwKOZTqN
V0t3Xn2x+akI
=E6T9
-----END PGP SIGNATURE-----

--511ec13c2b7141be0104885f7a52a1b4dfa31b6f2847b9143b414700b4f6--
