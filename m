Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8102D4B69
	for <spacemit@lists.linux.dev>; Tue,  9 Sep 2025 11:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757417719; cv=none; b=HBDPRE0WyyYVEoGXjCX2R1X1VNDXdFVKp3JDAanPU4eX0l92gq2uRoRdnNTzMzCexT3OtJwj+uCzLfeYF08m+L6x4pAU+RU8tivV6aYjkNbmkDg4htwaYMo6ZskLqvGggSRtc9hRCB1wX0c4RCig8qFROuLdA8/HhJseqg48A+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757417719; c=relaxed/simple;
	bh=JRXEj2Vi20oWUI/zgU4BerivqZ3hoKieY+gD3mRHVac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C1Jlf89I18cW6awzbjm1foh1jemuB3QIl0NPgSOCNTktvepM0bB4l7jjdHwOC2UybUxHdRX0ptRreQ405UNlgR4YEvlSBFHguW+n4h0IZJBraiL08Tn7342C28V9n8m0ACqmv7AwckIcuHY49xZJeSkO6oLy3ZgdtpqsnV65sK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kKFc9bMh; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kKFc9bMh"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55f6bb0a364so5849579e87.1
        for <spacemit@lists.linux.dev>; Tue, 09 Sep 2025 04:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757417716; x=1758022516; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6eCnKOXIsJYGPMWl3D4Jhjj+0Ieti5SchV9n8g8z8A=;
        b=kKFc9bMhScKtR70U3rIQXVXPXAHnHvckMG6iS+NIcHimqhpcm+HBO6bzBtRW8YH3pD
         dWigv46kvF6KtXJF2wqdSev9mmueMOj4cL+ubNXbiaKxV9iRU2UQvzoIWX3WJcv8G+9T
         T4ljV5tPHIlBlXsQOTRJwYQMCqihGOZrDKryEjueKvVuBB5ngqJwIPHZCWpfSTGh60Wv
         K+xgEeeWkERqwv6z31O+q4EUKAOKK+Hyy7a1a/0OVh6oLgfeYGJRhaSQ2P5aVz68rOwq
         tAxBEqHd4IuaLC9hN87ZyCusllZMKbVsORvNqGdEC2x0fylQ6s+oFPCmBAYyWb3bUX50
         qCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757417716; x=1758022516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6eCnKOXIsJYGPMWl3D4Jhjj+0Ieti5SchV9n8g8z8A=;
        b=m5Db4KQXQ4x2dP9ilvmG5XU5Mo+e/Vx81+301CEAKJ3SBGw8C8XHZrEBDXcGVNnaN4
         9IJ67MW+JI7O6Rd7N7Yqu1JfpgVOh9/FAlrVP7fFMuncR9SyB+0HD3R5p6rCBE/RYmrr
         LxlnG7/onQIdxj/0iiMrBxrdibBWEpuel4U0IbdalJf1NZWc2ar1yzbCH54rJOAXrxZB
         PljORaX5CYAknFyiEOnj4hvcqsaPnw/PiXsT3Ur/DeK3hBA29DqJRbX0ZSYTnMzqBW0k
         zY5yDyNEKEIWOxl0ao0X+MGRjeLdCRAsho1pgnfYd0722IIajk+uBsRII/hmJeHYtTh2
         lG3w==
X-Forwarded-Encrypted: i=1; AJvYcCVvKHMmx7coGfOcVEai/OZZVFkkX8dFV5r3oVMMbOWST/csT6pnjZGCR2tJPRJFrzH+GvHL4jC+Mw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxPCnEqCc8vSG8UfYt7pV6a+BFvxhD9OCyp/2DFZg6fffOsI8eQ
	v1udA6V7WpGANzpOOaH0Lz8IPz5Pzvd5MqAzT5CWhmUWFEMY2V5D7R06L3x2H/BfJfEJIBC2KpM
	dNZHXvq22Mt2qV49sY+h2zOVtPenVG+d8te47x8AeIw==
X-Gm-Gg: ASbGncuCzMNDv/+CpfIT9a/kKLcXCFtKckU2qkuFwajM7EJrf8V76AQwa/kFWwF8sne
	Sx7sVYsW2qNef6z5HJ4AGG2qcryJUfb0TwlBdxX1yCo6cV/1YGKOcITQPdyyutLr+g3hnSK4qCM
	3yvfJh1Kp7/uW2j4o523vXlr3O4SMq1/IicSnnqpo35lw/BBxxZkMolz8/ZiWgwc5Wkfk7STt+r
	IhzoHnGgHnTwaxEy67w9+kA3MaQNz9cArZWaMhfFgEKhh3Mrg==
X-Google-Smtp-Source: AGHT+IHWd+/2o3jpP5pFKotnmfcWTA0FpdlTJ7xwTNOp9WJ3bLpmlAirprq1zjBteK7SqJBfI4YYAjx9R2Xs8MJv8vM=
X-Received: by 2002:a05:6512:639a:10b0:568:4ae7:8371 with SMTP id
 2adb3069b0e04-5684ae7fda5mr659891e87.4.1757417715746; Tue, 09 Sep 2025
 04:35:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org> <aMAP9hAWars0T83r@smile.fi.intel.com>
In-Reply-To: <aMAP9hAWars0T83r@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Sep 2025 13:35:04 +0200
X-Gm-Features: Ac12FXwO2LcDkWGWZohqu8ChVnTISfR-cQj8e5EdoM33wEcP1qEQLJ7mzcbrqVk
Message-ID: <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
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

On Tue, Sep 9, 2025 at 1:31=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 09, 2025 at 11:15:40AM +0200, Bartosz Golaszewski wrote:
> >
> > Convert the driver to using the new generic GPIO chip interfaces from
> > linux/gpio/generic.h.
>
> ...
>
> > +     config =3D (typeof(config)){
>
> This looks unusual. Why can't properly formed compound literal be used as=
 in
> many other places in the kernel?
>

It is correct C and checkpatch doesn't raise any warnings. It's the
same kind of argument as between kmalloc(sizeof(struct foo)) vs
kmalloc(sizeof(f)).

I guess it's personal taste but I like this version better.

Bartosz

> > +             .dev =3D &pdev->dev,
> > +             .sz =3D 4,
> > +             .dat =3D sd->gpio_pub_base + GPINR,
> > +             .set =3D sd->gpio_pub_base + GPOUTR,
> > +             .dirout =3D sd->gpio_pub_base + GPOER,
> > +     };
