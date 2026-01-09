Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D712335BAF
	for <spacemit@lists.linux.dev>; Fri,  9 Jan 2026 10:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767953552; cv=none; b=Z/R0mghQTkAocMSUyDL84CHjutYlpWKwpppUjWF5OU0CXJXIalho0H6c4Jvt/TgUPxU2rIYjCEx/42FEEMw5OjnhpoNMqelXAvfx9+JAEDuHP+8eID62nVw0kOCn2W2j+htPLSdZk7jxZ2/nip6q0Zs3/o+v3w+2T09WCgV4C+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767953552; c=relaxed/simple;
	bh=/T9YXxLBZhhcjEgy2U8F8hoAFjHAttxAaJCuCBXxuR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CMHWwXjIX6eb+hziBPMcd7BgrXQEyuvRQ167ijuQsmf2j6p2xaqPR9C8mC/YgbzJ0/r4NU9HX2evlntvAveZu0whIZyS7a0cM8bBqGd2cMC1BsyT0zuhdVDc67EW1lC6AioyNq0QqAuFjLw40CQWeLIqjB3ADh8s86gNYkJN5Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=lumQFGfQ; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="lumQFGfQ"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-644798bb299so3736175d50.3
        for <spacemit@lists.linux.dev>; Fri, 09 Jan 2026 02:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767953549; x=1768558349; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5UnQ4+RbLH5hA9T1G883ptw/7Yo4vuW1qZZcpMJdJQ=;
        b=lumQFGfQz8xB5Fxj0YauwTL6QdxxlSiD25Ny+B1VaEundG3JkRd7jGwZE7kDe/hQkf
         3kMXZc3wZtU38qq/C0WKvGp9Dk03Ith9I45AwNxnHD8MhesgYeXxPtiSdjmmUASHHj8Q
         oFjZhi47bynVki+bswadgC06BrhDEFwxp4k8XmxYwONC1eDXIlvR0Ea6ynKTExZDmyNH
         gNbEaY/t/xXhw2f/sIWsIfkEro67Uu6xNwkxXJsJZlB0h6nJ8rcxFTBIpdHr2UHHGJHT
         lmm40MKNTbX+95ehFbtGJnuFw9bDedtDqfO+YcYPwhjc9zSAhLPFB4N5h6Gq5pZZ5NmZ
         NHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767953549; x=1768558349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e5UnQ4+RbLH5hA9T1G883ptw/7Yo4vuW1qZZcpMJdJQ=;
        b=FqI5Awrm1rqjWDuQ7OpgRu2D79NpVUyAVDWLtaTpgPdK62zdHogW6SfG+dmaPXy3B6
         UIiP3M9enynCCAmjB6JA9W5OcdlcUHGcBkRF/wcFZo15A5297xNZpFaKwB2yErc/ijAG
         7ltW90ucENAvZJ3owiP32nt1oepw1MGyCgmYPEHaW42fQUyudkjoYK+yT4BgBBFb7vCk
         QVp6z1PTavmL/asZhCR0dnwSY27nONu9l+s1uk6Pf43ekNOpTEZ+qQQ8kgcn0fdr+siz
         5EqGwaezPX3+ogDupNg6gEBqF0vHTrBWXj0tCVkpxtWylFishJB/ql0Ovs/+i32zOJ2R
         VCTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVebUfH7iEvlk4YyRrqVG3gZPIc68fuXtXBeXw2XMGevKPTIAegZBHMcGYdyMYw5BENayUjEmAtQQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8XIiqLuSfkJtYgnNzZcEBxPLvKlxdV5JdIBVHSIYzugOoCjPT
	12u3MB+HpI0ORwi5jehHlzCsugnqNL89Eh1Yj/2oeu5K2JYEX904I6+2p8CMZSC6QmKpVjN1Hqz
	2foVNXWB98FNkJJINY24sXgff0ng8rrL4F9Z4hxD75g==
X-Gm-Gg: AY/fxX77QemjT+1DimJuZc28tJNbxaMLPSX4WaHAARLZhPJb7proxKrZgAX4/EDLTr5
	mmt/aCqnpOpLh8Y7/Q32jJ9UUeYvSO+tyOIZnB0+kfkdZNo6DxW2NFLZzqQpMN6rlURu7nBZiED
	uHorzkuVxxsbRs02gWwtpn3JyW7lHDOcyxSlQ4yxtdM60tH3OHkQMg9lcc8nSXAFC/c5HNxKo8g
	S13B5R6kPHcMlrWDtAZhurcroMvqaoQe4pBrYs8lXZdgd/tveBktZy43aGUJa9tOSca0misf667
	kVa3fF5nwm1u7JkvJVV+RvKCeTUQX9TJzQC4TIZVVeg=
X-Google-Smtp-Source: AGHT+IHwjyG2gHAKynms5yLd8dsoBN0TrT6WXnJJkvqrEPM5Oh9NnNxT58LAnnyarsoeqkwGZZAXFc3fOBsckE359B8=
X-Received: by 2002:a05:690e:1488:b0:640:d255:2d75 with SMTP id
 956f58d0204a3-64716c5ff62mr7691411d50.48.1767953549269; Fri, 09 Jan 2026
 02:12:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
 <20260108-k3-basic-dt-v3-5-ed99eb4c3ad3@riscstar.com> <20260109033608-GYA3681@gentoo.org>
In-Reply-To: <20260109033608-GYA3681@gentoo.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 9 Jan 2026 18:12:17 +0800
X-Gm-Features: AQt7F2ruyJZja2_iA58MgeCUcAeuWdBMOblJYXEsXdoTwjRnAKOiZA60duu51-A
Message-ID: <CAH1PCMYCLweVJ8WG2VY0jAk6UBuGA138urgfZV9+0fVeqmbbEw@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] dt-bindings: riscv: spacemit: add K3 and
 Pico-ITX board bindings
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Heinrich Schuchardt <xypron.glpk@gmx.de>, Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Yixun

On Fri, Jan 9, 2026 at 11:36=E2=80=AFAM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Guodong,
>
> On 20:25 Thu 08 Jan     , Guodong Xu wrote:
> > Add DT binding documentation for the SpacemiT K3 SoC and the board Pico=
-ITX
> > which is a 2.5-inch single-board computer.
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> > v3: No change.
> > v2: Use one-blank-space between name and email address.
> > ---
> >  Documentation/devicetree/bindings/riscv/spacemit.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Do=
cumentation/devicetree/bindings/riscv/spacemit.yaml
> > index 9c49482002f768cd0cc59be6db02659a43fa31ce..fe62971c9d1f4a7470eabc0=
e84e8a747f84baf0d 100644
> > --- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> > @@ -9,6 +9,7 @@ title: SpacemiT SoC-based boards
> >  maintainers:
> >    - Yangyu Chen <cyy@cyyself.name>
> >    - Yixun Lan <dlan@gentoo.org>
> > +  - Guodong Xu <guodong@riscstar.com>
> >
> sort by alphabet letter of first name?

Thanks for the review comments.
Sure, I can do that.

>
> >  description:
> >    SpacemiT SoC-based boards
> > @@ -26,6 +27,9 @@ properties:
> >                - xunlong,orangepi-r2s
> >                - xunlong,orangepi-rv2
> >            - const: spacemit,k1
> > +      - items:
> ..
> > +          - const: spacemit,k3-pico-itx
> if DT mainainer has no objection, I'd suggest to change to enum
>              - enum:
>                  - spacemit,k3-pico-itx
>
> although single enum is effectively equivalent to const, but easy for
> adding more boards in future (no change to previous code)..
>

Ok, I see your point. I can find there are other yaml files doing the same
style. If no other objection, I will change it to enum in next version.

BR,
Guodong Xu

> > +          - const: spacemit,k3
> >
> >  additionalProperties: true
> >
> >
> > --
> > 2.43.0
> >
>
> --
> Yixun Lan (dlan)
