Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794338828;
	b=d76BtvrgUARm4qLrH+IJ2/l4QHvcVZCtWXaxXpY8D9xSv+H3jZ/tWLaKRhK+mbJwrz0s
	 o6gxMi7X4oRFxpoMAvA7yxFbdYW3viexUTD2CVNRBPml8+Vih58HRVp/CMrRjuuI/bRi8
	 I+CJkfwIjCU5n/0rWpVlNYW7vpwvgo2B13h1SJnAFi6ZNVQzY9sa7N4mLfZw6RFq12QWb
	 gYVi7iuFNq1oJt9RueLXTy6t2v6wz9fo6h6HN2NHgb8e603H7DN2bGrpczxZ+C7fvOy6D
	 wbfMrxVdPuQMQA1wANvGLN8mFaAH+i9svd3L7obTGvY3yjAUUYZyG+n0ZivbuoqGDgg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794338828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3BDn6wwNGszSOSWtixkkwMS4uvVtcI6x5Kvm71JPIW0=;
	b=HlHP4mi2NB/nBRBv32kAvpVWr6nhLHMyA6GhV8+8hpY9S20A9bzc+O0ympOaZqVrGkRF
	 QxP+XUuhopCd63koRiNEcxPMKtRVvvhI1QjQ9RR3aMQezNeJyxvOhEwA3f1yMFSJe8TF2
	 t9zQ0fHoiCA1dp6If1SEo6701zk2xKhHeK6EuOC2+1kR/AfvfvMNt9qKurxYo+BUz1biv
	 tHJH0dZrNM08lUq4Ir976idnKYRKnuPMdmLzn5aIZTCeF7uqi3bdDzKTZWAETCNbFCFLF
	 QluQygCUHLe2WhfBDN4PgB1O1o5DxvxJI2aPWvLAWDBv6jXbMGDO8501FfCcwFUTd9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gnhS9N3W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850A8606A31C
	for <spacemit@lists.linux.dev>; Tue, 10 Nov 2026 19:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 850A8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gnhS9N3W
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b2d14968c9so27325047b3.0
        for <spacemit@lists.linux.dev>; Tue, 10 Nov 2026 11:27:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794338827; cv=none;
        d=google.com; s=arc-20260327;
        b=HpKJUrn8nrsGFVYa6m2CDKbd6cwGp9DPTwYUNbyuvzcYjnepZjAhUEVHFdH1FEgGSp
         XlIQqPiPMdpxCnBCvlFeHFupe/wkjmkGZfWC5B0wrEx9rlXRksm/RuLDovbqr1UMntmm
         74Oc2UJsB+yVEsVrer21N8+3b1W32GbUTDXuwlicxVP+fcf3XD3UhEJDcnNOx2LX0849
         R01KP89pzMmWlRjpq0f5LIxVIKd7KDYcFhVM47n4rHh2m6jfSBAwf7NgFlW/sYR3o3zP
         gpMkiSw8CLLNJjJ2yfVBWyL0JuVzGFudtwoWULaFeDzFzT1SA9bRCJt2B5lxQlxWpQdV
         t72Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3BDn6wwNGszSOSWtixkkwMS4uvVtcI6x5Kvm71JPIW0=;
        fh=gRWcam7d1ol7F3JLKt5+MDdLhZADvOgIzJiRdq9Ke74=;
        b=oFWSg7HQD8iQRcVdL9w5XyfNMaWYBPbnqLRpB9Wixg+jzckp60DHkYZq0ACP8Jb3Xl
         GefC3F/MefEEj+wChkViOUTBjELSFL/ARvYEqyhXlDM9KmoelCr5Wr3fBRrumTYef3bF
         Z2GIqXycroe7a1TPImcG0RlC5PWaMhXiuwJZjOwDMKaWirnwyRfYfK7l0cACPZExb9oY
         JNTN1IC0KaLApUXMuGMSU2l8kVlEMu93VcKsEGAOAGhW108u00stsrT5DtKwv7oRISP5
         DdeHU6tqjclDA9rg3y++ilbyh9pBFYQUW5NuEi38ZtWXAn55E5V3YhvmnWdE9hw/k9k7
         eaAA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794338827; x=1794943627; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3BDn6wwNGszSOSWtixkkwMS4uvVtcI6x5Kvm71JPIW0=;
        b=gnhS9N3WRisdg86qBDSJcF+KF36Sosanxa6AJykjQ77n7ACFpDtHIr03NxxJsvpKZw
         eh0KZmKoUcU9vb+68SL+qR/kH98mxNcpwfUXwONn8jVQtsO9brxrshG9q/GpJb+8qeaG
         BfoYc6Hus7GMF10n4EivhF7L7vLY535pzkdQ3pxfz5aZLpRoVMG9ehEPJgsT69i82l0F
         fGn1N2zqHOHtSuhK/HpWfIWyGY9nVJO+9ZxTwiG2UW0p/V5X/8jKMbi/kKOZt6LCU5pJ
         CYlt93tYHjU0/EjD2hUBgZNH67xLedcEJHYTLcA7JYxDoGHHG9Nc2xYr1ErdMNo2XMZb
         4GTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794338827; x=1794943627;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3BDn6wwNGszSOSWtixkkwMS4uvVtcI6x5Kvm71JPIW0=;
        b=2RvRX9oGJwzuocC/JtwUkNP9r7Jfxhl+WBUhbVHm+1dj7UzuDp8btABWVRUAvmSR/0
         30xSa513TjOb2vPLuVW2vjwVGJU94mAe43h1CukhrSN84qGLNYx85kzs9p1f3MfJwKO9
         2JeUllgRpphF0n818Um8nb4F5SY+TPG4j5SDxcxCRvM+umSoOUeVMFtvFqwBJMIPKqnA
         fMKNkwV6DptSQ3Q5HIa25+PLglxVfIzeL8YkqbZwCvxiW55O5woxvKdl7t28Y7gbHrih
         k0YJ1ztGLSe/PVOMu1C+xP6+sZD0tpnSpJe332PP5+3wuCMdPQhrHww/4LfxNZPzkIw5
         AbtQ==
X-Forwarded-Encrypted: i=1; AL+hErHW7zFFckcD7WriBOBjLRsbzp0755XFyAB4uZfjRR1bVcSPlgZnsf1UuRRiWNj4G+NDCLgfbjAzaQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8BP1g5nMvbTrXQ3hxrwqSu65+OoOSkpZRUIzI6Clq7LXHukmZV
	G6irTUP72s2GVfIZmGkyw5qBuH+YliUunh/vCbjM/BLyLZUMd6vid/RFs6JU6fsB1DebvJiEI0x
	w2liYsyWWFzQD+l8qbpF54UDtZ9lKMR0=
X-Gm-Gg: AYBFou17OLPU6L1qkqdKH8GZwCIxjLFr1AtZzn5Qwp9ZEYxclvH1GZmGI4hkN420hZ6
	RI6pJWJOrhO4dulioDTMPvQYejfpXPtIAQWYsTsi/cch9qYiBrefA4PmIUsr94G/v6YDmlhwbR7
	lIv6ONR533N9cKu46tpodoDXJjjsV4SA+Vs+vAM4DPAxRULc9roDgt8prcEuOkIJhvWqnFRfKyg
	K6fv0nxeeZAkzKBJskR+EWt9TYg4nhz0jO2ZQuQK2jmkVsieP/vaTuYOY2whEaLjIfVZuIw0zM0
	vMbp/hHDb/cseBs0Mr7yC6WwDLoeBrnwhq765gB4bo9GwSMCWys70RwV1s6Yvni1A6Fci3yQziG
	DcLwxWotff1zm7qC/gGRD+nhrQVpJiCAthciymw==
X-Received: by 2002:a05:690c:438c:b0:8a4:be24:f233 with SMTP id
 00721157ae682-8b3a80e6b9bmr1379417b3.46.1794338827449; Tue, 10 Nov 2026
 11:27:07 -0800 (PST)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261108-04-k3-pm-support-v3-0-b9dc0857039b@kernel.org>
 <20261108-04-k3-pm-support-v3-2-b9dc0857039b@kernel.org> <DMQHSDTR177I.1HWHAF4FWTFQ5@linux.spacemit.com>
 <20261110105658-GKA2005@kernel.org>
In-Reply-To: <20261110105658-GKA2005@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 10 Nov 2026 20:27:00 +0100
X-Gm-Features: AclHuK9GBj1g-yv_7rKhtj60GYCKBcJP3tjfjvEauHRa7ZWcjceK1ew77-uBX4s
Message-ID: <CABdCQ=OGejVS-r2Cuod+0EZf148g_-2Y8=tkLqbK-QRn8UH+4A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] pmdomain: spacemit: Add power domain driver
To: Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for addressing the feedback. The series looks good now.

Reviewed-by: Iker Pedrosa <ikerpedrosam@gmail.com>

El mar, 10 nov 2026 a las 11:57, Yixun Lan (<dlan@kernel.org>) escribi=C3=
=B3:
>
> Hi Troy,
>
> On 07:12 Mon 09 Nov     , Troy Mitchell wrote:
> > Hi Yixun,
> >
> > On Sun, 08 Nov 2026 10:36:02 +0000, Yixun Lan wrote:
> > > +config SPACEMIT_PM_DOMAINS
> > > +   tristate "PM Domain driver for SpacemiT SoC"
> > [...]
> > > +     Say y to enable device power management through PM domains.
> > This is tristate now, so "Say Y or M".
> >
> Ok, will update
>
> > [...]
> > > +#include <linux/io.h>
> > > +#include <linux/err.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/pm_domain.h>
> > > +#include <linux/regmap.h>
> > > +#include <linux/auxiliary_bus.h>
> > io.h, err.h and platform_device.h are not used right now.
> >
> Ok, will drop them
>
> > [...]
> > > +static int spacemit_pd_power_off(struct generic_pm_domain *domain)
> > [...]
> > > +   if (ret) {
> > > +           dev_err(&domain->dev, "failed to power off domain %s: %d\=
n",
> > > +                   p->name, pd->pm_index);
> > > +           return -EBUSY;
> > > +   }
> >
> > -EBUSY drops the -ETIMEDOUT returned by regmap_read_poll_timeout();
> > why not print ret and return it? Same in spacemit_pd_power_on().
> >
> Yes, I think it's ok to propogate the err
>
> > [...]
> > > +static bool spacemit_pm_is_off_state(struct spacemit_pmu *pmu,
> > > +                                struct spacemit_pm_domain *pd)
> > [...]
> > > +   return (reg & bit) ? false : true;
> > return !(reg & bit);
> >
> Actually, there isn't much difference, your version is slightly short
>
> > [...]
> > > +static void spacemit_pm_domain_cleanup(struct spacemit_pmu *pmu)
> > > +{
> > > +   struct spacemit_pm_domain *pd;
> > > +   int i, ret;
> > > +
> > > +   for (i =3D 0; i < pmu->genpd_data.num_domains; i++) {
> > > +           if (!pmu->domains[i])
> > > +                   continue;
> > > +
> > > +           pd =3D to_spacemit_pd(pmu->domains[i]);
> > > +           ret =3D pm_genpd_remove(pmu->domains[i]);
> > > +           if (ret)
> > > +                   dev_err(pmu->dev, "failed to remove domain %s: %d=
 - state may be inconsistent\n",
> > > +                           pd->param->name, ret);
> > > +   }
> > > +}
> > [...]
> > > +static void spacemit_pm_domain_remove(struct auxiliary_device *adev)
> > > +{
> > > +   struct spacemit_pmu *pmu =3D auxiliary_get_drvdata(adev);
> > > +   struct device *dev =3D &adev->dev;
> > > +
> > > +   of_genpd_del_provider(dev->of_node);
> > > +   spacemit_pm_domain_cleanup(pmu);
> > > +}
> > pm_genpd_remove() fails with -EBUSY while a consumer is still attached,
> > but pd is freed by devres anyway. Set suppress_bind_attrs like most
> > pmdomain drivers?
> >
>
> No, I won't add suppress_bind_attrs
>
> As I'm also aware of this problem, but intend to address it in a differen=
t
> way, and should send a patch in another separate thread..
>
> In my opinion, Adding "suppress_bind_attrs =3D true" will only mitigate
> the problem, in the case of this driver, it will still trigger a problem
> while unloading the driver with rmmod command if built as kernel module,
> consumer side won't get notification with the event. Ideally the device l=
ink
> machanism should solve this, currently I'm working on a patch for this..
>
> --
> Yixun Lan (dlan)
