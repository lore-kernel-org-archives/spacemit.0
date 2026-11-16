Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.59.177.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794791496;
	b=TEMiLrm9P3EDXiXS5zij6Ldfhan9o8tYQy5v0adQz53oeIdq8W0w3+XQe823QeCT+7OS
	 zRVxoJWic7Hhp9jTHw1KFWUaV54hE91ndkwdOLb1EdgrMkHtvQoF/y6Mk0p6YqhBeJW4l
	 etdgb26oN5+4VCwudj+ApIZdixoZQBkIZxWUqbL2Vot06rU3Lc1P9nmh3jeGsG/JgArSi
	 B8qNp9FQLS6CT2i+1OwBQHKmvjO2yLaCO1YFjLmxAx3Ij+DkXArZ/uenpFPJx9n3ZW2UX
	 Jv/2NLh9C3uvhtVDHcMeZa7J3MMOssxwL7rn6fclMPkmv/8lCLSnGPQlhB88FVmGNUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794791496;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Subject:From:To:X-Mailer:References:
	 In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=o0t1BCCQjgi14aQO1UeuhL4GaUKuMi9CPoj6dUs17Ug=;
	b=yeRSJ9koH6Ke3ouYQVNw/uoBhX0a8Nj3h7JsE1iRDlQkKzx13dlQsRhm/Ocr/CQ2bkuI
	 ScEP0rTu9C+C03UErjZSYfmOBmRX0YlI66JM/djcrlyam8hM6ZWNNpJxuqW84EiW5GIYg
	 R+U5TA2sx/DGmBBZVZrfeePYeNgNtpRx/Cj4NLj/SslDYNuDDzadxBDdjqn1enGWZV7km
	 /rGSI7/6kofVkMIa5g/tHv+kgNvCprnGVl1Z4faCti338QN69VGLBhXXjOejdqG1sbzun
	 Zu+BX0VfrBWCOeoyawawjtXvGw1CirlktGwZWy3anB/ShlgQH+PdKjtjNyBozwlCdsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=qitWkOlW;
	arc=none smtp.remote-ip=52.59.177.22
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18196606A31F
	for <spacemit@lists.linux.dev>; Mon, 16 Nov 2026 01:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18196606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=qitWkOlW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794791429;
	bh=o0t1BCCQjgi14aQO1UeuhL4GaUKuMi9CPoj6dUs17Ug=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=qitWkOlWfBdU9bGhaaK2M6cSURL7bsZj74NFCD+E/EZO63omId/9ksYG1iFQncG6k
	 HtEKNbkAdsg59cLnXw5072A9uxWymuRyfSEwYjWVcFvmAZ4+oP3XTr9bDEu3sogmIG
	 l8MoI8MVBQmB49z2IS7ilZWS7Quf2viVMMvNBTOc=
X-QQ-mid: zesmtpsz7t1794791427ta4f1aa07
X-QQ-Originating-IP: lObPZKV0SB4c3ZJUWTaC8LoQmT3EgHmskcCwWr6avlU=
Received: from = ( [183.48.247.191])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 16 Nov 2026 09:10:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18264630976395257449
EX-QQ-RecipientCnt: 16
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
 boundary=d363dc28b863c8cf98ad5ce75942de2e180d28d9a726d55085afa3a1fd81;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 16 Nov 2026 01:10:23 +0000
Message-Id: <DMW8GL86YRLP.1TAQ98YVMTNUQ@linux.spacemit.com>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: k1: Correct missing space
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, "Conor
 Dooley" <conor.dooley@microchip.com>, "Valentina Fernandez"
 <valentina.fernandezalanis@microchip.com>, "Daire McNamara"
 <daire.mcnamara@microchip.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan" <dlan@kernel.org>, "Troy
 Mitchell" <troy.mitchell@linux.spacemit.com>,
 <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <spacemit@lists.linux.dev>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261113185214.182695-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261113185214.182695-4-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261113185214.182695-4-krzysztof.kozlowski@oss.qualcomm.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MWSAmC743koGz5ZW/HhYBjTxtt0sGEzS2SH5Ndh8puQIXjWpPpmV3W09
	znoeiEu6uEJzGjcZyH9L3hflVRGSPzMrok21RLGCiRh61MkAgrBBJWU4uZqgA5218KEDbQg
	A6IDEEU6jojNDu7mxFEEQNjAP3QG9v9rnrChAynTm8fQ5WjLmk+f2ejR4ujPN0I8ylTJUSm
	zH25DCnw/pC9DGmJlaoXXA5uJxjHU47q9uqkrDJgQmHxkD/EQnfx2dDV9qVQ5MOujG+6gID
	y6dWhZUCNqUL665uAiDDESQ5uI8O60yaIYevHptxyP4j2ZZY7AqZgo9mlzkbx16XiNbwRiY
	UNfWHYRjzqeJcLzlWgKpVbcCrjyLQDoxxdD9llOImapEwksvUBCxSjLw7QIUQ6dthCB2W0g
	86ItpXLAZrwA17KK1U7BVwz170EiTgwb0lff5FZaZh+BDCTp5EjM9NR+O0z/5+Zznzz6uxc
	EwAsJPZWMYDBvJk5m5KAj1ZkNDeFHoTcOJzaR/v+qXyUC2054/JjQkGqwF+gdPcONmciiJt
	MW5S1r/ZP6KESJ8udjzYXvIc/tUMfRjexmlRhs7DE/I/HsteP62nHbKUl7WwGgSnTrYPjpU
	CBttImc6OWuKamsnmBKawCaF8VVfGImuN/PowPdBHpb6frsZfXdAiG6VGMftBwi5yxmVBX2
	HXs9AlrWww/aOQ1+7BAVxukiV7BXkKniSvYHS+V631jl0JuSXoULU+4KuCvoKELrij253K0
	N2EdZdb/fNcYGvaxh9zA45wgvI2xHLy9SvzUwtAH4h71z5ZSvRiDmJ1yVpgkERtrzOaLNh1
	tbsr1wUC+i+aqP5DCgaT2U7ycBijF1SNIxxsU4H03HpuxQfHbYw8A8dWBwXzk1bggUMIg0U
	SRTgPsrG7mLzXVU7JU7ZAUwUfs24oKphSQHbMkpZkfdSavuwIoA8S0LVRNO61l8Sps5A3Ev
	ZdFA9/TF73epYJh6LXZOcv2gqvo9td1FysyzYpUPBJYLZ519irDhsU1jRD8E8GcjUqtnAFV
	qV40SgHjtRwG45WEW5xu3vFF5YVBBit6BK7RRa0woUsryyoWFFf3mwiq0jMSDu8oKJLc3pv
	R2nw8JnDI3P
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

--d363dc28b863c8cf98ad5ce75942de2e180d28d9a726d55085afa3a1fd81
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 13, 2026 at 6:52 PM GMT, Krzysztof Kozlowski wrote:
> Correct minor style issue around white-space - missing space.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/s=
pacemit/k1.dtsi
> index 542bfc0d19f5..5d5f7f8a393d 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -948,7 +948,7 @@ pdma: dma-controller@d4000000 {
>  				resets =3D <&syscon_apmu RESET_DMA>;
>  				interrupts =3D <72>;
>  				dma-channels =3D <16>;
> -				#dma-cells=3D <1>;
> +				#dma-cells =3D <1>;
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--d363dc28b863c8cf98ad5ce75942de2e180d28d9a726d55085afa3a1fd81
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavpX/yEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC9Y1AEAz3081/Dn4Mbc
v974nlcbbvDPqVh7978m1f3OFJC3JF4A/AhCMm4Su3LtVRzK32K68OxbxeZ/9a+W
x9XsPgs0ljYG
=TIPg
-----END PGP SIGNATURE-----

--d363dc28b863c8cf98ad5ce75942de2e180d28d9a726d55085afa3a1fd81--
