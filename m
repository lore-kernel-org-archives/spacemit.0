Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CF93E7140
	for <spacemit@lists.linux.dev>; Mon, 25 May 2026 09:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701820; cv=pass; b=kYbPr2jKMSz5Vbtvqyncw9+FbyK6OqIiG0Z2FEVKyoGZIgJ/7Tuf80N4tejzr4gR8kgGLWA2T/ziY9rJgw9dG5AnopJtTA4vRZ5vK+1L52ZICC7IjwjZOdACD1PaxBXwYYK52xf7LGVTxQFbW8inUw1ZrPnwWdvwv0auvksMDmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701820; c=relaxed/simple;
	bh=bG2lZTq0AlonyzQJsp3hruKHT4bKY6rEQmFhRZ/Om5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aZcghT5xdFeplHReSkBvj/n8B+ZDLXLx9rILMsl5RTHQNafnbCJuRTKF/+8Vxcr8840MPm0NvOnMmNCvP8UvQ/fL7hdnR9S8KgZ/rR2xeU+boeJ85gAixkX58sJQoxtsvOrkF5bXqSZq17xNcmPH3OtI0+AS/UTsMxV+xbAVloo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fEipsgfm; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fEipsgfm"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-65c21049dafso8404613d50.2
        for <spacemit@lists.linux.dev>; Mon, 25 May 2026 02:36:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779701818; cv=none;
        d=google.com; s=arc-20240605;
        b=Ry6rwgcaLj8AYEQPZUhCdVVMDNRnxgpN/NXXZKdULYMD15Hv86j3DzTgw6+v9Cutir
         NyXm97T0u09rIrQSRwt1a95yFK9qDgOkDzt1eYitaxdscOaCe96XfgJiqx/GFIfs9T5P
         hCmmlS96KiV42FV1S37wlE4I5w0j1lR3lwrk7A+ejtTMY7ACep26tLPe82NaFddwbM2d
         mdwy2NAnJZ0QmgkWn0f3WCfiLb1pen/8vh95B30Gonuyuvu18uI3V5AXGfuuHFUtwqFh
         1nazQklgRjbsBJ3sAbeTszU+kTaCbpidQagixTmFTIBgqBicyj70i7yDKx+6Tzeo2Zf9
         +GNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bG2lZTq0AlonyzQJsp3hruKHT4bKY6rEQmFhRZ/Om5Y=;
        fh=Lnm5rlNeStMddHrjD2BYa+mdekRl0rPuFkJmOAWokGo=;
        b=JA14gYlNzlUV/qKEXgPAhBn7pmchIgn9VfNZm5w63ludmq2mr2Oq2NUINGrQR1jrwh
         nXDu8mJ5xqHxQEw18iv6CdLmeJxlcFywLCZBZyZBG7GGxtYdJZIf8ly1J4RvIZaFZh2/
         x9ZZg6vW9o2w+rlkkc1X5Zc6mzzZqnH0M/NVxDrSsWPlhXHBLp9dN6XM/g4eddb9D8k9
         CUdCtOgsweE6ZMvfJ4I9vg0ZpbrYcotQT3UdNIHP9binMf/0bA6n1bRqA4ulkw0ySQNC
         VIzYIigIY/J5mg/C58i3kDwk3rYalujetPhUKv01x4aDO3Dckmwuf/T/C4B6wJjz/9vt
         LwEw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779701818; x=1780306618; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bG2lZTq0AlonyzQJsp3hruKHT4bKY6rEQmFhRZ/Om5Y=;
        b=fEipsgfmQHY7uzl/5yxZOglFbiiEMmoiUE6yn9M8x0ZI7AvnwygQ/xfVhSq8ugafE4
         bsgIIJTIH1PIsxLmF9H8yRH16DweA9y0DeFSegCYoF/y5xiCp/2Vome3WDlqnLP/Mply
         hdfjnIEmWFKsTws+JRlVgcVcNHnkoR+8wtQGVkxiURtFEi68Mwg2D0vm6b79l2QUh6Dt
         svpfZiCnCGboGDwg0dp4OXRXcgqXDpBeAow6fJPIo0lVXFWGfMPoRRXS/w/toVC5qDxw
         tt+MQSmOXIjxz5R2juuqGbvnhUCH8D+/mDRHG/2Vr/weRmcpa9Cjg2vyWQBqP7mwW49O
         3LTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701818; x=1780306618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bG2lZTq0AlonyzQJsp3hruKHT4bKY6rEQmFhRZ/Om5Y=;
        b=VRSBkjpQuoJ+X9C5IdKAWXkrAaJWIVeW5I9iUmYedoIuAGbvEivCFH33cUgkj147dD
         P6XNDul2V9sT2JnXPN2y0MDS9cPDCrm0DUgfT9Pw+0ySoiuTRZMGzzFSVDZLzrGZHe4V
         gHXEzjgyIDFbMyW95oAx33dQqzGByP/LgoUZ0dZDhilZqsadDhhXFSbcrPaW7RZ64kX9
         q8m4+mzcHPhOtw5wnXIes2KnL8XYViNDed4HzfcB26hMaemFERov4I8Wb3+LxjJvx0Xr
         ovC4t556Zde3oX0pFMb5d/4dYoFMiKFYxVX/7O+3RQD02ItZUOsBKvxHLjfltQSku2Tv
         e/cw==
X-Forwarded-Encrypted: i=1; AFNElJ+L6YQtxztRuDS4bFnJ3yu6cSC+F/XWLKPVG2qnDtzlRCO21aqsQG+riFGdOldrPtdDD2RETvHG0g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwjaLYoD1ViYIoE+KO76YblDcsCdKC4gr4jvkmmwBSGqEQyu36L
	+uXmiRH7wI3TXnp59Lgn36vQiogTZ0h2DMn440v0p3M9HZ8C5edimRqBF7yKTocDXPdEUPxJHdk
	9eOIHQsQs7VCtFxtkhSpZOL1xodV9RLs=
X-Gm-Gg: Acq92OGhld0EWoru51WItw5bF7rNJ6NvDKKDgIN0sDoSoXctkVHgMEzna34Qbg/phBA
	F131DrFXRMRvn61olGvzyZoruncmJKKorjXzKB+0rGKWmD4nrPtJHi/kkExsjg5xwwYQd2fMZNm
	1HYZDtZY5sjhD3fhwfDHuU7Zpm9ihcoOLaOVpwzc48eC1M+XcXBvhLfYTGMeKPWyDJn8UV4I90k
	4vKPKn4jXG2pmwYSAHTFmQHKjm99LqH2JN8KgSV0O3c2KTiLiYauat2tsLmlzNSdJDU+0AumPuv
	wjzMYDAdpixAR6il45PIGLOXn//AFg==
X-Received: by 2002:a05:690e:4383:b0:654:54f2:9e50 with SMTP id
 956f58d0204a3-65ec9775082mr9988663d50.25.1779701818177; Mon, 25 May 2026
 02:36:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
 <177889984452.2298656.1074391459031404894.b4-ty@b4> <7e68e745-0d70-46db-9475-38d3dd5b9cf4@baylibre.com>
 <6b945153-5a7b-415e-904a-1c350b7d52ee@gmail.com> <86ac46cd-b7bc-42cc-8c29-996ae21f3654@baylibre.com>
In-Reply-To: <86ac46cd-b7bc-42cc-8c29-996ae21f3654@baylibre.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 25 May 2026 11:36:46 +0200
X-Gm-Features: AVHnY4I_k1DJLPTVcDE4dQLLOOZPqA-S_Z9vI3VGZcAzyFnMwYf6XDaI2FWsQUo
Message-ID: <CABdCQ=M_E1uHU5WTXCn2mXaxf3-+7M9gXCL=tp1qBW50jf7d5Q@mail.gmail.com>
Subject: Re: (subset) [PATCH v10 0/4] riscv: spacemit: enable SD card support
 with UHS modes for OrangePi RV2
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Andre Heider <a.heider@gmail.com>, Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulfh@kernel.org>, Troy Mitchell <troy.mitchell@linux.dev>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>, 
	Vincent Legoll <legoll@online.fr>, 
	Margherita Milani <margherita.milani@amarulasolutions.com>, 
	Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Sorry, I've been on vacation and I haven't checked my emails.

El mi=C3=A9, 20 may 2026 a las 13:11, Trevor Gamblin
(<tgamblin@baylibre.com>) escribi=C3=B3:
>
>
> On 2026-05-20 03:53, Andre Heider wrote:
> > Hi Trevor,
> >
> > On 16.05.26 2:35 PM, Trevor Gamblin wrote:
> >>
> >> On 2026-05-15 22:57, Yixun Lan wrote:
> >>> On Fri, 15 May 2026 12:48:58 +0200, Iker Pedrosa wrote:
> >>>> This series enables complete SD card support for the Spacemit K1-bas=
ed
> >>>> OrangePi RV2 board, including UHS (Ultra High Speed) modes for
> >>>> high-performance SD card operation.
> >>>>
> >>>> Background
> >>>>
> >>>> The Spacemit K1 SoC includes an SDHCI controller capable of supporti=
ng
> >>>> SD cards up to UHS-I speeds (SDR104 at 208MHz). However, mainline
> >>>> currently lacks basic SD controller configuration, SDHCI driver
> >>>> enhancements for voltage switching and tuning, and power management
> >>>> infrastructure.
> >>>>
> >>>> [...]
> >>> Hi Iker,
> >>> I've picked patch 1-3, for [4/4] I think it should be merged after
> >>> https://lore.kernel.org/all/20260513071958.29574-1-a.heider@gmail.com=
/
> >>
> >> Hi Yixun,
> >>
> >> That makes sense. In response to your earlier feedback I had drafted
> >> a more
> >> complete dts after another schematic comparison, but Iker and I
> >> discussed it
> >> and opted to avoid changing scope too much. Andre's series includes
> >> the bits I
> >> wanted to add and more, so that works out.
> >
> > I have 4/4 rebased on my series anyway, do you want me to send it?
>
> If you have an update to make, please do!

So, how has this turned out in the end? Andre, will you take care of
sending the latest version for the MUSE Pi Pro?

>
> Trevor
>
> >
> > Thanks,
> > Andre
> >
> >>
> >> Thanks!
> >>
> >> Trevor
> >>
> >>>
> >>> Applied, thanks!
> >>>
> >>> [1/4] riscv: dts: spacemit: k1: add SD card controller and pinctrl
> >>> support
> >>> https://github.com/spacemit-com/linux/commit/2d77e577109967ef65f269c1=
fc1d6a659d4260fb
> >>> [2/4] riscv: dts: spacemit: k1-orangepi-rv2: add SD card support
> >>> with UHS modes
> >>> https://github.com/spacemit-com/linux/commit/2585c60ce2f977b13f14a67d=
1e3ed9c73fd7f381
> >>> [3/4] riscv: dts: spacemit: k1-bananapi-f3: add SD card support with
> >>> UHS modes
> >>> https://github.com/spacemit-com/linux/commit/c76e2f058cbcab84e4a703f2=
6857a58bdf6a0042
> >>>
> >>> Best regards,
> >
