Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C16442B07
	for <spacemit@lists.linux.dev>; Tue,  4 Aug 2026 09:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785837570; cv=none; b=FKjcUJplxb+WujyedxEI3O4iWLmyIrye/8Z9AgAZNXGM6bas6jMLXwFqmZzrqPDz32MvR/36O/r3EqpOjNivnyyC5ijF36hwmRQvYxMRWaKmk20rleLaMsncrASvWtvp6SMl4UtP8HFTxowcupGY8hr9+UYS0pafnJWMirWrjoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785837570; c=relaxed/simple;
	bh=M+TmsBRqsaotdKV4MNUk+HSU3vtmsjAJ6Gh3p9iXGUE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=oow22kyLGPxfI1UKInn2XMTMISwtU6zlWk80DYatBhHeFszPamFA4ijHGIMBQIE2t1TVCqFhD4A5IXbN7Du+ldINGFxhDn05T8TAOY+HPWE9E/507YmRu6qYmLHQ8aW9LGIj+p/6q2kxXXF+RvH64ZqWXxSXgXI/7IO2nr/PhwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=EiJ/poHO; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="EiJ/poHO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1785837523;
	bh=eASxnIu27cM4kSePkHRjBYViS2jgTwYuVb5LZLVqwAk=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=EiJ/poHO6qCniTZ85Gs5EJwiRLSwHsmmbWzp2iu4UK8c46y6Rxa2D9ADtPx7g+Z/m
	 J/MlxtFIlfW1kobx18u0cGsE+QsOkYgufa9+eftbYXfY+oCZjLAmcw++H7MMvRoRPC
	 4FVcVUOtt9cqnURkp25ztxsbaeJJiQGGyNqkR8pE=
X-QQ-mid: zesmtpgz8t1785837514tb710e2bc
X-QQ-Originating-IP: gOdDl/GieSB+p1OcvJg/0pTe9PzCnvv0wn9y3EHVhAc=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 04 Aug 2026 17:58:32 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8218745806127972950
EX-QQ-RecipientCnt: 13
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=8a808a06b4a953b5d20dec0ffee61d2775fd30a9d99a11e1a9dc7451dbff;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 04 Aug 2026 02:58:30 -0700
Message-Id: <DKG2KAJX4WFA.O51VPZ9PSCH9@linux.spacemit.com>
Cc: "Yixun Lan" <dlan@kernel.org>, "Takashi Iwai" <tiwai@suse.com>, "Mark
 Brown" <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Liam
 Girdwood" <lgirdwood@gmail.com>, "Goko Mell" <goku.sonxin626@gmail.com>,
 "Jinmei Wei" <weijinmei@linux.spacemit.com>, "Kuninori Morimoto"
 <kuninori.morimoto.gx@renesas.com>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-sound@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: spacemit: Remove redundant DAI field
 initialization
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Bui Duc Phuc" <phucduc.bui@gmail.com>
References: <20260804043036.22065-1-phucduc.bui@gmail.com>
	<DKFYC1MGUCF0.1AQF42KLZZ0XL@linux.spacemit.com>
	<CAABR9nFn0XW3CzAEncVkVKd65yBUEmquxjag6ybf_-NRf6mA8A@mail.gmail.com>
In-Reply-To: <CAABR9nFn0XW3CzAEncVkVKd65yBUEmquxjag6ybf_-NRf6mA8A@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NHmMC+6XyEPfAkj0je/tVTFyvOf/ZtCUWRX2t2mkE0Wowj2SidPTyOO+
	fjpnvihZr0V1yNs7yTsMLRLqtidAphVGTKO3V69iY7V/lbixaBYq5iyMPxJvG9UNd1Q4qEB
	w6Dp5mwApKSa9geE7DAML8eQS4ntM3AbJ759UhercaVP145lvmjW22LG7STwZvBGymiZrZX
	G7l/YrbkkpRhw3V1oWX2FiAU1gKSTfRf0MvIHOrpvnogSuaAf/dxNPYLVgmF0VD4P7ENr1X
	W0lApTjgvv0/urWfRp9W9lSTc791sQfwAt/mZ76ccdja8q06JUpsOEfZxoATM9+q2O2gCmN
	8oFg9YGVzpGFnF8TTUtbFCNxA0heObRGPJXDG11vkEC2HH/Sl4xcg6afu+Mpp5Fb+TTY3MS
	nLT6qYQx6wDXE65K7eKSE8VtP2WdwYcuDqvOF1O6hq+2kXesapcQQvb9NoyOSFR3dvp/Bkd
	oZZmD8diasbVa3DbPl+kWGN54hfoc8nOQ8NCweoZ5FyjgNvshKBDWGUtRCtIjgjwGHfAGvb
	TFcjhOXxDQw4W5+jPFjbO+7uY9J8SZRc2yK3n4ZQ8OsxkheTIh5cjL8Kk7CpZP5vi2c+e00
	+yELKsE7sW3SMzB6Z4IK3vD/cBSt9Kwp+a8LQ+br+VZZInf6/+j5pD5neqd3Az3MeuNLuJr
	aNd+b0ARaqiNZ0j3XjKdxZC+jbesAx8LzHMW68DpqbhfF372dzQGweJ4FqSwBwBEL7lI9bl
	rgdDGeZaultp/WUZnqWY2W6KhmMQ2VH/S1gzxdtuvYuaay2AP+xeMfLv9bfDxuzJsG8Utiu
	jJgG6s1NwZPLDaGHiovJqHXUnwkYJZ127zXH1p1jWJHnEnT5mDqeXKCDA/zPgW9ntOWpa9C
	wgDAaK8ssztDYH8VSBujWIuyJJeTycFpcCFh2EZjtOAbARYYE8iALPiFR96ptpZTHtCIAYg
	rImHqpy/Plc5HRBpnphRxf1Ep7vE0zcKX2M/9QwR3B0Qpcz+4zWT9PkN4D9X7ZrZpMCY83L
	LTe+DomxeoeS1zVQSPKL9VXod7nXm6Zq9hUEBYNHH35K/qY3AG/JbFbU1W0K2mCMUtPc7na
	5Q9e+ryYwP9M1lAs/xj25c=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

--8a808a06b4a953b5d20dec0ffee61d2775fd30a9d99a11e1a9dc7451dbff
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

> I traced the probe path and confirmed that snd_soc_dai_stream_valid()
> is called from soc_new_pcm().
> However, I still couldn't see where a nonzero channels_min alone leads
> to creating a capture substream
> without an RX DMA channel.
> To avoid confusion, I'm referring specifically to the DMA-based
> configuration, not PIO mode.
> Could you point me to the relevant call path?

More precisely, channels_min alone is not sufficient. The codec DAI must
also support capture (or be the dummy DAI for a dynamic link), and the link
must not be playback_only.

Under those conditions, the path is:

  soc_new_pcm()
    -> soc_get_playback_capture()
    -> soc_create_pcm(..., capture =3D 1)
    -> snd_pcm_new()
    -> snd_pcm_new_stream(CAPTURE, 1)
    -> snd_soc_pcm_component_new()
    -> dmaengine_pcm_new()

dmaengine_pcm_request_chan_of() tolerates a missing "rx" channel and leaves
pcm->chan[CAPTURE] NULL. Once the capture substream exists,
dmaengine_pcm_new() returns -EINVAL with
"Missing dma channel for stream: 1".
The conditional initialization prevents the CPU DAI from advertising that
direction for a tx-only node.

                                            - Troy

--8a808a06b4a953b5d20dec0ffee61d2775fd30a9d99a11e1a9dc7451dbff
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCanG3xg0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQv3rsA/2enFw0bQFhdVHzqRfjGAS8XMICv20KQTtx7sWDo
HgV6AQCJZ2ce17LUExbaXiGqo5RUP6KShzKJeeVv+oVziPH8DQ==
=AgpX
-----END PGP SIGNATURE-----

--8a808a06b4a953b5d20dec0ffee61d2775fd30a9d99a11e1a9dc7451dbff--
