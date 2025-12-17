Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3536135E546
	for <spacemit@lists.linux.dev>; Wed, 17 Dec 2025 15:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765985229; cv=none; b=ptLjCYy9LxvUu+81DnjAgAalm0dLluVHCxAkmN2Sf0JNxG1ykBpZF7v59aCKfhCdOqHK9ctfOD7yh155aTRCrVa/7ds5lVXLNACk2QscOF5qn/a7f9qC+Vaq1v/RM9iWa4cMg2MFyWeKfwIh34g8TdU++ZMLO0bM5qYK1WRbOG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765985229; c=relaxed/simple;
	bh=yHQV7Wm0isp98apbqJdGNSjVGLz+xQiyfz9CwnzmCJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=stfDfsT9ZH35kQZfcY7oJl6A2hmRy91rntu47rEhs6Bn2FbiBe09yLPPcWgFRDWT9U7Tma8ezpEB8pmqgNKQSVIBK4VDOHyAtvwFXcNV4pZaMf0gjsD6Sk7YvGuD9m+S1tGPB0uq0mhcvtEQh/1g7rJF13/udPRNrNL7tRO1hQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ASoWpSfX; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ASoWpSfX"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-78c5adeb964so58335977b3.1
        for <spacemit@lists.linux.dev>; Wed, 17 Dec 2025 07:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765985225; x=1766590025; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNKodKke7lh2l41JMs2fcoeFN1jkHTqvEjyt3XwZW5M=;
        b=ASoWpSfXrBVQdMxX1rop0TH1ZbnqqGR58cLxHQOWECGZfDNjm+7QFWWoJOaojlE3vL
         HZg7A8UzdBf0PuBryk1s9Vu7ggMDW7TKNPQ9QqbmwPhPr2JbIq9upZ/tFT2y+PWzZL2R
         rZ697D/X71EMotBX0RWCt/IeRgh5ziWOq3TcaF0DBfKnjLE2MwLSUiXll8l09GnP8QJW
         NJQ6ONnUI5TzpQh4zl3JekE7NjaSEN6Lypmpj33LJA/F6ZmB/YsM54ymJihdvQ5N/bSI
         SCAyiJYCtL0P8a8YdQvwSXScwsAR4W722IhbocM08VmFUZfvPrKIvWhJ83f2OzbgQioT
         NxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765985225; x=1766590025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RNKodKke7lh2l41JMs2fcoeFN1jkHTqvEjyt3XwZW5M=;
        b=dr2AV6dUUfFC13LE6QxJauTSfW+n8MK90Fmr6n4xuyBF/U8pOoZ3mPNIYoNNjHT5IM
         ouJCVpXr2EF9RTh/jsfPfHrdIMDngxt2mM/nNxKHvvGcDjBvql9lG18NbzAniHyEFVxo
         vTETwugyaGbdptxR54nyFgLk3KlJrA2x5qEQJUj0sYwApr2UItjrLkmEPqaCx2EztRH6
         muMM3If5VlPyeArqauIIDnGduWCd3AMgG/nwkUNrwiKkzPRjfAtdVLcsgYpvyoL5vwHu
         Ar0W4zYTql48tIR5+Yb8CQxft0D51VNYt3R2z7oIxSqxZKqq4jvebTJCd5uvkLThVN1+
         mp0Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8Py1CK98XylHKk3ZsjQ01wTOoRRx9sECGcn6A2FP+5lSji+ktBTCe+vaFG/lKdwKuiMwgCqrg4A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyV7kL+IFVMlvav7N5+Y8SmaPOG8xMMQEnam6m8aqS8uHaRAUB3
	Wxi/KmEY5B2UZqadcWpLYr5BQjDjPJUMw9NZFbLMhXhmAQ0O1vLe9Qmlr9y/x8ksnGQRXuNws++
	e7YejGrwYzwkGJYbO0493YHnZ6RuQD/g=
X-Gm-Gg: AY/fxX4+c5S0qK+s5INXW8HNRJYHOSwbz0ni7fm77nGDCCW0/exdcGnqu0l9OxpvIZb
	4DtwBRE+XnFi3/GkcfmZKDNIzq2lLqRmJEFh9Q4Wv3OVtFPolCuMQwd1vkcS4dG+HSnrY/LLpnA
	Dmy2zAtKcEYqIZxB6F+BhrWsI7fJFAfqPJw287NqzUPs0qDEZF89HmSJodTRy2G5r+fNLojiN1e
	nfEYZNRmXPJWOI2ag0DtfxF7WhPDvJKIw6oFv/bYJfXn6zgIZOUEfacf0u1QgPDGROL2GYL
X-Google-Smtp-Source: AGHT+IG1qLZDXm+BbPJwD/ot4K/atYhBwVHBxeCPgHs+R8IMbQWIZ38hfFkozr/72Efw3wsTzpB2276PHQEDBdN4bzw=
X-Received: by 2002:a05:690c:6703:b0:787:deea:1baf with SMTP id
 00721157ae682-78e66c4b68dmr140059147b3.52.1765985224734; Wed, 17 Dec 2025
 07:27:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251215-k1-boards-add-mmc-v1-0-d68dc87d4aab@rootcommit.com>
 <20251215-k1-boards-add-mmc-v1-1-d68dc87d4aab@rootcommit.com>
 <aUAF4iNjuP5AWJaf@pie> <4acfc5d8-d8d9-4c9b-99eb-09c7b82ddd04@rootcommit.com>
 <aUDwDkd8k_4gD1yc@pie> <29600710-fc66-41d0-b399-1b635d0789d9@rootcommit.com>
In-Reply-To: <29600710-fc66-41d0-b399-1b635d0789d9@rootcommit.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Wed, 17 Dec 2025 16:26:53 +0100
X-Gm-Features: AQt7F2oQky2L14pvEztOstAYmBbdHLfH6CJpRiGZdwfISfmvECAR9gGmu-12nk4
Message-ID: <CABdCQ=Orw0ULhPm43rAhS_iqqNYU4nChcPCqh8UdFhJUumVG5w@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add i2c buses on OrangePi RV2
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: Yao Zi <me@ziyao.cc>, Yixun Lan <dlan@gentoo.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

Based on the discussion and Javier's feedback, to make the SD card
work properly, we need to patch the driver to implement the following:

Define a separate compatible string: the eMMC slot has a PHY, while
SD/SDIO slots do not. We need to differentiate them to apply the
correct reset logic (skipping PHY init for SD).
Extend the pinctrl driver: support is needed for switching the SD
voltage pins from 3.3V to 1.8V.
Add tuning logic: this is required at least for SDR modes.

If you don't mind, I'll start working on point #1. Feel free to choose
any other task.

I'll post a patch once I have it working.


El mar, 16 dic 2025 a las 22:30, Michael Opdenacker
(<michael.opdenacker@rootcommit.com>) escribi=C3=B3:
>
> Hi Yao
>
> Thanks a lot for your help and tips, much appreciated!
>
> On 12/16/25 06:37, Yao Zi wrote:
> > On Mon, Dec 15, 2025 at 03:00:52PM +0000, Michael Opdenacker wrote:
> >> Hi Yao
> >>
> >> Thanks for your helpful questions!
> >>
> >> On 12/15/25 13:58, Yao Zi wrote:
> >>> On Mon, Dec 15, 2025 at 10:10:14AM +0000, Michael Opdenacker wrote:
> >>>> The OrangePi RV2 board exposes i2c2 and i2c8 buses
> >>>> from the Spacemit K1 SoC.
> >>>>
> >>>> This declares devices present on such buses, in particular
> >>>> the at24 eeprom to store MAC addresses and the regulators
> >>>> attached to the PMIC on i2c8.
> >>> This series is named as "Attempt to enable MMC on SpacemiT K1 boards"=
,
> >>> what's the relationship between MMC and PMIC/I2C bus? You didn't make
> >>> use of any regulators in the second patch, either (which seems wrong =
to
> >>> me).
> >> I expected that declaring the regulators under the PMIC on i2c8 was en=
ough
> >> to enable them, but I'm happy to be corrected.
> > Declaring them doesn't mean enable them. Regulator subsystem maintains =
a
> > enable reference count, and when it downcounts to zero, the regulator
> > gets disabled.
> >
> > If no driver acquires one regulator, it gets disabled after 30s since
> > the regulator subsystem is initialized, see regulator_init_complete()
> > and regulator_init_complete_work_function.
> >
> > On BPI F3, SD is supplied by buck4 of the PMIC. It's marked as
> > regulator-always-on, so wouldn't be disabled and then cause issues for
> > the SD card, but this doesn't mean it's okay to omit the correct
> > regulator supplier of SD.
>
> Good to know!
> Surprisingly, when I add this to the "sdhci0" node:
>
> vmmc-supply =3D <&buck4_3v3>;
>
> (after creating the label, of course), the device and its partition no
> longer show up in /proc/partitions!
>
> I was hopeful because read-only mode already seems to work, but maybe
> indeed things are more complicated.
> >
> >>> vmmc-supply specifies the card's power supply. And if you want to ena=
ble
> >>> SDR modes which mandate 1.8v IO level, vqmmc-supply is also necessary
> >>> for switching between 1.8v and 3.3v.
> >>
> >> I was thinking to get started without the SDR modes first, to make sur=
e
> >> basic operation works first. Would that work?
> > Yes.
> >
> > FYI, for SDR104 mode, you may need to implement some tuning logic[1] as
> > indicated by vendor driver,
> >
> >       /*
> >        * Tuning is required for SDR50/SDR104, HS200/HS400 cards and
> >        * if clock frequency is greater than 100MHz in these modes.
> >        */
> >
> > Though in mainline the eMMC on BPI-F3 already makes use of HS400 mode
> > without tuning. No idea what happened here, or it just happens to work
> > well.
> >
> > Also, the pin controller on K1 SoC seems to have some undocumented
> > registers to select the IO voltage of SD pins, which should be adjusted
> > when switching IO voltage[2].
> >
> > I think these pins should be implemented in the pinctrl driver, then yo=
u
> > could create two pinctrl states, one for 1.8v operation, one for 3.3v,
> > and switch between them through pinctrl_lookup_state() when changing IO
> > voltage.
> >
> > The last thing to mention is that the three MMC controllers on K1 aren'=
t
> > same, The one used for eMMC is the only one that has a phy (both SD and
> > SDIO controllers are marked as SDHCI_QUIRK2_BROKEN_PHY_MODULE[3]), thus
> > have different reset and tuning logics.
>
> Wow, that's surprising.
> https://developer.spacemit.com/documentation?token=3DWZNvwFDkYinYx0k9jzPc=
MK5WnIe#12.5-sd%2Femmc
> doesn't seem to mention this (though I didn't check very carefully yet).
> >
> > You probably need to create new compatibles for the SD and SDIO
> > controllers instead of re-using spacemit,k1-sdhci, and write correct
> > sdhci_spacemit_reset() for controllers without phy. This is probably
> > necessary even if you don't implement SDR modes.
> >
> >> Would you have board examples to recommend, with an MMC controller ope=
rating
> >> in a way similar to the one on SpacemiT K1?
> > All sd/emmc controllers work similarly... you may want to take a look a=
t
> > mmc-controller-common.yaml for common properties.
>
> Right, I'm already using it :)
>
> I'll be patient and try to progress step by step. My time is quite
> limited these days, so everyone is welcome to try and make this work.
> Thanks again for everything
> Cheers
> Michael.
>
> --
> Michael Opdenacker
> Root Commit
> Yocto Project and OpenEmbedded Training course - Learn by doing:
> https://rootcommit.com/training/yocto/
>
>
