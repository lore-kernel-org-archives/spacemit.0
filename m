Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36912641E9
	for <spacemit@lists.linux.dev>; Tue,  8 Apr 2025 08:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102785; cv=none; b=kA6ZmQioxz0ZcRk6bUMe6oCfwppTlQOOatGYxeXVDHdgS4W0alpkg9FUn+9MVlYXaXp7MheFiik0Rl6vVk3fMHSbKu3WMgh1B4szln2IgZQZtuBI0Z8CoI4H9YyrFJ6i5ObzU5KMq2PQgqqfTayElUXANELdQmIqOaAemqZa8bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102785; c=relaxed/simple;
	bh=lNiYZkdnErtTzxt0Uq6hCnSDgBoG7jrmCa6HXR2axIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WOEqUJSFTVZI8JjYL/HRtSeoTrllMN/Wvv7LcKgeRT8YQ9PUomiIXdo56j16GsKlFOat/3RcmGJ4rwNa94vAkqThRuufFAkYH189d7kZUwYZdPA0xluK1VP8kaprq4VKlQc7ZPq7roSvR0Zrhi8J5407hwT7ColnDZ+rO1nQCzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ocTMnoTq; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ocTMnoTq"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5499d2134e8so6520855e87.0
        for <spacemit@lists.linux.dev>; Tue, 08 Apr 2025 01:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744102782; x=1744707582; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1ti+glIs7kbdo7Cmb4p1nzhkGIqNEX/Na3aCrAR2g8=;
        b=ocTMnoTq6hufdMXsfk/391MgCpauddy2kkYa+EvNiU4OuupVMDoTrxEFeC3o3oNXWl
         OiDKoOwzq+QpaifvXZeL8qq4nrOgU2GEDY0ZXT/3g1VxgYNJbsWVmEP50uQNkMGYP9Iw
         nMcGCyOvOMq9olU88uIljMBZvG3B19Hnx/bbIt2WCrnUXj9Sbz4hjxqHmrwu4M0MIoR/
         k0auJrCHZ0TVsOsySCApF64nwFgPxvy/aI2Jx7bRn63C4lmusXwqeVOL2PrCqrxcYk2F
         8I/DQk+p3Y4EbpFmxFF/5AT7IY99BM8kOOgkIirFqGnGZTX/Xszu6mx5FomObdQNNYQ5
         axrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102782; x=1744707582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n1ti+glIs7kbdo7Cmb4p1nzhkGIqNEX/Na3aCrAR2g8=;
        b=plG/ICJxU9tL9gBvn1HIDr12ygXV7B5C/cCO0ee7KsJRyYVb0HLi+Aii/WztAI31IJ
         mYfMtfYSuaEsf+Zbq8kpRA28lnfvusyGUGR34wIGiy0DdpeDlsjTveyxK3bJV3okrDnl
         tPqr0DyEY3+01zFyjqaVQ2tWiUoRfY1qoQkvZeSXtr+rW8/OnhiL7tn6a8ng91vzWQR1
         0U3eM/+LpHtdRBSLWa2pN6Mn/erEvlgc/sQgk5pEq6NOkj8lx3pRbF9sMpOaP53EZNnp
         i9ibGD8aYovE5Yg0053hmLfKqAO3R5IqM9kYjtYFKnHpK4jd3ToPVwuuKOwo88Q+YzxS
         0tEA==
X-Forwarded-Encrypted: i=1; AJvYcCUxNYDQhAyQyJ2uTTtYVb1figTwl6xZgJdZ5GubT3XUyfLU0DqhM0sXakhTWszWPQOiECXsDPXmgA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxK8GJ0rXurp0ogGVDU21U8tNlLT9atbU8tuWECNPXKXvKey1kw
	ApNtcjVGerFKqxBzwGEVfGKnInAoec1ZK40ASTW+5b6qbQAo4pK8wYTOilefqHKseEFGTfoxCsN
	n3W4jw3Bi44a53C5FfTQqgH7xsw+EYbtPZLCNtg==
X-Gm-Gg: ASbGncuJ2crfdJct8sWvH5cQ9V68eo3VZ1s1IOlVUW4MFwQ9TE9pdINq/1uJ6MJRVk+
	hDWHjgcPEtPweBSVS9rshOaNZcWq3DB/E2I/kmsqhzN/nms7U3r0TfG3hk28TNtUZ9A0nJjUXE9
	nO/E7zHBUA65htO/5pSHHOn3ezEmfAPzx6I4pnawMBgVkdpsInlpTGVBiNqg==
X-Google-Smtp-Source: AGHT+IFhU+IhVBAJzBIMUxOBAo7QfFVW11UL24yOIyLgi1oINyxWjy4Dxkzmcdvr4r4k1H5XdlGKfbxf2ZKflqozVaw=
X-Received: by 2002:a05:6512:1328:b0:545:2eca:863 with SMTP id
 2adb3069b0e04-54c29836e84mr3493147e87.42.1744102781735; Tue, 08 Apr 2025
 01:59:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
 <20250326-04-gpio-irq-threecell-v3-2-aab006ab0e00@gentoo.org>
 <20250407103320-GYA13974@gentoo> <CAMRc=MeFK1gX69CWH2gkYUqkLU-KCOcwHcA+gjN1RXFA++B_eQ@mail.gmail.com>
 <87r023ujiv.ffs@tglx>
In-Reply-To: <87r023ujiv.ffs@tglx>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Apr 2025 10:59:30 +0200
X-Gm-Features: ATxdqUFtpGaiXd9grNQP3Ib6EubxTwZJQ656Dn7NldoLYjiAufIbT8WtF0ED4JY
Message-ID: <CAMRc=MdP09b-cm2uZeqbbCP20kNjQJ8CbXTXSTxQEihdoXjGJw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpiolib: support parsing gpio three-cell
 interrupts scheme
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 10:47=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Mon, Apr 07 2025 at 13:26, Bartosz Golaszewski wrote:
> > On Mon, Apr 7, 2025 at 12:33=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wro=
te:
> >> On 06:06 Wed 26 Mar     , Yixun Lan wrote:
> >>   I'd assume this patch [2/2] will go via pinctrl's tree?
> >> as patch [1/2] has been accepted by Thomas into tip tree [1]..
> >>   Additonally need to pull that commit first? since it's a dependency
> >>
> >
> > No, this should go through the GPIO tree but for that I'd need an
> > immutable tag with patch 1/2.
>
> Here you go:
>
>    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irqdomain-04=
-08-25
>
> Thanks,
>
>         tglx

Thanks, pulled.

Bartosz
