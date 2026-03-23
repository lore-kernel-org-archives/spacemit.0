Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C83838B7D5
	for <spacemit@lists.linux.dev>; Mon, 23 Mar 2026 11:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774265828; cv=none; b=IuGZLJFU9dNw+mO8pAIbMtmMU3fpdCdEEZCMhG6IlBtT3weqcx1JD8EciHFanPoofPEy6tEOzAT7HtZfGmwPSoX4arv14+dd+3DjVUMmgOUzT6MXJDzgbtF3EjtW6IEzF7aQqRpqLPGE1asUcvVjWl/UfpYk5Vg4QQZGznhd5Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774265828; c=relaxed/simple;
	bh=FRgn3lsQ4WipleRDhz3dCVtXCFh0d+7+07l0MWI/kSk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=miL8Sd0WHH3oiHBRUGNf1D7xlgECYM+rSbwv20r74k3/jq1jozQQRGg+t91u/jxty6L73HDk8HgxbWW1wR0ZSlFlvYZIvlorZ/Y6gzDRWdgvUyDCnOdUedy2Yjp658MVNlzReLz8bsLcuuT54NAXZOH/ER6eZr0JpV/oBdqO2UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w4daX-0000Ls-Sg; Mon, 23 Mar 2026 12:36:53 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w4daX-001ie6-2D;
	Mon, 23 Mar 2026 12:36:53 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w4daX-000000007eB-2SFH;
	Mon, 23 Mar 2026 12:36:53 +0100
Message-ID: <b3fa66f776ddf5bd8b289d5780df40de13de8434.camel@pengutronix.de>
Subject: Re: [PATCH v5] reset: spacemit: k3: Decouple composite reset lines
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Conor Dooley <conor@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Junzhong Pan	 <junzhong.pan@spacemit.com>, Guodong Xu
 <guodong@riscstar.com>, 	devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, 	spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Mon, 23 Mar 2026 12:36:53 +0100
In-Reply-To: <20260320-starlit-isolation-40c3c80e77a4@spud>
References: <20260320-01-k3-reset-usb-pci-v5-1-07f4a5ddd728@kernel.org>
	 <272ed19e2c0d8c9f53b6e621c01dc09f0635bf9d.camel@pengutronix.de>
	 <20260320-starlit-isolation-40c3c80e77a4@spud>
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

On Fr, 2026-03-20 at 17:57 +0000, Conor Dooley wrote:
> On Fri, Mar 20, 2026 at 01:02:04PM +0100, Philipp Zabel wrote:
> > On Fr, 2026-03-20 at 11:06 +0000, Yixun Lan wrote:
> > > Instead of grouping several different reset lines into one composite
> > > reset, decouple them to individual ones which make it more aligned
> > > with underlying hardware. And for DWC USB driver, it will match well
> > > with the number of the reset property in the DT bindings.
> > >=20
> > > The DWC3 USB host controller in K3 SoC has three reset lines - AHB, V=
CC,
> > > PHY. The PCIe controller also has three reset lines - DBI, Slave, Mas=
ter.
> > > Also three reset lines each for UCIE and RCPU block.
> >=20
> > Although I can't validate correctness of the id-to-bit assignments, the
> > changes look consistent.
> >=20
> > I trust that the reason for the grouped reset lines was just
> > convenience, and not some hardware limitation that requires them to be
> > controlled at the same time.
> >=20
> > There are no patches using the USB/UCIE/RCPU/PCIE resets found on lore,
> > so this is not an ABI break.
> >=20
>=20
> Eh, I think it's an ABI break either way, but it is being done fast
> enough that there's no users since this is new as of -rc1.
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Just be careful Yixun that U-Boot doesn't import and starting using it,
> I forget if they use -rc1 or released kernels as their import point.

Thank you, I'll look out for that. The previous dts/upstream updates
all use final release tags, so this should be safe for U-Boot.

regards
Philipp
