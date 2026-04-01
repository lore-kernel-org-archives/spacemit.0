Received: from va-2-36.ptr.blmpb.com (va-2-36.ptr.blmpb.com [209.127.231.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AFA3B27C4
	for <spacemit@lists.linux.dev>; Wed,  1 Apr 2026 08:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775031931; cv=none; b=TQmhZ0rDucl1d5HKWs4ED7W+anmLlAhDpV6zU1LJdhBXx+LqbCT6HyP5NYCc2P6yQ/XuX6b4wVedKv1H8sbKyQDXS1SWszq9u8/fQSEmLABiIRFsVYuVY7I7Sg96Sbm2WPFStYIi9i6UNgZgx0B6z2+BLkbAveJ5OkPYTyvyqtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775031931; c=relaxed/simple;
	bh=tA6DsNKjq4P1IEPY7eb3gOlNiAuxuQ3EReYIBxNYIfY=;
	h=Date:Subject:Mime-Version:Content-Type:References:Message-Id:To:
	 Cc:From:In-Reply-To; b=Cg9YPSqqUOOQyuPnG/N2U7gNYatDpYYQk64FGQNFfr2G2twFrkoQQ1RvrKc9hLyCjCXTMMsTkqmT+rIoJ1OopmEuuP/xL51DWqWz4BcMLj3gMwuAFhgIWfh8zEuu3Xk8z9NgQSSbVV7o+di+JOgDkfPkikHZPOd8uWIQhVUM0gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=fkoP8igm; arc=none smtp.client-ip=209.127.231.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="fkoP8igm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1775031919;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=tA6DsNKjq4P1IEPY7eb3gOlNiAuxuQ3EReYIBxNYIfY=;
 b=fkoP8igm+XLXGqk1JREOiTRjBxp7Lyk/2WbQZgXzWsAzQ+Q20ZpzS6j8vQ+vOyF7L3JmrB
 LySgfIbzRWrG1KyK6UyG5wGNd056qNd8tghqT97lo37ClVRKE8xnvTZEsEgu8yaktR4Uxc
 zPCxuVBDwpjQBnFsRV4Rr4K3rTJGNKEatxhGXgVDZHLeFgfYK10+mFX+JhD2M5BZfPPTLF
 4aMeMo8cSjtMxOyw3HLoBrAzdq86pQe9mEhQs8wt+SzNgOArjtr5drNwHPefVz0hCWrYED
 TaWLz/wKsl/KQZEwphR6fFQSV1EAtX/f25Dj5rm4pEN8qyssGEVg8S4usCL/2Q==
Date: Wed, 01 Apr 2026 16:25:15 +0800
Subject: Re: [PATCH v1 2/2] riscv: dts: spacemit: add DeepComputing FML13V05 board device tree
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+169ccd66d+bd4ca0+lists.linux.dev+sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
References: <20260331034423.67142-1-sandie.cao@deepcomputing.io> <20260331034616.67183-1-sandie.cao@deepcomputing.io> <20260331085925-GKB976850@kernel.org> <407ce3d77416bb2522b7906b0df3d5adf02c27ee.4c756029.b64e.488e.905e.99baaf78d6a1@feishu.cn> <DHHM43F6TE9I.1F5A3O0VOS6ND@linux.spacemit.com> <407ce3d77416bb2522b7906b0df3d5adf02c27ee.20e9d5ae.574e.4942.b529.0e22091ba551@feishu.cn>
	<DHHNO3MKPLX6.10BU0B83KT0GV@linux.spacemit.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.f3ceeab2.be39.4d04.88c1.0f125b2e2f91@feishu.cn>
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Yixun Lan" <dlan@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, 
	"Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, 
	"Michael Opdenacker" <michael.opdenacker@rootcommit.com>, 
	"Guodong Xu" <guodong@riscstar.com>, 
	"Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, 
	"Yangyu Chen" <cyy@cyyself.name>, <spacemit@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
In-Reply-To: <DHHNO3MKPLX6.10BU0B83KT0GV@linux.spacemit.com>

Hi Troy,

> From: "Troy Mitchell"<troy.mitchell@linux.spacemit.com>
> Date:=C2=A0 Wed, Apr 1, 2026, 15:55

> On Wed Apr 1, 2026 at 3:38 PM CST, =E6=9B=B9=E7=8F=8A=E7=8F=8A wrote:
> > Hi Troy,
> >
> >> From: "Troy Mitchell"<troy.mitchell@linux.spacemit.com>
> >> Date:=C2=A0 Wed, Apr 1, 2026, 14:42
> >
> >> On Wed Apr 1, 2026 at 2:10 PM CST, =E6=9B=B9=E7=8F=8A=E7=8F=8A wrote:
> >> > Hi Lan,
> >> >
> >> >> From: "Yixun Lan"<dlan@kernel.org>
> >> >> Hi Sandie,=C2=A0
> >> >>=C2=A0
> >> >> On 11:46 Tue 31 Mar =C2=A0 =C2=A0 , Sandie Cao wrote:
> >> >> > From: sandiecao <sandie.cao@deepcomputing.io>
> >> >> >=C2=A0
> >> >> > The FML13V05 board from DeepComputing incorporates a SpacemiT K3 =
RISC-V
> >> >> > SoC.It is a mainboard designed for the Framework Laptop 13 Chassi=
s,
> >> >> > which has (Framework) SKU FRANHQ0001.
> >> >> >=C2=A0
> >> >> > The FML13V05 board features:
> >> >> > - SpacemiT K3 RISC-V SoC
> >> >> > - LPDDR5 16GB or 32GB
> >> >> > - eMMC 32GB ~128GB (Optional)
> >> >> > - UFS 3.1 256G (Optional)
> >> >> > - QSPI Flash
> >> >> > - MicroSD Slot
> >> >> > - PCIe-based Wi-Fi
> >> >> > - 4 USB-C Ports
> >> >> > =C2=A0- Port 1: PD 3.0 (65W Max), USB 3.2 Gen 1
> >> >> > =C2=A0- Port 2: PD 3.0 (65W Max), USB 3.2 Gen 1, DP 1.4 (4K@60Hz)
> >> >> > =C2=A0- Port 3 & 4: USB 3.2 Gen 1
> >> >> >=C2=A0
> >> >> > This minimal device tree enables booting into a serial console wi=
th UART
> >> >> > output.
> >> >> >=C2=A0
> >> >> > Signed-off-by: sandiecao <sandie.cao@deepcomputing.io>
> >> >> > Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.c=
om>
> >> >> > +&uart0 {
> >> >> Can you also add pinctrl data explicitly?
> >> >
> >> > To avoid conflict,=C2=A0 the common pinctrl table "k3-pinctrl.dtsi" =
should be uploaded by spacemit.=C2=A0
> >> > Then we will add the pinctrl data after k3-pico-itx.dts. That should=
 be another patch.=C2=A0
> >> > Sandie
> >> I think you don't understand what Yixun said.
> >> You should add pinctrl properties here like:
> >> pinctrl-0 =3D xxx;
> >> pinctrl-names =3D "default";
> >>=C2=A0
> >> While the bootloader is expected to initialize the UART pins, explicit=
ly adding the pinctrl properties
> >> ensures hardware state consistency.
> >>=C2=A0
> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Troy
> >>=C2=A0
> >
> > Yes, I know this.
> > If I add=C2=A0
> > =C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0 pinctrl-names =3D "default";
> > =C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0 pinctrl-0 =3D <&uart0_0_cfg>;
> > Then also need to add
> > &pinctrl {
> > =C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0 uart0_0_cfg: uart0-0-cfg {
> > =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 uart0-0-pi=
ns {
> > =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=C2=A0 pinmux =3D <K3_PADCONF(149, 2)>, =C2=A0 =C2=A0 =C2=A0=
=C2=A0 /* uart0 tx */
> > =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <K3_PADCONF(150, 2)>; =C2=
=A0 =C2=A0 =C2=A0=C2=A0 /* uart0 rx */
> >
> > =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=C2=A0 bias-pull-up; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 /* normal pull-up */
> > =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=C2=A0 drive-strength =3D <25>; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=C2=A0 /* DS8 */
> > =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 };
> > =C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0 };
> > };
> > But this part is common, it should be defined in common pinctrl table "=
k3-pinctrl.dtsi". And this part hasn't comed to Upstream.
> This line exceeds 100 characters
>=C2=A0
> > If I add it currently,=C2=A0 When k3-pinctrl.dtsi is accepted by Upstre=
am, we need to remove it again.
> > So we just empty it for simple.
> No, It looks like your base commit is wrong.
> It has been merged here [1] that what you said.
>=C2=A0

Got it. I will use https://github.com/spacemit-com/linux/tree/k1/dt-for-nex=
t=C2=A0 to rebase my patch.


> By the way, I noticed that the name in your 'From' header for this reply =
doesn't match the one in
> your patch submission. It would be better to keep them consistent to avoi=
d any confusion for the
> maintainers/reviewers regarding the authorship of the response.
>=C2=A0

Already fixed it.
Thanks a lot.
Sandie


> Link:
> https://lore.kernel.org/all/177340832523.17050.323606076175943251.b4-ty@k=
ernel.org/ [1]
>=C2=A0
>=C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Troy
>=C2=A0

