Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2AB322B88
	for <spacemit@lists.linux.dev>; Wed, 18 Mar 2026 12:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773837604; cv=none; b=U8AvZu3VIpTHfa0WcpVdolUmFtouBPxM2ja3QFXkPpipjXSC9BnqQc+k5D7mkn34sZ/r/Mx5kHj+oE1kIqYRZJM//uus7x8pzPmg/PIQz/4KXs+sja1XXctdTGnSDmFiA9cLjbugm53Yz7fQOJrTngvqllANWXAM2m9uMfi4yPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773837604; c=relaxed/simple;
	bh=2ogj76zhqhmxdVnoHmHagIWkf+8xLWmelrn3mfxdUaM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j0dRg8lZR31wwAkykwLPl0W4Uw6j6PqflIni81Z8wiPnup3yQM9XUmZ6f/Pf2CRI7BwhZqgjrpkTouGMQebGn2jkfaENnOuA7TaquSq/VZ0Ol7aVr0KooHAozZdeJ07Z4oguitdgINhMPN6Y/u86m5KZk8J8grmbJzLxXMPtZOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w2qBf-0001Qv-Cj; Wed, 18 Mar 2026 13:39:47 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w2qBe-000uRl-2b;
	Wed, 18 Mar 2026 13:39:46 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w2qBe-000000009ES-30Jx;
	Wed, 18 Mar 2026 13:39:46 +0100
Message-ID: <3e9022faae3dc6f5066a1e7cc3752a0193a55bc9.camel@pengutronix.de>
Subject: Re: [PATCH v3] reset: spacemit: k3: Decouple composite reset lines
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Junzhong Pan <junzhong.pan@spacemit.com>, Guodong Xu
 <guodong@riscstar.com>, 	devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, 	spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, Inochi Amaoto	 <inochiama@gmail.com>
Date: Wed, 18 Mar 2026 13:39:46 +0100
In-Reply-To: <20260317-01-k3-reset-usb-pci-v3-1-e4b9a43c7d45@kernel.org>
References: <20260317-01-k3-reset-usb-pci-v3-1-e4b9a43c7d45@kernel.org>
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

On Di, 2026-03-17 at 02:36 +0000, Yixun Lan wrote:
> Instead of grouping several different reset lines into one composite
> reset, decouple them to individual ones which make it more aligned
> with underlying hardware. And for DWC USB driver, it will match well
> with the number of the reset property in the DT bindings.
>=20
> The DWC3 USB host controller in K3 SoC has three reset lines - AHB, VCC,
> PHY. The PCIe controller also has three reset lines - DBI, Slave, Master.
> Also three reset lines each for UCIE and RCPU block.
>=20
> As an agreement with maintainer, the reset IDs has been rearranged as
> contiguous number and pushed as a fix for the driver, and reason is that
> there isn't any consumer of reset driver so far,

Unfortunately that does not seem to be the case for all APMU resets.
A lore query for all changed IDs [1] yields a patch that adds ethernet
device nodes using RESET_APMU_EMAC[012] [2].

[1] https://lore.kernel.org/all/?q=3Ddfb%3ARESET_APMU_USB2+OR+dfb%3ARESET_A=
PMU_USB3_PORTA+OR+dfb%3ARESET_APMU_USB3_PORTB+OR+dfb%3ARESET_APMU_USB3_PORT=
C+OR+dfb%3ARESET_APMU_USB3_PORTD+OR+dfb%3ARESET_APMU_QSPI+OR+dfb%3ARESET_AP=
MU_QSPI_BUS+OR+dfb%3ARESET_APMU_DMA+OR+dfb%3ARESET_APMU_AES_WTM+OR+dfb%3ARE=
SET_APMU_MCB_DCLK+OR+dfb%3ARESET_APMU_MCB_ACLK+OR+dfb%3ARESET_APMU_VPU+OR+d=
fb%3ARESET_APMU_DTC+OR+dfb%3ARESET_APMU_GPU+OR+dfb%3ARESET_APMU_ALZO+OR+dfb=
%3ARESET_APMU_MC+OR+dfb%3ARESET_APMU_CPU0_POP+OR+dfb%3ARESET_APMU_CPU0_SW+O=
R+dfb%3ARESET_APMU_CPU1_POP+OR+dfb%3ARESET_APMU_CPU1_SW+OR+dfb%3ARESET_APMU=
_CPU2_POP+OR+dfb%3ARESET_APMU_CPU2_SW+OR+dfb%3ARESET_APMU_CPU3_POP+OR+dfb%3=
ARESET_APMU_CPU3_SW+OR+dfb%3ARESET_APMU_C0_MPSUB_SW+OR+dfb%3ARESET_APMU_CPU=
4_POP+OR+dfb%3ARESET_APMU_CPU4_SW+OR+dfb%3ARESET_APMU_CPU5_POP+OR+dfb%3ARES=
ET_APMU_CPU5_SW+OR+dfb%3ARESET_APMU_CPU6_POP+OR+dfb%3ARESET_APMU_CPU6_SW+OR=
+dfb%3ARESET_APMU_CPU7_POP+OR+dfb%3ARESET_APMU_CPU7_SW+OR+dfb%3ARESET_APMU_=
C1_MPSUB_SW+OR+dfb%3ARESET_APMU_MPSUB_DBG+OR+dfb%3ARESET_APMU_UCIE+OR+dfb%3=
ARESET_APMU_RCPU+OR+dfb%3ARESET_APMU_DSI4LN2_ESCCLK+OR+dfb%3ARESET_APMU_DSI=
4LN2_LCD_SW+OR+dfb%3ARESET_APMU_DSI4LN2_LCD_MCLK+OR+dfb%3ARESET_APMU_DSI4LN=
2_LCD_DSCCLK+OR+dfb%3ARESET_APMU_DSI4LN2_DPU_ACLK+OR+dfb%3ARESET_APMU_DPU_A=
CLK+OR+dfb%3ARESET_APMU_UFS_ACLK+OR+dfb%3ARESET_APMU_EDP0+OR+dfb%3ARESET_AP=
MU_EDP1+OR+dfb%3ARESET_APMU_PCIE_PORTA+OR+dfb%3ARESET_APMU_PCIE_PORTB+OR+df=
b%3ARESET_APMU_PCIE_PORTC+OR+dfb%3ARESET_APMU_PCIE_PORTD+OR+dfb%3ARESET_APM=
U_PCIE_PORTE+OR+dfb%3ARESET_APMU_EMAC0+OR+dfb%3ARESET_APMU_EMAC1+OR+dfb%3AR=
ESET_APMU_EMAC2+OR+dfb%3ARESET_APMU_ESPI_MCLK+OR+dfb%3ARESET_APMU_ESPI_SCLK
[2] https://lore.kernel.org/all/20260318035542.517554-1-inochiama@gmail.com=
/

Please reorder the resets such that only the decoupled lines get new
numbers. Especially EMAC resets should keep the same value.

> so should not cause any ABI breakage.
>
> Also, the changes of DT binding header file and reset
> driver are merged together as one single commit to avoid git-bisect
> breakage.

This addresses the only remaining checkpatch-warning:

  WARNING: DT binding docs and includes should be a separate patch. See: Do=
cumentation/devicetree/bindings/submitting-patches.rst

which is ignored on purpose to avoid a bisection hazard.

> Fixes: 938ce3b16582 ("reset: spacemit: Add SpacemiT K3 reset driver")
> Fixes: 216e0a5e98e5 ("dt-bindings: soc: spacemit: Add K3 reset support an=
d IDs")
> Signed-off-by: Yixun Lan <dlan@kernel.org>

regards
Philipp
