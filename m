Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44F033A01A
	for <spacemit@lists.linux.dev>; Tue,  9 Sep 2025 16:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757434823; cv=none; b=NpBgaJ+CjHp9xS8ScBAf4eev16GCfCqbuml6KX3IeLJe90Aa4GGVIZ3S/VAw/eipknxVd4NZgyZb/ei3uUs/EG8fTpKsxhIEKA4lcSYDVQnHbBKAvYA++7neVHhYDujgZHLKmr+M26kFxZqvgKx9tOXCq7p1sVktQaN+gaG7nto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757434823; c=relaxed/simple;
	bh=/97m0jy8CzoHwIZcKBQ1zrt0w1+wQwdE+fGFa7+7SJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pn04Xqld/Eogy6kDdH1HfPVic4jJauJND0W84JVsn0nvdNUp1yibJ5omlVFBGvxnKqaj0hXPWIrJOWEHt3MIEdNweRyUILLYMe/QND+BZu4C87yZD3/4FtIUHirB9Tz85PYx3ukXUeFf/kUd8zKc406bdzDd7tU3h60WOET8Qsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=a3TO2A4l; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="a3TO2A4l"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-336c2194a65so45373771fa.2
        for <spacemit@lists.linux.dev>; Tue, 09 Sep 2025 09:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757434820; x=1758039620; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/97m0jy8CzoHwIZcKBQ1zrt0w1+wQwdE+fGFa7+7SJw=;
        b=a3TO2A4l4AAtCbbNHTi43HS2Qu4TQEbfhSiE+hurTZoD1DJ31h71pcWlPjAwYqCLQ5
         wEVJI1dWHzvpu09nkRF2NBYOng9gTt7+ljVCojP0yNQvQxu1Ug1KfOC2PP2xrTJrLSFd
         h1UI1TLaeKfgnQ/i7LcJWatHv462pIp6pDjcHd9Mz5qhyY2WsBrh4B1JyXWsiawFRO6Y
         LT06+TwXtf8bBiHM6f3kHG4HXm50E6dUDQEF6wpt0fo7roTKhCF/ucMT+VcP8CBff1P9
         0BUtp76pQqIcR8kvM04sVvSEJzx6XLZs3ILX6Lj5u/PxNpqYF0TgGrNUXHzY3XOeGJQ8
         8D+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757434820; x=1758039620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/97m0jy8CzoHwIZcKBQ1zrt0w1+wQwdE+fGFa7+7SJw=;
        b=MYa6g42p0DAjogJ0zrAVlibBcfWsN0nCjAnl6ammcjql1CwLWnh4VbAvqk8bgABqia
         wDh86YuL29QL2RtwsA/TsAmG03la+telX6JWrEOcj1COgRTcv3tdssnKB8lKO2yuIw/E
         hF2BYoJTdkdcxC35hJdMvY+iKgOUclWt8hldxtKgVdDMTdMXxxyyBw5FW52utgaa0oRw
         u/cihzoS13ClfUHYIAwR9zPCtQTL27YNjLLaMIVIrtoyvZENya5dRsBWCaur7zms33Hq
         K+3NsepEm+RkSiyaV4mnzj4oViNMFhrRnHWbqud1Ciw7gmBAhQlJsmdENcRynH53ZSNc
         GkAA==
X-Forwarded-Encrypted: i=1; AJvYcCXM0YMYvpxQR8y2y09SKLzU9KZ56xDv4NWls8FwszemjjQNg6yQGdeH/V5/euXXVxufIzRoc98TSA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5WWxQsULBJAhbM1KSqIhZpy49BCm1fq+riyjIeDlpMRrl2VB3
	3I8Wvw2DCsKlAl/p3eoYTyYQ5EbDK7jtn9RQzTXs70Ktgvk4z9irSqizwHvVXgg8p0lSn7AcQm5
	ecF5K2YlCaHcphvETdaLRCoXsV4OwjoI1GHjXXXqQaA==
X-Gm-Gg: ASbGncu5XjtLQhxGJa8VR3ROUDThj8+Mx2wCzTF0D4Gi0TIhO+3Z1SkkSnMhrD9Yklh
	B2jt8f2pIemB1Lk/+4BMRy3yWKbla+FhAtxg9K9L1VB8tQt0/d3nKjth+MLpjuCl+aBf63PAU+C
	C8C+EVqKLIY34wfQaX4yLl9hTfBQYkhMhtM0+zHqOsLneiAPKghEKnnNpjLUed1ohx42CNnDBC2
	wXqcJm7gt3czToAPA4A5uAcWJoP2Uhb7/u6hwzZX+d/zoMNFQ==
X-Google-Smtp-Source: AGHT+IEztBpigh5RxbO1CBt/5KgEHGRrHXuTWtPssLeYdALPuaphhHGsx19aeCNSyhIa3AeA3fW9VXpZoFoDSTU49vc=
X-Received: by 2002:a2e:be08:0:b0:337:e3e0:39fc with SMTP id
 38308e7fff4ca-33b51b18984mr33377121fa.21.1757434819790; Tue, 09 Sep 2025
 09:20:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com> <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com> <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
 <aMAve1MbONmKVjjg@smile.fi.intel.com> <aMAv3STeZUdSQ14p@smile.fi.intel.com>
 <CAMRc=MeA87p0QAzq_3MACQM90MhN0eRccr7u-VzcfyP8b90AaQ@mail.gmail.com>
 <aMAzZAbNwrRTgFi-@smile.fi.intel.com> <CAMRc=Mfn7atHTqKc9nMTQ19ZserqeNi3skb-QhG3CVdEhmr0gg@mail.gmail.com>
 <CAHp75VdDAJO3+NPp29GnqL=C5m7tdWbyYvNFax=Dh+dG49YAnA@mail.gmail.com> <CAHp75VffDLfvdVhnzZk6V6a9eXq4R0ZBYLUw3S=g0ABqozhWFQ@mail.gmail.com>
In-Reply-To: <CAHp75VffDLfvdVhnzZk6V6a9eXq4R0ZBYLUw3S=g0ABqozhWFQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Sep 2025 18:20:07 +0200
X-Gm-Features: Ac12FXz3JLlhRsOgq8cOPinTet2g1mbuWxd9zMtxwsTKBrX27rDe6FL8vxMW4vc
Message-ID: <CAMRc=Mf0sXnak0Ov3bwgv_xVVvw+CxA1iAcvDv+B4a155HZq2w@mail.gmail.com>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
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

On Tue, Sep 9, 2025 at 5:26=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Sep 9, 2025 at 6:15=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Tue, Sep 9, 2025 at 5:05=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> > > On Tue, Sep 9, 2025 at 4:02=E2=80=AFPM Andy Shevchenko
> > > <andriy.shevchenko@intel.com> wrote:
> > > > On Tue, Sep 09, 2025 at 03:56:41PM +0200, Bartosz Golaszewski wrote=
:
> > > > > On Tue, Sep 9, 2025 at 3:47=E2=80=AFPM Andy Shevchenko
> > > > > <andriy.shevchenko@intel.com> wrote:
>
> ...
>
> > > > > > TBH, I think those 6 all made the same mistake, i.e. thinking o=
f the compound
> > > > > > literal as a cast. Which is not!
> > > > >
> > > > > What do you suggest?
> > > >
> > > > Write it in less odd way :-)
> > > >
> > > > foo =3D (struct bar) { ... };
> > >
> > > I don't get your reasoning. typeof() itself is well established in th=
e
> > > kernel and doesn't
> > >
> > > foo =3D (struct bar){ ... };
> > >
> > > evaluate to the same thing as
> > >
> > > foo =3D (typeof(foo)){ ... };
> > >
> > > ? Isn't it still the same compound literal?
> >
> > It makes it so, but typeof() usually is used for casts and not for
> > compound literals. That's (usage typeof() for compound literals) what
> > I am against in this case.
>
> FWIW, brief googling showed that nobody (okay, I haven't found yet
> reddit/SO/GCC or LLVM documentation) uses typeof() for compound
> literals. So, this makes me feel right, that the form of typeof() is
> weird and works due to unknown reasons. Any pointers to the
> documentation you read about it?
>

Ok I'll change it. I also need to change it in existing patches that
already landed in next then.

> > > > > And are we not allowed to use C99 features now anyway?
> > > >
> > > > It's fine, it's not about the C standard number.
>
> E.g., https://gcc.gnu.org/onlinedocs/gcc-15.1.0/gcc/Compound-Literals.htm=
l
> (8.1.0 is the same).
>

I get it, I understood incorrectly how they work, no need to rub it in. :)

Bart
