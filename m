Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C56C18C930
	for <spacemit@lists.linux.dev>; Tue, 25 Feb 2025 16:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740500610; cv=none; b=j8tU5IU4+hVTadgk4tphsQR3q9jMVeRxn6Kpo4haF538OfZM2LgyLGwLL6RewXm0Q2JRBfk55MmsIqTY9aJLPNq//MGXijoYOfE6tTDSCvn7PnNRx4ow3pA27sz3DlX5jKCxhJYfmn4ZfexgdY2OkTZQww2WGeFfoIRdOajz1oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740500610; c=relaxed/simple;
	bh=p2muOdipPBPelc0G8QVVmxLLKm2ZUwbsy/AC035S7AE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mm8Cs9CeH0uVrbSCvP6F3GVji72SNKrbhShTI9oIfmsgw5UHy0kQpL2TStLGJvafF7xuMjVo1s8OOu59e+1Z5DRPt0C57bu9TJO/t3vV9MgsqfIJudKIqlPENgqxJFI1HsNAygPb4pWhq5og62zzQwHhYB3q8Uyraamxq61qjDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EN+2Dn2V; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EN+2Dn2V"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3098088c630so55080531fa.1
        for <spacemit@lists.linux.dev>; Tue, 25 Feb 2025 08:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740500607; x=1741105407; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwTVpdV2JjSXgTvzENZ9IyWWdkDRBnMKH/dfCxaMyOU=;
        b=EN+2Dn2VgzaGuQ5K5ZggtK3HQIPELi8v+ZYOmQ7jRZDuw8713133AqTVhn0kKZdqm7
         NBhODPmDHLyQ3Gzll2ZQmGcy8vsyidMrybEpcF5fmqkVG7Nd5agPdnA1YWMDn9BgVIGH
         oVMKjamtAOvvd1EuHnwhBwekxuvKrENkscOrU/QoEP1De2tL3LGXCwH5geuwRhXXubXj
         a8E8V4JlEk21aqZXawXXEwROBv9OChGChaCzPCn9Nb7ldtFiomGlFV8dqZvxY1gIqoJH
         Dy4dY1mfkF2Mct6t4ZIpeVUndJXvGIw1iwsYfWB4TdmfJIoOsV/i8o/k+Ui9CTXKLFfq
         PgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740500607; x=1741105407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JwTVpdV2JjSXgTvzENZ9IyWWdkDRBnMKH/dfCxaMyOU=;
        b=k/r0ywf/F5Rg0eBtxzMQesaazlAw+pWtLo/TNHTOQb+A9naAjX1jd5oYpy+QGO9hZa
         4gyQwi4Lst43GjecGuCuGizEcTPR2g8MG068Sm4xOqIf3SprPva+YxO9R84ojpjVOub2
         Ty7fDq+UOTEvGwAdpkZi0IQImWxiEgCKaxN5iaLpNuYK+l2+/VVlPn0h/IJDpqO2URnF
         r13L/mXYeLC5ZTiI3Vq+ndfh/tM1bN6hGdOtEwC+akb6uRebVX1BoBV0V1ahc7eGuu8M
         zO1Hq4AMB0SJoxX0Buk3qcX1KIaSxSEvfA3OGot8rXs1HnOmUrlXTvTHZ/q3yFsP+hB4
         qlmw==
X-Forwarded-Encrypted: i=1; AJvYcCXACpmqLiE/w8q5IExcM931xYXFec9TAKo3i6S6hDzFs5ZpkoEyMy3gncDC9kKLY21WlMnsNUgBIA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywl7gsibqJiX5ysyYtzFviAe5HB7FV3XPBH1CL16jcqGLxAYPLL
	hKgDbuR5eK/ldw7n6kLulYauo/QwkjwaM/SLWghhxIbexASlDUnh8w9FXpvutehFWjgSF2yAYwn
	wU/JPiPZ1FofCb8ApZA4kDZPldGbqNUBqT5LUdQ==
X-Gm-Gg: ASbGncvbSuwqEd1CqbL8KS6PAiVMqmNowiYiYIEXSKLyZMqrtyt1mdQihrVTVgbp33Z
	zadPUKo5r/CeRbc0C82M8j11nUp+Mow29IpM2kJgdJ+qHQ4Cd8YJDOr9goL3ct2F60QImcY0Vtj
	04QSregxE=
X-Google-Smtp-Source: AGHT+IH1cSBiJaqWZBQz+1oq5/PChixqiVALnH9bhFgTe0md4+MN+IzZ3AEODUq6QzG1w0FaEprZGS9Czr6Kk3AzBSQ=
X-Received: by 2002:a2e:9ad3:0:b0:308:fd11:770e with SMTP id
 38308e7fff4ca-30a80c0f167mr16005611fa.5.1740500607109; Tue, 25 Feb 2025
 08:23:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org> <20250223120638-GYA39613@gentoo>
In-Reply-To: <20250223120638-GYA39613@gentoo>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 17:23:16 +0100
X-Gm-Features: AWEUYZlkLTGEHvbrZyxHu4Q2yRspVFfhcab6__rjgENXWUAEaf3SKXErwl_alg0
Message-ID: <CACRpkdZLAtxOdF5TkGtdrbXB+S2jV8Lh_47vMdiwUt74Hez7OQ@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: spacemit: enable config option
To: Yixun Lan <dlan@gentoo.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alex Elder <elder@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>, 
	Alex Elder <elder@riscstar.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2025 at 1:06=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:

> Hi Linus Walleij:
>
> On 08:31 Tue 18 Feb     , Yixun Lan wrote:
> > Pinctrl is an essential driver for SpacemiT's SoC,
> > The uart driver requires it, same as sd card driver,
> > so let's enable it by default for this SoC.
> >
> > The CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled when using
> > 'make defconfig' to select kernel configuration options.
> > This result in a broken uart driver where fail at probe()
> > stage due to no pins found.
> >
>
> Can you take this patch via pinctrl fixes tree? if possible in this cycle

OK!

Patch applied for fixes.

Yours,
Linus Walleij
