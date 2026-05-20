Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E903630AD;
	Wed, 20 May 2026 16:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779293886; cv=none; b=UFiHu0WNORgXaNZU6Fb/TYwNoQfv2alMvgUm1e+76fRGW8R7Qsu+FBQMq3durQ9Av3CdJGzuZtWBJp3d/LYU1zSVPWKzkoUjQjhNToVavZNcd0lgDUmgxymanIAhFgWrXc8uS9rRmTnEXDtC/b3lUwhzrlbiLYLvJW2yccjfHPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779293886; c=relaxed/simple;
	bh=s+bqyy4lTEXQwNzfLtdc2etOddCUPR1OWMokoRzfIoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nz+khFl1wTJ2dr/sbkAIe+eKYgIFKT2SHrM4UAzhXYwOxDmS28bM988MB3lFjGb+7wLph0CfYF0/wW7tPYcc/7FfxPrDcmQ0WKD9f++h5xA4ENDq0VS8kixOzYKryE4+guxuffLYnfKR/h9rUSz9NXNhu8OPaaBTsS5/ltBl/iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fARxK0zJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fARxK0zJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E21A1F000E9;
	Wed, 20 May 2026 16:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779293884;
	bh=s+bqyy4lTEXQwNzfLtdc2etOddCUPR1OWMokoRzfIoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fARxK0zJARFQEgwTsKoLeiDZ+mxDxjkgm2bcNzIa5GgybdhPHqeuxNw2PlQnTOUn2
	 3e7FSVPB4uJ/6ErTRAcvHAvbLnKEUwnMI8p/VuuRDEeLlX97iBX+lCum7nffoslDtY
	 zznloGWDkcx8rd1vUrrpUeBgQCPXz3rnALbQzs4cMZYDKNFuYzeewYE7TZpp6Dxhaq
	 BOtAyRDEowpGmzABD/4EOszoAw6ii5y3SOPXfWS10qnNWYFtFZ5OOQfCK/AMPcQsny
	 ou2l49/i1G5bG7sm+OqJ6fOsSyDx1mIysOSrZt5KIndcBUzCo5fpUsAcW5NmFURLQj
	 6WxqMBpJ9OWKg==
Date: Wed, 20 May 2026 17:18:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: riscv: spacemit: Add K3 CoM260-IFX board
Message-ID: <20260520-shimmer-tackling-b7be80a5a764@spud>
References: <20260520-02-k3-com260-ifx-v1-0-3e17055dd488@kernel.org>
 <20260520-02-k3-com260-ifx-v1-1-3e17055dd488@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l0U+RNkWJEZjoyol"
Content-Disposition: inline
In-Reply-To: <20260520-02-k3-com260-ifx-v1-1-3e17055dd488@kernel.org>


--l0U+RNkWJEZjoyol
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--l0U+RNkWJEZjoyol
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCag3euAAKCRB4tDGHoIJi
0omcAQDg9uAlz+noF6oIqi4BKQ66FKsaUeoyoXbr/XSGjii6ZwEAllYef76J2Lzj
pZg7pT2UT4wV3gIwmDlYk0sa3uf3Vwk=
=GQTi
-----END PGP SIGNATURE-----

--l0U+RNkWJEZjoyol--
