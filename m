Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B7619EED3
	for <spacemit@lists.linux.dev>; Thu, 12 Mar 2026 09:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773308341; cv=pass; b=fKxeE98hg0SqtOjFNMPKZKAFto7ffwUypud1PvAfULv3N53M+ZR8HtJvFFMiRXkQ3Z1hWYMMtii27FBxidPmDqOMjJKxCrjPHTolFwL1In/PTBPQHu5Lt4p4gRloR6rjuJtWEId6Sx5dRlZOfjvlE2nukMYkEeb9W73HH+Z+8OE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773308341; c=relaxed/simple;
	bh=anD1VyMEVEgbX5EIAi4s0UBnKZ1U9xE2QUYdli0kx3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=redJbbfmXhcLv1hxAJgOx9sKX/wpJQl3ulOIlYcB1aHRkATu0o927wqBMMdN2fWoh9Pn0YwkpDsn+SMVZWZ/wjcPQNkGn5nhJ+ie27/EZuCmbBRq3NHfXjL1xqJRoPJTdqWgQijZUN62RoIQmBsbDAtw4il2yAovaUl9cyj/0KM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEoXpiN0; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEoXpiN0"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7986fb839f5so7563647b3.0
        for <spacemit@lists.linux.dev>; Thu, 12 Mar 2026 02:39:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773308339; cv=none;
        d=google.com; s=arc-20240605;
        b=Muc2EHduZCCHigEP9rVpNUgnal9jgC1Ztnhcy4yIZO7HM0xjabHzWkov7QAuY7Dfbm
         Bd/4x2r/LClDNobLqQcIb9Lw95eQ2pbOAaQBD7Ma8BexQaChehIlqOAhlJ3UrobveRYM
         PDym5ZunbTdNVKUQ17G0FnnmP8eAzeCEyq3jUh9J5PvsItS3aMHzVU4ps/l1K/rSHDrP
         IvuhJ8fgYs4yQixfgTh8On4slpHeVNfwOlGFxWYzHpDQy71WlSwO1ElvGuseOs9jjVeG
         DcWnoqCQ7I5oYSYsPaz2Ei4E2fQ9qZmRThXr0obCqQaFqobFUO5wMpYhL7kJwEiYe9bM
         cx9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d645qq1RHXY2ZEXrCIAd8Z57nQOQnqeihh5RHWfjYUk=;
        fh=DginyojmX8JKduZAtgvJtGbM+8rWRTEBXjlFwkVDTAk=;
        b=XlG+nM/QU1LBl91pjBOOT+wJfya/5pTdLMXhqhb4KzFuGLHCtsehYmeSszkEuD5MjY
         cysqUpMRa27i0ssLSLjWXn7USmGFM66X82KZluz9LT1ZQzbrZMWq5sqWogaPuOaSkW/F
         tDwxC8Bl+OLn7G3iWsr+QcbD/+HMUwggo/yP/N/RdX4zvyGeyk9j832NbXX81oYjTuW9
         zyShl3tpi204I53lN7lVa7zi2bJXEa6Vy+IXd3Jx2h5XMX+VxvnEtm6WXdjJTulg6X8W
         LzwckyNrqSYLVrMzl/koc2jzTI8fi2L7SQqsNZ4iR49PRzZs0rVeS6KCcXcuwyCkPJzM
         tucA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773308339; x=1773913139; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d645qq1RHXY2ZEXrCIAd8Z57nQOQnqeihh5RHWfjYUk=;
        b=jEoXpiN0P4A+tvoIWv6fIbryN83FRYFkAKv13woVuq6Gz+eoXuJb+qeq74B3Ea/tjh
         qXAgOTtNCJPLYTEbI9v0VQwfcEzJFO3mku7E6xWb85FHfmgdtxg+XZvQMXo3dS2K4vnH
         hq3yINaRN/BvmDqKOMkwYuKVosYPfRMY3w5I10e9jmYIg1cyI9+skU1mMbA03UJuw6R9
         YDr58RlP38adb3IWCbKAxJWtjkyNy6Hbo0PkOynxgFrdzxjKFL2HLt4CQOGks74K7vpx
         xCZ5o0YefxdYYa4u2qYpVroFDWt77+xbW3s4Q+lMF25cu7B6qxtGJDVyDTyIbbHA6Y7O
         ySTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773308339; x=1773913139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d645qq1RHXY2ZEXrCIAd8Z57nQOQnqeihh5RHWfjYUk=;
        b=vAiJdwW1IHX7OmfunhSABrISqg16Ogtahbj6LifZFK44bMwzxsB80dZc1FUty7TQiG
         FMZm4m1h9rebzimZkoeouFuIQORDh+X/bv9chvps4gmUX2K6NoJKVWU1ppwz6NpKGQOE
         ltLFt8rXH7HG3uVvgwL1xNPEeU5Isc6WbiF3MpdrJh5R7LGyyQ3XLfULFHGQ6uotrWT3
         /U2vE6GV8hNk85U6QgH/nBAO9EA2LuPyAqMc1k2TSN4+9orATeA8VoipcdDniIFeYE2b
         GJWtI/Oo7X5kvp559woMO5qkRos3Xy9uELOYrvX/MIGsgbGZWnOzkG0L83G+7q0dwveG
         eqEw==
X-Forwarded-Encrypted: i=1; AJvYcCXi4/IovQ6NJ3LhI3DVjgnemOqAXRldmbZvef82u6H0A6LGbhCiceyIjcookBiSxqCYJPsNSKYKUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWN2Oyy8rt8I/1N3PoM1Nl5+tMFlZkKtXe+QV+1AGdfGpEBo7m
	M4Fz/Ka6KWh8InJ209TJw6IuiNKDpXa6kqLh8kXktgXXAeoAeIMY65Z62EY73DED2mvEQC/R/xB
	Ja4QafQcVN95dtKV2J+lA5WORZL/rGio=
X-Gm-Gg: ATEYQzzzFZDl/k9qfTf4Ppp4YGVOvuh5wdNOuQdDrQAOqz5IeuGxQYAgAvClPOd2IWk
	c+dr0J2+N3bBwmw9bfKE4QhrLY28sqkvneE0qyxj4MDQ61gqkbzjRxJ0XIyyKWHLkYEbr4hORcf
	lm3G2bqVkitwUqWME/OJX5QlEsxHV4bLnJzH6VIucAyGmFGtWSFwCh89wZ5albWZo1737JdgjPV
	hH5/12eawYcCzZNQMO8Fbn7PKiw0fcuPdTdlmUdkSGDvk4FIjnTZxg6lFVdUUS4WMhEdH5ndQ5L
	75KTvng=
X-Received: by 2002:a05:690c:6d82:b0:799:1af1:6c69 with SMTP id
 00721157ae682-7991af16fbamr45243437b3.26.1773308339300; Thu, 12 Mar 2026
 02:38:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
 <20260309-orangepi-sd-card-uhs-v2-2-5bb2b574df5d@gmail.com> <20260309132219-GKE302167@kernel.org>
In-Reply-To: <20260309132219-GKE302167@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 12 Mar 2026 10:38:48 +0100
X-Gm-Features: AaiRm52BiCFPbC8nIFwrdrDzkLisJX7YfgLkKCTQywgdqQlIVQj3SZM1LgN_fKc
Message-ID: <CABdCQ=PpA4u+pY-pZgggHPNnDMJUVmgqofMf7O6YMrB+2aDkww@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] mmc: sdhci-of-k1: add regulator and pinctrl
 voltage switching support
To: Yixun Lan <dlan@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El lun, 9 mar 2026 a las 14:22, Yixun Lan (<dlan@kernel.org>) escribi=C3=B3=
:
>
> Hi Iker,
>
> On 12:40 Mon 09 Mar     , Iker Pedrosa wrote:
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
> > Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> > ---
> >  drivers/mmc/host/sdhci-of-k1.c | 59 ++++++++++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 59 insertions(+)
> >
> > diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of=
-k1.c
> > index 585c7eca6ebf253aac466dd37cef029deb63f692..8af117a8e271c04a80d8dc7=
bb5ce12075652dd7a 100644
> > --- a/drivers/mmc/host/sdhci-of-k1.c
> > +++ b/drivers/mmc/host/sdhci-of-k1.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> >  #include <linux/of_device.h>
> > +#include <linux/pinctrl/consumer.h>
> >  #include <linux/platform_device.h>
> >
> >  #include "sdhci.h"
> > @@ -70,6 +71,9 @@
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
> > @@ -218,6 +222,42 @@ static void spacemit_sdhci_pre_hs400_to_hs200(stru=
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
> > +     struct pinctrl_state *state;
> > +     int ret;
> > +
> > +     /* Select appropriate pinctrl state based on signal voltage */
> > +     if (sdhst->pinctrl) {
> do a sanity check, then abort it early, the advantage is that you can get=
 rid of
> one indetation for next code..
>
>         if (!sdhst->pinctrl)
>                 return;
>

Makes sense. I'll get it ready for the next version.

>
> > +             switch (ios->signal_voltage) {
> > +             case MMC_SIGNAL_VOLTAGE_330:
> > +                     state =3D sdhst->pinctrl_default;
> > +                     break;
> > +             case MMC_SIGNAL_VOLTAGE_180:
> > +                     state =3D sdhst->pinctrl_uhs;
> > +                     break;
> > +             default:
> > +                     dev_warn(mmc_dev(host->mmc), "unsupported voltage=
 %d\n",
> > +                              ios->signal_voltage);
> > +                     return;
> > +             }
> > +
> > +             if (state) {
> > +                     ret =3D pinctrl_select_state(sdhst->pinctrl, stat=
e);
> > +                     if (ret) {
> > +                             dev_warn(mmc_dev(host->mmc),
> > +                                      "failed to select pinctrl state:=
 %d\n", ret);
> > +                             return;
> > +                     }
> > +                     dev_dbg(mmc_dev(host->mmc), "switched to %s pinct=
rl state\n",
> > +                             ios->signal_voltage =3D=3D MMC_SIGNAL_VOL=
TAGE_180 ? "UHS" : "default");
> > +             }
> > +     }
> > +}
> > +
> >  static inline int spacemit_sdhci_get_clocks(struct device *dev,
> >                                           struct sdhci_pltfm_host *pltf=
m_host)
> >  {
> > @@ -242,6 +282,7 @@ static const struct sdhci_ops spacemit_sdhci_ops =
=3D {
> >       .set_bus_width          =3D sdhci_set_bus_width,
> >       .set_clock              =3D spacemit_sdhci_set_clock,
> >       .set_uhs_signaling      =3D spacemit_sdhci_set_uhs_signaling,
> > +     .voltage_switch         =3D spacemit_sdhci_voltage_switch,
> >  };
> >
> >  static const struct sdhci_pltfm_data spacemit_sdhci_k1_pdata =3D {
> > @@ -293,6 +334,24 @@ static int spacemit_sdhci_probe(struct platform_de=
vice *pdev)
> >
> >       host->mmc->caps |=3D MMC_CAP_NEED_RSP_BUSY;
> >
> > +     sdhst =3D sdhci_pltfm_priv(pltfm_host);
> ..
> > +     sdhst->pinctrl =3D devm_pinctrl_get(dev);
> > +     if (!IS_ERR(sdhst->pinctrl)) {
> > +             sdhst->pinctrl_default =3D pinctrl_lookup_state(sdhst->pi=
nctrl, "default");
> > +             if (IS_ERR(sdhst->pinctrl_default))
> > +                     sdhst->pinctrl_default =3D NULL;
> > +
> > +             sdhst->pinctrl_uhs =3D pinctrl_lookup_state(sdhst->pinctr=
l, "state_uhs");
> > +             if (IS_ERR(sdhst->pinctrl_uhs))
> > +                     sdhst->pinctrl_uhs =3D NULL;
> > +
> > +             dev_dbg(dev, "pinctrl setup: default=3D%p, uhs=3D%p\n",
> > +                     sdhst->pinctrl_default, sdhst->pinctrl_uhs);
> > +     } else {
> > +             sdhst->pinctrl =3D NULL;
> > +             dev_dbg(dev, "pinctrl not available, voltage switching wi=
ll work without it\n");
> > +     }
> > +
> how about creating a function spacemit_sdhci_get_pins()? similar as get
> resource for clock, will more readable.

Yes, I'll do that. Thank you for the feedback.

>
> >       ret =3D spacemit_sdhci_get_clocks(dev, pltfm_host);
> >       if (ret)
> >               goto err_pltfm;
> >
> > --
> > 2.53.0
> >
>
> --
> Yixun Lan (dlan)
