Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268D017A31F
	for <spacemit@lists.linux.dev>; Tue, 15 Apr 2025 07:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702529; cv=none; b=ncg4c14AeQ9Hr+cv5lcW0T7rALkpev6tkvgRK4/OXgeWNHUJ8q3gEQOmIwqHhrjquXyRYrr7EHtoFzqLpBjY3sjFFeS1qCLrxn9cuK4w0Gs3jEqTPUhG/f60EMgf9BSyE625d+WSO40cqfaH2CX8U+AZy4e6Gn0685OmWXNdQGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702529; c=relaxed/simple;
	bh=/t01dfXvGRgfX4KTskLD9RHr8QjggEKBR5una7CkTdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HRKrklqNZCZ3FET/DuraB5TN7fmPeC1LgkfFZEdazXZWXnKLhR2L0lsEyAjISbNWzttjAXzjA4jxuNF/BYjNtd4LSH62Da8CqWcf/Najgk8KfkSTa65sl7JXL4jLcYHUnBW2NRr+2e/LnEgsssLsmtC7/YHlnLPaYeYuC32Kv0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l4XwNXP2; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l4XwNXP2"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3105ef2a071so25134491fa.1
        for <spacemit@lists.linux.dev>; Tue, 15 Apr 2025 00:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744702526; x=1745307326; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5s8lHjULdMShwAF8jjer9y5ggl6mu2Z2yK+KvFB6hE=;
        b=l4XwNXP2nLdwzF928JiPdI7sd8+MyZBY76GzKqBUEQycGneOz50s8Q5+vr7B02N2Xi
         kRbVmS4fz/hSzyO8Gt7J3MnwDwyuYDTCT4q59BfZaazTypb2j17HpNAcjXZfg8AjzF1X
         xNxq5FJb2pl2zFFB6+HU1WLBjQ+un5Hamg5cWLqkDngCzI56XO56RBSf011/KnKpDrLP
         CnuN5iuV1kwrVWgegYZEzxQjwoaL0D5PzP4ihbMHx4gmwW/U9BJtqny2KZi6+clLOffi
         fKddSALN5nzSDeMpQBgZHBhWmiWFmfM6/qq0Wt/FZt6927dIdpYGE2TllI4UEa+qnXTU
         6glQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744702526; x=1745307326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5s8lHjULdMShwAF8jjer9y5ggl6mu2Z2yK+KvFB6hE=;
        b=WzV8/gan8AIPfYBJ4Oiqpr2O5YIidEiE9Y+/ueHus9FP7ZksQ6yhY1tWBeGxWeaRq3
         vHuVygGPmTbMCx7riexT2oDtU7zxXkDq3yOb8a7HJO3oGNZdoBJVz1JJHVwQjZqMpgxZ
         OTk2kof+3foedrXlmh45kwBZZVo1irKE3C4d04+RC8ulIJ2GVRzA6wsDJyljfuLVUX6s
         Je0ZJ+oaLMXep323MSOc3/QjaJ3KQqgTNF4DXp/uTv8Y8mHUIDonYNw35iYacwR0rX9j
         2qM6WHOsfR5oP/HSMi4W1zEjIfEz+DqIQwHhpX4+5grPBwQW700PyB/hOY2YdC6GrpKa
         xP/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQftbkOGGurPPbNTs58B5SWgz9jjLnpuGG9Uh3k+nKEtO+Qxpyc9IxjcsORLlg8jg39ttE2daPOA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxNK2gjPawV0HxOP6iGFGwXHAJW2Hp6yrdFvlSXzssky6gCwEzu
	5cMGYSLOq0rvjabA24+FGOzSG+XXvPHye3bIvvTDHgS3AsibvzvM6ZVPxFEWef6RbH7cUaQvyzS
	AFlnHghOIUceS9VKT7UnVYKyiftLrPHHdz6H2bIUXYF2j8eDO
X-Gm-Gg: ASbGncsP6rJJ3snjf91RWpYEz6mN4BW6AQCVuYnbKCSWyuVvd7OUGCnNwigrP7Yg7VQ
	02v0oyIAEtavSalavh+cJ8DyfLrOAcJ8yQQ9SfccVFntlA5nULnF0H5urTkHwu1fuHnwjJEY07V
	sVSrlU8wn3t6Mgj9dpPQbOGU+PXY8krHtS
X-Google-Smtp-Source: AGHT+IF/f3ma4C5o9c0efnyvduCTab9wDDK72+7lhXFZsmhgzu8nGsMsG6D4c0qe2PhRQIiyrICHnRVYY1XaZjetoDw=
X-Received: by 2002:a05:651c:30c1:b0:30d:b3d1:a71 with SMTP id
 38308e7fff4ca-31049a80682mr54317271fa.33.1744702526493; Tue, 15 Apr 2025
 00:35:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250412-03-k1-gpio-v8-0-1c6862d272ec@gentoo.org> <20250415023234-GYA29961@gentoo>
In-Reply-To: <20250415023234-GYA29961@gentoo>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:35:15 +0200
X-Gm-Features: ATxdqUFrvoN3oToav7nR6RzJi6WKzvpJz5pszWK5ULoM2MOJjET7tU5z2QtEKvY
Message-ID: <CACRpkdZ6A0xORRQBnNNPFcNHg3xL=U3_xAcePmaDN3_ZYMzsaA@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] riscv: spacemit: add gpio support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alex Elder <elder@riscstar.com>, Yangyu Chen <cyy@cyyself.name>, 
	Jisheng Zhang <jszhang@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 4:32=E2=80=AFAM Yixun Lan <dlan@gentoo.org> wrote:

> Hi Bartosz,
>   I think this version is good to go, if you agree,
> can you take patch [1,2 / 5] through gpio tree?

I agree with this, it's the final piece making use of all the nice
infrastructure we put in for threecell GPIO and threecell
IRQ so let's merge patches 1+2!

Yours,
Linus Walleij
