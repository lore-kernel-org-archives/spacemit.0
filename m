Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06793603D3;
	Wed,  1 Jul 2026 15:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782920846; cv=none; b=sxO6ac8G1mhqdygb2DeezB3L0aKE+5t/iF9jdfWdrZg6aI9F0xBltgZo9IUeSeWVdYNuPSGmoQaPoYO/a7/DcsI/4lN3fb1pWoMi16VErxnNkoOHIJ8SIGNVVBaDlRBx6sOl8wjQAgLOXPBFkNtPz4g19/ol/jgT0aYwfYcL1lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782920846; c=relaxed/simple;
	bh=NcgWAkkpvQ6GIyO0lNfvcz5hShiLJ0aGbZIzu82PdNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=twGk6ixbCytxEo7T2UEysZTjWjC7ZYRIUfn6bnyJHaSj5bOH5S+4BDTzJoPXuaY/db6+6cJ5dq7VHx/Jtfaql/03KUH9xZUQXr1l8Z67bSaHYMWK30Vl4ZJOx6947LDKL7Idu7RWmXhe9zo2m0iMiJ/dWtQJlM70cxSZjrnZBBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IflC72ft; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IflC72ft"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6090B1F000E9;
	Wed,  1 Jul 2026 15:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782920845;
	bh=F1d53/TBKMgbtfDcw1+aV1I5xnxDEUc79F11nQ0A4cU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IflC72ftbroGcxiInCSEuqCl31BxPbBA3SEZdpE+F01220IMOaDKLlwUBPvSaWztX
	 s6hp+2f2KfRXr7jP7W6CaZAqstAke0DMIwhPVZ6icN61fHoGz39YFsgwX5H8gGZS0r
	 nKsW58hEPcG6FFkhTfqXVd+DPYrOLZUY92DSUxNE7F5esGosa3cdfecoW68g6KgsZJ
	 XRsxQoSEcTqH/ctXo5isbcshBNLD7aSBoooN9NYnXW7C4SmOXdT8YBs5hdFaf/tUzG
	 f8Q464Fw6wfHw2MS8o6QGik1WH98FAQNPU3C/AqgBMeJBgK3Pmv7v/c2E35AEVZefu
	 nki6I5cEQZkQw==
Date: Wed, 1 Jul 2026 16:47:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: linux-next@vger.kernel.org, soc@kernel.org, spacemit@lists.linux.dev
Subject: Re: Include in next: Switch SpacemiT SoC tree's repo
Message-ID: <5a6b7770-948f-41ac-9956-e0646228ed5e@sirena.org.uk>
References: <20260701001506-GKA20854@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HIzxHE8oQ4+E41L0"
Content-Disposition: inline
In-Reply-To: <20260701001506-GKA20854@kernel.org>
X-Cookie: Do unto others before they undo you.


--HIzxHE8oQ4+E41L0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2026 at 12:15:06AM +0000, Yixun Lan wrote:

>   Previously, the SpacemiT SoC tree was hosted in github.com[1],
> while now we've created a new kernel tree at kernel.org[2],
> so please help to update the repo url for linux-next tree to the
> new one, and the other info should being unchanged, that's:
>   branch for master: for-next
>   branch for pending-fixes: fixes
> =20
>   I will also switch to new repo for sending next Pull-Request to
> SoC tree maintainer.

I've updated the -next configuration, the new locations will be used
=66rom tomorrow.

--HIzxHE8oQ4+E41L0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpFNokACgkQJNaLcl1U
h9CwYwf8DmpHFH8encN3APwISqw4XWsjz1H2GlfBxN43/vu3YcAPfSHbd7EDeD7v
DbaZ44PJSuoKKrSNl6eYmHH3xr19aO/smoBilNTG8kDE8V+O8xOu+/tycJnFFu0V
vRtt3WuN5Gwmr9AOQXNT2gGLJo+dyAyJBg0rlWmUYHC6Hy0n7DYBVOUyBVuoi+Rv
ciA/0YW3wJzN63YJSo5wjRt4e8HT4OrWARGUAvDk7kn6JzMOuHIyrX/REBStbSlm
Dl8oiJbnZHtuiIf2+l3rBLcYlqGZs1AM845maODE6tWLCwNWp7Gq2ylhYoJs8s7R
YoV8uUFNpPJYh797AnHblGLsf8kvhg==
=lCDk
-----END PGP SIGNATURE-----

--HIzxHE8oQ4+E41L0--
