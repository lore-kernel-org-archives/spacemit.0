Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B61623EA88
	for <spacemit@lists.linux.dev>; Mon, 20 Oct 2025 09:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760954119; cv=none; b=Y0FWwji6rr2erLel9Xym3a9eJVmA++6ReN5/S/jk4/bDBXDM/GGf4LCy5+8VH5fg7SLQsHD41Fe6MLcSU5Uy8MvGP2j+e7EbuObbceaiNF6U8g5Upkcvf+lzOH2iUzx1MnQDyhfupTZXiglJR2X9At9nk91jyhKrpxWpzjud6yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760954119; c=relaxed/simple;
	bh=ltNi0MhEYk2msw3rWtEl8refNJjhQym3ZLbABQDdz8o=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E301P+tDA1i6JotTFPi6+FMCokjyCLi7ymum4J81i2dwRlcos9ytcdnAd+uQyGgBt8xR5d4yUlhd25dyrtbgZPjrggoWddJRrvdQAI2nDiuniu4x7baIPTCoDU8X25O8xOZa0Ohl3xvYFahNTO0xZIEvrw4mOvDzmq0jCYWvlGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=AGeyKzYB; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="AGeyKzYB"
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 67DF43F46D
	for <spacemit@lists.linux.dev>; Mon, 20 Oct 2025 09:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1760954111;
	bh=mEBranLPBa0mzFLmxRJ9fx9ZSptWmlBhnJV3QiXyr/c=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=AGeyKzYB4CGPZcB6lRwMy85hy+xN8ceJZLD2WD3afZBFPFerH36rRid0cpUKGzggO
	 CP+JjziZhtasSsizWEsfrBsml3MyDsTegO308OyATm+3sxwliK2GtpRd+zkmK6Un77
	 GLXASFV7HRQnpscM1sVtFUAJqea3sum5Yo0P+Az46nzHZgAqm7n7tJXTXRKUZDUKn8
	 WLw6uU73CX5Svd9OXOFGklSiPpX7RZB9/2r+k7fGaelhlbAeNp9PyWU/6GfwAx7+Gv
	 LQZ0yTFZ/MbAdHzfzUvXwojiPIMg6ieYlkUXUdJtTyTbPn1i5wxCJsyiVGKkwUxxe1
	 5kyP9rhkN0qGnKMnHWGq2RLXzqeY1lkPdVL+TIJ8jQezDJlpFfLW/tV0zIw+MvFCbO
	 bH5ivfLIHR4igqEUITHg3ehbsFII8nZRK2d0rySNG5/JrmbyK8vIYjXXOh48uxCsN9
	 gTY7PGcfttmEA8XB0wr5l17vzpup7guBQz/G1YHcjGgLTpFbY2+MH9m48zmt3CSUjf
	 v4l8mqd6PtOCVg5SGlCf/19RQ/GzPgQD6NXogGo4m/9PwYXLRJ6jGcClcjPZ/qDLaL
	 TsGtCJ5vMK0Q0zj/6zHVMZjWW97t4hXDaK9Ti8Tn9qvPwvn6jBYLTdPPU2a2mwPiye
	 RLq7fcsvNMRrKjyHZcl0QtYc=
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5d631e1a2e2so8355285137.0
        for <spacemit@lists.linux.dev>; Mon, 20 Oct 2025 02:55:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760954110; x=1761558910;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mEBranLPBa0mzFLmxRJ9fx9ZSptWmlBhnJV3QiXyr/c=;
        b=Y8AAoYuVcx3BwatSt+s2YdTwEHhe7bu9Vg8yCtts7vsv0WIPhCLndIaGKuH3ydvF6u
         TciauD3FZlE6hghlRCrKi194yoHuGlHXAFB0U66P31QbVA82niqhhEyKdO3kks+l7UOz
         /P7rIFFm3m4BaBkrosGRl0foh3ronqjNRBhna1S2cmRJq7/TYsiCDrwuW2Y6/QYY8KSq
         keu4oMYma1s+KA4WF1egh1ZPrV5mDBF8r/k8KEQoFbgPv+R/pt+DrBl7GzY7zcgLpBUb
         s/MQB12+IzV2tBNPj3Aq3/dJkLf31IQIPANV6HG1PiNnbp+j55HKYQXFeOBfg1e1n3KU
         ygYA==
X-Forwarded-Encrypted: i=1; AJvYcCUb/t+D8oCK/3g1r8bjjP4zh5OL/0OKMKpd7tswPnDllf8u7AKupz/xxU24Zw8kknM07qOM29Ilsw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzK6zKBKUT4rL6DVD8rXja9ehh3zyCSEiZYE1tUNauEohNqppRE
	dxuCGW4ZPZXU9Z6bBxdT52CxEeR8rUVsggbFLpcRQ+I1Z24oMTrvkxKxfZBWx9i2Fvgj6ehOx1Y
	z9uexh8KC/nNnWy70MzdR1J/g6l06uazgz5byVd7NBh9SuJQsDEfnyZxGzd4YG3899E/AFYCVgQ
	BefwUmYCbaJPI93+b4ipxxmlRVjJgybQ+2HQ1BvQggYTuE8s6w+bk=
X-Gm-Gg: ASbGncuitTGXPG1B5kZ+QhLyTndKNddGgLMefM9C9AMRyNislOfY2i5EI4snltaQLcX
	+yfE/hTGkMd9Rn6Fl5OPeydiBrW4Ydg+0svss2SN3DiFGVcbShVkYVmM2x75XerWiZjLtB/abVi
	dDEovInU5OJD9UUyoJHlLE2CHyAs42YPvWXnKr1hHzpD6jUSx7hKlsqGFcO/GJphjOmmfH8i90N
	QdpixK3eq3NLe+a
X-Received: by 2002:a05:6102:2c8a:b0:5ca:714b:2dcd with SMTP id ada2fe7eead31-5d7ce77b197mr5090707137.10.1760954110378;
        Mon, 20 Oct 2025 02:55:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8U9dwM6qULSdCBv1qTum4Bp6zRtcLVxnBY4adzvxZNg4OxsHj3q1MDPNwZUFy1CWdBXERfTMV4CjpVWjcmns=
X-Received: by 2002:a05:6102:2c8a:b0:5ca:714b:2dcd with SMTP id
 ada2fe7eead31-5d7ce77b197mr5090696137.10.1760954110055; Mon, 20 Oct 2025
 02:55:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Oct 2025 04:55:09 -0500
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Oct 2025 04:55:09 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <aPXAyeDC7YXAketm@aurel32.net>
References: <20251019191519.3898095-1-aurelien@aurel32.net>
 <20251019191519.3898095-2-aurelien@aurel32.net> <CANBLGczi3GeaC4aWECV8NS-zqSHgRa-5onynz9fGsZeN8qgysg@mail.gmail.com>
 <aPXAyeDC7YXAketm@aurel32.net>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Mon, 20 Oct 2025 04:55:09 -0500
X-Gm-Features: AS18NWArKI2YauisXr79VuYk9B-KtJdQQBJvjv4Xg4AX0iHaDUW4DU_PmGIO6p4
Message-ID: <CAJM55Z_BzfRo5aKf2VrneTymSizwDQq6OfMK_LNgyoGjp43K8Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] driver: reset: spacemit-p1: add driver for poweroff/reboot
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Aurelien Jarno (2025-10-20 06:55:37)
> Hi Emil,
>
> On 2025-10-19 22:53, Emil Renner Berthing wrote:
> > On Sun, 19 Oct 2025 at 22:34, Aurelien Jarno <aurelien@aurel32.net> wrote:
> > > diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> > > index 8248895ca9038..063202923d95d 100644
> > > --- a/drivers/power/reset/Kconfig
> > > +++ b/drivers/power/reset/Kconfig
> > > @@ -283,6 +283,15 @@ config POWER_RESET_KEYSTONE
> > >         help
> > >           Reboot support for the KEYSTONE SoCs.
> > >
> > > +config POWER_RESET_SPACEMIT_P1
> > > +       bool "SpacemiT P1 poweroff and reset driver"
> >
> > The driver code looks to be written to work as a module, but here it
> > says "bool" not "tristate".
>
> I have just tested to build it as a module, and it indeed works that
> way. I'll change that to tristate in the next version.
>
> > > +       depends on ARCH_SPACEMIT || COMPILE_TEST
> > > +       select MFD_SPACEMIT_P1
> > > +       default ARCH_SPACEMIT
> >
> > If it does work as a module I'd prefer "default m" here.
>
> Do you mean "default m" or "default m if ARCH_SPACEMIT"?

Just "default m" should be fine since the driver already depends on
ARCH_SPACEMIT, but the 2nd version is more explicit.

A quick grep doesn't show an overwhelming majority of one over the other, so I
guess it's up to the maintainers.

/Emil
