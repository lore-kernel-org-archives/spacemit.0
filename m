Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F372F5A12
	for <spacemit@lists.linux.dev>; Wed, 14 Jan 2026 02:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768358029; cv=none; b=WTzLTNrtSRrlLDL7ZIFR8JZezoXaUQ48s8AZsDQgwnE8SX6R3PhasO76H1XtTKcntl+JCpv+HKn8uHc9rmE8u8ptgxBqgIJejaE/XOApB/dE+ZwuOwZbmggNeNlWfiuPjkZUey2xqffrHJCMaDhQcEdhS8uET+O4dhR+9Yqxl5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768358029; c=relaxed/simple;
	bh=3Y2xwxnB2VY5O7Wn7NdqLZLtOkwceaDGP163hwmg6x8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KPIz+HZQ4UIJVTxGgddTf134VfkJg4JlleWWBIEmHXCPZj99S55te6lfucUdnmk9T3gqJ0alKEi7SKy6IvHoNXfXFwQTTvY6Gk4FwQhhRZWRdOi4/WrTpQL6pKJKLCxPOsrB3eGitjTUnzBvUg6lUKeTEwoWTkbo4Nxbg6f0/jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=F6LYpCb/; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="F6LYpCb/"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-78fba1a1b1eso7639347b3.1
        for <spacemit@lists.linux.dev>; Tue, 13 Jan 2026 18:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768358025; x=1768962825; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJBLmrBE8O9239tGEOrHnRxNLRDKlAcLOjCyimagURs=;
        b=F6LYpCb/7Cui0ct3qhFYUWyzAHPYJaxn61C79Cr6/vTRXex43Y6YBiHr+gQ5JOh2U1
         dA6Wtk5L6VlNTVQP7NAOcSfGo9+bYyTVedOgHc5FQXJwjgl0q9T2JvYhPEslgvpUiKup
         yl5mWRQANyDqVoLUGgYOmnxvAldL+PAUqUsLEZENFVinlXJXs+48bjhSm5huS8+OhHW+
         OXD83gcKx+hgRMmCqwy168dZn27GHfZddnTZjtVK/4g+hdNw/caPyBpncvowq7lZLVk2
         mveutT8Ycy34d0KwQhZPOhDgZiApveXo1PeRPqWW9+EgCmvGuIrAKOO0oAqv1MKmS6Ng
         zViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768358025; x=1768962825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QJBLmrBE8O9239tGEOrHnRxNLRDKlAcLOjCyimagURs=;
        b=FNZjtGkWU0rGT6jxwfjod+D8bQ+WZloPMXGBLxHp8gOjyEzswrDG/6e8d1L8IsJYov
         963AYSIN57uCbfIs9akqAjv+TTH5Ll7Fm4ytCftSvZVK+TPdhigIMTkyv0PJGuAq/xfp
         hz/kigPYqPqvZLpkDiO5PMicUbxgN7it4lbQIxqzyR25KmO92gDS1buWFFNSuO/3Prid
         IlrKw/+L+IEwoBr9fnjsBb6Q90FumVy11zfcuiRuJPlZ+K8jEqfTklFpGV3RmefCsF41
         GgqN3RyahoF1wqGnohbneyOMBYFJfUBpvSapKXq9Pv4NJX/LT7Ufyo0lVoxvIAiDGUIi
         iZLw==
X-Forwarded-Encrypted: i=1; AJvYcCXAgCH0AFqdxWxXtGHFnwCs1V6v2wv2ig1YGIH/ZzBsC5Wu8mZ+vMGmd9+2Yv6zZJVfG1VtWX9EkA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzA0hgY0+uRBPlhpVXjLktJGOXqLrmDdFEr72/vDJfAa5S5ZGFC
	Y4GVRQZNJTi1YY4iUHzf0WnkTrEqNWNvakaI9SKSDK36C+5q64Mg08mWMQdGWwPqFbzDjphMPk4
	nIh9Nos4Rz5U0PSOKY9GOsSIXNXWCVsyqGSpm9Kbvpw==
X-Gm-Gg: AY/fxX6noQBGh5LOmyEUytWajmi/R92Rlzo/t9P5UCXLP7B9yBd8iFArwo416SS+4aj
	tZ3rSIwinpJpUVD+Y1r0OC9Z4roHhMqkf0dL5U83twRVyoBwo7kD6ACA1IysLL4qqXKj7f99Wj3
	emmaubi2QX52pvOpwUFW8d1nMq8P1+FShlN3rk+zj4ADTaq+bvxxSHq3VbKomGPEZS3zfQRV8p7
	c0pmA1vmLp7OC2Ton2nkeSOQvRHyXUOjKJgo4zwdD3IQM4eWQhbwRvJ5geXminCFwRtPg4sHKMj
	mjjpAjuFLZR438KseJf3YeGmoAkkGfucCdSzoQ==
X-Received: by 2002:a05:690e:d45:b0:63e:1563:4801 with SMTP id
 956f58d0204a3-649023ff038mr916948d50.22.1768358025225; Tue, 13 Jan 2026
 18:33:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260113-adding-b-dtsi-v1-0-22d6e55d19df@riscstar.com>
 <20260113-adding-b-dtsi-v1-2-22d6e55d19df@riscstar.com> <20260113075339-GYA25466@gentoo.org>
In-Reply-To: <20260113075339-GYA25466@gentoo.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 14 Jan 2026 10:33:34 +0800
X-Gm-Features: AZwV_QiwlJO3ZADv09NVm7VZL0Pi5fI-J1pRA-OmeKisX5gdDwuQlnWQ0Nwjwhc
Message-ID: <CAH1PCMarzrZJ072iyAQthB-i-LHFCSJ+tZLx6HcWiVcUrQeafw@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: Add "b" ISA extension to existing devicetrees
To: Conor Dooley <conor@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Junhui Liu <junhui.liu@pigmoral.tech>, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Conor, Yixun

On Tue, Jan 13, 2026 at 3:53=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Guodong,
>
>
> On 15:45 Tue 13 Jan     , Guodong Xu wrote:
> > "b" is ratified (Apr/2024) much later than its components zba/zbb/zbs
> > (Jun/2021). With "b" added into riscv/extensions.yaml, a dependency
> > checking rule is now enforced, which requires that when zba, zbb, and z=
bs
> > are all specified, "b" must be added as well. Failing to do this will
> > cause dtbs_check schema check warnings.
> >
> > According to uabi.rst, as a single-letter extension, "b" should be adde=
d
> > after "c" in canonical order.
> >
> > Update existing devicetree files to conform to this rule. Line balancin=
g
> > is performed where needed to improve readability.
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> >  arch/riscv/boot/dts/anlogic/dr1v90.dtsi     |   5 +-
> >  arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 256 ++++++++++++++------=
--------
> >  arch/riscv/boot/dts/spacemit/k1.dtsi        |  32 ++--
> >  3 files changed, 147 insertions(+), 146 deletions(-)
> please have separated patch for different SoCs, so they can go via

Understand your concern.

> their own SoC tree.. thanks

Conor, is it possible to take this as one patch instead?

It fixes the same dtbs_check warnings from riscv/extensions.yaml across thr=
ee
SoCs. Keeping them together maintains readability and clear tracking, IMHO.

Happy to split if needed, but wanted to check first.

Thanks,
Guodong

>
> --
> Yixun Lan (dlan)
