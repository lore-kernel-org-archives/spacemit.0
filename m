Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6822F18F2FB
	for <spacemit@lists.linux.dev>; Tue, 25 Feb 2025 16:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740500382; cv=none; b=HBFaBudADjO7VBGC/1WZ/FMk8+GemnenTHGn2lVAIv7pfWBKBqgx/XL8thxWijuwl7n9WQv2E8Yy81G3CERWZaqMSEpIWNRObROlCAGsh2cuOpnkPwrHgZ2E4iUGM6lv6311pgGOPX//6dP2HJRQNy8zTUYKPcCRClsUz97tpyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740500382; c=relaxed/simple;
	bh=Tyh+RhXcKnxQU4MXzN9oE4S19Yl573Q7D+3G4DQFujQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jkO2liEJgAbZA8LJbiHS+roDlKe7cJwf7PArJRpimX/3aL/8YQsiGHzGlFdsRvjcW5DsRd1RAUVmNlSFEAv1ro32cCDnqQQFylLYzGrmgnvqQxWjSjv12f4VF6HaIgrXQkoxBFh3E92VgfNu2W72AV/B5xEdyDYg+Av+9OB+oWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V1BNu+la; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V1BNu+la"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54622e97753so5296698e87.0
        for <spacemit@lists.linux.dev>; Tue, 25 Feb 2025 08:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740500377; x=1741105177; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tyh+RhXcKnxQU4MXzN9oE4S19Yl573Q7D+3G4DQFujQ=;
        b=V1BNu+laVRO477L6BG/XopujhR9kWRfYXjs+lbwMGcvys9p4RSGlrPSITrIITk0SzB
         8tzldwopL35+NNu8l/oAJ8Huc7zZezqO69J4vz2IcLHHZNvthrdDagdrMjhF0qEXPXCx
         l8n5bi+E6DAW8j3kTPh0012W2PR+XKYr96s2kT7Et3ux5f+yTOpZ+y0XhRRRyELecmJ8
         0m2NVBtMbw8MJNM8cWnp7MYenthi7En0NXfxgc2xAZupDLICbJIoh4qcKQ23YsWmTDpB
         ZOFbKQE4xP+J6eKaeLwuLLtXWeByCQsMK85ahDJya/OJNdi09KSkz18KfsD/32kN+m1a
         SSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740500377; x=1741105177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tyh+RhXcKnxQU4MXzN9oE4S19Yl573Q7D+3G4DQFujQ=;
        b=HJjN8P66kZ00C40LZEWs60Bk+plRKfveHR76QRK5YW/kA1gJU4DdV+KDW3jALQCYG5
         Y8KqtMkUbMcHHXopjDkfutg5RrCXoN/zOY8e/8afprydJTfQZ+e8kpXMjCb2YJkPsWBs
         xhlpvyF19FLnlhvyDu3qfjTfj9U8hhrXIUBXhiLhSz93AOb4hQzSjUQsOgPz4kDuFKzV
         XufBegcTFWiYM94jXGAaEhD+GRDzHncaIsKGkyILaiJFFH+Yk+IllObGYNvZo9cxdfVT
         JwPAozzv+u0Pnht/oj4B5cIUPnNyhAWASiAiH+SnqV6tJCXtsx8pI9TiRof/h6oYG4FO
         1oZA==
X-Forwarded-Encrypted: i=1; AJvYcCUmYSpfaOv5atX2z1c8sXIKE4WJQGSl4SgncxnS8+vY4RjqJNA2JMjccL1WoaRfixKhKmeRCu6oLg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhH+bx2Eg8eA4HeEtqO5vF/tLtooeVFZFXWi7wAIqbfU5UU5d+
	EwH/qgYKd/auhWhA5UnvOT2dAcLV8aLK2qaxHe/rck/CKKVmTb9SSx7dFW/2C5dUX4z25SjVv0O
	OXGe/pnJfBixHgLcqFmB5u7/DF0JkVgKfDkngMA==
X-Gm-Gg: ASbGnctxBPuqPkmAY0XaFbysmkWq6PkjDvbxEYWHPVattpsxk0WZSaTaO91H0D3WSa1
	oBD3h34eTfwXgaY+rNAXVhdwWB/UMAPFuEJRsKimY8ashocN08a3QFQhXvQ7D50OreOn8fDHMNf
	GxHsh4IoI=
X-Google-Smtp-Source: AGHT+IFPKsmkV/8GrQlu1UecaEKHzDdnmY+GOqvsye/6W95YDRH8BC1ZvlN9fdjoiYBCyRDAZX7jrfC7MDoNbdARl/s=
X-Received: by 2002:a05:6512:2353:b0:545:240:55ba with SMTP id
 2adb3069b0e04-54838cd2edcmr5801739e87.26.1740500377437; Tue, 25 Feb 2025
 08:19:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250223-03-k1-gpio-v6-0-db2e4adeef1c@gentoo.org> <20250223-03-k1-gpio-v6-2-db2e4adeef1c@gentoo.org>
In-Reply-To: <20250223-03-k1-gpio-v6-2-db2e4adeef1c@gentoo.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 17:19:26 +0100
X-Gm-Features: AWEUYZlYJub0FzdxL7Mpr1knr2_W3_lmRrr6Vhou8bb5JqpMdWieVnvejFVMY8M
Message-ID: <CACRpkda5=nSnYZ5XJsC_A5MhfdPHwcTndjNr4vGfSb4YJ4Bi6w@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] gpio: spacemit: add support for K1 SoC
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

On Sun, Feb 23, 2025 at 12:50=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:

> Implement GPIO functionality which capable of setting pin as
> input, output. Also, each pin can be used as interrupt which
> support rising, falling, or both edge type trigger.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

I really like how this turned out! :)
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
