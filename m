Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971D1283FD5
	for <spacemit@lists.linux.dev>; Wed, 11 Jun 2025 14:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749652363; cv=none; b=DaFnRE69wkb7tzAbiHIAAzI5RQ5MJC6Ps7za6sp2LohBTGGarwCRNNwN36Ax5OLtZac0WJxLoKApb/+bV+Yj3RZrJOPLyO+ri0VhbPwtoQ7l2L1x5p/DdRfMot/SBJArVcR9UfcJUjGEUwf+brykgtdLPOmQVAin/ZOwvpvbKoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749652363; c=relaxed/simple;
	bh=LIJKwYSQIfaGc2pHLi1K+zxTkENHkvAhCuTT19zf1Cg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ipD9u+36mFzk5PmI7AEpKbhHr70S47JXkvEC7khVN0kbD7hUN8+5HyJ+7r+9NQexY+AXEn7c43uIujr5LKkllQCYob9zkC+eMzsKib1cKxNCC+ZgiAuK2VhVqWlYtJ/xpe08cAsM32qoN2aAxSwbXG4dFwPDSHYGCyx1oM/a8NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=wHeIZ/3F; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="wHeIZ/3F"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ade30256175so998031566b.1
        for <spacemit@lists.linux.dev>; Wed, 11 Jun 2025 07:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749652360; x=1750257160; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60kjyrVoPLH2Ifa+97Mi20o2GvNQ5P+ZX0EZmjkoYqM=;
        b=wHeIZ/3F7qXi0QaB+iRzYhtSeBHP88dHUGHQmPmTD/aJMJkCDO9q/8eNMIlZNVtkUy
         kEK15eYEUThugyU5uKSMowDUMpET4vqSFqOVbF9+RA8l/fjPlZJdr8BeGJPu+7UEY3Pn
         AQJzpI7ynSVV8qonNl9XckfFdw0PZ3SjWBs4Sh5vbQeIIbSKycMTPwzrAq04bRjYPri7
         e4Ard1L5roe/dqf0GRrXoULypckrIDUYo0bMeEj3CGKIfBh1E/X6HhMlFMDI/egOxiNR
         TfYv+ouAtoFKswAjtDSHmstWRX4FdYLjI560LnwpxFYT1OiOgAi6YZm+IVxlxk4ScOq4
         Oqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749652360; x=1750257160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60kjyrVoPLH2Ifa+97Mi20o2GvNQ5P+ZX0EZmjkoYqM=;
        b=l/dr6RVqpLrCmI23CpbESeCpPjpRsYQeFYi0RbrizwBooYaxLehjj+jYcHApu05fzs
         oWBfvwru8NEClMC1t0zgc3oB7qF4zBOnCNO/mCJCbI4EJlj7g9ElBgnii87qEEPqBaom
         /RbsAilakjsUIkJUSrH73tHyjvvxNocxCpE1M/Z+9NfENk1QRV5pVRaVV4TefSFRjBeK
         KFtbEd8C5rmmSRFF/F4cLaKri3iwQL2z/wo9hvg2fxY/Su7kRKY2eyVluFhdHR+M+9Oe
         /uf+8N5llEEUJpFkh6MJqiRKA2gZ3MKhITzdbo6vhJiaK0wLY14nyKiwtXKJz9VY1AIa
         HPfw==
X-Forwarded-Encrypted: i=1; AJvYcCWzFn2cG/G0mtaYOnQkaoj4IV1aQn+5AgWDL8Dm3XZJ4/Yas+mWPlcLXTmpgYQ3NutFdTP17BoXuw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5FzbotHdy6uE2cWWoapmneExTHant90hdw8iPxldiT7Jf6khU
	D+DNnPKnUDszalD5cD+5ReIZTeqaSbyJ3eXy8VjqXCXRc5wCCCVO6heZAMDtXKeGt94nBxncf/B
	e8Iqq0qGGkOg2OSYEbX4WEdv9Ygjwci7h95hRtjyi9w==
X-Gm-Gg: ASbGnctaPHRlsvr0H+nVFvWaC8w0e75moZRHsjTyRswiNJK7kPj5/IZr9CkdpV/q890
	Zy33lQusOW7dLKrLWJnwMy3JpPE0ChsaXapIQYisfUiBv85Qq3MYFHtX3S4NLEppw29TNR/bSZx
	mKY3TPeMT7EZyMq5OwuepcJgyJUqUzlw4GMo90RGwadIOL
X-Google-Smtp-Source: AGHT+IEzETwYHx0nLbiFdWUeLmV4KrW57JrGro1I3zlSg5jafQBDwMDY2f+YekL/HJyWs+OOnv2PB4JAvv0sXW+xiFM=
X-Received: by 2002:a17:907:3e1b:b0:ad2:4fa0:88cd with SMTP id
 a640c23a62f3a-ade893e3192mr285970566b.9.1749652359722; Wed, 11 Jun 2025
 07:32:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250611125723.181711-1-guodong@riscstar.com> <20250611125723.181711-7-guodong@riscstar.com>
 <20250611135757-GYC125008@gentoo>
In-Reply-To: <20250611135757-GYC125008@gentoo>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 11 Jun 2025 22:32:27 +0800
X-Gm-Features: AX0GCFsCOSkDRyqL6Nxt48HaUVxbrrOp5EdO9-GyXjMkq6GZqJ07_JcYpuCfhG4
Message-ID: <CAH1PCMbt3wLbeomQ+kgR6yZZ18TZ=_LF-kCcnLqad55FSHBhDA@mail.gmail.com>
Subject: Re: [PATCH 6/8] riscv: dts: spacemit: Enable PDMA0 controller on
 Banana Pi F3
To: Yixun Lan <dlan@gentoo.org>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, 
	emil.renner.berthing@canonical.com, inochiama@gmail.com, 
	geert+renesas@glider.be, tglx@linutronix.de, hal.feng@starfivetech.com, 
	joel@jms.id.au, duje.mihanovic@skole.hr, elder@riscstar.com, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 9:58=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Guodong,
>
> On 20:57 Wed 11 Jun     , Guodong Xu wrote:
> > Enable the Peripheral DMA controller (PDMA0) on the SpacemiT K1-based
> > Banana Pi F3 board by setting its status to "okay". This board-specific
> > configuration activates the PDMA controller defined in the SoC's base
> > device tree.
> >
>   Although this series is actively developed under Bananapi-f3 board
> but it should work fine with jupiter board, so I'd suggest to enable
> it too, thanks
>

I'd be glad to include the Jupiter board as well. Since I don't have Jupite=
r
hardware for testing, could someone with access verify it works before I
add it to the series?

-Guodong

> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> >  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/ris=
cv/boot/dts/spacemit/k1-bananapi-f3.dts
> > index 2363f0e65724..115222c065ab 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > @@ -45,3 +45,7 @@ &uart0 {
> >       pinctrl-0 =3D <&uart0_2_cfg>;
> >       status =3D "okay";
> >  };
> > +
> > +&pdma0 {
> > +     status =3D "okay";
> > +};
> > --
> > 2.43.0
> >
> >
>
> --
> Yixun Lan (dlan)
