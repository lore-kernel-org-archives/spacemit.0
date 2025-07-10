Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018D923183F
	for <spacemit@lists.linux.dev>; Thu, 10 Jul 2025 06:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752129232; cv=none; b=s1cAvx8YKSOmFqufSfOGsjinqP649Xd4YH+2qyUcvBIwe/Rzpzaw5yKGQfEdbbRR5lH+BThCOzeSqnQNeHvq2MolsciTP35NIV0KWwgNGzXGMzMPZW3eU4XhGfx2kw2hymkfJu7Splr1ndjaB7gBG9VwJ/GnswhicghJk3rKbaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752129232; c=relaxed/simple;
	bh=fj6W66sPr7Ji9329jAkLIL1CrVKPhluEPji8nUmmCag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pEQsRQ9wQAOg0lBnSy0VZmx2kSrg0bJSH3m8fY3rfcRny06ZTXwAiVieXeBD0C7e/f9I+3UhNzUCpOLkQv126F4kd1zUoADp55Dhotgg65pEL7a4s5YW0If7ifHpYnJxKa0JYPMzZ8WgVJ68n1/bhHNMVNlxwNKgyWN73K+W1kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Lpga7QuD; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Lpga7QuD"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e7dc89108bfso494987276.3
        for <spacemit@lists.linux.dev>; Wed, 09 Jul 2025 23:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752129230; x=1752734030; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOfKyTSrKEeE5mRVGbOkpddwy61Hvu8Xrql9GC0LhTY=;
        b=Lpga7QuD9JbQPJOylDmXi4/CazjMNZRdpu6Gf5gDtdbXnsY8EdmF/W1igBj2eDlJl4
         zmAuTIaG0ReuICDAf8jmG00gu5wL0NYsRU30L/s2Wbr1vmUYZtLrM+Jht7yV9I8YdUvJ
         YhOfQAhCfW82K/ZyQWpz39CHtudWNNlRaPm3/iKukfxNznB90IcKbUxw8VTvxojbhIry
         VRqEywIf2YZ9HYJiAIpFUif9YjifVU0JezkEnEvglzv+sh4ORfbg72AMkaWX3Xtz2l3H
         kMLCOiAPtc9dx6oNT4bY46TtOgmFIBGBW03CQTGJWbPVwgEW+MmyWU0Qsbr4Rc4+0mfT
         R2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752129230; x=1752734030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOfKyTSrKEeE5mRVGbOkpddwy61Hvu8Xrql9GC0LhTY=;
        b=lvbcxmjgfDMRO6JJPCoWR824SF1EN6oyLLh44rt3XqaODppmrl/bYPq3Pmn1YoD1mE
         RAxHnYRv6HvqnkoHoEc6pbOlAEGuVhaKqvwC6HhQaPc5gPEcmSnx6LuxB3omn7ECsrVS
         /Gh/aBg8B3Hcgs3hEb2CARTuwQEHFdtPw+xsqL6nygVfSD+cl40lP49pDuEUftZL4bUB
         Sv+BP1yP/N5h/dFN1pJ6yuOxv3I/7JVttIdwokfPz3fTH+HcLsd3GEHjhVr+61aGee6g
         0tTipneQ1jb5s9X8wEoPHWEeneCdRyZndyUN01/7ZgagGvCrTHMnDbG3uIyrrAHFiuTq
         VbfA==
X-Forwarded-Encrypted: i=1; AJvYcCVj87phQNg8uSTcXJVGvLlYEwafltwByP6aEYktZwu7vlusnxU3skxPJ3Y5U5eHJvBoXTnsNRgyFA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJEO8VKe2nZT2nSMzrd8rlwOkuvR12Wn6lgnp/21b46fTVLb66
	rotch3dJdlk+jkJR6j7iuCBdoHnG2aHPYJP1OUZuZ7N3tRaboAa2pT3hj1dZy67cISsXnwg3jnE
	iUo0PyTRTPkrGxdCh+Q2jhuv24O+Ody0Wdqmn4Cz9NQ==
X-Gm-Gg: ASbGncvVQOcjUEo4Q2epabTeGNws92Ik8tQ+vXibdubLJ1OHhk4wBm9qnzU/dChqr3o
	EBk4RCJS+TMKn6MeiMjTlZnB7Gyn8478iJNgStzts/sMoZbmmZ27fSUSLR4K+TWEsUx4Dr1VBBb
	5Vl6hD6AxFAtC38poVq2nL/swNhn9dOh8dYVczbuAf4B2LOtEGfBcLsWYxDT+Z4PA2
X-Google-Smtp-Source: AGHT+IEUEuXYe+AiRoP9sKK+Q2LJ7hkbYYZRPRjU65Kj1Wu6nsLtbs1bxTc1Gn9tJMDj6XgH3uwUSmTRPbmjpClz12M=
X-Received: by 2002:a05:690c:7405:b0:708:16b0:59c3 with SMTP id
 00721157ae682-717b1a8aa20mr78370367b3.33.1752129229913; Wed, 09 Jul 2025
 23:33:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250429085048.1310409-1-guodong@riscstar.com>
 <175198458423.86859.5882458274157023095.b4-ty@gentoo.org> <20250709063738-GYA488894@gentoo>
In-Reply-To: <20250709063738-GYA488894@gentoo>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 10 Jul 2025 14:33:37 +0800
X-Gm-Features: Ac12FXzWKaYp6y1oSJwNCeBf8VLK9_pLF6KbvY2LESuIM6jHvBvBU0Xdd6tceRA
Message-ID: <CAH1PCMaZYaRgUoaMfDLyqwTv3n3NUaUL8tHr8SoTq=4ayuvyhA@mail.gmail.com>
Subject: Re: (subset) [PATCH v3 0/6] pwm: Update PWM_PXA driver for SpacemiT K1
To: Yixun Lan <dlan@gentoo.org>
Cc: ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, 
	inochiama@gmail.com, geert+renesas@glider.be, heylenay@4d2.org, 
	tglx@linutronix.de, hal.feng@starfivetech.com, unicorn_wang@outlook.com, 
	duje.mihanovic@skole.hr, heikki.krogerus@linux.intel.com, elder@riscstar.com, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 9, 2025 at 2:37=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Guodong,
>
> On 22:33 Tue 08 Jul     , Yixun Lan wrote:
> >
> > On Tue, 29 Apr 2025 16:50:42 +0800, Guodong Xu wrote:
> > > This patchset adds support for the SpacemiT K1 SoC in the PWM_PXA dri=
ver
> > > and updates related device tree bindings. The changes enable PWM
> > > functionality on the K1 platform through driver enhancements,
> > > configuration updates, and device tree additions.
> > >
> > > Functionality has been verified on the Banana Pi BPI-F3 board using P=
WM14,
> > > configured as a pwm-backlight. Per community feedback, the actual
> > > pwm-backlight node is not included in this patchset but can be found =
in
> > > patch 7 of the v1 series, with modification of pwms property to 4-cel=
l
> > > format to match updated binding (#pwm-cells =3D <3>) since v3.
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [3/6] riscv: dts: spacemit: add PWM support for K1 SoC
> >       https://github.com/spacemit-com/linux/commit/9aebdfc21f755e0d2766=
683aa251435fb656ea47
>
> found have to re-arrange the nodes according to ascending order of unit a=
ddress,
> so here is new version I've pushed, just FYI, please check (should have
> no functionality changes)
>        https://github.com/spacemit-com/linux/commit/66f56c7a6421394834152=
1b5310064586a05c80e

Looks good. Thanks Yixun.

>
> > [4/6] riscv: dts: spacemit: add pwm14_1 pinctrl setting
> >       https://github.com/spacemit-com/linux/commit/8709d51024068d4c81dc=
785d63169d283d147cf3
>
> --
> Yixun Lan (dlan)
