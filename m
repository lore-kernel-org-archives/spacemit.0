Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0D222B584;
	Thu,  5 Feb 2026 19:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770318953; cv=none; b=qhT/qBXZY0aBA/W7aJ/8bcDqHF7thjfkMhNIT6d7JVEsNGS22cO4rkwfZOg8u9WayBloMB+q+mHvDLB5zsb5PARlzHeHiM3Q2VqZRD4dY7OXG1J7MdHFCT0Tmyt0+ZLQ50r4gWK4a6iEr3wqzprJuAr3sZ9QlHtDWebuNQiv1JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770318953; c=relaxed/simple;
	bh=8uEK3hrM72xZCPTiaaLxzqe/qtX5ObVcMPrgPoWnT/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Da+pcNUgUAtiV6U/AY8tzBPeDRO/TzMErFlpklHNpXKCta4TCQOzUp4F1YR/JKDo6xLz9jKBnY9g1dqhXGNIChkez2Vyg+pD1yg4H2PmgDxvHT5RIi4cu/vQd2un9RKdLoIqbsdji/SEk/yxjb8glNcT9kROrdQbYoBvgkxSHOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nz/vXr4F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nz/vXr4F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2907DC4CEF7;
	Thu,  5 Feb 2026 19:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770318953;
	bh=8uEK3hrM72xZCPTiaaLxzqe/qtX5ObVcMPrgPoWnT/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nz/vXr4FtzIFPK9k9wKlBDa7FlYR+nvHVooKWZlBm8N/jX4BmWx9oZalMq8PmlhL9
	 nsXlJg/XzPOEjJG4YpxRNGXCvaU+CTasqiF1VFkU0yyjL53ES9avJwAZGx2YRxum8S
	 sWQUbq6tMsU9VDN/cIoGVcn9OpHfGJIF12LD+n+FpK4rM7p0Y7b2Meo7LAotAjgMMG
	 An4yTn2czxb+TYuFQIt3yDpekcyhcEV54bfjkTUrQ/0DPJa7PhXvgXAwvzgNe8awI/
	 sf7RAuhgIaWjSDZSqwtxiOdkn5ZDf/NYpJfZYgyj7Tg5D7O8YvAy+cNQyO3OuscpXh
	 +ghjf8+VcYznA==
Date: Thu, 5 Feb 2026 19:15:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: mfd: spacemit,p1: Add individual
 regulator supply properties
Message-ID: <20260205-arrogant-starfish-a7fe8d735c7e@spud>
References: <20260204-spacemit-p1-v3-0-a894b3057026@riscstar.com>
 <20260204-spacemit-p1-v3-1-a894b3057026@riscstar.com>
 <20260204-unlucky-raven-1ca0ed8f3392@spud>
 <CAH1PCMZ9S95JHzuZc1hG0hwxjVmCg9RezZ6rNjt_xQ25FokQOQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Tut58P+7NR4gmfNd"
Content-Disposition: inline
In-Reply-To: <CAH1PCMZ9S95JHzuZc1hG0hwxjVmCg9RezZ6rNjt_xQ25FokQOQ@mail.gmail.com>


--Tut58P+7NR4gmfNd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 05, 2026 at 03:42:01PM +0800, Guodong Xu wrote:
> On Thu, Feb 5, 2026 at 2:07=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
> >
> > On Wed, Feb 04, 2026 at 09:23:01PM +0800, Guodong Xu wrote:
> > > Add supply properties that match the P1 PMIC's actual hardware topolo=
gy
> > > where each buck converter has its own VIN pin and LDO groups share
> > > common input pins. Supply names are defined according to the pinout
> > > names in the P1 datasheet.
> > >
> > > The existing "vin-supply" is marked as deprecated to avoid warnings
> > > as dts and dt-bindings go via different trees.
> > >
> > > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > > ---
> > > v3: Mark vin-supply as deprecated.
> > > v2: Remove providers from the dts example.
> > >     Pass the 'make dt_binding_check' test.
> > > ---
> > >  .../devicetree/bindings/mfd/spacemit,p1.yaml       | 53 ++++++++++++=
+++++++++-
> > >  1 file changed, 52 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml b=
/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
> > > index c6593ac6ef6a..41f784408e29 100644
> > > --- a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
> > > +++ b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
> > > @@ -28,7 +28,46 @@ properties:
> > >      maxItems: 1
> > >
> > >    vin-supply:
> > > -    description: Input supply phandle.
> > > +    deprecated: true
> > > +    description:
> > > +      Main power input (deprecated). Use individual vin1-6, aldoin,
> > > +      dldoin1, and dldoin2 supply properties instead.
> >
> > What's the point documenting the deprecated version if it doesn't work
> > anymore?
>=20
> Keeping "vin-supply" in the binding with "deprecated: true" avoids a cros=
s-tree
> warning. Since dts and dt-bindings go via different trees, the new bindin=
g +
> old dts triggers:
>=20
> pmic@41 (spacemit,p1): Unevaluated properties are not allowed
> ('vin-supply' was unexpected)
>=20
> Rob flagged this in [1] as 'intermittent warnings'.
>=20
> I'm open to dropping the deprecated markup, maybe just accepting the
> transient warning is fine?

I'd rather have the warning in linux-next or for a short period of time
in Linus' tree during the merge window, than have the binding document
something that no longer works. To me, the deprecated tag in a binding
means "this used to be how things were done, and still works, but we
don't want you to use it because of xyz reason". Things that don't work
should produce warnings to stop people using them. You provided a fairly
good justification for breaking the ABI, just commit to that and remove
the old/incorrect way of doing things.

>=20
> Link: https://lore.kernel.org/all/20260129181604.GA1398997-robh@kernel.or=
g/ [1]
>=20
> Best regards,
> Guodong Xu

--Tut58P+7NR4gmfNd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYTsYwAKCRB4tDGHoIJi
0jsFAQC8J9Vo7WBPfUVk997vA0t8NWn2kHR/WK40+BDQEFRXQgEA3kmV2U9c13M6
VU+e2Gbf3L2/IgxEahWy3eiy0ukYOgI=
=+ap+
-----END PGP SIGNATURE-----

--Tut58P+7NR4gmfNd--
