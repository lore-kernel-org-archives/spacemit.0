Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DD423F27B
	for <spacemit@lists.linux.dev>; Mon, 17 Mar 2025 14:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742221143; cv=none; b=U6b7vLYhkSQh1mxe3GyuGU5wVINx7rLqV9wpgx25cFTfOqEuIz9SZooKd7Vhx19S9swYBIHl+i8WGlEeoPaVyFJoIf5RiwQqPLGJOgV7v2WaGWYjYD6XFcqOrsgeYSeK30wPf6wnghteVqTlQ+Xqc/qWRPV99XUSnYgXoZ9Tejw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742221143; c=relaxed/simple;
	bh=8PM6QbVEn4s657b1vZBMBsMKFGc8AAH22xuLnz8sw7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aqobiFhHIxlsf2wk2l5msDgz+7t46U1IgfdtgV2kjvnWHUcbTZ7vnE6fVnp8B7G4BFxvK8iDaHB3k26RFlefMRZDFwk53dBfHnSmw0mX1G6MSdZNdT/qTFCw+Gv9wc092R0vVS70u0SRW1B0qDFWkorAs67MOkoXv8iyGvElhuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-476b89782c3so51321931cf.1
        for <spacemit@lists.linux.dev>; Mon, 17 Mar 2025 07:19:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742221138; x=1742825938;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FQzfQJUTkwGhun6W4CYWdgvhWW8H+wpChsA4H5Uf+0w=;
        b=B1U5yYeEbzj5fjwZfoEbgaTJ533JmDaa8tYh+F0knSyNOc7wYVJyHfQWnE9G546bjG
         CJFPOMy6kb8+spDdWaTp38FVcVkyLWRXqaJxqy4rjHuQZ6flCzUuJfD5PnKUI8a2nPHy
         ET5glJxgdZ36GvHrOVgwRGiDOtnl6Ttwx+9rmET9IsHYeQIF0zl8OPROFOcVBpZ117zn
         80XngSiHEv+0pT79shezrLGr5JM//MR114+bPk5JYIQV10WgnAqXaxkUT+90c7zik3Pi
         l/hN+eODzqWZn+60KBC8dTn/gowYuj9FvNDnex8dmjUb+yexOaEVORFRYzNKUextd+2o
         Ie0A==
X-Forwarded-Encrypted: i=1; AJvYcCUu/3R1+DwJhfRnp5DAMg09PPFZHm3UcUDkAWanCK+HjqNBg8uweWatnyoinuBY+lzwMKEoCaekvw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHDmor8oNKxm/Sgyo9A9qUn0gxNV//zyVqQlO/91XzgAii79po
	N8XdLgV3UgwMRQcwsdjyxX/lZabPNVoz/vaah6RiTjk+bNz9znW6zQzXoIrQ
X-Gm-Gg: ASbGncuPgtiG9htVXghPkvDUsqT6qHCqvvwsw/16hNKmSgKykqDbWEV6w5csChFaKiX
	kUnr1dn2bOJQqRWRNxVyzOYof7+ccaY/zTZNwK1qN+yOuF4qdowtQRnjMssfysUSWDT1gBXuJea
	cLBEvLVDC5EZQUmNT3/GsxZG3Yb22Hm0WQjF3iv8v/g7bc8qwewh8jMY/ewBEZUa/X77G9uhEKD
	wKTvdCJ0UBOVxcLaqfI+hwCfzb1KpZWlx5w6llGGtNIdwODadRVQEcqjjbaPV75v54DDyfpIapC
	Gpq4xwj/4M2bVvCVihorRVH3OyzeiCRKBc2yHZ3aJrgtpMU8RsVgtQZHXOlb+wsSwNYMMTXa4GW
	Pah3WgnA=
X-Google-Smtp-Source: AGHT+IHd5+7l+wMOyGoJRUUtPOw3SkAZErlHQ4k/5KwTyaG2DJqJzq6u5Poz+Hk96Qfqf4mKZk5/Kw==
X-Received: by 2002:ac8:5891:0:b0:472:1225:bd98 with SMTP id d75a77b69052e-476c81e04a5mr231448841cf.50.1742221138586;
        Mon, 17 Mar 2025 07:18:58 -0700 (PDT)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com. [209.85.219.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-476bb7f2db6sm54406531cf.57.2025.03.17.07.18.57
        for <spacemit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 07:18:58 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6e17d3e92d9so31383256d6.1
        for <spacemit@lists.linux.dev>; Mon, 17 Mar 2025 07:18:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVGxCDqEoRtFUKHx8yZx32YXaH5zfTjfM89vSylpvLGACZZ4TUGHF/xIm2LxjUkQSv6keP6e0HNwQ==@lists.linux.dev
X-Received: by 2002:a0c:eb82:0:b0:6e8:feae:929c with SMTP id
 6a1803df08f44-6eaeaa63b4bmr161375046d6.21.1742221137414; Mon, 17 Mar 2025
 07:18:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org>
 <CAMuHMdV4xWLEuCvCC54GBfCdELE=QSHqaOyUPD-ezE0QLYRnVA@mail.gmail.com>
 <20250317124120-GYA1983@gentoo> <CAMuHMdWM5ymPVRe36+Atr0cDAdRGyw39jFJvE+9PWTUUiiMfCg@mail.gmail.com>
 <20250317132955-GYC1983@gentoo>
In-Reply-To: <20250317132955-GYC1983@gentoo>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Mar 2025 15:18:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUWUd-xAzhRvazurD-1t3pFb2OUMXqEpeDyTVVbAUG19g@mail.gmail.com>
X-Gm-Features: AQ5f1JrurBlRutNcrH6Q6idcmvXYK5KPYEnvrshCL60keuYt9BH4Ng3SnCR2u0Y
Message-ID: <CAMuHMdUWUd-xAzhRvazurD-1t3pFb2OUMXqEpeDyTVVbAUG19g@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: spacemit: enable config option
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alex Elder <elder@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>, 
	Alex Elder <elder@riscstar.com>
Content-Type: text/plain; charset="UTF-8"

Hi Yixun,

On Mon, 17 Mar 2025 at 14:30, Yixun Lan <dlan@gentoo.org> wrote:
> On 13:59 Mon 17 Mar     , Geert Uytterhoeven wrote:
> > On Mon, 17 Mar 2025 at 13:41, Yixun Lan <dlan@gentoo.org> wrote:
> > > On 09:18 Mon 17 Mar     , Geert Uytterhoeven wrote:
> > > > Thanks for your patch, which is now commit 7ff4faba63571c51
> > > > ("pinctrl: spacemit: enable config option") in v6.14-rc7.
> > > >
> > > > On Tue, 18 Feb 2025 at 01:32, Yixun Lan <dlan@gentoo.org> wrote:
> > > > > Pinctrl is an essential driver for SpacemiT's SoC,
> > > > > The uart driver requires it, same as sd card driver,
> > > > > so let's enable it by default for this SoC.
> > > > >
> > > > > The CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled when using
> > > > > 'make defconfig' to select kernel configuration options.
> > > > > This result in a broken uart driver where fail at probe()
> > > > > stage due to no pins found.
> > > >
> > > > Perhaps this is an issue with the uart driver?
> > > > I just disabled CONFIG_PINCTRL_RZA2 on RZA2MEVB (which is one of the
> > > > few Renesas platforms where the pin control driver is not enabled by
> > > > default, for saving memory), and the system booted fine into a Debian
> > > > nfsroot.  Probe order of some devices did change, and "Trying to
> > > > probe devices needed for running init" was printed.
> > > >
> > > my problem was CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled, result as
> > > # CONFIG_PINCTRL_SPACEMIT_K1 is not set
> > >
> > > for your case, is CONFIG_PINCTRL_RZA2 built as module?
> > > it should work for uart driver with deferred probe mechanism..
> >
> > No, CONFIG_PINCTRL_RZA2 was disabled in my testing.
> >
> emm, this is interesting, there might be problem that uart driver
> fail to have correct pin settings without pre initialization..
>
> which uart driver is used in RZA2MEVB platform? any pinctrl dts property?
> different hardware may vary..

It indeed depends on both hardware and firmware.
RZA2MEVB uses the sh-sci driver, and its serial console is set up
by the boot loader.

Does your serial console work with "earlycon"?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
