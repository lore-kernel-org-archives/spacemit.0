Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6011B443E35
	for <spacemit@lists.linux.dev>; Tue,  4 Aug 2026 10:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785837636; cv=none; b=tH8XxZODgIyZeEVSLYJlP53PuhuLgiyv+SUG0npK5cLHw+tWpTHF+/21jnsk6k4u2wsYwIucCTbQmkfAU710D7Ig3fijK3+k+qKqmrALyzoA++BAJS9hlnSFavWQGyFwZ9f20yj7hXHxLITEgQz688Mn81PGWKY8TsnCTXRVXX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785837636; c=relaxed/simple;
	bh=I4nKQIqakEl4AcAWcfhShCFtxF29eBoBD9yQFCgcxqY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LSnMoHo6eeXrbRl8FgyqK2woiOV7MH3hjl8YhERpNZxVZ0r0W1/jF3Ym3HOlsEULbKC8uQNicKCWSog4IAsDSS7VPu7c1txhLSnBawmXbLfKPMGEFrsPlnm5p6c3Tm7bUxoU5wtAPvGxCE0T+4sWAnGBaBSjcOAmUbaZy4pkpYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=ZjKQBO7x; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="ZjKQBO7x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1785837589;
	bh=Ysd0un+5gtGIkkj7N0nhvFD98XFxC6uJDNPImhDLpDg=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=ZjKQBO7xnm4ykcirNDumwvXn0M+qgFMqf5/zinvR1nf28eAUWb1ajsXBVfJRlIWdo
	 w5uRO/PsGH6xbBXHaUHsBeigrhozYoFXSvgvFMjBCDWBcg6SaD5jnqTv401+8pBiny
	 3Mcu0pLvdN55E6FTPWnAOXcXiL8qtIsLGcasu7No=
X-QQ-mid: zesmtpsz6t1785837580t822d7ccb
X-QQ-Originating-IP: /deDCG4cZbZ/zIhBmDDPRVENV3b+dlp0f/0Nmm7NpCw=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 04 Aug 2026 17:59:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11623012881500782239
EX-QQ-RecipientCnt: 13
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=0cb53cc854d56efd7aaf92f0490d3586ec96bc93b77b8c725886ac6337f3;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 04 Aug 2026 02:59:36 -0700
Message-Id: <DKG2L4V8Q2EU.1W5VODY60D6D7@linux.spacemit.com>
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
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MKTBhjEpzXIfuLhsfT/M6bRBLrAVgonnDdi8WJbc39DkG4DvH9dh0+Tr
	++yoe5lQ5QzXPAZZLPPzOldHRwDDlWTz7h6+DwplZK8d1XRtppcAeVTlIK38W46VHyX8yIQ
	4EMyNsoUlOmqn2oDpOdEG6BZ5IRBRfTbuOkiK/ckZ2Me2MsYgONx5Fm+9+THPnwgzF34LAU
	zK0oi22fjQ6PseZSANfk+Q9CFSpd1F+SWwelz697kPbvYIBiVrdpFbQRxTNGlR0cgk/mrf0
	REh4MbeRV90D2qjYtX+iUAbqKb65z9GrrcFhtW4+I4RBnc4fLCx3KOzXjT6mqT6OPKHmMLs
	A6tcJJ1m8pmI7olVTVrj4B4SbSx9bxUyUBa7cDE47l8YWtizxbC63qhDXnDSv/2APzrkW0s
	iXVAe0Jtdrl8ZKcHm0y6nbDJ622CeJjZVj8YVKFJxVLUez5y0xdTAGXJJ4U6L/YYLMeM5vE
	CU3Z0iikATaXyca8HP/Bj1L7MFDis9Da1anWCU8jIqJ8IP0KFP+pToKsHhDlHMrlEMUrzIe
	7x/yJKrvsyKRaj4i4Zzhdn1wA74zFCuN75l9xoq/dPusgpiFffcrDNUOuPTQ/IkpdEuIi5n
	geQzEH3JIoC5nN8R6MpDIwqM42f6v9B8l+MXEGqFwXSY1JUvphuaD2rSjdiaZ+bOh08HgJA
	x/+aUnO0slwz4tFwjYHOLDydl94e3YAYbWYtk3fBF+cAGkR30KFowA21BkeCFhP4jpMZMjh
	UZN+j8KmJlVOVI7A8hIGEeyI3PjzHfPUXQnIjlWLPyrbcTxeNwsNJhmutxrEJFp0MegRZqJ
	ddML83kGLggJLPRBpAQaf+Ze1m1zf2cT0q+RI19GH+3UCBIGwgna1x8BF4tEYCt+zXG36jO
	jhlbHxhrwOscCnYJ50p0bozz2BAmcRezHtt25ij3lIdPSVRLdEu0S83obZYllSNW/EUEkIf
	zNfcwxkp+2UKd/Y2jZvFNOm8WDTbkfAcVTimitLaOLctUCVXTKnGFlGiqJM+BnHfG2j7es5
	bSJlxH2Fb18x1BpGDqoOnXTdKYFi3KaP/HLalvcdc9zup/WfFaq+9RGACyfVF76qTbOMwjz
	E/Ts74+A2cNwkIwJmn5icwZv3HiYaXzOBYyewhhiYbfhJ+w2wh7987Eu5VFji9TrDx3nraO
	TZ8FhrYRtr8P/N4=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

--0cb53cc854d56efd7aaf92f0490d3586ec96bc93b77b8c725886ac6337f3
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

--0cb53cc854d56efd7aaf92f0490d3586ec96bc93b77b8c725886ac6337f3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCanG4CA0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvmhgA/iKim769XKKzBMQSQN0e0WT8cDcERmf6hZVpFc2P
GucAAQCL7rMgg02LAyIJm55KkoPR7IBfAkfgUjclm5YznSGKCg==
=QizS
-----END PGP SIGNATURE-----

--0cb53cc854d56efd7aaf92f0490d3586ec96bc93b77b8c725886ac6337f3--
