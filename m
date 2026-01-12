Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79597318B9D
	for <spacemit@lists.linux.dev>; Mon, 12 Jan 2026 08:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768208274; cv=none; b=ayVH8oNLUQfznWZ9ikhNAZF9w7IByFpVXzFdZfeXR81SkgGRTo6f8+7MpaL89ninEfGcIhAE3vVfnefAqeBA3GKPJ0VHLyCXbVpFywuojalMMQLmWbC7d3LxYx12hiiilCxeyc2qtqZO6PoG5vEFDqP2ZBrcgAs+ChXCsvaMf3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768208274; c=relaxed/simple;
	bh=VaZMiPzlaOln98uHBtXqBDV1bn/cvr20Z/exAarYh18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NNDi++ZJJfo8Bbc+hSt6PRU5b929UIBFPQDjleGJbrc+NYNgNh4XzTRdZB+YZ1gHP3E0NQBJacMoDQgwUME/zOTXYD5zWy4shzrDBF4NoHXz6cD/hhnIdVpn3OuuyAjSgDio+s94L+uATySFCRW8b9e29bu/ed99BTTkPMODhr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=cqKwMI78; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="cqKwMI78"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7927b1620ddso15787617b3.0
        for <spacemit@lists.linux.dev>; Mon, 12 Jan 2026 00:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768208270; x=1768813070; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOTnLPv4tv9bJjvux1j20Y+ExCg3MSBOD5unB3qoASs=;
        b=cqKwMI78Fk5Xl5f5DOoV4e1qxPV/7/3qbw9NJiAMw0LPwmD7Oh4yeJcPH4OHcnrs5E
         feNilAR/1iNyRuHXvASxsW+ho/NK+h5wPY6NI5T8SL5QWhCg47Fxjr4FbH/7K7m1PfDk
         wmNcCMlupUWQoa/geU23T3gdrVQpUOqDkofQ0hXbBsusJ7Yz6RE5yvOOQBTesIuW4Six
         GNmwG96SR6g2HkMFq7cMuBpjKkWATNU1EkxFwLwFTObHMMy++s5zah6h99kn1uIAk8KT
         X8LYYQyqpjlIeIYfnr5Buz8qpTC5mgRel/hjtLzrjsL9TW52AX+z0sjadKrjKzveqnVC
         oHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768208270; x=1768813070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BOTnLPv4tv9bJjvux1j20Y+ExCg3MSBOD5unB3qoASs=;
        b=OIDccs35v335hwvStJQ5Mjt3Jk+vOB5vtZak6N7M+JhAQ+y2YeMlD78NsO6McRO2qt
         J8and7Z9Q66+ve7+bMcn+yR8Jaf/R0Y+G3kU38kth+aOSHOWVffg57emeKKn7APiebMP
         yRqf5pIYnOSgvfem5bZmbwJTgbZF7i3zXUnwlnEPTgGKlnNWHI7VGKDz17BvYujCNnZi
         sgMhoKeQSRKnnP2Y+4SjC0cEkiN2dEFuFeVtf+DsNw41q2XW/yRT2/G49AKvIPnBC9qA
         pUjeP4O1Lrp0r+9vHYX6aQVfPt0L9zHSKq42zTUdl1dc9U5yEtjyCg9NEV1xtesQLIy7
         s9Eg==
X-Forwarded-Encrypted: i=1; AJvYcCXT4OmIBEj4f4937cS5L4DNN4q0mB/lsFkoisvyc9F2MWNv97drcL5DWrvj0LrAxcMgXy9dLaEVTA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwiVT4QI3+Z/nJ3yKfO6iEUlgGrV8fWQ4rczQm912khoGvyxAlx
	zTG/5n6RykI8QeAWLvdgU+DvWJrDVVzNcpUmDlY8VdtYc42GsCk2yuiNhQAgscWIoagHBDGSyJl
	SHkBJV59YYMJkO/2C2yg6efqegx+eWOP7COKRTD2W1Q==
X-Gm-Gg: AY/fxX6L540Ha5U+r1sNhRjLsOHDJPPocMgB9byhmBUJU9NRGgQnVX0eD+lG7jmXG8r
	mbZcvyJBpT2HI675iNLbLMap7KlfuV/IJlxiYO2yJftabeZIxInTrZ+EBbYuyVdc+4uLrsGclND
	FSvujgyDI0uVNupeeDZbXnVOu9YlZwq2xFdoS4rK7XAV2Wdhsx0wN9RADTIt+/zv1/omsve9hod
	S1GQzzj5te4niqoCCAN3pdEAsZa0mu5DUsho4GVFqfhM9TRWSvrWDIUKrDCIsHtwWLnV35JsGj+
	cSD6uHfytk7w7kyUOxiFhGjnGTe9jtnWkcXSiD2/jAkt
X-Google-Smtp-Source: AGHT+IHL6qC6Bkth83Jc0kDsLdGPlb1zjnY+NAdd3aSclQU4CUJsna2Gp1MfFiPTsIdJiiM4QkEp+AQp/YU/RgU4yqo=
X-Received: by 2002:a05:690e:1917:b0:644:7ad3:6528 with SMTP id
 956f58d0204a3-6471679490amr11838822d50.41.1768208270556; Mon, 12 Jan 2026
 00:57:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
 <20260110-k3-basic-dt-v4-11-d492f3a30ffa@riscstar.com> <20260110095707-GYA12783@gentoo.org>
In-Reply-To: <20260110095707-GYA12783@gentoo.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 12 Jan 2026 16:57:38 +0800
X-Gm-Features: AZwV_QjrjPKzZ_O6yKHBkitCXrxqQZum-hZ1CkViiN7l5vhVdnYqXq_Ns-pXHZ0
Message-ID: <CAH1PCMbXhELJZnUv11izJSqSuzWd0QgvdDKaGXmUefLuUx7-PQ@mail.gmail.com>
Subject: Re: [PATCH v4 11/11] riscv: dts: spacemit: add SpacemiT K3 Pico-ITX
 board device tree
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Heinrich Schuchardt <xypron.glpk@gmx.de>, Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Yixun

On Sat, Jan 10, 2026 at 5:57=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Guodong,
>
> I have a minor comment for the subject, it's kind of little bit redundant=
..
> so, how about (also apply to patch 10):
>
> [PATCH v4 10/11] riscv: dts: spacemit: add initial support for K3 SoC
> [PATCH v4 11/11] riscv: dts: spacemit: add K3 Pico-ITX board support

Thanks for the review. Sure, I can do it that way.

>
> On 13:18 Sat 10 Jan     , Guodong Xu wrote:
> > K3 Pico-ITX is a 2.5-inch single-board computer equipted with a Spacemi=
T
> > K3 SoC.
> >
> > This minimal device tree enables booting into a serial console with UAR=
T
> > output.
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> > v4: No change.
> > v3: No change.
> > v2: Add aliases node in this board DT.
> >     Update the memory node to reflect the hardware truth. Address
> >      starts at 0x100000000 (4G) boundary.
> > ---
> >  arch/riscv/boot/dts/spacemit/Makefile        |  1 +
> >  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 38 ++++++++++++++++++++=
++++++++
> >  2 files changed, 39 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dt=
s/spacemit/Makefile
> > index 95889e7269d1..7e2b87702571 100644
> > --- a/arch/riscv/boot/dts/spacemit/Makefile
> > +++ b/arch/riscv/boot/dts/spacemit/Makefile
> > @@ -4,3 +4,4 @@ dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k1-milkv-jupiter.dtb
> >  dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k1-musepi-pro.dtb
> >  dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k1-orangepi-r2s.dtb
> >  dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k1-orangepi-rv2.dtb
> > +dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k3-pico-itx.dtb
> > diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/=
boot/dts/spacemit/k3-pico-itx.dts
> > new file mode 100644
> > index 000000000000..037ce757e5bc
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > @@ -0,0 +1,38 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (c) 2025 SpacemiT (Hangzhou) Technology Co. Ltd
> > + * Copyright (c) 2025 Guodong Xu <guodong@riscstar.com>
> strictly, should update to cover current year - which is 2026 now

Yes, that's a mistake. Happy New Year, 2026!
I will fix that.

>
> > + */
> > +
> > +#include "k3.dtsi"
> > +
> > +/ {
> > +     model =3D "SpacemiT K3 Pico-ITX";
> > +     compatible =3D "spacemit,k3-pico-itx", "spacemit,k3";
> > +
> > +     aliases {
> > +             serial0 =3D &uart0;
> ..
> > +             serial2 =3D &uart2;
> > +             serial3 =3D &uart3;
> > +             serial4 =3D &uart4;
> > +             serial5 =3D &uart5;
> > +             serial6 =3D &uart6;
> > +             serial7 =3D &uart7;
> > +             serial8 =3D &uart8;
> > +             serial9 =3D &uart9;
> > +             serial10 =3D &uart10;
> I think we only add aliases for devices which actually enabled

Sure. I see your point.

There are different styles existing in the kernel dts. like sophgo, and the=
ad.
I checked th1520-lichee-pi-4a.dts, which has aliases for serial0-5, but
only enables uart0 actually.

However, for SpacemiT convention, and several others, I see a different sty=
le.
In k1 boards, both k1-milkv-jupiter.dts and k1-bananapi-f3.dts only have th=
e
serial0 alias, with only uart0 enabled.

For SpacemiT K3 boards, to follow the convention, I will remove the unused
aliases and fix that in my next version.

Best regards,
Guodong Xu

>
> > +     };
> > +
> > +     chosen {
> > +             stdout-path =3D "serial0";
> > +     };
> > +
> > +     memory@100000000 {
> > +             device_type =3D "memory";
> > +             reg =3D <0x1 0x00000000 0x4 0x00000000>;
> > +     };
> > +};
> > +
> > +&uart0 {
> > +     status =3D "okay";
> > +};
> >
> > --
> > 2.43.0
> >
>
> --
>
> Yixun Lan (dlan)
