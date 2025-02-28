Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33B6276D3B
	for <spacemit@lists.linux.dev>; Fri, 28 Feb 2025 09:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740733931; cv=none; b=ATFgqAAxisbZi+yfT/zWSxobdP3lD707dHppH6suo7CT3oH0Bv/7wGPLjeHT4X2hdpxdgzgdFZgaTsVEB1m4XeaY3ThwnGpff6PexBEQa3xKnYcibL7O7BaBH1Jaz2By6tnp9LW6qN2Q3RvZIsHZbl/4ZsNt7Tbjy1JeFHowpjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740733931; c=relaxed/simple;
	bh=Lwg8wE5Xiedb892k4N/ekZfZJuMIFhCBkPXW1WUwn90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MgDT939/gDdjmO+s2+gIWfHMMHnJtpoo+mk/Rb+IQ8a6mLTkZ6nrEw8La0DmwTrX2V0ETPXUh+6UJxnpThmUuQeLjcnQjBw7lnmrm4W/T3GGfafupz3KPRuM/z6/jTqy9+vmworTPlNnGBJRij8xik1CWDH7F7th+1Bo/fmLGJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hw9U+Duh; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hw9U+Duh"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5485646441cso1909746e87.2
        for <spacemit@lists.linux.dev>; Fri, 28 Feb 2025 01:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740733928; x=1741338728; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8NBOP2GQ2KlGT1kMn03prIoC3D0wUg1PxgjvTKjfnk=;
        b=hw9U+Duh13ZJDRhBBYLOlgs1wQhgKgemu9xXj/y0CtgCNZwXmdgMQeuZc3zh7rqGrX
         EJ9W2Hv55tLg92BzMw6IZZ63xaiaC5VyWTVJuY0E05Txceh9zYvgtMOb0l2xEC+pOSy8
         ese25BeLlGt9eNTI5gR9z+wWSnPVp5fPOcs4fBT+0a0rup3UqgPSTrsHa3Ar6yeSbD2P
         HkKuDETyuUbnVeh0B6PMO2sC03RqJ5/Kz9xTTs8Ph4BR2K+m8AA87w+WKM6+Q7/47A2Q
         3VJGiaMNklduQ42mMhIV8rCwsptpNTY4GJKjtcsH1VxMgmRVO43pFMOPfFLmgWixMDU+
         8eWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740733928; x=1741338728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b8NBOP2GQ2KlGT1kMn03prIoC3D0wUg1PxgjvTKjfnk=;
        b=VPyQo5XIcv5gganNfHNxRAR0oEiuCsvqhBuk1viyBoInJoh5qMkmt1Nbvt0bMG5p8i
         PXw8F2W95GjK0NIsQky7pRts/eaXpclXcZjrLbUM4ic06/KgwrQF42fKvNJRuqVk249i
         SFDvbgHXFmtfb+iIYLY+US4ZIv/dZ32xrY2qnZdV5uhh8pHDM+Cqf+XPYWLEnrxskTX1
         DHgaBAYr1tvgi7dWMo3L0VcjRsmrX5n4c8yW00sDxL0Wyr3ijDIPogb2NI6sKUUcfOKt
         rr3wRPPQWwU4RifNa7e6M5l2Vx+eRkBm4KqWgdfRTGIBDz44573FHmB0RvZs+fd4nN3y
         KB+A==
X-Forwarded-Encrypted: i=1; AJvYcCXdok38W7ARRUEN8y6ZbS61KPFh6nZDfdgZoLYUVagxsyTqqh6GGO+mhgd9+J6L+ylnr/3zXbANVg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwS8q5dnUUgSUdO2xNhKD+NTag2Wfme3ulYqa28cVTKeO0G+1Af
	BdXoHZC+c6gbQ8Sg2G38WC/5vhjl2laO2BrGlIgfJgyt1boBmUhhbta3Qml5qLBR0XGT5l4AigM
	4g7zrUdW6avPQuwpuSbqgc7T360tLj6OHwOCfrw==
X-Gm-Gg: ASbGncvjbnxkhqVKi+UHCh0WE6kT1tYUDHzaYQpi76WYY4ELUqn4ygL/Kdb36SuU/DR
	FXlCnPY0Mv2aLRA9BGSck29E/1lRbJpeQNmKTwmvkQDZzSMj2uJsI6Au5u8FIxg5v0IwzXT89Fm
	qskkkADwY=
X-Google-Smtp-Source: AGHT+IFtHDQUwtIkZEmn26SAZGpaLbJ0ZA70JYYMxkjqCpaxYAkU8WvU0gBdbKbqlduqxgwjid1hfQ77kVQK8Hlzc1Q=
X-Received: by 2002:a05:6512:108a:b0:545:2b20:5b21 with SMTP id
 2adb3069b0e04-5494c36869dmr947565e87.50.1740733927813; Fri, 28 Feb 2025
 01:12:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org> <20250227-04-gpio-irq-threecell-v1-2-4ae4d91baadc@gentoo.org>
In-Reply-To: <20250227-04-gpio-irq-threecell-v1-2-4ae4d91baadc@gentoo.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Feb 2025 10:11:56 +0100
X-Gm-Features: AQ5f1JrL-KjS4W2cfXdgdW4fA0i_u-8CysEWcjvk-omutRUMfq6vTHu0adnO6VY
Message-ID: <CACRpkdZ1X5kF-AyRBg9BYMiJscv0v-SGzcdetS0XDK3oPSu9QQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpiolib: support parsing gpio three-cell interrupts scheme
To: Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, Alex Elder <elder@riscstar.com>, 
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yixun,

thanks for working so hard on this!

I'm really happy to see the threecell support integrated into gpiolib.

On Thu, Feb 27, 2025 at 12:25=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:

> gpio irq which using three-cell scheme should always call
> instance_match() function to find the correct irqdomain.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> The select() function will be called with !DOMAIN_BUS_ANY,
> kernel/irq/irqdomain.c:556: if (h->ops->select && bus_token !=3D DOMAIN_B=
US_ANY)
>
> so vendor gpio driver need to explicitly set bus_token, something like:
>
> drivers/gpio/gpio-spacemit-k1.c
>   irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);
>
> I hope this is a feasible way..

Yes this looks fair, I think you can put the description into the
commit message.

>         /* We support standard DT translation */
> -       if (is_of_node(fwspec->fwnode) && fwspec->param_count =3D=3D 2) {
> +       if (is_of_node(fwspec->fwnode) && fwspec->param_count <=3D 3)
>                 return irq_domain_translate_twocell(d, fwspec, hwirq, typ=
e);
> -       }

This looks good.

> +static int gpiochip_irq_select(struct irq_domain *d, struct irq_fwspec *=
fwspec,
> +                       enum irq_domain_bus_token bus_token)
> +{
> +       struct fwnode_handle *fwnode =3D fwspec->fwnode;
> +       struct gpio_chip *gc =3D d->host_data;
> +       unsigned int index =3D fwspec->param[0];
> +
> +       if ((gc->of_gpio_n_cells =3D=3D 3) && gc->of_node_instance_match)
> +               return gc->of_node_instance_match(gc, index);

We need to hide the OF-specific things into gpiolib-of.c|h so systems
not using OF does not need to see it.

Something like:

if (fwspec->param_count =3D=3D 3) {
     if (is_of_node(fwnode))
         return of_gpiochip_instance_match(gc, index);
    /* Add other threeparam handlers here */
}

Then add of_gpiochip_instance_match() into gpiolib-of.h as a
static inline (no need to an entire extern function...)

static inline bool of_gpiochip_instance_match(struct gpio_chip *gc, int ind=
ex)
{
    if ((gc->of_gpio_n_cells =3D=3D 3) && gc->of_node_instance_match)
              return gc->of_node_instance_match(gc, index);
}

And also an empty stub for !CONFIG_OF_GPIO so we get this compiled
out if OF is not configured in.

Yours,
Linus Walleij
