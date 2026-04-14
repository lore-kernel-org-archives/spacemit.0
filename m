Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A05335F609
	for <spacemit@lists.linux.dev>; Tue, 14 Apr 2026 07:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776150740; cv=pass; b=F7NBohtoCRzfGE+MTbCF0wmCDMtwn2WheDldYlF+LLuJbrJYALmhUABlx7uFpAIVzYmNm4kndVzNaQHthKzXBv3cYTZ1GcvKfDMx5tPU6rXOZc27FLPhVklnOknBWV7wB6jiR8mkb1bxl+EUUh/hq4a8AoUz8Uu7RMy8lJFdEOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776150740; c=relaxed/simple;
	bh=W21hpU/zPwJ5KfRYuG7wgrTjSpZ+RFTg6vZLOJQgufQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e3m13b4n60pP+m/P4eVmJV7ZzVePdPhmdvr9WCafb7b+YeQi1sRbCrIWdbFo5cd677xxPb0Oqj9SDATS/CnJZH+rCmywnqskggwOkcAAtlqsYHQBnkrKSDSoK0XbNx4sHkayyeJQ8CO61i347Cxjxkks5evKlikwQIPbZHRJYiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MIy4g4Gk; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MIy4g4Gk"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64d5a7926cfso4786009d50.2
        for <spacemit@lists.linux.dev>; Tue, 14 Apr 2026 00:12:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776150737; cv=none;
        d=google.com; s=arc-20240605;
        b=hS3WV6vG/+wwjgmbkyc1L9XzxY3Hq93rU5uQD6F8Kmt6DFAgxMtv2HdMqUuuWHmY2w
         PWTgHwiUOBdLgFKc7TN+zHhPTVMexR879QKj9+ffK1XTQ9pUSujk5rnF+CRjZ5ezt89P
         aPO0SsrJM1fGTO6AlqbBlA/wtciuR9rFc2x9RMDGhhWO/Q78+/qg1pIEu6dViR0BvZjG
         PdkDHWGwN63dJQDPU1+RXzJExwFSxbpcOwNgaq5bcdbXP/eRrbkzgt8AO/6PUPjggdKQ
         aq0P62WNPzDhqzSIHcXWBb0yxAggjA9215t08I2LlMmNYE9PphZcMTRsN998pKHl0U+/
         ZonQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UEklUAX75lJKcC6L2ltl9qbkuGK/MzM9omGGWWVYxIk=;
        fh=60f4noTB+BZe6oU5W3YZ+Fo7Rgl2ZehGn7a4JAG83u4=;
        b=Um+jR/kZlrFQNEPRXPcJxE7b2PpLCsmwwm9/YwYAZko1uqtqKMYnpXiWG0s0TQXmVm
         QTd9/FzUVdOwDrWGmdsvbdNyFXFR9JS0botnHxhTtdLn+01fYVcvqo2o8BWJ1aWzgdpi
         8MohwYty3+FuP8UCTYTeT3eRTCBIucgasOAHZJXS7MWkFBIS6qsNA/9CK4XwOFp0VSvP
         hXt6vxbrNfZYTkGATYm4qbG4zYSDmuW7RlgjnPaDcsWEATWpsAX/geUDAESfXmsrqbjY
         nHmryd8XgO8/iVw1UqEOQ0jieoxzm0wyCsvQRSkcp3COpN1MD7A0XhQXrzhbn2Dk+DqH
         vExA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776150737; x=1776755537; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEklUAX75lJKcC6L2ltl9qbkuGK/MzM9omGGWWVYxIk=;
        b=MIy4g4GkqvAB4LrMObvEVJBTXNwPJWKCwzTz5HR1iWrS7sK6TQaBaq9lQDK+GZ7xmP
         3GpkoH+umeNiq0keMjFJNNbpcfzC37RH2OZbhBkLcfiE8UzBozfh6FQRd23DVIN40qis
         v/V1XW3kCXrJ9xG3HwdK7efOA9H/swa1mUqFlob9yBho1M8CfmS8seCdNAW7/jtZFmlu
         Y8KEuvuS8CXAw9rO9cIdfftKuxZXnYd6NnYe6vchZA+6wHqpDgNz37FKVBNfe1hLtbDP
         htfJxr3YL4ZVfXh9dk0WhXHC2QRjCwNlbX6t9CeSSrDDoe/yN1OUOgaRRBZd5zx6Gf9g
         metA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776150737; x=1776755537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UEklUAX75lJKcC6L2ltl9qbkuGK/MzM9omGGWWVYxIk=;
        b=czggXNNXeon7WI7SItLRBov+7MD9gH20XbjZe7+AboRiOOcBZZKdqkD+2AWm2EHkf6
         uwv2pox8gZg6p1fMP7ZoInRM0jVqALi1mTziFMWXq9I9frthqg17MTlG1e9fbYNcznzp
         CLHOfNZTuVduHzhq8B//rCjftiNXO+SPHrObQ8Z7v+aLYsIdd/tgAC5k5EhwF6gOTxJ0
         GzQU2NraD9pqOoocnsL41CQM/tF1zrLz7WHJEkT/AXWXQS82vBq5ekPqV6r/Ts3dWHre
         zWRK8RenQd39AGGiccLw52cp3kMcDp2FEZHt2yv/Vm81Bt927ZnUsayV9/88Knn3L2OX
         FTYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/1z/erO34h29x9vLPT42GUFzOc+jBX2v1T1aKt7ZVpFyD6Phb0xJdfdudvZFFr+DSRK421LAtELQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YySO5vLIloX7zQdf22PpPAHQGsV3epj3G23KNiumWQLZ2EimsMX
	RvtakboQAobauISaZoaUHnI0DBwXC68Yz/Skon4CkFcUnY+p6pvQwqcMJoNGHcLmbZsg4SPPPby
	taHTYUs0B2ka+ZT+zBYP2I5YgTzRGO7Q=
X-Gm-Gg: AeBDievLsgz4d8Vt21bc7LYa/1kph4y/Dv7L0aUzPJ1UkUlkcAIbZGaiw7V1B2j1UZj
	Ww61UwIopudCDC0awOXelpNmGUtGDzPz3Nj5R3e7itGUzNnDkque53CzXry+19aNiTYdh7Ju7GF
	wDlxIJDcpa562RbdlwQtOaBQpFFc7bxWYif4nHPmhTmSkN5WDcAUUGOR/VWG5mY3mMsYPc1LmBC
	D9l0oL1PVT+2Qu5la2+BBwtU0Op3dOe4ZMOVaCrMEeEnMCSdicgJPYMRSkSZ7J2YsnysWd0gqtK
	ioebthL2
X-Received: by 2002:a05:690e:168b:b0:651:b5ab:3357 with SMTP id
 956f58d0204a3-651b5ab391dmr9912157d50.49.1776150737202; Tue, 14 Apr 2026
 00:12:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com> <f58ec12c-3957-4d44-b823-6a1ae1a1dd94@kernel.org>
In-Reply-To: <f58ec12c-3957-4d44-b823-6a1ae1a1dd94@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 14 Apr 2026 09:12:06 +0200
X-Gm-Features: AQROBzCH_H9-7w6mImHbEDf_ELHtA5AMJp2lwX6Y8iAqLMql_XXAAzAws0UviM4
Message-ID: <CABdCQ=NhTkGJUh_fKnZoQMzdpyO-UbV5zrSfiNVUC7bkSBifTA@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, Troy Mitchell <troy.mitchell@linux.dev>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>, 
	Trevor Gamblin <tgamblin@baylibre.com>, Vincent Legoll <legoll@online.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El lun, 13 abr 2026 a las 10:07, Krzysztof Kozlowski
(<krzk@kernel.org>) escribi=C3=B3:
>
> On 13/04/2026 10:02, Iker Pedrosa wrote:
> > This series enables complete SD card support for the Spacemit K1-based
> > OrangePi RV2 board, including UHS (Ultra High Speed) modes for
> > high-performance SD card operation.
> >
> > Background
> >
> > The Spacemit K1 SoC includes an SDHCI controller capable of supporting
> > SD cards up to UHS-I speeds (SDR104 at 208MHz). However, mainline
> > currently lacks basic SD controller configuration, SDHCI driver
> > enhancements for voltage switching and tuning, and power management
> > infrastructure.
> >
> > Implementation
> >
> > The series enables SD card support through coordinated layers:
> >
> > - Hardware infrastructure (patches 1-2): Device tree bindings for volta=
ge
> > switching hardware and essential clock infrastructure.
> > - SDHCI driver enhancements (patches 3-7): Regulator framework
> > integration, pinctrl state switching for voltage domains, AIB register
> > programming, and comprehensive SDR tuning support for reliable UHS
> > operation.
> > - SoC and board integration (patches 8-10): Complete K1 SoC controller
> > definitions, PMIC power infrastructure, and OrangePi RV2 board enableme=
nt
> > with full UHS support.
> >
> > This transforms the OrangePi RV2 from having no SD card support to full
> > UHS-I capability, enabling high-performance storage up to 208MHz.
> >
> > Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> > Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> > ---
> > Changes in v8:
> > - Resending the series as v8. The v7 submission failed due to an SMTP
> >   error during transit, which resulted in a broken thread on the mailin=
g
> >   list.
>
> Hm? Everything is here:
> https://lore.kernel.org/all/20260413-orangepi-sd-card-uhs-v7-1-16650f49c0=
22@gmail.com/
>
> You can send individual patches to fix up threading, use --in-reply-to.

My apologies for the noise and the rapid resend.

The reason for v8 was that the v7 cover letter (0/9) failed to reach
the mailing list due to an SMTP error on my end. This left the v7
thread "headless" in the archives without the changelog or the full
context of the series. I was attempting to fix the threading
immediately so that reviewers would have a complete set of patches to
look at, but I realize now that resending the entire series on the
same day was premature.

>
> > - No functional changes from v7.
> > - Link to v7: https://lore.kernel.org/r/20260413-orangepi-sd-card-uhs-v=
7-1-16650f49c022@gmail.com
> >
>
> You already sent it on 13th of April. And now v8 the same day. Wait a
> few days to allow people to actually review your code.
>
> It's BTW merge window, so big series should slow down.

I take your point regarding the merge window. I will step back and
wait for feedback on v8 once the window closes and you have more room
for reviews.

>
> Best regards,
> Krzysztof
