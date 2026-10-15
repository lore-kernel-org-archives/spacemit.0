Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D4854B1D7
	for <spacemit@lists.linux.dev>; Thu, 15 Oct 2026 17:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792084046; cv=pass; b=TG9xqb2y7XnNqhDiUJxXvhm5f33ljP8H/l7ps6V7hrLnoCxNTWTC+72pzRW//S8b7cRvTIgA0/H/6WshwxT/4YyHxpHMXwioMFIvFEY9Sro67p8omBZXN+F4RlaNJmbbpo8AjoVf2odLMRZHJrnEbmi01kyCMsXu0Bgl3yEiyLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792084046; c=relaxed/simple;
	bh=TQWSF+hQXVkwcjIKu5CbKZ1m9kqfy6YQdFbRnYAAUMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ptdewj54U9FmANHXsh+u71DBdLyohDLPxnt0kvvv0pg3m2ZD4VJLfMJki4Zty7hNrE0bHQGCCV5oLTclxHYxSvCRQcSrO+n4MiS2roAtRRx3ZXV1JCoYWGrwn3zMsMgRd6SPQacTEFaHjHbEUxx+rFnTYUhpoNzT2afr0LvXoQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hbBUrdRs; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbBUrdRs"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6798eb0d190so1757605d50.3
        for <spacemit@lists.linux.dev>; Thu, 15 Oct 2026 10:07:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792084034; cv=none;
        d=google.com; s=arc-20260327;
        b=AnQPIbG9fSnh5LwLQujd87DDxzDcIwQQi6HNOKlYg1VLRIYalFXR++znZ+9cysQsbS
         q9KLHrCfZTSmMranp6FQiWLrpsKDt/3kJ2v7i677NshVQ/nhk0y8glvZYbIspb4QwEOY
         owFq09BRvGyiijg/irxakY6YFbBI5m2UZwOIqXuVqnijW+blRyXtW/NF2pxcGW/9AOcv
         NdqjGK8NNPkF4BAag5/FEndHvvpX26+hxMA0bIDN6mYbmm7BT9yco37TLuNOzt+uZBHs
         2Kt91vpZJUjTSqbq6b8ZD5ebeUB02WAIW5Ui7pQjx2zHfTUpZF116YwM1eU8CEePLdH4
         kv0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NVmHsDqBQJBCxGh36k+fMkdYB80rlDP45cvKKDDFmfE=;
        fh=7dgd9hYBkKe/6Et2TOeDhVfRFsW1CxBqSxJx4bNnPtA=;
        b=Q4bJJ1H8WSNNbXc2MZwopGpt7AyFJENALkghmtyBf7okhkIz9Po3i9IDTtxJPogkGM
         CffJNcN9vZttf2Jr97wBXredKxO273F9KIJT1GGCANan3CyYQ12PktAVacPK/Rhci190
         sglOPDB5BAQZy9T0VrM1NS7HNq3HjBk0KTjpeeZDPwunX8C/g1NtBbad3lXYc3If76mO
         XKrjATYzz1Nh+nkDlD8jOHnGhJXSimHmqmMYbuSUoEjAyNo17ThT4Bup3KPAEkqsOK5d
         DBAco2wKk/SlGlOcjDk2xu7KrNhjGSiI7Ur1tEd3HCbdOfi2Nh44pFiWMQQW0qEYRWF2
         T9lA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792084034; x=1792688834; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NVmHsDqBQJBCxGh36k+fMkdYB80rlDP45cvKKDDFmfE=;
        b=hbBUrdRsmYeR5937tX/LTNqkJYPA3JA8Q/KMQIQk1E/jL4wmO0bkPxHzIVN5k2Yc13
         xRZPZhK3aXw9svgMgXmrCnhg1zLHc8gxtb+ckc/rQRn4Ph0lSsG66jz9rIR8vCkQoKWf
         3wOhnO0r3YaaW7y5m4sTSTYdISKqGuKhIsewLSrNm6dT1kTj/I5IcW9HbE/v9vFpNMOg
         OZMXtgVrmH7hDtUiIiy9/90fwb5s8eBy9UBL3CUYx1WypQQ5c7W0ag68U+Dv3J09hx6k
         T3nBs+T/Pf2Euf56LDoG8ZdWbYDgagvEyxZIGWA3plCUoFXtuTdAKZNmiqNY3qYsMa1r
         Voug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792084034; x=1792688834;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NVmHsDqBQJBCxGh36k+fMkdYB80rlDP45cvKKDDFmfE=;
        b=klP4rvGmGW0niH88NLZdYCAwAqQ6VseHvi3gVaH7r7sgVi3UpO+ZKqJ5UAcxvPdzZr
         LrLJnImq801w29As8/Kolz9JX+zN18cvH4uxGb02iXjZFizln4jy5a9YNfas12XG1Bmr
         vTgaFlLwd6tZyQKcCdu588gzNrGcjb894OEGmZezP4qKnyffuzBPQgYgIX80RTZ3Qjli
         RTgdJQiXqooZO5qHlTPAAwpChyfN8pBhjduwQCqdrQMeJ5msuSpbf725ZJClLJjAErPp
         6tgkG1VYjX6N6ISSvlKTkzppJn7D6dSZh/HDEV1wXPu7Fs038P8/g+BEGSBQoicO8yFS
         AL1w==
X-Forwarded-Encrypted: i=1; AKwUvBzxZZKZNcF8QOmZsqSCLieZPzX7dJ7u1p6q/L9feYLIEOc40gHCanzJPtQVZOQ05B5ohJajvVX+qA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJDQZJW8t0O1uXvemXlxVTg/j8ukYWGtZrK3mwqBA0Ag1Vs+grl
	prW22vs4CCsf/aTR/nAQ2q5IU6GYmp0HP64TXvB2SK68u3TWbhqiYinCc4mfOJ8Zg3dwizvDrye
	dsOw4mva2vzjrsBHSJMFYnKHUaEGiGmU=
X-Gm-Gg: AYBFou1logWMKN3ghTxdsvUAzbHeZE5baFXlSl9o9BDox0VEmnw4CbllLDIwW3YaVrw
	eZC7kP9ZivBfoLQTy2YyeQmNMb2GmM0JWN2b4+e1RtTc0Dyt2J6PJWEfD1JhTvCCZRqj5MdQvU1
	xVvcuUykV8LeCO1Y++5XB9UwnULedy9yMg3VL1oukVYPX1gxSpffk1PoUn4P2LEJYAuEqK7IYZJ
	qmwL7dozzm9w65/NZRAWMB6s0FgRKg94jLUtFcMcZA6pYYeBLxzrL6pbIqBqFTgjRluL/gbaXK8
	E+kkwMe+PGLqQLVojO4USz8miNRbskEWkwotv/7ctFSukgHESA/yiAHJ
X-Received: by 2002:a05:690e:bc5:b0:679:8da6:28cf with SMTP id
 956f58d0204a3-6798da62973mr1956198d50.98.1792084033716; Thu, 15 Oct 2026
 10:07:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261008-04-k3-pm-support-v2-0-6f778a53dd2d@kernel.org>
 <20261008-04-k3-pm-support-v2-1-6f778a53dd2d@kernel.org> <20261008-df80c21d73b287d09b6baa78@squawk>
 <cbba422d4ba9bd4a036536a50fadc2760efa1ae2.camel@icenowy.me>
In-Reply-To: <cbba422d4ba9bd4a036536a50fadc2760efa1ae2.camel@icenowy.me>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 15 Oct 2026 19:06:00 +0200
X-Gm-Features: AclHuK8t02_cYn6UunMFOXXUfkheTlCkH2rjdH9KDS5vlihve2Jh2xK0A1qMWCU
Message-ID: <CABdCQ=MQ5soNSRQ97aOytYCjtKpqZJ0frP3mqh+mL2Dsw+A7Gg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: power: spacemit: Add power domain
 controller IDs
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Conor Dooley <conor@kernel.org>, Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 08, 2026 at 03:44:29AM +0000, Yixun Lan wrote:
> Add initial power domain driver support for SpacemiT K1/K3 SoC, The Power
> Domain Controller is SoC internal module which is part of APMU (Advanced
> Power Management Unit), it is responsible for managing power across multi
> power domains, which includes power on/off, isolation, power-on sequence.

Tested on an OrangePi RV2 as part of basic enablement for the PowerVR
GPU. An RFC series for basic GPU support will build on this.

Tested-by: Iker Pedrosa <ikerpedrosam@gmail.com>
Reviewed-by: Iker Pedrosa <ikerpedrosam@gmail.com>

El jue, 8 oct 2026 a las 12:31, Icenowy Zheng (<uwu@icenowy.me>) escribi=C3=
=B3:
>
> =E5=9C=A8 2026-10-08=E5=9B=9B=E7=9A=84 08:27 +0100=EF=BC=8CConor Dooley=
=E5=86=99=E9=81=93=EF=BC=9A
> > On Thu, Oct 08, 2026 at 03:44:29AM +0000, Yixun Lan wrote:
> > > Add initial power domain driver support for SpacemiT K1/K3 SoC, The
> > > Power
> > > Domain Controller is SoC internal module which is part of APMU
> > > (Advanced
> > > Power Management Unit), it is responsible for managing power across
> > > multi
> > > power domains, which includes power on/off, isolation, power-on
> > > sequence.
> >
> > You should prob mention that this APMU is already documented
> > elsewhere.
>
> Maybe it's also meaningful to mention that APMU already has #power-
> domain-cells property, because the first reaction of me is to add such
> a property (and then found it already there).
>
> Thanks,
> Icenowy
>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > pw-bot: not-applicable
> >
> > Thanks,
> > Conor.
> >
> > >
> > > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > > ---
> > >  include/dt-bindings/power/spacemit,k1-power.h | 14 ++++++++++++++
> > >  include/dt-bindings/power/spacemit,k3-power.h | 12 ++++++++++++
> > >  2 files changed, 26 insertions(+)
> > >
> > > diff --git a/include/dt-bindings/power/spacemit,k1-power.h
> > > b/include/dt-bindings/power/spacemit,k1-power.h
> > > new file mode 100644
> > > index 000000000000..41ef540b5c44
> > > --- /dev/null
> > > +++ b/include/dt-bindings/power/spacemit,k1-power.h
> > > @@ -0,0 +1,14 @@
> > > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > > +
> > > +#ifndef _DT_BINDINGS_SPACEMIT_K1_POWER_H_
> > > +#define _DT_BINDINGS_SPACEMIT_K1_POWER_H_
> > > +
> > > +#define K1_PMDOMAIN_VPU            0
> > > +#define K1_PMDOMAIN_GPU            1
> > > +#define K1_PMDOMAIN_LCD            2
> > > +#define K1_PMDOMAIN_ISP            3
> > > +#define K1_PMDOMAIN_AUDIO  4
> > > +#define K1_PMDOMAIN_GNSS   5
> > > +#define K1_PMDOMAIN_HDMI   6
> > > +
> > > +#endif
> > > diff --git a/include/dt-bindings/power/spacemit,k3-power.h
> > > b/include/dt-bindings/power/spacemit,k3-power.h
> > > new file mode 100644
> > > index 000000000000..519fbf946312
> > > --- /dev/null
> > > +++ b/include/dt-bindings/power/spacemit,k3-power.h
> > > @@ -0,0 +1,12 @@
> > > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > > +
> > > +#ifndef _DT_BINDINGS_SPACEMIT_K3_POWER_H_
> > > +#define _DT_BINDINGS_SPACEMIT_K3_POWER_H_
> > > +
> > > +#define K3_PMDOMAIN_VPU            0
> > > +#define K3_PMDOMAIN_GPU            1
> > > +#define K3_PMDOMAIN_AUDIO  2
> > > +#define K3_PMDOMAIN_LCD0   3
> > > +#define K3_PMDOMAIN_LCD1   4
> > > +
> > > +#endif
> > >
> > > --
> > > 2.56.0
> > >
