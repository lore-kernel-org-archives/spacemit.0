Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAA834AB10
	for <spacemit@lists.linux.dev>; Tue,  9 Sep 2025 15:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757430968; cv=none; b=EwshewqxIWEAdr5jgbEMv/Ruu5YOgzcvwd40EalcbGb26hgCjxmxWUN0NmdRMCz8NIV2QdaL/eh6D3r1p9jIQXp0pUNuypZdF18VzVVbhMNHiCWni/9mqtXh3jaH5e3dE8BELxObPwHcwgco+G4b2sHuHSCEJsgtMEWSH8SJJVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757430968; c=relaxed/simple;
	bh=HhszSRQXIU5hyXmbHS1r8ihhw943QEplSsfQYmIy1lw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a1Pal/08n3qWx8zATl/DBqO6ea7pSE4KDvq7tI0IU6LpxEQq6JIZGcOnvSXSDS6NZBrq1CuTbWfYKrO/VyrRL3n1TSHJ1+J7R6c6+mS46o5iypnalP1vY9DOCNROYhKq29RDQ1Yy1OlCCSeKnjr3+VQn+TrfRI7K3XfiKs6Ea3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EdYbSi5C; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EdYbSi5C"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6263d0e4b94so6641920a12.3
        for <spacemit@lists.linux.dev>; Tue, 09 Sep 2025 08:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757430965; x=1758035765; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HhszSRQXIU5hyXmbHS1r8ihhw943QEplSsfQYmIy1lw=;
        b=EdYbSi5CIdlJ9UQFRuFl9Qfq10wovWCpMwXBfKPjJGkjrdznnZWzInlSilO4wb/Hwk
         vI49QkE+qmmfoomRPb7m+Hdr0YWlbAdmhrzyJ5fB8b9zjqAu8Jeh0eqSj7TQIejhy0Cx
         kGtO3Tl55VJKhzyXKBiGaV/cqwX7r3kKPFyDU0YRMmXjJWHXFpLkvPF0a3RQA6cERVhi
         Mmu49gdaNCaKfU49dxtp2uMsz1z3cS/nQhxdAlcvJMCWGqckDCT4AkUBpR3/LkEn6hME
         cCtu9MZUgNRaUPAuIAroFlYYbOLB2OOAEna4c6zUqyj+bRYHCqwewWBRfZlhbVNO6JXK
         PILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757430965; x=1758035765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HhszSRQXIU5hyXmbHS1r8ihhw943QEplSsfQYmIy1lw=;
        b=iYhrQCMWO9RTzlyxoBmYq4crj4Teb1Hgdw0rkMlNSOZLM1WuHH9YBYGA3TvUZU4nsh
         4EKQ3DUedKyX4KzRkoB/ZaDx1rttrEdCkk/WuzcOVEZVB5gc8jP4HD1iBNOtpwY+IbcF
         ILbZ2d6k+Adw/vyg5+8v6flJ5ZaFJksI+Y2AU44U68xlvyGB1e/je6ARJp+710FbT1oR
         6at/e3xKi78FHHywxhC1rxli0SpCojbmODpmVi3UFvCQeigH8pJ0YDvF40TtNv19Jc0g
         hphBHwOQrUxZwqZ2gcnMQ9PTbHvEByLdMXIb5tf+ReVcOumkSnPBTAizowFqBHBmrFjZ
         AqlA==
X-Forwarded-Encrypted: i=1; AJvYcCUzUCE1M79eAV4lvSZi/9G6D+3lWtMBSCMJktvHXmev1nrQxCODnHMCuEbsvvOnKDka+mbBS5u8kA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZTNF38AarTFYLVAufBOL4ZtcKzF0nPpS6jdIFJQIpl38Mqd0H
	OjSWiPb0KkMmDk0MpybwKoPyTxE+lEw2Y0D/1e0ldioVQ+lawFY5JTR2pbEXOLMgu4doI1f7EkR
	UNjvci1me8ISia9n0ubYoMhIAfDEjMwY=
X-Gm-Gg: ASbGncte5QgPYdEjzI+dRgcRv3GKSjMWyQdwkwEBVYqety50EN4sdQgu33WptVQ6LD5
	J+ygyYhPNANeLldm79IvaOX301tUtIkEjtV2An0FBMedD5Ckxi+132+BCdrWaSEYkx9UWjnI0tn
	3Fh4byjOedXD98ZrGKDCOiHE7ZhRwe0lcGASNBdTfBXJNZTGToErnv0LYLqzpwXwsV1nwGcnFau
	d4A76VUCg==
X-Google-Smtp-Source: AGHT+IGeaHcV2kH627FcZIyd8vYLnu/2Up2e6b2i9sBG/bmosVjOp6dqHGnQ87UTIB1WpGArwM97TNlubL6NJn+jj/k=
X-Received: by 2002:a17:907:7e8c:b0:b04:39af:bee9 with SMTP id
 a640c23a62f3a-b04b1003707mr1194942566b.0.1757430964857; Tue, 09 Sep 2025
 08:16:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com> <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com> <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
 <aMAve1MbONmKVjjg@smile.fi.intel.com> <aMAv3STeZUdSQ14p@smile.fi.intel.com>
 <CAMRc=MeA87p0QAzq_3MACQM90MhN0eRccr7u-VzcfyP8b90AaQ@mail.gmail.com>
 <aMAzZAbNwrRTgFi-@smile.fi.intel.com> <CAMRc=Mfn7atHTqKc9nMTQ19ZserqeNi3skb-QhG3CVdEhmr0gg@mail.gmail.com>
In-Reply-To: <CAMRc=Mfn7atHTqKc9nMTQ19ZserqeNi3skb-QhG3CVdEhmr0gg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 9 Sep 2025 18:15:28 +0300
X-Gm-Features: Ac12FXySsG8IXlocwCfN3VG6y5KLpIc0a90AoYqlSY-xU72GOTjlNCZIc8n9fs0
Message-ID: <CAHp75VdDAJO3+NPp29GnqL=C5m7tdWbyYvNFax=Dh+dG49YAnA@mail.gmail.com>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
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

On Tue, Sep 9, 2025 at 5:05=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
> On Tue, Sep 9, 2025 at 4:02=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Tue, Sep 09, 2025 at 03:56:41PM +0200, Bartosz Golaszewski wrote:
> > > On Tue, Sep 9, 2025 at 3:47=E2=80=AFPM Andy Shevchenko
> > > <andriy.shevchenko@intel.com> wrote:

...

> > > > TBH, I think those 6 all made the same mistake, i.e. thinking of th=
e compound
> > > > literal as a cast. Which is not!
> > >
> > > What do you suggest?
> >
> > Write it in less odd way :-)
> >
> > foo =3D (struct bar) { ... };
>
> I don't get your reasoning. typeof() itself is well established in the
> kernel and doesn't
>
> foo =3D (struct bar){ ... };
>
> evaluate to the same thing as
>
> foo =3D (typeof(foo)){ ... };
>
> ? Isn't it still the same compound literal?

It makes it so, but typeof() usually is used for casts and not for
compound literals. That's (usage typeof() for compound literals) what
I am against in this case.

> > > And are we not allowed to use C99 features now anyway?
> >
> > It's fine, it's not about the C standard number.


--=20
With Best Regards,
Andy Shevchenko
