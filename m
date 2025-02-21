Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829EB1FFC76
	for <spacemit@lists.linux.dev>; Fri, 21 Feb 2025 08:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740127051; cv=none; b=K3xa4wyeCxrbquN8+6NX/EaRa46CdU+ij9UaYaiiL7oXddxOClLzA9IbsE39i8s54yPFozrvJbCwgl4nwlCYD6xswvG3/4H0geYv0axvtzgXvLlWgDhVWwJ3z2NLfsAZxhB3PGfR9+kebowoeoYzUfoN093YPD1yeDASLdMSAn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740127051; c=relaxed/simple;
	bh=1Pyc5XSXk8/KpOI0I+Y0iOOSNDehTqvQGNhqxWmM4TE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gZ6o2ojMuTysOqAjcHnHEL/gD2MabyYnD1qG473sp1WOPTMnFNrgbWSgxxirOXhC7zAd0QB/+XOL0P6dlBlg7h7CaEqCBKO/k05x0NEeKPkEDVL5whoTJGmdcw9iFUQPsqoqgO6xZcxy1tGTPtODAOGQudwDjrBN+cBVYCrgxRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=efu5iFXP; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="efu5iFXP"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5452ed5b5b2so1916259e87.0
        for <spacemit@lists.linux.dev>; Fri, 21 Feb 2025 00:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740127047; x=1740731847; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fW/FAUY+BtuxgqThnl6ySpYQqHb8f9LhIhu4HPMnZ10=;
        b=efu5iFXPjmne6/GdQph+lKWU7EaaVa5imwopdcvsarDJ4PeRi0pX0cAhjn1RMmpQ/Z
         HPcp4WAxbtjgz86GWVPc6APVYockkTVaPRkU1lEb31x4Ck054rmiPrCCV1VyS2fiNHjn
         WRZVPaiPqpSICtlYfv/CUZYX/no10qBjnvjdCnYAHOQppflx+1jOylxqQXSMxXy2/sET
         3WUuIYQ+GF17SGmNyLukqwW/aOcY7cOZA6nLKQxsQCPVWue4Q+/iQy+2EXu9lEkB1d1b
         bO03FP9WnAJqjGWbX+rFfeoRyYbV+vh/RatR5Gsaz2WJIOYpLOl6wFy2ZeCjjhukSaDP
         MXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740127047; x=1740731847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fW/FAUY+BtuxgqThnl6ySpYQqHb8f9LhIhu4HPMnZ10=;
        b=eQdcK7sZ+enjYUPxg/Sr1LaGrdjFGli3aJoM9R4D4K7KB3h0V479BCytde3UKZlu1w
         R2JLqja0/sXVF0SvyrEnZwPE64EcrTxEuzQrvo8nqYmLYaZjDB1My07qNJIOD1C1BI/R
         zbk52xeM93FBteKc3oyK3ESHP8upuNQ+mft29JrA2zt2zr8lxcbh4hItwpMDkLJOJid1
         A4YTJckcUyBmzmRm3W27iBq/o3T/D9GIDadl5np6qKs6CSf2wIeuRqo78yVl2/8i7AAp
         uw4aZv39rKEaDHzj+26RU/N8i5nicapTayxejygA7DzoBWIEaMXpGzj+EJ/QEp4fZtNI
         s+oQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHUfYte2bZhU+e7KXhqkAYV8KwmK57jM9E6idY7qoTesWPz+PCMv8zU8M9G7hgL4Atp5XLv+ufoA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxnP9+lHRlqeO8rcpBQ1KONYzHD4vjheRd98DyE8QyiF9Dht2+9
	IrJDRxGZHRSyHwW5xi28tAr7lrZErCx9UPfzdX/7hZRXkOuI70ZsrTaEuZUBB7fzzM1hvnjFWmJ
	IuHe3sFBF7DW0HSOEYMqpqqGXZE0PO0tlg6ODzQ==
X-Gm-Gg: ASbGncs/heNQwAznNz08oi4zYAMTF1cMhKUk8bJOeE37sJo2Xrh4t4o3LCf2QCh/rC8
	hFo6yI5uahq2yGuWzZGAnf49z9kqSVk2g8eOoquQGYTwQapXOnFs5QPcEVaBl1R7n14el9JMxD0
	tgdlbBLH8ehsQsD4aokXTUYkDeLlG0zGUCCbBGqqs=
X-Google-Smtp-Source: AGHT+IEVJYqpV94JpnSSmFsbKfheCNp8/0iZB0ZSGoVT/MInSsid5S3N4SwldmQ4L5O1E7gpGonbz4t6nSMa3dwR6i0=
X-Received: by 2002:a05:6512:230a:b0:545:17b:3cf9 with SMTP id
 2adb3069b0e04-54838f5c910mr744359e87.48.1740127047367; Fri, 21 Feb 2025
 00:37:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org>
 <20250217-03-k1-gpio-v5-3-2863ec3e7b67@gentoo.org> <CAMRc=MdJszmZ8d1MGo=bfJ8TwqOYBPLe2Jfc9MfbErDUCMQktg@mail.gmail.com>
 <MA0PR01MB567180C0FE89E3BEBAF2B12EFEC42@MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MA0PR01MB567180C0FE89E3BEBAF2B12EFEC42@MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 21 Feb 2025 09:37:16 +0100
X-Gm-Features: AWEUYZkPeZ_f9Qkm0Zlcw9GzT4Sb60CF7RDIsxK-TmMLrjs_ajHOShwiT4OIdzI
Message-ID: <CAMRc=MdX6KiGk1zBRK3bZpN3iM16-8mDq40sTez6YO2kJEq0zQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] gpio: spacemit: add support for K1 SoC
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <mr.bossman075@gmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, spacemit@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 12:36=E2=80=AFAM Chen Wang <unicorn_wang@outlook.co=
m> wrote:
>
>
> On 2025/2/20 21:34, Bartosz Golaszewski wrote:
> > On Mon, Feb 17, 2025 at 1:58=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wro=
te:
> [......]
> >> +#define to_spacemit_gpio_bank(x) container_of((x), struct spacemit_gp=
io_bank, gc)
> >> +
> >> +struct spacemit_gpio;
> >> +
> >> +struct spacemit_gpio_bank {
> >> +       struct gpio_chip                gc;
> >> +       struct spacemit_gpio            *sg;
> >> +       void __iomem                    *base;
> >> +       u32                             index;
> >> +       u32                             irq_mask;
> >> +       u32                             irq_rising_edge;
> >> +       u32                             irq_falling_edge;
> >> +};
> >> +
> >> +struct spacemit_gpio {
> >> +       struct  device                  *dev;
> >> +       struct  spacemit_gpio_bank      sgb[NR_BANKS];
> >> +};
> > Please don't use tabs in struct definitions.
>
> Why not=EF=BC=9FI see
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#struct=
-declarations-and-initializers
>

This is for the tip tree, not treewide.

It's my personal maintainer preference. We do use both under
drivers/gpio/ but I prefer no-tabs in new code.

Bart
