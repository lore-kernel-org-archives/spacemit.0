Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EF1238D5F
	for <spacemit@lists.linux.dev>; Mon, 17 Mar 2025 12:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742216400; cv=none; b=qa1okvQ1zvk5bWby0db4KCuXviFzYsKwsNiklBdvypPBKlbTsWmHE0eMvxGlwr0UZ6m+uXZnKA5KSy9BPhgARjNZKgIHjNr1uqXHQk7H6kNFpmUsRP3VFc7H8ERXzM8crYI02aXkKk6aN0bT9zVfKRcotx/6Z9BlsGDVJtRspfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742216400; c=relaxed/simple;
	bh=bF8EJP+3Aa5zflm5yFQ29JdF6zwXdZTFL+V6DpaCRmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GuolRaTFERRyyQuTrPenG8feT95qTk2KFPLxS1fWhm+nLrFRJ61bEDW86KGgWlyZD0GN/MEXTEVPxChgIuC9nIcEH8n6wnOlIIY2Cw2+JGJozNPr8jbUc2mo0Fx6NONBASgafUUeECTJwGYkCzbB+sAfEaScPxGUYG3Erhs2j80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-523fa0df55dso4937841e0c.1
        for <spacemit@lists.linux.dev>; Mon, 17 Mar 2025 05:59:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742216396; x=1742821196;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKVz0H8Y7Bgxhan9DFR3lBg40nko18FBpH/VH8EUG10=;
        b=vwRFKd+NB70VY0CiO3U0krSrCwoyG/L255JbloDhOECdVz80eux9n0SmaLgJTG09Uc
         JW83eFWLpHmIA4mRwGpKAt7VMs/qCmA65B1xNRyqGOcyy913WuT7NRqX/j/EXTJEPu0p
         XL69YnZazQUjf0jIIwjC7C+vGL0GnqYsgm24JZeNnD6ksYSeQHH976pNxge6sZJNtVWI
         uNSHsCawLkfcUFmQhC5X63RuumrAQiYuWPheUv6nULwP0ufWoh5SIGl1J9+Cyzu/WgNW
         GjzeN+wo6U12g0UaWJ3VRKLP7V9DzKRntagFKRBdbWhcQrlBfo0CoI3nA/9RoRAKIJqZ
         yWVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV53yD/fDvEYSQNv+NqQtMdfhw77BM8iGjogJBYyCspL0vbHiJJs4lIjkiiJQXkwEp1zMJhRD8Tog==@lists.linux.dev
X-Gm-Message-State: AOJu0YxoWDD9O/QwxCMJyJb+sscGOBXkcYWYz0kHVo1bX9bmP+Gfxl/T
	0MlieSQ/ATnQjzOaJrx5daWNnPXvkBWKTUkepkdWlHQF0NKz0+v6u8BOErtN
X-Gm-Gg: ASbGncv7A/MExTptkSdUx5glnz9+3WYWOHgQmkUfLu807BnQ7FsTgbl3nIqYSvKBh3k
	oaDVOUrRvpvUsMDvLvRN/gZll2TuXi/okQAf15dg1Ssb1wqeMZsA7B6vCQTMAz/lq6H25ZxYMsL
	DL4uoq0cUqL8mzXUArrc2CapvzbyleSLWSyTBEMQachGGvFAkbMm6cFsdDyHPlAhQNyqEWn5mcS
	+zBerD6XIHQL3Vt+BNC9fJPGxtY94gSERuOWRdsNe6uhmAy+x7BWeT3FFqZQGWy1sEsMcbK3b9X
	ZvrLE+JK+z7L75WRUtkqF3fgrHtA9AxohZTjjNkiFZ2WqiClTSuiB/4oDcPs2SbaJzxmFXMVsJZ
	luQ8VFCM=
X-Google-Smtp-Source: AGHT+IEYlFhxjuMXO3pibGhiw6yxjpWzSEUgF65SiRhGHNlnugWxEiye2nv98r9Scsx1SGXGA3MVtQ==
X-Received: by 2002:a05:6102:2ac8:b0:4c3:b75:16e6 with SMTP id ada2fe7eead31-4c371ce3663mr13528607137.10.1742216395776;
        Mon, 17 Mar 2025 05:59:55 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86d90e8c0ecsm1680345241.30.2025.03.17.05.59.55
        for <spacemit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 05:59:55 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-86d587dbc15so3865871241.1
        for <spacemit@lists.linux.dev>; Mon, 17 Mar 2025 05:59:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXtENBz9+cHNGEc6RibR51v3c9O8CA50G3Wg8keSgLQQNaflciRqZRc43Y/QihlOEeJA9C1efIK4Q==@lists.linux.dev
X-Received: by 2002:a67:f057:0:b0:4c3:9af:9134 with SMTP id
 ada2fe7eead31-4c371bc669bmr9558320137.4.1742216395284; Mon, 17 Mar 2025
 05:59:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org>
 <CAMuHMdV4xWLEuCvCC54GBfCdELE=QSHqaOyUPD-ezE0QLYRnVA@mail.gmail.com> <20250317124120-GYA1983@gentoo>
In-Reply-To: <20250317124120-GYA1983@gentoo>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Mar 2025 13:59:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWM5ymPVRe36+Atr0cDAdRGyw39jFJvE+9PWTUUiiMfCg@mail.gmail.com>
X-Gm-Features: AQ5f1JroT5lBrXCjHhRfNdJVSpXUexSZ0r_yj1ykAz2lnhY9dJFD1lX9QxdNGDY
Message-ID: <CAMuHMdWM5ymPVRe36+Atr0cDAdRGyw39jFJvE+9PWTUUiiMfCg@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: spacemit: enable config option
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alex Elder <elder@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>, 
	Alex Elder <elder@riscstar.com>
Content-Type: text/plain; charset="UTF-8"

Hi Yixun,

On Mon, 17 Mar 2025 at 13:41, Yixun Lan <dlan@gentoo.org> wrote:
> On 09:18 Mon 17 Mar     , Geert Uytterhoeven wrote:
> > Thanks for your patch, which is now commit 7ff4faba63571c51
> > ("pinctrl: spacemit: enable config option") in v6.14-rc7.
> >
> > On Tue, 18 Feb 2025 at 01:32, Yixun Lan <dlan@gentoo.org> wrote:
> > > Pinctrl is an essential driver for SpacemiT's SoC,
> > > The uart driver requires it, same as sd card driver,
> > > so let's enable it by default for this SoC.
> > >
> > > The CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled when using
> > > 'make defconfig' to select kernel configuration options.
> > > This result in a broken uart driver where fail at probe()
> > > stage due to no pins found.
> >
> > Perhaps this is an issue with the uart driver?
> > I just disabled CONFIG_PINCTRL_RZA2 on RZA2MEVB (which is one of the
> > few Renesas platforms where the pin control driver is not enabled by
> > default, for saving memory), and the system booted fine into a Debian
> > nfsroot.  Probe order of some devices did change, and "Trying to
> > probe devices needed for running init" was printed.
> >
> my problem was CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled, result as
> # CONFIG_PINCTRL_SPACEMIT_K1 is not set
>
> for your case, is CONFIG_PINCTRL_RZA2 built as module?
> it should work for uart driver with deferred probe mechanism..

No, CONFIG_PINCTRL_RZA2 was disabled in my testing.

> > > --- a/drivers/pinctrl/spacemit/Kconfig
> > > +++ b/drivers/pinctrl/spacemit/Kconfig
> > > @@ -4,9 +4,10 @@
> > >  #
> > >
> > >  config PINCTRL_SPACEMIT_K1
> > > -       tristate "SpacemiT K1 SoC Pinctrl driver"
> > > +       bool "SpacemiT K1 SoC Pinctrl driver"
> > >         depends on ARCH_SPACEMIT || COMPILE_TEST
> > >         depends on OF
> > > +       default y
> >
> > Ouch, fix sent...
> > "[PATCH] pinctrl: spacemit: PINCTRL_SPACEMIT_K1 should not default to
> > y unconditionally"
> > https://lore.kernel.org/6881b8d1ad74ac780af8a974e604b5ef3f5d4aad.1742198691.git.geert+renesas@glider.be
> >
> I got suggestion in v1
> https://lore.kernel.org/all/20250211-nature-kilt-9882e53e5a3f@spud/

Yeah, I read that, but only after I noticed the issue in v6.14-rc7.

> so for COMPILE_TEST case, ARCH_SPACEMIT config won't be enabled? then neither PINCTRL_SPACEMIT_K1
> anyway, I'm fine with either way, thanks
>
> > >         select GENERIC_PINCTRL_GROUPS
> > >         select GENERIC_PINMUX_FUNCTIONS
> > >         select GENERIC_PINCONF

It depends. ARCH_SPACEMIT can be enabled only when building for
RISC-V, while COMPILE_TEST can be enabled everywhere.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
