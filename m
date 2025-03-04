Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BBF1FE44B
	for <spacemit@lists.linux.dev>; Tue,  4 Mar 2025 07:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741074016; cv=none; b=k+weATrXRaAi4meaEjo1pV96QgKrGI7VgrFbZEpg18v/4DF9RIk7Quemeh3RmKSEncOhUnUiXbImWrgB290DKOyOAMsMilh8XEMCva4hCxFrD8dd7g+VMKFSDJuDN+1Lo4m9nUOm6taeidBWJbu43HvSa4jowH/W/lJxXGNXlvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741074016; c=relaxed/simple;
	bh=3T+luX8w3tRQBHenZr4Mib8LyLSph+Ibdvl/8KKqw98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G4hlPXg7fPwJonnBHPXApN0GAw68jN8bk1k3t7XLFGVoVpq+3V6WOVFBbCp6C1qMxCiZt2niRKsWaibN/1fliYFEY9ttefY04D+GWhak3S8e0wI26NFbDk+ucRj+RUvEnbwc7NBk5ES8foryebGbhw0q10eW+lvp6TcOP+Fmb2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w9UJTPZe; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w9UJTPZe"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30761be8fcfso57801521fa.0
        for <spacemit@lists.linux.dev>; Mon, 03 Mar 2025 23:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741074012; x=1741678812; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYa7EfywJTw6o3MYMu3IjFEnE/ok1aP+gt2n/HM5KmA=;
        b=w9UJTPZe9RTfESDlDd4oO/t4i5j1yH7oww0ya+SUVNKJsDIWz+XRZpbm4Hu9aehazZ
         9xSiuD7/YyIc/RgAUQxKo5vOcLfctqp3dVNCjARNchMOSWmm8wFhIbGj53K02fxGk2OH
         hzhad1kzi3GlJGGQalDa0689rfKx7DFI1sku5daYfLPWyvGZZJB3dW9viJrV/vF2QB40
         IUrXVPQKDfg9KBYlxv03sUdz0GCAJm/TmwH74eYZk4XXQ2o1S7CDIf4YCCVjnpjIWLyY
         TQhWYjXW6KORbgQ5zPGitMKarAFZjxbMDL9TUXh6IxPVO5Klk4YOa8VHm7XLJLxQETWW
         gaxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741074012; x=1741678812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYa7EfywJTw6o3MYMu3IjFEnE/ok1aP+gt2n/HM5KmA=;
        b=sjj5hjbP8SfP/UOcf2fAK/g5yBH9Psfu1P8RxFuIXj3rNmcTLzqyQGTyPXw1xndXWM
         Xnp5lDO8JNprEXA02XTh6W37u07rnmX3Zy13cIpEbcL7+ejWCtkmXRQUPUkLp0aLHc7n
         VninemgbssRkp3YhXyfdjcdNJa4DHQMQVum+302iRIAz2i5NP8xW3bOhRolRSrtNZ8Ux
         M7TF6785W5X3EBRfOABcybUzTOjWqIx00rswQl4mbdTXfgG0VNoChCcx5HgY7A1Y0t5h
         oH4SEtpY/6Ciu0i+rGZci9se0KKOdbENYU8QFXrfJYNrhaRD9dfXRQXA3rAUDJxCQqev
         GBvw==
X-Forwarded-Encrypted: i=1; AJvYcCWIV+1s+X+Hi6aTp1EwW/cuQH+CNA06tC5SPXOR7i6kAUVz8yO3OViYgPo001NKrkkAWX9uA6UQng==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyb2D/gAyZ8Hsk2IKdWBHDTYZ/L6o7DyLpqFO32FGtSaWpP8Q+0
	5DRuca8zdIZKx/ewkGeQYzbzb809jYPmP0xsW3ZL5tA7x7vdQKoFgZQ9PCHzYQTVSLja31L50ZM
	87QoHtGU1qUnuOGeXF3hIMV3JNsYzodT4e+zgNg==
X-Gm-Gg: ASbGncsHAlgsBcUaaE5/RrV49JcqsjWMxCIkeHC9/PqywHa7aNmXjqNu7cvtu6eizvy
	839c82kQKoFYfyMVacROtuaKk+FlLyPup9regDs6WnzdvS1cRHGg176O/GLTuUt8cprkgQ6Fc6i
	vsFu7fqeqF0RIUiz3xOpkh49HPsw==
X-Google-Smtp-Source: AGHT+IHXJH8RsSh9MugAj23AQppoEi7+HBO8uvCiCpR+EoTX8kmz1M4QPFhcf3U1tuxSzojD8Ca99DcRZmVr3olmu1M=
X-Received: by 2002:a2e:a716:0:b0:309:2267:32d0 with SMTP id
 38308e7fff4ca-30b932443e5mr44153791fa.21.1741074012067; Mon, 03 Mar 2025
 23:40:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250302-04-gpio-irq-threecell-v2-0-34f13ad37ea4@gentoo.org> <20250302-04-gpio-irq-threecell-v2-2-34f13ad37ea4@gentoo.org>
In-Reply-To: <20250302-04-gpio-irq-threecell-v2-2-34f13ad37ea4@gentoo.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Mar 2025 08:40:01 +0100
X-Gm-Features: AQ5f1JpaPsAGaJQpCY5h6TnkBJvDhbXUxtDbGepWe3FtwHACW1AT0pWNBP_lsZY
Message-ID: <CACRpkday=ZgxovKB03PCweh_rGzaJjSJ3ezC_UzPacQPPNJ6KA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpiolib: support parsing gpio three-cell
 interrupts scheme
To: Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, Alex Elder <elder@riscstar.com>, 
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 2, 2025 at 12:16=E2=80=AFAM Yixun Lan <dlan@gentoo.org> wrote:

> gpio irq which using three-cell scheme should always call
> instance_match() function to find the correct irqdomain.
>
> The select() function will be called with !DOMAIN_BUS_ANY,
> so for specific gpio irq driver, it need to set bus token
> explicitly, something like:
>   irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

I read up on the bus token code and it seems to do the right thing!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
