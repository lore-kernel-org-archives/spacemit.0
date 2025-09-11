Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848562741C9
	for <spacemit@lists.linux.dev>; Thu, 11 Sep 2025 07:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757576309; cv=none; b=LmqaxF72zKkQJbl9AO9M/ZHWt4v28x8M+ixnUk1N/9m1y0uoFssg5AtmXFoi+PQVA119cjr+dklPElZpFn9NWTf1x8FmL/keHd6WvuJvxmH+IsN7C77WhERBZvQL6Y4MstxAXDCa4qbTv4k4QvOcOZz5Cjnm3rPwYURzc51d/Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757576309; c=relaxed/simple;
	bh=jUK8rXo2J6tdIuNkdbMKBrXU6Rird8FTI89p+KzSTdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r3Kf/5Cf84bnJ/+A8XSWx5K8I8QEzY4PbVSW7cLLzRZuE8bAROz0TAT5eWjZI1XzaRsJlaO+g43oT1Ag1cwdRuCQdue4q2Lecti8G5FjrKuW4ZU2qSOebJiYaZuytNgDkKos639kze3a1a0mBpAaPR9p6DPLEk2i+jFLx5p2rlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HF24wbfx; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HF24wbfx"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-560880bb751so381862e87.3
        for <spacemit@lists.linux.dev>; Thu, 11 Sep 2025 00:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757576305; x=1758181105; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUK8rXo2J6tdIuNkdbMKBrXU6Rird8FTI89p+KzSTdU=;
        b=HF24wbfxEq8N6j0r73O+mDt+pyIBzqtRBKzjALf3H8HMz+c0zPjBt4mVHMz8JPi8MK
         NJnKPLXAch1WudAfEZCfgrPra2KzWXzJhYyMDvtiq4+US7jH56xQKgXV11XRTmTzbeHF
         LSTp2T7R6jSa4WgkKJBst88hh8QhjIPlIbwwMeVYL1Uzu8gJDNm3+Z8U0ew6dCQuIKFW
         X0Y1uojtQQVxCCV6AkeSii58UIOYViJJbL8WNJUsvgGZcF6RwVFNLIWUbFWXfvS2DJPZ
         JQ5+pA/XcMqq4hSJtE7+6us9hMMZe/fT3YohtFGcP5h1/FdyWrF/kHi6aGojHBkgUMmo
         5e4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757576305; x=1758181105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUK8rXo2J6tdIuNkdbMKBrXU6Rird8FTI89p+KzSTdU=;
        b=ezzyhvegu4Yj90nzgGZC3rRhRrOkGXLLsoTXkU78O+AK3AUMmAtpcFqPI0LVJ52PQw
         tv51QLfS1pVzTnCTnipgxMN4IaQ0Wks1RxCWthj3M83+IhEaPdNV6t6QJ32sJkb9fPkP
         7uafqP/8uziD/6N7gue+jBs61YZ6q3k+9OBDx0DFnpqFCJbSydXg9yhCNDCdVpmloMdc
         idxM9sCV2r359c5NjXe/csJfrJGPwuVWkLrPWv2acJ+wMUqWep7WBZ5GgDK5zpRncX/J
         QuRgxmBpDew+IV6tU1oAneSNLF3SAWiu25fHMvA3Iyh0d0Rxg78gqFW7AP00S82YCEl+
         wRmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjlpGKuBhZgFkV1PQtyvRNokzUdXW3X1n/jJIU1+dq6BsIrXCjArfIyFAlymokd0/Yq3xV8hqVbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9f7dPHzQpjw6DhKiFSyZLZDVDYPzoHxG4NUEPAhRO3a/K7kQ/
	bk8o8h5wCwPeButlIwYLPKNm/IMImpd4i7K/gsJkJLm0zJDMPvqgb4uAVOQ2qTS+ayNxGjMEzWW
	wtUayVKP5uWZAvDmwiKcpVwruc0WTLbWXgdSQqDSQng==
X-Gm-Gg: ASbGncttcyzBxBRyRwrOeAVrOkEn+L2nklv6XL0kzdpYo/6bSbv0b9pSSHihL7sVZK8
	LKREMPMEITEORUuy3n/SSZJi+1VkIz5X+nVe7S5Hzf3GXgu5HN9t6ASDvaAVP4xE+yPuuXvwJj8
	U3xvspNXhdu7fpfF8WPCbDmrU6Fhg7UXITMpuYCBhsnKw9UNLMdYadaFJIM/l9dfixZLUhI+Mgg
	qP4TjOvJPdKbQTe2me9QSOYLrHJP3McvkhPtXo=
X-Google-Smtp-Source: AGHT+IGFKCUUrJkt+A6v+xuc1LQXhwUm4KpMBhnA0hSfXgMQG+z+UHy3svEwymKETUJXd9ilc9E5haoHU8vK2eJzapg=
X-Received: by 2002:a05:6512:b17:b0:55f:498f:f08e with SMTP id
 2adb3069b0e04-562614ff71emr7447870e87.24.1757576305171; Thu, 11 Sep 2025
 00:38:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org> <CACRpkdb=J+hiC5cu+g0Z-gqzpG8PgX01CXc4P98FfSSAf7PZEA@mail.gmail.com>
In-Reply-To: <CACRpkdb=J+hiC5cu+g0Z-gqzpG8PgX01CXc4P98FfSSAf7PZEA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 11 Sep 2025 09:38:12 +0200
X-Gm-Features: Ac12FXwiBbcmTD8LlFccmOHZdwwoOfYFi61pHLgjut8Pxa8sFHcycGYwle9xiUk
Message-ID: <CAMRc=McbadZx1yK1jGeyUnXAFZgfA8YpLwacmqC0eMonS-c-9A@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] gpio: replace legacy bgpio_init() with its
 modernized alternative - part 4
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
	Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
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

On Wed, Sep 10, 2025 at 11:32=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> On Wed, Sep 10, 2025 at 9:12=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > Here's the final part of the generic GPIO chip conversions. Once all th=
e
> > existing users are switched to the new API, the final patch in the
> > series removes bgpio_init(), moves the gpio-mmio fields out of struct
> > gpio_chip and into struct gpio_generic_chip and adjusts gpio-mmio.c to
> > the new situation.
> >
> > Down the line we could probably improve gpio-mmio.c by using lock guard=
s
> > and replacing the - now obsolete - "bgpio" prefix with "gpio_generic" o=
r
> > something similar but this series is already big as is so I'm leaving
> > that for the future.
> >
> > Tested in qemu on vexpress-a9.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The patch set is a beauty, hands down.
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> I especially like where you caught local spinlocks being
> (ab)used instead of the generic irqchip ones.
>
> I don't know about merging patch 15/15 into just the GPIO
> tree, that can make things fail in other subsystems depending
> on merge order into Torvalds tree or linux-next if your tree is
> merged first.
>
> I would merge the first 14 and keep the last for the later part
> of the merge window when all other trees with conversions
> are merged.
>
> (You probably already thought of this.)
>
> Yours,
> Linus Walleij

I already have both pinctrl and mfd changes in my tree from Lee's and
your immutable branches. I pushed this into gpio/devel and it built
just fine.

Bart
