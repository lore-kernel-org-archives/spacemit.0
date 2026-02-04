Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF49421EE2;
	Wed,  4 Feb 2026 18:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770228433; cv=none; b=ACS9zoxIPatGwNX3C7ou/+5dcNzeS5GXMr+g0NHJSyBXy8dUCB5DtUJfTWpvbl69rTDGy5JL1d0i/aPzxpEDWbHUAb8Pi2ARI6xky/1eQcr14Qy2Tc3tMINQ0SIO7MLk8Tf6C45o7C2LXXlmkeXu08U+moOZEOngGcQlt6GXIt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770228433; c=relaxed/simple;
	bh=gUKiYi54MPXOa8OLr2IikMwDAGcFOielFJYFN7kyy48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GOvVWOnfdxCohtca9Gfl++nRGdCYvVZj1wtf5n0lkJ7niJ9pcseeCkEnZTSEUX55//UNtdCPcTDrzqOKrMdBYOWmiQvmQtGuoRbMG24Uj60MDHwaozKQK8xSbhtxOs4crfcsVul3a4euKmzN1AL+02dnNCHMaBKgy7dhpXEwQZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CO8637w7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CO8637w7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16C2CC4CEF7;
	Wed,  4 Feb 2026 18:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770228433;
	bh=gUKiYi54MPXOa8OLr2IikMwDAGcFOielFJYFN7kyy48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CO8637w7pGh4pR/NtccsmsLcizq9hT/ISyNTQdwK5YNKBV4NyKbJl5+H7tEU5NIdH
	 Jr0+GIS1QsJfTBrNy0rqNOy8zo/YYDy+muFeTcCNwfXi6E5hrZ4CHU51V1lhzCsqGf
	 p1fM5MFDp8ibuKmaTtmMSyc7Angh9Bt16LxE1VewMedEiozZql2YfvBFB5W8V2RzUx
	 LfQjmokERq7IVuhvEA78mj3na7ijnwTtb/GUN7XsbhPK0j58hVR/plNp6DgnuGeWK3
	 igVDDJD91rjL6gImYYetAtZgbfVHx58rnT8p5KQmr4ce3SGYQsJ6ymuYBwdCgyl92+
	 b57dlM3E7qGuA==
Date: Wed, 4 Feb 2026 18:07:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: mfd: spacemit,p1: Add individual
 regulator supply properties
Message-ID: <20260204-unlucky-raven-1ca0ed8f3392@spud>
References: <20260204-spacemit-p1-v3-0-a894b3057026@riscstar.com>
 <20260204-spacemit-p1-v3-1-a894b3057026@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I5CCiEoC65J3zMOc"
Content-Disposition: inline
In-Reply-To: <20260204-spacemit-p1-v3-1-a894b3057026@riscstar.com>


--I5CCiEoC65J3zMOc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 04, 2026 at 09:23:01PM +0800, Guodong Xu wrote:
> Add supply properties that match the P1 PMIC's actual hardware topology
> where each buck converter has its own VIN pin and LDO groups share
> common input pins. Supply names are defined according to the pinout
> names in the P1 datasheet.
>=20
> The existing "vin-supply" is marked as deprecated to avoid warnings
> as dts and dt-bindings go via different trees.
>=20
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v3: Mark vin-supply as deprecated.
> v2: Remove providers from the dts example.
>     Pass the 'make dt_binding_check' test.
> ---
>  .../devicetree/bindings/mfd/spacemit,p1.yaml       | 53 ++++++++++++++++=
+++++-
>  1 file changed, 52 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml b/Doc=
umentation/devicetree/bindings/mfd/spacemit,p1.yaml
> index c6593ac6ef6a..41f784408e29 100644
> --- a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
> +++ b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
> @@ -28,7 +28,46 @@ properties:
>      maxItems: 1
> =20
>    vin-supply:
> -    description: Input supply phandle.
> +    deprecated: true
> +    description:
> +      Main power input (deprecated). Use individual vin1-6, aldoin,
> +      dldoin1, and dldoin2 supply properties instead.

What's the point documenting the deprecated version if it doesn't work
anymore?

--I5CCiEoC65J3zMOc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYOKywAKCRB4tDGHoIJi
0hPvAQDNhaGRPloJVhFrnHIbYInImXvLdwwaaEw4mhDkuUwL8gEAh71m/l08p23U
4VuiK+wznUTz8EhMAUZdJpENMVEa5wo=
=eTr7
-----END PGP SIGNATURE-----

--I5CCiEoC65J3zMOc--
