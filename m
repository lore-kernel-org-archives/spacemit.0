Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3E6DF6C
	for <spacemit@lists.linux.dev>; Fri, 13 Mar 2026 09:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773394941; cv=pass; b=s2fC9sWgpILwcvn3J3BTAJPAm4xAdZLXcIqpcUWgTVVsUpq2ctWR51fIlFfe+qfSMW25w1tgNBKFvrV+WGKURDNsg76OE+uY3ihhVH5QvwsjjjBeIi7a5MhAbuREqaUk5pv6NDYc5TW8W78O9z6xupwvQBaoGaUua+BOXVAsr60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773394941; c=relaxed/simple;
	bh=MfYGZ05oe5Hl1+CugXl52UD3u1IznX83KLBTqcRp3jw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dOQJcUrH+Raq8EF82+Y4xbePGPQOAMZTYBTMzy3jnJoj9qTqE/cmwP7xjsHzYSGoC0YCxQVFpigoe+KFuJLjaRDNEmWKpAb6wEriT+h5ThGiOjeMoh6WJ7agy+Uk9T7oSmDGlwJwYp67DS1ZOfYavWIpef1QtiNTHQItRnTnfGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FiZcTtFl; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FiZcTtFl"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7986d231b3cso46245067b3.1
        for <spacemit@lists.linux.dev>; Fri, 13 Mar 2026 02:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773394938; cv=none;
        d=google.com; s=arc-20240605;
        b=U3gUAmoYNG53gkJG/jCgxTX0dAA04q09vKo0wt2qpKn37uy6aPPuTvrXvWbro5EP5y
         1cb+mETBJ/ubvyItZtz/jkrArujO7I7MtAiadAxcwit7iYImBO8IQ4u6Mdz3gr+VhRcw
         h07EvvIXVDmvb/YOIfyQKJkIJpYg+rXlqd3ULITITYtHudwsPabM4sXNsqP39h4zJEg8
         rpDkFICUdtoP/AZs0hqkRb2poPkiykvTqdoknF2rDaEf9aSzLI7PdWScEwTpVf9S1s4I
         L7lR645EHOVFhxKa7stM3apGnicKXVP+VXWZp3zX6Ib4uK4m+O9aYebByk3sR5+I+/qc
         vZ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3WjmletplWN85DKdqz792fPfJhrtfvngbL64ZSg/oZw=;
        fh=dCo0g4H5oZONDsNk0l0zx/vyBKu8JjgJrRWavN2pSUM=;
        b=hSewhYrgyxIzuqCMQh+QQyb3hROLjQjp+6ZgUmSlc+bBB5zflkbyRux9kH+hDG0ukR
         OEpx0WGq+BWak+U0mPH+2hNfvDgJjD+eNG/MOJmAbuKHvIHIrRDPceG9sx1OewkgI4xK
         NcgyG3R7HzB6XrVu6wNHhzhd+MSEAHxYa7Jy9oZNbeMKGxMV+3zUTZLEyZlRPle9p73V
         Pr3vMPDDHKHwvmJqphnbteY7as2n3dAEUzUB5YpmfpVj2PnHoLeOhNw5OOiTZGy9GrKV
         IKjk5yQPX0ZXni+09so/Gu+hNpjpNoH7Y+au3wkCALatYmDei7lwj0nqhvi76G8ki3IK
         Bhgw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773394938; x=1773999738; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3WjmletplWN85DKdqz792fPfJhrtfvngbL64ZSg/oZw=;
        b=FiZcTtFlBNJDLQbHK+zkZ37oKk80vX5tV+X4RpkKc3pic/fGGycqYwBjCUcjktKn62
         ClPX11icSBTXwKBjbCSZ2As3ZrcUoLusM32HCvKvtuVmbQkSn43hUEzvUXuqhRhK+osH
         7rhTBg/A1efHINQJ24TYwTWetZVZbfde8PNEzzSK6CBuz/ButENZ8zfWg5p61al8fTGZ
         t/pPd/Abdy1RMMshLqpgF0hYwR66xdNlCoF0idql32EexkkKEi29rTaKDefqY0VX9wJA
         wtAw3ZofNaTBlfRM89ySBR3eNXU8JkVFeVYH4C5eTtXNs70fIwSfsCkjRDEWr6i8cDnn
         cerw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773394938; x=1773999738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3WjmletplWN85DKdqz792fPfJhrtfvngbL64ZSg/oZw=;
        b=JMJP0FrZl6mll9xur3GEp4oOcH+6Kk4Ts2IX/N0X8D6gKe97dOb3f5wpwn5DgZ7sEm
         It36EgBEKpgv76wAVp1TroLGUstI7swNovYS1FIMuamitjwmLgLgCvqVKsTcc4GQPQZp
         eA7P2fcAOYNRfX7Z/0skAHe6FRSqcIMl6eWritnOUbeIJg4LYoQCEwK/hniVoT8XCFh4
         WUSb98HL/ghuGFuPrby4zujoSDyoCoaNGK4pGlNYmju77HOGirj58FG/U+2hPx7Od9HC
         HU5aeqvFwqnESJFxFBUeVUxGsrhpx+g0JS8HE+yLBnLfica1gwWFjbJ3GlQCdkBc1fGm
         mdCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEd0WtxbvydeywdXkfl3KarTC01nAC1l5/769swDcPKnk9BBMBdL3SsFJflkmYFanqBJDn97i2sQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzbO99w5h0tzXndxgZLNA2avP3GhVKxuSlSyE8dvB30TAawsPh1
	2ep7INO8pYvIb69IvfOQxOsCePPQFaspL/UPMRhPSakiQDdxJPJS1bXConOJ2gv1cS0DY7sdzOP
	1nhNsX9OhsH1IXaZmwUyPJLfmyA+FssI=
X-Gm-Gg: ATEYQzyXX39GUvbAYwg8H/N+eRF4BaWdjb8zGxWiQNuUF2TrRZoYAvlPNYHGyYCNTvC
	ZaC392RrSPc2JMGF9O5PHiMO2x5kkQJFDD/VElZyhX/DsESsuYRCnOa42E7/KG2BsRRgYgFBVPG
	TxxiJncdXIDzZ/45ZM0njbSNSSCp6tQdtYgy8xKd4qweQ3lkPtiLMB7Bl4sA4+KTtCHM09pGdwQ
	Eegj5PmZ+GbOIFYh/0E7WOG1ZAFgJHwY8jTA06hqiRWBtsviii7KjMjTXWWowv3syT1B1NTeSfQ
	ahY72/4=
X-Received: by 2002:a05:690c:c4f9:b0:798:7039:eecc with SMTP id
 00721157ae682-79a1bbb4527mr27419187b3.6.1773394938250; Fri, 13 Mar 2026
 02:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
 <20260309-orangepi-sd-card-uhs-v2-6-5bb2b574df5d@gmail.com>
 <8e91c86d-ea41-4535-a7cd-5b602c546cb7@baylibre.com> <20260313001940-GKA407679@kernel.org>
In-Reply-To: <20260313001940-GKA407679@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 13 Mar 2026 10:42:07 +0100
X-Gm-Features: AaiRm51e5SToR1tOSk9liHEfRop_JhUUodJVYw5is_oXMgLYIQA1K8IuEgYknus
Message-ID: <CABdCQ=Mv-3X8KE1WOWKVTmq+POgJczsL-qFdAyp5qzM6=0s28A@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] riscv: dts: spacemit: k1-orangepi-rv2: add PMIC
 and power infrastructure
To: Yixun Lan <dlan@kernel.org>
Cc: Trevor Gamblin <tgamblin@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El vie, 13 mar 2026 a las 1:19, Yixun Lan (<dlan@kernel.org>) escribi=C3=B3=
:
>
> Hi Trevor, Iker,
>
> On 14:27 Wed 11 Mar     , Trevor Gamblin wrote:
> > Hi,
> >
> > On 2026-03-09 07:40, Iker Pedrosa wrote:
> > > Add Spacemit P1 PMIC configuration and board power infrastructure for
> > > voltage regulation support.
> > >
> > > - Add board power regulators (12V input, 4V rail)
> > > - Enable I2C8 for PMIC communication
> > > - Configure PMIC with buck4 (vmmc) and aldo1 (vqmmc) regulators
> > > - Set up regulator constraints for SD card operation
> > >
> > > Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> > > ---
> > >   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 48 +++++++++++++=
+++++++++++
> > >   1 file changed, 48 insertions(+)
> > >
> > > diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/=
riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> > > index 7b7331cb3c726f11d597f81917f3a3f5fc21e1b9..414b03f5e6480f05f5d7e=
eaaa0afb4e86425ae36 100644
> > > --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> > > +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> > > @@ -19,6 +19,25 @@ aliases {
> > >             ethernet1 =3D &eth1;
> > >     };
> > >
> > > +   reg_dc_in: dc-in-12v {
> > > +           compatible =3D "regulator-fixed";
> > > +           regulator-name =3D "dc_in_12v";
> > > +           regulator-min-microvolt =3D <12000000>;
> > > +           regulator-max-microvolt =3D <12000000>;
> > > +           regulator-boot-on;
> > > +           regulator-always-on;
> > > +   };
> > > +
> > Is this the correct voltage? I don't see a 12V rail in the RV2's
> > datasheet, and the board's specifications only indicate a 5V USB-C inpu=
t.
>
> Right, this should be fixed. Please note Han submitted one version of bas=
ic DT for rv2
> which I think that series will go in first
>
> https://lore.kernel.org/r/20260310161853.3900605-1-gaohan@iscas.ac.cn
>

I'm fine with that. Do we have an estimate of when these changes will
land? I'm fine with rebasing once those are merged, but I'd like to
continue with the review for the remaining changes in this patch
series and I'm unsure on how to proceed.

> > > +   reg_vcc_4v: vcc-4v {
> > > +           compatible =3D "regulator-fixed";
> > > +           regulator-name =3D "vcc_4v";
> > > +           regulator-min-microvolt =3D <4000000>;
> > > +           regulator-max-microvolt =3D <4000000>;
> > > +           regulator-boot-on;
> > > +           regulator-always-on;
> > > +           vin-supply =3D <&reg_dc_in>;
> > > +   };
> > > +
> > >     chosen {
> > >             stdout-path =3D "serial0";
> > >     };
> > > @@ -92,3 +111,32 @@ &uart0 {
> > >     pinctrl-0 =3D <&uart0_2_cfg>;
> > >     status =3D "okay";
> > >   };
> > > +
> > > +&i2c8 {
> > > +   pinctrl-names =3D "default";
> > > +   pinctrl-0 =3D <&i2c8_cfg>;
> > > +   status =3D "okay";
> > > +
> > > +   pmic@41 {
> > > +           compatible =3D "spacemit,p1";
> > > +           reg =3D <0x41>;
> > > +           interrupts =3D <64>;
> > > +           vin-supply =3D <&reg_vcc_4v>;
> > > +
> > > +           regulators {
> > > +                   sd_vmmc: buck4 {
> I'd suggest name it more generic and add a comment where device reference=
 to it,
> since buck4 requested by more than one devices, will make people less con=
fused.
> something just like:
>                         buck4: buck4 {
>
> > > +                           regulator-min-microvolt =3D <500000>;
> > > +                           regulator-max-microvolt =3D <3300000>;
> > > +                           regulator-ramp-delay =3D <5000>;
> > > +                           regulator-always-on;
> > > +                   };
> > > +
> > > +                   sd_vqmmc: aldo1 {
> > > +                           regulator-min-microvolt =3D <500000>;
> > > +                           regulator-max-microvolt =3D <3400000>;
> > > +                           regulator-boot-on;
> > > +                           regulator-always-on;
> > > +                   };
> > > +           };
> > > +   };
> > > +};
> > >
> >
>
> --
> Yixun Lan (dlan)
