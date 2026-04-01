Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C87839185F
	for <spacemit@lists.linux.dev>; Wed,  1 Apr 2026 08:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775033610; cv=pass; b=vDgM5uetpC8Rp82u6vWaXClOqyupTi51etQsJVR9JASdRUejZfulXG6/Jy3WEqSfq/o5aiPEgiRh3mkvc61mMWrUBGha9v+PXkejbC6DXo3Xeuvz1NVlLm/PSLXgMlWqTysDwZKm4dvW/RJhGT8URppDybelZchq5QaO3VyWMeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775033610; c=relaxed/simple;
	bh=uXo5sGUS+X2GeacJ66r0n5qoFH9G6+mkiyEHkwOrSd4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZmQRuY0GCuC1lWPnSZxNnZ0ZQsKFlyXjZyvHEHLopfqkGb1z9Zgk/O86aLf+8i1mH4SLoTlxZ52i4Ym/TZw8gFSi5xrcUCUKuQcySRli4C+9bCJ0yzA7nhJiGe7lbRbDubIycpu1qY3gJDj3Zkb6BqlmXQjWO4kON/umxo6PFik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qYuouSuZ; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qYuouSuZ"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7986e538decso33917657b3.1
        for <spacemit@lists.linux.dev>; Wed, 01 Apr 2026 01:53:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775033607; cv=none;
        d=google.com; s=arc-20240605;
        b=dlOOg2T+Drfm5shEqShB/nW80fpoGnpr4vyS1Ac8CUkUjm4rjrl3orBq+pIIHgIpGG
         jurDGl5sD/S5E9VIR1thfaoX7po2dMX1jmN2wo8u6JqIDpO8/4D6FDB5jm1nOdf3pXsv
         tivmG1nt00lR7ct45hqNTXmFhjMnyTgWgpw2ivZQ5i/woDG6yDIPw4YhlszOZ91BrYBW
         3VYfqvuEqA9C1PX554trejYvxlz9PSlIoguO0dBFRb5qRtg9A7HslCjvk18p2DarJe6w
         U67hfWxHavA6oPIKTXAiRzsZ0hBGkL22faoMu+qeBy7WcBJZhEBKrU97KHt7M2KbFIKU
         LgzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ENRki6GE3XavXQugQXE3GjN1Vl6hypf25Ont7yDJwJM=;
        fh=dvJUR0ynaT2xspeYVPOaNwv+WwLOdkhpYBtbbPPWeZo=;
        b=B42EEORdULjbLrzWkle70Tw8UoWAhwG/qQTAkHwNzyVrpQ2ZryDq+m6VeWetnH0LA0
         85rXkTUl/9VOItv93p2BMxApaXUbcpLUKigsTuVC5Uz7ti3hLItXfYtjRF6bFdFsqsRn
         t2MR5RRrvtGtks8kykZNMR1W4M/XW1wQy0Pfvrz2YEOPrITuIvgSiATTAoHdHWcVMQ4T
         8LsrVlaffJnn8NvP2FkK0Z0maejnC3Dr08RbllP/EKumrqmc5Z+sEUOHQmnBFwlorto2
         hMi7u3kD5bDXAj03dXq7vsHW00xgGdXKrpApd79hEdd40OigLJo+0uCsczPc3o5aXkkf
         Gakg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775033607; x=1775638407; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENRki6GE3XavXQugQXE3GjN1Vl6hypf25Ont7yDJwJM=;
        b=qYuouSuZOFSBK8nIzfsAzMj4d2VnDYX04s147FwfvU/NG/bknJK2AePwf1Zsd+6r7c
         SKvE9e5S23vZwTSVsmeUO+5eXnbE7XIgmdLqKMcrVBFKJcTXmHFCIafKmNcm8Ia31VZu
         u3QY3zI4dU7lT//dk2paDtUbisaUBG3sB+W+YApQXHk31IZh1NDEzhWxnm0gwBIGuoAI
         DdHZPmNSasxcSzX6+k37oGIvRLZBDqvSKpCs189y6XE8RbjAPb8ULN20Ttf8jPo8NqTK
         cwThdTYfXcQ/8C5KtZIAKNE7T558Rs4DtWJqjoYoYpqqZmN9oujo4dDqLnT1UjqMWV7i
         /epg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775033607; x=1775638407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ENRki6GE3XavXQugQXE3GjN1Vl6hypf25Ont7yDJwJM=;
        b=ZKZMsDfMIouYci5Cln047KbHg6ctkDd09SBhscio3/W/zYdMN1aZkeiPJONfD5juEa
         9Vgx40Ql7VlxDFWm6NZoR9dpjpDbVXzmWxbD6R58m19NVIoj1aTEyAJFueGYQ0dymANa
         EJIDzxUGgplWoOC4gxgBW5rmVwKpGbPqZEU0RfsujTpRxGefWqJynZzzunIbXYrLvUd7
         VGiml5vo3/CKW2T2bjLgpvxszTIjdFQd6TKbX0D5euK+TIViTRI8vGoH/DyALzUtyf+z
         zazzbotI5f/iFo2lw+lpmvRxsU1ckoRE2O34a+/BxLhWAQkC/fTCOs8BxNi4KQXdeBg5
         6AUw==
X-Forwarded-Encrypted: i=1; AJvYcCUYGkdAX67RIrFKp9LSTOLqKtHCrn7D0HhYz93eCkBOSsaQz6sJAv7ZR+b7+aEyeZCPUPthQfYPXA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwuJCMboQMgv8Wb4YrOpdifw7Lb5Z6ov+6JlwyWOr3BC6EwoLEu
	E/fGuo81g3rjDUwrmGFvE2Q2TUnJXtUMQJbWkLCpKJL0Uv7yZA2hjjzgssPbsE/BenXDtLKz+f2
	YGtR98D8OXR/lmf8fUBxfYGl+7BoXKVo=
X-Gm-Gg: ATEYQzz+dRXBOrDKFnbScSrHhYkdyhSswk/FxPzyOOhyFkk+GZLM5J0sX5IkcxixeLD
	YJhOHoRkmUmg9zlVorVf2jqmhuQTnrUkKI1e9Yx/pTR8fZhXXzrDuGGqNe7MM4bB1krU3t3uvoa
	fIj/zUIUvBiDz3OCsXjeNoMvSH5SwcZz3kkXPjeGeNEm1qWRiyziSCL/Fycf7mTg5GGY0MfE4SP
	oCIBtPs3nI8197ylVLYVlBpS453N9iux4mjWZqX7JFbl8e+AguMQtFfpN3LvWvYuMfUvgzOyI16
	388WmQ==
X-Received: by 2002:a05:690c:389:b0:79b:ced2:fa39 with SMTP id
 00721157ae682-7a2133f6f60mr28605447b3.57.1775033607174; Wed, 01 Apr 2026
 01:53:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
 <20260330-orangepi-sd-card-uhs-v5-5-bd853604322d@gmail.com> <aco9oLumPh4OZtIo@kernel.org>
In-Reply-To: <aco9oLumPh4OZtIo@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Wed, 1 Apr 2026 10:53:16 +0200
X-Gm-Features: AQROBzCe0V-3QMHTJmNMWmbyBErt61jt6_tzSI47AYboyyBlMnKTU6WQsgJn7cM
Message-ID: <CABdCQ=MFcDPnzcYUEkbQyu_0qZt=aDD04p1kyxCMuVt7Av_P1Q@mail.gmail.com>
Subject: Re: [PATCH v5 5/9] riscv: dts: spacemit: k1: add SD card controller
 and pinctrl support
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>, 
	Trevor Gamblin <tgamblin@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El lun, 30 mar 2026 a las 11:08, Troy Mitchell
(<troy.mitchell@linux.dev>) escribi=C3=B3:
>
> On Mon, Mar 30, 2026 at 16:38:06 CST, Iker Pedrosa wrote:
> > Add SD card controller infrastructure for SpacemiT K1 SoC with complete
> > pinctrl support for both standard and UHS modes.
> >
> > - Add sdhci0 controller definition with clocks, resets and interrupts
> > - Add mmc1_cfg pinctrl for 3.3V standard SD operation
> > - Add mmc1_uhs_cfg pinctrl for 1.8V UHS high-speed operation
> > - Configure appropriate drive strength and power-source properties
> >
> > This provides complete SD card infrastructure that K1-based boards can
> > enable.
> >
> > Tested-by: Anand Moon <linux.amoon@gmail.com>
> > Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
> > Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> > ---
> >  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 40 ++++++++++++++++++++=
++++++++
> >  arch/riscv/boot/dts/spacemit/k1.dtsi         | 13 +++++++++
> >  2 files changed, 53 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/=
boot/dts/spacemit/k1-pinctrl.dtsi
> > index b13dcb10f4d66022d27307de73a6ea3287e97441..8d82011f1af666fb78c282a=
2abcc0cb88f962053 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > @@ -570,4 +570,44 @@ pwm14-1-pins {
> >                       drive-strength =3D <32>;
> >               };
> >       };
> > +
> > +     mmc1_cfg: mmc1-cfg {
> > +             mmc1-data-cmd-pins {
> > +                     pinmux =3D <K1_PADCONF(104, 0)>,   /* mmc1_d3 */
> > +                              <K1_PADCONF(105, 0)>,   /* mmc1_d2 */
> > +                              <K1_PADCONF(106, 0)>,   /* mmc1_d1 */
> > +                              <K1_PADCONF(107, 0)>,   /* mmc1_d0 */
> > +                              <K1_PADCONF(108, 0)>;   /* mmc1_cmd */
> > +                     bias-pull-up =3D <1>;
> > +                     drive-strength =3D <7>;
> I'm a bit concerned about this value. Looking at the downstream 6.6 code,=
 3.3V uses DS4,
> which equals 13mA. Since 7mA maps to DS0, what's the reasoning for using =
it here?
> Do we have any documentation or measurement to back this up?

Thank you for catching this! You're absolutely right to question these
drive strength values.

Looking back at my development process, I remember hitting signal
integrity issues in the early stages of this driver development. As a
quick solution, I lowered the drive strength values, which seemed to
resolve the immediate problems, and I moved on without revisiting the
electrical characteristics.

After your feedback, I investigated this properly by comparing with
the vendor kernel. It uses:
- 3.3V mode: PAD_3V_DS4 (19mA)
- 1.8V UHS mode: PAD_1V8_DS3 (42mA)

My original values were indeed backwards from both electrical theory
and proven vendor implementation. Testing with the corrected values
(19mA/42mA) confirms SD card is working.

I'll send v6 with the corrected drive strength values: drive-strength
=3D <19> for 3.3V and drive-strength =3D <42> for 1.8V UHS modes.

> > +                     power-source =3D <3300>;
> > +             };
> > +
> > +             mmc1-clk-pins {
> > +                     pinmux =3D <K1_PADCONF(109, 0)>;   /* mmc1_clk */
> > +                     bias-pull-down =3D <1>;
> > +                     drive-strength =3D <7>;
> > +                     power-source =3D <3300>;
> > +             };
> > +     };
> > +
> > +     mmc1_uhs_cfg: mmc1-uhs-cfg {
> > +             mmc1-data-cmd-pins {
> > +                     pinmux =3D <K1_PADCONF(104, 0)>,   /* mmc1_d3 */
> > +                              <K1_PADCONF(105, 0)>,   /* mmc1_d2 */
> > +                              <K1_PADCONF(106, 0)>,   /* mmc1_d1 */
> > +                              <K1_PADCONF(107, 0)>,   /* mmc1_d0 */
> > +                              <K1_PADCONF(108, 0)>;   /* mmc1_cmd */
> > +                     bias-pull-up =3D <1>;
> > +                     drive-strength =3D <13>;
> See above.
>
>                                       - Troy
