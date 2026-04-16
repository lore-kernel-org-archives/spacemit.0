Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE0237C93D
	for <spacemit@lists.linux.dev>; Thu, 16 Apr 2026 08:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776327554; cv=pass; b=lsvZTtTXqOWY/vW1lwdhUEBZ88JutBsngZ1k3NsvDy7QKfrwQLHQ090b0Ps9/XYZ1xbvo3yfNaDLxEUZSFSR7hNi8tJ2wx1Li7snY0+CJBqwSf6XwexvqJPBQPYBRgePV/BNTrOFKiVLf/+BqgIphdOc1A0UNTpngj+MvD7m35M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776327554; c=relaxed/simple;
	bh=gyfD8pfwhSxVR5c5TiqO6lAdCFrxa/LwfKRn/PLAYnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D/J0vZ3LtRaqXKA8KW6d3xQgABJZbSoKJxJfTCdmdG2yXB6JH3cElFtKYwiopztlZxSMIkkjQ0cimjjdjM+ibuMCFUvw/rQ5a6wPmGrVFgMR1iR+aXT+bhV0+MXAmlo7aWiIO3q8Mq+8sxNYk/eZwtax5/bBA7YMNWftdVqw/58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l9FtrUwX; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9FtrUwX"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-651bc8f864fso3323182d50.1
        for <spacemit@lists.linux.dev>; Thu, 16 Apr 2026 01:19:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776327552; cv=none;
        d=google.com; s=arc-20240605;
        b=UpUzvFkKNW+PkEkOuKOFJB6FL0BnyjPRLCPMQqOOl9fAa3F8Vb8xoezUX2E5LYVQXq
         kPO7dmZOwwxFI/fWlbx2JgVXp4mC4hIjywrG3QpgZlSQfekkhhHvm+jNhSfvVflh5Slb
         ZugU61CZZHeqaUDpRYriH/SCuLthha+Sl59FTjCeLN1RAOF+nut8XEKYrghFXrnCwthr
         g4F/HxONjev9rKnxVaIL8jfpoNtwoBYucpUe28fnODVSptqIiML4w8HoYDarp3aiQohA
         +gidT9Zor1Cd9nguB6uzM7OB/eRMTNbx6OzNDx/XuHV7j0AYzIqcK560gLPYJosOM0VK
         BHqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UYfM78rx5R3ZVmMPKEfuM0RYI+r7ma+Zgwh+UTlTNLE=;
        fh=wd1vtoUw5KYVD0LiHkVAnOf6LEWN2IFEADVaDIoi+hs=;
        b=PWBbLayo4bc5OD6740qbrDqjPYJ+OCAGDSRi1oojpbFOOOYfQBjHsnpb5Ys25cQOPc
         L2tpmENfqAvkvtZ1Ez3+izaC5OfL30zO2me4z2jXdB1D26lW7+PM/+qVcKryXsUySTZD
         b2uPSAfAkcn/DWV5AjmJ15d0e+sZBNRIcjY78OsHpF6bkR389T6CNjLHbXmM6ePb5WCi
         F/O5vzXc71MjD52Eu5w6zOfiBPuKGoPZRFHLhq87ASkrL3Cnh0exNK2FMXcfzBVAK1Rm
         N7k+PzEVw9ZeLXyFvT+MfrsAnxvzFoIWh38+4LRXRhKiH4M+4d2vB5cb0m9HUu8HJ6FC
         Ddbw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776327552; x=1776932352; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UYfM78rx5R3ZVmMPKEfuM0RYI+r7ma+Zgwh+UTlTNLE=;
        b=l9FtrUwXij1+8IwOQ3SDi/DBFJsd1EADzb+XA+O1oX22X294jr0a8/6yWPdi9ZPBFX
         eDULU15+l21tswcFK762u0DKfGdNG67InTxH6AY/OZJ+yi4D1XQcxn40bsNe6bYgyajX
         eCzdb5Bf29d9QLyms9Cd3Z5STrgUDDj+aPZWWgSh2JTn4tbJT4hxSv6QCGvB16qCWUpG
         EFycFUpKTUpOn6BpcF0NYBaT45fMNvzZfzu/rmUuwtL6DHZeYBLqoY0vx7AQXmrJ3cKQ
         JyXIz0wrnzh5GABNpjtn9eVMSioUF1oB8oxI6z7JNd/SOGk+1P03/8c+pOHnsgUz6RW8
         ZtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776327552; x=1776932352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UYfM78rx5R3ZVmMPKEfuM0RYI+r7ma+Zgwh+UTlTNLE=;
        b=Q2zBK47LYyip5Bo7Z4/T3TY5b4tUOdbodktmkt2TBQ4dm0SVutjtu7CIeq6gweovKU
         +D7qgPUXj+mK3WbbK0guUv7noREjZczmqhMQWFTebecQDEe5Q5IxBHgNiiR5BkrENbXq
         Rrd+p9R4l4nmg6Z6fcKEvXOWQT9RzaWJuRppbazLJRcyEv2KgOeXlNxmBUjLiOiIuCFk
         Zi04fFsbYPR6qq1KeDKPw8YtccRWlbg2YZuocbqZCJQkfAH/ZCWGJSD5YbgM01JH9Sd9
         rctotiDAb6uwlwErsz0yIzvXJjqC+kCfnBeli9jFyqe9j0VOcsRqzM7m67WAsAt6gwTn
         UtiQ==
X-Forwarded-Encrypted: i=1; AFNElJ/keY2ClhKIfmYq0GEWnEdkDvzCaznV3qGIqtg2WcBGXp7CT8VjJbmEmfu7+2XE0NQnLyy3rAlSIQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzltoptFX4Sxu86+1G3VnNnf4+qQ11gvW8mWwgHLk/o8/lMUtpP
	4zr0shRzIm2m2HRoQ7KUBlWZ4/gAN7UC1QC3Shx9h7MhUCDNKU09/R4SD+m/lGC08em2/tfBJj8
	UzjYNo0+SlL8p1fnNUsshJbEqfLEIAfI=
X-Gm-Gg: AeBDiesgmydRz+T9QB4HfGCvMSivhmMxxNViCbC0IhTTYUMrPxGj1vUlx2L+cAr1p8R
	UavGfLJGDQ6FVjyCujieEZT7lslclHDYWiFgHNbNYsSwWKJnPheAg5/TboP9qYY3c4O07F3gUpp
	3NyCqG214BpbNfjVpC/inid4PnDdtYryDcrtA+QKHW2GyZzFxTbEJkOeddgnehBRtLIyWrdMlic
	bXnSBauxFNsS3yvVzgzpGSHYSjScrLaZhf67PWnnqnbKo6GrWMa6VKBHD4zrvXDJ0ATG/E4WtUh
	JDo9Oiqet9SF7i88F2s=
X-Received: by 2002:a05:690e:bc3:b0:651:becf:4523 with SMTP id
 956f58d0204a3-651becf5113mr15959082d50.62.1776327551592; Thu, 16 Apr 2026
 01:19:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
 <f58ec12c-3957-4d44-b823-6a1ae1a1dd94@kernel.org> <CABdCQ=NhTkGJUh_fKnZoQMzdpyO-UbV5zrSfiNVUC7bkSBifTA@mail.gmail.com>
 <DHSQ6VG82QYX.1EVAYV9JTBCL7@linux.dev>
In-Reply-To: <DHSQ6VG82QYX.1EVAYV9JTBCL7@linux.dev>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 16 Apr 2026 10:18:59 +0200
X-Gm-Features: AQROBzCXo6p3fgZAxRfHTUW7b152HxWrs_jxAbTxvFG6AIyn1RGKEh6tq-Z2nFo
Message-ID: <CABdCQ=Oata1oXds6pV-RipwZjcztM0xk_J=Rk8Of2w2RqegbHA@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>, 
	Trevor Gamblin <tgamblin@baylibre.com>, Vincent Legoll <legoll@online.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El mar, 14 abr 2026 a las 10:16, Troy Mitchell
(<troy.mitchell@linux.dev>) escribi=C3=B3:
>
> On Tue Apr 14, 2026 at 3:12 PM CST, Iker Pedrosa wrote:
> > El lun, 13 abr 2026 a las 10:07, Krzysztof Kozlowski
> > (<krzk@kernel.org>) escribi=C3=B3:
> >>
> >> On 13/04/2026 10:02, Iker Pedrosa wrote:
> >> > This series enables complete SD card support for the Spacemit K1-bas=
ed
> >> > OrangePi RV2 board, including UHS (Ultra High Speed) modes for
> >> > high-performance SD card operation.
> >> >
> >> > Background
> >> >
> >> > The Spacemit K1 SoC includes an SDHCI controller capable of supporti=
ng
> >> > SD cards up to UHS-I speeds (SDR104 at 208MHz). However, mainline
> >> > currently lacks basic SD controller configuration, SDHCI driver
> >> > enhancements for voltage switching and tuning, and power management
> >> > infrastructure.
> >> >
> >> > Implementation
> >> >
> >> > The series enables SD card support through coordinated layers:
> >> >
> >> > - Hardware infrastructure (patches 1-2): Device tree bindings for vo=
ltage
> >> > switching hardware and essential clock infrastructure.
> >> > - SDHCI driver enhancements (patches 3-7): Regulator framework
> >> > integration, pinctrl state switching for voltage domains, AIB regist=
er
> >> > programming, and comprehensive SDR tuning support for reliable UHS
> >> > operation.
> >> > - SoC and board integration (patches 8-10): Complete K1 SoC controll=
er
> >> > definitions, PMIC power infrastructure, and OrangePi RV2 board enabl=
ement
> >> > with full UHS support.
> >> >
> >> > This transforms the OrangePi RV2 from having no SD card support to f=
ull
> >> > UHS-I capability, enabling high-performance storage up to 208MHz.
> >> >
> >> > Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> >> > Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> >> > ---
> >> > Changes in v8:
> >> > - Resending the series as v8. The v7 submission failed due to an SMT=
P
> >> >   error during transit, which resulted in a broken thread on the mai=
ling
> >> >   list.
> >>
> >> Hm? Everything is here:
> >> https://lore.kernel.org/all/20260413-orangepi-sd-card-uhs-v7-1-16650f4=
9c022@gmail.com/
> >>
> >> You can send individual patches to fix up threading, use --in-reply-to=
.
> >
> > My apologies for the noise and the rapid resend.
> >
> > The reason for v8 was that the v7 cover letter (0/9) failed to reach
> > the mailing list due to an SMTP error on my end. This left the v7
> > thread "headless" in the archives without the changelog or the full
> > context of the series. I was attempting to fix the threading
> > immediately so that reviewers would have a complete set of patches to
> > look at, but I realize now that resending the entire series on the
> > same day was premature.
> So that's why Krzysztof said you should send individual patch with --in-r=
eply-to.

I see, thanks for the clarification. Just to clarify for my future
workflow: is it acceptable for a series to be 'headless' (starting
with Patch 1) if the cover letter is lost, or is the cover letter
(Patch 0) strictly required as the thread root?

In such cases, would it be better to just send the missing cover
letter as a reply to Patch 1 afterward to complete the thread without
resending the whole series?

>
>                                       - Troy
>
