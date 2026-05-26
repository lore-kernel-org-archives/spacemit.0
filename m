Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E903D8120
	for <spacemit@lists.linux.dev>; Tue, 26 May 2026 10:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779789910; cv=pass; b=RUTEvWU/5bv3myhs6QCSGLbzKTcWznerDbQjA6m4+7IbsLMJ6V2N5oYCpxWmFfLR6I3zA84QuP5CCqHiscSRC5/+9ZeSWKhh1o4h3HPUGiUCfvjMU+Al9pPNTyj89Osr8z5dRrgpnFkC9BMBCRzszYpOSxB4t9CdJUfSgcORMCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779789910; c=relaxed/simple;
	bh=X3cm2efKY/Zhxh28wLxbsEMQLe29t+d8ccezL5bJqtw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gA4jOyzoarV8jFMkmatxWDfQXa70cyg+SQ6uDA9u9P2TctIBYgYwjICbO3VTmw3pcSbE1c71wORNugxcy2UyTwv5idsZ49oEOcTivAEUH26IvYs4KxYYCK8JjZxiYHBImtLPortwwnoi+iwFuT2Y+TQTbd1PPskAA5O8eN6QFp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1YstLYB; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1YstLYB"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-651bc83e74aso10602881d50.2
        for <spacemit@lists.linux.dev>; Tue, 26 May 2026 03:05:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779789907; cv=none;
        d=google.com; s=arc-20240605;
        b=e0M/doMXIyILx5GZt0EL/yydCtqPNPTEZ2tNgT+obOzsR4EnmFpsUE7SfaAQGGU6YM
         jeWY3zKUcqn9fe2kUVys8W9BnSEHmoiWEcvHXq2hOxpSu6ChJ8LVBJdMAFGEUvytXPPy
         x4tT/456WKA6EL1zw5tHnuRWK9Ebl5XX5jCVAsNbw27/ojcB2WtKnS1YcIyeRFCX0wva
         Jn6/sngMxYYhXN2obF/fGnUNbzZHmZ20Hv1TzvNpyO2rQmODxxq2TzoBpeuP2fXEkBHG
         kvzwXceKNQrMw0KFxQYDb+OPwrRtOeZva0sAXjwo/Zoi2kZ2welHBNIKVHyeTEOe35zK
         HnGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X3cm2efKY/Zhxh28wLxbsEMQLe29t+d8ccezL5bJqtw=;
        fh=0B7TmfG0rKlSpjv0GdZwJiI9Dc+2AvGfLL7qRV21dc4=;
        b=beyoYuHshKezhUcD3DYAFbeDB/helYCZBnXg6EIh3vSBvMSY7YMKYjYAzPPGQ+6Lxt
         XIqQdUWIeNnHr8UJ5S7i2v1VhVWGOdxyh6wv2GXg7NvNSNAgAWFp0yvsGmy3muZleEN4
         KdOY/ZkbNd+AG9M8Klu1lASM3JByhxfLBDXg+vg0m63yljGeNKLdQzcxJZl3iNq5k7RJ
         ln6eMPDTIPXLYv9rTqKQuzYjoUoEG+JPSwRL5Fh3c6UIeL+AsNYVuCE30Y/tPPjH3cTa
         gN5NnY3vVcjgxdMTAsh0BSAZ6GOty8KdCdKWYqUE/GGUMVIGU7K7X9/2VDOi7G9iqZND
         ImRA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779789907; x=1780394707; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3cm2efKY/Zhxh28wLxbsEMQLe29t+d8ccezL5bJqtw=;
        b=e1YstLYBUg8CfsQNRmT8Zbgkf/LJz9eMhpApWz7UKJbfwn0hLc/BfwIucenBJV74Jp
         LPg4hYHXsj0RC8ABLfHAi9jE520/KcaCaKgKmd1YLiNINab8MwabIH8C4oJ6PH3d+9UL
         B0QEc45VYT+1kFPdR3G+iW0DbxB6YX54TXZAjwX8RUc8+9SdLyE9NT43ZcIX79ZSovxq
         mM+dLOaxxMTln7nzcit5UwbPgin1MTRmrPbbt3QIvNs/sbVvCWf0R6c/5It0YdECB9/E
         vu/1R3RDKYVfP2ttRXo+E+GTJ9S5LtvCMsSZlEN4Z0H0BtcuthIYbxgeI++SrBoGbokC
         LaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779789907; x=1780394707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X3cm2efKY/Zhxh28wLxbsEMQLe29t+d8ccezL5bJqtw=;
        b=GvyoTsbT/2bUJCkuyaO17g86Rz0eRIF9YNMSSysGbCXS52idG0WWo5p3vfOBGWPMKW
         57YALU1PKzhKLmGfWj1b7mVV6NBuJ1gBM8pEaxkfvnh9BvOK9KlcsONim97M3rgg13NP
         3WAJgfztscAbJpK93ItBTaUXasZNTvmDzXyfmSzQbXX/L1JtOr5U4diDZWT7AS0fRQ+h
         zJJpYVavVa/lwTwF3V3Jw9dkXvyArE3AVlb7y2wqlWuvl1SMqDmdSVYuuTzkjABGM1DS
         6UvUHjs5vcfJ+IewejqTZ3n8JUzrig2K9PEW6OE9UevdFTdYrD/1Gc2AuPXI7bumQvtI
         lVIA==
X-Forwarded-Encrypted: i=1; AFNElJ9ZArtwhY+V/PtUkgEd2qG8qdr3RScQy7lnJ0IwonGuQhOggVAqGNdDt1vf0YXvyYlIXvqETUZNxQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwXWQptM9uohOwno5WwutQ2UqCEfYpRU2jXtcfhdEjySDsGIGV6
	uJCFhMn0IbvHs+lbFHmAjv+ZJ7Y9wlSJjGwDOC4ILKslUDvDsMnBG8g8G7ODylX/zCbxAGGNYc4
	yDvzTWumeJ884R/+1Iz1RgHSVQa+5c5Y=
X-Gm-Gg: Acq92OHiFKH8X6Ty1EBLwQx7zeU3mb7K95vFrlwk8VVMlozFxhdZHu0Skkas8EKsiNa
	Uda6izCpdfIz0sQKqQ0zT4gegOVyhlblrI+PE80wTeP/25bnzHaSDtbDLVEcou3j3KX1BCvQho5
	HLzeHpUc3qY74e2ef+GICGEVZ6rp6Gf+t9NnX2kGnGOeBZR5Lz29siwXhC6B406wAHLI7NoGBgs
	sjoxtARBY5kY1L1mjmW/qSRTW0FpLXtRRX8sZ0RDVQD+r5oW4yg0whdpOOjAG3oXaLqTeWUzxGR
	pYONbEs=
X-Received: by 2002:a05:690e:25d0:b0:65c:747b:485b with SMTP id
 956f58d0204a3-65ec99ce8eamr13546771d50.58.1779789907432; Tue, 26 May 2026
 03:05:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
 <177889984452.2298656.1074391459031404894.b4-ty@b4> <7e68e745-0d70-46db-9475-38d3dd5b9cf4@baylibre.com>
 <6b945153-5a7b-415e-904a-1c350b7d52ee@gmail.com> <86ac46cd-b7bc-42cc-8c29-996ae21f3654@baylibre.com>
 <CABdCQ=M_E1uHU5WTXCn2mXaxf3-+7M9gXCL=tp1qBW50jf7d5Q@mail.gmail.com> <8b9c613c-df1a-4f44-b15d-cdcc21905bc5@gmail.com>
In-Reply-To: <8b9c613c-df1a-4f44-b15d-cdcc21905bc5@gmail.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 26 May 2026 12:04:56 +0200
X-Gm-Features: AVHnY4IxXGGNE6MCQzRPM_4hQIgOZYw7rJR2PEvw9EaDz3r-wxcgt_U1xXrcwuc
Message-ID: <CABdCQ=NOvzmzqS5WJG0CQ35Nd+Mh-Px5Z7ELqC_eDSqob0Jbdg@mail.gmail.com>
Subject: Re: (subset) [PATCH v10 0/4] riscv: spacemit: enable SD card support
 with UHS modes for OrangePi RV2
To: Andre Heider <a.heider@gmail.com>
Cc: Trevor Gamblin <tgamblin@baylibre.com>, Yixun Lan <dlan@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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

El lun, 25 may 2026 a las 18:45, Andre Heider (<a.heider@gmail.com>) escrib=
i=C3=B3:
>
> Hi Iker,
>
> On 25.05.26 11:36 AM, Iker Pedrosa wrote:
> > Hi,
> >
> > Sorry, I've been on vacation and I haven't checked my emails.
> >
> > El mi=C3=A9, 20 may 2026 a las 13:11, Trevor Gamblin
> > (<tgamblin@baylibre.com>) escribi=C3=B3:
> >>
> >>
> >> On 2026-05-20 03:53, Andre Heider wrote:
> >>> Hi Trevor,
> >>>
> >>> On 16.05.26 2:35 PM, Trevor Gamblin wrote:
> >>>>
> >>>> On 2026-05-15 22:57, Yixun Lan wrote:
> >>>>> On Fri, 15 May 2026 12:48:58 +0200, Iker Pedrosa wrote:
> >>>>>> This series enables complete SD card support for the Spacemit K1-b=
ased
> >>>>>> OrangePi RV2 board, including UHS (Ultra High Speed) modes for
> >>>>>> high-performance SD card operation.
> >>>>>>
> >>>>>> Background
> >>>>>>
> >>>>>> The Spacemit K1 SoC includes an SDHCI controller capable of suppor=
ting
> >>>>>> SD cards up to UHS-I speeds (SDR104 at 208MHz). However, mainline
> >>>>>> currently lacks basic SD controller configuration, SDHCI driver
> >>>>>> enhancements for voltage switching and tuning, and power managemen=
t
> >>>>>> infrastructure.
> >>>>>>
> >>>>>> [...]
> >>>>> Hi Iker,
> >>>>> I've picked patch 1-3, for [4/4] I think it should be merged after
> >>>>> https://lore.kernel.org/all/20260513071958.29574-1-a.heider@gmail.c=
om/
> >>>>
> >>>> Hi Yixun,
> >>>>
> >>>> That makes sense. In response to your earlier feedback I had drafted
> >>>> a more
> >>>> complete dts after another schematic comparison, but Iker and I
> >>>> discussed it
> >>>> and opted to avoid changing scope too much. Andre's series includes
> >>>> the bits I
> >>>> wanted to add and more, so that works out.
> >>>
> >>> I have 4/4 rebased on my series anyway, do you want me to send it?
> >>
> >> If you have an update to make, please do!
> >
> > So, how has this turned out in the end? Andre, will you take care of
> > sending the latest version for the MUSE Pi Pro?
>
> Yes, in fact I already sent it last week:
> https://lore.kernel.org/spacemit/20260520130624.1763487-1-a.heider@gmail.=
com/T/#u
>
> You should have received that (unless I messed something up) ;)

It's there, it's just that I wasn't looking for it. Thank you!

>
> Thanks!
> Andre
>
> >
> >>
> >> Trevor
> >>
> >>>
> >>> Thanks,
> >>> Andre
> >>>
> >>>>
> >>>> Thanks!
> >>>>
> >>>> Trevor
> >>>>
> >>>>>
> >>>>> Applied, thanks!
> >>>>>
> >>>>> [1/4] riscv: dts: spacemit: k1: add SD card controller and pinctrl
> >>>>> support
> >>>>> https://github.com/spacemit-com/linux/commit/2d77e577109967ef65f269=
c1fc1d6a659d4260fb
> >>>>> [2/4] riscv: dts: spacemit: k1-orangepi-rv2: add SD card support
> >>>>> with UHS modes
> >>>>> https://github.com/spacemit-com/linux/commit/2585c60ce2f977b13f14a6=
7d1e3ed9c73fd7f381
> >>>>> [3/4] riscv: dts: spacemit: k1-bananapi-f3: add SD card support wit=
h
> >>>>> UHS modes
> >>>>> https://github.com/spacemit-com/linux/commit/c76e2f058cbcab84e4a703=
f26857a58bdf6a0042
> >>>>>
> >>>>> Best regards,
> >>>
>
