Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551E432B981
	for <spacemit@lists.linux.dev>; Fri, 20 Mar 2026 09:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773998262; cv=pass; b=O15slG91mae3/0ns/1JOuLu9Z/tmHGP1+GXU9KSRwNZoLKcWIMUdbt80J1Ev0C6IdGfa6iXJa217Ilyzouipx5qSgewC7JHkOPbHB/lSqWaekRfuR8lzB+KNSDF1glaO71D3sW/EcI6azWcLu1GsXVQJPS6muc2aXa+QESRPQm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773998262; c=relaxed/simple;
	bh=WI9ql83NPUaLhZG0631OEKRXHGKSR+sVAGHlOXj1Hf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SP8m5KvUd11m1QInBaex+4+KmyjrOpXcIR+tGNee8RsH+mJuGa7UTVvoA1roibnvdTGC/s8IHhd6vSa3+BYCMaz1r1FvCssS9F4YCX+aI/gWUIPwCyw5JVu2FRJ/DiJOhavyDgK3tlaL1OPYkLYNwgSlkn4oU0VWp9d+a8ZB7kM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=buXl1LyG; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="buXl1LyG"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79a8e873ca1so9965037b3.1
        for <spacemit@lists.linux.dev>; Fri, 20 Mar 2026 02:17:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773998258; cv=none;
        d=google.com; s=arc-20240605;
        b=R58T19secnUaaGyGZ//jx5G5twNdDWrAQP83McyUp861cmO1ztlv4273E6u4q+yeip
         Gte7Y6mW8IkPYIZNH6KoeVvfdzpmgHzGz2Cr1FoFG2psJ00sZ0qzZagaOrnZuDQD9hmp
         QWQX+i1gnG4zR6/zilunzk/t2KeUlYhVgjY/QkSQnjODxXZl5wQ/2Dt6Mb2zVvDFSFta
         uNOFM11YY0p0uJ4baR9FuNpq2w+ZdP21sRLq7UdNowKM1dWIbSpBN7O7bSTGmDNMLS3E
         KlMa/CjuemKrV+U8IvJupqun0Ok/JXDRbf3R4nL0pBoTvGtcNcErsdi+Ja7m5dnksfz5
         hcQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dn1DESYfs8Y8xmtlvHAYp+0AU2JDUbwmb+m5abbzaxM=;
        fh=f2J29RInLR6JN7GbsmfpZVmUHZrdnNl0BSaV7WoJj/U=;
        b=TZGhRkWXbETaUwSCEmx6peIMXjeZs7eIRTAwEVJXklagXwZ9Wj5JlHA9Ch+EazIdhB
         b//I5xR9G8V8C7W1+ItsO+itfSY2Z4ME2YZxYghVTKGhSJKnOgasbkm38Oo0spV6/4fy
         kyBy6bGbsQ+ct9N22vMUqaLs94knj/udVx8xTiEaxkXpgDEWFM7Dxxe+ZzKnCV9aFQdM
         DDlDDlZn8lvOPGlRaOuGZ2RHCl4koZR29bXhsFXPOrhOrnlQTVDoFnL8jqunA8uQGYZ3
         QjhXa92qKeN81r7TByrykfmfcrrVM2tyb1/aFto0mQsk3hN6xRLHsEBnI2BlC4t9h5Ok
         RP/A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773998258; x=1774603058; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dn1DESYfs8Y8xmtlvHAYp+0AU2JDUbwmb+m5abbzaxM=;
        b=buXl1LyG2j7nPC5OiUyJEowurMWJOuVu2/1mCV4mtvmLinqOV9/xB+A5kz+NV/WuPl
         RC8CwlkhU8XE1389Hpb6gaDhx0f2cBoB51G9Z8fgeZgEpdp4nRmzwEy7CXJkqolIuuzE
         4P/DjyTiSTZQHlFUoa2C63eGAN6UP4p5mJhmEqV6TXaZjkWlqZZw0cFm0rXD7+Rtvqfq
         aTYjW/TJd3klIU16SlkT5Q7/ZKTsFKLxyMYxQf5JzQ5LGmdDfXOZjsNWqPpUTBl0su51
         1aGXR/scL4j4t2n0YsKflwkX8C0h4iRyoFI9pzeTTN2us8XwYGHbY2rjE8/PvCoCSnZI
         hobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773998258; x=1774603058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dn1DESYfs8Y8xmtlvHAYp+0AU2JDUbwmb+m5abbzaxM=;
        b=pHmc4cOyEhgOAhPnVARfeUctQuAy6IQpIwHj6ZK3MUhWq0b+ky0FMhf1DKa5txQ9zG
         f2BAlQP5Bo5d7+rAIJtsDesOBwTrxIKd5VYIQRnbO1EgcztxFzvt+A9ki8ltIc5FZSW/
         E7ILOvX/WSWZQqhDgquxI8XPNvjIma/hAkWeqyevOAV3Sdi+cMO5J0UGUCqLWEaf2iYt
         ho6J863U26tPWfDgvPew/5Vnp4OjFa5eQkp9wLOrG4Ll0TyefsRPhN9Kbm6xtcnBQcMB
         Dbfo4dYZm6EPc59bLZ6qletyRaSjE4FrUEi6Q6pGEl2ysRQQCbyicwGaHC5dRMPK4fsC
         wK8A==
X-Forwarded-Encrypted: i=1; AJvYcCWix2m+XkYTaSadTBG5I/LzOq3CuiZ/BznPZvuSWH61xBu6Y8CA1oGJlSWyII2io1BZJbHdXaJp5g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxhwPsXlPEvJQqTY7Rup61nTun4luVWZxCE+Om/m37ObXgxESWo
	Vb2e85axgbazn2ASZxwJBZo09HJTAcxlN78k1CYJ9QTbsOZNKLinpa6Ud3n6gzrGCvNFEwQVM3y
	3Gaj/nQnAAYiX0Yd8Bp1VXIADa6uO/ro=
X-Gm-Gg: ATEYQzzbJWsW84wccHT3A3e7b7aQiTXF3FRap19J6XzeC+N/f+p8doTv5xAgS5laMZP
	jthovRbdBJB4yuFawLD+1mLtQ9kkSVb5ChT76swp+HbkOBQdM5Lf8ZAowL3qcRTALzYRngYTos9
	9zJNIujHkPlcrnaZVGptLZ384EhFCFJE9BVTY+HsbhT+Oc9YO2zOPcxw4QJV90rVbl20ORxnjlt
	4w7oQuMT+vEOtz5V3CjY/CiaU6VkbaAokjYtbdD/oSdHucqvMUiIwmK9cWe51QbgxFO7HPbByb7
	XxNvZlU=
X-Received: by 2002:a05:690c:498f:b0:79a:43b1:1170 with SMTP id
 00721157ae682-79a81ad7827mr68711887b3.15.1773998258113; Fri, 20 Mar 2026
 02:17:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
 <20260316-orangepi-sd-card-uhs-v3-2-aefd3b7832df@gmail.com> <182321ef-f01e-4bc8-8f23-aa85b4c70860@intel.com>
In-Reply-To: <182321ef-f01e-4bc8-8f23-aa85b4c70860@intel.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 20 Mar 2026 10:17:27 +0100
X-Gm-Features: AaiRm53XBGo7zx5aFlI-GEzkiEKn7jV5Xqx3ftctiokZuyCP--kGRAQhny3pbvQ
Message-ID: <CABdCQ=ODJyeC4Lb_XFxHaxQpem0F3v=tw+5CipCHFU8T5zr8Ww@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] mmc: sdhci-of-k1: add regulator and pinctrl
 voltage switching support
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El mar, 17 mar 2026 a las 12:28, Adrian Hunter
(<adrian.hunter@intel.com>) escribi=C3=B3:
>
> On 16/03/2026 16:03, Iker Pedrosa wrote:
> > Add voltage switching infrastructure for UHS-I modes by integrating bot=
h
> > regulator framework (for supply voltage control) and pinctrl state
> > switching (for pin drive strength optimization).
> >
> > - Add regulator supply parsing and voltage switching callback
> > - Add optional pinctrl state switching between "default" (3.3V) and
> >   "state_uhs" (1.8V) configurations
> > - Enable coordinated voltage and pin configuration changes for UHS mode=
s
> >
> > This provides complete voltage switching support while maintaining
> > backward compatibility when pinctrl states are not defined.
> >
> > Tested-by: Anand Moon <linux.amoon@gmail.com>
> > Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> > ---
> >  drivers/mmc/host/sdhci-of-k1.c | 58 ++++++++++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 58 insertions(+)
> >
> > diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of=
-k1.c
> > index 0dd06fc19b8574ae1b00f7e5d09b7d4c87d06770..01afdadcf70796704b272ee=
5a31543afd5e01188 100644
> > --- a/drivers/mmc/host/sdhci-of-k1.c
> > +++ b/drivers/mmc/host/sdhci-of-k1.c
> > @@ -16,6 +16,7 @@
> >  #include <linux/of.h>
> >  #include <linux/of_device.h>
> >  #include <linux/reset.h>
> > +#include <linux/pinctrl/consumer.h>
> >  #include <linux/platform_device.h>
> >
> >  #include "sdhci.h"
> > @@ -71,6 +72,9 @@
> >  struct spacemit_sdhci_host {
> >       struct clk *clk_core;
> >       struct clk *clk_io;
> > +     struct pinctrl *pinctrl;
> > +     struct pinctrl_state *pinctrl_default;
> > +     struct pinctrl_state *pinctrl_uhs;
> >  };
> >
> >  /* All helper functions will update clr/set while preserve rest bits *=
/
> > @@ -219,6 +223,33 @@ static void spacemit_sdhci_pre_hs400_to_hs200(stru=
ct mmc_host *mmc)
> >                              SPACEMIT_SDHC_PHY_CTRL_REG);
> >  }
> >
> > +static void spacemit_sdhci_voltage_switch(struct sdhci_host *host)
> > +{
> > +     struct sdhci_pltfm_host *pltfm_host =3D sdhci_priv(host);
> > +     struct spacemit_sdhci_host *sdhst =3D sdhci_pltfm_priv(pltfm_host=
);
> > +     struct mmc_ios *ios =3D &host->mmc->ios;
> > +     int ret;
> > +
> > +     if (!sdhst->pinctrl)
> > +             return;
> > +
> > +     if (ios->signal_voltage !=3D MMC_SIGNAL_VOLTAGE_180) {
> > +             dev_warn(mmc_dev(host->mmc), "unsupported voltage %d\n",
> > +                      ios->signal_voltage);
> > +             return;
> > +     }
>
> In V2, I put "->voltage_switch() is called only for
> ios->signal_voltage =3D=3D MMC_SIGNAL_VOLTAGE_180" by
> which I meant that it does not allow the driver to
> switch pin state back for 3.3V.
>
> So you probably need an approach similar to the original
> spacemit_sdhci_start_signal_voltage_switch() in:
>
>         https://lore.kernel.org/linux-mmc/20260302-orangepi-sd-card-uhs-v=
1-4-89c219973c0c@gmail.com/

Thank you for the feedback. I want to make sure I understand this
point correctly to avoid going in circles.

In the v2 feedback , you mentioned that "->voltage_switch() is called
only for ios->signal_voltage =3D=3D MMC_SIGNAL_VOLTAGE_180", which I
understood to mean that this callback only needs to handle switching
to 1.8V. This meant that the changes I introduced for v3 don't manage
the switching to 3.3V.

Can you clarify if I should I revert to implementing
"->start_signal_voltage_switch()" instead, which would handle both
1.8V and 3.3V cases? Or is there a way to make the
"->voltage_switch()" approach work properly for both directions?

>
> > +
> > +     if (sdhst->pinctrl_uhs) {
> > +             ret =3D pinctrl_select_state(sdhst->pinctrl, sdhst->pinct=
rl_uhs);
> > +             if (ret) {
> > +                     dev_warn(mmc_dev(host->mmc),
> > +                              "failed to select UHS pinctrl state: %d\=
n", ret);
> > +                     return;
> > +             }
> > +             dev_dbg(mmc_dev(host->mmc), "switched to UHS pinctrl stat=
e\n");
> > +     }
> > +}
> > +
> >  static inline int spacemit_sdhci_get_clocks(struct device *dev,
> >                                           struct sdhci_pltfm_host *pltf=
m_host)
> >  {
> > @@ -252,12 +283,37 @@ static inline int spacemit_sdhci_get_resets(struc=
t device *dev)
> >       return 0;
> >  }
> >
> > +static inline void spacemit_sdhci_get_pins(struct device *dev,
> > +                                         struct sdhci_pltfm_host *pltf=
m_host)
> > +{
> > +     struct spacemit_sdhci_host *sdhst =3D sdhci_pltfm_priv(pltfm_host=
);
> > +
> > +     sdhst->pinctrl =3D devm_pinctrl_get(dev);
> > +     if (IS_ERR(sdhst->pinctrl)) {
> > +             sdhst->pinctrl =3D NULL;
> > +             dev_dbg(dev, "pinctrl not available, voltage switching wi=
ll work without it\n");
> > +             return;
> > +     }
> > +
> > +     sdhst->pinctrl_default =3D pinctrl_lookup_state(sdhst->pinctrl, "=
default");
> > +     if (IS_ERR(sdhst->pinctrl_default))
> > +             sdhst->pinctrl_default =3D NULL;
> > +
> > +     sdhst->pinctrl_uhs =3D pinctrl_lookup_state(sdhst->pinctrl, "stat=
e_uhs");
> > +     if (IS_ERR(sdhst->pinctrl_uhs))
> > +             sdhst->pinctrl_uhs =3D NULL;
> > +
> > +     dev_dbg(dev, "pinctrl setup: default=3D%p, uhs=3D%p\n",
> > +             sdhst->pinctrl_default, sdhst->pinctrl_uhs);
> > +}
> > +
> >  static const struct sdhci_ops spacemit_sdhci_ops =3D {
> >       .get_max_clock          =3D spacemit_sdhci_clk_get_max_clock,
> >       .reset                  =3D spacemit_sdhci_reset,
> >       .set_bus_width          =3D sdhci_set_bus_width,
> >       .set_clock              =3D spacemit_sdhci_set_clock,
> >       .set_uhs_signaling      =3D spacemit_sdhci_set_uhs_signaling,
> > +     .voltage_switch         =3D spacemit_sdhci_voltage_switch,
> >  };
> >
> >  static const struct sdhci_pltfm_data spacemit_sdhci_k1_pdata =3D {
> > @@ -324,6 +380,8 @@ static int spacemit_sdhci_probe(struct platform_dev=
ice *pdev)
> >
> >       host->mmc->caps |=3D MMC_CAP_NEED_RSP_BUSY;
> >
> > +     spacemit_sdhci_get_pins(dev, pltfm_host);
> > +
> >       ret =3D spacemit_sdhci_get_clocks(dev, pltfm_host);
> >       if (ret)
> >               goto err_pltfm;
> >
>
