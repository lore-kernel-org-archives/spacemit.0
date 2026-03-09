Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E5E390C98
	for <spacemit@lists.linux.dev>; Mon,  9 Mar 2026 10:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773052379; cv=pass; b=bi2h1sddDVraVfU79R6MHYCgEnmO6/GalvV5QgcfR0Eg6GXxwFZmLLGis6KuHQFrt4Usot9RIKABJPhPqx+YJweXwDtTVrR0T0trln4zRNNDYewsQpYKkqkqNZxmoGVEv82WJMkqe9CTpaVlXPoOpaOzg+rXqya7NuKLaOpWoIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773052379; c=relaxed/simple;
	bh=y7wuThGYnUtDKgV28nKsh5wsvpPKdidycqd61+dpPdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VmO4u+/kW1omnRiFTsGMKCZ7/BoDrFPxTWyXO/x0eMngx7bExpsELXzQqOm1PZAxvGhbiGYMCpYdv3ZecNq1Syko9cQyxODrg+ppBi5qQ0T1dq9jhRGKzbBgoOm6xYCx8mXcFEmA2wqM9EQnacO7VS+IQWF+25WsWo1JE6PEA7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OOf0okUr; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OOf0okUr"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-649278a69c5so9594979d50.3
        for <spacemit@lists.linux.dev>; Mon, 09 Mar 2026 03:32:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773052375; cv=none;
        d=google.com; s=arc-20240605;
        b=g6Jx7pzGvI6ubrxqWhmsnuhQUE6Dv2exsffblNj6/S+azVjAKgsKdaWDyWcXKdfcH1
         sBnxYubEsk2QBmwfYcagR1W1dezc8tDTvMz1vg9pGzz+S0gOCnni4al1U47Wryw2lvj1
         9THrcj3W2UfGUxAQ4EKEiFtyeR8J7/CJb37J2O63WPrPLxYEBmvp2AwDrXV4UNEbkPph
         XiW76jpvSIpAoiO+DN35pNAno/qSw1D2YOenK53mhpRkRLj3vHmF1MwR8c9hxUnbXy3o
         SgduxH33YFUDvd7L1+m4AACPZQL+q9FLH06WUAYeq/mBTtIT1ZavHk24a2U3657Ua9WF
         geQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7R00jT9f/wF6nP47m5GBLd6PhCW+dAuP70evV4AQ3/g=;
        fh=V8ZUrKGsgXZiWvHobIotj+0y2ZMSpBY56gaeH2UnOyM=;
        b=J3hclO11a9Q/r750y8UPCIIQfMBuuTssuieCxAZn0OS8z/HAsUnQypoaWoo2sJyovm
         mE3ZY1rhbCG4O3xWqpMGUpy/9xcPdFoLwmB3fOwJH3n3E1AL7CKIMNdfI/qD5U8DxMGW
         Qbqf6iMW4dJe02KFgVuJPchd1Yl7vIsKEGqNoqB3PmWHH7t+gqkH9dUuVLn5BbBfBFxR
         N3BUipWt5l8cnIHRSum6xSOBhpUa1++uqpym5quKE53/mMfahGyjtDr2AQ4fb8uyIgm2
         rQwhmDm0ZULszHgla70jeFkwrUb6PhrZC5srT4Q4qXH4VWbLAlFuh7CVh+9HlwGGvbIW
         ZoLA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773052375; x=1773657175; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7R00jT9f/wF6nP47m5GBLd6PhCW+dAuP70evV4AQ3/g=;
        b=OOf0okUrYLz4B96V+ytxwOPD2DObVPE84f/F9SPR1R4TeWfwRTIuhI+Ftrc8swdMb7
         Sf79eFWuyFiNZonMsT3QiJZ1AvsB61fIJOESP+tiylijXZn9GL2XfpyjoH6now1YhyGt
         xUlCYQtq0vEObpN6wfIhW7+sWvmTACbjiHqjLF6ssuK97+VzqsMk2PzGS8jgBWCI/i8V
         HsWcGjyIEjESLewBy0Qt4k6FsLAUT5Jk+DnDTOzE8AbrtQOd5wMilXJZx9T2aDa8/wJO
         H9wf0EevLecgfh3ODbMm8Ql4EBmyL7Ciuyin5FpS4ze6wAstcvAiYR0oJlTwduanTOWr
         HsVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773052375; x=1773657175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7R00jT9f/wF6nP47m5GBLd6PhCW+dAuP70evV4AQ3/g=;
        b=oKxJcAJidIl/nKTOwYIxscsad58diRZdQhsFOlp9hmF36mRKF3kUg6z3u78rsXJBh1
         Yn4KfVptm1lfz+17lj0t4uGMD3V0XeOozv4t2iBgVa/fKgIGYEn1O++a7vfHbS/QpRYI
         1a6mAO2SBV9Ckf7vpzK5NSnLtHiAg1xzDaFjCELX1FYxC0+IeST9I0JIQOgb+M+GkFZS
         4YFDr/QVsGsoHIRbZ0FUhNR7XJuKeTqBfh3+W0FwUzOrD8n/BT/9IzkH3WmacX52i7xm
         rbC74YViFj4g3sqOk/0n5hbOYixv7SHkyXF4WqRRi9eUBaN4pjKTSdYjSflXK3LzZceH
         rTXw==
X-Forwarded-Encrypted: i=1; AJvYcCXQSPFzVqH/LAFgkiRlSCo5VheQK7Jg26y9WNKiQdUxJDM/m5kCxrexohx7416xkHe23eCCrt4pRw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5e5Al/GagoxIb1LtKc8a03yq83a1PpJOQE3G4txW17j8KebC9
	0RKIALexU6FFP3t9Uu7YDtsWla0LeFfXPXZRSpTMBYt9oJApRyQruUjiFCpnX51UlxUI/yxlOlu
	NkLuXGr1MyHpSfIlBusl770kE6cZcJqw=
X-Gm-Gg: ATEYQzzdlJlEuRkQJhInMBumfo3tnJVIjws32fDSm6ahIB4APz/VGW++N+K2kLRyZCC
	fV9zyw+Jehqrm1Mxjer7FU/kaYS9O7kEhzEp2/O2TC0HaDbYSPlDLRUaO9R5b8hd35I2VsUA+5e
	3GZfrGt94zwws12b4rn+7vaO9JMWWH8bNyuTurdiOEXY7TXqH3vNGniOS6ELKFAbQeYncXG5wqN
	bImR5jevsIrsf3XZCvo43wEYHtT0U2QoKL6tfelVJj39vxeUoYkXeD+AhzNaP/iStmttUYbiBXO
	n91TMqE=
X-Received: by 2002:a53:ecd7:0:b0:640:dd02:a777 with SMTP id
 956f58d0204a3-64d142fedf4mr8471850d50.69.1773052375353; Mon, 09 Mar 2026
 03:32:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
 <20260302-orangepi-sd-card-uhs-v1-2-89c219973c0c@gmail.com> <20260307022951-GKC302167@kernel.org>
In-Reply-To: <20260307022951-GKC302167@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 9 Mar 2026 11:32:44 +0100
X-Gm-Features: AaiRm50q4cIc_96jC1UTLpzV5oO0Bj-ABAK0PLIBWIjJCOYDycAu5o9P3q_6JjE
Message-ID: <CABdCQ=PWJKv9x-vXt1_jGgZK+XJzrY71PPECp2FttHrDjA_MYw@mail.gmail.com>
Subject: Re: [PATCH 02/10] mmc: sdhci-of-k1: enable essential clock
 infrastructure for SD operation
To: Yixun Lan <dlan@kernel.org>
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

El s=C3=A1b, 7 mar 2026 a las 3:29, Yixun Lan (<dlan@kernel.org>) escribi=
=C3=B3:
>
> Hi Iker,
>
> On 16:13 Mon 02 Mar     , Iker Pedrosa wrote:
> > Ensure SD card pins receive clock signals by enabling pad clock
> > generation and overriding automatic clock gating. Required for all SD
> > operation modes.
> >
> > Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> > ---
> >  drivers/mmc/host/sdhci-of-k1.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of=
-k1.c
> > index 0cc97e23a2f9c7b2f9376318a8a7ebb860571504..b703b78282ed8d89183c816=
477c149c0a565618a 100644
> > --- a/drivers/mmc/host/sdhci-of-k1.c
> > +++ b/drivers/mmc/host/sdhci-of-k1.c
> > @@ -20,6 +20,13 @@
> >  #include "sdhci.h"
> >  #include "sdhci-pltfm.h"
> >
> [snip]
>
> > +     spacemit_sdhci_setbits(host, SDHC_OVRRD_CLK_OEN | SDHC_FORCE_CLK_=
ON,
> > +                            SPACEMIT_SDHC_OP_EXT_REG);
> As I'm testing on Bananapi F3 board with emmc chip, this line will cause =
timeout problem
>
> [   27.613806] mmc2: Timeout waiting for hardware interrupt.
> [   27.616592] mmc2: sdhci: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D SDHCI RE=
GISTER DUMP =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   27.623007] mmc2: sdhci: Sys addr:  0x00000400 | Version:  0x00000002
> [   27.629429] mmc2: sdhci: Blk size:  0x00007200 | Blk cnt:  0x000003a6
> [   27.635853] mmc2: sdhci: Argument:  0x001ca0a0 | Trn mode: 0x0000002b
> [   27.642277] mmc2: sdhci: Present:   0x01f70106 | Host ctl: 0x00000035
> [   27.648700] mmc2: sdhci: Power:     0x0000000f | Blk gap:  0x00000000
> [   27.655124] mmc2: sdhci: Wake-up:   0x00000000 | Clock:    0x00000107
> [   27.661547] mmc2: sdhci: Timeout:   0x0000000e | Int stat: 0x00000000
> [   27.667971] mmc2: sdhci: Int enab:  0x03ff000b | Sig enab: 0x03ff000b
> [   27.674394] mmc2: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
> [   27.680818] mmc2: sdhci: Caps:      0x35fc0080 | Caps_1:   0x00002f77
> [   27.687241] mmc2: sdhci: Cmd:       0x0000193a | Max curr: 0x00000000
> [   27.693666] mmc2: sdhci: Resp[0]:   0x00000900 | Resp[1]:  0xfff6dbff
> [   27.700088] mmc2: sdhci: Resp[2]:   0x320f5903 | Resp[3]:  0x00000900
> [   27.706513] mmc2: sdhci: Host ctl2: 0x0000400d
> [   27.710940] mmc2: sdhci: ADMA Err:  0x00000000 | ADMA Ptr: 0x02080208
> [   27.717363] mmc2: sdhci: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>
> Drop it will make emmc work again.. but I'm still unable to make SD card =
driver work,
> that's probably another problem
>
> I've took a look at current K3's sdhci driver, all operations on SPACEMIT=
_SDHC_OP_EXT_REG
> register are used only when doing voltage switch with SD card, snip of th=
e code from vendor
>
>         if (host->mmc->caps2 & MMC_CAP2_NO_MMC) {
>                 /* sd/sdio has no phy */
>                 spacemit_sdhci_setbits(host, SDHC_TX_INT_CLK_SEL, SPACEMI=
T_SDHC_TX_CFG_REG);
>
>         } else {
>                 /* use phy func mode */
>                 spacemit_sdhci_setbits(host, SDHC_PHY_FUNC_EN | SDHC_PHY_=
PLL_LOCK,
>                                        SPACEMIT_SDHC_PHY_CTRL_REG);
>                 spacemit_sdhci_clrsetbits(host, SDHC_PHY_DRIVE_SEL,
>                                           SDHC_RX_BIAS_CTRL |
>                                           FIELD_PREP(SDHC_PHY_DRIVE_SEL, =
4),
>                                           SPACEMIT_SDHC_PHY_PADCFG_REG);
>                 /* mmc card mode */
>                 spacemit_sdhci_setbits(host, SDHC_MMC_CARD_MODE, SPACEMIT=
_SDHC_MMC_CTRL_REG);
>         }

You are right, SPACEMIT_SDHC_OP_EXT_REG should only be called for SD cards

>
> --
> Yixun Lan (dlan)
