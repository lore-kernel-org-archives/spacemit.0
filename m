Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06664501A
	for <spacemit@lists.linux.dev>; Mon, 28 Apr 2025 06:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745823080; cv=none; b=WD+mFRw2ZN6GzmW8zIBBAluwYLfsT/OeuU9NzgROpJz2cxnj+FsjELzQuWILj7ecBkyHxOPzD28mT87jyaNr56KoMhj29n6ZlVHAewZN63ZAZDCQqOuSW2idQF3T7t3qSYr+iucMurR9+v2h334mIeRpXYdWjcqKehHuz7yW0eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745823080; c=relaxed/simple;
	bh=yPwiv3LIPXq7QwC+Z6qeGGumORWMUcAQ8Rt34+S+TqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qwhsoI4AOqCzpnKjbea2+UE8aPVHsoGTUTm/XqwGE1eb0AMU2obTjTfgpLXJMTb4SJ8YmQpMNOOuaInKF1ZTQTSwQkaLa0tFiOjKFjCxEx1l9kwn53WmjdjDH7njcolPu3eHN3y99tECmaltI6Nd9mh1XO0gOhh4sRL4sLXrnVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=zmBm5bEm; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="zmBm5bEm"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so7200942a12.1
        for <spacemit@lists.linux.dev>; Sun, 27 Apr 2025 23:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745823074; x=1746427874; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=olp7njR9Ybm79qV02JWYfEZZNtFSE8MfHDfoR2yiSUc=;
        b=zmBm5bEmJQ9grZ0F9Gi72X6bPMHpDT6osVgxoc71TNUbsJPk1EA4s541eW1X78ePBa
         DBAi+dNKV4l1rmcCrYNqA8AgMGGroIchGgoE1T+Yyqz0jsyNBLmXbi3mWUb8/cZmIafo
         fW896zjNCd35WKN057ufUREWHREbT5C+XueXrav1PdeAH4aC7C/tBxx7KjaFsF+sATuR
         VRdzfUzeWTqcOqqE3oPSE0Gk7x1iMoH8g8tN9airfx0YrSjrj6yVnJY493VSJt92nCvI
         jyD+JHARSBvfS5U2e1ioTZl6wRoY4psNS+I9uOgloCdb+NMmXDrzSzpU1XUc3HIVDSiz
         nhwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745823074; x=1746427874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=olp7njR9Ybm79qV02JWYfEZZNtFSE8MfHDfoR2yiSUc=;
        b=pVF+9Ui3DTo+nCEsPSGZ5oNYpKSIJJgn32Q17FzWBHCrWhv4tDG0lmhrPAn07a/A5h
         1JEBTNGAc2qaB94ehRIrsHEJ1J/oLcDLxdiImdEoELIs9t7owcXUV3hnvHgb3x3LBVM7
         vhHh9MmJ6IBx2ooyzQKWM0hUlD7g2ki6hbKXCSP3wiebDMnwDDSb+HK7MnGkjhhre92h
         tM2Hu1M4VGExMoUPvlc9pnyzPWxoL848hIx3Yo1xVf4atZJJ72DJ4F0hWxKOxnC6QxQ5
         tiOGKhHAu0Wi9tIkxqWyiAvCWWd6XyFskTUDtx/g6lBkYB5JZtze5B+oKTlfktjUQ3HJ
         +pVw==
X-Forwarded-Encrypted: i=1; AJvYcCWVmohjzCCa6hdB4b4ahEGXfF6XJ/ABOYxAYFk1MEsElfuak9HE2ZB8IUvmUji1Nz7iwWxkFCuvYg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxcrcW2UpeAjwhQTvd4aTxusZNYfLAlM0jmuw+7bLPQM6YB/hvS
	Rmt+ahYKROS5VBf3zu2HmCCl57z+aSFwiF79vdh/1Y0hEhzH0v9ZUMt+VBkqKnuYfZteaE99+Op
	iU586jcZR+OUQSd4pbfotO1Nwz7vLmYmlICE1Tw==
X-Gm-Gg: ASbGncu5gtbwtLonLlQyY6jY4iN8Z/eptm8LSV0jGuRw8ZyOeGkYgwSLfpqP6Zd9jPj
	MRudTd8muANhIAhveynH4FwEfxUQs1ciTHwVvLi4k09UMjwIhpHI5Msd8BxlkFTloRGuBdS8I6Z
	eYwRAhXzYOoF/V+LZEVD1JC4I=
X-Google-Smtp-Source: AGHT+IEtEaxs9n/fqGJEuZ8Xotr69RVdjbKFMaVctCQmuSvnkMpXaGIdiMr0ZU582rbQFSZfQks/8XyJ+CzfPm0I+P0=
X-Received: by 2002:a17:907:1b0b:b0:ac7:4d45:f13e with SMTP id
 a640c23a62f3a-ace710a0eacmr947603266b.13.1745823074048; Sun, 27 Apr 2025
 23:51:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250420070251.378950-1-guodong@riscstar.com> <20250420070251.378950-3-guodong@riscstar.com>
 <mzfiyc2me2smqrrmiymzkzxvsyjmst6ggy7scq4wxz2yfj2ef5@np3h3k467mbl>
In-Reply-To: <mzfiyc2me2smqrrmiymzkzxvsyjmst6ggy7scq4wxz2yfj2ef5@np3h3k467mbl>
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 28 Apr 2025 14:50:52 +0800
X-Gm-Features: ATxdqUER8JSTuuOTantCFeixTZRLC93zvf7G5uIviwPU2QmuQNBr7asOpX-Fl3I
Message-ID: <CAH1PCMZ4hqYo9SLCnzHYp_EiQKs5nhgW3XpxwqLEk4eX8=vWPw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] pwm: pxa: add optional reset control
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, dlan@gentoo.org, p.zabel@pengutronix.de, drew@pdp7.com, 
	inochiama@gmail.com, geert+renesas@glider.be, heylenay@4d2.org, 
	tglx@linutronix.de, hal.feng@starfivetech.com, unicorn_wang@outlook.com, 
	duje.mihanovic@skole.hr, elder@riscstar.com, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 3:30=E2=80=AFPM Uwe Kleine-K=C3=B6nig <ukleinek@ker=
nel.org> wrote:
>
> Hello,
>
> On Sun, Apr 20, 2025 at 03:02:47PM +0800, Guodong Xu wrote:
> > @@ -49,10 +50,10 @@ MODULE_DEVICE_TABLE(platform, pwm_id_table);
> >  #define PWMDCR_FD    (1 << 10)
> >
> >  struct pxa_pwm_chip {
> > -     struct device   *dev;
> > -
> > -     struct clk      *clk;
> > -     void __iomem    *mmio_base;
> > +     struct device           *dev;
> > +     struct clk              *clk;
> > +     void __iomem            *mmio_base;
> > +     struct reset_control    *reset;
>
> Changes like these are the reason I prefer to not align the member
> names. Luckily reset is a write only variable and you can just drop this
> hunk if you use a local variable for it in pwm_probe() below.
>

Thanks Uwe for the suggestion, I agree.
I will update it in v3 by dropping this hunk and using a local variable for
reset in pwm_probe() as you recommended.

BR,
Guodong

> >  };
> >
> >  static inline struct pxa_pwm_chip *to_pxa_pwm_chip(struct pwm_chip *ch=
ip)
> > @@ -179,6 +180,11 @@ static int pwm_probe(struct platform_device *pdev)
> >       if (IS_ERR(pc->clk))
> >               return PTR_ERR(pc->clk);
> >
> > +     pc->reset =3D devm_reset_control_get_optional_exclusive_deasserte=
d(
> > +                     &pdev->dev, NULL);
> > +     if (IS_ERR(pc->reset))
> > +             return PTR_ERR(pc->reset);
> > +
> >       chip->ops =3D &pxa_pwm_ops;
> >
> >       if (IS_ENABLED(CONFIG_OF))
>
> Best regards
> Uwe
