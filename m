Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC8344E043;
	Fri, 22 May 2026 16:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779466325; cv=none; b=pSVRsh3RSvRhZQT5psg5YUehnjOID5xsXcdv6BjoD+SHeMp8h5sHGjDc7i/BLBSqSUSPnko9e5ncu89wGbhkY5gsnoMvx333e/DgffP0tfGx7CUKzPqVIsPyP86UMUBrWMw8I/ycsOGOGHF0kitGWgHgdgqwsfyhAl8398JadTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779466325; c=relaxed/simple;
	bh=2U5XU9h6HYcXCdG4wEmURLpHZMMYjCkqLOCkJD6b5Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u5hHZgSuE4EjkEVbgjn2ZuBrBKjN7tl9ayk9iu+eby/LwhwEIVBs0NTdSnHQsdQv+w3HC6QbMsCz+8kBI9+HAxVFl1FH6+3JpHTbGM1XovEP1dbs8WNjbt6m4kEXoIKTu/eQw54G0w2YFjE9AFFSAy0kK2l1ksHb6UeT76FpLNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fA93VpCP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fA93VpCP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 218241F00A3F;
	Fri, 22 May 2026 16:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779466319;
	bh=2U5XU9h6HYcXCdG4wEmURLpHZMMYjCkqLOCkJD6b5Tk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fA93VpCPmy+jWUvyevRGqWdtiIeTGi7HFk9lql29Ms9RUwm0t0Alp58nr/myQB+ZM
	 eOmaYytmMdpk+23mwYjnTEtVoH5K0ODmzWwNDdf8QtKUiAYR1kFKU2tLTyW82pFN7w
	 w9ciZb6K9wlrC+drD9a9umF1kuWbq4RCdhXYPM1FB9MinqnYvBUwD3gMwm14J1rZU+
	 P5qSxWJPTp+dzGXupvcioJxP/2FRBve10aSZdBMbEdNuoV1smd0rNEYtcZXVa2m1w3
	 9lLYadMeUtVuUfIZP009hb0Dbk8TH4STSRjX0PS+YdPYYKCZ3c12OAUVjILDhlKSJw
	 ndLx3E0oDaCTg==
Date: Fri, 22 May 2026 17:11:54 +0100
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
Subject: Re: [PATCH 1/3] dt-bindings: riscv: spacemit: Add Banana Pi BPI-CM6
 compatible
Message-ID: <20260522-endpoint-refueling-892a742e3251@spud>
References: <20260522-bpi-cm6-v1-0-707ef1917a30@pigmoral.tech>
 <20260522-bpi-cm6-v1-1-707ef1917a30@pigmoral.tech>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GnUjvP1EuQAp69tA"
Content-Disposition: inline
In-Reply-To: <20260522-bpi-cm6-v1-1-707ef1917a30@pigmoral.tech>


--GnUjvP1EuQAp69tA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--GnUjvP1EuQAp69tA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahCASQAKCRB4tDGHoIJi
0p+yAP0d8Sxf6GoYo9bB7UbBSI7sa9vU7FdmIgQHUBrpqHLJ4QEA+MIg1uouFWTU
Qi9GvV5bXvR2VMKO3dJbHBBql3EM+gk=
=aTs1
-----END PGP SIGNATURE-----

--GnUjvP1EuQAp69tA--
