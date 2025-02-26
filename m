Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7730D238165
	for <spacemit@lists.linux.dev>; Wed, 26 Feb 2025 10:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740565483; cv=none; b=IKApHcEvlU/feZ0IgKwoS4OQSgGlFoT5UNWtU2p42R4PStV76yr0aZAXQw2SSm2HwFl8+suhIUuFfPoYJ5oqMgYwYIFdNw0L726SnZVLf1KUE/fo5eWicMRkwEy1k++fXK54wGcBMrgHAmqI3wbC3CcvtfXAm7ZRmEfrXZa6QuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740565483; c=relaxed/simple;
	bh=f8hhLyZlJLg3VVOM9RdCgNWjzvtlFruSMQ7KM6g2fZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IOvOATWo6zGP/ulaRT7lCVdDOc3q6XNDa7yVTMDqRS6DJf0cGl0b0cdEeXBc3QDI1nWV2dc/tdiHeVd7XnfBUAfWHsFbyrB3vA+9yMY0hxuXrPCvFWOPzbGiiGc2k9o6x+rmSDd9D+EXimExJ9LW4tHAEAvXs+43zKBs5XpSI7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x1qHEHIh; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x1qHEHIh"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5452efeb87aso6637976e87.3
        for <spacemit@lists.linux.dev>; Wed, 26 Feb 2025 02:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740565479; x=1741170279; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVtrqvkPNmYmY0oGPxOkrh36jDkhWLE+ptRBX0xtIwg=;
        b=x1qHEHIhoJY2Xi11+J6qQIugX7vH6XtWk/ZslWWOUhgUraA0U3pXsl79pGdhO5+4OW
         cClQGPQhYmA6XOyVRC5z/g1aKosTH83cEuj5PtYtzC5jyZ35dYOE6yJBLE2hXJS8uzZl
         OQ1cY3Y1qhWDn/8noH9ROdkEnNjaeT5dGg3wwATIbFVc6AveFyK0hvEfNYrGrWc+nbW6
         5hvgWVfD4/UmaACYN9uRE1KIujZjjTDDqXPA9ZTib1ltDtoMIV5zcdxV71KWuY/nIiqJ
         nNUrSZHawYAbpjZk+m/kmgXGZ1JqwGx0vFjs+WGcytl8Q6gphjL3+0y8pmCBwvBi+NXD
         pYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740565479; x=1741170279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LVtrqvkPNmYmY0oGPxOkrh36jDkhWLE+ptRBX0xtIwg=;
        b=R2XI/xuizdc1BCwGnUnbumYWRV4eRzJR3qQlLvxKEsQC1sr7DXj/pGk+0ULY8HoUpO
         vRrmUWGc2CTIHkzVISWcK32Gm8L2lgJpOWOExWQPrNjInluy+kv7n/hFa/p1dX1hA6kn
         bHvp2PlXAQNzg7ymAAvAFLexYjH38WnW5OhaUWpMrIUwuSbyvJ707TcCi0BW4Yl+5srJ
         IT9odFLOZE6h/MabDFxLaI0kWe/IeRdGcFjH6BH522DpCWexzUbtrRESZ6xLxiwlD7p9
         zSWunGbEN98ndwTrQdGVwOjO/xhj2WjUIWm7yDehtp/8AAdl7KmgMNpW/IE0JUakBMvI
         o9Hw==
X-Forwarded-Encrypted: i=1; AJvYcCXvG6cem0o1BJ2UyyRQyqgTyYYD2IKqKH700Mva3RAwet6RlndMmm2Q7CdbrAHa+7Pj2Fv3fbVcsA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzURBXLfFVfVeh3o9/ahagQPf9OvXvKOCnKcdn3SYXInc2L1eMR
	RAl9lWS8Jp6OF6xVuh37GOJO2D+gc1dgtG0gfXBYEOeNaN5nehahABpf66LBNI0nDh0AIBr/Cyn
	5lJQmGpdQHJomZZthYQdHzoHdBAqGj2RSABpSGw==
X-Gm-Gg: ASbGncuxFk0Is/acjKyiNxdzVtCJHroqJXIWtwaSyFSQikH6YKCdBHieUbA6NpLyop7
	nCldw04yWoQv2hZhp5WWMO4z+CDeia4+rJtjhVGa2n82djpoIAPCqbcEJWg+MFXLt7UuXbLXYad
	pFdAmp5So=
X-Google-Smtp-Source: AGHT+IG7rCTedQa3N//tlOn/Z+rwnS1xGhASGu57SObkcmSjqd8E+pQMLoYev9jUwKtQyOyzKJ6ryDKvddvmmgwJH44=
X-Received: by 2002:a05:6512:2211:b0:545:aa5:d451 with SMTP id
 2adb3069b0e04-5493c5837d3mr1960628e87.25.1740565478561; Wed, 26 Feb 2025
 02:24:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250226-03-k1-gpio-v7-0-be489c4a609b@gentoo.org> <20250226010108-GYA44567@gentoo>
In-Reply-To: <20250226010108-GYA44567@gentoo>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Feb 2025 11:24:27 +0100
X-Gm-Features: AQ5f1JpPbkJVEZf5u-mwEpqGT95jx-dhaIMZLx12Jfkquh3vL3NT-QkCOF6Pjgo
Message-ID: <CACRpkdY7nzzu3-+FwpSYqmX+O559LoXHiqcvP2OxkhX+9f-3wg@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] riscv: spacemit: add gpio support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alex Elder <elder@riscstar.com>, Yangyu Chen <cyy@cyyself.name>, 
	Jisheng Zhang <jszhang@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 2:01=E2=80=AFAM Yixun Lan <dlan@gentoo.org> wrote:

> Current this v7 version work great with request irq from gpio, like:
>         pin =3D devm_gpiod_get_optional(dev, "myirq", GPIOD_IN);
>         irq =3D gpiod_to_irq(pin);
>         devm_request_threaded_irq(dev, irq, ..)
>
> but have problem if request irq via of_irq_get(), something like this:
> DT part
>         mytst {
>                 ..
>                 interrupt-parent =3D <&gpio>;
>                 interrupts =3D <1 28 IRQ_TYPE_EDGE_RISING>;
>                 interrupt-names =3D "wakeup";
>         }
>
> In source code
>         irq =3D of_irq_get_byname(dev->of_node, "wakeup");
>
> I've made an attempt to patch gpiolib to support three cells "interrupts"
> syntax, but still fail, it always get last gpio irqchip of four, thus usi=
ng
> the wrong pin (e.g: will always get 3 from gpiochips 0, 1, 2, 3)

Right, we need a proper patch to fix this.

Can you paste your patch so I can see if I can spot/fix
the problem?

I think the irq cell parser needs to call out to
of_node_instance_match() - or similar - as well.

Yours,
Linus Walleij
