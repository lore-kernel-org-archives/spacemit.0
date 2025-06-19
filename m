Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F9C1EA7DB
	for <spacemit@lists.linux.dev>; Thu, 19 Jun 2025 02:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750300169; cv=none; b=NPgdyE+o7FCW1tBKy26pI0/wVaknJwh4NxexOOUmtedcLYip53e7hkk6385qeeXRY4F5uocjH6TlT4JBZbrDiNOK/N3i5sAVk/vPgOeEab6lPk8j5wBQHlyEQAWLTiGvRt2tjhoS0L63rq75/fg5EDgx2csU1JHc/M+Tl0iiu1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750300169; c=relaxed/simple;
	bh=L2w4QtkDjTcxS3Jiw42nicI67aVG96GPyXoun25RMB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QF7VN1vTM5KtEvnQFUATfjjkAsJgb9x4GNxzt/Z0fkCRwUpptq4Oi8uoxQ/n7SbqRViDTTBRg9KhE+rQIsJdkMM33fhq1USB44LBJ8o3T2dCC60zhwVRNxovtCDoqjzLRWppgqNdCp6TnC+DT+E5UATRJIDlCsBYjP+3TBopDgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=PtyAisX6; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="PtyAisX6"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-70e767ce72eso3290817b3.1
        for <spacemit@lists.linux.dev>; Wed, 18 Jun 2025 19:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750300166; x=1750904966; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDeHL9d8vuK42id4GVmvojG1LbxVd4OxULlS/3TaFoo=;
        b=PtyAisX66kpIb+uuGEspFVH3e41jR9SGVrweXisHVWZP0hCfUoz+y0JALdA9PN4UDO
         zQaBed6S56UKH84qUqaodym1++PimU5UZ7AA3YM1nG8eEhh/Hry6BKypneNvl4A9NkyE
         80LTrQrTxkO+FF7SGLq7Mr1I5DuOPuGEM8QSjFxWlphYooJje6vb6SJZYCvZa5sCO3Go
         DGbCWXmeEa/TMn1uXkO0WzxiK03ddmaO20rsvbru8u1I32cNRyR9Q/dkKW1vvz4FFJtV
         fSEK3KF15exm002fyuKUgQ5+E3PaoBo6GuWLP/lPswjtrOFaxnCZQ9uAV933EagSV98k
         cAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750300166; x=1750904966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cDeHL9d8vuK42id4GVmvojG1LbxVd4OxULlS/3TaFoo=;
        b=i0kxQn4MuvO9pQPW7nOtLjD2C/2VjEDyKRM9+DeLVMxPm672QUcjX1hEjPG2dOJJTu
         wWgeBktBslQZnCBBIar/F0qDAiJkQ6dzrLL17Gy5COz8eR0v28A+GyLrOXt8ySJa5hnh
         VMgQhUqRO1qoGOdAmndoT2s7sy65cqa4T8p/UV4UPUqOjDhMD0xxw1KB0J9DVLEcHQPo
         p17Oon2ZWKdzlt+bBneQM2q+XVWVMMP0AgrsKwesQxTlcRoyZrUC3pZ1AzxDSrvI0yo0
         9tTgCxdSMmk1nyRTU5p4FuXXl6rs9KBTrH6vGwYQxTnMdlMbe1T2PliDVNfaLXPohdu6
         uFEw==
X-Forwarded-Encrypted: i=1; AJvYcCXisxwU8lCM+PktnornTG3tPDfPsfg/7JXn26pc4K7Fh26orhW8y+xb443c8b0bmxsjfQAipeEzsA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTsXWPCtzf8SzbL6j3U57ykRqKK3+ixCktVgBIOr7U+HtD4AMj
	5bjlBF0dee+xmuQyR1VYYjj2fvabv3xBMPHQihPhDMX3KklAzh1FIlwlM+S8RpnO8BE97Lizlvs
	Pi18LyJvvK5L/SeLKs5TgiRZc31/9+Fj63L03l+ncRw==
X-Gm-Gg: ASbGnct8qZxqgE6LoeorBtHBdGAy+zm4rMONK1Psf+k2O6M1XDyh1MlnMpW+8BwUzPD
	JE6Evxqv6O75kf4x9tysI4lFd2+uTtBHreeMPc54kV8VmqSwspcLVZVALuBKH4GeW0N3AtR+ssP
	VOVyeVj9LY5/ROq5aZm2cHahVFy07qBRVzWbdm1HsUXQ==
X-Google-Smtp-Source: AGHT+IGTWcMJ9e18SuuZAjhMb+1RhUC5KbFMVpAzHRzN1h0rYVrbKTgujtHTi15citzRIXK4WE/50371Bg3VPce6S3o=
X-Received: by 2002:a05:690c:4442:b0:70e:29af:844a with SMTP id
 00721157ae682-711755076b4mr289656047b3.18.1750300166249; Wed, 18 Jun 2025
 19:29:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250611125723.181711-1-guodong@riscstar.com> <20250611125723.181711-3-guodong@riscstar.com>
 <aFEEhik8x2k5_myN@vaman>
In-Reply-To: <aFEEhik8x2k5_myN@vaman>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 19 Jun 2025 10:29:14 +0800
X-Gm-Features: AX0GCFsoo3SDAFCWa_VQKJiemtWkvUSERAjA5vBX4NjZ4H9AqhsVRRlcUwFSJ3A
Message-ID: <CAH1PCMaD1muAQWRUfDJNKZL+-y31MBbw=aeD8VgEGxJE3eATbA@mail.gmail.com>
Subject: Re: [PATCH 2/8] dma: mmp_pdma: Add optional clock support
To: Vinod Koul <vkoul@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, 
	emil.renner.berthing@canonical.com, inochiama@gmail.com, 
	geert+renesas@glider.be, tglx@linutronix.de, hal.feng@starfivetech.com, 
	joel@jms.id.au, duje.mihanovic@skole.hr, elder@riscstar.com, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 2:00=E2=80=AFPM Vinod Koul <vkoul@kernel.org> wrote=
:
>
> On 11-06-25, 20:57, Guodong Xu wrote:
> > Add support for retrieving and enabling an optional clock using
> > devm_clk_get_optional_enabled() during mmp_pdma_probe().
>
> Its dmaengine, please tag them as such

Got it. I will do.

Thank you, Vinod.


>
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> >  drivers/dma/mmp_pdma.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
> > index a95d31103d30..4a6dbf558237 100644
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
> > --
> > 2.43.0
>
> --
> ~Vinod
