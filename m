Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699C4246782;
	Wed, 14 Jan 2026 20:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768423313; cv=none; b=a3cRHV1Io5TXHgGB9lkx+mkAc93rX8ffq/n6HULw1FZxD5r4IZ2unsyPCMHJ/z8izC8NK+/dIW5fC2IJWQs2C68FI/mff4Aos1rdc4DZJ1Q4sPanZ+hCPb02vFuoKDuMLASIc981ZA2+AcgSsNipElqCJOYp+GvdAfRkt6DpZVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768423313; c=relaxed/simple;
	bh=xks1CkG37ZPOINd1xjIH3n2/FSSeQbbO+pHUnZtsvLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YqMfzAG11q5YZL5Jf8QDWbTrfyZSMLgqNAblHiygAxf2SnkGx7PrXpayiiWccvSIzg3T8SqTWGXXXQhHrG1EMLI0FlIsELRM+D/+S128ldHj+AAlkSXvQZk7vgMmA16vBvHClchiZIWk10Eeca21pzbVKgkrqS3f6vJAgAmjQh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ipxtyX4Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ipxtyX4Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56940C4CEF7;
	Wed, 14 Jan 2026 20:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768423313;
	bh=xks1CkG37ZPOINd1xjIH3n2/FSSeQbbO+pHUnZtsvLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ipxtyX4Zh1fNUT13+4Nrjgk32/0w618CWJ40BdCQk3dzZOtYHMQxtO3C9zaB/Zflv
	 82qrSZ1amcwGBXPa0cbru+k/oEaeVMCcMVuHW7t9hUfP7dA4QHUQcr7Enyy/S+lRVM
	 gJlzu9YAaV1skPbWzR4lV/FiiUHEt5cZRrBFvx6CTiqtqiobZSAyzb4lDZcQIYhZWi
	 +0BDbt0l1y2Iw1Ca16KyqUCHF1Cink4UxVFTAF5Vmnz7GwrIA47jjSeNo1vfTCaldn
	 SLb2Wu2QfdObSm+OZtkrkRBdiYR9yhQEKbwf5+ASh2bEnq6V7BHBNxyyoRvrwTIMvZ
	 SQwWW46DJkpzw==
Date: Wed, 14 Jan 2026 20:41:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Guodong Xu <guodong@riscstar.com>, Jonathan Corbet <corbet@lwn.net>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>, Yixun Lan <dlan@gentoo.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] Documentation: riscv: uabi: Clarify ISA spec version
 for canonical order
Message-ID: <20260114-outdoors-favorable-2105f50048c3@spud>
References: <20260113-adding-b-dtsi-v1-0-22d6e55d19df@riscstar.com>
 <20260113-adding-b-dtsi-v1-1-22d6e55d19df@riscstar.com>
 <dc610e3e-48f4-5df4-4929-fafeab9c381f@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vVgGIcdJNqOfMBsr"
Content-Disposition: inline
In-Reply-To: <dc610e3e-48f4-5df4-4929-fafeab9c381f@kernel.org>


--vVgGIcdJNqOfMBsr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 12:22:54PM -0700, Paul Walmsley wrote:
> On Tue, 13 Jan 2026, Guodong Xu wrote:
>=20
> > Specify that chapter 27 refers to version 20191213 of the RISC-V ISA
> > Unprivileged Architecture. The chapter numbering differs across
> > specification versions - for example, in version 20250508, the ISA
> > Extension Naming Conventions is chapter 36, not chapter 27.
> >=20
> > Historical versions of the RISC-V specification can be found via Link [=
1].
> >=20
> > Link: https://riscv.org/specifications/ratified/ [1]
> > Fixes: f07b2b3f9d47 ("Documentation: riscv: add a section about ISA str=
ing ordering in /proc/cpuinfo")
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
>=20
> Conor, want to take this one if you pick up the subsequent patch?  If so,

Nah, I think you should take this. The subsequent bit is going to be
split into several patches for different trees. Not sure if any of it is
for me.

--vVgGIcdJNqOfMBsr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaWf/igAKCRB4tDGHoIJi
0l04AQD48ns7/JCoOSGHlDk+xE/Gtd9uFdFZLKvr+VZq53AaEAEAjxqK7NkGZZWt
R8s+ZMI8YyQiTtPHiJpgB4NxXJMSnAY=
=+NUi
-----END PGP SIGNATURE-----

--vVgGIcdJNqOfMBsr--
