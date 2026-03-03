Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835BC35F195
	for <spacemit@lists.linux.dev>; Tue,  3 Mar 2026 13:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772546307; cv=pass; b=UcYHlC8CJVuv6FcKeDrt9bsUmSDyGMepge9wOUWMGtbaJUGAZowE0PobHA+Mq/vwcKfVFe1C6NNp62BuBxpwcqovSxC7AAknjNltGsTMpu8Hz3JXeCdWKJb5yQb1OGgX55PZgEw8P1k5FZDMfHjY3e4VVvp26gOwyPfGVjpK0Z0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772546307; c=relaxed/simple;
	bh=cHDl/UGxVI3bg2xIA4BoN5IYdh6+l3v4+cbwiHeVBNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L4Tt9RYH/Zlk+L1npw8VHDG9jiSn+B1+zQs6eP6RnTZ7adp9aA9fDtdEYXw4keI2GR+WKfRFDbMZD8nq6Am5cwWmgdT6C4EikUSR9XaYi2RKcwZLqXQf4cyLwoCPFisovfESVmyXQyuIGkRkuM6vwFqfpHm+LevVAkL9cGwNbG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=inlzbsQU; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="inlzbsQU"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79885f4a8ffso39511447b3.3
        for <spacemit@lists.linux.dev>; Tue, 03 Mar 2026 05:58:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772546305; cv=none;
        d=google.com; s=arc-20240605;
        b=d8sQNxopddjDcFBXKZdne5KuwzDFQ+vtnfYTILgsv4ARxaMGP5/dE0QdjfOD6LU6h9
         k42mT+JoiRahEL8K1xUcyX0RSLvPUTBIkDTFmQMIsdWqXr3f1/Rw9vSoQMV07g6/S4Af
         76zmAJLIKmq0lq+F/21RXwnx7Y9tKs3Pf7+N5ZXe08eZTOqMp9sWbcp4BPoM2NIOAifj
         eaQLgz6JWlOyZQa4MR3P57FvPXIZa/hTS5QGxH7I1Lwzn7aFElJWcHkKgDgcZuWD3wqd
         uZbqI+LNoGOxUaGxC2Q5k3BSEB9SDxxyKmpjtrGPUV2Z3FKEJEzxsR1ToOI3r96ebQ94
         gnZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=25Zk0eBlVyMNHvv/kU7Q4vGl++ta3IdblXKrhWJCrxQ=;
        fh=Xph0VZJGS4CaiQ7NFRz79e9Ng/Lve/EGql/p0srNhWY=;
        b=bX0GZsansW08crak0HBBefmnFzaAyWDgu4/L8r6SnlG6VXkQN/7kAaScnSLU/rYU4R
         5KiNROPhLvU9E976TGvOkBRy63HHFvL+EfppeUzDzhcGtixuT36yhP49pA4clGDwle8h
         OeIEzlOwnESMHV4kmlzBU2868A91Rh53rp+5wZpibFiHjE2RFfvMzW7VhcS8jrt72i2X
         CvF6Q1xEPlvUJ4qVabC/UHZ+zkd+uxQcL/hDShWx3YsEty10ZTHOyvqggeXN7aHASYCq
         lqKmROQquAX3CXy/41/Ff3xOtP9nHygIMFWgbgFhQvVuG7QTMxgrtY//ZlRwl00y6z8B
         dBpw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772546305; x=1773151105; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=25Zk0eBlVyMNHvv/kU7Q4vGl++ta3IdblXKrhWJCrxQ=;
        b=inlzbsQUWGJj5eOcdUkqjsLSCmLYL7M02QTSJC9vdogQFdtXHDIUmE4yMjF5hb0UpZ
         AlcYCQhvDtb6vNqv8+GR3kmTBPpRrd/xJJZpY6B3MTqNJ+sBjuer4xERvGVRZZOv/60+
         jpHD2PsGlXmVoO/0jWIhQiLq9zhytGWY2S7pW5ByRCgNROBiq9yXlH61O+PXRnLp2WJ4
         TFs4kU7Uq0uZ0dDpOTs8uPXkp4l/MsTVuOFnZW6qPsVEgGC2S0EZwAkBha4EC5FMrL2j
         PwkWryQvg6OO7OvHwghTcFzt5YFxh7t1u5QWMKcFuTmu3ploB/9y28m3OOdlMXN3Li9C
         vOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772546305; x=1773151105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=25Zk0eBlVyMNHvv/kU7Q4vGl++ta3IdblXKrhWJCrxQ=;
        b=fD5qh57KbZ7oq52DjJbMenIBga93+Gc38bCUP+37mzI0D8nTjjR3rxcSzYgMgjd5a2
         sNqNt40QUOWNOPo7eGtCNJPi2JvRHE1l433Sl7dh9oFDfkEWYxYBHLa3vTrXCifnNK8Q
         iER+kThh+6vdqnUlfXis/Tf6g9DX0xWddhTyTTYx5iI6GlVa/BIX3aAGYCsBQxlAFm7e
         WWK2NMUHC3aCOYY270+PTpMJ+4AgqeM4fSEDXuQW5gdqVu9s01h38tVUF/82EoUw16ad
         xCcZZZIP+pf0R3Zg0IWs/xQRsIRYdARpRi+Sv6tsfrkpLRs0dYymunYcKQ9kwCx4lvRU
         F8yg==
X-Forwarded-Encrypted: i=1; AJvYcCViiB3KCweXTGjgXxT80EsgS2A68bicyR4Gw2piIKmFR2WPH67/GfUHdD4yFDIlPnKtQLdG/K0tiw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXZfBG7Rsg1SEqXqtUwJF7iR9vKvii9pwDCga6NYj2GSqRp65s
	eG8miHKL+G6NYmm0XEboILh8bNx78tG/GUUF3i2VTRN+ByKqAuNQemdDc8uhQGH4Q9MZpSl/q50
	Rm/pqUd7SduwOolf/EaVkLi0ivu8hQrY=
X-Gm-Gg: ATEYQzyQFVBZ038N9E5NDj8L1DkASoeVDerVaG14dFKYU2D1O05ZEUE1d9H6EuwIHYU
	HB/BpnAKAULZ7f+/5dAAUF23stgu8QrFGB29n/ONyxjdC15oNTYvhrL2uMzTtMsG6bL2KG6U5f7
	DKqLEzBo3GzMwuqaAmDPC6QngbKuzWJR7fRqJaehzUO/InDKyUAY6if78ab8WrDq0+cgMC0v7S9
	vhbnaRKRS09UAc2q5T3cutIlgiHznmAa2LNTC/smIHZnJ6GOzX6RQtG301WDXiPYsLCn8joe/mH
	RyxnD11L
X-Received: by 2002:a53:ecd5:0:b0:64c:bae1:2168 with SMTP id
 956f58d0204a3-64cc201e46fmr9653985d50.12.1772546305463; Tue, 03 Mar 2026
 05:58:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
 <20260302-orangepi-sd-card-uhs-v1-3-89c219973c0c@gmail.com> <aaZfVZoCe3AxTzAf@pie>
In-Reply-To: <aaZfVZoCe3AxTzAf@pie>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 3 Mar 2026 14:58:13 +0100
X-Gm-Features: AaiRm52kBZDv7RHaHk__HaURlrgDL3u1uXFkZRgyX5QSdwPI4llWUBVCuA0ve_E
Message-ID: <CABdCQ=NporA_1wRZx-dG3pXE3mmqT1g=M18Utpqpewt5qXLiCg@mail.gmail.com>
Subject: Re: [PATCH 03/10] mmc: sdhci-of-k1: add regulator framework support
To: Yao Zi <me@ziyao.cc>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El mar, 3 mar 2026 a las 5:11, Yao Zi (<me@ziyao.cc>) escribi=C3=B3:
>
> On Mon, Mar 02, 2026 at 04:13:24PM +0100, Iker Pedrosa wrote:
> > Add regulator framework support for voltage switching operations. This
> > enables proper PMIC control for UHS voltage switching between 3.3V and
> > 1.8V signaling levels.
> >
> > - Add regulator supply parsing
> > - Implement voltage switching callback
> > - Enable mmc regulator framework integration
> >
> > Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> > ---
> >  drivers/mmc/host/sdhci-of-k1.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
>
> It seems PATCH 4 should be squashed into this one, or the functionality
> of voltage switching isn't really complete.

That makes sense. I'm still learning the best way to structure these
series for the kernel, so I appreciate the guidance. I'll squash patch
4 into this one for v2 to ensure the voltage switching logic is
atomic.

>
> > diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of=
-k1.c
> > index b703b78282ed8d89183c816477c149c0a565618a..c260cb89704ae7a25bec0f0=
7831d495553405bbd 100644
> > --- a/drivers/mmc/host/sdhci-of-k1.c
> > +++ b/drivers/mmc/host/sdhci-of-k1.c
>
> ...
>
> > @@ -291,6 +297,12 @@ static int spacemit_sdhci_probe(struct platform_de=
vice *pdev)
> >
> >       host->mmc->caps |=3D MMC_CAP_NEED_RSP_BUSY;
> >
> > +     ret =3D mmc_regulator_get_supply(host->mmc);
> > +     if (ret)
> > +             dev_warn(dev, "Failed to get regulators: %d\n", ret);
> > +
> > +     host->mmc_host_ops.start_signal_voltage_switch =3D spacemit_sdhci=
_start_signal_voltage_switch;
>
> Why not assign start_signal_voltage_switch in the declaration of
> spacemit_sdhci_ops?

You're right, that=E2=80=99s much cleaner. I'll move the assignment into th=
e
spacemit_sdhci_ops declaration for v2. Thanks for the suggestion!

>
> >       ret =3D spacemit_sdhci_get_clocks(dev, pltfm_host);
> >       if (ret)
> >               goto err_pltfm;
> >
> > --
> > 2.53.0
>
> Best regards,
> Yao Zi
>
