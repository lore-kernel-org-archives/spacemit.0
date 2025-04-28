Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E280199EAD
	for <spacemit@lists.linux.dev>; Mon, 28 Apr 2025 12:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745844426; cv=none; b=lmWtilG7PmHYClhTHczV2Pix4S8t9eh5N1Qjl5q0Td5l9YuLjaekJuKpdRkUA8Kla/qo6SXm8I1JJY9x3KOJ7Bwkm0OJtSi/VvKPOuZuGX08c9R5VImQYWHGcCb7SpBslNcN4zXRe2aGJDoYivm9SdBGs+4mte4c0ZAD8LDu7Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745844426; c=relaxed/simple;
	bh=shKL21xOdXscttpIoQ70VuZ/18DPNvHC/sw5ErEbgtQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ptxOyvwfqVWpBBTlxHA65TAMZbwNvE+m4KSzoPlupJTV7byian0LGQ//EMyBO+woHM45rRSDhuGpOdjB96EnHodTYPQcJ2PWrXD8X39wkfO1ijRz31gW14ViZLg1by298zFpOXmnt2qV8E96/k0pV3rPJry0So61AUfjo8i9vyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=rgQECXqT; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="rgQECXqT"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac34257295dso807096566b.2
        for <spacemit@lists.linux.dev>; Mon, 28 Apr 2025 05:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745844422; x=1746449222; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OoDbPOw1p4YqIw8f4N+AkxYNr205WVYeWbe3sl8vltk=;
        b=rgQECXqTVNQFF67zpdv0nvr2HuzZiGUnL9ueFJAI6K0E9A+YtQ1aOnj9b5n/2lc9Qm
         gyivhPLvhYLanCRklEgfSb7HEYrCug7jGsi2EiEApwsr9rm9NMN1grX+NTZLXWcb/xYu
         gdMTGfRyjff7j9juThlUF6aPX0fRVYMlFu+CP5WheQq/0emeidA68lV2pnOUGoftY0yX
         sllc3AEXSWsCTh2JeGm47DkP5rtPuMLmOl+wykZocnnfPJ4UWJlv1RQNRSY6mTxNG/86
         Cizk2CZPtk3VPzf59s/OdV+pVIlM3F3RPEnJFkpBJf1rGEIZ08725/ffHaqTV9GZKsZk
         1i4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745844422; x=1746449222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OoDbPOw1p4YqIw8f4N+AkxYNr205WVYeWbe3sl8vltk=;
        b=dmibOPtuaWhv0y+cgvgMZ+3lpMhjSXl61MLsTnsMCLlohC8nNbAwZPK89/mRDHD9CN
         oocQzpwROJ2sz0vWLLmec3N3XaFqKS5bR7RQPzEhu5Jb1Rl54uiaY8V2zvBckFxCJQ7u
         E8uYb+H0pgQTULlH41QQpG2d9T9myfDJSdANqWBXipkAxypolI12NNMeJgsmvXOtGkbr
         AL9yilEzEf5EMJQJaZ+juf8+Icj/tbPLMXr/wcJOKUbvdAPhmX9r75Uc/z5UHTIxI/5X
         luLEjyqPSONNfFCDoVojNKYauXq2AwAzqRko3h+QBb0yuP2XFNK+cEWmHkNZIruZL5hR
         Ksjg==
X-Forwarded-Encrypted: i=1; AJvYcCW+kGi3Ygrxg/KF8w80zjpGtiOG1nzC9n3VvCKJGnSgvATbPnraxfhpODWIAx0rpvUtuSr2cpEAXA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhPKMPo60bzt53XTZM1xg0mucMluqYTTlc3+OXnsNHTCac5bE2
	ndflaTp6E5oD75/4zfDLlv3eI41iOsUIyYSahK77m+KaUr8UnIVqO4RQflklC73Ens3pe5iJnEm
	Yi9KuYVkzR3cHhCO8NzcvBNsa8uL421E+/Y8s8Q==
X-Gm-Gg: ASbGncvMCWjH9YH23VghoDjABk6xA3akMVqxVcMa61sfgzuc+ZdsX8T7mwt/gj7POQr
	GMSKsjRcFe1rqLo2PEvPsvciEaTcsrIWuJ7lkccHUdYr91fn8pDH7BP9ZcUvgremHLw2ZTpeyZC
	onXIJpKc2Q7hgjW22KV8iM8KS2cPFO/LGzZA==
X-Google-Smtp-Source: AGHT+IGk5TDZtIZeyBrVJJpzccoOP1uFny6dcETQUFtcD2er4S/mHnZ1uSMgcYFWUm241dVvRYAz/RFBf7vixx+9hnA=
X-Received: by 2002:a17:907:1b0b:b0:ac7:4d45:f13e with SMTP id
 a640c23a62f3a-ace710a0eacmr1048006166b.13.1745844422192; Mon, 28 Apr 2025
 05:47:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250420070251.378950-1-guodong@riscstar.com> <20250420070251.378950-4-guodong@riscstar.com>
 <kftfye2zn2ogyvuv7diuyrv5qkp43csbpkcqfcms2xp5lsuubm@z2kocdzkb7qk>
In-Reply-To: <kftfye2zn2ogyvuv7diuyrv5qkp43csbpkcqfcms2xp5lsuubm@z2kocdzkb7qk>
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 28 Apr 2025 20:46:50 +0800
X-Gm-Features: ATxdqUH6-_RHeS-1gOEkcXcvrWC9i9ud1F8bZVmjThNvU434y3rwyRGiOnAAjoM
Message-ID: <CAH1PCMZC5xrX07rd5bo+06zJoJDiAH3UNHqH5catwEALNJL2dQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] riscv: dts: spacemit: add PWM support for K1 SoC
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, dlan@gentoo.org, p.zabel@pengutronix.de, drew@pdp7.com, 
	inochiama@gmail.com, geert+renesas@glider.be, heylenay@4d2.org, 
	tglx@linutronix.de, hal.feng@starfivetech.com, unicorn_wang@outlook.com, 
	duje.mihanovic@skole.hr, elder@riscstar.com, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 4:18=E2=80=AFPM Uwe Kleine-K=C3=B6nig <ukleinek@ker=
nel.org> wrote:
>
> Hello,
>
> On Sun, Apr 20, 2025 at 03:02:48PM +0800, Guodong Xu wrote:
> > diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts=
/spacemit/k1.dtsi
> > index c0cc4b99c935..e7dba623e877 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > @@ -556,5 +556,185 @@ sec_uart1: serial@f0612000 {
> >                       reg-io-width =3D <4>;
> >                       status =3D "reserved"; /* for TEE usage */
> >               };
> > +
> > +             pwm0: pwm@d401a000 {
> > +                     compatible =3D "spacemit,k1-pwm", "marvell,pxa910=
-pwm";
> > +                     reg =3D <0x0 0xd401a000 0x0 0x10>;
> > +                     #pwm-cells =3D <1>;
>
> I want to make all pwms use #pwm-cells =3D <3> in the long run. Can you

Sure. I can do this.

> please use that for the new binding? (Of course this needs adaption in
> the binding doc, the code should already be prepared for that.)
>

I got what you mean. The code change for that is already integrated into
v6.15-rc1.
Commit 895fe4537cc8 ("pwm: Add upgrade path to #pwm-cells =3D <3> for users=
 of
of_pwm_single_xlate()")

Now, if I change this #pwm-cells from <1> to <3>, without the dt-binding do=
c
changes, I would expect to see warnings (" #pwm-cells: 1 was expected") dur=
ing
  make dtbs_check W=3D3

Any suggestions when the dt-binding changes will be merged?
or I can add your patch as a dependency.
https://lore.kernel.org/all/cb799d8a5bb284cd861785a691b8d5e329300d99.173884=
2938.git.u.kleine-koenig@baylibre.com/

> > +                     clocks =3D <&syscon_apbc CLK_PWM0>;
> > +                     resets =3D <&syscon_apbc RESET_PWM0>;
> > +                     status =3D "disabled";
> > +             };
>
> The error that the build bot reports happens (I think) because CLK_PWM0
> isn't known.
>

Yes, thanks for checking. This patchset depends on the clk and reset.
I will add them as prerequisite.

-Guodong


> Best regards
> Uwe
