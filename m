Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314901B422A
	for <spacemit@lists.linux.dev>; Tue,  8 Apr 2025 16:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744131572; cv=none; b=P1CON63PafXFVUQ578vjIASqknULfmwIc5ALvqCR4rTbj1FYg/2TpwFnRoNCBtMphog76RhWZEUFx598X+K8N8Ge66iGi2OjiozEb+qSyydYhVYBcui7meJW2dS+0tK50FbJqJLM21hY80petAIT40Hb6b386AbhnD6EXPoDgG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744131572; c=relaxed/simple;
	bh=EUen950rVlqD3ijE9T6pVem2TJoWkuc5INbmibM4S0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nvB2POZgtG3fjjphbe3UX8Di2S5E69nRRvMs6IcDH0azg2li7LA471ljZo4IXeKY2Yd5Gi9LODI2wOLPtcM6Ar9W/6uTETC1eR+7xxtqCDNCht0nb7o5S6MGyDOZrcuHGjyetH79vTKKuShu+RWZ7JWs9bMp1w1Kl7PAkc2tXr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=aRUACtVY; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="aRUACtVY"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5499bd3084aso5525157e87.0
        for <spacemit@lists.linux.dev>; Tue, 08 Apr 2025 09:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744131569; x=1744736369; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9bdlMTBH0pZP1vfIIBZfl68hQHlVUhTU84A0dLxWUE=;
        b=aRUACtVYUN/dxu1Xx77Du+AuUTGIp1X1IeEU8PZNd19RUUMmyx+d2IvSSnQBX0JvcV
         CnD1W44qg/xqdO8FlRfx28nBsnZZfCFLwmcsu/fERdvb62ToS6ZLwZgnQphuA1j+RSVx
         RNrqiwApDrNbCquyPqfOWQACxniJBFPLIGiCj9k9YKMmYH/tUHYVOKevsD4os/TLb36u
         HkU+bzztUFPd35ItCg88/yixxzKj1awtNiW8K6ZUXB+Y/2hEa9GFmIxadTxxd5HBGdtx
         HrhsGednxfRsm68HdKyI40OU1iwM8feu0bxQjdbsedmeO/hmM+CQlNJlFC+vSD01GkJl
         5Ctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744131569; x=1744736369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b9bdlMTBH0pZP1vfIIBZfl68hQHlVUhTU84A0dLxWUE=;
        b=SZhTfo7eGByKVI5J3lE660ijfCgvEZlEzQSMVnkRqBRSDxlZzWENPentCbcBGfXnO+
         t1XfzKuiz01o7XdoRhYd1b4iogZQHD8/zTU7CveFrEQVgvaA6jB1MQL3z3zpPNKA3ukK
         ZuVmwUxxo7I9oTQtH/DgkBPiPmx5FBsgJBu1LsxPCqhhktvaGmH6ZMOfEzjVWp5hUpMI
         XbRt29N6D3K90Iwh54OC33jsLbyusuF4BnMk1XmiHSV8fI5HSZ7KE6gmON3vmozb4E9d
         3yT58zVEda2yPVJIkkBQ74VODNlkYJzBSOC00c4+BAqndxxWEbPomElYHhiYVUPbEWDr
         wGlA==
X-Forwarded-Encrypted: i=1; AJvYcCXXki9Cfcvn0S7cwxVsyvabru1X1v5//8TuOBB9WFya4btiFrb+BW26w44xHxJWGvZ0bhvk8/yn+g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzg0upHktnSoe7RxsBqm1PjZAA4NteDOHgsn/8bCoj0gYlg6k2Y
	02lowZTgk2Z9o/z1jH+gONuA0FF7sn7utIiKw4n8D+l2zasPL6naBKJ5m/ddGT4oCHhV8l1jrnE
	8zIoIJPk5TOBWq23+0ZzYlFgcpmge9dySR/dHfw==
X-Gm-Gg: ASbGnctfDmiUVv/Iv6px6IqEz0Zwg7p1KdkAP8IQFEs1dsKkrZfsejrXzPSHAOfowS7
	BlutLQvNDE5hWT03yUVeKF4fuhoFGHvGqXmwtu3WeapbrXtsGYZP9KSOfApMbT6hWUtR2TPqKTc
	7/gKHPuIb7tPiakOC2ouXLalOyFtqc11CR3yO3XNRKfd6S0YLT3Rh6oOnr6g==
X-Google-Smtp-Source: AGHT+IFf+rKu3T7g4RXnGFAVwKLGYMFo6Zqu68CucFmhU42UIICJdAnEONryqtNi8mj8oclBDQsJoWOTWw94ILqOE3w=
X-Received: by 2002:a05:6512:33d2:b0:545:944:aae1 with SMTP id
 2adb3069b0e04-54c22767d83mr4780246e87.12.1744131568769; Tue, 08 Apr 2025
 09:59:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250408-04-gpio-irq-threecell-v4-1-fd170d5e2d2b@gentoo.org> <6790f337-8578-4ecb-b879-f5a254f109e6@riscstar.com>
In-Reply-To: <6790f337-8578-4ecb-b879-f5a254f109e6@riscstar.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Apr 2025 18:59:15 +0200
X-Gm-Features: ATxdqUFebT_4pyoTiD_cVWGxoRBkYoQNT5n1rg0F0zfP1Dh_NRC8OHcIuixy1l8
Message-ID: <CAMRc=MeEQi0rnr-mA1bsvAZu-NxqKp2Rjg9x9HYaSbuWY1seiQ@mail.gmail.com>
Subject: Re: [PATCH v4] gpiolib: support parsing gpio three-cell interrupts scheme
To: Alex Elder <elder@riscstar.com>
Cc: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 6:05=E2=80=AFPM Alex Elder <elder@riscstar.com> wrot=
e:
>
> On 4/8/25 10:11 AM, Yixun Lan wrote:
> > gpio irq which using three-cell scheme should always call
> > instance_match() function to find the correct irqdomain.
> >
> > The select() function will be called with !DOMAIN_BUS_ANY,
> > so for specific gpio irq driver, it need to set bus token
> > explicitly, something like:
> >    irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);
> >
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> > In this patch [1], the GPIO controller add support for describing
> > hardware with a three-cell scheme:
> >
> >      gpios =3D <&gpio instance offset flags>;
> >
> > It also result describing interrupts in three-cell as this in DT:
> >
> >      node {
> >              interrupt-parent =3D <&gpio>;
> >              interrupts =3D <instance hwirq irqflag>;
> >      }
> >
> > This series try to extend describing interrupts with three-cell scheme.
> >
> > The first patch will add capability for parsing irq number and flag
> > from last two cells which eventually will support the three-cells
> > interrupt, the second patch support finding irqdomain according to
> > interrupt instance index.
>
> Did you intend to send more than just one patch?        -Alex
>

That's alright, the original series was 2 patches, Thomas picked up
the first and now I'm taking the second through the GPIO tree.

Bart
