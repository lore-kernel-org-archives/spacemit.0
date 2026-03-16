Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB96C383C9C
	for <spacemit@lists.linux.dev>; Mon, 16 Mar 2026 09:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773651891; cv=pass; b=AtygEOfVJnXJJ6duxcyI0SnsYX/3rUmBnIZ+rX67/wKKmdNjYVxfgEAEniIIN+MW4NQYjTfr75rkilfKLzML9lBviiQHkmZhco+WZiaKz43NNRV3xL7uk9R+tTNd04IKIrSth+pNJByNUMjB5uwFsB1braojeBEzMH4965rCM6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773651891; c=relaxed/simple;
	bh=dPguBCLfR9MFLQEUrZGSOp0t96KCwA/gBYgCFDRG9dk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M1fQK81CSyRe0GPCKaqbgypxElpa4c3p+pKB8EJHp5DQHP1u0/HpH6LiulAYwUR4F69WvS6hrGxU1R47kvEU0OED+Rqs/8as3Y81kztadWYaEuDK7zqVXeO6OdWxsxSnbLTd9dexLBYKRya/m7jSZPRfDdF4BXIYMAcRCTwDklM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQQVSlOW; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQQVSlOW"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64ad8435f46so4385517d50.1
        for <spacemit@lists.linux.dev>; Mon, 16 Mar 2026 02:04:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773651888; cv=none;
        d=google.com; s=arc-20240605;
        b=LVi5qZqvPYJsPXtvBkR91EN4DUiIdEMmKNkOBENZ5UtWqm18cpQ1rkkZgsrGJJxSd3
         Hu3kfht7tiUdaVzXnbcT5b+qd0wkK7sIJsBNOdsFdSGMl3LWDMxONWhUzsfgUv5un1v3
         16qx7LfB8PuisnsU313uLviXt3Jb5F44mrQNoWQMf/k9H963ls/BcDNKptRre8q/F+Rb
         gYAoaubx8TVsRqwctLJ2fF5lSEIdqXJ8v09dKNreKz9PfwbMydmp4qfUXqGVtASg0QqW
         mEfl+TwPEjC5G4YCZTgUdbG+j93NzjN/Z1lse6xWSmP8kQvO5mVT3bG7tfPqWm5imxHs
         K87g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3eAjnnl6SnN5G12YdBWuTcivnsr1WNsEqrmyCn5/LX4=;
        fh=pDLLbVcANf8jcY867KmlR/to06Wx/CbshCHybRpwlB0=;
        b=AVKfYbqhZplmapxeKFFcOJJuBAA8PxnpBW7IuTO/BMCijFAOBPwZY7HwENSeWGu8Qt
         AGZxgAhPEgZNflJYui2/z8Ox97/dFpm0aijlfSkveOCfa17QJLDhf7KXMYCRGKM73T2/
         ppPkyWbssu93+h3KogmA/1FT2YV6krbelKVrg/M553hd8rNal6QF7ZBY9q9EUG1o25Iy
         rCyUOKfv2oEQPwKBrJnG1YJZUyYNuH/yc01B9yHuswDV/KgAS8foa8ZoFs614+Z6t/Qh
         w3XC11IDIAFwPP438tbFMesC4SY69Vthodm7SK/M+sL3U2FE7ecBdqi+GAWDEKRABXjn
         1oDg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773651888; x=1774256688; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3eAjnnl6SnN5G12YdBWuTcivnsr1WNsEqrmyCn5/LX4=;
        b=JQQVSlOW/whnsjQXkqffexJ29/WJWaCNnvQf1Gq7WFSyYbPY+ATsT5DF4iX7dz7Ga/
         5jPIYQnZ7qwuCYUbEwWjjFl9LsGDrDiSJlD0bTQ23R45V4nQYzp3N9X2EojQ15x17bLo
         bVT6+UXOyg32NyOlPdiiDPc2Qcs2MSml4qSZQjwepDLhDbmMxokvMuFRvgHfN/cF/vHS
         QVfDQDWDyXyv9CxoZ8VLRiaF0q/gClt6bsCBQaOAvKQZjlsdZ4xXSj3xnKeqTg48FFWQ
         kDgnyjWmflUquK34mAdr4uRJr+h20CRQcQqhMXMQCF6jEHACpQCFThPQ2zv81rVn9PnU
         QY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773651888; x=1774256688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3eAjnnl6SnN5G12YdBWuTcivnsr1WNsEqrmyCn5/LX4=;
        b=K3Uue+xe8k2wNJfzUAL5D7ZFvxw0S27LehAz9YrBDsWkNWfKxiGwnQwg+mvme6o/N9
         /UPyl05mPjVSA41NTov2fCjS2rkXRnLToWqH4oqPWMLfOE07nYMLsLlk7ZOj4TwyX0WT
         jB2wL4CeEFv/pZ1o76rTwoV06J6cex98T/6+PIH/n5x5TvqwH+DzRWZE6u30SEi9l43S
         YuVoYi2JFsf7xcu2NyKWi9hP1Ttfh7Ji1qdyaLgoyyU/yfm+f8JIcox/k8WCTzRMRtBD
         rRN7sO8DyKRJw98xYnjy/43Cz6nMZhLNnO/o0OgAMU/epIioPNgUnFA0HX8afvztN9jp
         ZreQ==
X-Forwarded-Encrypted: i=1; AJvYcCUz7tenNPoZDO8TcZLWkQH3X/4oVoSmq3xfzvNIi8wIVRRMGNslq1d446C0jZN0StePXD7dbG/fiQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzURahtR1H0vOWCTim2HVoCtfprH27/Ys+sU6kOIHv7I266mohx
	xtgjT5Jy74mb9AP0hVWJE1nDGD6KC9EZHwouZVEFOxy3AihoKm5w67s4Lr08MWg38IH5pJ63LfW
	8nvW0kk28JifTd7ggt7AEgzuvuy/FZkw=
X-Gm-Gg: ATEYQzzu5QwFz99cQ5aQrVi6I5Nin3CfPpOulMJ7fDulsdEJGhTQnTvDa0V3rLYpP0w
	B5cXfciggJX5ZSJXiGPWIHvFZF0egFd5Ty62AqrOmBDxZwRcszI5o+u+7ajmpn+j8rt5GTkeIO3
	dtvdGibXT2b9p4BtZHepUPXWK+QuwRezBRr+YUDs7KY8+v9ehqAfdhNmEidffQddugr1OV5JyS8
	JyWNYjLmmisU3IBfTwOQMxhhNvipsuDL+p+OfW1qXl7WUwXl6X7egxhvntxgECExWRyyhwD3JEZ
	3EHWpow=
X-Received: by 2002:a05:690c:6d0f:b0:79a:3655:9dfa with SMTP id
 00721157ae682-79a3655a11amr66434377b3.16.1773651888381; Mon, 16 Mar 2026
 02:04:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
 <20260309-orangepi-sd-card-uhs-v2-1-5bb2b574df5d@gmail.com> <a416dc43-58fd-4462-9ec5-b3dadbbacf8b@intel.com>
In-Reply-To: <a416dc43-58fd-4462-9ec5-b3dadbbacf8b@intel.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 16 Mar 2026 10:04:37 +0100
X-Gm-Features: AaiRm50b9bQG2sxK_4vk8EljAgLA7HxFRVGyEcc1jQLOb023E3q4ta5OL-EXqAs
Message-ID: <CABdCQ=PeB5hhkk3eO3Mu89bb7m=4ccZrwouuZScGOTHwN5owQw@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] mmc: sdhci-of-k1: enable essential clock
 infrastructure for SD operation
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El vie, 13 mar 2026 a las 14:04, Adrian Hunter
(<adrian.hunter@intel.com>) escribi=C3=B3:
>
> On 09/03/2026 13:40, Iker Pedrosa wrote:
> > Ensure SD card pins receive clock signals by enabling pad clock
> > generation and overriding automatic clock gating. Required for all SD
> > operation modes.
>
> Need to say why update to "SPACEMIT_SDHC_LEGACY_CTRL_REG" is Ok for
> non-SD

After analyzing the reference driver implementation[1], the
SDHC_LEGACY_CTRL_REG setting is applied to both eMMC and SD
controllers.

The reference driver sets GEN_PAD_CLK_ON for any controller with
MMC_CAP2_NO_SDIO set (SDIO disabled). Since both our eMMC and SD
controllers have no-sdio; in their device tree configurations, both
should receive this setting.

[1] https://github.com/orangepi-xunlong/linux-orangepi/blob/orange-pi-6.6-k=
y/drivers/mmc/host/sdhci-of-x1.c#L482

>
> >
> > Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> > ---
> >  drivers/mmc/host/sdhci-of-k1.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of=
-k1.c
> > index 0cc97e23a2f9c7b2f9376318a8a7ebb860571504..585c7eca6ebf253aac466dd=
37cef029deb63f692 100644
> > --- a/drivers/mmc/host/sdhci-of-k1.c
> > +++ b/drivers/mmc/host/sdhci-of-k1.c
> > @@ -20,6 +20,13 @@
> >  #include "sdhci.h"
> >  #include "sdhci-pltfm.h"
> >
> > +#define SPACEMIT_SDHC_OP_EXT_REG     0x108
> > +#define  SDHC_OVRRD_CLK_OEN          BIT(11)
> > +#define  SDHC_FORCE_CLK_ON           BIT(12)
> > +
> > +#define SPACEMIT_SDHC_LEGACY_CTRL_REG        0x10C
> > +#define  SDHC_GEN_PAD_CLK_ON         BIT(6)
> > +
> >  #define SPACEMIT_SDHC_MMC_CTRL_REG   0x114
> >  #define  SDHC_MISC_INT_EN            BIT(1)
> >  #define  SDHC_MISC_INT                       BIT(2)
> > @@ -100,6 +107,12 @@ static void spacemit_sdhci_reset(struct sdhci_host=
 *host, u8 mask)
> >
> >       if (!(host->mmc->caps2 & MMC_CAP2_NO_MMC))
> >               spacemit_sdhci_setbits(host, SDHC_MMC_CARD_MODE, SPACEMIT=
_SDHC_MMC_CTRL_REG);
> > +
> > +     spacemit_sdhci_setbits(host, SDHC_GEN_PAD_CLK_ON, SPACEMIT_SDHC_L=
EGACY_CTRL_REG);
> > +
> > +     if (host->mmc->caps2 & MMC_CAP2_NO_MMC)
> > +             spacemit_sdhci_setbits(host, SDHC_OVRRD_CLK_OEN | SDHC_FO=
RCE_CLK_ON,
> > +                                    SPACEMIT_SDHC_OP_EXT_REG);
> >  }
> >
> >  static void spacemit_sdhci_set_uhs_signaling(struct sdhci_host *host, =
unsigned int timing)
> >
>
