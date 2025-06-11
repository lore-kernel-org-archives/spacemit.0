Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526BC2BD5A7
	for <spacemit@lists.linux.dev>; Wed, 11 Jun 2025 14:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749652843; cv=none; b=C51aN3Os0Smm3DAC0tzL4NetOjBYYYTi46DOJ/EG5iyjmPcF8pWhCkPiZ2CIdt7Nrwq6wLu8qEGCYOhcW+JTPUA0LIliFym7+FiQDEBvbydrXiQy64yiMIc0e24Dz7oAfQyVNFc5aPT22l5UNa4ExA3IKgCsyRqsmOUamjR9aK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749652843; c=relaxed/simple;
	bh=Ves9IAlDOG6rT2wK3GTXUgHQbJsl7xwyic6gvh9n1D8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KlfmF1SU2dnBcibc77OxuceeYMDbXtLlkAPWj0k3K90M7iPF/2BpUbeKe3bv0boO4lk10VWmdTehvXVgmWSDxYHUMfAVvod/yD9DV1mzHzJ+Bzej/RmGoP4sa+Ef5m0jPDKFK3V87sQ9XYSyobwZGfzdmPICCTH//nqSsb85r0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=g6lYasHP; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="g6lYasHP"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so12753820a12.2
        for <spacemit@lists.linux.dev>; Wed, 11 Jun 2025 07:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749652839; x=1750257639; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VanCGAV853jeZl/piu55b8cOeQ1lh3SiVReRL2SvGyU=;
        b=g6lYasHPBUaCer8M9GAFAu42XGehKjygfHD2E6QolXke/hZyfxZeFB24zt4dqv9UVO
         S4NisBrWdt5YUl5rzbAiek/nGWa2KvTjeFswOKcTVSKdRVG9ivsmTuS1V7LRxCMPRGY/
         mjswQXBu1LrC3qsONprSFIlYpP4DnYJfLN61DHlgfpWXEDWxO9SgmxHWJ9mchgd5Xrmx
         3VQpykb3wxiCwxXsCXKCwOOo9c2Yo0MhKDUByxjluLkjk+q55GhL/rZOpuKluAeM+P0P
         drTql0Uln+Ya0Oo8Cr2Z2GbtbsBezx93DK+qCo87oTREXsmYUd1nAls+ZkBe3O4DgIR0
         tQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749652839; x=1750257639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VanCGAV853jeZl/piu55b8cOeQ1lh3SiVReRL2SvGyU=;
        b=XgW1+fPJY1+3PQCptA8ta23ZK+qbUEF35zp63aYd63utWa8TkZq6NaHvCap5cM9BGK
         /3hLAPWXI/ParpfaBVGKR2FUB//ZQ7aglNLLVYqIRSUJWHEihAK4I65hzVxHtywaFKqE
         M+2GNrlHqGZRuxGL2rCs9QIdFwtwC6W5yYRirHkImaDe839ZxGVyV9nPT5mcY/SdqtLJ
         KDgSIbCqoZYJijYtmXZvsIU7XW1NqgA3nDbttS+5cSBZSYzMvoUp7yDLBeXL1ZtjDE69
         kDKav7sHpsAn0y7436PEZC8pf3+9SyE9fiIAK9nMJsJxJOnzu0FmhRR6wSPLSIDrJtya
         rDcw==
X-Forwarded-Encrypted: i=1; AJvYcCVP6/od3O5HWKNJymTxqXJ0kvalBTzbMzKKRqb3J2PE5d42r+M0/vjlzVvWSZBB9Tu4Gk+NNPLUFQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxOKSOWx35Q7gQml19LiO0UEN79QxF6xEuXzOmRcDu6fzBC7XFb
	bMHXH/Iz/Kikp5oSqUFynFVwk5roHpTSLv5uo1FM/LWTwJj+O7ozfanpFUugDneilxawD0tV3dv
	899OqfeKARJU5CTk84w5cANolXsJM8NIIlWQCt7BvsQ==
X-Gm-Gg: ASbGncvvXjwwwfZx9o9BgueHOOEIiP+IaRcdk6ALn0f/YJguk6s7uZ/AX3s8y/hzXR/
	NBNdr4nK6mj6ishHZeGBVsoEDY3HlqcSyx1IdHGeArL2tmRK3F5rkfFBWjdsWC5P+1iciZZL8zY
	8teO+mIC7m1LEIE6c0eEAoPoldxSyRe2xGFwop6Otp2aAZ
X-Google-Smtp-Source: AGHT+IHDSmTZDyiDRZOD1n1VEoO2BN/q5+1t3d32dZUsxmTdSpg0xwKQkFHQYBpUpsmp4CIhNRKBUUObLCw4k1Y89D8=
X-Received: by 2002:a17:907:968a:b0:adb:1804:db93 with SMTP id
 a640c23a62f3a-ade8c8eff15mr309077666b.49.1749652839519; Wed, 11 Jun 2025
 07:40:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250611125723.181711-1-guodong@riscstar.com> <20250611125723.181711-8-guodong@riscstar.com>
 <20250611135116-GYB125008@gentoo>
In-Reply-To: <20250611135116-GYB125008@gentoo>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 11 Jun 2025 22:40:28 +0800
X-Gm-Features: AX0GCFtLP8n8AGHV29EjK0zTceQ99c8B_7Z1bY9fkoSHAd2Q1BdFWQkZ6Pv-a54
Message-ID: <CAH1PCMbP54PRq27p7Ss+cdvB86M8k3CQepzxJwfpwfJPPnrMag@mail.gmail.com>
Subject: Re: [PATCH 7/8] dma: Kconfig: MMP_PDMA: Add support for ARCH_SPACEMIT
To: Yixun Lan <dlan@gentoo.org>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
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

On Wed, Jun 11, 2025 at 9:51=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Guodong,
>   I'd suggest moving this patch after 4/8, as both of them should go
> via DMA susbystem tree, or simply squash them?
>

Thanks for your advice. Agree. It makes sense.
I will arrange them.

-Guodong

> On 20:57 Wed 11 Jun     , Guodong Xu wrote:
> > Extend the MMP_PDMA driver to support the SpacemiT architecture
> > by adding ARCH_SPACEMIT as a dependency in Kconfig.
> >
> > This allows the driver to be built for SpacemiT-based platforms
> > alongside existing ARCH_MMP and ARCH_PXA architectures.
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> >  drivers/dma/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> > index db87dd2a07f7..fff70f66c773 100644
> > --- a/drivers/dma/Kconfig
> > +++ b/drivers/dma/Kconfig
> > @@ -451,7 +451,7 @@ config MILBEAUT_XDMAC
> >
> >  config MMP_PDMA
> >       tristate "MMP PDMA support"
> > -     depends on ARCH_MMP || ARCH_PXA || COMPILE_TEST
> > +     depends on ARCH_MMP || ARCH_PXA || ARCH_SPACEMIT || COMPILE_TEST
> >       select DMA_ENGINE
> >       help
> >         Support the MMP PDMA engine for PXA and MMP platform.
> > --
> > 2.43.0
> >
> >
>
> --
> Yixun Lan (dlan)
