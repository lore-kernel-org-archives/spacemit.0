Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794811783;
	b=qv2es8b+e9IPsW1PPZ2OaYRN/ZvKpr87gn51AWjCtcxKQ0UH2Zt5uf/1yrvT8PqqiZcv
	 CReokWawHvajiwIds6ZS4A2CovHx84Ulr/rRrdZWJBPtOfS/FFwnPOsoZQyQ8XYRuORH0
	 Q1jhmxeYMp+4nxaNpTyNChAgDFbyXRzBleQFRPbGWlan4P75QM/2vk9KIW2VPDilMYNq1
	 6O6/h7iYjAOxnAzcxhyVqVKwJkXbvqNgdnIOogsxRAb5omFEjppzIw8pC9zmAkY3PLIMd
	 EzqUVrly3mUvTWv2leZ62gPUukHoGoBvXe9ZBYByrTgXztsC0lPTNKBYi9wyQEBZuLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794811783;
	h=DMARC-Filter:DKIM-Signature:Date:Message-Id:Subject:From:
	 Mime-Version:References:X-Lms-Return-Path:In-Reply-To:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=+t8ZxELPYTH2d5u1GirmDH7jb3H83Y/CovQh+JvDD1k=;
	b=wRkwB/tU5OF53OTboyhyAi0ms/BHprc6yG8+Q0JK0yAOGI98nFDDYElGiBYCygvRFl2n
	 25rMo6e7UsKnaMALYJhAl/7ECAh3isnE+ZfJBmz3kph7xcfpmoxOYpjOPHUEt/coxuzQO
	 QAk0klqkqZtzuJyTps5NjtX9McnPfoeokYJ41eM6UHWDCJQENmGDGrnWuGvcRnBeHYflE
	 ctqWo/is7jCHljVZWL9Pdwmh5c7M1q1gNxfRQwyDHwihEQ2HYr0oCvEW2ZQ9/nBrpXKGY
	 8DOWQGvBJ5+G09j5sUwSYz1y7iME1UA3xqWNaLsrfRYnQSaSEStrgBBCxGjpsAuB2FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=oX2P7plc;
	arc=none smtp.remote-ip=209.127.231.30
Received: from va-2-30.ptr.blmpb.com (va-2-30.ptr.blmpb.com [209.127.231.30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BECD606A31C
	for <spacemit@lists.linux.dev>; Mon, 16 Nov 2026 06:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BECD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=oX2P7plc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794811777;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=+t8ZxELPYTH2d5u1GirmDH7jb3H83Y/CovQh+JvDD1k=;
 b=oX2P7plcXodZNslbMgvxRoEyJCTfwNtwRtlGEJqET49GZFE+Z9wquBJ+/BUp2n38Q3dA2z
 Btnb5XtrWUL2buosdGtxjOlR/mj+7gJBUupXuFMqlGhe0hQQKsZUrDl7tpP0GYpZmkZalV
 QxX6OteiWPli/OFVj+H0PXru9HkXP9bsbb3FuAae9RA1DarlV1+oBWJt/1gpDANI41K/Xv
 BBEr8rhOaZS1ctTd7Sv7s6vL615GhmQg2k0O69FdLHNlTlyv9QKdixC54Ha5HkW7Ee/DRb
 1qc7WBrh7IG7ZKXsWHNkxl7HJCzHgYqiaobpxXOBR+LT+CCaNtPSvdADsLNV/w==
Date: Mon, 16 Nov 2026 14:49:33 +0800
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.efc7f10c.ccd0.4025.9bef.e587b1e9e4e8@feishu.cn>
Subject: Re: [PATCH v4 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card support
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io> <20261109033348.361452-1-sandie.cao@deepcomputing.io>
	<20261114075506-GKB100523@kernel.org>
X-Lms-Return-Path: <lba+16afaa77f+a14ddf+lists.linux.dev+sandie.cao@deepcomputing.io>
In-Reply-To: <20261114075506-GKB100523@kernel.org>
To: "Yixun Lan" <dlan@kernel.org>
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"devicetree" <devicetree@vger.kernel.org>, 
	"linux-riscv" <linux-riscv@lists.infradead.org>, 
	"spacemit" <spacemit@lists.linux.dev>, 
	"linux-kernel" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi, Yixun:

> From: "Yixun Lan"<dlan@kernel.org>
> Date:=C2=A0 Sat, Nov 14, 2026, 15:55

> Hi Sandie,
>=C2=A0
> On 11:33 Mon 09 Nov =C2=A0 =C2=A0 , Sandie Cao wrote:
> > Add the device tree node SDHCI-0 controller for onboard Micro SD card s=
lot.
> >=C2=A0
> > Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> > ---
> > =C2=A0.../spacemit/k3-deepcomputing-fml13v05.dts =C2=A0 =C2=A0| 22 ++++=
+++++++++++++++
> > =C2=A01 file changed, 22 insertions(+)
> >=C2=A0
> > diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts=
 b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> > index bcd533484a73..051046fe90b2 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> > @@ -177,6 +177,28 @@ &combophy {
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D "okay";
> > =C2=A0};
> > =C2=A0
> ..
> > +/*
> > + * Onboard SD card slot:
> > + * Please insert or remove the SD card while the device is powered off=
.
> > + * It works as a boot media. so set it to non-removable.
> > + */
> Is there any public schematic available for FML13V05? I guess there is
> no CD pin (Card Detect pin)? as no "cd-gpios" property seen here
>=C2=A0
> The above comment isn't really useful or even correct, I'd suggest
> drop it.

In version 1 [1],=C2=A0 the patch is cd-gpios =3D <&gpio K3_GPIO(88) GPIO_A=
CTIVE_LOW>;
but K3_GPIO(88) is fake cd-gpio, it's tied low on board.
So In version2 [2], the patch changes to non-removable.
And In version3 [3], add comment.=C2=A0

The options: cd-gpio, non-removable, broken-cd=C2=A0 all work on this board=
.

We just need to detect the SD card when bootup, don't need the driver=C2=A0
to detect hot-plug event , non-removable should be suitable and faster,=C2=
=A0
we recomment to use non-removable.


[1]: https://lore.kernel.org/all/20260922110231.3426011-1-sandie.cao
@deepcomputing.io/
[2]: https://lore.kernel.org/all/20261020081633.3673704-1-sandie.cao
@deepcomputing.io/
[3]: https://lore.kernel.org/all/20261102060012.100623-1-sandie.cao
@deepcomputing.io/

Best regards
Sandie

>=C2=A0
> > +&sdhci0 {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D "default","uhs";
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D <&mmc1_cfg>;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-1 =3D <&mmc1_uhs_cfg>;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0bus-width =3D <4>;
> ..
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0non-removable;
> "no-removable" property usually used for emmc chip soldered on board,
> =C2=A0so there is no way it can be physically removed.. check=C2=A0
> Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>=C2=A0
> For cases that no CD pin (or no GPIO CD pin) designed for SD card from
> hardware schematic perspective, using "broken-cd" is a more proper way,
> it will fallback to use poll mechanism to detect the card, please check
>=C2=A0
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0no-mmc;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0no-sdio;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0disable-wp;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0cap-sd-highspeed;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0vqmmc-supply =3D <&aldo1>;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0sd-uhs-sdr25;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0sd-uhs-sdr50;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0sd-uhs-sdr104;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D "okay";
> > +};
> > +
> > =C2=A0&uart0 {
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D "default";
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D <&uart0_0_cfg>;
> > --=C2=A0
> > 2.43.0
>=C2=A0
> --=C2=A0
> Yixun Lan (dlan)
>=C2=A0
