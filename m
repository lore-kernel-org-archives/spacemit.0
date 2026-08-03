Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BEC39A4DC
	for <spacemit@lists.linux.dev>; Mon,  3 Aug 2026 06:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785739137; cv=none; b=OiNrWRRcBiWnGvKrUzPMEAAnio5D5ukDkZRI9G/wjVZvCA/gCeBUzSaum43Jr9RjjaZF218EDeHQsZqKZ/McGP8sZYADGsQt2Uj7KB3NoG7IMid1/J5GAVe5JsniceXSH5Q0g6A7ygMCLEl6/kULE1eWgl7tCJpjZ/9SzOY0OWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785739137; c=relaxed/simple;
	bh=QA0RG/EQoZtzcGyGC1Ik+B6R2bJjbNfpUqrsFDDIkfw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 In-Reply-To:References; b=Ly5oxmy5B4LdozqGORVB1DwGRTo2IvXs57Bt3Z6QpWlJesYCbNB0GEg+pe8eZfS9M7asRjGQSq/U7NQln0CRmoUeNKPllnzNEyG1vpFLQbRZH5I4/OEdcBA3sR4jgqFfTJ12f2OVu8v3kJzSyQz9D3JBeHy9/xSzsrE+agdHGqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=xSNW6L6S; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="xSNW6L6S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1785739082;
	bh=iihdqU1c6yaNLkn8c590s5INJB5zg6KyI0acQDBou80=;
	h=Mime-Version:Date:Message-Id:To:Subject:From;
	b=xSNW6L6Suaj22+WCF6WRfe2hM8qq+rDCye0l6RFSFXwuIcroHbFMN9y+9g8R4Jo61
	 R1RMcJGnnhLUF3eA5dCHerAPsod3Lh2lv5Y4B3fTfTwvcHocDiv3yJenH2//po9x18
	 0sc23PmKLDhMcHOstS7F64h6DY8XfrkS0HfN7HpQ=
X-QQ-mid: zesmtpgz1t1785739069tc326f37f
X-QQ-Originating-IP: I2fEBUXTYbdVIOREQA+XjLVLEyZuRzP1HgJPcBmEwRg=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 03 Aug 2026 14:37:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5329433773290095816
EX-QQ-RecipientCnt: 14
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=3fac37ecf71cd8e1a4822bac721c98320c21f5c60cca0c8fb67c52ed9fc3;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sun, 02 Aug 2026 23:37:45 -0700
Message-Id: <DKF3O1FTBV9M.M82B257B0WI2@linux.spacemit.com>
To: "Bui Duc Phuc" <phucduc.bui@gmail.com>, "Yixun Lan" <dlan@kernel.org>,
 "Takashi Iwai" <tiwai@suse.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Liam Girdwood" <lgirdwood@gmail.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Goko Mell"
 <goku.sonxin626@gmail.com>, "Jinmei Wei" <weijinmei@linux.spacemit.com>,
 "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] ASoC: spacemit: init *dp to NULL before error paths
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
In-Reply-To: <CAABR9nEqZG1Vywb2CkoLVgqoLVPKqfYt01t3dF=WTu9qJSS=bw@mail.gmail.com>
References: <20260731101539.36290-1-phucduc.bui@gmail.com>
	<20260731101539.36290-2-phucduc.bui@gmail.com>
	<DKEYE4CK1DUW.1PQ03VOZZT9TH@linux.spacemit.com>
	<CAABR9nEqZG1Vywb2CkoLVgqoLVPKqfYt01t3dF=WTu9qJSS=bw@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M5aCtjAndv5Ono9C9qt6/UT0Y7nF3V5gHIMAFk5H9DjuMelLAYlq/So+
	891FDsvIhHbwqSe3P0whCqkWRXavNB/vCZwk9Vjs9/b9L9qPs2oGfqL7K4Oj2WuzEBaVT66
	izy1oo31/08zCCnfbEEap4T8Idwv05BMP/fkBNnZW1iCvrtrQTIUeE7rrja1OSDvMbuAPX3
	NFFd3bBvZ9BLzj0jTC/lpw8iSxTFUdPhqWeYy+IwXv3DFqb7OYWNnFoxSCFtV1TXiAXUuKg
	XWJEZywE5wWgRIgmQ9ARNNUQiqj2mNQ28eJsNSO0ieD3IFuJdCQNdcNSZw9iec0QYpIB2H4
	8i3SsA8JYEDu/fWneMlvYFc5UxEGowBQanFHyYl7WvMJN4705NSvtpuTAlWJ69R4nOb7wiF
	GOsJmba4bfsGv4ryLVewrV+zpzSirJlViEilLpXeYiLZMoDqLmTT8pWEsaLWCmt0PpESsoA
	OdbaG763NYDDUS/PpRkEO3ZEyzGp0gLBDCh2QD80yDbKS/DIcT+V6u6o3HV/fzpfUQQsJxF
	7Ys9XqOCO3lsV08PK6dNstFTaAcli09qTKVZIcVoa3wkHXA1usM+FmN1NAA1CoFesTcmbF8
	txc2L23W0pdgaW1ukwFA5f0yKeiwBswDg65VggQ1J+NoRb/q/e30W7KrzzIjsMA2pyFRakC
	5nFeK4ya6m1dzYIB18Z6AJQCQ27o8yPNTlxtWLn1a4cGaiWLMpLG3VE3KSEaz0WA0P3U08Z
	AuspBKwhTBStGk6WV8HoSPjOb+bxhgr2wsfjOFsLXFU2/U+0jAEbhjSQTCQC9RRqDDdjf40
	6MCOOZqzOJytWr87hTznPwQgwnDUiub/ltN0OsWZK8/ZsFi5BsiLNa7/byAHFV7+/ZN6yp6
	o97Fm9lJPpbY8JCtBzXlufEA8eltK65ZaorpmKTuVpnWH/dG1mhHQbyPNb7D94hiTHcOBvH
	1CM243Q3fSeIr683z0Mzn1iFvenqQYG3bxGruPybD7YtREdzMK8BAMxW7qJpRCk/mI8Jlul
	cooOIJtYdne812Mqg58+lGEeBA5TiBWHm9nbiudYmRzvCS5zgiOYlfbsP8i2wvgDFcTV+Ic
	KKQ4CuzmtYrLlVpp5obR2CC+aoba3nGYQ==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

--3fac37ecf71cd8e1a4822bac721c98320c21f5c60cca0c8fb67c52ed9fc3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

> My intention was to make the API a bit more defensive. While the current
> implementation only has one failure path, spacemit_i2s_init_dai() may
> grow additional error paths in the future. Initializing *dp to NULL
> ensures it is left in a well-defined state on any failure.
>
> It would also avoid leaving dai uninitialized if a future caller
> accidentally skipped checking the return value before using it.

I still do not think this initialization is necessary. Currently,
spacemit_i2s_init_dai() has exactly one failure path: devm_kmemdup() fails
and the function returns -ENOMEM. The sole caller checks that return value
and exits immediately.

A caller that continued after ignoring the error would itself be incorrect
and should not be accommodated. The helper is also static and has only this
one caller, so there is no current API contract that requires the output to
be initialized on failure.

I suggest dropping this patch.

                                            - Troy

--3fac37ecf71cd8e1a4822bac721c98320c21f5c60cca0c8fb67c52ed9fc3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCanA3OQ0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvuG0A/ibH2fQgOrwKfBlxv5Q59Oz+to/mVsA9rprloeG4
B4ijAQCCE04RvnCm5R70NApx6Vd7Gs6AE46WzrT6ukatVhs2Ag==
=0zg2
-----END PGP SIGNATURE-----

--3fac37ecf71cd8e1a4822bac721c98320c21f5c60cca0c8fb67c52ed9fc3--
