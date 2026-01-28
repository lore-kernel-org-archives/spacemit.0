Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD5636C0A8
	for <spacemit@lists.linux.dev>; Wed, 28 Jan 2026 15:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769614008; cv=pass; b=qEjoc/ELVRBDs+xtXhNqQXNP7MEaHshOxOnaPR+7jecGwrJToBIEtIAzIiv5Qynb4DMnE7Y8eKCenyg0eUM34WAl8Dy1lre6+5nn/qge1WKwcAhb2CPiAztQshKxtpLK80XUQE79ljWMJ5uDP+8MhqcM8SJB6pZ3+j/EJY/asSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769614008; c=relaxed/simple;
	bh=DlD9Jmb5GaRCSDuPAaTKKOgfm6MSSOaadIIUZJ+RbMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rot87IfHCYa3kNpNW80Pu73+ctlXH7hrTqUNFv1L/gG+U563wniXKTOZgKAFNc4cNCvMsNO1N73qmzrMn4y2MKEXVQnkwMOP1bdpgkmitYVGu9g0vjil0LHTbHELhQzJcMB9DfeBa14nfpPs681iLwrs0QAgX76dXpyNheGaoC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=c3QAnCMq; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="c3QAnCMq"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7947072d0f6so27095957b3.1
        for <spacemit@lists.linux.dev>; Wed, 28 Jan 2026 07:26:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769614000; cv=none;
        d=google.com; s=arc-20240605;
        b=DwzzgunRU8ffl0gU6aYTPl2t5NdB3hIzARkcZbH6RYX9+A5FanLt+xUbd2vxG3TwMA
         sv3rXC6eGH3bWmicQP7smnhJtI4hHvpEyQm4jYtQVRgqGGSMNc5FnPGr/nzc484rMjvx
         Fi3byDwGs6AdxHdBntRPOUNZHuUtg07juyCKt+9IASXN2rfKl2g3SMM1ODTxI2X19PEU
         g1mLcSyhTg/r/xEypDPVIL7l7bwZ5SpAvnEYAjiSFWAuXZUHn0SPc4GIwcxZAp9gn55j
         sp7owYmSiGaVZe3CZ16Q3Mw4Y7x/VLQnt73FDzH56F9Hvzcv0Em0+PVqRWI4H+rtZFtT
         MV+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0Dsm6BZo17gBRQFENmdqPMvpuqH/DjJGK39Lg1Meemg=;
        fh=56lKLDM8g0B4CLo3CuEMIY24Lcs0XwRCSb6D1+NpoV4=;
        b=hBVId+Y6PCyYwoQ0y2dpNe/JcvCnRMRsDZp5efRTAHNrn5YcSLTpHscl1KrA+sY7CN
         6fHrqrsEJbh504YXBrdWbgtxovzI6QRp7nrXpF/61wTqAe7P7uke90MugVp+5xa2faYz
         CU910Vo1xn03/ThXAb7YUA9/+EE1oPVKfqJc4DV30T3z914ugBVdO7eGZfmhaJ/RCAW4
         FEXgfStPdQQQeKieu0pGRxGpMOX4XDBLoO166PdcNwLCtCBwDjC1g/cAtaCakqi3eJIU
         FQC/u4vwQLpmZILFIX2keT81brLNJN9dEttQ2+knetcMocfcE3NVb+GVlUg69VXmVEGc
         +f+A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769614000; x=1770218800; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Dsm6BZo17gBRQFENmdqPMvpuqH/DjJGK39Lg1Meemg=;
        b=c3QAnCMqyo6oTiIcZ4Pg2NXAUbWuu8/+ozS8ifuic3Kqm+dyM8HSJZfAYRxIts42L2
         gWYOO3kCSFNxsS1RV/GoX8stQElNV3I8WSBgdCsX1Fhg5ZzAw2kkdIqHzfQmkg8oZCNq
         5z9ewGG8R5uKsETm5sIWHgHIPBDOzVLeBZIQlIUNVl9t/5Qd7w78DGacT5Pg0crOgrU+
         IBYFkX6Zpa0LSpyi9kRXmwwuJQVU5+vS7CWAO5XnMIimfUNJruQL2+bmg+S0ei5JPd/u
         gNasVr9L2Da3ZnihIVBbiTJcF9sgA5De5tFS06St2zJzK0GJhaaWfNj0/5TnlapgmFBk
         dxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769614000; x=1770218800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Dsm6BZo17gBRQFENmdqPMvpuqH/DjJGK39Lg1Meemg=;
        b=WU15xoGZS8MnI9JZts2ZYwV+5Iwwh+YbAMjAiLvZycwx/+ayw0ZNA5roO1ezpDMnDM
         ggfcu6Qz44eVIGxqhLD+jeFl5v3p1EfyV+1kMErfApwdt5PVEfZ0zLf4r9GIkFSLFdWw
         j70TUbcJThKtiKhDRFyjL1mDGnOX8azgGDebhIWPEVvk/voAKuYbUifTB+AFydjnP4WX
         kITAaI1wpVJAcvsVXGgQOC4FrHvSvBY6HtUx6isoRVHaDsqrbB/QvIJUA1OJYtvxleLu
         dI/y2YCnsYY2FA1EKg0udcrt6enqhPigRyVF7NJ63znsK9tMx9/FzGnSTx10Ac4rDUSs
         MIpg==
X-Forwarded-Encrypted: i=1; AJvYcCUuQ6ekUXAlg898FijCWyQH5Ys/FKYYrGcOuY/2QnV3VZIq6WQVJb9jp4MXjmJxjjlT0BqtBMQs5g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwIuHrhm+LnfTOifNX+LffY+QrsbsFzOttXvpyZp6QcwPkMsAit
	ZZ4PAp6/VpUimj0BizyZvFc7riTEXdrqNBjZGfibNwSqfjdbR8LpsAJaCb3DDIhbJ7zNYwtTQpA
	S59mNYn1QX6OMJy8riZJD5sJCn9WzBtOsVihfT58AT4Ux9iozCQa1ukGGz86h
X-Gm-Gg: AZuq6aKjrvbHSx1ULdarrJcb7kJnhSVF6nClz7TMNHVgL4Keh1+de12lBxK++4eU5xS
	y1nuBNMOeTzrEXEvIzYXUHadPtwpy3JtsYuXz04rzZeOi5yUXpbxGw0xgLl2Ss4i2wbYeq+aHPl
	tuIsyMG6IgU7a593k/bidan8Zh/78UVyonokG6fZnSPJ68PPIJXmULYECt8U3R9qu6ujm2DN2Pv
	ugxCxz4LgHacugeEXZDDb211oueteqc9gTYBnvQ/OZ5bd2DMR7ER5jjDzziZHtgBMe7qndpaOqr
	8U4MuD/JFpJX6YAsQtMc8lZYu8nYdbROn2WruSmj/hVb
X-Received: by 2002:a05:690c:102:b0:794:26a9:f9c3 with SMTP id
 00721157ae682-7947acaa3d3mr43960177b3.63.1769613999909; Wed, 28 Jan 2026
 07:26:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
 <20260124-spacemit-p1-v2-1-2c86b06694ba@riscstar.com> <501849d1-2158-471a-af25-da3dbb070422@riscstar.com>
In-Reply-To: <501849d1-2158-471a-af25-da3dbb070422@riscstar.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 28 Jan 2026 23:26:28 +0800
X-Gm-Features: AZwV_QgomjxoBBbY7bdQOSeCA_WHXLS0jMtYpjhysR3Ljanlh3cbjMNBBXCdn70
Message-ID: <CAH1PCMYWFhR-Np0-yq40eWqJbTmFub4qop6Wq2gA2mUqbJrtdA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] regulator: spacemit-p1: Fix n_voltages for BUCK
 and LDO regulators
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

On Wed, Jan 28, 2026 at 9:28=E2=80=AFPM Alex Elder <elder@riscstar.com> wro=
te:
>
> On 1/23/26 6:20 PM, Guodong Xu wrote:
> > Higher voltage settings were unusable due to incorrect n_voltages value=
s
> > causing registration failures. For example, setting aldo4 to 3.3V faile=
d
> > with -EINVAL because the required selector (123) exceeded the allowed
> > range (n_voltages=3D117).
> >
> > Fix by aligning n_voltages with the hardware register widths per the P1
> > datasheet [1]:
> > - BUCK: 255 (was 254), allows selectors 0-254, selector 255 is reserved
> > - LDO: 128 (was 117), allows selectors 0-127, selectors 0-10 are for
> >    suspend mode, valid operational range is 11-127
> >
> > This enables the full voltage range supported by the hardware.
> >
> > Fixes: 8b84d712ad84 ("regulator: spacemit: support SpacemiT P1 regulato=
rs")
> > Link: https://developer.spacemit.com/documentation [1]
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> > v2: No change.
> > ---
> >   drivers/regulator/spacemit-p1.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/regulator/spacemit-p1.c b/drivers/regulator/spacem=
it-p1.c
> > index 2bf9137e12b1..2b585ba01a93 100644
> > --- a/drivers/regulator/spacemit-p1.c
> > +++ b/drivers/regulator/spacemit-p1.c
> > @@ -87,13 +87,13 @@ static const struct linear_range p1_ldo_ranges[] =
=3D {
> >       }
> >
> >   #define P1_BUCK_DESC(_n) \
> > -     P1_REG_DESC(BUCK, buck, _n, "vin", 0x47, BUCK_MASK, 254, p1_buck_=
ranges)
> > +     P1_REG_DESC(BUCK, buck, _n, "vin", 0x47, BUCK_MASK, 255, p1_buck_=
ranges)
>
> This is correct.  There are 255 possible ranges, 0..254, and
> 255 is an illegal value.
>
> I think this bug is an artifact of a change I made while
> chasing an issue during development, and I neglected to
> change it back.
>
> Technically this is a bug fix but it doesn't matter because
> this voltage value (255 represents 3.450 volts) was not
> required.
>
> >   #define P1_ALDO_DESC(_n) \
> > -     P1_REG_DESC(ALDO, aldo, _n, "vin", 0x5b, LDO_MASK, 117, p1_ldo_ra=
nges)
> > +     P1_REG_DESC(ALDO, aldo, _n, "vin", 0x5b, LDO_MASK, 128, p1_ldo_ra=
nges)
>
> I would say this is not correct.
>
> The valid range of values in this register is 0xd-0x1f (11-127),
> which is 117 values; 0xd represents 0.500V and 0x1f represents
> 3.400V.
>
> Technically, all other values represent 0.5v (and could therefore
> be considered valid), but I believe those should never be used
> and intentionally considered them invalid.  If 0.5V is desired,
> 0xd should be used.
>
> Do you disagree with this?

I understand your concern about selectors 0-10. However, maybe you missed
this part:

Code snippet from the c file, Line 53:
(The p1_buck_ranges and p1_ldo_ranges are defined correctly.)

/* Selector value 255 can be used to disable the buck converter on sleep */
static const struct linear_range p1_buck_ranges[] =3D {
REGULATOR_LINEAR_RANGE(500000, 0, 170, 5000),
REGULATOR_LINEAR_RANGE(1375000, 171, 254, 25000),
};

/* Selector value 0 can be used for suspend */
static const struct linear_range p1_ldo_ranges[] =3D {
REGULATOR_LINEAR_RANGE(500000, 11, 127, 25000),
};

.linear_range, the number of valid voltage steps (selectors 11-127)
.n_voltages field, which defines the selector namespace (0 to 170, then to =
254)

With n_voltages =3D 117, the maximum accessible selector is 116. This makes
selectors 117-127 unreachable, even though they're defined in the linear_ra=
nge.

n_voltages =3D 128 doesn't enable those for operational use, it just allows
the full valid range (11-127) to be accessible.

This is why in my test for the K3 pico board, setting ALDO to 3.3V
(selector 123) or 3.4V (selector 127) fails with the current code.
I mean that leads me to this bug fix.

Best regards,
Guodong Xu


> >   #define P1_DLDO_DESC(_n) \
> > -     P1_REG_DESC(DLDO, dldo, _n, "buck5", 0x67, LDO_MASK, 117, p1_ldo_=
ranges)
> > +     P1_REG_DESC(DLDO, dldo, _n, "buck5", 0x67, LDO_MASK, 128, p1_ldo_=
ranges)
> >
> >   static const struct regulator_desc p1_regulator_desc[] =3D {
> >       P1_BUCK_DESC(1),
> >
>
> I have exactly the same comment about this change to the
> number of supported values.
>
>                                         -Alex
