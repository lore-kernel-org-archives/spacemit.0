Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B512DCF46;
	Mon,  9 Feb 2026 19:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770663624; cv=none; b=AGDyQki19w0ZGXx4Tz9egcClj38OvzxzwfBb+j0mZkr+3R12xzfgOtXTnqhNHbGJBV/NBSrDNZ42cocZwSxwmSy9aS4D9XZucyPI+LTN58ktXMYMKvuNXkGuIl55EVpW0tx9o/SyWm5E78HqNS6Xz2n61+jMxNkBGIg4S6vC2aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770663624; c=relaxed/simple;
	bh=Gn3cwiqxljCA6W7Xej1NCrQLFaTw7sAtTr+ABKnyH2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L6wGdrD9NzaQWScKReRP3HPGytAL37lJd0OnXrQF9+ahMSb2xRHq8Kcb6sLKWWQ3yyswSfthotzQYPTY3zHa6gyrXOfbR8qSlfDV0Cwn8Gh8DhSk3IBaUibk/GzFav0DHq83AdpzSM8ZZd+j3AZ0NVNL5nasRqzRVYvpAiu63AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qkYUrFkG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qkYUrFkG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 329D3C116C6;
	Mon,  9 Feb 2026 19:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770663624;
	bh=Gn3cwiqxljCA6W7Xej1NCrQLFaTw7sAtTr+ABKnyH2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qkYUrFkGrnvTiA6w5MxcH3P17ja0YaUjXz77gmeRnRRGz696SWcD1O6r7ctqtXV1I
	 GV+SD+lva2MWzE6nKC69UpBOzQ5409wkS0pb3Pfm58CSpMsVSXcW8UlQuZZUD3/Au9
	 5pTgiX9LPuyy3N8uuWxzoMlErH7KCfO4yYlCHEbLSMcUQEt192+Owaq/AgJZcyysp+
	 WNy7cvnCp1CyRDWA5I87TNoohDqhYKl7G/EjhI2D+vLPXlo4BqnZI5srn2VMabzPCg
	 eCIKsM0DETM1Suus8f7KVREL1EeQ2NIJiFvoDXYzbpyZePGHKOLU4BubflUxVtdhPS
	 R2btjGssrrOQw==
Date: Mon, 9 Feb 2026 19:00:18 +0000
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
Subject: Re: [PATCH v4 1/3] dt-bindings: mfd: spacemit,p1: Add individual
 regulator supply properties
Message-ID: <20260209-bulgur-unshaken-2d8ca2532c9b@spud>
References: <20260206-spacemit-p1-v4-0-8f695d93811e@riscstar.com>
 <20260206-spacemit-p1-v4-1-8f695d93811e@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9LY5svYI3ft3HkXV"
Content-Disposition: inline
In-Reply-To: <20260206-spacemit-p1-v4-1-8f695d93811e@riscstar.com>


--9LY5svYI3ft3HkXV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--9LY5svYI3ft3HkXV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYouwgAKCRB4tDGHoIJi
0oHYAQD5dcqTHGaB2vUdjmgXkceRiPIWmj6CyrpB2mDxwv3j9AD+LbSsaMDqL+SJ
Ud7aHz9IAPULwU2v+jIaYhBZ1jD1Hwo=
=NpqU
-----END PGP SIGNATURE-----

--9LY5svYI3ft3HkXV--
