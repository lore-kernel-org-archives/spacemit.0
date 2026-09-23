Received: from va-2-26.ptr.blmpb.com (va-2-26.ptr.blmpb.com [209.127.231.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB560443C11
	for <spacemit@lists.linux.dev>; Wed, 23 Sep 2026 06:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790145346; cv=none; b=gL3N7EhpWfQG/iwvjJ7U2HcOMs+ICvXHkawafDbw9wFg+OqQ5l7YL6kV3omXmrUwi1Q+D1pjw0wSp9Z8Q4WSpxx+kQ5+RHqEEb3O5R5XUHwhWsFU1ZKwN8uCkiyMoFsLNL1p+KlQPZVPWwCMWdW1oBHj1iH/kDxM22nocbFjlvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790145346; c=relaxed/simple;
	bh=ztHEw/1Esw+HMkU5DeZIN4w0wpwjtVn/TgDeHPNre28=;
	h=Subject:In-Reply-To:Content-Type:Message-Id:Cc:From:Mime-Version:
	 References:Date:To; b=XmmVF4yw3e2KwQ+Lgh4GGPz9FX9zOWxxE6eYh9W+UnARrW05t7rza3RA4oRHRCT5y2+f26fcHrCf2BIK9345yK+m4zhRi3fHs9RSaWclJVAzR43PKn3UuNCYu5pzDGcCfg6PHGGutVFjYJppGKnVwqucFrohH/zApsPVJhos0hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=oEth2X2g; arc=none smtp.client-ip=209.127.231.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="oEth2X2g"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1790145323;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=ztHEw/1Esw+HMkU5DeZIN4w0wpwjtVn/TgDeHPNre28=;
 b=oEth2X2gsToIXLxZmPhc3+7xCC1hHHyNXzU5Sp/Zc2HsvlSl8I1ncrwhgcr2yAnSZFd8Fq
 Pe87rUXTN2xrN0LaO2jS01CoHgo0xBNm1FsTecMEf1Ck1c6pdUXb+V0Adk1aXYzbtNQQOZ
 Wq+xC14y5C0aXX5cNY80ePgxTtmNr1RQRMdDSNg8LhRWuvlN9mniOQngSe/EEOduUJvRof
 Lu05Fn3J5hWhi+AyJnyqiqt2lcP+n8VCSNxrpvBqXq9c7Z73FSBeGylBo3ilT6zMImGkgu
 DDdZWyKcv1H1wzEY2NwxK8O6MJXobjU4V8ZANvhdppyhImZwWP3gdrvlqwSDGA==
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card support
In-Reply-To: <DLMC741RLFU5.3FF1DL7YEIFK9@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.2bcc8e57.b8bf.421b.9230.3eea00252952@feishu.cn>
Cc: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+16ab37329+cb9d75+lists.linux.dev+sandie.cao@deepcomputing.io>
References: <20260922110231.3426011-1-sandie.cao@deepcomputing.io> <20260922110450.3426070-1-sandie.cao@deepcomputing.io>
	<DLMC741RLFU5.3FF1DL7YEIFK9@linux.spacemit.com>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 14:35:20 +0800
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>

Hi, Troy:

> From: "Troy Mitchell"<troy.mitchell@linux.spacemit.com>
> Date:=C2=A0 Wed, Sep 23, 2026, 10:23
> On Tue, Sep 22, 2026 at 07:04:50PM +0800, Sandie Cao wrote:
> > @@ -184,6 +185,24 @@ &combophy {
> > [...]
> > +&sdhci0 {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D "default","uhs";
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D <&mmc1_cfg>;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-1 =3D <&mmc1_uhs_cfg>;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0bus-width =3D <4>;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0cd-gpios =3D <&gpio K3_GPIO(88) GPIO_ACTIV=
E_LOW>;
>=C2=A0
> Does GPIO88 have an external pull-up? The SDK DTS [1] also includes
> mmc1_cd_cfg in both pinctrl states, with a pull-up and 3.3 V configuratio=
n.
> Neither mmc1_cfg nor mmc1_uhs_cfg covers this pin. Is that configuration
> unnecessary on this board?
>=C2=A0

FML13V05 SD card slot is inside the board, it doesn't need cd-gpio, FML13V0=
5 Keeps GPIO88 to low, Then SD card is always on for SD Card driver.

We check the vmmc-supply is p3v3.=C2=A0We have the same SDK DTS config with=
 k3_com260[1] , so, this patch follows the SD card patch of k3_com260 dts[2=
].
=C2=A0
If this is not correct, we will change it.

Link: https://github.com/spacemit-com/linux-6.18/blob/k3-br-v1.0.y/arch/ris=
cv/boot/dts/spacemit/k3_com260.dtsi [1]
https://lore.kernel.org/all/20260610-07-k3-enable-sd-v1-1-196ae29bd091@kern=
el.org/ [2]

Best regards
Sandie

> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0no-mmc;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0no-sdio;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0disable-wp;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0cap-sd-highspeed;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0vmmc-supply =3D <&aldo4>;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0vqmmc-supply =3D <&aldo1>;
>=C2=A0
> Could you confirm which rail supplies the card's VDD? The SDK DTS [1]
> uses p3v3 for vmmc rather than aldo4. Does that RPMI regulator map to
> ALDO4, or is the card powered by a different rail?
>=C2=A0
> Link: https://github.com/spacemit-com/linux-6.18/blob/k3-br-v1.0.y/arch/r=
iscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts [1]
>=C2=A0
> --=C2=A0
> Troy Mitchell
>=C2=A0
