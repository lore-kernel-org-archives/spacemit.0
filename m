Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB4017D7
	for <spacemit@lists.linux.dev>; Tue, 27 May 2025 02:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748313704; cv=none; b=eySDMPGu0Ox8F+1flP7eErBP3p7Foh00EVw/1UB96hYD+ZpuC2JwTkb5faejRVCSz+bd19HmKlSEM81bCCTw1nsYcA06g/c2BIsBMuPf2H6ZkftqHLNbj3keFE0xFITBk5C/QI/K74/V89fT4TNrVR877LACtIdIqq5W8aaDxr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748313704; c=relaxed/simple;
	bh=hFopwnwGuxFX70zetyJsWh8D7vCNnSwoCh/cnSFt3tk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SVBlHqkXgZepiPiEoOIgf0G8ebjHiYn4lKeiZG17u9s+zbsaE2vvilAL+6/P6UR9PQbE2bDf6+fGjzkVWoEe5STGYIXLtXLmZad+NGSLX/seQjC06RTjcbQjz1ppoG1K/0+bPYnT1toMNLprf9VbMWnzJxB/z7GpF6itS36RA8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=X3qcvVrE; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="X3qcvVrE"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad564b7aea9so765675466b.1
        for <spacemit@lists.linux.dev>; Mon, 26 May 2025 19:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1748313699; x=1748918499; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ZERauyRIXerSc9GUNUPNmoyTTV2jjjUNrho3ew4khU=;
        b=X3qcvVrEVu66GL7Vdb9poHIfdN8HGgd+ChIXX7OpFYbl4l5R0XL/EHh/iAIlw4Xga3
         R/I54jOzUcwbs1Pqjk15dUiVBbgFK5Rmi/7MoITCdwW52bUHKmXxSRgljzgWgrlGmEbw
         L8KYq7tX/an5PMHes6pSufnToRW5SOIRRZDj9vnlPGYbzAZrVnQqnb6FdOypmEgqMpET
         NtpO4FpVlZv3Xlp11/TCqt3/ZmWtxOwQGcx3aWvtel5CtpWm5mI5aIw99xZWPb/7nY1T
         3MSEXMSSNUZ4qMlmE1hWCoiLz0BVhrc65qWwS6e7IfqMBEbyVbhFGk4QvgMzX6ceNtft
         T5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748313699; x=1748918499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ZERauyRIXerSc9GUNUPNmoyTTV2jjjUNrho3ew4khU=;
        b=VLCskae7ge/DgqpyHMvcZyzqZqkkwMmggOeGV1BBTAAjPqe3VlWWbrZEfkxOFTqoZh
         uuisv/nfitshTzUCoh3mw22rfWAxGNeJMA0CZmvH/anpYzSIgpiZVkqBkSwVHcgJYQpm
         l/ff73Q4BmjCPu6HsNcDt77yGG7eqijzWbVfO7EcbZSg8YYa2fE+X6e3DQkYoIxUVkOg
         82RPun+n1wmiyTJlof6szc7kJ29uqCO74wZbGiY49OnBzhAWhMGRYrwSBZt2fk64URcd
         aPOuPCLKjY9ZhUvqgKkD2vqujwA3gM8sl9Txg9+mhxdr1THdLjcOzHAr/Z+yqMY/NaG3
         Dbqg==
X-Forwarded-Encrypted: i=1; AJvYcCX5Zuc6FbhWeJy79p9j+S0FT6RuGTy/rOQjtOOL74DWs+cf7s13T6mHpbWHq6fRYZT/yhNjZsFtqQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKXhnvIetFPVbIUCtFYVlSgxndwIdzjAE2QReOJIoybd9VBKS7
	JXUbBGV8qEDRHwlfzkv9QhesjPR7swbXoUPauwRlk5HMZb1oGDUJ1kaqOl0OxRnuMUjTNKkEGVv
	0ajqwrM0loM3SEQ66zuVpNC+sjbuCR5ZVL84nvNCSjA==
X-Gm-Gg: ASbGncvdE37lULa0Q7zVkdGrhW9GTJXnS7bRAMNw3EHB01hWmv7ZYllh1+vFWZ0ECiY
	auSCuZ21JPUY7+i/IHL7ELg5WY3Z4H+eW1VPYRID+XrT2vmYP7Vr7xYf78bwlXdN5TIm24eu+FO
	lGonl25dM6J40Hq4YeRJnwesKlw0UPPQtebQ==
X-Google-Smtp-Source: AGHT+IEwDBoO6fPNQbhz18OXkU1emYXVf9ol8i2RRW8+CYwMWPShuzxk64vRiGzkPz9segng6DJBOqMGPdvXU6MevTk=
X-Received: by 2002:a17:907:3ea9:b0:ad2:2fdb:b0ab with SMTP id
 a640c23a62f3a-ad859b5436emr1083211866b.29.1748313699251; Mon, 26 May 2025
 19:41:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250429085048.1310409-1-guodong@riscstar.com> <lgjntm2v4qtp3uwccriodxdefdc4vqydzl4dmula4avhws4zfi@xevkgzfuhyhl>
In-Reply-To: <lgjntm2v4qtp3uwccriodxdefdc4vqydzl4dmula4avhws4zfi@xevkgzfuhyhl>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 27 May 2025 10:41:20 +0800
X-Gm-Features: AX0GCFtJk0m16OgxkbmqVbr299LwditdBcOLPf3TQyBjUg1Ado6GD-l3Ru51kO0
Message-ID: <CAH1PCMZBBmDibwSLUAhDAyjAORgpS+D-U5_kfLJkbZ2r=XpFDA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] pwm: Update PWM_PXA driver for SpacemiT K1
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, dlan@gentoo.org, p.zabel@pengutronix.de, drew@pdp7.com, 
	inochiama@gmail.com, geert+renesas@glider.be, heylenay@4d2.org, 
	tglx@linutronix.de, hal.feng@starfivetech.com, unicorn_wang@outlook.com, 
	duje.mihanovic@skole.hr, heikki.krogerus@linux.intel.com, elder@riscstar.com, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 1:22=E2=80=AFAM Uwe Kleine-K=C3=B6nig <ukleinek@ker=
nel.org> wrote:
>
> Hello,
>
> On Tue, Apr 29, 2025 at 04:50:42PM +0800, Guodong Xu wrote:
> > This patchset adds support for the SpacemiT K1 SoC in the PWM_PXA drive=
r
> > and updates related device tree bindings. The changes enable PWM
> > functionality on the K1 platform through driver enhancements,
> > configuration updates, and device tree additions.
> >
> > Functionality has been verified on the Banana Pi BPI-F3 board using PWM=
14,
> > configured as a pwm-backlight. Per community feedback, the actual
> > pwm-backlight node is not included in this patchset but can be found in
> > patch 7 of the v1 series, with modification of pwms property to 4-cell
> > format to match updated binding (#pwm-cells =3D <3>) since v3.
> >
> > +             pwms =3D <&pwm14 0 2000 0>;
> >
> > This patchset is based on [spacemit/for-next]
> >   base: https://github.com/spacemit-com/linux for-next
> >
> > Plus the following dependencies:
> > 1. Clock controller driver, posted by Heylen Chu (v8), with most of it =
has
> >    been accepted:
> > https://lore.kernel.org/all/20250416135406.16284-1-heylenay@4d2.org/
> > 2. Reset controller driver, posted by Alex Elder (v5):
> > https://lore.kernel.org/all/20250418145401.2603648-1-elder@riscstar.com=
/
>
> It's not clear to me if I have to look into this github tree and the
> listed dependencies. My impression is that it can go in on without these
> changes. Maybe it only starts working when these are also applied, but
> that shouldn't stop me applying this series, right?
>

Thanks Uwe for the review.

The dependency is in patch 3, where I added the PWM nodes (pwm0-pwm19) to
k1.dtsi. These nodes reference RESET_PWM0 to RESET_PWM19, which are only
defined after applying the spacemit reset patchset (Patch 1/6),
available here:

https://lore.kernel.org/all/20250513215345.3631593-2-elder@riscstar.com/

You're right that patches 1, 2, and 5 do not depend on that reset series
and can be applied independently.

> There is a patch in pwm/for-6.16-rc1 (namely commit df08fff8add2 ("pwm:
> pxa: Improve using dev_err_probe()")) that conflicts with this series.
> I applied patches 1, 2 and 5 on top of my pwm/for-nexxt branch resolving
> that conflict and rewording the commit log of patch 5. The result was
> pushed to
>
>         https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.gi=
t pwm/pxa-spacemit
>

I've reviewed the three patches in pwm/pxa-spacemit, and they look good
to me.

Thanks again for handling the conflict and rewording the commit log.

> . If you confirm that you're happy with my modifications and it's
> correct to apply them without the listed dependencies I will add the
> patches to my queue for 6.17-rc1.
>

Yeah. And I confirm that they can be applied without the reset
dependencies.

Thanks.

BR,
Guodong

> Best regards
> Uwe
