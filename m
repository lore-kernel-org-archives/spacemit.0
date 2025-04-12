Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEDA13AA3C
	for <spacemit@lists.linux.dev>; Sat, 12 Apr 2025 04:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744430593; cv=none; b=N4G7brezjNhs5W2BnQv6F7gKh1AZkb4lK5y6i7xmcd8V7Yij3TUu57k5K0HygYOaSmpBDbJqS58+eh2wI2eigHNGRZCme9VZzJfJa38lp8HZChffZSgGaDxH+CAxZtRI1RJtvR4W/XIzkvKL5x2QCdcbxhTCjG6lO+3wDPy6Rdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744430593; c=relaxed/simple;
	bh=wXyqIaTpw9afllPvX5CGHehKOzXZG0L9KEgBgbEVOgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UyuOfXJ1yGcDCFo3+xbuS/jLDurl49pCXmbkXPS9vT6YOtcXd+fz0QNzX+bV7hAbEhAh1er7mNFaoVfLdrwCedEeQleFSBqvOlPYAVqqMX/hQ+GmIIEFqvsOBo0MadDRQiCR6n3g2SDtLebjivZv1BB+KJ3ydX3c94tca9T+64c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=NEV/kS6G; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="NEV/kS6G"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e677f59438so3804209a12.2
        for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 21:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744430590; x=1745035390; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUbODakS+dMo9JCC0ZJQTM4QsCGguqQTrC9WcbsAzHs=;
        b=NEV/kS6GyKEXrXPoNvVlr1bFY5REQzSmFLgg3qbL/Z7Ojgi3EXfvMmU1Xf4ZBAc8z6
         Hz6yg7lxvTrSckLXHX50Y6PJ0aq35tXRw/y+p4qbXDcla964zp1nWaUW6A5toCvCmJ10
         tZ8+R66GQNF20DNu/rHTl29oa7IWTKoGslMqYQ8L40cFRN7utonj2nsEgDwjxE4giZQZ
         WBTXjr7Zu9QUwpF9+O7g4wEiDPF8dvy9tm8Qa0iBdKtA+c2knmahEMH3cXS9zJojVJoO
         ExywjnUZhl2vdutiD7e1xYwhFsa8LVjRul4KJx5JK0a/DyLWHRp/E+O9+Sv/067enfax
         A0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744430590; x=1745035390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IUbODakS+dMo9JCC0ZJQTM4QsCGguqQTrC9WcbsAzHs=;
        b=pCsm6tk6T0OKpYGEmXGgx5Xkw/v0MFEduR3S72LESa1gYlW7izA9RxTtRXw99zqHdh
         m9IaApue3tTlow0DsETQmjecoxEfCaGpmk6LKnpZQynF+O1btdgn/8os4R2Cov2/I0Iv
         SrZABzQjxZcjKd+0J5XIpZwgm9IgMiP2+AwVCH+Vlo79u+wST6LEPLxX2AcucfkS+Bz5
         DpeVFCUWiWC2HLAteK0KHVwmeEqWt2/+J46sbMEk/TRkUqki5YudFBlHKh5ygBsBdnAs
         9BZ4vzNGqnAaw6maNGgV8Xd7+ttK+KeEgFGZjJyzdhoaKLUKbApxbs7bPPSHWPZiCCeq
         KllA==
X-Forwarded-Encrypted: i=1; AJvYcCWRGOLkXVnbAxTLfOWG1BUw+0CrOVLG0uZMp0pehPawZCMXuJdBfaCMToanyLs1GOj6QwvSzXNh3Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxtifMWNIsaD+YmdIZi4XxOZdqGN48D2DRhvlNGaIQo1v2CAfv1
	3MbaZ84qI7iOtgcFvKdTk1KU2iNj1KdBIY9wpISIvLkb0VZU6NyY/MNn6PCKTEZqv+PHd6Jkor4
	w6eSRgK4yLu8QfrAqSGVGiqZfTrQjX5BUVw/tiA==
X-Gm-Gg: ASbGnctOZCHAiN0pPySVfjC4V6aL6+Q9z43V4dA2TUAAP1bVWgMwV3JHt+QLdgj3CwX
	2D0L1wVA4jL+56HCQM6mye9pAs2xrH2mH9pgK3S/MfKraOFeZLivSdSemJEdNEk941JRQiaqv8M
	GmD0MprBY3GH2D1vFHxDBKtKvLwA==
X-Google-Smtp-Source: AGHT+IGsh1nJdWpngVYdZEjRa500viVTDTIM2UIG4kOF5wKJ53y1JA8yU/LJhMtvputUGsrQYMa3hGX2PPtSxqSmAd8=
X-Received: by 2002:a17:907:3f17:b0:ac6:f6ea:cc21 with SMTP id
 a640c23a62f3a-acad36bde74mr430450766b.55.1744430588921; Fri, 11 Apr 2025
 21:03:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-10-guodong@riscstar.com> <6fywndrxglozw2oqrfs66l3hxxsrv5uf5hdiuyv4a2uczwiiki@tmijrmuidlin>
In-Reply-To: <6fywndrxglozw2oqrfs66l3hxxsrv5uf5hdiuyv4a2uczwiiki@tmijrmuidlin>
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 12 Apr 2025 12:02:56 +0800
X-Gm-Features: ATxdqUFY_6ozkYJSalNYLyr5XEWoGtVTgxstwPMi-eNqZST8o16MQumLG_Ya4qg
Message-ID: <CAH1PCMY6xKULTbekr+p6mA_gRDogeg5tyMHFuTKG5SzbVMACfQ@mail.gmail.com>
Subject: Re: [PATCH 9/9] riscv: defconfig: Enable PWM support for SpacemiT K1 SoC
To: Inochi Amaoto <inochiama@gmail.com>
Cc: ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, dlan@gentoo.org, p.zabel@pengutronix.de, 
	drew@pdp7.com, geert+renesas@glider.be, heylenay@4d2.org, tglx@linutronix.de, 
	hal.feng@starfivetech.com, unicorn_wang@outlook.com, duje.mihanovic@skole.hr, 
	elder@riscstar.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2025 at 6:52=E2=80=AFAM Inochi Amaoto <inochiama@gmail.com>=
 wrote:
>
> On Fri, Apr 11, 2025 at 09:14:23PM +0800, Guodong Xu wrote:
> > Enable CONFIG_PWM and CONFIG_PWM_PXA in the defconfig
> > to support the PWM controller used on the SpacemiT K1 SoC.
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> >  arch/riscv/configs/defconfig | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfi=
g
> > index 4888529df1d8..9bd972867e0a 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -259,6 +259,8 @@ CONFIG_RPMSG_CTRL=3Dy
> >  CONFIG_RPMSG_VIRTIO=3Dy
> >  CONFIG_PM_DEVFREQ=3Dy
> >  CONFIG_IIO=3Dy
> > +CONFIG_PWM=3Dy
>
> > +CONFIG_PWM_PXA=3Dy
>
> Why not m? This can reduce the Image size.
>

Thanks Inochi. It's better to use m.
I will fix that in the next version.

-Guodong

> >  CONFIG_THEAD_C900_ACLINT_SSWI=3Dy
> >  CONFIG_PHY_SUN4I_USB=3Dm
> >  CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=3Dm
> > --
> > 2.43.0
> >
