Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DCF242D97;
	Thu, 12 Mar 2026 17:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773336651; cv=none; b=jXKBAldkXQoiQ9lKC2YsnyRMr4TgDeX8EVo/bSaxpzzL/6cUWLimha58MYwO7AJo9GjBKDVW1tQsxQZQObGcFDdnyEC+B/ozknLdoR6A+x7EkUhyEajaYIztlh7JFWVWGTBdw+UTLwl14Ky1K0Zquo6lFs4+4OqnFCiUW5xxuBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773336651; c=relaxed/simple;
	bh=W6tGZ3NCS57fycGB4Z6FjTao9Hr+IRejW/1XW8Q2EbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q0UC+DRzXZLcweRIW5hPiEX44CXU5RuXS8KWKa5PmBtKHEDtItQq/KC+AA7s0qm0hZGYqyLReWp68Gmj9kK7rnK/6iyLcuCvLJay5oaO8RtljKpT5jc6soxz10huBlSoLl+/W3YJKco9UO/mC2PLlVI618PqKsRbfDKOOjYhw8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V9KRHsRi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V9KRHsRi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05248C19424;
	Thu, 12 Mar 2026 17:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773336651;
	bh=W6tGZ3NCS57fycGB4Z6FjTao9Hr+IRejW/1XW8Q2EbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V9KRHsRiqVMm1UsQicox1Kr9qVSuXsJ98bMYR51K/SnUhXS1yx0aTqGt4Nm6p6XD4
	 jRsZfPwgNxkSy1hFZEp9kv3Z9rNst9vugRPBg7pVI1nhuiGFHj67PxTHHnR8TBH2et
	 JWZmBtLsGZhq53JfLKB5Js7T6bgp1OZlRmloKHrd207TrQq075Q+h/H/FHVjpl697C
	 tsFPToxalvLUwM9gHDjtJ+bNoBj9ItAqDLNANw9GHpXSAH3PhAgxA2Xvd6JXe7U+fm
	 IPum2fqKPaEib0tDzoI6TUFDKzGfWmOwnNJKR0GWUIj2baKBy7uGWCWO0xvtzi/KXs
	 DCHoa+oZnEOxw==
Date: Thu, 12 Mar 2026 17:30:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Junzhong Pan <junzhong.pan@spacemit.com>,
	Guodong Xu <guodong@riscstar.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: spacemit: k3: Decouple composite
 reset lines
Message-ID: <20260312-legume-unstitch-129b278e14d6@spud>
References: <20260312-01-k3-reset-usb-pci-v1-0-022b24b7340f@kernel.org>
 <20260312-01-k3-reset-usb-pci-v1-1-022b24b7340f@kernel.org>
 <0abfd76f49e5cedf7bfc84eb4d9a0a1d7543f6f8.camel@pengutronix.de>
 <20260312112858-GKH302167@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7Ay2qMKpijP+JeF+"
Content-Disposition: inline
In-Reply-To: <20260312112858-GKH302167@kernel.org>


--7Ay2qMKpijP+JeF+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 07:28:58PM +0800, Yixun Lan wrote:
> Hi Philipp,
>=20
> On 12:09 Thu 12 Mar     , Philipp Zabel wrote:
> > On Do, 2026-03-12 at 10:34 +0000, Yixun Lan wrote:
> > > Instead of grouping several different reset lines into one composite
> > > reset, decouple them to individual ones which make it more aligned
> > > with underlying hardware.
> > >
> > > The DWC3 USB host controller in K3 SoC has three reset lines - AHB, V=
CC,
> > > PHY. The PCIe controller also has three reset lines - DBI, Slave, Mas=
ter.
> > >=20
> > > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > > ---
> > >  include/dt-bindings/reset/spacemit,k3-resets.h | 42 ++++++++++++++++=
++++------
> > >  1 file changed, 32 insertions(+), 10 deletions(-)
> > >=20
> > > diff --git a/include/dt-bindings/reset/spacemit,k3-resets.h b/include=
/dt-bindings/reset/spacemit,k3-resets.h
> > > index 79ac1c22b7b5..c12f8bd32047 100644
> > > --- a/include/dt-bindings/reset/spacemit,k3-resets.h
> > > +++ b/include/dt-bindings/reset/spacemit,k3-resets.h
> > > @@ -97,11 +97,7 @@
> > >  #define RESET_APMU_SDH0          13
> > >  #define RESET_APMU_SDH1          14
> > >  #define RESET_APMU_SDH2          15
> > > -#define RESET_APMU_USB2          16
> > > -#define RESET_APMU_USB3_PORTA    17
> > > -#define RESET_APMU_USB3_PORTB    18
> > > -#define RESET_APMU_USB3_PORTC    19
> > > -#define RESET_APMU_USB3_PORTD    20
> >=20
> > This is backwards incompatible.
> > Are there any device trees using the APMU resets yet?
> > If not, I wonder if we should just renumber all APMU resets into a
> > contiguous range and try to get it into v7.0 as a fix.
> >=20
> No, there is currently no consumers, so I could rework them into a contig=
uous
> version, thanks for the suggestion

Only as long as it goes into 7.0, IMO, as a fix.

> > Also, this breaks bisectability.
> > reset-spacemit-k3.c will fail to compile between patches 1 and 2.
> >=20
> I've tried a first version to squash the two patches, but got a checkpatc=
h.pl complait
> for binding should follow into a separate patch.
>=20
> I can combine these two patches into one, is this Ok for you?

Be very very very clear about why they're going together, otherwise you'll
get yelled at!

--7Ay2qMKpijP+JeF+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabL4RgAKCRB4tDGHoIJi
0lFCAQC8R0krTCJ3h8LENWd4AYu7AGIS+9Kr+nwqeEhqxLlJ6gEA9efqzwnlJkD2
xl++M7pPu/XyyZgMduLa1mwL6FPpUgs=
=uTkh
-----END PGP SIGNATURE-----

--7Ay2qMKpijP+JeF+--
