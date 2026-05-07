Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D82E31A81C
	for <spacemit@lists.linux.dev>; Thu,  7 May 2026 09:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778147648; cv=pass; b=i6SQPmm4AVIlbR/tatIQO1M8ppIfldycTFHNCHlZQ5r2i+2lylNaljb6UlclG03jmUQLjsQI1f8hcHF/vyr9DUN2m6yRHZl9siK3Wt5bx8nAAZ2FiTk59qg5lhya7LQg/Gc9/kxhYCmI4MIc729GBIcqVhuPps9IM3WU5B6uOIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778147648; c=relaxed/simple;
	bh=USp5XzZA4eJ5QU73YEjZh5z27WHNeqKawicUWQrwGfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FsgnG7hElwclv1e2BHbgCchER/QJNZ1CqoH3xTscz2WDURXtHRcJ7xGoTblQFojLmTExAxIfMni0TvUq1hyrQXFlMP9Ch73EOB3EK80wd0YLpNCm6/P0yP7UPILPqDoIhlKgWMfZOQw4fWfnV+lAxuB/YnXofIuoHxcI90A5LxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bBwvUvnv; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bBwvUvnv"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-651bc83e74aso587999d50.2
        for <spacemit@lists.linux.dev>; Thu, 07 May 2026 02:54:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778147645; cv=none;
        d=google.com; s=arc-20240605;
        b=kj3tfyqles2Huc0uyu3q9Kl5AkwoO/nkekvNsTfjagq9woyAJsSMgwSFJhWW6YnfVF
         KiW/PDW9Lc9KgLX5CjY3KhQKKOiROQrlKP+UMaTRsBmgN73J0phK+Aa6UHW6fS0nflu9
         p7rn3xB8IYkDtBDh8L/fkH1y0hwAvGVb5qCu+wpYlEqVsYt0/cNDQ2CKl7Cii+CcmBqF
         ioB7iKIKjERs/4xbQ3EWyGog7TFJHKYmH4AhV8Tb8WswL9BvAJSCuQ7AshUgJEd9VV11
         HhwE1hhvjaNJbS/YmQvuBPOwGUbo6fLqx4d/5vMzSKAyPuHu+3Q9k6C4PjzDmZto9qc1
         vf1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wrndUsEYmqCY5OiromaQ3GnufO56h/c2hiAzI8scZ9A=;
        fh=1XVYj50XB4UbRyolgZdrk1UkhepsMz45lh9xQFI8Ebs=;
        b=lPNia8B8kLwkaV/eX0R+jpIBdADhyu/zKQS1sy8NQihFq43cXuauKiLjI18YBfL9T4
         pby71ooAinxax7F1ovq0R+QdIPfKKRtCMX/cpvtuFuYLR+xP3B7JO0+pMHrdHWuXJ2+J
         bVFViyOKnzTprd0450SM69LX9joVNVenYtGK9it2OsPHDYWJXKqYej2sAUCrg0cH9SA9
         HXk7OUaxHPtg1ZEb8OcUeXnjHuIYcki7Ig6Qpvbts70gnFt7C3dO95aCcDkDJGU7m+SL
         KkkXcTi9ce/GJE3YWlOQjpqE+asO2mA+Vc7YrjLItuvhD+XHAF1L/LPeWhbykywa6y9D
         Y2fA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778147645; x=1778752445; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrndUsEYmqCY5OiromaQ3GnufO56h/c2hiAzI8scZ9A=;
        b=bBwvUvnvTzsxhWEt/R6N24d2JpXWbU3LZS0HOj5MDZTb5N2qU8vlK+HR5xXAr0bu8i
         DrS0wIZASEObxY8e8T/GScIypDy3XZd1S00VTdwW38OCL9+9MbeyVB++rJg3fO7NabTC
         Xm2tnk93iAENpAUJEsachI0Q4cFIWWjWBTuPBJWgTBtiETHZv4KQo7JoU0bLnIP26fht
         SDkUVaZIuSmHWYjsQRUkkPoh4NWVSZIWrGecyzYrWv6DVdlJ0eyApc19SnhjzMW1q3X0
         vjfg+gwU8GZoA1HTBxbK+zgRVJYzX3y/WvYyWaVZl7FmihC/ZxC0Jms5l8jmrYh+uozc
         2k1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778147645; x=1778752445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wrndUsEYmqCY5OiromaQ3GnufO56h/c2hiAzI8scZ9A=;
        b=BsM9QjOlGUW6caLvhhesrGPhdOtz3OVhwYWZjiAnQldPoZ1yfG3m3VezsdnCQkXOiV
         rqFvnjh0BMrJMQGbLeqYF95+01RHhr9nmR7xjKKcDQo5Rz/w6z/14fNsC1w9wJKCGwB/
         LnLRw5lSfjGAYIV976JLENP07QQr8adFXGPJY+mLZ/AtbcMTLgjswQGaOTddZHruRW70
         r5OnWWl7F5m2V54QiAZU/20Q2i7st8du4Gg0zlsd4FysLpf0/fJHwgbOdAXTMmvxJy7i
         DSlAmMGLNhdzg9sndBpKF6RKOx9hy5UQa5cC67IkpW7s2sPfmhknBSI0HZjwh8j6SmzQ
         0ybg==
X-Forwarded-Encrypted: i=1; AFNElJ+bpscbX6zctcLLoyEeFXgaSfTq0drhb3h7895+WBKSTdi0CMTbsLhz2lQQmsikq8CtljT9JhIXnQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwpeM5LER+JnS0m774nsby9xBZuEs6iK6MMOZqr6hDxYv0/hHBn
	/YgnFN4TSPwr9UIaEuJXazRZTa8TM7dKaTAyeh5CJYE0S/ddtDAfdzLn1KHhw3+NWQ0bjjzvRRj
	LR8Uri1gW5cvOQYzxbdnoQ73iJiGI+1w=
X-Gm-Gg: AeBDievqF/0HfpImbBZmCWJTWPbcWmUvv8fKI/kNHCb10jqzK5WBI0vsuQ8USHPyY6j
	KbR7J/J3tdW70mPfj3rUke/cs4CO6nmuL9gmPsvwbC1wO3NY9vRsL0qL0kR5/E84PWTRKemWPlF
	j77wGX988rrfYBMsxJeCZUp6g5LCQuVUXCuai5cpUJu0d5H1McIDQs01BZY2duD0dNHAww49qFr
	lUG6KidFKmDHuWU4qUeRTjWHvLy9nEHiMUXsWKNOX1uccVEwTaU7uWSuqGft4IxllhM6UPGmAhn
	QY/yLe6FjaS587tWF5qlB+oYjpmelA==
X-Received: by 2002:a53:bf12:0:b0:65c:6220:5fcf with SMTP id
 956f58d0204a3-65c79e5a8a0mr5462411d50.62.1778147645342; Thu, 07 May 2026
 02:54:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
 <20260413-orangepi-sd-card-uhs-v8-8-c21c40ec16d0@gmail.com> <CA+Xcp4nY9GVMOmtMG-PNhY2vqP4Cc_amAMSa+M3vuDjWUkuCHw@mail.gmail.com>
In-Reply-To: <CA+Xcp4nY9GVMOmtMG-PNhY2vqP4Cc_amAMSa+M3vuDjWUkuCHw@mail.gmail.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 7 May 2026 11:53:53 +0200
X-Gm-Features: AVHnY4LT9e56Cweesam2LzF6uMchLh2zxP8j2JRmkUPbJrDgBoSBvkiVcFsuGIw
Message-ID: <CABdCQ=OsPva9=YPdBd=3HW1OO7=_zJtpXjvaiA0WLEDT5Scs_Q@mail.gmail.com>
Subject: Re: [PATCH v8 8/9] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
To: Margherita Milani <margherita.milani@amarulasolutions.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, Troy Mitchell <troy.mitchell@linux.dev>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

El jue, 7 may 2026 a las 10:20, Margherita Milani
(<margherita.milani@amarulasolutions.com>) escribi=C3=B3:
>
> Good morning Iker,
>
> > Add complete SD card controller support with UHS high-speed modes.
> >
> > - Enable sdhci0 controller with 4-bit bus width
> > - Configure card detect GPIO with inversion
> > - Connect vmmc-supply to buck4 for 3.3V card power
> > - Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
> > - Add dual pinctrl states for voltage-dependent pin configuration
> > - Support UHS-I SDR25, SDR50, and SDR104 modes
>
>
> Tested-by: Margherita Milani <margherita.milani@amarulasolutions.com>
>
> However I noticed it only works when CONFIG_I2C_K1 is enabled.
> Michael Opdenacker told me it's necessary to enable the regulators
> used by the mmc controller.
> Should we add the dependency between CONFIG_MMC_SDHCI_OF_K1 and
> CONFIG_I2C_K1? (Unless some boards don't have these dependency?)
> Thank you for your patchset which was really nice!

Thank you for catching this! You're absolutely right about the dependency.

From what I can see, all current SpacemiT K1 boards follow this design
pattern where the SD card power is provided by an I2C-controlled PMIC.
However, before adding a hard dependency, I'd like to get input from
the community, does anyone know of K1-based boards that provide SD
card power through fixed regulators or other means that don't require
I2C?

>
> --
> Margherita Milani
> Embedded Software Engineer
> M. +39 334 758 9111
> margherita.milani@amarulasolutions.com
> __________________________________
>
> Amarula Solutions SRL
> Via le Canevare 30, 31100, Treviso, Veneto, IT
> T. +39 (0)42 243 5310
> info@amarulasolutions.com
> www.amarulasolutions.com
>
> On Mon, Apr 13, 2026 at 10:05=E2=80=AFAM Iker Pedrosa <ikerpedrosam@gmail=
.com> wrote:
> >
> > Add complete SD card controller support with UHS high-speed modes.
> >
> > - Enable sdhci0 controller with 4-bit bus width
> > - Configure card detect GPIO with inversion
> > - Connect vmmc-supply to buck4 for 3.3V card power
> > - Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
> > - Add dual pinctrl states for voltage-dependent pin configuration
> > - Support UHS-I SDR25, SDR50, and SDR104 modes
> >
> > This enables full SD card functionality including high-speed UHS modes
> > for improved performance.
> >
> > Suggested-by: Anand Moon <linux.amoon@gmail.com>
> > Tested-by: Anand Moon <linux.amoon@gmail.com>
> > Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> > ---
> >  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 24 +++++++++++++++++=
+++++--
> >  1 file changed, 22 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/ris=
cv/boot/dts/spacemit/k1-bananapi-f3.dts
> > index 5790d927b93d..a7d88564630f 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > @@ -220,7 +220,7 @@ buck3_1v8: buck3 {
> >                                 regulator-always-on;
> >                         };
> >
> > -                       buck4 {
> > +                       buck4: buck4 {
> >                                 regulator-min-microvolt =3D <500000>;
> >                                 regulator-max-microvolt =3D <3300000>;
> >                                 regulator-ramp-delay =3D <5000>;
> > @@ -241,7 +241,7 @@ buck6 {
> >                                 regulator-always-on;
> >                         };
> >
> > -                       aldo1 {
> > +                       aldo1: aldo1 {
> >                                 regulator-min-microvolt =3D <500000>;
> >                                 regulator-max-microvolt =3D <3400000>;
> >                                 regulator-boot-on;
> > @@ -367,3 +367,23 @@ hub_3_0: hub@2 {
> >                 reset-gpios =3D <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
> >         };
> >  };
> > +
> > +&sdhci0 {
> > +       pinctrl-names =3D "default", "uhs";
> > +       pinctrl-0 =3D <&mmc1_cfg>;
> > +       pinctrl-1 =3D <&mmc1_uhs_cfg>;
> > +       bus-width =3D <4>;
> > +       cd-gpios =3D <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
> > +       cd-inverted;
> > +       broken-cd;
> > +       no-mmc;
> > +       no-sdio;
> > +       disable-wp;
> > +       cap-sd-highspeed;
> > +       vmmc-supply =3D <&buck4>;
> > +       vqmmc-supply =3D <&aldo1>;
> > +       sd-uhs-sdr25;
> > +       sd-uhs-sdr50;
> > +       sd-uhs-sdr104;
> > +       status =3D "okay";
> > +};
> >
> > --
> > 2.53.0
> >
> >
>
>
> --
> Margherita Milani
> Embedded Software Engineer
> M. +39 334 758 9111
> margherita.milani@amarulasolutions.com
> __________________________________
>
> Amarula Solutions SRL
> Via le Canevare 30, 31100, Treviso, Veneto, IT
> T. +39 (0)42 243 5310
> info@amarulasolutions.com
> www.amarulasolutions.com
