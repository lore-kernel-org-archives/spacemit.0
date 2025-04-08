Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D738B22332A
	for <spacemit@lists.linux.dev>; Tue,  8 Apr 2025 09:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744103054; cv=none; b=BtRwCXMxfGnHiAPWfgrXFUID6pHl3Cq3eXwqSgo68CW3BGPZhswy9DoS/aZoPMrUeZ5Ul9V9mOzSN2y/dA1l7PnJvFPnW0ofgTw0DnyTSWOvEcbvNsBe9R/tLuGsKq+RJP1tK9s02KJVh+cCypCEFJBJ7Un5wWOZZ3jhEe+VujE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744103054; c=relaxed/simple;
	bh=n3yPhKBmkrZrKNmGGkYKVNWI2VnNkodGMszFRz7nRK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZtqN4DEZ6D8aBycOx3Mk2gNB6BS8k9mai6R9xNiTVSBUYCvgdGj9iJSXoHaTeXa6A+YGOQK3RKKn7go4OCsihjZw3OMkWAaZeDh6F04PXaCPSi9EcWKeI17ZhoJFWb51UhemIQsLOMrZRlL7jJsP8X8cAnLHkKePvhWcCaDbawU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CR51dbM7; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CR51dbM7"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-549b116321aso6082652e87.3
        for <spacemit@lists.linux.dev>; Tue, 08 Apr 2025 02:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744103051; x=1744707851; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtKT5PB+I8jgGburlz5n6UrHfPzs2dxAk/yRT6NP0dQ=;
        b=CR51dbM7NaAQMLHqndpLP/argslx2u00nxe4AV5LGl4j9D8369UkrStrH+FoHEKXXV
         CumWRZWxUK1xn1CNxF60AaCTTUnD0KWl6z5gSibWTHoiDiUuYRA8ZdpDPI5InZqWL8dT
         2Ae82fY3VBi5KLtg9/O6XRLfK6sishwwepS594igdVghld8tu2axRMg5PDl1sFv//4Ie
         6iznO1BYjkX58YcRbC9V/E9O1BgOVLvsX/VWDBBrUgThztSUuNET2x7W2+E0tryMqXjM
         OmOU5Z1S7C0i2lnw+yk25yjkfkQ4jJvyLSfe5dakpGl3d+OQemtLEiXEhSTWyrXV0dpC
         en+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744103051; x=1744707851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LtKT5PB+I8jgGburlz5n6UrHfPzs2dxAk/yRT6NP0dQ=;
        b=GnSED3o02MPMpijd0CtRxXJGfo4c5qtYPWlwsNn9EhKP7WYgKpJ9xZ4NhQRqU8GO6j
         ZiXen70T94YohfAU1EGFxWmSeQcz+HAnAYMx4gh5f7NPbuY9yihkBKt1svMN5etwpVmm
         vNW8jAZzbZmCYgsyk3yPoe67bpFbMJVomJ5JYnqlWgKMfSr3WiUuyXvMC1j89MtszKs6
         d/E73MOxRdvjaSzylJ9r3YLfFY88JHC6TsLpRXf3uzcKBCYz07CoIIcpC7SUFvlkAZNb
         A5XDTt5gfZdfpJhEKVDigrFSPBZ7UmeF4qJNnr+Nu/JTICdeqV1osBwhu/4hN2nR3NFX
         /ewQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAYKlMtZoHvaohe5S1XxlSW1rYFyVdKjTARJAV3Gyi4ZCgSF4PsE1fQcwrVeF53qbwUkMtWqL+5w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwjqF/0lTkpr0inE8zMiFEptOr+Tjp3Qqe73Aoe5eY0CVouO2BN
	l4/woEnVw05xcTVNYJ6jKeQ4mXxRgM/LFBbZNw311+cZTLpFXy0MDHnWpxbABOssnYlbnuzzx4C
	YxzgJc9FGg87PCK9f2VkKCFVxNhI/xXKj2rHevQ==
X-Gm-Gg: ASbGncsnhvYT5i/f4fCKpucfQ4HH8FDDeWvuXT2GhDnQ0fdqKIld/tzZpPmo7CYMeGA
	FA8+ZNLlxlhIV05ZVZliXeTL11eNf3uo/LKfM1nXywzrjLXP0EqIj4c3MiiMbBNtySwgngGaYPI
	LrDqF6YS9hU9CbQaZ7JXZON3OlkmKY9Wwpf/Gt+dp8MZn34kUw/M9G85tiTg==
X-Google-Smtp-Source: AGHT+IF2WUkxm68ddIms01ocssUC4e0WNcZHFUed8nlsJd3SMfdqBt0sV6DP/H5TRFqdUI/lrkaIskfxxDirqwxdZyw=
X-Received: by 2002:a05:6512:3f16:b0:549:8c86:9bf6 with SMTP id
 2adb3069b0e04-54c227dc869mr4261598e87.39.1744103050753; Tue, 08 Apr 2025
 02:04:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org> <20250326-04-gpio-irq-threecell-v3-2-aab006ab0e00@gentoo.org>
In-Reply-To: <20250326-04-gpio-irq-threecell-v3-2-aab006ab0e00@gentoo.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Apr 2025 11:03:59 +0200
X-Gm-Features: ATxdqUGccJrFjcEWKyhVa646awyIsRz2HGjGAguvah1n6zT984GzRInZSF_52-w
Message-ID: <CAMRc=McnW0YRMmikwu6qWSdWD5Zu227dBRwd4VeWZcfcEFUMDg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpiolib: support parsing gpio three-cell
 interrupts scheme
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 11:08=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> gpio irq which using three-cell scheme should always call
> instance_match() function to find the correct irqdomain.
>
> The select() function will be called with !DOMAIN_BUS_ANY,
> so for specific gpio irq driver, it need to set bus token
> explicitly, something like:
>   irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---

This doesn't apply on top of my gpio/for-next branch. Please rebase
your patch and resend. Patch 1/2 is already on that branch.

Bartosz
