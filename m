Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD701154C0D
	for <spacemit@lists.linux.dev>; Mon, 17 Mar 2025 08:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742199517; cv=none; b=qNYu+4vK6RWHOFpvUMWW7rZwhA20CwUkuJT8WiK5AJYoylrFYLKp/0t2IKKT6Tov8QweKwdNaAIyJ9bhx75Ie70PzgRiDqUOfpQfPjoEU2PZQU8T4ftVFqAjDeSTaMwrXNoBMafM1MOG1Loh7K3dGgCO2Sf+a4EJAkocTxebnx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742199517; c=relaxed/simple;
	bh=2dz0+FF7Roh1dPT6mqzZ/u4xIGB7Kh6rMesnh0OScFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cxCQCJXj7TAvgQruSV8tDByIa4jW1bvqx+KadXNgVgp2VSRcRFCox0+d8HyQEKL/f1KTAGJNsR28aFvyFAkJztggj2aiWjshuB8ZLP+ivklQb8hdFTHdWZ+y+4YvxbZdYD6GQTtgFmOyq1Va+OkLb7oBmpVeii7E1pwrYBLklr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-86d3805a551so1824141241.3
        for <spacemit@lists.linux.dev>; Mon, 17 Mar 2025 01:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742199512; x=1742804312;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHo+opHkohWj4HkGFv6lxx1lupJr0F8BlUKSDFasPds=;
        b=G40Qe4wopSZ0RGr6T0bhbOgf1HUPoZ3kKckhhzt2VpSN7igg5oHLz/RQo1nRjeFLSn
         PRSR5jvorhA+ceZYXk2PQ1/ZCHAo4wruFa0tDjIE7y2MJ1kSLYhOrkBU4CVG3yZCA2g0
         7nXou8HVQURsJC4iOiLbR78D150ynolEWju5RildQTvVs43wq1RX3FCDyiWFJQaSOzK/
         pq4ARULrDJgwueqCmIMJikOyQ90h1Ju0lDdcYvDGpdSZNbTvaNifBc2hLTYToINfJu1a
         tjPd7eI8KGNnqVji5J0zshjTnvrleSsASHBgM9LBsKK07fNxrF/jT7PqtBvf2HKNX/PI
         PVzQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0sQP1pDiQAevRE2rNvPDpZtnuV+1Yp4ZOqSuhZC7Nxdb3E9e6vS9GL4pSeuIniyKzLV/SUrrSMA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyj4ReG4piJ16GS2Ikan27XYc21rrmcQBhgYjJDV3QZBAAZqycW
	E8LSbuCycuVoeALXR2bhxwrZKntvofS6qjT1GR5I49UXL9UeAqV9mKJc6HSf
X-Gm-Gg: ASbGnctkWsGNIMifGkHqGQZk9/4kt6E25T10sWzYVZMZhExmSh2pULJQfMnpN9ghi3I
	rLdF1op/QpKmNbBUQnSO1P/1eiSfin9yqPj2TUIaiMOY8tlblHiDCBn6zkfm+7pfqDWeDqvk22D
	zWhom2OsMRFgcgIZPjK+/d1KqWz/4KdLE0+RC06OVjaWg6vxjbHpvKL6zDj/dOuMrJiw6vXAsGG
	3RKioJ57P/rlnO1zAFzadWuyOtssKaJqgYSDKU5nkXbItmVNU3/BwTw89r+kg2+DbX+8YMECNQP
	0zszfGbChlfYoWXxXrQXQzmRd95v1xmfqa8O7ek60dNXxxV7aqq0aKQD8NYvjZjy6lTnajdS17P
	wzFMuN9g86ng=
X-Google-Smtp-Source: AGHT+IETWfsQHioEtfH3WvdGU1E9qROyfajPOdy+Z8257Ltk/kRc2yhhhzfZy1yYeFF9Eh+c3pxG4w==
X-Received: by 2002:a05:6102:b11:b0:4c1:abaa:ad93 with SMTP id ada2fe7eead31-4c38316102fmr6311421137.14.1742199512190;
        Mon, 17 Mar 2025 01:18:32 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86d90e74885sm1538467241.21.2025.03.17.01.18.31
        for <spacemit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 01:18:31 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-523de538206so1588177e0c.2
        for <spacemit@lists.linux.dev>; Mon, 17 Mar 2025 01:18:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUNbW+tU7ll2P4uoSrKMfhiVmIIjmT6pc/P32zKRylqP4QN58YoeNOXcorGTIXsRIaA4QFRrwmCKg==@lists.linux.dev
X-Received: by 2002:a05:6102:148c:b0:4c1:76a4:aee4 with SMTP id
 ada2fe7eead31-4c3831f6b73mr7790718137.19.1742199511494; Mon, 17 Mar 2025
 01:18:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org>
In-Reply-To: <20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Mar 2025 09:18:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV4xWLEuCvCC54GBfCdELE=QSHqaOyUPD-ezE0QLYRnVA@mail.gmail.com>
X-Gm-Features: AQ5f1JrIBpkwjNryxJfQFaslTevdePU3lGPPs76Z4xJvDEvLswRAjXO6120Ar_8
Message-ID: <CAMuHMdV4xWLEuCvCC54GBfCdELE=QSHqaOyUPD-ezE0QLYRnVA@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: spacemit: enable config option
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alex Elder <elder@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>, 
	Alex Elder <elder@riscstar.com>
Content-Type: text/plain; charset="UTF-8"

Hi Yixun,

Thanks for your patch, which is now commit 7ff4faba63571c51
("pinctrl: spacemit: enable config option") in v6.14-rc7.

On Tue, 18 Feb 2025 at 01:32, Yixun Lan <dlan@gentoo.org> wrote:
> Pinctrl is an essential driver for SpacemiT's SoC,
> The uart driver requires it, same as sd card driver,
> so let's enable it by default for this SoC.
>
> The CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled when using
> 'make defconfig' to select kernel configuration options.
> This result in a broken uart driver where fail at probe()
> stage due to no pins found.

Perhaps this is an issue with the uart driver?
I just disabled CONFIG_PINCTRL_RZA2 on RZA2MEVB (which is one of the
few Renesas platforms where the pin control driver is not enabled by
default, for saving memory), and the system booted fine into a Debian
nfsroot.  Probe order of some devices did change, and "Trying to
probe devices needed for running init" was printed.

> Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC")
> Reported-by: Alex Elder <elder@kernel.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Tested-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

> --- a/drivers/pinctrl/spacemit/Kconfig
> +++ b/drivers/pinctrl/spacemit/Kconfig
> @@ -4,9 +4,10 @@
>  #
>
>  config PINCTRL_SPACEMIT_K1
> -       tristate "SpacemiT K1 SoC Pinctrl driver"
> +       bool "SpacemiT K1 SoC Pinctrl driver"
>         depends on ARCH_SPACEMIT || COMPILE_TEST
>         depends on OF
> +       default y

Ouch, fix sent...
"[PATCH] pinctrl: spacemit: PINCTRL_SPACEMIT_K1 should not default to
y unconditionally"
https://lore.kernel.org/6881b8d1ad74ac780af8a974e604b5ef3f5d4aad.1742198691.git.geert+renesas@glider.be

>         select GENERIC_PINCTRL_GROUPS
>         select GENERIC_PINMUX_FUNCTIONS
>         select GENERIC_PINCONF

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
