Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F132C1583
	for <spacemit@lists.linux.dev>; Thu, 11 Sep 2025 07:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757577404; cv=none; b=Ou9F+DBGvEwry7uADrJ+sNg0WMmFAKXHQiaXzTNFTJAJ1xCj8nhVjeilTN9Nro+Scv4KzOsrH7b3o+n6TOLDxLM9lrr9zsa95nwlsDyxvdGykH42XdG/zqk1QKfo41OZsZ/JsZf/0my014UMWTy5I/VbSabR8ceCQyZMxEq0ZyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757577404; c=relaxed/simple;
	bh=9XrvhsWNNRvcRClDoeF6Jt3/A7wdBGZCuSPlcTCRTrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nB2X86ngzcS7uAOvLi4MFP8X1ldpm5a1O2/FLNOJv58bl4Ug0vSzCKcefqagXc63nBvbPUeA4iu6l2ub7BF0FL5Ef94EMx25ISy8sjpYrCclzXE2nZoN+S3ZMHhTfHFe8C2l4mRN6Ihm4eUlN/0lzYbavOJ01L0i28hicMr24G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CnIhPZs9; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CnIhPZs9"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-56088927dcbso463953e87.3
        for <spacemit@lists.linux.dev>; Thu, 11 Sep 2025 00:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757577401; x=1758182201; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bep7Xid77Fho0BbSmSLtdgFH7ZgtGYRYV4JpO6GqPMo=;
        b=CnIhPZs9DC4qJuFzKNFKRY9ycJ3k1bpBbaFWcRlJ4sxdixvriPZmab3We082dpWTU1
         vZ+XNHujjdH4zxkyC2MejtNyMFilwZhCi7nJsfhhL5WDKEq29U5EyTFTqfHwshoD+kZO
         jbZzHc6KmE+z0wjTW7EVpCmIwFP7t99ec52I76061UxKzIB/Gr15LKioxba0/hohyoOZ
         Q2kfaWPWLEgI7MyR7aVXBvq0Kx2UmT4SXQm71MxIoaKzxDaFbYOAexI+A7v5WRb69vGN
         VIt3faIZx9McbMp00MFsuAsyfQWlEzuw/bKvQpbSHH3hU1H4zk73ZxooTpoSVr8M6Lwl
         CYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757577401; x=1758182201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bep7Xid77Fho0BbSmSLtdgFH7ZgtGYRYV4JpO6GqPMo=;
        b=bkhYvARprsNlge/jdK7YgAs1yQUfNbPQ311VMkjYVSSas74WVVI6KFy8+FZWNBi3Ze
         NhHKx3Esl9Gfugm9Hm/+p24LsfmiSu1Cbenc9dVwhl8CqDN6SKK/UQd70/PiIAED4FHh
         2i4T7YS0eeq62PD1Q1qVkHu9rdLDoOeQZ6bH90SFmgw7/Lqn/jrrvarDIVAU7+8CuY4T
         LtNCt/UFp3GP859JjkImFdSv16p642p4A4E/3+bvi/eGlMOdI0YNtEgHV4vk9MT+Locv
         JTGyKHETxZ2EPmvf62IYD2seVtAAkfqT1m5y2UmLo6W6QnhTsq47KavUQ36x8Qq2j8jQ
         2QXQ==
X-Forwarded-Encrypted: i=1; AJvYcCX30+bp6XBcy58CbuBlASpQfFKX1h9dWxYXKvbdDjBGfLmmFoNiYzX6Hg/PRH9KNQ42a5u8xKk3sw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0hSRqbZBerCMHfI3gGKpguI8MR62mSEA17y7PU9ORCUaj6U5h
	MKAEO6dkVO0vrotXLyU1wVyUqYs9WweZihgRnQdqq0DR7hbC/micyH592VgmCt+adymWf1H/uNn
	dqHPyZV6yN1CqZfruPDhAAgbdmbbIdJ3B5oayFEvcoA==
X-Gm-Gg: ASbGncsCN4alVsyJqtwSQnquN94f0fDsOXjZRdmcVJM56SAnlZj1SXA41Nbm/QEyYvL
	qEx0oDl2nDMHIy0KOa45RvZNt7srD34TTEOtnrGcffzkCKnTy1d+eA+FdM66ROGRVbbjphilHZV
	bfhLGeMiQjGeFWF80i+g2Z5FylDKIC/xFZT0A8/A1jMp9AfoY2seWt9TuFw+YspOzPvZrFZ9yiH
	MBjUoh2SDe3LQafWBvaVSDjSjSDmM0O+p1dGTU=
X-Google-Smtp-Source: AGHT+IFSDgCLPJndg4TOxS4/+K2sQKL3XaKKbJwpYxrHeNncRVK3PIq5fLt3S1TrCjsBx8V+oC1pdTue83tyCk/M6OM=
X-Received: by 2002:a05:6512:3e23:b0:568:25d0:f843 with SMTP id
 2adb3069b0e04-56825d1df24mr3328322e87.4.1757577400507; Thu, 11 Sep 2025
 00:56:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <20250910-gpio-mmio-gpio-conv-part4-v2-7-f3d1a4c57124@linaro.org> <e0941449-7a62-4bbb-8790-616f393f2cc8@gmail.com>
In-Reply-To: <e0941449-7a62-4bbb-8790-616f393f2cc8@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 11 Sep 2025 09:56:28 +0200
X-Gm-Features: Ac12FXzR1a5xkbJIh_yEzUr3Ha0h6_elTIUATVbDxWcMjvS8AEDuwvbJ1IToPQE
Message-ID: <CAMRc=MfZ5ss8Gd_TTPV8EYSv04ENp_C26b3=wukO+UTy_boXUA@mail.gmail.com>
Subject: Re: [PATCH v2 07/15] gpio: brcmstb: use new generic GPIO chip API
To: Doug Berger <opendmb@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 2:11=E2=80=AFAM Doug Berger <opendmb@gmail.com> wro=
te:
>
> >
> > @@ -700,7 +707,8 @@ static int brcmstb_gpio_probe(struct platform_devic=
e *pdev)
> >                * be retained from S5 cold boot
> >                */
> >               need_wakeup_event |=3D !!__brcmstb_gpio_get_active_irqs(b=
ank);
> > -             gc->write_reg(reg_base + GIO_MASK(bank->id), 0);
> > +             gpio_generic_write_reg(&bank->chip,
> > +                                    reg_base + GIO_MASK(bank->id), 0);
> >
> >               err =3D gpiochip_add_data(gc, bank);
> >               if (err) {
> >
> I suppose I'm OK with all of this, but I'm just curious about the longer
> term plans for the member accesses. Is there an intent to have helpers
> for things like?:
> chip.gc.offset
> chip.gc.ngpio

I don't think so. It would require an enormous effort and these fields
in struct gpio_chip are pretty stable so there's no real reason for
it.

Bart
