Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795759275;
	b=PB76ywqTFkuxkdUq5EhwpfypGFZLREjyWbJErQAo+yo8aBQsHewJi/lhqoulHj6Iu+Fx
	 SyL2hkcvWn7y2b+dloU7O0ZZ+iE4bAWxrbKXzXcgG0S23utqaH5P/SnEbkm0i2ONoiDpk
	 Kdvf/qQt1ZYJNFXSoGF9/s32mxWOQ6KCh9sYm/eLP9ZTcprUPGfHsWHwv9qPq5qby5nS9
	 qgDKhIi04QWzNtYkx35a/bfD2ujkLFgOhmqQTwU3O4aNLvzEXVfz1+r1+w/iIDfRZWBeJ
	 f7ipV5+Ad0eqndDC303/vQYiydwu6o6v/WUlx82Z9t/WZwbAC3QPzIR76oimRBka7BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759275;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:References:
	 In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=W5orpNQRwzUsBFtBd4lKgk0noKXsQvGISmKxvFmwlXQ=;
	b=Wc/lPh+mLie8iKfjS6rGDaovTUkzcXJGv4BCynNx4vAOs/PjVx+AaxBxQU1sqowjcpHZ
	 W6auo+Q+wZEq0eAFNtRXn0NpXauY+ubO2JzbSTJB49veOkSQXBYsSRHa3TWc3PiOpoTpH
	 zgL3fU3JPRxLAeTEdHxIYDom5kiI23F8b2sV510MLde+4G1nwOxUVTHhWrSTTrAYhS9+b
	 6K65Tl7UPQYzJe8TJAVgLnjjnPUkWs4WSFgBeHr4PliplWx62+NXhIVedJ/JVNZpKZHQt
	 5WavCvCIkBs6ZyAD7/xAjPTipzQEwA0WwJ7U1RPr0EVZzjbBS3h2tymt/iKaP7ewzwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=udXPH5Co;
	arc=none smtp.remote-ip=54.204.34.129
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAEB606A323
	for <spacemit@lists.linux.dev>; Fri, 27 Nov 2026 06:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AAEB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=udXPH5Co
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795759205;
	bh=W5orpNQRwzUsBFtBd4lKgk0noKXsQvGISmKxvFmwlXQ=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=udXPH5CoHvXAfxhAFIvhAGd1cAWKjuWGDFGZ8Bj/GnFrorSn1XB+O9oECrCJTtKrk
	 dO0MQo0gyq5RxnnilQYu7cID6Ujhmb9NaTciIBBpJjkJEeGNOEKpz7kl4bYAebtrkn
	 lYHjMzRgx/xWuUZ6HIok6eQzdVQr/4mnszW6X11o=
X-QQ-mid: zesmtpgz6t1795759198t02bcd124
X-QQ-Originating-IP: CyiqXhML3xAjxSMuZRfc6KNxWUfRG9AMsUIeo1bcios=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 27 Nov 2026 13:59:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5876352062716450279
EX-QQ-RecipientCnt: 25
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
 boundary=d1ae752c97959d5b8d8cd87d8f8f5410d469b0ecca2088ec5a8e5567b25f;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 27 Nov 2026 05:59:54 +0000
Message-Id: <DN5RI93NOUY6.2TXJX73EU84KJ@linux.spacemit.com>
Cc: "Alessio Belle" <alessio.belle@imgtec.com>, "Luigi Santivetti"
 <luigi.santivetti@imgtec.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Troy
 Mitchell" <troy.mitchell@linux.spacemit.com>, "Baihui Liang"
 <liangbaihui@linux.spacemit.com>, <imagination@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2] riscv: dts: spacemit: k1: add PowerVR GPU device
 node
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Iker Pedrosa" <ikerpedrosam@gmail.com>,
 =?utf-8?q?Fr=C3=A9d=C3=A9ric_Mah=C3=A9?= <frederic.mahe@cirad.fr>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261118-orangepi-gpu-v2-1-f68676f844eb@gmail.com>
 <20261122184434.545341-1-frederic.mahe@cirad.fr>
 <CABdCQ=PnfXRd2=b6_yEN94RCRvPnWx-WFfHZDC+jhHv_UFZ1ZQ@mail.gmail.com>
In-Reply-To: <CABdCQ=PnfXRd2=b6_yEN94RCRvPnWx-WFfHZDC+jhHv_UFZ1ZQ@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mdw6+lqugK2CvZJHCS1LrDPF+Hj9qgBYBDw/eWVDA3sRaPVNAzBOCiym
	Yiey3YYUnX/+MQfYoOO9hZHqKcD0OCc+5PF5yGdx+hFQdS8dsZzECJRZSgm6+IzWDVWipUt
	GYtP7GAVRKYkRfmrKmI7BmohM/+lrWI31C0OiENSUIgv0xlJIaUT9Ad3zJdGTAjdA84zVnX
	AR8A+fUn2GYXkmsASkqYRiLPv0zKHY70X7KY2KsCWE004YuQcPvZtnvG8OIcFwEbP4PHVJe
	BjUS5vyFHfO2DGdevuj1Lr43ndVT1bmFSAwMUfXJHD4kquG6XeDDmrGaPg5TXZpm7muWEM9
	i2xinTQfNF/JZfW8AlYK6jUlbDEy9+gmg8ug9Of02RuqffqPFjS0ftjwmtJk6p2B4l6GQ1V
	NMNZDZx3j2ubfzstl7gI29g7OIz3RkNMgZ1EHSu8Mo/Kfu9QKe+RMutHgLu4YFKAFoep5Ro
	3K6TQgglINUVhiZvg8QpQY7Y8/Vc1I7nr5fAzQrHHaM+I3eLzzVUudoXTtZiJTQ1FRhrydi
	2z6bxRpo7WprihcQta8hwu3R9GBLb0mBHNXYI4IhD0CjhoAJZinOu8OfGof/YAkkxgtSn9x
	s/cZWZwIYvlEpoVSRVyeGm+U72Dk7Kb7TXGHEyzJxLAA2gz+czKJIe2SCxn16jmOEumqte8
	TkosUE2o4WnXGN1vTglvdUZgatGc6KvqsX4D+NrNbbjTEJ5ZZDnvrytIVB1g0qY9rO0ukeC
	hDDyRqwMKNA4sN1EukMGsJuL2smOUvQZM+rARFquFx3n7+vKXlnnDmQASijg9Arwk0X/9+F
	IS1jGg55tDuGZP7HtoMyRM4OKqWDeEiTgPloPo/L82VFt7n/XVvN8e/hw/3EliQJVUt/YQq
	Hr8ANf7CwpiAbgEH14V7eCt6V0W+w+9NnW15sO8lpj/dUHgadJUrbgcfy1RykCwA8D9qe3w
	WK6vvJrEjztaClHofTqDPk0/03PdXyDVAMMjPNn61R+uAZlcUDwlnuZqe/mwkT1E6c2fALt
	7/pzvGwt2ksHOfCJL5lQknHdTeJOsTJfV13ofq8BcRB2tXTlJxXKEGFz+mZcecM/Ne1SR7l
	w==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

--d1ae752c97959d5b8d8cd87d8f8f5410d469b0ecca2088ec5a8e5567b25f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Nov 23, 2026 at 6:41 PM GMT, Iker Pedrosa wrote:
> Hi Fr=C3=A9d=C3=A9ric,
>
> Thanks for testing this on the BPI-F3!
>
>> Two notes:
>>
>> - On v7.4-rc1 the driver refuses the GPU ("Unknown GPU! Set
>>   'exp_hw_support' to bypass this check"); with
>>   powervr.exp_hw_support=3D1 it works as above. Is a driver patch
>>   adding the K1 GPU pending somewhere?
>
> You're right. I forgot to mention in the cover letter that I was loading
> the module with:
> sudo modprobe powervr exp_hw_support=3D1
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--d1ae752c97959d5b8d8cd87d8f8f5410d469b0ecca2088ec5a8e5567b25f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCawkcWiEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC9jPwEAkEDYQ/DUZqdM
7fO73JXCHzzyxH2RSvNzzjPHVh6TJCAA/jY1bbDX9rE04bGONDjWVzwEHNrfpRKP
pCll1aV1PnkD
=NZI6
-----END PGP SIGNATURE-----

--d1ae752c97959d5b8d8cd87d8f8f5410d469b0ecca2088ec5a8e5567b25f--
