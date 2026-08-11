Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83E2390C8E
	for <spacemit@lists.linux.dev>; Tue, 11 Aug 2026 02:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786416598; cv=none; b=jM72qpxZoMHrf2TwZG4h+VC2Ggv4gI7wmr9h3qv4+Z3e45sdgLF3oCwghgEFllkgbLdmgPICgLmew6hKJtd1jCXjwp2V2YmfFFwTOJmPz9yhorHq8hU6t+QAbugHRRd1eH7jgYE+SrkPJQkWuDF+lBOnaLmqm2flLhzc2f7mwds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786416598; c=relaxed/simple;
	bh=hCaf/OZAXHZGEcmBqrCd6lS6gZKLK4GWni+sbLcvavo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=rNwh963zku/sezldKzhmnwrcnUHBPoQD4yVt6SkF93RYY8MpH4iehkKAxgVa8lIboLeOF3fUufUaxuuJMeYPHBsyzkwODgh6YS87KJRutEIwVSjx2NXDcsZv51NrCl7IxCKyyUoeeJXyf5ZpMJbabAU3CHVku6LF+G+UU7wZ2+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=xdxLf8+F; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="xdxLf8+F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1786416552;
	bh=23z7k+eAUinRpc8zLgMJ/t0gpWvJdmcP1Li0BPBYWwU=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=xdxLf8+FH3LkSba6mwVuHMNjFhX8dSd4xAvsEOSQHBLUmNdSz0PU+w6hUNeyC1/zC
	 NltFsudWmp0QHDKYT6oN1uKJRbdB4wM3yq8KSzoFu1VbP++R0D37BFLPMMCcfYNDlb
	 DFf+2A0d+l2cN8Ool1cX2fxEPJak3SbCvp/uwHkg=
X-QQ-mid: esmtpgz16t1786416545t61b05b13
X-QQ-Originating-IP: 1Lvpn6o7ckoe/5uiobgyDQiiPwV4BQM3WsBUfeRYaQM=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 11 Aug 2026 10:49:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14630553172662809268
EX-QQ-RecipientCnt: 8
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=99dedeb8f6cddb1a793b7e4b254114face358367fe82cecc5177778fdd56;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 11 Aug 2026 10:49:01 +0800
Message-Id: <DKLRT9TOCY0W.1ZZ35K3S4Y5E7@linux.spacemit.com>
Cc: <spacemit@lists.linux.dev>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Troy
 Mitchell" <troy.mitchell@linux.spacemit.com>
Subject: Re: [GIT PULL] RISC-V SpacemiT Devicetrees for v7.3
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Arnd Bergmann" <arnd@arndb.de>, "Yixun Lan" <dlan@kernel.org>,
 <soc@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260802024052-KYC1424545@kernel.org>
 <93faefb2-5cd4-439c-a4a5-842ca5407975@app.fastmail.com>
In-Reply-To: <93faefb2-5cd4-439c-a4a5-842ca5407975@app.fastmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MeDrt9suTKKHaftXhxn9pWBwQ7tX3M8gVT9Cv7+4JEFaArB3V8SYl+ep
	bMxUvvzdHG2yUy9M0cCK3rM87e4dLAquwOL/V+G1WQUXyQLK6fGE2knW3yAh0gXb9zxl/AY
	pzJp7DVkqJn1jgyLlLP+cF7I51Dw2pEScu8GS+HZKlwy8G8oAxvdNImzi/HGB41qZX+2r2j
	fQPV7YY53dCyTRQWokD80gteQ31mIfLX5JJkOEv0eILtY+SGh5e20JNcEUzDNRp4K5cd41M
	W07zeDp1PdK0Jniz2yBfJCNb6JcxrVqqSgwGJrL18yGmlBLQ2l/utuEnOE/kpI2aOWeLR+I
	Yws76Mrm7lvLXKVj1ee+jR+nxPcoROa+hh49L17hc00neud8wYjvU2LNnUHa6hONZ8neSMY
	vMokIM+SM9X8X5W+tx0SBPew/vXcMEy7xnXcOZvv5POmmAGgonHO1n/deKCKFNr91eD1noL
	3tq4/82e6EY5dlyN87uAAvU2j+TNP2gEm8G3VOnCu0T8GgyTmvNF9SH5TDv74NVn2i3P7N9
	v2j62dc7xYMrHWDf2/LmUYldR7ttr9TA+3ljv5YGS3RUj9YNo85yjZTPlqpc+DYsSLaIqM8
	ZK62ilGmADzUUrHKyhMjZf7rLD2//4Jda1rljSuZgE7UGfzH3u8eqJZKqkRSEINJRB+sWwf
	wmEP1bnVXc2naakS0o8BJ+DUbmij3mpYne0+t8UWImVqbCCQuuN3f3y05UaUvpM0lZEVC1j
	JZ/dynlGfV59YIodzYErv6lN0e7Sj+fRcJ5v6ZVjueDT2I66/FO8mwRWvLL8uI/aUzAzP1Z
	DrlUqqR4ljfrrUg50VO21G4a/kCwBPHZvCzmWOG+97/kYDNhhXE+h7ndNz5eq0sVcWztQ0F
	e20RzoS9uAf6vkpM3ch82oCHr7ARIkJk2GSGTQ8RvdxPqFQnkA4Kls8QjcQQ5YlacwUKWHH
	8josAc/0fBmq9yeEWI43pEc0vvTIo+byvyuN5GvCu3y4pRwhs/sta+uPWiMn/OCulSt8E1F
	KJelt2ti1nI5fsXnvNkTFMJv7b/NYPK+xTzZr0KvbRyC06rZxo7C1OHdq3f7cEet/aMP45b
	bbtkNFUTDFLsuNw6lFvSJWpaolyKeHE1SHH3J2LC1N4PDr3Xb+dOoY=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

--99dedeb8f6cddb1a793b7e4b254114face358367fe82cecc5177778fdd56
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Aug 11, 2026 at 12:45 AM +08, Arnd Bergmann wrote:
> On Sun, Aug 2, 2026, at 04:42, Yixun Lan wrote:
>
>> Troy Mitchell (1):
>>       riscv: dts: spacemit: k3: add i2s0-i2s5 nodes
>
> This commit caused a build failure, so I reverted it for the 7.3
> merge window:
>
>     Lexical error: ../arch/riscv/boot/dts/spacemit/k3.dtsi:1181.20-39 Une=
xpected 'CLK_MPMU_I2S_SYSCLK'
>
> Please make sure that each pull request you send is free of
> build failures and warnings and works on its own.
>
>      Arnd
The missing macro has been merged here [1].

Link: https://lore.kernel.org/all/20260717-k3-clk-fix-i2s-v1-1-e95001a692ee=
@linux.spacemit.com/ [1]


--=20
Troy Mitchell


--99dedeb8f6cddb1a793b7e4b254114face358367fe82cecc5177778fdd56
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCanqNnQ0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvShcBAInWAqeYwOl9xiKq8oMW7NOqHZFkbqohC6XK69oo
j4B9AQCdV5AqZTECQxaBbRClQbUxQQC8iWgBu7Jjg/HpAqnWBQ==
=1L3B
-----END PGP SIGNATURE-----

--99dedeb8f6cddb1a793b7e4b254114face358367fe82cecc5177778fdd56--
