Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8437B33A03C
	for <spacemit@lists.linux.dev>; Tue,  9 Sep 2025 13:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757424268; cv=none; b=f8R0V7MmcPe5lbTO0EFaHlbfVDNR+I+C1mu9ZIYLB5uqtPKxRieyiRK1cmZLsBSV4tdcsLXMXrHW/RjpwpEzwpgRn/mv8J4xLUfZoEzFDF3Y6wxmqLPwyj1vZYpzxoL8C8aW4kzZ9lCOm10UHFsWvBNUHg+Tac9PRqSxTcK1d3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757424268; c=relaxed/simple;
	bh=aL39VkMmivSGMWcKiJqE5dHy96jTtUDz0EmE+LQfAVc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JiyQFsjrzgQQwdRuJuc3S04NjJiSaneA/wQa7Pka3OyyyJFk10rhvJN0PgU2rA5i3IuDX8Jgmydb9JydVi3yHbGnHdH8a5ahE0wTAjI/Zc9QnkeyfBm05ReLccVJQDL8BJcCMOLjciBzD1SUZ1Hc4FJo96tCr2DwrYOqEY7PY4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VrrhjRlv; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VrrhjRlv"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-337f6cdaf2cso42261521fa.2
        for <spacemit@lists.linux.dev>; Tue, 09 Sep 2025 06:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757424265; x=1758029065; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HhvoYavio6XW9UGp4dKzH+wlvXL0CQx3DgO+74W6ths=;
        b=VrrhjRlv60h656A48Cnr3zeipxyfwFFBltgdMAr5DYDGt3pKzMx0p1ZSisSGb8MjTA
         xogH14ztbKAkeANDBFMbPCCjgbCCgPcux9e9UvNnmm5JRJlKpVDOGHNlfBT7vc+xlldp
         r+NSR/CqBxdXF2lSXwo/Qe8B2FbtQtRCQO9jN/X3Nwd1CSUpvKvu32JDGG/tzvEz8F5U
         C5U2ORIRHL3/MNFnIxorVuNWILh8puaxKRPolfSQjtBrugJJpvjK9/GE74OIyZMaIjYq
         oMcxHGSl6lH4uylYqBE2VUCfmkbSDLvvcx0GD6xph6Co3D32sEiTII3FstROVCHMK5s6
         NxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757424265; x=1758029065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HhvoYavio6XW9UGp4dKzH+wlvXL0CQx3DgO+74W6ths=;
        b=KpULQsB4KPfvmB1GSQBRSTI9Ovb7DBbwi7O5vnEPmDXlF43CMG9eXIztROOjvu9Y2L
         jfx+B2Bh8bLloFY3m6x2lFzWEJsJgm0NxkJZRQ3AxSh3FsiGYaYF9t9KJYZ4HiXsExAO
         koqewPS54b3jXbS5t8O2Qf2sZ4CAdy7G1eTYV3+VckWElVgxif38kofspy4uTE9blgLA
         aGdwCB4eAkwFd+oPBbwLKr2qPxV3wrAO57GAfIc1Auah/aB3xT77GX9G6xJoI9aQBMfv
         dWy9Qcsk+C2UOew2J5hFnQcYbB3U+4xYUFE8R7GekRxV2ZUXzkd4Cz1r1ULINr0N/eia
         oBLA==
X-Forwarded-Encrypted: i=1; AJvYcCXSPHPbJnnY8zwtE/CqO0dMaPQm0s/Drk5gmWunkqZbLq6v6ko5zM4nrQ49Eofc7qiJVPttHSOlLQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyzRctFIbAI0ZwCWfLl1JtYBS52ZAThFEkxVVu9qZY2gTzZLDMf
	6JgLn69sZdima/SzTErSNvWklfpMXynV0Mf41QqduYTQzhJ2QCY/1kAiAXt72H31Acgy/BWLhNN
	Un0Cw6mWy8z5ue8Lwm8s/yXHpMFlk3eA6TgXzTmpqHw==
X-Gm-Gg: ASbGncsU0W/umAAyblDgZCISCi/N+zxXNJieabz7vqzMK3/0B6AUB8X5avp+4VBLHte
	u6yvw5GQsOJNSj66xiGM3kc+CfreMvQVGr8EkQHb2avQR9SMkvFfUc4V+FGRiEM34yHcAMgPvyu
	eaiUzkS5ZteNm3EBiGXI9LxCavBUijWfJThR0rnOWAcesT09U92Z7ZnhpHONUqaLmQ9mJnjXcgg
	l50qMhZU+onmVGyethhkazeuW1GVv1FlIjqF9w=
X-Google-Smtp-Source: AGHT+IGqxpMTWwovk8l5WQ5dYhWUYy4ZcII/K/jrdWFPYe7kT1CZQHo3Y8LCGp8PKQqEA3qrGlITiYRoPcmLayU54qE=
X-Received: by 2002:a05:651c:b12:b0:336:dd88:69e0 with SMTP id
 38308e7fff4ca-33b57c39f8cmr32465971fa.29.1757424264537; Tue, 09 Sep 2025
 06:24:24 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Sep 2025 08:24:23 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Sep 2025 08:24:23 -0500
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <aMAn4MM_Fs8q8qwj@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com> <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com>
Date: Tue, 9 Sep 2025 08:24:23 -0500
X-Gm-Features: Ac12FXwbBQSlPLH49oae8yjyXj1ugyDMbkjsHTtBWh1WBSZW49QTty0I4jg5ioo
Message-ID: <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 9 Sep 2025 15:13:04 +0200, Andy Shevchenko
<andriy.shevchenko@intel.com> said:
> On Tue, Sep 09, 2025 at 01:35:04PM +0200, Bartosz Golaszewski wrote:
>> On Tue, Sep 9, 2025 at 1:31=E2=80=AFPM Andy Shevchenko
>> <andriy.shevchenko@intel.com> wrote:
>> > On Tue, Sep 09, 2025 at 11:15:40AM +0200, Bartosz Golaszewski wrote:
>
> ...
>
>> > > +     config =3D (typeof(config)){
>> >
>> > This looks unusual. Why can't properly formed compound literal be used=
 as in
>> > many other places in the kernel?
>>
>> It is correct C
>
> If it compiles, it doesn't mean it's correct C, it might be non-standard.
> Have you checked with the standard (note, I read that part in the past,
> but I may forgot the details, so I don't know the answer to this)?
>

It's a GNU extension alright but it's supported in the kernel as it evaluat=
es
to a simple cast.

>> and checkpatch doesn't raise any warnings.
>
> checkpatch is far from being useful in the questions like this.
> It false positively complains for for_each*() macros all over
> the kernel, for example.
>
>> It's the
>> same kind of argument as between kmalloc(sizeof(struct foo)) vs
>> kmalloc(sizeof(f)).
>
> Maybe, but it introduces a new style while all other cases use the other,
> _established_ style. So we have a precedent and the form the code is writ=
ten
> in is against the de facto usage of the compound literals.
>

It may not be *very* common but it's hardly new style:

$ git grep -P "\(typeof\(.*\)\) ?\{" | wc
    108     529    7315

Bart

>> I guess it's personal taste but I like this version better.
>
> In kernel we also try to be consistent. This add inconsistency. Am I wron=
g?
>
>> > > +             .dev =3D &pdev->dev,
>> > > +             .sz =3D 4,
>> > > +             .dat =3D sd->gpio_pub_base + GPINR,
>> > > +             .set =3D sd->gpio_pub_base + GPOUTR,
>> > > +             .dirout =3D sd->gpio_pub_base + GPOER,
>> > > +     };
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>
