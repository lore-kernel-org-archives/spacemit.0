Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A457937CD21;
	Sun,  3 May 2026 17:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777831115; cv=none; b=SQguZQXnXNlfyOJ1hLpkpfFyDaJh9IjSA2KQtkF97uI4U2H/lz5fR9CdBwotZV17J2t4HcPTapu2hQKEYmDtA/M/z6/S4/2PTrkboP4iloo4sZfZDICtw6gFP4F5DqsHaYfC1cQTnBZLM8zGKW0DNTJDyz0vWgQH1cGt8ARlTi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777831115; c=relaxed/simple;
	bh=G4/3gd/o1gO9SZAsmmNBBlFd2V9XHZiz8iCfzpt/auo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uMYI78LvDpF54qKtSuptfw4cP5+kuON6M1772sk5QH5eIUh+bDjWW5ZXzak4pVPZcWRGNR9gXttbf61yT3ovGn4Y40XrP4VottFK3eTMiEflLw7GHr7VZnUmI0oCXEZePmP+YP/qpmjAM66wr+20EidLbqijnihWplxP0ktXaBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZuZc5Uo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZuZc5Uo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6E6C2BCB4;
	Sun,  3 May 2026 17:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777831115;
	bh=G4/3gd/o1gO9SZAsmmNBBlFd2V9XHZiz8iCfzpt/auo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jZuZc5UoHtO3Z7zkqNvNSTrmM7JHHjAwtj3X9zUn8I4bIX44Ba8Rj0I7CHp6regZd
	 t9Aj7/2TV5+1BGSgMPyFyNzh/vOsrDi96koHfisBL2ZPfYRPQpDzs+KGUOG6SAzoDm
	 g4q9U59asC8fNpTR4SdezFhjOxbzoYkYbw8T3K7FD1SYQcCpW/QCy6hsvbgKqH6hfN
	 RhsR3XHgm2edqiEramjIYBHaJhnQUV6PqeJgAcdykdd51SF7ViGYTyF+0ZRakO38ss
	 1ljbbhDTMzbzIY95m872bPCuVERl27l4yhoYvwUl9pWBisADdUZosZ9cJOx9gPQTVO
	 Y3Oa8v7lnauPA==
Date: Sun, 3 May 2026 18:58:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dts: spacemit: set console baud rate on bpif3
Message-ID: <20260503-unlucky-tattling-fbe1f81467e4@spud>
References: <20260430-reword-overstep-3be08b7eab25@spud>
 <20260502120102-GKC3266396@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F4dPXMhXmlug+BoG"
Content-Disposition: inline
In-Reply-To: <20260502120102-GKC3266396@kernel.org>


--F4dPXMhXmlug+BoG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 02, 2026 at 12:01:02PM +0000, Yixun Lan wrote:
> Hi Conor,
>=20
> On 19:52 Thu 30 Apr     , Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Because the default console's baud rate is not set, defconfig kernels do
> > not have any serial output on this platform. Set the baud rate to
> > 115200, matching what is used by U-Boot etc on this platform.
> >=20
> > Suggested-by: Vivian Wang <wangruikang@iscas.ac.cn>
> > Fixes: d60d57ab6b2a8 ("riscv: dts: spacemit: add Banana Pi BPI-F3 board=
 device tree")
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > CC: Rob Herring <robh@kernel.org>
> > CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > CC: Conor Dooley <conor+dt@kernel.org>
> > CC: Yixun Lan <dlan@kernel.org>
> > CC: devicetree@vger.kernel.org
> > CC: linux-riscv@lists.infradead.org
> > CC: spacemit@lists.linux.dev
> > CC: linux-kernel@vger.kernel.org
> > ---
> >  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 2 +-
>=20
> Looks good to me, but I think the fix should also apply to other boards,
> so do you want to fix other dts? I'd be fine if you keep it to BPI-F3 only

I don't have any other boards, didn't/don't want to make the change
elsewhere where I cannot test it.

>=20
>=20
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/ris=
cv/boot/dts/spacemit/k1-bananapi-f3.dts
> > index 5790d927b93db..333ac8ebf3f51 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > @@ -19,7 +19,7 @@ aliases {
> >  	};
> > =20
> >  	chosen {
> > -		stdout-path =3D "serial0";
> > +		stdout-path =3D "serial0:115200n8";
> >  	};
> > =20
> >  	leds {
> > --=20
> > 2.53.0
> >=20
>=20
> --=20
> Yixun Lan (dlan)

--F4dPXMhXmlug+BoG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafeMxgAKCRB4tDGHoIJi
0mHiAQCbEcDRsIdWUcZDNAPijtOhudJZ91LwkR1CJnv8h/O1fQEA4zoB/HOltfr3
MeH9y2VvOekfgCbRpQJWXkxbdksWgwU=
=6GNj
-----END PGP SIGNATURE-----

--F4dPXMhXmlug+BoG--
