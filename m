Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54D4254B18
	for <spacemit@lists.linux.dev>; Fri, 20 Mar 2026 09:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773999983; cv=none; b=rec6zxikShgKnO7hURmXDKPRtrBGLvJE3qxcJ+EDiH/I+rbK+qqjf6Kf62KXSAwbMpLAx6rRgeEp8z+6KyninUo44+Z+kMIJEqKL3znZIXUKexDBhj05oPc1V6witInV06Ldbd7DlGQR2bbHVgRk2orvqlvgZHXkJKLA9G32wvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773999983; c=relaxed/simple;
	bh=T1njKK6NL5/ll5maFGIb/AHc30gA7d06rrJchFIQbNk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HyAyLPX5rS0DrCJr7cwbl10C0AtaHsFBZu4HncmY8drTdruMwBoVI2M+sEQtC9BF/yiEHVe6jbF20yziyMOqc7Uf5ub9kQm2D018VPMjvTKpPE9CE2LZt8cFqpj9C7QG9wiHvEsn3pRJcGgauZjIEGg4n4yGWCBXFNYj1Uer8To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w3WQO-0008JH-6B; Fri, 20 Mar 2026 10:45:48 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w3WQN-001Dhj-1Z;
	Fri, 20 Mar 2026 10:45:47 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w3WQN-000000003mj-1jdq;
	Fri, 20 Mar 2026 10:45:47 +0100
Message-ID: <a3d34ebb16b9ce19c0b81ce07f26ed6b1f73bdaf.camel@pengutronix.de>
Subject: Re: [PATCH v4] reset: spacemit: k3: Decouple composite reset lines
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Junzhong Pan <junzhong.pan@spacemit.com>, Guodong Xu
 <guodong@riscstar.com>, 	devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, 	spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Fri, 20 Mar 2026 10:45:47 +0100
In-Reply-To: <20260320-01-k3-reset-usb-pci-v4-1-7b4950c1d9e2@kernel.org>
References: <20260320-01-k3-reset-usb-pci-v4-1-7b4950c1d9e2@kernel.org>
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

On Fr, 2026-03-20 at 06:51 +0000, Yixun Lan wrote:
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
> contiguous number but keep EMAC part unchanged to avoid break patches
> which already sent to mailing list. The changes of DT binding header file
> and reset driver are merged together as one single commit to avoid
> git-bisect breakage.
>=20
> Fixes: 938ce3b16582 ("reset: spacemit: Add SpacemiT K3 reset driver")
> Fixes: 216e0a5e98e5 ("dt-bindings: soc: spacemit: Add K3 reset support an=
d IDs")
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
> Previously, the reset of The USB and PCIe was submited as a composite
> reset, try to decouple them in this series.
>=20
> The motivation behind is that it will will make the result more aligned
> with the hardware which describe them as different reset lines, and also
> match with the K3 dwc3 DT binding which request different reset,=20
> K1 and K3 SoC share same topology of the reset line design.
>=20
> See the reset part info in binding doc
> Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
>=20
> In V2, I've visited through whole reset driver and decouple more resets,
> which include the block - UCIE and RPCU. Also add an explanation of why
> rearrange the reset IDs as contiguous number.
>=20
> In V4, I've rearranged all reset IDs to keep them linear(no hole), while
> keep EMAC part IDs unchanged, this still bring lots changes to ID number,
> let me know if it's ok.

It would be safer to just keep all reset=C2=A0IDs that don't have to be
split unchanged. Patches using them are trickling in.

The search for changed IDs [1] now yields a user of RESET_APMU_DMA [2].

[1] https://lore.kernel.org/all/?q=3Ddfb:RESET_APMU_USB2%20OR%20dfb:RESET_A=
PMU_USB3_PORTA%20OR%20dfb:RESET_APMU_USB3_PORTB%20OR%20dfb:RESET_APMU_USB3_=
PORTC%20OR%20dfb:RESET_APMU_USB3_PORTD%20OR%20dfb:RESET_APMU_QSPI%20OR%20df=
b:RESET_APMU_QSPI_BUS%20OR%20dfb:RESET_APMU_DMA%20OR%20dfb:RESET_APMU_AES_W=
TM%20OR%20dfb:RESET_APMU_MCB_DCLK%20OR%20dfb:RESET_APMU_MCB_ACLK%20OR%20dfb=
:RESET_APMU_VPU%20OR%20dfb:RESET_APMU_DTC%20OR%20dfb:RESET_APMU_GPU%20OR%20=
dfb:RESET_APMU_ALZO%20OR%20dfb:RESET_APMU_MC%20OR%20dfb:RESET_APMU_CPU0_POP=
%20OR%20dfb:RESET_APMU_CPU0_SW%20OR%20dfb:RESET_APMU_CPU1_POP%20OR%20dfb:RE=
SET_APMU_CPU1_SW%20OR%20dfb:RESET_APMU_CPU2_POP%20OR%20dfb:RESET_APMU_CPU2_=
SW%20OR%20dfb:RESET_APMU_CPU3_POP%20OR%20dfb:RESET_APMU_CPU3_SW%20OR%20dfb:=
RESET_APMU_C0_MPSUB_SW%20OR%20dfb:RESET_APMU_CPU4_POP%20OR%20dfb:RESET_APMU=
_CPU4_SW%20OR%20dfb:RESET_APMU_CPU5_POP%20OR%20dfb:RESET_APMU_CPU5_SW%20OR%=
20dfb:RESET_APMU_CPU6_POP%20OR%20dfb:RESET_APMU_CPU6_SW%20OR%20dfb:RESET_AP=
MU_CPU7_POP%20OR%20dfb:RESET_APMU_CPU7_SW%20OR%20dfb:RESET_APMU_C1_MPSUB_SW=
%20OR%20dfb:RESET_APMU_MPSUB_DBG%20OR%20dfb:RESET_APMU_UCIE%20OR%20dfb:RESE=
T_APMU_RCPU%20OR%20dfb:RESET_APMU_DSI4LN2_ESCCLK%20OR%20dfb:RESET_APMU_DSI4=
LN2_LCD_SW%20OR%20dfb:RESET_APMU_DSI4LN2_LCD_MCLK%20OR%20dfb:RESET_APMU_DSI=
4LN2_LCD_DSCCLK%20OR%20dfb:RESET_APMU_DSI4LN2_DPU_ACLK%20OR%20dfb:RESET_APM=
U_DPU_ACLK%20OR%20dfb:RESET_APMU_UFS_ACLK%20OR%20dfb:RESET_APMU_EDP0%20OR%2=
0dfb:RESET_APMU_EDP1%20OR%20dfb:RESET_APMU_PCIE_PORTA%20OR%20dfb:RESET_APMU=
_PCIE_PORTB%20OR%20dfb:RESET_APMU_PCIE_PORTC%20OR%20dfb:RESET_APMU_PCIE_POR=
TD%20OR%20dfb:RESET_APMU_PCIE_PORTE
[2] https://lore.kernel.org/all/20260317-k3-pdma-v1-1-f39d3e97b53a@linux.sp=
acemit.com/

Which means

#define RESET_APMU_DMA           23

should stay unchanged as well.

regards
Philipp
