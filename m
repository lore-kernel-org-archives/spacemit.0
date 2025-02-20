Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337FD1E5B6F
	for <spacemit@lists.linux.dev>; Thu, 20 Feb 2025 10:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740046943; cv=none; b=ceVzP7vZhm29IfkFZ22wx2B5c2aS8jfsCMjhNb6UcbRlG0svmEdTU0rjkVyT8R9MKU6EglyfOd1e87ZwoF+MDzFmuslaqsWi8wETje26eg8ZkChugPRcjwSy4IeuGYF3l5ia6ZaXAq6Z0EY3Kwk20t2S++aRZwRJe2Wh3TKl/uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740046943; c=relaxed/simple;
	bh=jOVTKQclGET5JYRc6XUbL9hn0R2HM4yai3zEupfHd2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U7ODoh7EwC6QZGvkXWP/5ZksTOvUt8JcxJ2XWmSII76y3UL/gY8MNgQnIJr4OpIeS5McMpsLrpsOyfv6STCJ3HlbDHEXfvRF0MxeevagG72bZs/exlbubuBO7d6fzyXfuOPSsx5zyuGrgRAj9Sj4046diWTWxJnA+QIOH0auln0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=x3lcKerr; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="x3lcKerr"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-547bcef2f96so128499e87.1
        for <spacemit@lists.linux.dev>; Thu, 20 Feb 2025 02:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740046938; x=1740651738; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkSjnPvhIdGSMhTbx4xuOa7rgF3IDrn9ZbqjQjQTkQo=;
        b=x3lcKerr7ZxK4qTGLdSNyYJ76iFUvDkDgpwP+wvYPoslUk/tp7B+uxNZpm9NgNkSxn
         nemfEzq5oMF7dLx91Uq6oMkIBllz3bKIUNmfVzEIeGRzq3ed2lmVe9Pm8ZuWSaVUo5EV
         AVoGEbxegXx+Hqyo1z1r42zR0n/tczRY6Y/a1vFkN5SdMjT/IVqmDLjSps/rnOeUZDKR
         FnCdMIqAQgpvA3jqCvNPiHxa4jnYbraD5C5EHEqQ9pYjpXl0F4O9+O39GTeKnxBh6dDP
         +bSVWkfRLSKI+qaO+e8Uqtgba3Sx/3GQiNmYyDA6b/nO5ko1Zc5y/n+JEX8bEfmuxTbc
         7PyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740046938; x=1740651738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XkSjnPvhIdGSMhTbx4xuOa7rgF3IDrn9ZbqjQjQTkQo=;
        b=QSESn/S2f0dYlSxa92NqNhLkBQjGhena67vUaF/TFh6LuWlaIfdi/hJ4nv9tzdrv8J
         lH2OB8b6V0Wn/VeO671BEOKqy1ZIuK32mBwh6K3yX6wfwOhLFyuUh5oO0nx//6IMzJhh
         2MU3HBgaod5M2ZlxHgHRPZxNY+bxzZnUpXVFRe35Ty04O4o/Hz2PInorIec6xbLJ3GQw
         mbEGfRrs5j7o4ajF3oGO/Z7PxvzligcILqXgtXvqnJXgKuf0CQ5k0bHSLEMlC1S4RekH
         V6Q+fNjKSxhx2AfMpCuRzqoxkdyuV2sHzTMoTGQ28iZ0GJauZABSwdRX48C6PVJg510g
         2z1w==
X-Forwarded-Encrypted: i=1; AJvYcCUts3qHtYWSxlfzIvA9rhHvaKPOln4QMsa0RDEaehNqdjlpDAI+Jsw9QNwLiRRRIUM2mtf9hVypiA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzH8BE/pY11crFqGWPLLLGIkUgAovaDKcBGVmMX1hOIKjwtalo2
	rjMEzJ33d81cZVxcKJVmpjxn2tf6+3nVliamEMvEoJU19X32LaTmiDZ/2kcxYu7wV5SLRyIMOUC
	O2VwI421gvnkI1chzGem7lPEc5vRXFB4Peiipqg==
X-Gm-Gg: ASbGnctX1NVQn5DKfzve2V7kjjg1QSX+lfTFLKRNkEhsAoaXkbxCDjylaJFhS8g9F9E
	SdkuylypBIcUcpt+SbB38dkxQV/VjFpohFxX6GydFEvROVCidOeVutyiIRWa9E89b+UOhjEx9qT
	W7nURsN2JDi+tYsQPfNqP/yy6S8Q4=
X-Google-Smtp-Source: AGHT+IE7ycVVt1d8Epdhqngc45O4P0xrOwOQkPZv5wp+QGx6BPbp3JM32UOKdgqnWZwOei+ObE4ZSLIyhVDxExTl7Dg=
X-Received: by 2002:ac2:4c46:0:b0:545:bf4:4bc7 with SMTP id
 2adb3069b0e04-547243c348amr871274e87.19.1740046938079; Thu, 20 Feb 2025
 02:22:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org> <20250217-03-k1-gpio-v5-1-2863ec3e7b67@gentoo.org>
In-Reply-To: <20250217-03-k1-gpio-v5-1-2863ec3e7b67@gentoo.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Feb 2025 11:22:07 +0100
X-Gm-Features: AWEUYZkU7hdFlPspPbvUdBzoHfPqDtoAsaxfbkwGu_CSQGks7Gip_UiARp6sYIc
Message-ID: <CAMRc=MdGBTXRSAgY2vjOrqVVRzOyYh7N8yZsjK+W4cYFCQAwhQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] gpio: of: support to add custom add pin range function
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>, 
	Jisheng Zhang <jszhang@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2025 at 1:58=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Export custom function to add gpio pin range from pinctrl
> subsystem. This would make it possible to add pins to multi
> gpio chips.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/gpio/gpiolib-of.c   | 5 ++++-
>  include/linux/gpio/driver.h | 7 +++++++
>  2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 2e537ee979f3e2b6e8d5f86f3e121a66f2a8e083..64c8a153b823d65faebed9c4c=
d87952359b42765 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -1170,7 +1170,10 @@ int of_gpiochip_add(struct gpio_chip *chip)
>         if (chip->of_gpio_n_cells > MAX_PHANDLE_ARGS)
>                 return -EINVAL;
>
> -       ret =3D of_gpiochip_add_pin_range(chip);
> +       if (!chip->of_add_pin_range)
> +               chip->of_add_pin_range =3D of_gpiochip_add_pin_range;
> +
> +       ret =3D chip->of_add_pin_range(chip);
>         if (ret)
>                 return ret;
>
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index 2dd7cb9cc270a68ddedbcdd5d44e0d0f88dfa785..a7b966c78a2f62075fb7804f6=
e96028564dda161 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -528,6 +528,13 @@ struct gpio_chip {
>          */
>         int (*of_xlate)(struct gpio_chip *gc,
>                         const struct of_phandle_args *gpiospec, u32 *flag=
s);
> +
> +       /**
> +        * @of_add_pin_range:
> +        *
> +        * Callback to add pin ranges from pinctrl
> +        */

Please, make the API contract more specific: describe the return value
and check it in the call place if it can return errors.

Also: is this even OF-specific if it doesn't take any OF argument? Why
not just add_pin_range()?

Bart


> +       int (*of_add_pin_range)(struct gpio_chip *chip);
>  #endif /* CONFIG_OF_GPIO */
>  };
>
>
> --
> 2.48.1
>
