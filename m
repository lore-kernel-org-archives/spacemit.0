Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9320D3126B6
	for <spacemit@lists.linux.dev>; Wed, 31 Dec 2025 09:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767173811; cv=none; b=qsQgJaRbdJya/gXHtXjT8JqmegA7h1btBCmjotPN97uvKvBXAZo70Sdt09t3xHsMBiYxyuLdNLknpZB/MOddYWi2Vi7YO2ZRrYMHqxkoh0wesaCmvktpEifzyHuaY8AmffZ4V628eYWAgJW+UNOrFU1qNpwTkPoPJs8IJuhvUPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767173811; c=relaxed/simple;
	bh=NFYMGA676SEkVsJALqldtmkMw4qPeRAQ2FzyKMLEA+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MEYKAU+QIsA6GM2VtHoXSmBz7yVdhTp3PubHo+khDMhgv0LHTeihUArr/LtkSFYrDw48Y4fmrCwrIQKbNQ5rVDv1v51j+9mEk9o5JOK4JXLorOiLmAla9/1JEQOPqTX+UfSXPT9uHtCBY0H+i05huvQslsKHVYnEvWAUDA8bNmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=I6BGrGWd; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="I6BGrGWd"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-78e7ba9fc29so95131517b3.2
        for <spacemit@lists.linux.dev>; Wed, 31 Dec 2025 01:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767173807; x=1767778607; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/3+RSe7fQelQU4YkqbPxOBoE/8zH+jlMkgHbbjEj8c=;
        b=I6BGrGWdaBdijxiHYMmnkZ8FYm6wDlPySvMaS/sRYLRs4x9yI7HA7kH4naLGCZ6Uzj
         mgiJ+9HKFgHVeD+TR8Pp+ksrxilINOW79H85taoSjIUhGOaLGJUHSVgMqqvjwO6hiwd8
         Jo2iWZgxu9TyW2k1G+IFLYK7Z7IDh1JkcNTAFp1al5/H5SNVmRY4C2zCTis+/9KgBOON
         eiqw5GI+PaXmABLcAyzbUrW/23Z5+YSDtxhg3OQHnhtq/kNLIBPy9aqjNngj6E03hkh0
         zJZ3MFlXzTaKJXt9e1R0A7O5KNDsPMP30XH/3NMNFFZj+R0Akx4W6HgHGWpD4Ewydcef
         as8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767173807; x=1767778607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i/3+RSe7fQelQU4YkqbPxOBoE/8zH+jlMkgHbbjEj8c=;
        b=Bd/RjvhilB1z8dSvzTiMTKcj71t5vTJm+6dg0IodJSnhWSZU7wLgkkW9Meu5IyruLp
         r4N0dK2qL3kxS7ICJYMG+GqQHDXKcmPyNkALwTwlRv5Wl+t6KJBlw9GNfl9k4gWwstXI
         EsDprvaJuaT7xh4O9EPqmIqxuOEFPgPK3lBp8W0LLa2K2u8AzT/cpt6ry5/kP/fhQYPJ
         +suQ9JZ+z0g1qCN3kaA2tSb0O7ZbdAj61d05NuAh6A2PpInsAzKCZhQbUG31ANNMA6tj
         7/jqdIOhZtlwrGw1v+TKN7Hh9NCOVxIvahne7AGLQiHFc/Ug6weZwrJbUxGJJ0nZ140T
         j1hw==
X-Forwarded-Encrypted: i=1; AJvYcCUDsEnJty5MB5+cvlqKvZP3NO42b/kjyhHv8OQu2jG1AadgJQXmAeJTzp8n2Org1obBqMtSd65IIA==@lists.linux.dev
X-Gm-Message-State: AOJu0YylxmbKhzkloaPYpOU8iJWz0ri1Q95WFszE1iHkflpusC6565M2
	8RsoqQkmiq2LNDb0YGHdN+PP/VY9mVmr6h8cHTHTzD42auQJn+Uvj+aM9KdwVz3TtzfSM+nobWI
	DsFcNRGadqmFlFOuLHApCKI5NImT4DRoqo8ybCwK7zQ==
X-Gm-Gg: AY/fxX5Y/4ORZ6iI8+9tjIr64CVQYXSfhGWPtE7Y7SncWNOtMyY18E4si//xQm11YLg
	9i87ajgo9SO+QwAU8QI9oPOZzqCXFBYqMnnpFyxpdqQnP8tOWfUnMd5T5R2CEJ/p4tDSchaVi9V
	xZg7DQ/RU8z5zZK4rOiAWPXDhq6M95D56vEAbUbqG8D+a9IOAB1c6KP8MsNzguiETxXvVblmbN2
	V/0Zhy8H5+ZJe9mm7TFM2KNmCMEJexwnh27/giV5WW/txt9ZOjK7RH94Hr5FloLrz6S+PXFiJ88
	Ds0p+J0NFB4FJysM+/3jzFNjiyT7rA9EJ2lTo6aEZvtr
X-Google-Smtp-Source: AGHT+IH9+gy6Ia0VNNIYxSU2fLYpk13oP/Tm8jYmi+Mtb2LEUjTmajm/ISPd0dJ9fMuHW6e5GpVdviDj+Wzpgl4ZTjE=
X-Received: by 2002:a05:690e:4cf:b0:644:60d9:8674 with SMTP id
 956f58d0204a3-6466a8d74famr22435914d50.89.1767173807173; Wed, 31 Dec 2025
 01:36:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251229-k3-reset-v1-0-eda0747bded3@riscstar.com>
 <20251229-k3-reset-v1-3-eda0747bded3@riscstar.com> <20251230-dashing-black-skink-45e5a6@quoll>
In-Reply-To: <20251230-dashing-black-skink-45e5a6@quoll>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 31 Dec 2025 17:36:35 +0800
X-Gm-Features: AQt7F2pQEjLh6AvJYpaZgx8RA130bkC0nRocUhcFJ6RvAy_4of4qZC5SF6hClOo
Message-ID: <CAH1PCMYG6DEj-oq_S8GNddF0m=tt+h313i9HXjFi7DkeRc7DiA@mail.gmail.com>
Subject: Re: [PATCH 3/4] reset: spacemit: Extract common K1 reset code
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Tue, Dec 30, 2025 at 8:23=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Mon, Dec 29, 2025 at 07:04:06PM +0800, Guodong Xu wrote:
> > Extract the common reset controller code from the K1 driver into
> > separate reset-spacemit-common.{c,h} files. This prepares for
> > additional SpacemiT SoCs that share the same reset controller
> > architecture.
> >
> > The common code now includes handlers for reset assert
> > deassert operations and probing for auxiliary bus devices.
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> >  drivers/reset/spacemit/Kconfig                 |  17 +++-
> >  drivers/reset/spacemit/Makefile                |   2 +
> >  drivers/reset/spacemit/reset-spacemit-common.c |  79 +++++++++++++++++
> >  drivers/reset/spacemit/reset-spacemit-common.h |  53 ++++++++++++
> >  drivers/reset/spacemit/reset-spacemit-k1.c     | 113 +++--------------=
--------
> >  5 files changed, 158 insertions(+), 106 deletions(-)
> >
> > diff --git a/drivers/reset/spacemit/Kconfig b/drivers/reset/spacemit/Kc=
onfig
> > index 552884e8b72a..56a4858b30e1 100644
> > --- a/drivers/reset/spacemit/Kconfig
> > +++ b/drivers/reset/spacemit/Kconfig
> > @@ -1,10 +1,20 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >
> > -config RESET_SPACEMIT_K1
> > -     tristate "SpacemiT K1 reset driver"
> > +menu "Reset support for SpacemiT platforms"
> >       depends on ARCH_SPACEMIT || COMPILE_TEST
> > -     depends on SPACEMIT_K1_CCU
> > +
> > +config RESET_SPACEMIT_COMMON
> > +     tristate
> >       select AUXILIARY_BUS
> > +     help
> > +       Common reset controller infrastructure for SpacemiT SoCs.
> > +       This provides shared code and helper functions used by
> > +       reset drivers for various SpacemiT SoC families.
> > +
> > +config RESET_SPACEMIT_K1
> > +     tristate "Support for SpacemiT K1 SoC"
> > +     depends on SPACEMIT_K1_CCU
> > +     select RESET_SPACEMIT_COMMON
> >       default SPACEMIT_K1_CCU
> >       help
> >         Support for reset controller in SpacemiT K1 SoC.
> > @@ -12,3 +22,4 @@ config RESET_SPACEMIT_K1
> >         unit (CCU) driver to provide reset control functionality
> >         for various peripherals and subsystems in the SoC.
> >
> > +endmenu
> > diff --git a/drivers/reset/spacemit/Makefile b/drivers/reset/spacemit/M=
akefile
> > index de7e358c74fd..fecda9f211b2 100644
> > --- a/drivers/reset/spacemit/Makefile
> > +++ b/drivers/reset/spacemit/Makefile
> > @@ -1,3 +1,5 @@
> >  # SPDX-License-Identifier: GPL-2.0
> > +obj-$(CONFIG_RESET_SPACEMIT_COMMON)  +=3D reset-spacemit-common.o
> > +
> >  obj-$(CONFIG_RESET_SPACEMIT_K1)              +=3D reset-spacemit-k1.o
> >
> > diff --git a/drivers/reset/spacemit/reset-spacemit-common.c b/drivers/r=
eset/spacemit/reset-spacemit-common.c
> > new file mode 100644
> > index 000000000000..e4b3f0e2c59d
> > --- /dev/null
> > +++ b/drivers/reset/spacemit/reset-spacemit-common.c
> > @@ -0,0 +1,79 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +/* SpacemiT reset controller driver - common implementation */
> > +
> > +#include <linux/container_of.h>
> > +#include <linux/device.h>
> > +#include <linux/module.h>
> > +
> > +#include <soc/spacemit/ccu.h>
> > +
> > +#include "reset-spacemit-common.h"
> > +
> > +static int spacemit_reset_update(struct reset_controller_dev *rcdev,
> > +                              unsigned long id, bool assert)
> > +{
> > +     struct ccu_reset_controller *controller;
> > +     const struct ccu_reset_data *data;
> > +     u32 mask;
> > +     u32 val;
> > +
> > +     controller =3D container_of(rcdev, struct ccu_reset_controller, r=
cdev);
> > +     data =3D &controller->data->reset_data[id];
> > +     mask =3D data->assert_mask | data->deassert_mask;
> > +     val =3D assert ? data->assert_mask : data->deassert_mask;
> > +
> > +     return regmap_update_bits(controller->regmap, data->offset, mask,=
 val);
> > +}
> > +
> > +static int spacemit_reset_assert(struct reset_controller_dev *rcdev,
> > +                              unsigned long id)
> > +{
> > +     return spacemit_reset_update(rcdev, id, true);
> > +}
> > +
> > +static int spacemit_reset_deassert(struct reset_controller_dev *rcdev,
> > +                                unsigned long id)
> > +{
> > +     return spacemit_reset_update(rcdev, id, false);
> > +}
> > +
> > +const struct reset_control_ops spacemit_reset_control_ops =3D {
> > +     .assert         =3D spacemit_reset_assert,
> > +     .deassert       =3D spacemit_reset_deassert,
> > +};
> > +EXPORT_SYMBOL_GPL(spacemit_reset_control_ops);
> > +
> > +static int spacemit_reset_controller_register(struct device *dev,
> > +                                           struct ccu_reset_controller=
 *controller)
> > +{
> > +     struct reset_controller_dev *rcdev =3D &controller->rcdev;
> > +
> > +     rcdev->ops =3D &spacemit_reset_control_ops;
> > +     rcdev->owner =3D THIS_MODULE;
>
> So who is now the owner? This module or actual driver calling and using
> this?

You're absolutely right, good catch & thank you!

I'll fix it in the v2 version with:

 rcdev->owner =3D dev->driver->owner;

Best regards,
Guodong Xu

>
> This feels buggy, assuming this is a module and your
> MODULE_DESCRIPTION() clearly suggests that.
>
>
> Best regards,
> Krzysztof
>
