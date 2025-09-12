Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795162AD20
	for <spacemit@lists.linux.dev>; Fri, 12 Sep 2025 07:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757662407; cv=none; b=e/HmKAmsGoSOD665uKxuuQh2m4MAwxzhevc+9DEcamjc0cyG1fuAZMUwBBJ0wRoeVlqeVLyMDR4FG0Rygtw3ByLWws9+EuGVVZT65618CGTNHgPx/GojgfN1LawXRUFcwBjkUbidf5L1OFr5Kibf8daU+CAcjrIbE1+fItxObwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757662407; c=relaxed/simple;
	bh=Kg3BU9cKfGHe7tGgdAiZsc5JB/dKxlDiQ/R4O8eZPV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AJMpqs4Z2WwRZiIaVEJFwrYAXMCkZYu6M0oYuWjm/ElwIgkdCM+EWlBqwBjw5VOwyfc0sdwDUMVQe1b34GUAXhW2S5xH0o+hOAM9Gsyqg01X3Q2s+WugGVT3FgXJDByuKQ3htDswT1zqZCA5ZTpCKf0ofO3h17EhaUlEa5MZHwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MR6qwYCO; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MR6qwYCO"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55f753ec672so1757663e87.2
        for <spacemit@lists.linux.dev>; Fri, 12 Sep 2025 00:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757662404; x=1758267204; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kg3BU9cKfGHe7tGgdAiZsc5JB/dKxlDiQ/R4O8eZPV4=;
        b=MR6qwYCOmstq8sCx01ndCejcgoCsq7qMruMHUj0A6MivWxMXcJlfcmWuc9p5CWt54m
         sBYm8PZj6GUaN3+j+pxjwQVbeLVLb+kf9nRYb2OpiwTgrU3MYefg2rjK/0yQaHyRgB3O
         31Zw3R5dXplvrq6UUPrtpT9zkUcJKP+B67tkRy74+Nk1btwm+CmPE0AH1YwiD0FFu8Nh
         UTxqjLUkdY9VSkyQahV8IWnO80qR9g/r5YIWmMWlyRopr+BWz1nKZJTUtSMMSeg/Kuqh
         ZDI35N7/bMrVQV/pJSymmtzldpakG4UJECjudg7KPlwNNp216Qu1QP5iEs4Y63QvEfzg
         UzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757662404; x=1758267204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kg3BU9cKfGHe7tGgdAiZsc5JB/dKxlDiQ/R4O8eZPV4=;
        b=oKXMhfHWsYmn+RrJz94SPMZRYv/6we1iw6mveNSCbEiklc910pBFsL/37hUD4IU5Ee
         I+MHZpa1BtfLBhUCE8Iv1BeHipwzINNzGOECuMxxC/WN1SSGkxSccVBo0HMMSy/EZjnR
         EEkHL18zGFr/aa6wyvtuvtwcemGgLf7WFx6EvxN+Bh6w2K792kWtW5/Mhc+xlYctIRvO
         lZeDLjJucff5F6becBTuFR7DKZUeoyKBBkr/mQ5IjG/gIfcHUl1hjKDUncMD3YTRuVCi
         ADJ4jDeUK4D7sVWmH+8/Iuci6u16dcrHpqsN1rSvFN5vVdU6gpywzml/gopb5vGbvHcv
         l1cA==
X-Forwarded-Encrypted: i=1; AJvYcCV7V/i85L7+md1Vj/zcnLs0yV5IHxC1etIiKDFiLNX80LO0Bft5bVbhkAw9IJtWCHBcLwzbrdPMiQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzEJNALuqzstt7r9NQ/XrJY0qeUQPJLO/BGkjXyNRMpqy5yj8w9
	8T5mkN2lNNBnOXgHt+7b9Yl1cWc2qNYuhNn5VCNQSqsWWXsibMjY02Z4v9p4ZbrQa5Cjdd3gdaC
	UWO6vwt1xjGszy9Z4aGQlX3aC5687R1x820PRRts14Q==
X-Gm-Gg: ASbGnct0F86deYxTDqXHZWP+hR4omK1KPTdYY8fqE/vUIhmVfvVrQS/e39VFzgFMhsd
	Hek/aM6Dt10xdii6TQd7LrGwrslvZqpPUzQxiqUOvZgBsNFpOo+Ae6ZdZylCPSmHev2lvp3bedI
	vatsnbmXvCE/9jAqIma0xRekVw5GKMPidaEzOOtVKR3Dxzjovax0zDrBsUoWtNdwyDB+6IKNoSL
	U0s1TAnA6OOHdL3SQ==
X-Google-Smtp-Source: AGHT+IFqJ3rG4VGz2N4HeDjhdE1zZXrIjMGRIFcSDQMQTPILLpM42VNVO1ib5uwXHA7KeYqbyezpYRqeKhIIV796t/0=
X-Received: by 2002:a05:6512:3693:b0:569:a257:c6d6 with SMTP id
 2adb3069b0e04-57050fe351amr473063e87.49.1757662403635; Fri, 12 Sep 2025
 00:33:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <CACRpkdb=J+hiC5cu+g0Z-gqzpG8PgX01CXc4P98FfSSAf7PZEA@mail.gmail.com> <CAMRc=McbadZx1yK1jGeyUnXAFZgfA8YpLwacmqC0eMonS-c-9A@mail.gmail.com>
In-Reply-To: <CAMRc=McbadZx1yK1jGeyUnXAFZgfA8YpLwacmqC0eMonS-c-9A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Sep 2025 09:33:12 +0200
X-Gm-Features: Ac12FXxWiwLmhQls14nNfaQvMLfIJjlBZAsZhTSA6_U4hnix-0Aq3t1bNNwFxXE
Message-ID: <CACRpkdbSp6ScZrzUtdP0ojP10yOTsbnd33HqgEVdiSwPRomuAg@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] gpio: replace legacy bgpio_init() with its
 modernized alternative - part 4
To: Bartosz Golaszewski <brgl@bgdev.pl>
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

On Thu, Sep 11, 2025 at 9:38=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Wed, Sep 10, 2025 at 11:32=E2=80=AFPM Linus Walleij <linus.walleij@lin=
aro.org> wrote:

> > I would merge the first 14 and keep the last for the later part
> > of the merge window when all other trees with conversions
> > are merged.
> >
> > (You probably already thought of this.)
> >
> > Yours,
> > Linus Walleij
>
> I already have both pinctrl and mfd changes in my tree from Lee's and
> your immutable branches. I pushed this into gpio/devel and it built
> just fine.

Ah, excellent planning. Smarter than anything I'd be able to
logisticize in my head!

Yours,
Linus Walleij
