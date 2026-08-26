Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8593BB690;
	Wed, 26 Aug 2026 08:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787733196; cv=none; b=VmHZjy/SaobYIlcT9ojKMBhVQWP6wac7Rp/U728ucHCp8c5o77w/zrP6AhIlowA84FI0m4wZRAWQfCBYeCHwjgs5cvwra5XFyw3M+wbaVPxq1rjmeVQZ4P2UMgF8wpfn75yUkstEXVOY/OTel8vZJPgHPW53tAdHYWm1XmvBQF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787733196; c=relaxed/simple;
	bh=fzhDF0dvgJS6W87StX6JIFYQ2j99cPUROcHAUjnhtmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eedfk0UwRBwbx6Mmg1SjeoTMkeJtN5fZ12QfG9pPMTOYykfUoH+t3VmTMKsGq5BfGPeHqbBgLd8wUtWfR9+PgfhZ+j8yuR0yOQHa/zDjlPptoNKL6t4ZLJza+XvuMV8C8dkWEnJxZa7C80mfpwhnqgBdaG0EXBZsyvliEAnMU6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=onPz2caq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="onPz2caq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C2B1F00A3A;
	Wed, 26 Aug 2026 08:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787733194;
	bh=dv8cFC9XikMoCLZHrZr3gRKX91068B0YkFD4yX25Jig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=onPz2caqwsW2180hKxPhENUOJ4wYAgbHcUinkmMOHTTV+yUrDQiyR9fY+rdVgiC0+
	 xgfM9tdxW1cdTW1eJzIF7WRYyRk1T9xHsz9xdw86d737pQUFe1GnwPSrS52eq+lqrb
	 J8JHEM8Ek7vmmXSrIsIIrF2p8/1VELq3RCbuqcqRK6dY9ZDCfR3qVEUOS7cMYWYJHV
	 pBeYcP3hTVGXp50Zff0a3L76CDbQoKdcXwE3N+oMT0oEzRERKsYmTw9LDX0Rn3kJHt
	 MIKSmwC57tv6/m4NPYOok/cPmi8fF1AfZWi83kmxI7kSbXQIOkP4whaee7otGZ5CrA
	 6YJqLgEL3UoMg==
Date: Wed, 26 Aug 2026 09:33:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Bruno Banelli <bbanelli@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alex Elder <elder@riscstar.com>, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: defconfig: enable dwc3 and the SpacemiT K1
 thermal sensor
Message-ID: <20260826-ought-tableware-73678af4dd1f@spud>
References: <20260825052233.66850-1-bbanelli@gmail.com>
 <20260825224905-GKD631715@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j24adMGA/uAym/Uy"
Content-Disposition: inline
In-Reply-To: <20260825224905-GKD631715@kernel.org>

--j24adMGA/uAym/Uy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 10:49:05PM +0000, Yixun Lan wrote:
> Hi Bruno,
>=20
> On 07:22 Tue 25 Aug     , Bruno Banelli wrote:
> > Two blocks on SpacemiT K1 boards are unreachable from a stock defconfig
> > build:
> >=20
> >  - USB_DWC3 is not enabled, so the dwc3 controller that drives all of
> >    the USB 3.0 ports on boards like the Milk-V Jupiter never probes.
> >=20
> >  - SPACEMIT_K1_TSENSOR has no default in its Kconfig and is not listed
> >    here, so a K1 board comes up with no temperature readings at all,
> >    even though k1.dtsi describes five thermal zones.
> >=20
> > Enable both.
> >=20
> The patch itself looks good to me, but since it deal with two diferent dr=
ivers
> So, can you split it into two patches? which easy to review and manage

IMO it's fine being one patch, but this temp sensor should probably be a
module?

>=20
> > Signed-off-by: Bruno Banelli <bbanelli@gmail.com>
> > ---
> >  arch/riscv/configs/defconfig | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index 04ae305d5..03d9ac2f7 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -209,6 +209,8 @@ CONFIG_USB=3Dy
> >  CONFIG_USB_OTG=3Dy
> >  CONFIG_USB_XHCI_HCD=3Dy
> >  CONFIG_USB_XHCI_PLATFORM=3Dy
> > +CONFIG_USB_DWC3=3Dy
> > +CONFIG_USB_DWC3_GENERIC_PLAT=3Dy
> >  CONFIG_USB_EHCI_HCD=3Dy
> >  CONFIG_USB_EHCI_HCD_PLATFORM=3Dy
> >  CONFIG_USB_OHCI_HCD=3Dy
> > @@ -260,6 +262,7 @@ CONFIG_CLK_SOPHGO_SG2042_PLL=3Dy
> >  CONFIG_CLK_SOPHGO_SG2042_CLKGEN=3Dy
> >  CONFIG_CLK_SOPHGO_SG2042_RPGATE=3Dy
> >  CONFIG_SPACEMIT_K1_CCU=3Dy
> > +CONFIG_SPACEMIT_K1_TSENSOR=3Dy
> >  CONFIG_SPACEMIT_K3_CCU=3Dy
> >  CONFIG_SUN8I_DE2_CCU=3Dm
> >  CONFIG_SUN50I_IOMMU=3Dy
> >=20
> > base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
> > --=20
> > 2.43.0
> >=20
>=20
> --=20
> Yixun Lan (dlan)

--j24adMGA/uAym/Uy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCao6kxgAKCRB4tDGHoIJi
0v5VAQDYT8jhm+YKA8FT1Q7h0iuPmAOmrpY0WCsMjmlbUFM3SgD+NRQmA/aRKSzC
oKHb76m702nIoXoRdTDuwGBv8GgNbgE=
=XCwW
-----END PGP SIGNATURE-----

--j24adMGA/uAym/Uy--
