Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6014433554E
	for <spacemit@lists.linux.dev>; Wed, 17 Dec 2025 07:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765955645; cv=none; b=uBRFKbO96ABRvMlhxp5iD59ie0p7JooDDReRtVTXrreXckET/o3aLQyIzcA+BxkEq7XglJd8DxLddUyMw62iOKid5uokWByeIydCSmekp1iPezEr9aA+2FNAjYZWCxrmKai5PjPcCz2QwiuiUT1xAL3iw6tQHNB+qRV25IADb+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765955645; c=relaxed/simple;
	bh=/3Qz6JpF9If22QjnUQlmi1erbphQgNsGGIVDRF+xmkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tV0YiUqjxptPN/a5cwDh4d6wRBa2ZeHK6zXHZsUwGC9rPWDF/cEbvKS+BL0bFeMJsaycqDb0aWrlZGXg4oyiAgIVtwveO63IODBKH8W7ppCHodIMKR5C29kDPg8GxcAHBIWb5PAEV79L3GTzRbMFXVqupkQAt2ZSwEIuwzsJf48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=2aI2Q1Bl; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="2aI2Q1Bl"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-78e7cfd782aso30278157b3.0
        for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 23:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765955641; x=1766560441; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDfl8qAKqI9K5fPdr90NV1qLIsNLvTVsSytePWp/iv8=;
        b=2aI2Q1Bl0ICD0zptVqo54l32AE9I27B0N0BX5eNbHHQMoFSInFuuOd6YpsrFi51Dwt
         5kMi+MMItG23jRtWgqXmxoqUKu5SwlwjfVBCrV4kOHkdOspDiAkQ8b3vXruGX8arLJoU
         vQC1QCdxsWTJSPT/D2DGS3bPS3vQhLQWl+Wp5XMC4lbx13XNd3GtQnjzl5kS/EzQ6mUi
         aYtuZ7f9kr3UzTTYr8+JHtY5/oft6GKwzI1EUxq4fmn0D8KOYi8oa45A1yYT8z02lQ0V
         y57ydoLiSeRpBAIFOIRXBmjiFxBPYpjnWAxk1Uo/qiDRFomYFCxjlF6AjoQDSAg8goGD
         h2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765955641; x=1766560441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HDfl8qAKqI9K5fPdr90NV1qLIsNLvTVsSytePWp/iv8=;
        b=slQ8M0LXzAAr5vrwLxskXagU7OD4N/Bv8PVU28J9MhTC3obKEPXH3Iih79B5yJ29Ox
         XGyzxXQmp3UcN2iuGZz33OgIBKwOtd3mzDw1EFqJJ1sziLhO6kstmsZDFtS6HvPVzkHl
         Tj9l4ewngYG0w9ETNT9Fl2plt8NRcwcnmklSjEPHcyUKGJCpwOsfoVQqZEAQ5jvChJxU
         dTgLVAyPhTar92vV9wEkN0+jGjpRuORwH4jhZwUI4DJVFxOwdzG6GiJSIc2JYizYBDC6
         rlumX5seFuPmty9mEAptUCxwDk96fXsVoFM2qLztUXDnhoquMr4AjXH8uLeUiMIeAzTQ
         T8+A==
X-Forwarded-Encrypted: i=1; AJvYcCXmwUTR0weHH9lsdw5+u1bEbwWTZzsPT5DHOz84XDs5wIOTU5V4yID2O2iL2REgKUuZuszo7NUQSA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxoTW7RYjUXnRc5iuj3Y4eGfWvMYfpFH2uX8lxjr30Gr9yi4aeT
	YAfHIGm3Vls9QU/BwWQMWK5LQSGZbHbUKUqV7bGpO3FsHyFxi3pp1Ijl5q9YwfOjLxbi/vYp0OY
	YVDMUPS54RsHn17O/KRQiqw1C3d5iiJ+S3YLncEpZzg==
X-Gm-Gg: AY/fxX4f1o0rknowi63Y1rkBJdfDg9D+/IfRNZNAMeQ+v24tfQA1SIhFWyZm65wrR/4
	YulIlxOKn+DtXxZ7HdC4OhU5Fg72w+qtTvFpQqQht9oXrWw2I24IDZZe0ESWcQevVd0NPDy9d0U
	I6LYFY/2tbafgaKyXN1zvyOn1DiLc6CEhF1jJ5t2CgSo8trf+EMZcFRKlMwG/PpFE0g/l2Bl902
	9wsFUthpaVkLUjk5YFp5b2rXZoXEzGvHIO2Ox8+oeTH7BdF1ae4xb+/jK+B7APSAQaDXo+Pyrbe
	yyNkwG7ZZOCVnKl9Ls+r3COhLTS3frkBhmHoxdS74UNYZIYkGD4C7VA=
X-Google-Smtp-Source: AGHT+IH0USc98adq68YuNkR6BO6s7ouNVB7SxQasWdlzVDiV6ZxglCL/bAho39AyjZN16MBGjdgmEImzF7UM0hhyf0g=
X-Received: by 2002:a05:690c:6a0e:b0:78a:7a68:e4fe with SMTP id
 00721157ae682-78e6831c4dbmr123317137b3.25.1765955641406; Tue, 16 Dec 2025
 23:14:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-8-a0d256c9dc92@riscstar.com> <3c38ce9c-4259-4149-bf2c-a54e74c00a34@canonical.com>
In-Reply-To: <3c38ce9c-4259-4149-bf2c-a54e74c00a34@canonical.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 17 Dec 2025 15:13:50 +0800
X-Gm-Features: AQt7F2qt3rSNkF23w_AVCZL60KRRfHKfFoZFSmyzaNBRd3Kb1iOnGUyhNAVCUBk
Message-ID: <CAH1PCMbzv_uggyZ3JLPyWXSwbe2dJAh7jVT64xpM6SLG77VZqQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] riscv: dts: spacemit: add SpacemiT K3 Pico-ITX board
 device tree
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Heinrich Schuchardt <xypron.glpk@gmx.de>, Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
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

On Tue, Dec 16, 2025 at 10:33=E2=80=AFPM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> On 12/16/25 14:32, Guodong Xu wrote:
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
> >   arch/riscv/boot/dts/spacemit/Makefile        |  1 +
> >   arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 25 +++++++++++++++++++=
++++++
> >   2 files changed, 26 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dt=
s/spacemit/Makefile
> > index 95889e7269d1bae679b28cd053e1b0a23ae6de68..7e2b877025718113a0e3191=
7eadf7562f488d825 100644
> > --- a/arch/riscv/boot/dts/spacemit/Makefile
> > +++ b/arch/riscv/boot/dts/spacemit/Makefile
> > @@ -4,3 +4,4 @@ dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k1-milkv-jupiter.dtb
> >   dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k1-musepi-pro.dtb
> >   dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k1-orangepi-r2s.dtb
> >   dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k1-orangepi-rv2.dtb
> > +dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k3-pico-itx.dtb
> > diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/=
boot/dts/spacemit/k3-pico-itx.dts
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..0f9d04dd352f5331e825992=
85113b86af5b09ebe
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > @@ -0,0 +1,25 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (c) 2025 SpacemiT (Hangzhou) Technology Co. Ltd
> > + * Copyright (c) 2025 Guodong Xu <guodong@riscstar.com>
> > + */
> > +
> > +#include "k3.dtsi"
> > +
> > +/ {
> > +     model =3D "SpacemiT K3 Pico-ITX";
> > +     compatible =3D "spacemit,k3-pico-itx", "spacemit,k3";
> > +
> > +     chosen {
> > +             stdout-path =3D "serial0";
> > +     };
> > +
> > +     memory@100200000 {
> > +             device_type =3D "memory";
> > +             reg =3D <0x1 0x00200000 0x3 0xffe00000>;
>
> Shouldn't the reserved memory be described as no-map /reserved-memory
> nodes instead?

Hi Heinrich,

Yes, you are right. Using a reserved-memory node with the no-map property i=
s
the correct approach. I will update this in the next version to explicitly
reserve the first 2MB.

>
> I would assume that 0x1,0000,0000 is the location of OpenSBI.
> What is at 0x3,ffe0,0000?

Yes, confirmed, 0x100000000 is the start of OpenSBI. The size 0x3ffe00000 i=
n
my original patch was the result of manually subtracting the 2MB OpenSBI
offset from the total 16GB memory.

I will correct this in v2 to show the actual memory and put the first 2MB i=
n
reserved-memory {} for opensbi.

Thanks for the review.

BR,
Guodong Xu


>
> Best regards
>
> Heinrich
>
> > +     };
> > +};
> > +
> > +&uart0 {
> > +     status =3D "okay";
> > +};
> >
>
