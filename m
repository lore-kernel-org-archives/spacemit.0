Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD152EBDEB
	for <spacemit@lists.linux.dev>; Wed, 17 Dec 2025 07:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765955529; cv=none; b=P+zgspRxOLjfQ9j7WgDNnXAPHUyQ+o1TUqxNYpXU7mftO2qbq0d/VjfsMOqpU/9XeBO+1xIyj6t247NMVuS4tFDbEergGEqnElaD2VeohKJeYHbwuyiDmD/6R4/Dd/FTIml/IKOVNcD4Czm4JhpVHmdfzt4Iwn/LgFno3r/tG+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765955529; c=relaxed/simple;
	bh=PzRMkJtls7CLFFw4NHuBIdkL6x6XHd3Wm9X51oLX/jY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IzsMIK5h+o9bsFlCcYVEaQuFLguG0StBAkiwPeQyKt2RJRlv8J63PKcbzxQNWEYkNOmZpni7IkE1qN/YFeaFesVHfLMtSBRwT4d6hu3tCr7JPDMWodSU4POGMuieGxwOFNjPegSe1rZ2Rx8Zqh4iLhLnMeJejK4YTySOiSFt3o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=zW9/sGLn; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="zW9/sGLn"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-78e602d09b6so44292847b3.3
        for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 23:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765955526; x=1766560326; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmFJSxesbxFHQ7/q1IylIXrQEr0i3Tqtt2nX92DzZ7M=;
        b=zW9/sGLniDX1jOVnlbU6VPcG9KuKNGDMZsUamLX0kknOKVywVPWt0u6BBetH6+ax/J
         bWm1XaTquXateKIVpLCsay27HQUzS/dFFYONB1ttp3KB4hCZlj/u1wOACeO9jHEOnu1r
         LpZd0TWlobDPjsB9kHOq2xZVb5TtI4a+x8Fm0EFomO1+ir/3m5IfGvSw8u4puzNAeuM9
         YrJ4J32riWRYHh1wknmxN+D/7V+j/noedJ8edem5pezbXVMTaunsSaV2kAOdsS3CQY5k
         juvvN97GM8sVwIwK4JBYU3DNd9YGoG5ph+WE5CXpKFLJ2auXSOh8fmeZ5fo7g4NesF/i
         hteQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765955526; x=1766560326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PmFJSxesbxFHQ7/q1IylIXrQEr0i3Tqtt2nX92DzZ7M=;
        b=t150c5N0zx+VLBLdoiOLy/T71Y6h9BgLal923FBzruwh5PpS6Ge7/pgtBLiUZyZHYo
         duGjiX3GtU46rriLfvuSm4N4sJQhaanH8ISclzz3BI1IN3q43B36EjIXHoVR/OuOWz51
         80PjaI+hd8ZYVxV0v3I+db4isQg7Lh6buzqZ4Dr8AeUMTHF4grqMPpDBRohzr9MCi7l8
         b2BkNPrPyDvD4WgB4g7spPN7V1Wf0tpccsTdOLGq2nZaxipjjC28DMWKp8D+T43y2e1q
         mQ1B6RXzDog3BJWM0LZfV3fp1sTm4a8sNPeg2jLj+PWa76PnNoXZA4PlImalV9YYWs8n
         FQbw==
X-Forwarded-Encrypted: i=1; AJvYcCXAV3jqOPAiCqAIPESXZaO1RdXgKn3ovdePvIl+hXvTcdL8bU+h6F74mNvDVKrXB/Uv3cavYGHs+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxftnD8Ng1maySJCINu3VE14TrUrhRYzjvh7VhN8m8UNmQEejO8
	F2tOhq+J1uD+rXuugcPiN/5/J4W73KMvWOg5CJeMAI9ADFX3IPyXhJvd2Jxzeb9sGqe4SoB/FMx
	xMqNvmIjxzYVaNA2XLT17JmdUIa/Pt5tm/kGKIlTqig==
X-Gm-Gg: AY/fxX6dY7hfjn6qLzoYFt4NqWMlc9+MglULzjiiqlyUEyqrXmy2rNBQhMRUj2YDzvC
	29l2+WVp+IFTVTeqxlPBldXUYeKXGrjYcG9ugE7dACwqbG4CW/mmGtNxxHr4kQxghLFZFmXVIm0
	VN7kuCXUy31gvq3jz8FcJMYUdRAHmt937axNs4d6H4ScpTS50b7qb8Pi5ECxR5VOZ+iRZ9c7ofL
	Lds9L2DgUQeiFCMwar8DuWjZVKjRVJhWiFZyeOwKwcrdh4VIR9FNvW3gXk9aEpKQQtCOKC4Y9Ga
	2bYTNnaa3FjKizCPUSWbDfaHnZT8VrZCD6KwaW3fE5uN
X-Google-Smtp-Source: AGHT+IE8huFPmjeqVhigRS72exyW6RWye/SjaHiK5d2+xtE4vBR2EQkcVlmt5N9wvdRb4rljR0aa/NY7v8SaaR90Wtc=
X-Received: by 2002:a05:690e:1910:b0:644:3850:9062 with SMTP id
 956f58d0204a3-64555668019mr13876808d50.72.1765955526563; Tue, 16 Dec 2025
 23:12:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-7-a0d256c9dc92@riscstar.com> <60948ca2-ed3d-485b-9b11-15df7ef8791d@canonical.com>
In-Reply-To: <60948ca2-ed3d-485b-9b11-15df7ef8791d@canonical.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 17 Dec 2025 15:11:55 +0800
X-Gm-Features: AQt7F2qskcnlJTlmY9mkZsjM35ekor5-LiDipt_O0jT58J0Q0vF7KdDCyFPY_3o
Message-ID: <CAH1PCMb=+TvB1w+G6a2ANDp05HUwC4r6CFBDHXFwSmoP3Mm8xw@mail.gmail.com>
Subject: Re: [PATCH 7/8] riscv: dts: spacemit: add initial device tree of
 SpacemiT K3 SoC
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, 
	Conor Dooley <conor@kernel.org>, Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-serial@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 10:24=E2=80=AFPM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> On 12/16/25 14:32, Guodong Xu wrote:
> > SpacemiT K3 is equipped with 8 X100 cores, which are RVA23 compliant.
> > Add nodes of uarts, timer and interrupt-controllers.
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> >   arch/riscv/boot/dts/spacemit/k3.dtsi | 529 ++++++++++++++++++++++++++=
+++++++++
> >   1 file changed, 529 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts=
/spacemit/k3.dtsi
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..cb27b790716fdd6dc2bc89c=
28dd2588a596a5af9
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > @@ -0,0 +1,529 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (c) 2025 SpacemiT (Hangzhou) Technology Co. Ltd
> > + * Copyright (c) 2025 Guodong Xu <guodong@riscstar.com>
> > + */
> > +
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +/dts-v1/;
> > +
> > +/ {
> > +     #address-cells =3D <2>;
> > +     #size-cells =3D <2>;
> > +     model =3D "SpacemiT K3";
> > +     compatible =3D "spacemit,k3";
> > +
> > +     aliases {
> > +             serial0 =3D &uart0;
> > +             serial2 =3D &uart2;
> > +             serial3 =3D &uart3;
> > +             serial4 =3D &uart4;
> > +             serial5 =3D &uart5;
> > +             serial6 =3D &uart6;
> > +             serial7 =3D &uart7;
> > +             serial8 =3D &uart8;
> > +             serial9 =3D &uart9;
> > +             serial10 =3D &uart10;
> > +     };
> > +
> > +     cpus: cpus {
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +             timebase-frequency =3D <24000000>;
> > +
> > +             cpu_0: cpu@0 {
> > +                     compatible =3D "spacemit,x100", "riscv";
> > +                     device_type =3D "cpu";
> > +                     reg =3D <0>;
> > +                     riscv,isa-base =3D "rv64i";
> > +                     riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c", "v", "h",
> > +                                            "smaia", "smstateen", "ssa=
ia", "sscofpmf",
> > +                                            "ssnpm", "sstc", "svade", =
"svinval", "svnapot",
> > +                                            "svpbmt", "zawrs", "zba", =
"zbb", "zbc", "zbs",
> > +                                            "zca", "zcb", "zcd", "zcmo=
p", "zfa", "zfbfmin",
> > +                                            "zfh", "zfhmin", "zicbom",=
 "zicbop", "zicboz",
> > +                                            "zicntr", "zicond", "zicsr=
", "zifencei",
> > +                                            "zihintntl", "zihintpause"=
, "zihpm", "zimop",
> > +                                            "zkt", "zvbb", "zvbc", "zv=
fbfmin", "zvfbfwma",
> > +                                            "zvfh", "zvfhmin", "zvkb",=
 "zvkg", "zvkn",
> > +                                            "zvknc", "zvkned", "zvkng"=
, "zvknha",
> > +                                            "zvknhb", "zvks", "zvksc",=
 "zvksed",
> > +                                            "zvksg", "zvksh", "zvkt";
>
> This not the description of an RVA23S64 cpu. It is not even RVA23U64,
> e.g. `supm` is missing.
>
> Is the description incomplete or is the CPU not compliant?

Hi Heinrich,

The SpacemiT K3 supports the mandatory extensions defined in the RVA23
Profile (ratified Oct 2024). The list appears incomplete here only because
I am restricting the entries to those currently supported by the Linux
kernel Device Tree bindings.

Specifically, I must adhere to
Documentation/devicetree/bindings/riscv/extensions.yaml (and cpus.yaml for
properties like 'riscv,sv39' which stands for the extension Sv39). If I
add extension strings that are not yet defined in these schemas, such as
supm, running 'make dtbs_check W=3D3' fails with: 'supm' is not one of
['i', 'm', 'a', ...], followed by "Unevaluated properties are not allowed."

Another angle, I found there are other reasons why Linux kernel chose to
'omit' some specific extension strings. For example, here are what I notice=
d
so far, including the 'supm' you mentioned:

supm: There is no binding string for this yet. However, in the kernel confi=
g
(refer to arch/riscv/Kconfig), RISCV_ISA_SUPM depends on the detection of t=
he
underlying 'smnpm' or 'ssnpm' hardware extensions. Since 'ssnpm' is
present in my list, it can be considered as supported and the kernel
will enable pointer masking support automatically.

Other examples:
ssstateen: The kernel schema currently uses the smstateen string to
cover CSR access control in all modes (H/S/VS/U/VU). I have included
'smstateen' to satisfy this, as there is no separate 'ssstateen' binding
in the extensions.yaml.

ziccif: This extension is also absent from the bindings, despite being
implied by ftrace dynamic code work. Reference:
https://lore.kernel.org/all/20250407180838.42877-12-andybnac@gmail.com/
I intend to submit a separate patch series to formally add ziccif to
extensions.yaml.

Anyway, I have limited the x100 riscv,isa-extensions list to strictly
validate against the current kernel schema while exposing all features
the kernel is currently capable of parsing.

I hope this explanation clarifies the situation. Please let me know if you
agree with this approach.

Best Regards,
Guodong Xu

>
> Best regards
>
> Heinrich
>
