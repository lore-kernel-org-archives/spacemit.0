Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45DC365A0F
	for <spacemit@lists.linux.dev>; Fri, 29 May 2026 02:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780022354; cv=pass; b=jzkNt5T4J59XWpedfE6jREtYov4n/+2pto7a76+gaTwlr45j3sfMGNEFSAsl9kEXxErFc/+M4cEl+bT8esNn4XCHLrGDZUVvAmzzceUQry9XGLHdo7ajJn5GW1tBq/w+MzzGMjl5PqibQVYA9raHDjPg2R0ztbOrXlvIIpBLhng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780022354; c=relaxed/simple;
	bh=4PtmttoZr8WJpvllaEMPuPSJz428WZOOIgMHmS13jwU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=f7IdqKPn5i41nTNNIxpC11EMheoZL37ja/BLwc/LC/tUjg+nn4fFz8E1VURLwklVOVWA+X1dZeq27Nwqj4sIYmHHK+WmzDQ6MLszLMiDATHg3vlhXa9H11zRao08Q4N/sm2MBeFmK/gOGFwVcrIumf2iMVJQkXk/XtxEnzi632Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=DVbRBlpp; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="DVbRBlpp"
ARC-Seal: i=1; a=rsa-sha256; t=1780022337; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=giyP3l0BARjwV15MaD3ByOc48OVlaO+H1pfwiKo+JWthAO63lPjWa2i0cqtCk7asgsIqz78LyEEWF2uyfT3ZKDsogU/Sss4FLGjSLuG+OwPrsJcTIPDQSD673NuqmRgAaj0rJjje8lukR+rPKjf8CKP/Plk/7jpKoVC+PRt/LC0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780022337; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1l7GHRNeIy9vc/Rt447hMzgbRk0U1YWWPSN6x53wVYA=; 
	b=WhMFoT8Ck6GLWtfOmPuGyPzj1AGvnyeWsapa+5wdZcs5IieyBUmM9nuqysEYfU3p3g7NxPALKCt3oANib2TWTTFVq1JKsISZv2DCGPCncvWPFJI7B1/ztPzgBm5wzlbsmXX/B5NQ+Pcsh+lmOvvM33YFWQUy2+VFEqHz5tUIN58=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780022337;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:Subject:Subject:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=1l7GHRNeIy9vc/Rt447hMzgbRk0U1YWWPSN6x53wVYA=;
	b=DVbRBlppbQg5/6AEZ+mozmpZRFQAego/NoV9P7RWYIyInmHed9UDsvXnpbhBQ2sL
	v+gALEluOCS5cYtmZrRDQHPAgN2xLInOAXmDWhVIU6XEw56sVWKPellABudZ4ebFXDl
	knoeQpq3693RNWsmq3/E9jMUokGSL0GDmPof8fbM=
Received: by mx.zohomail.com with SMTPS id 178002233430168.40681398454296;
	Thu, 28 May 2026 19:38:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 May 2026 10:38:38 +0800
Message-Id: <DIUT907819JD.MG7B60VQLZ8L@pigmoral.tech>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Vivian Wang" <wangruikang@iscas.ac.cn>, "Paolo Abeni"
 <pabeni@redhat.com>, "Guodong Xu" <guodong@riscstar.com>, "Yangyu Chen"
 <cyy@cyyself.name>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] riscv: dts: spacemit: k1: Split gmac_clk_ref
 into independent pinctrl groups
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Conor Dooley" <conor@kernel.org>, "Junhui Liu"
 <junhui.liu@pigmoral.tech>
X-Mailer: aerc 0.21.0
References: <20260528-bpi-cm6-v2-0-d0eb3f236cea@pigmoral.tech>
 <20260528-bpi-cm6-v2-2-d0eb3f236cea@pigmoral.tech>
 <20260528-mushily-suffrage-5162d4ffdaf2@spud>
In-Reply-To: <20260528-mushily-suffrage-5162d4ffdaf2@spud>
X-ZohoMailClient: External

Hi Conor,

On Fri May 29, 2026 at 1:13 AM CST, Conor Dooley wrote:
> On Thu, May 28, 2026 at 01:22:48PM +0800, Junhui Liu wrote:
>> The gmac_clk_ref signal is optional for the GMAC controller and is not
>> strictly required for all hardware designs. The pins for gmac0_clk_ref
>> (GPIO 45) and gmac1_clk_ref (GPIO 46) may also be used as GPIOs for
>> other functions even when the Ethernet controller is active.
>>=20
>> Split the refclk pins into independent pinctrl groups so boards can
>> request them only when the reference clock path is actually needed.
>>=20
>> Among the already mainlined boards, BPI-F3, Jupiter and MusePi Pro have
>> optional hardware paths for the GMAC refclk pins. BPI-F3 and Jupiter
>> route both GMAC refclk pins to the PHYs through NC/0R option resistors,
>> while MusePi Pro only does so for GMAC0. Keep referencing the new
>> clk-ref pinctrl groups on these boards so the optional hardware paths
>> remain usable if the option resistors are populated.
>>=20
>> OrangePi R2S has no publicly available schematic, so also keep the
>> clk-ref groups there to preserve the previous pinmux behavior.
>>=20
>> Fixes: 60775f28cfb7 ("riscv: dts: spacemit: Add Ethernet support for K1"=
)
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>
>> diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/b=
oot/dts/spacemit/k1-pinctrl.dtsi
>> index 4e9a62d0e85b..8c57ca05dabd 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> @@ -27,8 +27,16 @@ gmac0-pins {
>>  				 <K1_PADCONF(11, 1)>,	/* gmac0_tx_en */
>>  				 <K1_PADCONF(12, 1)>,	/* gmac0_mdc */
>>  				 <K1_PADCONF(13, 1)>,	/* gmac0_mdio */
>> -				 <K1_PADCONF(14, 1)>,	/* gmac0_int_n */
>> -				 <K1_PADCONF(45, 1)>;	/* gmac0_clk_ref */
>
> The point sashiko made here seems valid, odd that these aren't added to
> another group.

Do you mean Sashiko's point about not adding these groups to the
OrangePi RV2 board? That is because GPIO45 and GPIO46 are used as
TP_RST_1V8 and TP_INT_1V8 respectively on the OrangePi RV2. These are
the reset and interrupt signals for the touch panel, and are not
connected to the optional GMAC PHY refclk path. So with this patch,
GPIO45/46 can be properly used by the touch panel without pinmux
conflicts once display/tp support is added in the future.

I have added the new gmac_clk_ref groups to all boards where I found
these signals may actually be used.

Best regards,
Junhui Liu

>
>> +				 <K1_PADCONF(14, 1)>;	/* gmac0_int_n */
>> +
>> +			bias-pull-up =3D <0>;
>> +			drive-strength =3D <21>;
>> +		};
>> +	};
>> +
>> +	gmac0_clk_ref_cfg: gmac0-clk-ref-cfg {
>> +		gmac0-clk-ref-pins {
>> +			pinmux =3D <K1_PADCONF(45, 1)>;	/* gmac0_clk_ref */
>> =20
>>  			bias-pull-up =3D <0>;
>>  			drive-strength =3D <21>;
>> @@ -51,8 +59,16 @@ gmac1-pins {
>>  				 <K1_PADCONF(40, 1)>,	/* gmac1_tx_en */
>>  				 <K1_PADCONF(41, 1)>,	/* gmac1_mdc */
>>  				 <K1_PADCONF(42, 1)>,	/* gmac1_mdio */
>> -				 <K1_PADCONF(43, 1)>,	/* gmac1_int_n */
>> -				 <K1_PADCONF(46, 1)>;	/* gmac1_clk_ref */
>> +				 <K1_PADCONF(43, 1)>;	/* gmac1_int_n */
>> +
>> +			bias-pull-up =3D <0>;
>> +			drive-strength =3D <21>;
>> +		};
>> +	};
>> +
>> +	gmac1_clk_ref_cfg: gmac1-clk-ref-cfg {
>> +		gmac1-clk-ref-pins {
>> +			pinmux =3D <K1_PADCONF(46, 1)>;	/* gmac1_clk_ref */
>> =20
>>  			bias-pull-up =3D <0>;
>>  			drive-strength =3D <21>;
>>=20
>> --=20
>> 2.54.0
>>=20

