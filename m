Received: from va-2-28.ptr.blmpb.com (va-2-28.ptr.blmpb.com [209.127.231.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413582D73AD
	for <spacemit@lists.linux.dev>; Wed,  1 Apr 2026 06:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775023822; cv=none; b=aOn+XY+7050dZ25mjTdNVmSYWOGY8tJTI4xR6mlqjgZKMz3FAcHueUBcMoYA+4JBaDcj16WkTh3bX4qWCQgO0hcDmfkSVHaHP2S7o3Gfvsw6gu1rEohgG0vryYy70bnh7G+eVYPC83ex9fmUfSTTMvdW7seYq86C0LdtddM+QzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775023822; c=relaxed/simple;
	bh=VbUQOvKGwR1R52hKJcfo6NqJZg0YjUDtMeBwt+ohpDo=;
	h=References:Content-Type:Date:Subject:From:Mime-Version:
	 In-Reply-To:Message-Id:To:Cc; b=qccg4fOIascN1URBKPDBLGslQXxyCycf42SrXyKiJGFp4u4cd6P877UiOOtuQr2zDD/hzlCow7nA+/tiVKJum/AQee70h2D867Wp+U9SEs1mPLH1MVtNEVxrKJNpOyVSwJr0+AEws8SJk93lOcynfD/q4unczeAYFYOnRdpOm/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=V+N6vJC/; arc=none smtp.client-ip=209.127.231.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="V+N6vJC/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1775023809;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=VbUQOvKGwR1R52hKJcfo6NqJZg0YjUDtMeBwt+ohpDo=;
 b=V+N6vJC/4N4BRZjaJ+N4wQpB8Kq5KF8p47PPMeiuVWty0/P2L4A4HY8I1oH4rWuHCJC/Fi
 /JX2GRORsDCtiSBhzGuFn73skj8B7EFeY3lRFi65XA5F/pfSgKwNA02otH2C7Et9d1zU9f
 kxIis6FmInDklD1mbtOzF+41G8XVa+Ykr/hqG7GRIaPsM0ynFQ8cGADVIHLxUfjHgZO8oI
 YOsJxUwTH0nWPP48l+J5ubtrF0RUzWbhK0BQBk0XnRoGiyzomdT4N+MxaiHtOTHqzB1Hrp
 8k5M5OCFN40bFUZOCnFakj6Abxnm22/sFhSAYeepfnm0gP46IRiwDwq7Er9yTA==
References: <20260331034423.67142-1-sandie.cao@deepcomputing.io> <20260331034616.67183-1-sandie.cao@deepcomputing.io>
	<20260331085925-GKB976850@kernel.org>
X-Lms-Return-Path: <lba+169ccb6bf+7cec02+lists.linux.dev+sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 14:10:06 +0800
Subject: Re: [PATCH v1 2/2] riscv: dts: spacemit: add DeepComputing FML13V05 board device tree
From: =?utf-8?q?=E6=9B=B9=E7=8F=8A=E7=8F=8A?= <sandie.cao@deepcomputing.io>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
In-Reply-To: <20260331085925-GKB976850@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.4c756029.b64e.488e.905e.99baaf78d6a1@feishu.cn>
To: "Yixun Lan" <dlan@kernel.org>
Cc: "Conor Dooley" <conor+dt@kernel.org>, 
	"Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Michael Opdenacker" <michael.opdenacker@rootcommit.com>, 
	"Guodong Xu" <guodong@riscstar.com>, 
	"Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, 
	"Yangyu Chen" <cyy@cyyself.name>, <spacemit@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>

Hi Lan,

> From: "Yixun Lan"<dlan@kernel.org>
> Hi Sandie,=C2=A0
>=C2=A0
> On 11:46 Tue 31 Mar =C2=A0 =C2=A0 , Sandie Cao wrote:
> > From: sandiecao <sandie.cao@deepcomputing.io>
> >=C2=A0
> > The FML13V05 board from DeepComputing incorporates a SpacemiT K3 RISC-V
> > SoC.It is a mainboard designed for the Framework Laptop 13 Chassis,
> > which has (Framework) SKU FRANHQ0001.
> >=C2=A0
> > The FML13V05 board features:
> > - SpacemiT K3 RISC-V SoC
> > - LPDDR5 16GB or 32GB
> > - eMMC 32GB ~128GB (Optional)
> > - UFS 3.1 256G (Optional)
> > - QSPI Flash
> > - MicroSD Slot
> > - PCIe-based Wi-Fi
> > - 4 USB-C Ports
> > =C2=A0- Port 1: PD 3.0 (65W Max), USB 3.2 Gen 1
> > =C2=A0- Port 2: PD 3.0 (65W Max), USB 3.2 Gen 1, DP 1.4 (4K@60Hz)
> > =C2=A0- Port 3 & 4: USB 3.2 Gen 1
> >=C2=A0
> > This minimal device tree enables booting into a serial console with UAR=
T
> > output.
> >=C2=A0
> > Signed-off-by: sandiecao <sandie.cao@deepcomputing.io>
> > Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> should put your own signed-off at the end.
>=C2=A0
> > ---
> > =C2=A0arch/riscv/boot/dts/spacemit/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | =C2=A01 +
> > =C2=A0.../spacemit/k3-deepcomputing-fml13v05.dts =C2=A0 =C2=A0| 28 ++++=
+++++++++++++++
> > =C2=A02 files changed, 29 insertions(+)
> > =C2=A0create mode 100644 arch/riscv/boot/dts/spacemit/k3-deepcomputing-=
fml13v05.dts
> >=C2=A0
> > diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dt=
s/spacemit/Makefile
> > index 7e2b87702571..acb993c452ba 100644
> > --- a/arch/riscv/boot/dts/spacemit/Makefile
> > +++ b/arch/riscv/boot/dts/spacemit/Makefile
> > @@ -4,4 +4,5 @@ dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k1-milkv-jupiter.dtb
> > =C2=A0dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k1-musepi-pro.dtb
> > =C2=A0dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k1-orangepi-r2s.dtb
> > =C2=A0dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k1-orangepi-rv2.dtb
> > +dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k3-deepcomputing-fml13v05.dtb
> > =C2=A0dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k3-pico-itx.dtb
> > diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts=
 b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> > new file mode 100644
> > index 000000000000..2343ae3acc2d
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> > @@ -0,0 +1,28 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2024 DeepComputing (HK) Limited
> should cover current year, which is 2026 now..
>=C2=A0
> > + */
> > +
> > +#include "k3.dtsi"
> > +
> > +/ {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0model =3D "DeepComputing FML13V05";
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D "deepcomputing,fml13v05", "=
spacemit,k3";
> > +
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0aliases {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0serial0 =3D &u=
art0;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0};
> > +
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0chosen {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stdout-path =
=3D "serial0";
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0};
> > +
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0memory@100000000 {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0device_type =
=3D "memory";
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D <0x1 0=
x00000000 0x4 0x00000000>;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0};
> > +};
> > +
> > +&uart0 {
> Can you also add pinctrl data explicitly?

To avoid conflict,=C2=A0 the common pinctrl table "k3-pinctrl.dtsi" should =
be uploaded by spacemit.=C2=A0
Then we will add the pinctrl data after k3-pico-itx.dts. That should be ano=
ther patch.=C2=A0
Sandie

>=C2=A0
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D "okay";
> > +};
> > --=C2=A0
> > 2.43.0
>=C2=A0
> --=C2=A0
> Yixun Lan (dlan)
>=C2=A0
