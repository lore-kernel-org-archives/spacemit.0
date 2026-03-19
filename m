Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1AA344D8B
	for <spacemit@lists.linux.dev>; Thu, 19 Mar 2026 11:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773920587; cv=none; b=otvzQApaGhD+DOGPfKCIHem92SRvtRmShb6D+WvB7nA8+99GvfVDG2gIeofb4Lj7uofIYuU3Na73vwwN8uAanebO2i+4XTz7Nq5nKY9vYG3WnF2vZnw9iTGdL3qA5m3THvBM/YpwDr6t/rbUxOqC1DwVjA+poX40nXQvrjse+2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773920587; c=relaxed/simple;
	bh=WD3OhxPt7AGwPXXUuX04Kf61gHCpJaNK7fNNQEm3uaA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PM+gp+I56SslAi0keFXGL4/+bqz1kTGu3SGcGQvSy3AWaCWzUJzrycPF+kkR7t3WgpHQkS1+SnhHkdNuM3bCY5Vv0AkDR88PcYlgYFYJK/9fp6X5PApqV90vrAzpZqyc2sLfQGZSDJXk/paPaSEmMiIPpEIA2/CxITr3Fg9zPyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w3Bm5-0007xc-Cs; Thu, 19 Mar 2026 12:42:49 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w3Bm3-0014CP-2s;
	Thu, 19 Mar 2026 12:42:47 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w3Bm3-00000000Byb-3NCL;
	Thu, 19 Mar 2026 12:42:47 +0100
Message-ID: <c0a6d0346e2b766ab4dab3340445c45843f28b60.camel@pengutronix.de>
Subject: Re: [PATCH v3] reset: spacemit: k3: Decouple composite reset lines
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Junzhong Pan
 <junzhong.pan@spacemit.com>, Guodong Xu	 <guodong@riscstar.com>,
 devicetree@vger.kernel.org, 	linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, 	linux-kernel@vger.kernel.org, Inochi Amaoto
 <inochiama@gmail.com>
Date: Thu, 19 Mar 2026 12:42:47 +0100
In-Reply-To: <20260318131043-GKA488271@kernel.org>
References: <20260317-01-k3-reset-usb-pci-v3-1-e4b9a43c7d45@kernel.org>
	 <3e9022faae3dc6f5066a1e7cc3752a0193a55bc9.camel@pengutronix.de>
	 <20260318131043-GKA488271@kernel.org>
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

On Mi, 2026-03-18 at 21:10 +0800, Yixun Lan wrote:
> Hi Philipp,
>=20
> On 13:39 Wed 18 Mar     , Philipp Zabel wrote:
> > On Di, 2026-03-17 at 02:36 +0000, Yixun Lan wrote:
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
> > >=20
> > > As an agreement with maintainer, the reset IDs has been rearranged as
> > > contiguous number and pushed as a fix for the driver, and reason is t=
hat
> > > there isn't any consumer of reset driver so far,
> >=20
> > Unfortunately that does not seem to be the case for all APMU resets.
> > A lore query for all changed IDs [1] yields a patch that adds ethernet
> > device nodes using RESET_APMU_EMAC[012] [2].
> >=20
> Yes, although the ethernet use this ID, but I don't think we should worry
> about that, since the ethernet patch is still under review, and ideally i=
t
> will be merged after this reordering patch, unless you disagree? and insi=
st
> the RESET_APMU_EMAC should not be changed?

Yes, please. Somebody might have picked up those patches from the list
and we can easily avoid the risk of breaking their ethernet with v7.0
by not reordering all resets. Let's do that.

regards
Philipp
