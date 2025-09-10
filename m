Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC861CAA79
	for <spacemit@lists.linux.dev>; Wed, 10 Sep 2025 07:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757488787; cv=none; b=arkrmujN0ZA+oy14e2uCp7bDTFs434EICHB0e0DyPVb9uNG9l4otaCk/DF4QohWPcNpSyYWLCze+My3c5zip4KblJ9uFQ2ovCZIg+k41/JbgACle4SJ/66vKrHfLOdSTcFrPGLILyamz8mzNQYRR//ZuPFt5PjjC3TIcOjTfiNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757488787; c=relaxed/simple;
	bh=K6G74mBlZ/fYakaHeDD39PtqJwH/riYmWWQl4lVzsu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fGAHFodMlCUVEdcYzykOA1a8bJJD98+IPU4HpAeKnIVlT0KhEcGrxYtJPQ4c7i6+aUY3VO/xxQlaCxeei+QEJ+mIQen9zkU9fWZwzkCbQJfMKLrHs1NRIzFYMDLkNq1gJCA25fPJFdYh+6pdiVyJtnv+jtGLtoTr9art1RqzTUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dnoEeH6C; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dnoEeH6C"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b046fc9f359so1137963966b.0
        for <spacemit@lists.linux.dev>; Wed, 10 Sep 2025 00:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757488784; x=1758093584; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6G74mBlZ/fYakaHeDD39PtqJwH/riYmWWQl4lVzsu8=;
        b=dnoEeH6CW4qoMcXYMsWTuBVCweUuzuqJAt7N0rssUPEO3kfsdDbk6inNRF/mn0JfDH
         FpLZicbNoo2jT6CfL0cztrcQLL2a6YAWZHVGnH3gNaFHC9mgF0oVoFk51L+CU8StaMPm
         CQbBjItL+gHIYBUh1MFyIb7UyMu22HJNnAgVVNTozyi9Qhu25dJVTKHdHL9Yc0dMPkxQ
         yjL12ufyJrfeLpKCzmjdM7pLZjOLjQZ8jBXC4g04S1Fp9+Fj74uA7BShxB3CxFiA6Du2
         6xpCWUZzXwwcAjQO8LT91YsrMctSEzhGjmLDxE/gz3SFGI/R9bbq/ZWOrbiHQ0aBM8Iy
         yhjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488784; x=1758093584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6G74mBlZ/fYakaHeDD39PtqJwH/riYmWWQl4lVzsu8=;
        b=i+Fw1xIhxbBWTFQFuwN9bOuY4tPEcknyIKpdSWaDz7NzF4xE+nNvSZ9TKFXcjMATvq
         wFRZI1ZTUSUz0pyuy4iIgCXbcOURpYeZfZns2ohKxV3xjHK7VW8ANXWoDZHsuB0Xvfxx
         fn3EsE8GRWER4EF3wzMjUE39xmui8M6qJFkBJQY+cWH5cmlVZAk3dAHrNyS0QwXbbBDX
         VFuINu18k58ItHQFY7WVhcHAxu9Dsp8cvu6Y/n/Z/RzkXV9vWoYsTmAA+nzKHB9/W7+U
         fQYA55xzydRt5X+u5jKm5H+rKePI7b3tfH/gM7GerKbIf8XEH/QzdNINR/bVU+xOd6d/
         4a6A==
X-Forwarded-Encrypted: i=1; AJvYcCV9F543jBpqTmBjPc5tRpLxUHogOnN3j7pb2oz+MMh36JM4aRmyCdnUigogCbQ4bV4tmKCfUZ2kdw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxzNQkKtSXYAHpfUqxbLEFhG7PkCYlqAgQC8vBkDKt9lS3aQrVb
	ZCx7YFdzTdiuPbjAujPzYBV+TdRvF8p+MluBpb+rp2OO3z/tAaq21nMut8eghOcztIRz3rrezCS
	Bpqyo/mGBYnPUatexYY2y1vpebXm3040=
X-Gm-Gg: ASbGncvVSID0f37Td40Rudf8RNuu+WTdcoDhvTqx4sXlxmRwxgccLVqzQemp6fuM+hW
	1x2YVw2qeZOqJTqkY3+RQVV/xzBnl/lTT4a4tS20foFJfGmJO/sMA2rtNRdp3R/c5MLymMFGyVH
	fFiyM5yxGbot0r6CO3j6lECWblI5v9woMfme43j+y7YTF5xFO87+E/q5M1G6ifQwSd4vSU4i0PQ
	ORVMqo=
X-Google-Smtp-Source: AGHT+IE9VwmF/PsukJbTlBYgmvFE+e/pACvgJIHgxZN/6gBmWKACe4q7JDxVYTbF8agSRUuPrIlTk5gxzt1ml6Re7Ok=
X-Received: by 2002:a17:907:9301:b0:b04:75fe:e88 with SMTP id
 a640c23a62f3a-b04b167e229mr1292677866b.49.1757488783973; Wed, 10 Sep 2025
 00:19:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org> <20250910-gpio-mmio-gpio-conv-part4-v2-13-f3d1a4c57124@linaro.org>
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-13-f3d1a4c57124@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 10 Sep 2025 10:19:07 +0300
X-Gm-Features: Ac12FXyVb169fyF2MyyUio9X-rBr9gKbOxdItUjj4Nc2RkmldZAztWEoPmp-bgQ
Message-ID: <CAHp75VcczAm_=XXAjwLFqNTCF72-UJfdisPvavadDEXJR2G19A@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] gpio: sodaville: use new generic GPIO chip API
To: Bartosz Golaszewski <brgl@bgdev.pl>
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
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 10:13=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> Convert the driver to using the new generic GPIO chip interfaces from
> linux/gpio/generic.h.

In case you want to take it
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Otherwise I can take it via my tree and then PR to you.


--=20
With Best Regards,
Andy Shevchenko
