Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BAE26AF3
	for <spacemit@lists.linux.dev>; Fri, 15 Aug 2025 00:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755217028; cv=none; b=Sxv/tkkTXC3vOeEKI3BdlZbmX4GCClBZtrQCRciffoJkWOwW/ulcxhfDeZZ0vnfsS/2k7icW79l7xQ+VX3X7T19XH56vk2Tyh5212CWIlyUrxr8kyWbZtboP4FG0UEJg3E8DDbACmDddmVwm2ZP5ZwdNS7upHIpInPOSxm5VBgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755217028; c=relaxed/simple;
	bh=b/7uJluNZ2Dq5dHQa5IRA6PESh3vzrY/KnYcV2sm3Mk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s626iHrDyIh90TZoICYXXCY3dYCYpvMpCiOc3APu1KjusDfegVetyW5nozaMI/lKx+LskmNPsW5nrkSfbHSsgsYLrVLkcO+A52jKNUEdo4uxJhFOkt7ftZlmslk/dS64gZKyjXjziJY+fOZ7uyyzLoNCl92pJTJuw8lpl2XeQEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=DjkSz7+h; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="DjkSz7+h"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e931c71df7aso1532231276.0
        for <spacemit@lists.linux.dev>; Thu, 14 Aug 2025 17:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755217026; x=1755821826; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIb4DEw47nTG0SaTMqagi62gcLVr/AwhogL/DWZeO9k=;
        b=DjkSz7+hdC+fuNaZwn0SN5o6B6v+c5ek5BgPCN8NS/mjZb8VeEznFt8VQ46jJ8RQjy
         I+jjOGWUxSCxAXs8O2AfN5f/5uxs+lwQevsmuzUP4y/14qpJCn7BFNE+vzuHky+YdH5s
         GAAm134nz5ci0Bs5+n5gjuN8fMYaUF/DtbYAzwZ2GBKdcyaP9KciF1RE+7Gl7PDEYB7C
         pc+dvAAhFzWdHGySTZBlgzlBXn4FZpe2VI25T63qf8FOKZckUyvfG1oS87psO+Q/JE2I
         nNpROeiv+7E0XomdJ5dS2gQA3oHxJkUXD8SeTXca/JDjJc9qtDR5cD32POX7X81NECM3
         dAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755217026; x=1755821826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GIb4DEw47nTG0SaTMqagi62gcLVr/AwhogL/DWZeO9k=;
        b=rS+yP8Px38liMGgaHYRq7qNUE3vt9pBCA3XD6zCVhXu9G11rweK9tJr+qoJTxw1zE8
         8d2IHOS4i+QjWHNAO5tO3r6NL56ws3HjD92cz6PGQQMlkgzBfnqgzbtOOxv6iHbdo+Y5
         mndejLB+E0wKQjpTLu5F8CXMmNnYHdeekGCwMoKYGyNeT5XuGjducWqnJiC5AsE8Oohs
         pDP+P6VXo+l3FVqkjMbde48q2fG1khZ9N5FM541FdWDNkRu/NaqldYdVn1WocarxIkLt
         BpzIjnld2LzivZSTY6f4C7IxIFOzXDRonJxUXN2hzOM0T4Tb6HkKnUNR9MwOs5DFZJac
         CNAw==
X-Forwarded-Encrypted: i=1; AJvYcCXdwknCO6fIrUrK9ztF/lTcx4VVb58XhYJF97iwT2iopmYaqQn9GwKDT6LGJHcimnsaGPXtFzf0Uw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwOz487OcV8a1pvyajfbUGcTt+OW+Xj4AAUWLE7cHxO+xhFpPYb
	VuMe9WDbWntKqIKg+0gIUqA+T6CV6HaQexBMPbP1DqhP3Y08ykauH6jmxan9MW4Len+BAYLcAeK
	5RlJIk4mVHibq4lJ1wzQefcHIfGt8BIx2ddN/zxgl4Q==
X-Gm-Gg: ASbGncunEyOgkXnRdt8J5hGPj7U++cvNSI9F6mzjwL3WOxFC3xiHfMLwBtlRhebkdya
	dgoTqJXcHaIpBQd3HoHywe3mgxQ+gcVTmCoqNwoD6ssiA4yoblVhny0+CesMptjgiy7APGET3Bg
	0Pm6838LP0tjwhLsbrUau2zfFiCxn6BjSFbUOygQ4orhsEewey6MVHJiQaqhKNghSqlAEdvswLO
	7POpehc
X-Google-Smtp-Source: AGHT+IFNcAELmZCtW5xlsegSitNsfdTcRTdgg7kL6zgWJQdycJdLaDsFEfIH4/zktV/oPQX112UV7cBIiymlf91sbEo=
X-Received: by 2002:a05:6902:706:b0:e8e:120b:acc7 with SMTP id
 3f1490d57ef6-e9332110bd4mr348314276.0.1755217025789; Thu, 14 Aug 2025
 17:17:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
 <20250714-working_dma_0701_v2-v3-2-8b0f5cd71595@riscstar.com> <20250724123128-GYB748228@gentoo>
In-Reply-To: <20250724123128-GYB748228@gentoo>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 15 Aug 2025 08:16:54 +0800
X-Gm-Features: Ac12FXypsuzBkicYnVbqoq7E_JzqM7nw1pio2gCMjc_eN9bFRW8TFMqF6u8aHzA
Message-ID: <CAH1PCMZ7VbLxJbHQt4Ox_nO7yDSBMzTYiczC3FGBbG_oXgjLXw@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] dmaengine: mmp_pdma: Add optional clock support
To: Yixun Lan <dlan@gentoo.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alex Elder <elder@riscstar.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 8:31=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Guodong,
>
> I personally find the word 'optional' introducing some confusions..
> I can understand from driver perspective, it's kind of optional,
> but from SpacemiT K1 perspective, it's mandatory for this driver
> (the 'clocks' property of DT is in 'required' section)
>
> feel free to improve the commit message, maybe add some motivation
> hehind this

Thanks Yixun for your advice. I will improve it.

-
Guodong

>
> On 17:39 Mon 14 Jul     , Guodong Xu wrote:
> > Add support for retrieving and enabling an optional clock during
> > mmp_pdma_probe().
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> > v3: No change.
> > v2: No change.
> > ---
> >  drivers/dma/mmp_pdma.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
> > index a95d31103d3063a1d11177a1a37b89ac2fd213e9..4a6dbf55823722d26cc6937=
9d22aaa88fbe19313 100644
> > --- a/drivers/dma/mmp_pdma.c
> > +++ b/drivers/dma/mmp_pdma.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/device.h>
> >  #include <linux/platform_data/mmp_dma.h>
> >  #include <linux/dmapool.h>
> > +#include <linux/clk.h>
> >  #include <linux/of_dma.h>
> >  #include <linux/of.h>
> >
> > @@ -1019,6 +1020,7 @@ static int mmp_pdma_probe(struct platform_device =
*op)
> >  {
> >       struct mmp_pdma_device *pdev;
> >       struct mmp_dma_platdata *pdata =3D dev_get_platdata(&op->dev);
> > +     struct clk *clk;
> >       int i, ret, irq =3D 0;
> >       int dma_channels =3D 0, irq_num =3D 0;
> >       const enum dma_slave_buswidth widths =3D
> > @@ -1037,6 +1039,10 @@ static int mmp_pdma_probe(struct platform_device=
 *op)
> >       if (IS_ERR(pdev->base))
> >               return PTR_ERR(pdev->base);
> >
> > +     clk =3D devm_clk_get_optional_enabled(pdev->dev, NULL);
> > +     if (IS_ERR(clk))
> > +             return PTR_ERR(clk);
> > +
> >       if (pdev->dev->of_node) {
> >               /* Parse new and deprecated dma-channels properties */
> >               if (of_property_read_u32(pdev->dev->of_node, "dma-channel=
s",
> >
> > --
> > 2.43.0
> >
>
> --
> Yixun Lan (dlan)
