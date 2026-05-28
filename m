Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3948F19CD0A;
	Thu, 28 May 2026 17:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779988401; cv=none; b=Zh6eH/yVjSIcjOwgcVAO/eqUYEie2Tn6JTvQG9Sfc5u3eNRlByyo0GdGJwuqrvFuJYnWS5qQ2/0ynVBDC1t3zeSoJyg3t4XLnDBL8Y03vZDEY59rsdDq5j1usN18l6K9rowGMibE13X/HmmQmDdNKBH8ibsPoDei4ygqE0J+rS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779988401; c=relaxed/simple;
	bh=JFPo/lJS7WGgejVGo43zPUriEvsRZR1XHMcyK9q+sCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmN4WeCMIFL2RlHTEsVJRA0EWJfBwZs5r+JlO0AH59HuOZgql6o5+HNm4HEOY/Vl+09TRLgx56UwRiDwHtQhPKGpPKx1yNHLAW5p2oj0AGcMhT6U4sgrgHp4aEEiJLNmG98XPvUoHxOWPgM4DwItAX49A3pCXBT4xoSs9015G44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XT2xQqiM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XT2xQqiM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFD941F000E9;
	Thu, 28 May 2026 17:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779988399;
	bh=DmoXDah3jQ5Ng6Yl64alLuZTaHi/bH6kVvRmL4WSci4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XT2xQqiM794hRpZH3R37eidRSs2hUFcz2AGrGhnknWAeNsuKxBKl6TnwI4suQ3Gyn
	 qQi1sKK8lATJ0FkPkZxxyeneVNzzVf1/NPCk0K+wjrUyzG9U3p37UgQc0qNhn/eB6S
	 DmdnmrRUV1wNPSRssdqG7PRoIl6rOtaRwy8KhxJqEyI2JHYULk60Uj/y93hLndKSol
	 KSnGNCjibIMSaYo4gY547F5+b54lszhondeuuEqo52sOzD3sDVByUtBocHd05oTzkd
	 sKyXRivPy4CR3qXYBqYNFqwW1trgMyzrET2dXFDm2tqKR7TCOEKnzmdW/+RObzSggZ
	 Z23FXmVkKAR8Q==
Date: Thu, 28 May 2026 18:13:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Vivian Wang <wangruikang@iscas.ac.cn>,
	Paolo Abeni <pabeni@redhat.com>, Guodong Xu <guodong@riscstar.com>,
	Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] riscv: dts: spacemit: k1: Split gmac_clk_ref into
 independent pinctrl groups
Message-ID: <20260528-mushily-suffrage-5162d4ffdaf2@spud>
References: <20260528-bpi-cm6-v2-0-d0eb3f236cea@pigmoral.tech>
 <20260528-bpi-cm6-v2-2-d0eb3f236cea@pigmoral.tech>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yHMIcsRoTx1oZIkR"
Content-Disposition: inline
In-Reply-To: <20260528-bpi-cm6-v2-2-d0eb3f236cea@pigmoral.tech>


--yHMIcsRoTx1oZIkR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 01:22:48PM +0800, Junhui Liu wrote:
> The gmac_clk_ref signal is optional for the GMAC controller and is not
> strictly required for all hardware designs. The pins for gmac0_clk_ref
> (GPIO 45) and gmac1_clk_ref (GPIO 46) may also be used as GPIOs for
> other functions even when the Ethernet controller is active.
>=20
> Split the refclk pins into independent pinctrl groups so boards can
> request them only when the reference clock path is actually needed.
>=20
> Among the already mainlined boards, BPI-F3, Jupiter and MusePi Pro have
> optional hardware paths for the GMAC refclk pins. BPI-F3 and Jupiter
> route both GMAC refclk pins to the PHYs through NC/0R option resistors,
> while MusePi Pro only does so for GMAC0. Keep referencing the new
> clk-ref pinctrl groups on these boards so the optional hardware paths
> remain usable if the option resistors are populated.
>=20
> OrangePi R2S has no publicly available schematic, so also keep the
> clk-ref groups there to preserve the previous pinmux behavior.
>=20
> Fixes: 60775f28cfb7 ("riscv: dts: spacemit: Add Ethernet support for K1")
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>

> diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/bo=
ot/dts/spacemit/k1-pinctrl.dtsi
> index 4e9a62d0e85b..8c57ca05dabd 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> @@ -27,8 +27,16 @@ gmac0-pins {
>  				 <K1_PADCONF(11, 1)>,	/* gmac0_tx_en */
>  				 <K1_PADCONF(12, 1)>,	/* gmac0_mdc */
>  				 <K1_PADCONF(13, 1)>,	/* gmac0_mdio */
> -				 <K1_PADCONF(14, 1)>,	/* gmac0_int_n */
> -				 <K1_PADCONF(45, 1)>;	/* gmac0_clk_ref */

The point sashiko made here seems valid, odd that these aren't added to
another group.

> +				 <K1_PADCONF(14, 1)>;	/* gmac0_int_n */
> +
> +			bias-pull-up =3D <0>;
> +			drive-strength =3D <21>;
> +		};
> +	};
> +
> +	gmac0_clk_ref_cfg: gmac0-clk-ref-cfg {
> +		gmac0-clk-ref-pins {
> +			pinmux =3D <K1_PADCONF(45, 1)>;	/* gmac0_clk_ref */
> =20
>  			bias-pull-up =3D <0>;
>  			drive-strength =3D <21>;
> @@ -51,8 +59,16 @@ gmac1-pins {
>  				 <K1_PADCONF(40, 1)>,	/* gmac1_tx_en */
>  				 <K1_PADCONF(41, 1)>,	/* gmac1_mdc */
>  				 <K1_PADCONF(42, 1)>,	/* gmac1_mdio */
> -				 <K1_PADCONF(43, 1)>,	/* gmac1_int_n */
> -				 <K1_PADCONF(46, 1)>;	/* gmac1_clk_ref */
> +				 <K1_PADCONF(43, 1)>;	/* gmac1_int_n */
> +
> +			bias-pull-up =3D <0>;
> +			drive-strength =3D <21>;
> +		};
> +	};
> +
> +	gmac1_clk_ref_cfg: gmac1-clk-ref-cfg {
> +		gmac1-clk-ref-pins {
> +			pinmux =3D <K1_PADCONF(46, 1)>;	/* gmac1_clk_ref */
> =20
>  			bias-pull-up =3D <0>;
>  			drive-strength =3D <21>;
>=20
> --=20
> 2.54.0
>=20

--yHMIcsRoTx1oZIkR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahh3qgAKCRB4tDGHoIJi
0ighAQCCYCHn/Z8Nx1S8V5gzBhLAaraiQ7AmOK+smylXr8jDiwEAp3sY1yAA84Wh
XOHUcBadiG0vpUZHYLRkhwjSFZEjHgk=
=FbJc
-----END PGP SIGNATURE-----

--yHMIcsRoTx1oZIkR--
