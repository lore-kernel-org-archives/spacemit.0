Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.243.244.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794980898;
	b=5rHLkqTKW04h84PEgqBhy8kwJkZM5p7EiyQj2NViKXoSjzyIOZluScQUAUEwoqcSyT6I
	 1R+tJA8m+3NgYc5SYRZJ8rK4vnLpAZV9oQPaLtkd7xXaEaRfPcPUCMgumDqug3BVBuwrT
	 9WjzSsZI7EmVJnp7CTqqaz3t3oA5dsM1hZG83n9M3XQDbPU+CDPacft5f+HBsx7UYND4S
	 IIt12WEw8kzXWiPvnMJqqZSCKlwQH2OHmYfZ9V803XK5LNP3c8BTGgXB6gHiZsc98IDB2
	 7r6i/G1qO0oontcyGqCFQ4UqyYk4tIUFr0TzQEBdA8+HPWeWh7B6Tf5jLcKtodKjRUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794980898;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=3Ql1Gr7XMzmIYBbEO+a9ghZlVqPmLxdm3zP1UNICVgI=;
	b=JYb9UpniXd/Vx3FcoK51xUSrYESyzTB6eTAFM/6/Tj4f2PdOfuyS+7f39lWzLWs/t3KG
	 4Ah5a5iQrP4+ar+lN/BpGS5HnEcteUbPikQpabw+j3+zEtNOBXZ409Soi2/AlFkwhbGn7
	 ISD9Vf8yWrT/7dJwaizcxdzP5SYuTOKf7kcf6KsO3gY5J24TCW1C4GM/TuPF8wfAblOpH
	 ZB7vXbDzISvltwj1oCHKhTkRii55Wl5DSIZOBKLQcf2dRjTTyDYMR0bkxZMdqWYSaGe+3
	 1HWlcfSKhZbF2aQ1s8x3ECy5fs2jccGWSI+BB7K8z6WecGfkniejIPoTSEVhwfRAhnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=ZCJ16S+p;
	arc=none smtp.remote-ip=54.243.244.52
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40E9606A31C
	for <spacemit@lists.linux.dev>; Wed, 18 Nov 2026 05:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C40E9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=ZCJ16S+p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794980868;
	bh=3Ql1Gr7XMzmIYBbEO+a9ghZlVqPmLxdm3zP1UNICVgI=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=ZCJ16S+pRKus4/MhUuggytURC9+Oy87x/0tUm7jmxCA82pieK2ZUEenMnIbBmbkq3
	 hyLWRAOi8cGUhpwOeSbGMKgbpaoi5AW02jrBpk3v+uKxMxzrsqvFBksbcZUICRtMvJ
	 vzd8D48c30npOfzXbSuxs0bU5U7umt6oQN5L0XBQ=
X-QQ-mid: esmtpgz11t1794980867td74787de
X-QQ-Originating-IP: WqBZLnoXOwmHGTghcgp5ZEgWINbdmL0mzbXNLz00OgM=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 18 Nov 2026 13:47:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13421804356627132485
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
 boundary=cf9fb9b6f5c1d24682a98b33195572b11c62bd4410fa3cbe45ce94883370;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 18 Nov 2026 05:47:43 +0000
Message-Id: <DMY3M0ZQ168B.2V9AQM1FXCHY6@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Daniel Lezcano"
 <daniel.lezcano@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2 2/5] clocksource/drivers/spacemit: Add K1 timer
 support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Philipp Zabel" <p.zabel@pengutronix.de>
In-Reply-To: <8b5be415e255b5387099d9f8a9b8f5f05d4cb038.camel@pengutronix.de>
References: <20261117-spacemit-soc-timer-v2-0-9264d0ea7755@linux.spacemit.com> <20261117-spacemit-soc-timer-v2-2-9264d0ea7755@linux.spacemit.com> <8b5be415e255b5387099d9f8a9b8f5f05d4cb038.camel@pengutronix.de>
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OYpbVsTx4C81k6RhXicVSquGdMhCcixoLt6YOvj7Cv+KZrK6oOMg23T4
	UFsSreF82J1hoqhkEoW0UxjPrkjPQQ/DRJQ7/DAQ80y3OgoCHGowW/lorBG+DgrvPEODNdh
	Q4H/j5h8DIeZikQ4+liZCnghL52Wi50wcTrPjLaYiAV+WcPBFUuEDvPDFwBm/pq7e2C5ZCt
	HfLKZBwpMH313XipgtfSvv2S+eSZjx8sRVKEj7r1wyVll/RkrCkFVppKPGgU3aADWhact1I
	6VcZO+Wmh/oTEVVxM8jyMMS+1DH4Ty3aJKIO4n4vpcjKcPGwVGBMLGtg+YNt3CJD9vMHbvY
	H0ymnnIuJyKc19K90yQQpp8T1tdJlFsBPIRvh+cexKjZaxbvKaJov3p1tZTHmrxmoMBPPk1
	bExk77hPpuCQBEcCGxOF6d/07T6wlxEDv7ThSAokiqAtWfBls0R71t8ee+V2tijdDPbjbcX
	bsRb2nVltPxELnRYgTzZJOsSxgmqaMDCzRDb9CcGWoftDNVrr46kji1v90KBi0hDYSgIykW
	Z7Ft2dHfZakh5faZAG421rVsIZjCw+aWXzXkoqHizwFbJd18VZz8YIA3AnB0H5DnEqm8yS6
	JntgQC3uik49AiEK8qQ2T243zFJrUaSEM/LxQG7CcwRy+Kc/+9Zyk4n2kzuxFKMJ4CJzdaG
	sxzZyhPAjG/m3npuPYAzatEtnFINcFYiVAyW1ivxM5AGXBbugtOyRdzQaIfxYBlegREwkrP
	0JhU/sGyStCEG7RhO+Z40NSaxr4qo9OgwxC/CcLmPgHjq3NzvSwnH2ZNhGHnSE4m+5KzlCs
	dsUE8HuRRBw/RaoY/PE5h24izDIukknP2aZjr1pWQCI0/F4qjjddoHls3kfW8VBnAVodIJx
	d2Vlu1ezFHqGx+HF187b1kAGprPeXBGUh/WnuXMieYCEDhSjXgD9PC3Ij9vvq3Z+Q8s7yZi
	9fikNyG5tJN9U3ATmLaOh95Ln3r85Qq+NgNJLR3vQJMhnKeDpkZ8/Nn+qhaw8r+9hijTqWa
	YicTLCNBsZwfIBFZyeQ0nqBz1ckMamBYtF5vi69UFymRlt3YZ+VRl7R738NMNuZU98h558X
	A==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

--cf9fb9b6f5c1d24682a98b33195572b11c62bd4410fa3cbe45ce94883370
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue, 17 Nov 2026 10:52:27 +0100, Philipp Zabel wrote:
> > +	depends on OF && COMMON_CLK && RESET_CONTROLLER && HAS_IOMEM
>
> Drop the unnecessary RESET_CONTROLLER dependency, the reset controller
> API has stubs for consumers.
Will drop it in v3, thanks.

--=20
Troy Mitchell

--cf9fb9b6f5c1d24682a98b33195572b11c62bd4410fa3cbe45ce94883370
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCav07/yEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+lUQEAthB6oPUi2jXt
IqbHKSVLLDvTw/RU7hb22TAJ38TsUmcBAMLwBrw6KEtlygOnqJaK3gXV/J5oro6Q
qQd0Uc3YEowE
=qCKP
-----END PGP SIGNATURE-----

--cf9fb9b6f5c1d24682a98b33195572b11c62bd4410fa3cbe45ce94883370--
