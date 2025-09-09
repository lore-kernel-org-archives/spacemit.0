Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8112D340DB8
	for <spacemit@lists.linux.dev>; Tue,  9 Sep 2025 13:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757426217; cv=none; b=kYWgCuGkZmSp0Pnks6Qzf/azlzS79pGpyEWypnMwDPoUZfZScztyh4C+U4cZR7CsOcQBLcSvrs0Dc7MsK+9No3CY9CbW+FuMXLOh3O5qndILrFVyDVbtcexswBVcUt9EYMlm6TueGp/8rOvv6y6BByo16QiYkRpnHQ0QI8P8Zw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757426217; c=relaxed/simple;
	bh=WHJeyQoxrfPmUkZrw+WhWWyRIvgBswo4VP/FGQPO7jw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H8ft3yNqzIppt584s4KkReu+T7lmRtcDQ8pRHA9mnLeQA+lgXFXR/PiC0KdvgJwjpHTKNpeB+VBxnnlK12R6G1+FjQYjmTEzyTNUdIC29yKFFojqOV/niKWN8hhldDKhJrjOKktEv/VU9QHxzx0Yp7nw9rev6NulHMiBzc/TWs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eYOaJZim; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eYOaJZim"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55f76454f69so5340216e87.0
        for <spacemit@lists.linux.dev>; Tue, 09 Sep 2025 06:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757426214; x=1758031014; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHJeyQoxrfPmUkZrw+WhWWyRIvgBswo4VP/FGQPO7jw=;
        b=eYOaJZim/lRglK173BPkY+hgxndPy6Fh4TrBhc2mbcaBYhK0T2hbnIi0zwI3Gf3WtI
         bzIrPy/a11QObAsHuUoItSpO+RHLkYrVZ2HAYkk1tHssYXHInUmOq9U9nvD32yJVO8PZ
         5sgVWoZ48LUgNNNrtQ86G40T7PczHhp1Wk18dq/h4/chcj8tli0Rjp/ADLKUrg0aJtqU
         uL8JxJ+LpYssfcFw+8tjc4Mq/TVGe7Z4zVhVgBOPQ9E5dOZUexIOQnMpDjEpwNvZZ8c1
         xs5RBNQaqTG51THpw2tU1jpFT5ZUieDq8Q7XCbTirSkFPw61OmMrFRXVAT2DmoAYwXiz
         uYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757426214; x=1758031014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHJeyQoxrfPmUkZrw+WhWWyRIvgBswo4VP/FGQPO7jw=;
        b=WHCrVkqpdTjsH0XUjAcutAoTc47vJIWOPx4CNQeD+NE6yQmxQT/3inefSLcPvRVeJi
         W9n4PMBrPc+3eO7CpN4bBgmzwwugoC6x7Czu9T5ltOTSsYKOUsosjlyFcqI7gNQanWjV
         Jk/B1zl5k9Suenkm+bwAM4POCj/lSakUeSU1MWE6kkIf9xIt6nZP0tDQ8e+GQXXy1wu3
         raXVEBDJs/dCba6ITQVVReb8X4KSqk5ljAVgjHPSOyGRquV3ny9ueKKLhYDC5JmS87NX
         4qctssKzt08z1qIC+NhPXe+HBaFcqjX37fjf9UDHky+fNaKzu63PHoJz7kToEsbetAQa
         1uPA==
X-Forwarded-Encrypted: i=1; AJvYcCXLXZWsXGFkLyf8RUP7RWt2XWNvIjiSi9QTn8JuX4e73lArdLZuUu2exJ9esAG+p8JsILiUR7YXSA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyinFnb+J7OKvaWszGFN5b9Z4cDIWX1VEwvMnOFjwh5rtZs5iUK
	e7P2KPVkJlhFK5klHKxnt9OhgwPpt/Dsr0Uz49eDsdINewOmEWt3pBUXugZG70Y2LNN6TY21fCn
	ZPQffj/dl+fNkpwtfJW0vwyO9OjfFuoZbGwgyM2IGjoxWDkFIuss4
X-Gm-Gg: ASbGncuVjyTGO24RvwZ7rQe5KGMM4PC2an+8PWWmcEN/mdfLT43pDt9nCqivxVUb6lA
	3b/5E/wAsLwy3wV7ZY3iQxaQfvvFF/SqeCpivUMXffN1/QNOW80ZXHKdxNXM6IQjOuoTIZ/cU3x
	dzaWYlEerLsbF2hbUiuZI5G3P0PrqXvbh++oPJknRdYZpNO3TYAM9lm73CzgWs1+RSCQvktWHro
	sV4Y6xQgQanApigmahQl4Ia0QQdFdTn5LDMtodxX478fwWO8w==
X-Google-Smtp-Source: AGHT+IHBxkyJPoP3osXnpgBU6pdsryw/ot72GCgtbXz1ukCkdeMh24NQ6AJOJ87AcYe5pD0xcM8OlZUSXTQKermPfKE=
X-Received: by 2002:a05:6512:b8a:b0:561:9635:5af5 with SMTP id
 2adb3069b0e04-562619d971fmr3883543e87.48.1757426213571; Tue, 09 Sep 2025
 06:56:53 -0700 (PDT)
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
In-Reply-To: <aMAv3STeZUdSQ14p@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Sep 2025 15:56:41 +0200
X-Gm-Features: Ac12FXw-xJdDcWBTzEH08jjeniZk8zNeWwiQ6jDsDwHAH3I_S_ZPt9IHyI66KLg
Message-ID: <CAMRc=MeA87p0QAzq_3MACQM90MhN0eRccr7u-VzcfyP8b90AaQ@mail.gmail.com>
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

On Tue, Sep 9, 2025 at 3:47=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> TBH, I think those 6 all made the same mistake, i.e. thinking of the comp=
ound
> literal as a cast. Which is not!
>

What do you suggest?

And are we not allowed to use C99 features now anyway?

Bartosz
