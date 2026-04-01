Received: from va-2-26.ptr.blmpb.com (va-2-26.ptr.blmpb.com [209.127.231.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D752E06EF
	for <spacemit@lists.linux.dev>; Wed,  1 Apr 2026 07:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775029119; cv=none; b=POhkziB4AdtAsCg5DTz+FpbIsZCtzxohdNt6Wbq2rDqBFTYY/OQbufabWXAUPri8M2aHhlDVcxjg10MQbGouNf52DR/IAyWTUjd2bZ+tQV9NA9yF7kjyLK3i/F009e/4QmIPD1yKyt1+M/DPKPsoB+H2vxOxWHXdgfqu+SbtZu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775029119; c=relaxed/simple;
	bh=LduvM7ftQhNZfq5zgzln7UtdiXlkxtvJIsUB2Xe8jqU=;
	h=Cc:Subject:From:Mime-Version:In-Reply-To:Date:Message-Id:To:
	 References:Content-Type; b=a/OnIiQXvezMBe+gofIs0dEzNxbyHPqN2wmb+GJUJrGoeXqb3TejQJhODCy/PHlzWuNMV2K+wPzHy/GUHi9WQ8j2OTtF1iUUKzanDlGoguf92hly5Z+/zwFLSp8uu9TtIXhbymbn6ju5YGaChtamzQph4mKOw7fXn36ZIWcUbDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=Sk5jYxa5; arc=none smtp.client-ip=209.127.231.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="Sk5jYxa5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1775029106;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=LduvM7ftQhNZfq5zgzln7UtdiXlkxtvJIsUB2Xe8jqU=;
 b=Sk5jYxa5h3Y8IXLRjuJm6yJTZzW5IM0g1Hm7yDFRFAxYAqlxuBd0bnsGaTQCRI0cyTMU8a
 zBTqEXuu5Oy/ZfBeu9T+8qWghcrblV5XRpAT82FQkk3+kf8cfKLnFmw65qQUULZu5CGscf
 HGGV556dgfKkTrVADsfj3Qbh59uBuZLNgzT/n6UAPJhhMxuT9uP33aoKjXuByRCjPt2Hxd
 lJaqxzgQW+LhAv9/houAvfGeIH77IWTip91EvoYwT6ZNwH9S4yaon0mm1DA3tVdXZ1dlwR
 9mTB7DGUyqbVC7xP9wrNGma1sMmqIWxL0Y9tAe4TQJ27Y/0zI/2sQ4VM+ivsbw==
Cc: "Yixun Lan" <dlan@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, 
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
Subject: Re: [PATCH v1 2/2] riscv: dts: spacemit: add DeepComputing FML13V05 board device tree
From: =?utf-8?q?=E6=9B=B9=E7=8F=8A=E7=8F=8A?= <sandie.cao@deepcomputing.io>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
In-Reply-To: <DHHM43F6TE9I.1F5A3O0VOS6ND@linux.spacemit.com>
Date: Wed, 01 Apr 2026 15:38:23 +0800
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.20e9d5ae.574e.4942.b529.0e22091ba551@feishu.cn>
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
X-Lms-Return-Path: <lba+169cccb71+1bbfb7+lists.linux.dev+sandie.cao@deepcomputing.io>
References: <20260331034423.67142-1-sandie.cao@deepcomputing.io> <20260331034616.67183-1-sandie.cao@deepcomputing.io> <20260331085925-GKB976850@kernel.org> <407ce3d77416bb2522b7906b0df3d5adf02c27ee.4c756029.b64e.488e.905e.99baaf78d6a1@feishu.cn>
	<DHHM43F6TE9I.1F5A3O0VOS6ND@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Troy,

> From: "Troy Mitchell"<troy.mitchell@linux.spacemit.com>
> Date:=C2=A0 Wed, Apr 1, 2026, 14:42

> On Wed Apr 1, 2026 at 2:10 PM CST, =E6=9B=B9=E7=8F=8A=E7=8F=8A wrote:
> > Hi Lan,
> >
> >> From: "Yixun Lan"<dlan@kernel.org>
> >> Hi Sandie,=C2=A0
> >>=C2=A0
> >> On 11:46 Tue 31 Mar =C2=A0 =C2=A0 , Sandie Cao wrote:
> >> > From: sandiecao <sandie.cao@deepcomputing.io>
> >> >=C2=A0
> >> > The FML13V05 board from DeepComputing incorporates a SpacemiT K3 RIS=
C-V
> >> > SoC.It is a mainboard designed for the Framework Laptop 13 Chassis,
> >> > which has (Framework) SKU FRANHQ0001.
> >> >=C2=A0
> >> > The FML13V05 board features:
> >> > - SpacemiT K3 RISC-V SoC
> >> > - LPDDR5 16GB or 32GB
> >> > - eMMC 32GB ~128GB (Optional)
> >> > - UFS 3.1 256G (Optional)
> >> > - QSPI Flash
> >> > - MicroSD Slot
> >> > - PCIe-based Wi-Fi
> >> > - 4 USB-C Ports
> >> > =C2=A0- Port 1: PD 3.0 (65W Max), USB 3.2 Gen 1
> >> > =C2=A0- Port 2: PD 3.0 (65W Max), USB 3.2 Gen 1, DP 1.4 (4K@60Hz)
> >> > =C2=A0- Port 3 & 4: USB 3.2 Gen 1
> >> >=C2=A0
> >> > This minimal device tree enables booting into a serial console with =
UART
> >> > output.
> >> >=C2=A0
> >> > Signed-off-by: sandiecao <sandie.cao@deepcomputing.io>
> >> > Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> >> > +&uart0 {
> >> Can you also add pinctrl data explicitly?
> >
> > To avoid conflict,=C2=A0 the common pinctrl table "k3-pinctrl.dtsi" sho=
uld be uploaded by spacemit.=C2=A0
> > Then we will add the pinctrl data after k3-pico-itx.dts. That should be=
 another patch.=C2=A0
> > Sandie
> I think you don't understand what Yixun said.
> You should add pinctrl properties here like:
> pinctrl-0 =3D xxx;
> pinctrl-names =3D "default";
>=C2=A0
> While the bootloader is expected to initialize the UART pins, explicitly =
adding the pinctrl properties
> ensures hardware state consistency.
>=C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Troy
>=C2=A0

Yes, I know this.
If I add=C2=A0
=C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0 pinctrl-names =3D "default";
=C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0 pinctrl-0 =3D <&uart0_0_cfg>;
Then also need to add
&pinctrl {
=C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0 uart0_0_cfg: uart0-0-cfg {
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 uart0-0-pins {
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=C2=A0 pinmux =3D <K3_PADCONF(149, 2)>, =C2=A0 =C2=A0 =C2=A0=C2=A0 /=
* uart0 tx */
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <K3_PADCONF(150, 2)>; =C2=A0 =C2=
=A0 =C2=A0=C2=A0 /* uart0 rx */

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=C2=A0 bias-pull-up; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 /* normal pull-up */
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=C2=A0 drive-strength =3D <25>; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=C2=A0 /* DS8 */
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 };
=C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0 };
};
But this part is common, it should be defined in common pinctrl table "k3-p=
inctrl.dtsi". And this part hasn't comed to Upstream.
If I add it currently,=C2=A0 When k3-pinctrl.dtsi is accepted by Upstream, =
we need to remove it again.
So we just empty it for simple.
Sandie
