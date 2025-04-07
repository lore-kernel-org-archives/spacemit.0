Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3CE23A9B1
	for <spacemit@lists.linux.dev>; Mon,  7 Apr 2025 11:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744025189; cv=none; b=bcJrzkapbPAZxsuVqi+ZZ1ydnUY3PG5K2fC1+OeNmZ70npemW4xFqitLHJYqr196Nh5EW4P5OV+dWiAL8kSglkNRbsHefYTm6kgp5TuJiEZMV35em/dc6kzaFxSu29sterSQGU/dQyrlmMypH9r4SZzh6/uRUmxAbiLS+7wSo34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744025189; c=relaxed/simple;
	bh=RviIKAswlPvNGRsEWdEPn05fxHOsZa6tlhHIEII4Ung=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GIVB/iUrLH3xsPCEM/mV7zo2TchgCVImAlyrvxwNuu5HoFS7vMk0XBW9bwK72mTsntDwtVN4Xmc2XOYcB8aLd/yJEeuZWd8sPW2ET/CWuk0SL8m8SI9evW+iUTK0BpnGD9REzHxMiGYI6rcgWd4r8sIHRbsde5cX6ZGViOeurus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MTvGHQ3z; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MTvGHQ3z"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5499d2134e8so5166123e87.0
        for <spacemit@lists.linux.dev>; Mon, 07 Apr 2025 04:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744025184; x=1744629984; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMO1POcPMv7WcEI3IEK8Y5twX/lsGWmxAHtpCcotjPQ=;
        b=MTvGHQ3zYkCCj0+m51D5KUj7K+nX2+Cf9suPmfiyIkG2ucp8WcUrvnzxfXbImKsayL
         Be//Z9ObhjlbTRjiHusofRxrj2dgzJljni7sp6aeQ3Wga6cBOkZfGVig/GeNtHMfH73W
         dO9AbiucEOBpm2XtlfXp+gA4TZRS15LLcnTXCOgItNuW33SKdOrZfK1+HWBBxoq0z6I2
         frXZUY59jzFTeNdcEJt++ty5829l5PxailHmLQQC+JAPTE7aNz6n7g8AIRrHD4FeXRab
         n7AaAj7gRqJ+uUPEFIZqTxCbRCa3fv4A1TKrxBGvE58rF1PWTWwtbYwT+6FjYl4jj6Bk
         8sLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744025184; x=1744629984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wMO1POcPMv7WcEI3IEK8Y5twX/lsGWmxAHtpCcotjPQ=;
        b=MmIyMJrHIshXb+4PwlshRz77e16sjFBtH4UDxkNMgDYHHOJjAs5vMCnOkaI2QMrc9W
         3l3NuHLEgmqOMxC6MruyK97IX+S42t1mYO2H/shn5yKX7f1EM4MukLPSE6zmiUleXqju
         +2O9cufnrszIhYUHPiKmTA8AfgZqbKf04byd+4h9v6tFyBKRgFVGYLl4QHmFgZZ9ey6g
         k5GirkT8OotUuz24c9ZUkTuaTDnDAR6zTumqS3YyjCc79BIm2JV9yAOo7MToE4bLpvJ7
         mEDHBNJYmBwGw+PErPl87HY2Qw1Sps0fZzJxTOmPcrOu1vjriS7qPvfhzZdgXbo2brDJ
         J4sA==
X-Forwarded-Encrypted: i=1; AJvYcCXo6d+JW/6GY//tYmKYr9BTRxOdhH04UV9RcU3PmjugzhlicG3uKBxBiivG1RNcEDLQAaLE0xXF8g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzI0QE+THqv6/iDXYBclsBYnO8Y0Pu5sGRS9NDBIlwOePIoNk/e
	tJ1P4MVuRr0fcrNOkkGw9pivWDaQval55QmfSqLWjXw2UkOlcoOFIGOfGZNHVNvnCjWFfxpeJuE
	Dc6zQCuaLfS7bggOkNFaARpsDMqahvhYTH3FiWA==
X-Gm-Gg: ASbGncvy6MMxAJTI+ESyGDsiCc5cd2tIlB5/AyiyxodmxlwvNLAw31nOegI54lnOr7W
	TSozBVsFJH7OarkWMD4s7igTjxga6k/nW4uuz68hRJ6xuLPfF64Cltb1snlh3QnNf7l5/IIMMPj
	4xCo6O+ng8bL1EQiKk+TcZoiH76lbHY2oCkLX5m9PdOKV28+8OekeqG5V4lJjEjI4sCSBm
X-Google-Smtp-Source: AGHT+IEF0Umob27acb0T2mBiL6aYslIf1iwF0v4IeDnV4GdBZ6Kni8wcccQPNxQv4mkDvYKKandIkloAlzt8S6od9ac=
X-Received: by 2002:a05:6512:400c:b0:545:48c:6de2 with SMTP id
 2adb3069b0e04-54c297d099bmr1645433e87.13.1744025183610; Mon, 07 Apr 2025
 04:26:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
 <20250326-04-gpio-irq-threecell-v3-2-aab006ab0e00@gentoo.org> <20250407103320-GYA13974@gentoo>
In-Reply-To: <20250407103320-GYA13974@gentoo>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 7 Apr 2025 13:26:12 +0200
X-Gm-Features: ATxdqUFdC84fNZAgdG0QB3uYh3FcHqNCfMgI5v2DW_l-kU6Xw4akq4WaqW0KsIA
Message-ID: <CAMRc=MeFK1gX69CWH2gkYUqkLU-KCOcwHcA+gjN1RXFA++B_eQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpiolib: support parsing gpio three-cell
 interrupts scheme
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 12:33=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Linus Walleij:
>
> On 06:06 Wed 26 Mar     , Yixun Lan wrote:
> > gpio irq which using three-cell scheme should always call
> > instance_match() function to find the correct irqdomain.
> >
> > The select() function will be called with !DOMAIN_BUS_ANY,
> > so for specific gpio irq driver, it need to set bus token
> > explicitly, something like:
> >   irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);
> >
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  drivers/gpio/gpiolib-of.c |  8 ++++++++
> >  drivers/gpio/gpiolib-of.h |  6 ++++++
> >  drivers/gpio/gpiolib.c    | 22 ++++++++++++++++++----
> >  3 files changed, 32 insertions(+), 4 deletions(-)
> >
>
>   I'd assume this patch [2/2] will go via pinctrl's tree?
> as patch [1/2] has been accepted by Thomas into tip tree [1]..
>   Additonally need to pull that commit first? since it's a dependency
>

No, this should go through the GPIO tree but for that I'd need an
immutable tag with patch 1/2.

Bart
