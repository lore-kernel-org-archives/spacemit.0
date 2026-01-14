Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15FD246782;
	Wed, 14 Jan 2026 20:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768423367; cv=none; b=qz3fNYX0wR/Yip1go/KRiPcfOmobIb6Bq/7PtCYFt+pZASlkFmwWkZFWUzMNqRlijJDgWlW/xOVa3CWSwtm8fFXbIw5paTUsox67c/8Xth9WufH0PyskJpUNoTIuPRKnxAdfc8yWvsNwgHDDuZ3HLpbX+wTe8ckTkfXAA3/ibIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768423367; c=relaxed/simple;
	bh=pgnq+h4lcaecFQm8g3LERlvcaCOaQlkNzhkCzWyD7/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V+zEdb79sj0LYz300pcjMA3IptSbOqM/eDFYA8LsXMABniJB5RdmLwwMI5sbuppIpYmQPBTWB7FeegdpdATYwi+skKIFVHZVcyox+Wu5s8b+lNkdePBSKr0mkuRtBaYamCtuc2Ov3FHz5cx03VFIzRS8e510McOe9Czuxr5ZYwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ifzLZ/+G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ifzLZ/+G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E95C4CEF7;
	Wed, 14 Jan 2026 20:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768423367;
	bh=pgnq+h4lcaecFQm8g3LERlvcaCOaQlkNzhkCzWyD7/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ifzLZ/+G9uQ8yxnhdPHPfY5Z3W/SS5WrG1uTYHIi2nApxWMAcupS1fyKtKNEqWnrJ
	 DHMgKB5jp4B4973L8g/CEvBlVcpsLVIx++SWWNCb1L2/qdBFtcPhOsBE+1SxHCCoMq
	 tJFrOKF/UP+jPXT0ySS1INraAJODE640a4I5WRLIfO9zQNjmx0wyxvcDSzPVLeopR6
	 bY0xVFxSmH0e3IVp2PjdFT7aQtCbFIbvqMBPEXNm/4m72aN12bWuTT6pGUa8aypdpq
	 Y9ceXzl129WMVO8Z2EXAs8ALJQH0gpaprAwp0i8jHy/2z54/o1UCTDdgiZH4q0DFqF
	 I3Kly4Wb+9Ukg==
Date: Wed, 14 Jan 2026 20:42:41 +0000
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Yixun Lan <dlan@gentoo.org>, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 2/2] riscv: dts: Add "b" ISA extension to existing
 devicetrees
Message-ID: <20260114-evergreen-gluten-b1c8558e7684@spud>
References: <20260113-adding-b-dtsi-v1-0-22d6e55d19df@riscstar.com>
 <20260113-adding-b-dtsi-v1-2-22d6e55d19df@riscstar.com>
 <20260113075339-GYA25466@gentoo.org>
 <CAH1PCMarzrZJ072iyAQthB-i-LHFCSJ+tZLx6HcWiVcUrQeafw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZDthVf/8OEPBoP0Y"
Content-Disposition: inline
In-Reply-To: <CAH1PCMarzrZJ072iyAQthB-i-LHFCSJ+tZLx6HcWiVcUrQeafw@mail.gmail.com>


--ZDthVf/8OEPBoP0Y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 10:33:34AM +0800, Guodong Xu wrote:
> Hi, Conor, Yixun
>=20
> On Tue, Jan 13, 2026 at 3:53=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
> >
> > Hi Guodong,
> >
> >
> > On 15:45 Tue 13 Jan     , Guodong Xu wrote:
> > > "b" is ratified (Apr/2024) much later than its components zba/zbb/zbs
> > > (Jun/2021). With "b" added into riscv/extensions.yaml, a dependency
> > > checking rule is now enforced, which requires that when zba, zbb, and=
 zbs
> > > are all specified, "b" must be added as well. Failing to do this will
> > > cause dtbs_check schema check warnings.
> > >
> > > According to uabi.rst, as a single-letter extension, "b" should be ad=
ded
> > > after "c" in canonical order.
> > >
> > > Update existing devicetree files to conform to this rule. Line balanc=
ing
> > > is performed where needed to improve readability.
> > >
> > > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > > ---
> > >  arch/riscv/boot/dts/anlogic/dr1v90.dtsi     |   5 +-
> > >  arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 256 ++++++++++++++----=
----------
> > >  arch/riscv/boot/dts/spacemit/k1.dtsi        |  32 ++--
> > >  3 files changed, 147 insertions(+), 146 deletions(-)
> > please have separated patch for different SoCs, so they can go via
>=20
> Understand your concern.
>=20
> > their own SoC tree.. thanks
>=20
> Conor, is it possible to take this as one patch instead?
>=20
> It fixes the same dtbs_check warnings from riscv/extensions.yaml across t=
hree
> SoCs. Keeping them together maintains readability and clear tracking, IMH=
O.
>=20
> Happy to split if needed, but wanted to check first.

I'd rather you split it, sorry.

--ZDthVf/8OEPBoP0Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaWf/wQAKCRB4tDGHoIJi
0g2OAP41lDTLoHw2ey77+Zb0hIinJHKWR1OGlwRDWsqQC8dG1QEAuQ5DjAncDZ8e
aSAgVSyVjvbWxg0rBa1e7p4ORk0iWww=
=XHL2
-----END PGP SIGNATURE-----

--ZDthVf/8OEPBoP0Y--
