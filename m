Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78400246348
	for <spacemit@lists.linux.dev>; Tue, 18 Feb 2025 13:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739884209; cv=none; b=HIlAb++j8VXjPLYRV8QMTh4nbEAbPRys/QQk76Mnbi7Uqgjo7j0WMnBa4LgAy2mgF/7Odkr0E2P4TxrEpHxT6Pxs65noTkdIz+Y20fHZjui0foiVW2X5kyp0cUJYzBhKvitsTXhRqc6bBnAO6V2oaXN+Eroq4LIoUom406EZEcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739884209; c=relaxed/simple;
	bh=wChb/6g3sce1C+2S6hz0f4MqiwvzQlvCTwkos7PCRgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C/5qb752SRR9E21LG/wZMGNfbjIxq4m3/2Nkv/di9m1INnCF33L1UzEdfzIqhCJ3z6bRd8JWWj3TVxcVnc8XpN3B5vnfvkdi5x2mbtwBs/Ga9N+4QKtqk/mzXjw+uObZAW046SA14++/1nKjodQ73/Q/oeHl9xglx1jvOoLgDeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JXzew6SO; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JXzew6SO"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5452c2805bcso4246515e87.2
        for <spacemit@lists.linux.dev>; Tue, 18 Feb 2025 05:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739884205; x=1740489005; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x2H4CFTIInDOtT3tOm3edOpwQRv60P1DUgV4VG+RFkE=;
        b=JXzew6SOLJ75ZlnQ1kChJ7N3m+Vm/buSp3yEXTkSoNklAaRtdbLfeVItZLfY38bKDt
         Bd/LCA7AqkIqbeRyVx7nV7DNLxny9VTg5XD6iNol4VQ0gweEg6oh2RoN8SKBsFosVctG
         BIt9EY4/53A4x4U99vvAb4QmT6YzcXtRLl4TeOH6AdSGkk0xgJ4VWhdPunZZaG6dMfZG
         Gc7WLKeeJiQsfMgW5lytvfZNlD+HzIFLfL/cA7BVdFU0NMYW1aWh6aup3CxrLFosWVZX
         1smUiOZpEjzaHTunN4CJtj6o1A0Rsu24txnJr8/DhoYDW5ZhX2o2X+RpfdO3mV0MWGzb
         uKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739884205; x=1740489005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x2H4CFTIInDOtT3tOm3edOpwQRv60P1DUgV4VG+RFkE=;
        b=WoVgJStWK8nFZjjO6LEhpte9C1VL+Gl/8ZuFoCgL2gQaKxrIaOM028tj8hAuG+v8K7
         EGuML5APDaDu6Cd5fcJiwwY46VzaGN7B5+c9N0S9KvWdzmMRvpCl9roHjdijOtRykbmF
         AWq+c/ab0RuUNuEM+96YPBG+q0jqJSi77+EpoR4V2xSTQkYVc0Nr3/TvrPRhltdgbKlP
         DuMxez0RU/rxcaGNKTqp+xPfBNVBWTmdQ6tC5GpXkmZs89AWeCOnHl9PgWzo+5o6aha+
         6hvpUDRapt+P2JJdCviyPFcnFd83PNq+4BKSwcX04GhA+KUYh/qwZgFWrqOS5PFQo1R8
         Af8A==
X-Forwarded-Encrypted: i=1; AJvYcCXFHw+XWu0WmxP8nJxka4FdfR9+Q26NfaVUf5eOA++sbirvY0IAmky4kB+oSgYAglbd4M4ojSDoIQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YypOU7bFW6QCWDRuwclSwKpBrniY2oZAqzjVecJdNnzsRbPUQhO
	RYxkAkHgvI7Jwy0ZSZZFcEJbfn/hEEGPha1Gg2KyKIQFrTjxz5URpi3xqIYXRS9UXFmOXBV/Q1k
	BWgJVCSORea8BAthQHOQIaEV7JWjzFnH4FD5SYg==
X-Gm-Gg: ASbGncveSwo9X7KsjUGiY+XeEXT4YkuF0Q1KBkxf5sArPYli+LijyFONLzUjPqpxx2D
	gJJ8nF2Nc7Rk+5bue6R+yYwFkyeyaaG4Z9D6MN5/GOzxguq5RCXi2DDxedpZesaDCAB8iUtV+
X-Google-Smtp-Source: AGHT+IHdB6MXsIp6ZqlQsI40sZGvOLeSKe+AB5abn2fY1o/Am7w1jOVveK3QMy7dhDaAVzYZIDd9lE1wi3yAkqHGnxI=
X-Received: by 2002:a05:6512:3992:b0:545:2d27:5ae1 with SMTP id
 2adb3069b0e04-5452feae86fmr3466160e87.53.1739884205513; Tue, 18 Feb 2025
 05:10:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org> <20250217-03-k1-gpio-v5-2-2863ec3e7b67@gentoo.org>
In-Reply-To: <20250217-03-k1-gpio-v5-2-2863ec3e7b67@gentoo.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Feb 2025 14:09:54 +0100
X-Gm-Features: AWEUYZlVwAj_YWqJ9Lyi5dg687EoTYyaneVjRfcETc4JasvXfyarUzHN15z58MI
Message-ID: <CACRpkdbxatfvPnOY_gNVAWdtoJ+xj3DbKNUqFU=9AC_UKM88sw@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] dt-bindings: gpio: spacemit: add support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>, 
	Jisheng Zhang <jszhang@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yixun,

On Mon, Feb 17, 2025 at 1:58=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:

> The GPIO controller of K1 support basic functions as input/output,
> all pins can be used as interrupt which route to one IRQ line,
> trigger type can be select between rising edge, failing edge, or both.
> There are four GPIO banks, each consisting of 32 pins.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
(...)

> +      gpio-ranges =3D <&pinctrl 0 0 32>,
> +                    <&pinctrl 0 32 32>,
> +                    <&pinctrl 0 64 32>,
> +                    <&pinctrl 0 96 32>;

In my core patch I assume that we encode the gpiochip instance number
also into the ranges:
<&pinctrl 0 0 0 32>, <&pinctrl 1 0 64 32> etc.

Yours,
Linus Walleij
