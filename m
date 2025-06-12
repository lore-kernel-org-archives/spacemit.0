Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480F02D7BF
	for <spacemit@lists.linux.dev>; Thu, 12 Jun 2025 01:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692954; cv=none; b=VPc1VeTu9qlWhyTs1xmSb65g+ARH09eAdqo0YPprm4wW5QRqqtUUJ5iBDnpDnDLizB0/liccUN4XE9JcpJB2LRHERIr8GIBBFbNQEHrOUSq60JuqR+k2IyxQzFTgJQmlk8QcU6NsiPml2CWHNfqD2X8EltMwZVcAhtBuX2DzE2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692954; c=relaxed/simple;
	bh=5kLQjd6AzdXVJDSfbwMG/b2U5PBjG3cD+vDIQsbcSVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NyxtEeNnuJF/iN+vVp2iyaPptDsjb7VUlmohCr9ZXUDoNKFicCMd5CpOuS16pi9Os07KBF3m4WXlRwIuWOw9+O+cavkToRPBJbLx6gpcFELPR5FJIUzNyxDgshEWLw6vrrzt82zyGHLRm7oaVYwYM2x7T4XT9nbf2qKcbZ3V8Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=lKwEe29U; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="lKwEe29U"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-606c5c9438fso1021512a12.2
        for <spacemit@lists.linux.dev>; Wed, 11 Jun 2025 18:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749692949; x=1750297749; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeRmmiJk7dyHe2xsIaa6eDpe9k71PqYl6SPvF++88pc=;
        b=lKwEe29U6MItoFuX0bod9pgSGrVXlIz6/eOUi0EelzrS8clrWKWjIt52HGC9OpAVS7
         dbME41N/539lx7oI1GOKUosN9lRekAh9hVyjNTUsQy93Zanmame5rSS8Hg/9xGO/j9jA
         5mGMWVBbMfE7VtFglAzv/PQSZBtfg6s+7ZWoY0yuOnfKsFwzlE3/OmiH8RG6fPShlbBq
         N6ui1zfZC4faZffG25ywjKw/onxU/akzt+8CBH3JX59bFqBjMfh8zaKLrtfggOhZjwx/
         sp7Ifq5OvjAftUnvfPLZmsfiY9GCG7SCrOI4/7z9IDSdFkyqS8Y2IvG7RDjc1fCe8OXy
         MzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749692949; x=1750297749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zeRmmiJk7dyHe2xsIaa6eDpe9k71PqYl6SPvF++88pc=;
        b=D6b0/Zi84/2YAlJjj3VeZCMPKa+rDolFCp70vmJ569oAoOHeWvYdV1VayKqVL+SfyS
         +fr4AjPtpG05XZFRerlziK6/3ZWg2/l9hc1hXKFmKKSwlKNOAU0aOMeARcGdPTGJkC2N
         d1EWKVxz1f5Db2i7LKVln9EX8JPM5qCVp99GpP5Zr4z1p6wx+DbPJZophEA30/sqISGR
         SrUvKdP3EAwTMkqopCKrrfWX/1LMaNQPFph8VnxYtCl1K1cYPzZvmKczC8UyqBOyZ7h3
         W1OdFhVVK1OajhAsVThQVVTzQeJ3+bKmE8wVe4Im1UVjrClJ/VYxvBZVhb+noq0y+cct
         /POg==
X-Forwarded-Encrypted: i=1; AJvYcCUuzUJJNJkFR8sTG0/Y4N10WrkSteXdrfCLhiSvkUEhPhWK39k1mr//0HPZzE1HZXzNYd2C+zFRFg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwxDPVfNm2aJuO9+Qlyuux6RptaEjT1U3We6L+pzqj7y5jXUIPR
	49Ji32vZm4DtX8glvQcspA/wck1cdLZYHlwwwDZVxXTjHZ5EMksqqLhSY5hTb/oPehq+jeerdjL
	acm2aaSGZksFy3Q5bkqdTmYR29ZSIDxe+qv9jvI8xXw==
X-Gm-Gg: ASbGncuiYZl9BdQeMM2u6PikycWkE37ZSaiqWNvN39Lt+poKeoFD4NKc5Xfo26YIL/1
	BsTHwcwcS79rZYAFWVkk7IC4SUenuBisxdfBRN8V+h4j8BHBSV6E/kAgTSP+6r8L5dwiVDkPZ04
	AYKxoUDwbEfDE9ZBXLZDDgoppVCkueTG5iAHS5eEAv2hWj/K+pSHBhUUU=
X-Google-Smtp-Source: AGHT+IFqEcHJsmVoMqXHHPFn7yHeR1oDGdJeaYWXWqBT/PegqYwsZ5z0ffozW4eWFgBnqvaTPT/vq7D0XhuX7E2hMC8=
X-Received: by 2002:a17:907:1c19:b0:ade:2c48:1ba7 with SMTP id
 a640c23a62f3a-adea9a57710mr122939966b.55.1749692949426; Wed, 11 Jun 2025
 18:49:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250611125723.181711-1-guodong@riscstar.com> <20250611125723.181711-2-guodong@riscstar.com>
 <20250611-kabob-unmindful-3b1e9728e77d@spud> <20250612000354-GYA127864@gentoo>
In-Reply-To: <20250612000354-GYA127864@gentoo>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 12 Jun 2025 09:48:55 +0800
X-Gm-Features: AX0GCFvb3rY5RbOdj--6bI5I0CRQw5-xjkK6pB9t5n94l_np5ZJaDhu5M4gwDF4
Message-ID: <CAH1PCMbZRhrrKy0TV7D9_nOKkPNuX7gXyyxtzhf_q7vcfhBB_Q@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: dma: marvell,mmp-dma: Add SpacemiT PDMA compatibility
To: Yixun Lan <dlan@gentoo.org>
Cc: Conor Dooley <conor@kernel.org>, vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, 
	emil.renner.berthing@canonical.com, inochiama@gmail.com, 
	geert+renesas@glider.be, tglx@linutronix.de, hal.feng@starfivetech.com, 
	joel@jms.id.au, duje.mihanovic@skole.hr, elder@riscstar.com, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 8:03=E2=80=AFAM Yixun Lan <dlan@gentoo.org> wrote:
>
> On 17:27 Wed 11 Jun     , Conor Dooley wrote:
> > On Wed, Jun 11, 2025 at 08:57:16PM +0800, Guodong Xu wrote:
> > > Add "spacemit,pdma-1.0" compatible string to support SpacemiT PDMA
> > > controller in the Marvell MMP DMA device tree bindings. This enables:
> > >
> > > - Support for SpacemiT PDMA controller configuration
> > > - New optional properties for platform-specific integration:
> > >   * clocks: Clock controller for the DMA
> > >   * resets: Reset controller for the DMA
> > >
> > > Also, add explicit #dma-cells property definition to avoid
> > > "make dtbs_check W=3D3" warnings about unevaluated properties.
> > >
> > > The #dma-cells property is defined as 2 cells to maintain compatibili=
ty
> > > with existing ARM device trees. The first cell specifies the DMA requ=
est
> > > line number, while the second cell is currently unused by the driver =
but
> > > required for backward compatibility with PXA device tree files.
> > >
> > > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > > ---
> > >  .../bindings/dma/marvell,mmp-dma.yaml           | 17 +++++++++++++++=
++
> > >  1 file changed, 17 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/dma/marvell,mmp-dma.ya=
ml b/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
> > > index d447d5207be0..e117a81414bd 100644
> > > --- a/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
> > > +++ b/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
> > > @@ -18,6 +18,7 @@ properties:
> > >        - marvell,pdma-1.0
> > >        - marvell,adma-1.0
> > >        - marvell,pxa910-squ
> > > +      - spacemit,pdma-1.0
> >
> > You need a soc-specific compatible here.
> >
> is the version number (1.0 here) actually documented anywhere?
>
> otherwise I'd suggest using "spacemit,k1-pdma" which follow the conventio=
n
> which already done for spacemit in other components..
>

Thanks Conor and Yixun. I will take this compatible string
"spacemit,k1-pdma".

-Guodong

> --
> Yixun Lan (dlan)
