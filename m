Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6D7399025
	for <spacemit@lists.linux.dev>; Fri, 13 Mar 2026 15:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773414537; cv=none; b=o7yTTCzfynRTa5xY24eoYHCCwBciYuYoFWYkcnJKicP9Yd0+hXy3/9362gh3eDj8VmFfI5GpUVBXhmZEeo2//r3yUZBV2KaPvmQx+7cy8PXtyBe4R3sHEbty3z3sH6WYIkGGyjzwPeMqi7tusHJwAo7LdBDyiyG7nvhXsuRu1hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773414537; c=relaxed/simple;
	bh=WAC55lBx6LNL+V/n66gAxIC62fblXVBUl3sQpF7S5ME=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=faghcJ+bNc8dG6RXEK/8hU1svYj4c7IiuDW9ujFwSwRFZR7hF1aTcHt3w92Nek5NhZYEw7zl61q8CkLEZCaEbecWllHYPtY/r8lBiOe4PwiF4MyR3KiWQEzi/NVz94XA6u+ScCYPIS0LoHILkVlasulWiA01IepEjqzO2S2f3qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w147y-0004k8-ID; Fri, 13 Mar 2026 16:08:38 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w147x-00068r-1l;
	Fri, 13 Mar 2026 16:08:37 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w147s-00000000EEN-1tEc;
	Fri, 13 Mar 2026 16:08:32 +0100
Message-ID: <f23191e03d9f77e0288d6d660b8c45cd6389a533.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] dt-bindings: soc: spacemit: k3: Decouple composite
 reset lines
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Junzhong Pan
 <junzhong.pan@spacemit.com>, Guodong Xu	 <guodong@riscstar.com>,
 devicetree@vger.kernel.org, 	linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, 	linux-kernel@vger.kernel.org
Date: Fri, 13 Mar 2026 16:08:32 +0100
In-Reply-To: <20260312112858-GKH302167@kernel.org>
References: <20260312-01-k3-reset-usb-pci-v1-0-022b24b7340f@kernel.org>
	 <20260312-01-k3-reset-usb-pci-v1-1-022b24b7340f@kernel.org>
	 <0abfd76f49e5cedf7bfc84eb4d9a0a1d7543f6f8.camel@pengutronix.de>
	 <20260312112858-GKH302167@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: spacemit@lists.linux.dev

On Do, 2026-03-12 at 19:28 +0800, Yixun Lan wrote:
> Hi Philipp,
>=20
> On 12:09 Thu 12 Mar     , Philipp Zabel wrote:
> > On Do, 2026-03-12 at 10:34 +0000, Yixun Lan wrote:
> > > Instead of grouping several different reset lines into one composite
> > > reset, decouple them to individual ones which make it more aligned
> > > with underlying hardware.
> > >=20
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
> No, there is currently no consumers,

Good, that will make things easier.

> so I could rework them into a contiguous version, thanks for the suggesti=
on
>=20
> > Also, this breaks bisectability.
> > reset-spacemit-k3.c will fail to compile between patches 1 and 2.
> >=20
> I've tried a first version to squash the two patches, but got a checkpatc=
h.pl complait
> for binding should follow into a separate patch.
>=20
> I can combine these two patches into one, is this Ok for you?

I'm in favor of fixing both the APMU defines and the only existing
user, the reset driver, in a single patch. Explain it well,=C2=A0add Fixes:
216e0a5e98e5 and 938ce3b16582 tags, and then I can apply it on the
reset/fixes branch in time for v7.0.

regards
Philipp
