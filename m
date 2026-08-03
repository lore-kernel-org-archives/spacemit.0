Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4672A3AE18C
	for <spacemit@lists.linux.dev>; Mon,  3 Aug 2026 07:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785743227; cv=none; b=OTa0Dg1jH0j8x0gNJFaDas0Os2fjaA08J/b0Z/dDTusg/0HEXodBO6e8iZCVYeR3uj2hu3jiRtTljio3Lh80IZ+k1OrjhjtSaWjsS9Oy9qdUbZz7/8IsXA5+G6gzQF7pWQr4W4ddYGLEIavqBqe3Rev5XAEoCroL9fZulVexbR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785743227; c=relaxed/simple;
	bh=403dFbmwi2uDJ9XkHtGEBz3c5Zn1S63P+m2h+phsk/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mc6l4BqzMwFiLM8ahslw3Hc9SfnmeogV82SY41tUQzjIrIm1xc4l8IccgsXvqgJr4obkcSBd3fIqZfq8y6KjYz/MEj4eRramtjZPQ2OBHhfnvLLbbFzsGwL5z5PQ/aNQLM9OCGOOdjeKPqPW6EieBgHREx6Kj1F+13ILFzar4Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OXPevsoU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OXPevsoU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE4551F00A3A
	for <spacemit@lists.linux.dev>; Mon,  3 Aug 2026 07:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785743224;
	bh=403dFbmwi2uDJ9XkHtGEBz3c5Zn1S63P+m2h+phsk/s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OXPevsoUV/McDbWM8JESVVeHAhFzHyXmqCVMbaDReIsSeOMrou8KFdrNAPQyHelKD
	 kX1y0gySzEMqV0Pgl83V20ydNWVt1PNUHkeXzY4WisEGjRok2UCQbOgwJP86hlzwPr
	 wnAist7mTX/sUr+2E4egOg68PpYBT5wm453tlb5CeadFO6RlXMaOoER7Uxae+OD+dj
	 VAvjsC5BcjxqgL76o78qHIRK3xQnckAMMCK1N8YaNo2XH4c1ML6fJMawTXyqPCeN4+
	 UR2IOQDduhZeyFY5FY5Sz6fDdKdBGkCxCs/sefiV3q1EdPPaILRmnZgBjerJlsiFzM
	 kUaR2NgINs+Zw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b01cb18515so2697122e87.2
        for <spacemit@lists.linux.dev>; Mon, 03 Aug 2026 00:47:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq3Q5MGyk+NbZgYx06rG7tvwi11ZKJcneKXGVgZvlXimxw/cqfu1qPSEkDldCjZuMEOtl9Q/RkXkw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZLzuX02hoENkRQRCHsVeIhE3n7+7w1+ktFuz3h/OigzxdK4yz
	b9gOV4EXBmWnXCrFdZzYIqwwxLsfhfqLUuuSTI5ZhGG+mRGOZtRgu4qsehqK7pJhg2koaDSjEi1
	KDs3eBGWh39cqCTCGuXWi4upYzzBdmNg=
X-Received: by 2002:ac2:446a:0:b0:5b2:9b13:2cd9 with SMTP id
 2adb3069b0e04-5b2e4f8014cmr1179343e87.44.1785743223708; Mon, 03 Aug 2026
 00:47:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260729-spacemit-pinconf-validation-fixes-v1-1-edeaff398fb3@linux.spacemit.com>
In-Reply-To: <20260729-spacemit-pinconf-validation-fixes-v1-1-edeaff398fb3@linux.spacemit.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 3 Aug 2026 09:46:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLkh0BxaNksg8GzBKbhT20B5qutOAkBc5hMODmG=9uLy_w@mail.gmail.com>
X-Gm-Features: AUfX_mzUZKe_fim1woi5skXnfHo0SBeV2P3xbdCqiKquNyg0_pLWmtWIWfBu1s0
Message-ID: <CAD++jLkh0BxaNksg8GzBKbhT20B5qutOAkBc5hMODmG=9uLy_w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: spacemit: validate pins in pinconf callbacks
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 11:27=E2=80=AFAM Troy Mitchell
<troy.mitchell@linux.spacemit.com> wrote:

> Pin 0 is a valid pin ID, but spacemit_pinconf_get() rejects it by
> testing the numeric ID rather than the result of the descriptor lookup.
> It also fails to reject nonzero IDs absent from the SoC pin table before
> computing their register addresses. Check the descriptor and use its pin
> ID for the register lookup.
>
> spacemit_pinconf_group_set() validates only the first group member when
> generating the configuration. If a later member is invalid,
> spacemit_pin_set_config() returns -EINVAL, but the callback ignores it
> and reports success after partially updating the group.
>
> Validate every group member before writing any registers so malformed
> groups fail without being partially applied.
>
> Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC"=
)
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Patch applied!

Yours,
Linus Walleij
