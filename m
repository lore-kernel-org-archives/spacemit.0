Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09441171A1
	for <spacemit@lists.linux.dev>; Tue,  4 Mar 2025 07:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741073481; cv=none; b=PwD3THRngZ97GXjX3qvUynJTIwojEvSMjMoB3RU6xh3VMot/BmuMcmxHV2Yo3Dcirqo4aU68/tTce5tw4z3Cas50K0Vzx8NB/cfG+CoLNnrTmd90n0yC6CHg4Xoe4FsZ/MoEUV9880/lO8cXjFnc0jwEWlYcwn9z0qwWcHDiDZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741073481; c=relaxed/simple;
	bh=tpN98sYNx6NgaaNJaNzJjhfkNLECKzO5ZtZBIw9ZphA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cFwPBHBM0S3mQS+JBIlR59BxXBdHIURT/G1RcWMiSSqsdhnQKUQlBTLmzzWTitMxFdjkQgy2fXbEolGLutJfuc6Io5eZ//246Q/ELS1XPI7unPBOWjMW0SezU68Lh7IVKv5C117nL2BP0y9a2bfaK0rUc+8DYEIoTEfJmv6CV3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zXFWZfdC; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zXFWZfdC"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-549662705ffso2334195e87.0
        for <spacemit@lists.linux.dev>; Mon, 03 Mar 2025 23:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741073478; x=1741678278; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsNGbnsLqSkU3I8v0oKk58JnonHmFCpGP5Ckb34MbPw=;
        b=zXFWZfdCbiodS/8eOtfpS69uaE/GwEaBPAisHEYtoEaSrFGQ4n/ziD1fnpDvEPpBnN
         9OJl32GbNLeD4zQSCAP9ts+C7FCCWth8LIalNnsrP5y9/7b6SUw8r2/VL8m2qBdL/Zvk
         TccUhs348vV1+RNJ9N0h/uxOelViCZKM3+eqrvyHLzr/MOXbb8Gs2UPSgrC0XZ9vvoJC
         QkDUH7J38sCcc2TV9O1gBbUvp31m9hflAlpCNhCjQ0/LeNyItyZhRKkNDA5wTWtvC3y2
         +Nq0EdJkg+XhTxGVcRHqtl4AvWWIzujQM7iUT9LSV3VhLSSC9O2WQC3lK80Gio0N9JHF
         o6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741073478; x=1741678278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsNGbnsLqSkU3I8v0oKk58JnonHmFCpGP5Ckb34MbPw=;
        b=jlPiD3OWmJ0fNc+LmDvoRekzW6Ydy274SrOt4grrz6UJH2K4zChVIEZsa9IDELOsie
         rvcH8ERTneMaiUrQZEtL5uAKzczNfhjsHbLyzB4cCl300yS+lBm0V2vAF+PpLP/ZN6Bn
         GnzbdTD5f0ltB0psG0s/B4cE/6pwdrCV2LU6Czaa4uplhPqC4o88H3f5SSoAbVhZ2WqA
         oPb9+B6e/tSesbuMP05GNIoUOfwxVAJ++p9e2EFOoXLEVBQpgUNEbPn04bPyp++E6gte
         Cl9OYL9gsP46b1j6N6Qyh1d9drg6z70Lz4dvPnB3apDGUAB+Crr1Sas+7NUoP2fFVOhB
         e9Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVJ8cRjpjIftqcoopLS56Q7usuUvOLHEg6y4qr4d3lYMxNfvOnPHSQ78LRwE4jzJQZ+8eJymeiCFA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyFQrdSeZyszOVwJIQJQCdKl3VGm3G2ZdixQtYFgBJbJQMI/MIS
	I3U49Km3WW/G+OPM088WZoPQH1WARVzXOniguk9XqUSX5HJt8Oi26Oni2OgesoSK4lSk/1HKGj+
	Rp4RkXfYJG43YnNsUFnewOO2Mz851qqQ09qyUcg==
X-Gm-Gg: ASbGncsxdC28W9uHI/h8COQwIkvU/Qj6ntBZMV5jzxb41/yVY3ddGk3aZKqhhtuF9ua
	JoaaoI+fPIn4eMaJXPn2ds0HxxBLL5EFUblOmnWtEsw9udBvil4OszYGSw2S8dgDl6yTBBvEs3S
	j1IIObyhYIysed1/gngZ4Q/+oOIw==
X-Google-Smtp-Source: AGHT+IGXmA371lT7C1gO2PiMuw8QGq/Oxyz60NAUpFqe9NaMOJoZxgRPOUxapC7rGv2iphJZKsi+29SyMJYP0KghgcY=
X-Received: by 2002:a05:6512:398e:b0:545:b25:ace with SMTP id
 2adb3069b0e04-5494c3282cdmr5632664e87.18.1741073478093; Mon, 03 Mar 2025
 23:31:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250302-04-gpio-irq-threecell-v2-0-34f13ad37ea4@gentoo.org>
 <20250302-04-gpio-irq-threecell-v2-1-34f13ad37ea4@gentoo.org>
 <87jz97cml1.ffs@tglx> <20250303124011-GYA59067@gentoo>
In-Reply-To: <20250303124011-GYA59067@gentoo>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Mar 2025 08:31:07 +0100
X-Gm-Features: AQ5f1JqjLIt-xiSK5fnSqtY7c8S-APPE94mFjAG2-VPGFTkMlXbz-5UAA8K1r5k
Message-ID: <CACRpkdZn93oA6Tmi4EaWw9U=TAjEAdqgtK+2Ct_Nf1YUUrurgw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] irqdomain: support three-cell scheme interrupts
To: Yixun Lan <dlan@gentoo.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Bartosz Golaszewski <brgl@bgdev.pl>, Alex Elder <elder@riscstar.com>, 
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 1:40=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
> On 19:30 Sun 02 Mar     , Thomas Gleixner wrote:

> > Why is the three cell translation not following the one/two cell scheme
> > and has the parameters at the same place (index 0,1), i.e. adding the
> > extra information at the end? That makes sense to me as the extra cell
> > is obviously not directly related to the interrupt mapping.
>
> I think we currently just following the scheme with gpio cells order
> scheme, which is (index(instance) offset flag..), the index and offset
> are parameters to locate the irq which can easily derive from global
> gpio pin number, so I thought it's more intuitive to group them
> orderly together..

Right, the DT bindings are mainly for human consumption, and the
cells are positioned in left-to-right intuitive order.

If they were only for machines it would be another issue, but it's
people who have to write and maintain these files.

For example, in a library a machine could arrange books by
first letter in the title, then by second letter in the title etc, but
that would be very confusing for humans who expect to find
them in author order.

There are many examples of this in the DT bindings.

Yours,
Linus Walleij
