Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE10220A5EE
	for <spacemit@lists.linux.dev>; Fri, 21 Feb 2025 12:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740141222; cv=none; b=YvaWelmHU7ePq5E4Oap4NP5t3OtQenRMoHz1z3C+IUsSCLmZlOh0EQRGhdeRlzJbEN3kPRwPxpQ0qtBIdlXxGMNJloFKjtarfliOs2GpQ4oB+FV2A/cq264OcnW1USfnKyY9uAltJW/Ve0KrVDYjanLF0kzQq2mJ58NhhNbWvMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740141222; c=relaxed/simple;
	bh=kfzbwTjAyVRMgJOs6AmC7N34SpH3lxEox/yHKjIhldQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ge7LoukJoMDwjDJaYh68F7zGmG6KBRA3YTREPeJCWKUrG+xLqXQP7zskmJP6VjDWuZAeb7sNZV4KUZMr+2bXIoVXqmNGDv8YXHPWEEAK23ogzVeqLk7tnIB9NsoyABAbFTVKyJy3hBs/6uEIXehAdgZ+uwbO+082P+YFfXiWalA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=H85fzklK; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="H85fzklK"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5452c2805bcso2311865e87.2
        for <spacemit@lists.linux.dev>; Fri, 21 Feb 2025 04:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740141218; x=1740746018; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=laCji0wgcejA8pX+AF6wxbOGQS4OFrsspaTrAMdESBk=;
        b=H85fzklKQGYGbJx8b93yHYNXahzeb6FFZXUABohoBfmr0/NGfCkZWlmR9/wJtL1BFF
         BJMR0rplZo7B62B7xZ4Nb4+++k3t7RR3IYe9zeTzeK9ILjESZ4L4K8kydLMFUTiJbILr
         D76ywyiGa2W13D9+vfdw6gRumRFGMbNduNlHQCuANZrHLp1FV9fFpZH0KO+7LHzy7oEH
         OyLyIq3DdmrF2upUZA7v78t3V4GYA42xbXCDG0hntsrlaWu9ziPYsvp2RR7hgcwQx6g8
         MNGsMxhIQSHq0Zv+0sKTZQpaxWV58zYLp5QnC5priwKA/+d8hJvX8CspQUIj/EjUWqhe
         gX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740141218; x=1740746018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=laCji0wgcejA8pX+AF6wxbOGQS4OFrsspaTrAMdESBk=;
        b=rsKEJg6Uy+C57NsO97k3BzYhRVJogOhSpS3umygyTAtha0tgWJpo/KznzeJGuXLw7z
         V8fkmfQ6U/no1J3x6zoz2elRDnuhi9wVGWz9sp9MVHAMHCAnXoYBQzDJHekJtYcTfgWB
         mjemQPbD1e9K7VpQg739stiFfwMs+4E/r2DnMGNx95Gs8/d4tKdb5AKTJ5LUXIPSCwl7
         H/STZXnSg2hrTdJDcMaPUN0i3IMaASlSFy+VCTixybhgWuVX3plRlLCNEQreIh40pvp7
         xXsyAgD55x7G1S7XqCE0YisPF0lqRr6Q3Ywm8+1U6i4AAAuM+ofEAhHTk0G6o5lUFo8N
         pdFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFjwfFWrr7NXjpB9GQuuCKCHtka+bwz1sf54PWHl057rK1w0c/OlhOVk1s+w2q56KC9HG0iiXvew==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPnTQ21ePqKpKCwya8bvxIlxxQ/OMt+70YWFhaI7pn1RFqhL24
	bqeJtxAV0Cgpa8qxDPIXKhyZSqe8mC6diN4+dizHGuiBWd/0XOZrJEdONjyNGmtF9Nirl6FDxE8
	Zq76lpxGxeqhYleD3QZ+9d+YWnQgY/VHyUACV8g==
X-Gm-Gg: ASbGnctsYRSSGMwESqWniy9hKkZVva8KUCXugAq1pAt/hz+/uK3hxhSj6MB2JKuI+cO
	17FX4h9eZODGeOcSpK8/cq4NIL8MxTG/5Bv9FjVOEaDgtsjvs8loFu+omM1R8XquU9zyotkzSgz
	Lh3rpkWxsd1zVpDtdNWwSVUvtC4XDKyHS3z8yYiNg=
X-Google-Smtp-Source: AGHT+IF8P3wDFcp9YKaC027dHaySwmaNX5iaDpp3C16lxDq0a06pZGaS/beZ+S8CGUUtscqFetXUQ7xQyX+bCcMlTIE=
X-Received: by 2002:a05:6512:1319:b0:545:49d:547a with SMTP id
 2adb3069b0e04-54838ee933fmr1110810e87.18.1740141217814; Fri, 21 Feb 2025
 04:33:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org>
 <20250217-03-k1-gpio-v5-3-2863ec3e7b67@gentoo.org> <CAMRc=MdJszmZ8d1MGo=bfJ8TwqOYBPLe2Jfc9MfbErDUCMQktg@mail.gmail.com>
 <MA0PR01MB567180C0FE89E3BEBAF2B12EFEC42@MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM>
 <CAMRc=MdX6KiGk1zBRK3bZpN3iM16-8mDq40sTez6YO2kJEq0zQ@mail.gmail.com> <20250221122125-GYA35549@gentoo>
In-Reply-To: <20250221122125-GYA35549@gentoo>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 21 Feb 2025 13:33:26 +0100
X-Gm-Features: AWEUYZn-ieTWF1DGfmKnjgr1pt858szsAsKVHHDN3y-ddz38_1CC6vtmW7gZy14
Message-ID: <CAMRc=Meg6kdEQ6B+u+rfcBc1d6rMO-9Prz4oFoSF-WFZorZeNw@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] gpio: spacemit: add support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Chen Wang <unicorn_wang@outlook.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
	Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <mr.bossman075@gmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, spacemit@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 1:21=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Bartosz Golaszewski:
>
> On 09:37 Fri 21 Feb     , Bartosz Golaszewski wrote:
> > On Fri, Feb 21, 2025 at 12:36=E2=80=AFAM Chen Wang <unicorn_wang@outloo=
k.com> wrote:
> > >
> > >
> > > On 2025/2/20 21:34, Bartosz Golaszewski wrote:
> > > > On Mon, Feb 17, 2025 at 1:58=E2=80=AFPM Yixun Lan <dlan@gentoo.org>=
 wrote:
> > > [......]
> > > >> +#define to_spacemit_gpio_bank(x) container_of((x), struct spacemi=
t_gpio_bank, gc)
> > > >> +
> > > >> +struct spacemit_gpio;
> > > >> +
> > > >> +struct spacemit_gpio_bank {
> > > >> +       struct gpio_chip                gc;
> > > >> +       struct spacemit_gpio            *sg;
> > > >> +       void __iomem                    *base;
> > > >> +       u32                             index;
> > > >> +       u32                             irq_mask;
> > > >> +       u32                             irq_rising_edge;
> > > >> +       u32                             irq_falling_edge;
> > > >> +};
> > > >> +
> > > >> +struct spacemit_gpio {
> > > >> +       struct  device                  *dev;
> > > >> +       struct  spacemit_gpio_bank      sgb[NR_BANKS];
> > > >> +};
> > > > Please don't use tabs in struct definitions.
> > >
> > > Why not=EF=BC=9FI see
> > > https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#st=
ruct-declarations-and-initializers
> > >
> >
> > This is for the tip tree, not treewide.
> >
> > It's my personal maintainer preference. We do use both under
> > drivers/gpio/ but I prefer no-tabs in new code.
> >
>
> thanks for this explanation..
>
> my intention was trying to keep struct members aligned
> if tabs is a no-go, would using multi blank spaces to align be acceptable=
?
>
> something like:
>
> struct spacemit_gpio_bank {
>         struct gpio_chip       gc;
>         struct spacemit_gpio   *sg;
>         void   __iomem         *base;
>        ...
> }
>

No, that's even worse. :/

Why are we even wasting time arguing, can you just use a single space?
You'll get a driver merged and may just disappear from kernel
development, Linus and I will have to maintain the code so we do get
some degree of discretion when it comes to coding style.

Bart
