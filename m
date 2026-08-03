Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD6A31E847
	for <spacemit@lists.linux.dev>; Mon,  3 Aug 2026 02:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785724250; cv=none; b=Jc4BBq0PPHH/yTZPJFB2y4iLglAra88Lho29Xan6fbm7sggJwkHNrlrW/JBVM6s0FXpJt7mpcLU60o7pDbnNs++9FxPa+qN/vUtfKjezdAZq88l+aA4dWionUvBK+guX8JVaanfLwBSGSbnsOCw+VMgQ0UjLB6pvePNHxkzKkU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785724250; c=relaxed/simple;
	bh=Iqo4tA56AgBDsZpUf2sIFNX+cYV6PvHpqKqxKhwHc3A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 In-Reply-To:References; b=qPcKRs/zXjDR9Xjxc9Xu8aHENN9vXaFf8dhgVgMxxlt6LSdnxRhZQJwyon+DjLuNFXMprGXpbOFBwuC7+seCN+zcHwJ1aUxWCyOYw9ETgAaN4RHYUohvIZVIfucyl8uTJ3buYY7hPkNtqhoRfKJ+aJopF6RpPlgKa1rkF/lTZyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=m1CBmizW; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="m1CBmizW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1785724196;
	bh=XreocC4a0nsXO2Wrw1QqhlxohulSMdKlZ7zx/VQQVog=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=m1CBmizWt/4PsM/lTkZDlkV50o+kOB+1IKhfgD0/B69rAGNWZZ0SEz2GyIrEfQOSh
	 RMlQQf32Yqrn8SNb+FwkZ2dwBLLJVYJkVRo7kK4b5yq6QIGg1ApmhSAnRFqb0rNLcY
	 aJShoPqkwpt/j5hpbRq5ouTJ0kj2wqUblLGVUAB8=
X-QQ-mid: esmtpgz13t1785724186td5e4bdfc
X-QQ-Originating-IP: Rhdr5C5Udr9yd4G4Y4lT5pqjZ0A4wVk50i9uCzyoX6M=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 03 Aug 2026 10:29:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1045208562662155205
EX-QQ-RecipientCnt: 14
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=b221c2993898b54412cec0db06be210fff76d164353ddb68c3a0007334fe;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sun, 02 Aug 2026 19:29:42 -0700
Message-Id: <DKEYE4CK1DUW.1PQ03VOZZT9TH@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Goko Mell"
 <goku.sonxin626@gmail.com>, "Jinmei Wei" <weijinmei@linux.spacemit.com>,
 "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] ASoC: spacemit: init *dp to NULL before error paths
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "bui duc phuc" <phucduc.bui@gmail.com>, "Yixun Lan" <dlan@kernel.org>,
 "Takashi Iwai" <tiwai@suse.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Liam Girdwood" <lgirdwood@gmail.com>
In-Reply-To: <20260731101539.36290-2-phucduc.bui@gmail.com>
References: <20260731101539.36290-1-phucduc.bui@gmail.com>
	<20260731101539.36290-2-phucduc.bui@gmail.com>
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MPAlP4yRn0xgfQMun6HwkIilx1fgJ3pW3bZhKHgzpHnuTUE+EzLinP03
	i9WM8801c3yu2jwmakniSR4WJpovXcgrAGQhoVxhaiPcHHZVFbwIaxRAlfvYm8lndvbYijD
	fpFfAplk6qziDfdVO3vYAbdEhFF8W7gY9qm7coOulUCu1osnCrx98c2eHPpD4B5fEUdQlGY
	RjfTnhEXG4MuBxtiYrovbgnOCi9t1tDLqQYtvUD9El4fXzZmB3StFSAp9bYen03wVBkofc3
	ypgPMBk36KiK0xz+f2fGKxq4W+HwcftG8RGn/HxrlJRf60nljAZvsCG4sw2P2QEf3apbGZx
	4zPZ8CrLuQblk6rctFvBIid2uCtACde4jHtDWGnIR+IWjR2AtYqBsZoN5ewqh4xWkOUVsXE
	SBPS+ccmDTw7UMBXuV1/672JIS3AEn31+U9LORU8VvsaZfQT8k7B1LJl62m84Pz1K74iOdI
	+8tfXGmvP70hHdw8l8QfOWcWf9Fze1/QoYZkOSFpIs4GKTpymw9tXDpH/6tt7MKFtN+mRRo
	0794dB2j3f8U4Hq/kGO+0Ixtee98uK1rkf1S+Jf9B15eKyV72rusBKiRVjBnd/sgP2yBuzA
	RSxhcVf8UoBGedu88tsUcaCs3ex3t/XUkRS9Md24kStmr/OCQ70+AoDWCGjF53lolb9bpyn
	j3mKAwb4RkYKwFvF/TfKEluSGTreAO++kxDwP4pGjdCOQR2XBgNzCgxLGBGqZUnJsBrHhL1
	FzK65Tvckt4gpsALT8LYvBj1I6Qs/tvfQ/to2NVpv3M3PvDOSrx0sas3Gs4uuVtFOb48pxT
	w+hDX226IxwkCTckevLFAX38L+ACJjMIseFoo/gTUIPnIy7ZORiTIJGUU68pfZBooN1jMlN
	N/xVI7AdmVVla5FmEK7JOZPWqLalmyPPPb23TK+bh5WdbCMhO13YX2936DfAVbX4qk+1JYv
	//Srs+VusR+CPdiu1r4a80oVQ7PxCJ8uyR4EQ9mQs0LWSIdD+G2kZYm4kNI02evwhrz5CAH
	m/BT2lq+6Fr1aKQU1wsmqEnDEsSbviDhUjFLAkGVUpi5pXciprh39QvVmanQuJPEedbVCjd
	w==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

--b221c2993898b54412cec0db06be210fff76d164353ddb68c3a0007334fe
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

> The current caller does check the return value before using dp, so this
> isn't an active bug. Still, initialize *dp to NULL upfront as a defensive
> measure, consistent with how core helpers like _snd_pcm_new() handle
> their optional output parameters.

If devm_kmemdup() fails, spacemit_i2s_init_dai() returns -ENOMEM. The
sole caller checks the return value and returns immediately, so it never
accesses dai on that path. On success, dp is non-NULL and *dp is assigned
before the function returns.

Therefore, I do not see a path where initializing *dp to NULL has any
effect. Could you clarify what case this change is intended to handle?

                                            - Troy

--b221c2993898b54412cec0db06be210fff76d164353ddb68c3a0007334fe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCam/9Fg0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvFGcA/R3CHaTVtH2RGXHY16xO3fRcol8fUVuIUUe+TR1t
9JgJAP91jUDciFgUl5vhTEeiVakcOt9V0hoWOqKp3sSSP0aYCw==
=VXsS
-----END PGP SIGNATURE-----

--b221c2993898b54412cec0db06be210fff76d164353ddb68c3a0007334fe--
