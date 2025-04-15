Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3D827A12B
	for <spacemit@lists.linux.dev>; Tue, 15 Apr 2025 08:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744707218; cv=none; b=WIE5UW626eQaX4x7tpk9GFwkwsGZzJS5CBFdXYaiVOO1ymIO6iY0/F7R7kP3+0aS0L7PILIUOpr3RT7wg6JIGLaDs+zpI+X/BHvIjwAxc5PybbkdyJ20X8vfOTApxo2s38b0xeIUpoeZFjFHskigMtHnJAl84b9LCfMp8HnVjwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744707218; c=relaxed/simple;
	bh=1JQts2RTv7RmyS6fNpRWxHBgq3NtsoZVF2mSxQgpZB0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ESEG4ckpkdei4kNwgd7u31+DscQX/hz3xvYF1CL8OWeB5mRg4nSEBzqKu1paej3HJ/softuTLW1SokiA79eevmWahNI3fm1wcM3jXut1dLpKgsNFytt2/AJ7R97hKzTSiOvwTmjbZkSpAx+wNPkL/sA/ITYWWpPLTek2B84vax4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u4c2O-00072J-DA; Tue, 15 Apr 2025 10:53:00 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u4c2L-000OEt-1G;
	Tue, 15 Apr 2025 10:52:57 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u4c2L-0004e1-0w;
	Tue, 15 Apr 2025 10:52:57 +0200
Message-ID: <89b6142bacecd4a7742341b88dc1e28c4454527a.camel@pengutronix.de>
Subject: Re: [PATCH 1/9] dt-bindings: pwm: marvell,pxa: add optional
 property resets
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Conor Dooley <conor@kernel.org>, Guodong Xu <guodong@riscstar.com>
Cc: ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org,  paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr,  dlan@gentoo.org, drew@pdp7.com,
 inochiama@gmail.com, geert+renesas@glider.be,  heylenay@4d2.org,
 tglx@linutronix.de, hal.feng@starfivetech.com,  unicorn_wang@outlook.com,
 duje.mihanovic@skole.hr, elder@riscstar.com,  linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org,  spacemit@lists.linux.dev
Date: Tue, 15 Apr 2025 10:52:57 +0200
In-Reply-To: <20250411-confider-spinster-35f23040d188@spud>
References: <20250411131423.3802611-1-guodong@riscstar.com>
	 <20250411131423.3802611-2-guodong@riscstar.com>
	 <20250411-confider-spinster-35f23040d188@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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

On Fr, 2025-04-11 at 17:44 +0100, Conor Dooley wrote:
> On Fri, Apr 11, 2025 at 09:14:15PM +0800, Guodong Xu wrote:
> > Add an optional resets property for the Marvell PWM PXA binding.
> >=20
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> >  Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml=
 b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> > index 9ee1946dc2e1..9640d4b627c2 100644
> > --- a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> > +++ b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> > @@ -31,6 +31,9 @@ properties:
> >    clocks:
> >      maxItems: 1
> > =20
> > +  resets:
> > +    maxItems: 1
>=20
> Do any of the currently supported devices use a reset? If not, then add
> this in tandem with the new compatible and only allow it there please.

Also, if spacemit,k1-pwm can not work without the reset being
deasserted, mark it as required.

The driver can still use reset_control_get_optional.

regards
Philipp
