Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912AE280A5B;
	Mon,  2 Mar 2026 18:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772475066; cv=none; b=nRnRVnrfNLDJuiLO4cYM4B0GBHi9cNiKer2RJivd2hSFjp+tHREvs5Ea7l1J1yttNJ9EXtMBT/53kfboKOlFH1RfuyJ+cJpUKdk7r/zaTO9AQ+VeA18uEDz+CyMUtqmJM749lNwPTpwAuEox9p0U4czriy12nZSbL+xyJR95uPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772475066; c=relaxed/simple;
	bh=9vMp8oVY9ly+koARXC2CDFt7G+bOzmkjyESC8o/h6PE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q4ewhnqyx7DFGCjC12jnVNjHAj10fb2EpX7I6pgxFhkYe7AxXy/snPBD75NTzwGfeld2a2T7gtZz+4RfN0tdwlTt/CT/P5Pdab8fwJaIh9riMRMDoESbd6qPhUnTkEWfb3cUxpTUYyjK0Qoq9nJj1UHZ3AAzXUKD7hwsmMwbfus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XCThIaT+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XCThIaT+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFB33C2BCAF;
	Mon,  2 Mar 2026 18:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772475065;
	bh=9vMp8oVY9ly+koARXC2CDFt7G+bOzmkjyESC8o/h6PE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XCThIaT+vkO8MNEptzSfjE8GU7VO97Um4ozCagAenO6aTvoowkOptMN5DJflr8Iw4
	 1Fziczj1/mxZoJTXL7ofEKJ5lHHYs1owsVXCRfPbs1eG3rZsYX4MZ70h1T8TPgOTVF
	 N7V876RrEG0k7Hqh0mmxAMSbgbqa8sAuFO6euRnvFxfJjHmQD8EDcCCSNjHefpAUap
	 /R7kG63cIyP1yb77zLxeLTB9onoPM5rZzwtYKrnaoPgufk/R9k04aFBSy/cu/VqnuG
	 QWEFAPY8h/iAjnlWtv7YYl7/N6yUiPNQ9KiiF6HuqaHT7UIKhFnbUe89ZfUeH2se7/
	 Yf6b9egFtYtjw==
Date: Mon, 2 Mar 2026 18:11:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, dlan@kernel.org, alex@ghiti.fr,
	aou@eecs.berkeley.edu, conor+dt@kernel.org,
	devicetree@vger.kernel.org, elder@riscstar.com, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pjw@kernel.org, robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH] riscv: dts: spacemit: pcie: fix missing power regulator
Message-ID: <20260302-glamorous-undivided-08b11b794939@spud>
References: <20260226-k1-pcie-fix-pwr-v1-1-94b493cd27e5@kernel.org>
 <20260302030511.30566-1-amadeus@jmu.edu.cn>
 <20260302033655-GYA288339@gentoo.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0Cad6xDtBs6YbbZc"
Content-Disposition: inline
In-Reply-To: <20260302033655-GYA288339@gentoo.org>


--0Cad6xDtBs6YbbZc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 02, 2026 at 11:36:55AM +0800, Yixun Lan wrote:
> Hi Chukun,
>=20
> Sorry, I missed your mail due recent problem of my client..
> On 11:05 Mon 02 Mar     , Chukun Pan wrote:
> > Hi,
> >=20
> > > &pcie1_port {
> > >  	phys =3D <&pcie1_phy>;
> > > +	vpcie3v3-supply =3D <&pcie_vcc_3v3>;
> > >  };
> > >=20
> > >  &pcie1 {
> > > @@ -320,6 +321,7 @@ &pcie2_phy {
> > >=20
> > >  &pcie2_port {
> > >  	phys =3D <&pcie2_phy>;
> > > +	vpcie3v3-supply =3D <&pcie_vcc_3v3>;
> > >  };
> >=20
> > ```
> > &pcie1 {
> > 	vpcie3v3-supply =3D <&pcie_vcc_3v3>;
> > 	status =3D "okay";
> > };
> > ```
> >=20
> > According to DT binding, the vpcie3v3-supply of the &pciex node should
> > be moved to the &pciex_port node. This is simply a duplication of the
> > property.
> >=20
> I have confidence that pcie port need to add a regulator to provide=20
> supply for devices..
>=20
> But, I'm not sure whether it's ok to remove regulator from &pciex node,
> it's possibly a 'yes' answer, but to convince me, I'd like to see a real
> test case to prove it: e.g, power supply for pciex is actually off before=
=20
> the driver initialization, then run regular procedure as it should, if
> all works fine

I'm not really sure what this is about. Whether the supply can be off
before driver probe has nothing to do with what node the supply should
be in. If you're concerned about removing it from the pcie node causing
it to not be enabled during probe, then the driver should probably reach
into the port node, get the regulator and call enable() on it?
As I said when reporting this, either you need to change the driver and
dts, or change the binding. If the supply actually is provided to the
controller and port, then you need to change the binding to have a
supply in the controller node and change the driver to make sure that
both the controller node supply and the port node supply are enabled as
someone could opt to provide them from different regulators.

Looking at the bpif3 schematic
https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv/view
I see nowhere where that 3v3 supply is actually provided to the k1,
which I would expect if it were the supply for the controller itself.
Instead, the m2 and minipcie slots are where I see that supply provided
in the schematic. To me, that sounds like the port is what needs the
supply, not the controller, but I'm not super familiar with pci
devicetree stuff unfortunately.

> Btw, different drivers request same regulator is ok, and is quite normal,
> can't draw a conclusion that it's a duplication, as they may be used for
> different reasons
>=20
> > But do we really need this pcie_port (PCIe bridge)?
> >=20
> > The PCIe bridge node (pcie@0) was treated as a platform device, but it
> > did not define the interrupts property, which resulted in the following
> > warning: `[    2.897980] irq: no irq domain found for pcie@0 !`
> >=20
> > Would it be better to submit a patch to remove this pcie_port?
> >=20
> > ```
> > -       ret =3D k1_pcie_parse_port(k1);
> > -       if (ret)
> > -               return dev_err_probe(dev, ret, "failed to parse root po=
rt\n");
> > +       k1->phy =3D devm_phy_get(dev, "pcie-phy");
> > +       if (IS_ERR(k1->phy))
> > +               return dev_err_probe(dev, PTR_ERR(k1->phy), "missing PH=
Y\n");
> > ```
>=20
> I've not really looked at this, and not an expert on this area, so will
> leave this to Alex or PCIe maintainers..
>=20
> > I have tested this change and it works.
> >=20
> > Thanks,
> > Chukun
> >=20
>=20
> --=20
> Yixun Lan (dlan)

--0Cad6xDtBs6YbbZc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaXStAAKCRB4tDGHoIJi
0lPgAQCTClU5vis2+9tJyIZfKTjWOd7YSjjJVly2CSagyY0jSwD/QaQ7vxm86Sgy
owyfMcezZaRHlgKA8IjooEkHjVJuswc=
=MISq
-----END PGP SIGNATURE-----

--0Cad6xDtBs6YbbZc--
