Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177D3340D85
	for <spacemit@lists.linux.dev>; Tue,  9 Sep 2025 14:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757426756; cv=none; b=UoztvIrkNQQ6sXBrx72jbOxwYCga0Y8LbIXhOBWRZgkTNOwEDNiU4743f4zoMhIawwmuQfKN1xyD8FL6OzAR2IxFQBeA4jfeK4QYrhqeArbHwEOBcLAQ3PM4VuBUTLQlw3sr6HYVZ91OckR0LB8RxOP8XR3ZcdWWvvFTBZU/wUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757426756; c=relaxed/simple;
	bh=vwHR1FgOXXSSp2VsIjgAXKNRhzqoSYPvwttSy5YEpHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oTdevX2W0wq328MQWfwPs6NzeP2pHOAscflY8oRHQViFqsEW/waj0EIbl5x7oMMTeaZ4uZ7J71kf4gvONu9u3t2p0hGbLlUzf5o6DD96p2lS8+BWrhCnuvdL/uIozjVGwYYcMsuhMHXtPNsVISAn3ZaFcN4JewewWQ+auD948pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bnXRG2L+; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bnXRG2L+"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55f6507bd53so6094709e87.3
        for <spacemit@lists.linux.dev>; Tue, 09 Sep 2025 07:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757426753; x=1758031553; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwHR1FgOXXSSp2VsIjgAXKNRhzqoSYPvwttSy5YEpHg=;
        b=bnXRG2L+p/r+6RZ8wQkhqTTu32iXfSmUeJsUB18p3HgcDhfJ2vlx60Jg/AOu4KyJYk
         xF7LSjiuMWhO5E3RQkEWpdujPyvwsabrHHEx7eTGI/R71nmyxQzQ9q3YoZBgx50XgcgE
         6GwkxKIxtj70zKDVhfGGk/6WxVM71NStc0gJkgLoVmDqZ5p0+c9Ed/bfUB5KpzrmEYdP
         jIv8AzRydvzrBHfo6a5v5floOYrmMJJvM78EFahUzQwkXK9Z3geH8p6iycQ6w28a5EeO
         iYNQtkcheOC4GzLQiCxwXr0R4fJArrcZjxC7evm0RO81Dw/GzSVPnN47qVIAbRTg6Yo6
         TEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757426753; x=1758031553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vwHR1FgOXXSSp2VsIjgAXKNRhzqoSYPvwttSy5YEpHg=;
        b=nsUpLpQbxSK5JQ5W8vG37b5rJfK1Al8VvQpcLNcJ/aOkDCqaBkcg1IyCAl+fvyUdFg
         osJF5CmY3rL/SEzIgAE50R6TPM0vnEI6XcC1CU4MlcVo1g6hGat4rYM5q96v7Kocfbb0
         VtND82rfV2hlO1YefZWY4agnf0bezDFC0S7AM8lDVNexnK3zwekNDqmldgkASRahlioT
         nDK7zIrUAn8WacSvYg5yU3sjousk0qeIhqSNQ+dTKQmQQl23ATQJR5yWh5pMgIM5A6YO
         KAUPm9w7KXUoLDtLOgJh7kvtPlcKP7vXnjn58XXkidc229mDmAMAHllTeecIm+oxOsvE
         cH6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWCPhVdHXqvxxR58JO6fJ66iLcKYhHmtSMZ9YIStX9QhJe9dKTHYfviaF9uGml71hbDSGzI/bSQQw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwERSYW6eDy/HGEmm8hQyvFSMkj2bc70yHWhvnjKnbIOeyZ7bci
	mC21wO2VQFSQT+JompihTrfu/1MT/sGVqzaWzX2s+7grEYkVvUGnlg7NgUrhJWXYRG+mg8sT71l
	PQZlwIuFVCLmjtEq/822I+S8Aw+WYNdkEbpabiG5Jlg==
X-Gm-Gg: ASbGncuj43C7bgY1ncstFh4mlQNsqmgLkWfvKS0XaD4kQ1oeuxFZ0aJfLZMVKThrX7Q
	N6D7ehfRE+odznR1Tp53Rw97y56/+dARoO42fEcDGhC+/oysx5180Mj1UOgU84wf8u1WdmgeaRk
	MenPxUA0gRYHcoAyIC9aMWs5c5Elrv8Pg1M6CJr/YJ4lfuk657MBHpgFm/nPqkGJ3G7VomznEkS
	M13CPbaFpZsgPvrQWxWNd2rgN6zDPDBOc+SkqA=
X-Google-Smtp-Source: AGHT+IHxbtPyFzNpPyeaiiBaisDmRYDyXY5HX06QQvzN7rQqg4ycDBS5H9rZi94hP+dpGNYd7MLd29QcT4mULfuZ6+0=
X-Received: by 2002:a05:6512:108a:b0:55f:4db1:e450 with SMTP id
 2adb3069b0e04-56260e3b836mr3230997e87.22.1757426753065; Tue, 09 Sep 2025
 07:05:53 -0700 (PDT)
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
 <CAMRc=MeA87p0QAzq_3MACQM90MhN0eRccr7u-VzcfyP8b90AaQ@mail.gmail.com> <aMAzZAbNwrRTgFi-@smile.fi.intel.com>
In-Reply-To: <aMAzZAbNwrRTgFi-@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Sep 2025 16:05:41 +0200
X-Gm-Features: Ac12FXw1RLq4MdeG1hkRFaIkCvacYp3h7kbqz23NMJgO5kiwlT10dViDUNZvzbs
Message-ID: <CAMRc=Mfn7atHTqKc9nMTQ19ZserqeNi3skb-QhG3CVdEhmr0gg@mail.gmail.com>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
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

On Tue, Sep 9, 2025 at 4:02=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 09, 2025 at 03:56:41PM +0200, Bartosz Golaszewski wrote:
> > On Tue, Sep 9, 2025 at 3:47=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > >
> > > TBH, I think those 6 all made the same mistake, i.e. thinking of the =
compound
> > > literal as a cast. Which is not!
> >
> > What do you suggest?
>
> Write it in less odd way :-)
>
> foo =3D (struct bar) { ... };

I don't get your reasoning. typeof() itself is well established in the
kernel and doesn't

foo =3D (struct bar){ ... };

evaluate to the same thing as

foo =3D (typeof(foo)){ ... };

? Isn't it still the same compound literal?

Bartosz

>
> > And are we not allowed to use C99 features now anyway?
>
> It's fine, it's not about the C standard number.
>
