Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548AB2BD5AF
	for <spacemit@lists.linux.dev>; Wed, 28 Jan 2026 14:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769611634; cv=pass; b=tJ44mAK01t5oBSIoz4FLgXb/9WHoSpamldUzbb9iizZmbvSVcwj9IREMgL+cSEv7SnRVI3d9KyyZOS9ozC/scv5TgtUv5nVrQZBkO8ksyyN2yWBVZYgJ++jSVCVXvZykvHrcNnuCk+5SCwKnOHhJgtfVDWLMy8yYZKz1TGnh+hg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769611634; c=relaxed/simple;
	bh=09G///ul3AICFwsvGOczDjPPSqVpjJGEwL26TGSob6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s0prn5VmMz0o/if3Hz6KE7i9gG+CLfYTnpUzxzUXYrZw2OxOLrUarLgtAWjoIh9Tregkm/VOMYaoxOG/DRYm4cbRZNL9yNa1DJr1sF3yyWGBKH/MQfcHd4aSxgIZ2pRSuBKqnxHWnC0+2QeOp3EpqBef118kbgY8vvx2GrmR9wA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Rhawyxok; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Rhawyxok"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-78fc4425b6bso60431187b3.1
        for <spacemit@lists.linux.dev>; Wed, 28 Jan 2026 06:47:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769611632; cv=none;
        d=google.com; s=arc-20240605;
        b=lYg8Mf17NXJkN+xOh6VMBRByPRu4+2BGrQtBfETxjyBgd/Yr/sXr0lGdg8TbGsgFWj
         fkxUuSV9DrJFyDVuOlFYDcLsN3k+a5RyeHiN7Y9Kdod7pt264Q8CJV2rdKJMYwARi5Lj
         uclc5vVpaLkApR/vtPA5sax5WHIdeDWl41HwkKzkajeIXn165yFIdXlenvqBKMyUyJj2
         BeJ+s3nKvbr3QVE/AMm8cZIS+Q9LaXdFdz1qcda1GYJ9rtTJy90mMi7rrC6qjQAmJVqv
         NG1LPVegilWO/zF42QoBS7BI6d3kyy5WfXKsJ1QfwAtpxw0KqJNZoKSc/CNHrsWBmYfJ
         PQKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E6L9Umo/uP8ZQkG562utb1rtQO4EFo9vq+3Gr4Yf7Ak=;
        fh=sDlZzdtNICSpSDvXSlo6HcTgGg1LMtxBKVfOhUH+9po=;
        b=eDUEsnXHNuZcHkcxfZEec2O+qqkt1wG+WkTj73EGCCQhw8XG1U0L+7qk8nsjFlk/oO
         CKeoVByC7G7VI1jsyz/sZOEQ+Lmof7lMUSoRQ8wT/ZG2oJazBAed14JM3GS81r0qc6wk
         oYb32l8h6nGRXpT/+BE+4C1g6zvW618ASGHLxf2QLIwtuCANff7KoSvavRo+BxfnbXip
         98ORZYfdwcL76qgapcN9WxTxnRsvhQ4mA/aMaAdMxM6pXjfl25ZifF5LyXuAHWSIKfp/
         rM5d2yCtZebUDf/R3PlRdxaIWhonssPChW4f3nCEpTyqgnn3W9ar4BnnmhxLh5zmqEfG
         eWRA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769611632; x=1770216432; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6L9Umo/uP8ZQkG562utb1rtQO4EFo9vq+3Gr4Yf7Ak=;
        b=Rhawyxok5SKNRxi7HaSoyEDuM1Py3EWukFedWzKt8eucZWZz8sknuBAmLwBU9grEWL
         cYyy+ttyY3L/MzsCsU5s0jjKxSkhO+4KVwd3I9MTsFmvuD2SxFr4uJndYGs9f9fkeM8p
         SwElaqmJAz8O7wP6x1kllo23XW6yHMHjMbOhzrYmnnsdvov40nr7sfqF78asjE8oz8sg
         JX6sTQRAqJMaSaWi3jfHvHv7wOFT2tUfq9yK7S7871QtT711k4nO+7FbFKalzPp88jKh
         Ws4Inll9vsRwJc2IkHn+eEc3/0KJNxjqNqC4SByIkkHmUVGyO/4eWACS2rGbMqooyxtm
         SlaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769611632; x=1770216432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E6L9Umo/uP8ZQkG562utb1rtQO4EFo9vq+3Gr4Yf7Ak=;
        b=lSXvUALjIwbFWbRoxV3cqPn57mQMOsqWe96BQ/aOvNQ+qdb7u8VOAn44dZdsIx2NTu
         x6dYgLDEFZtASdDYrPn/hm2PAwbNWG3iuenZpz/gKdUQsQWXz31Wff3rD6bxNWD9vIOK
         ha5rHBmBhA04fT7/JxusFMl2mw8IoxubCmrtK3hd9Yo0fRRAolrArKBAXH17fjggtDSM
         h4LxaE0AXIxVkiOY5Zwfn+IlJcZ1DvVWLCK/yutSRu9bkYx6lxBdRRa9Uk75Gh97OzHR
         IvY7eqMyYnmiuvIhvbOKMH5udr1QI0lsjXmwU3F/VqE5v2TLyfWi6Siy8y4hZvARxIxV
         zl0w==
X-Forwarded-Encrypted: i=1; AJvYcCVKKI7q2YTdvWnVslY8nwZor0hjot4gJ7ktjGoWwkQheC1YyIrMUQtsEF8TewqVWkgJaQcUYGQdsA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhPspqE40/9L4PGII4Cf99iPZM2GHj3LMBDJ/ur7P3AF+1pZ+6
	AMsfdnsb+VpBNc/b+nmk+fjqVHuMUZx+o3niuy4wqwB5d7u1xMjjSXnCvtZN7296EthIKd+6yQm
	vR0kChKZ3v7xh4iIUq3wYhdzX8glUudms0gCvoZkulA==
X-Gm-Gg: AZuq6aKL4zkbdSMcLs7TI82scIZw4l3O+OqSCvPuqSqu5q5Y5JoSvW5NQUOj184xcmW
	2iTwbkXDtfVssc2sQYuXfvHocbjA3v1K7V6sEHha5PwN1dPsQV6QUJX12rJjBj47wQ8G3rHGdw7
	qN84/72KUHVbX4f66+NY0lxMrl99CU+dFWpi3o0I4RsdjPc5l4fyj1ARejKsmRhM1icaZpOYFQY
	RASrCYNd30AaocptHd5Yffr3Gai3JmCN3Gt504JfBshZNMPsyXeapqJYVXrHdRUz4Vj/45Y2wxC
	+6ySXA1F8wG2PYyZE8sWnaNF7+5j1xqUb3Npct9ueyxQ
X-Received: by 2002:a05:690c:a7dc:b0:794:1eee:608d with SMTP id
 00721157ae682-7947ac02895mr29873107b3.32.1769611631995; Wed, 28 Jan 2026
 06:47:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
 <20260124-spacemit-p1-v2-3-2c86b06694ba@riscstar.com> <4395bea9-44d7-4f0f-81d6-c1e05976a308@riscstar.com>
In-Reply-To: <4395bea9-44d7-4f0f-81d6-c1e05976a308@riscstar.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 28 Jan 2026 22:47:00 +0800
X-Gm-Features: AZwV_Qgr9cFTrml5EGU3f-mMndB_n-GeOjeWwN7e29EUvpE6R5XaRFfNWtlDbRE
Message-ID: <CAH1PCMa_wxX_0YX0=3uMpKpE2FQ=COPafAL-tyJv3Y9kjdAujQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] regulator: spacemit-p1: Update supply names
To: Alex Elder <elder@riscstar.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Alex

On Wed, Jan 28, 2026 at 9:29=E2=80=AFPM Alex Elder <elder@riscstar.com> wro=
te:
>
> On 1/23/26 6:20 PM, Guodong Xu wrote:
> > Update supply names to match the P1 PMIC's actual hardware pinout where
> > each buck has an individual VIN pin (vin1-vin6) and LDO groups have
> > dedicated input pins (aldoin, dldoin1, dldoin2).
> >
> > The supply is a board design decision and should not be hardcoded to an=
y
> > existing power source. This allows boards to specify their actual power
> > tree topology in devicetree.
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
>
> These are good changes but I have a suggestion on the way
> you define the DLDO descriptors.  I might be mistaken but
> I think you should make this change.
>
> Aside from that:
>
> Reviewed-by: Alex Elder <elder@riscstar.com>
>
> > ---
> > v2: No change.
> > ---
> >   drivers/regulator/spacemit-p1.c | 25 ++++++++++++++-----------
> >   1 file changed, 14 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/regulator/spacemit-p1.c b/drivers/regulator/spacem=
it-p1.c
> > index 2b585ba01a93..57e6e00a73fa 100644
> > --- a/drivers/regulator/spacemit-p1.c
> > +++ b/drivers/regulator/spacemit-p1.c
> > @@ -87,13 +87,16 @@ static const struct linear_range p1_ldo_ranges[] =
=3D {
> >       }
> >
> >   #define P1_BUCK_DESC(_n) \
> > -     P1_REG_DESC(BUCK, buck, _n, "vin", 0x47, BUCK_MASK, 255, p1_buck_=
ranges)
> > +     P1_REG_DESC(BUCK, buck, _n, "vin" #_n, 0x47, BUCK_MASK, 255, p1_b=
uck_ranges)
>
> That was a simple change...
>
> >   #define P1_ALDO_DESC(_n) \
> > -     P1_REG_DESC(ALDO, aldo, _n, "vin", 0x5b, LDO_MASK, 128, p1_ldo_ra=
nges)
> > +     P1_REG_DESC(ALDO, aldo, _n, "aldoin", 0x5b, LDO_MASK, 128, p1_ldo=
_ranges)
>
> As stated before, I believe the 128 should be 117 here.  (If

I will explain this in another email.

> you change the earlier patch, make sure the change to 128
> doesn't persist here.)  Same comment for the DLDO regulators.
>
> > -#define P1_DLDO_DESC(_n) \
> > -     P1_REG_DESC(DLDO, dldo, _n, "buck5", 0x67, LDO_MASK, 128, p1_ldo_=
ranges)
> > +#define P1_DLDO1_DESC(_n) \
> > +     P1_REG_DESC(DLDO, dldo, _n, "dldoin1", 0x67, LDO_MASK, 128, p1_ld=
o_ranges)
>
> Why can't you use _n here like you did for P1_BUCK_DESC() above?

The naming follows the P1 pinout definitions in the datasheet [1].

Unlike the BUCK regulators, which have individual input pins (e.g.,
VIN3 for BUCK3), the DLDOs share power inputs. For example, DLDOIN1 (pin 17=
)
powers DLDO1 through DLDO4. DLDOIN2 provides power to DLDO5, 6 and 7.

Since there are no physical pins named dldoin3, etc., I can't use the _n in=
dex
for the supply name argument like I did for the BUCKs.

Datasheet pin examples:
8 VIN3 PWR Buck3 power input (1:1 mapping)
17 DLDOIN1 PWR DLDO1~4 power input (1:Many mapping)

Link: https://developer.spacemit.com/documentation?token=3DT1Btw2BdiiSlSXkA=
dibcoMetnag
[1]

Best regards,
Guodong Xu

>
> > +
> > +#define P1_DLDO2_DESC(_n) \
> > +     P1_REG_DESC(DLDO, dldo, _n, "dldoin2", 0x67, LDO_MASK, 128, p1_ld=
o_ranges)
>
> So this is generalizing the input, which is good.  The use
> of "buck5" here was a Banana Pi BPI-F3 design and but it
> doesn't have to be that way.
>
> >   static const struct regulator_desc p1_regulator_desc[] =3D {
> >       P1_BUCK_DESC(1),
> > @@ -108,13 +111,13 @@ static const struct regulator_desc p1_regulator_d=
esc[] =3D {
> >       P1_ALDO_DESC(3),
> >       P1_ALDO_DESC(4),
> >
> > -     P1_DLDO_DESC(1),
> > -     P1_DLDO_DESC(2),
> > -     P1_DLDO_DESC(3),
> > -     P1_DLDO_DESC(4),
> > -     P1_DLDO_DESC(5),
> > -     P1_DLDO_DESC(6),
> > -     P1_DLDO_DESC(7),
> > +     P1_DLDO1_DESC(1),
> > +     P1_DLDO1_DESC(2),
> > +     P1_DLDO1_DESC(3),
> > +     P1_DLDO1_DESC(4),
> > +     P1_DLDO2_DESC(5),
> > +     P1_DLDO2_DESC(6),
> > +     P1_DLDO2_DESC(7),
> >   };
> >
> >   static int p1_regulator_probe(struct platform_device *pdev)
> >
>
