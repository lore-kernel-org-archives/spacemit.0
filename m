Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1FD3D75CD;
	Wed, 18 Mar 2026 13:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773839446; cv=none; b=NUSIaCalieuVzo/ICxe3OLIIe3Y+ZjLKC7PyJQiu7rZyCnu9TuAhOb0IlMH0vPO1LJyKzU2eSZF9OlH5mcyADlB7CLlJZaRMnLwGQMjWKeOr3cqbek5/sJwbwm6Efva4SmRm0XHIMniUrEjjnaZ/BqrVTf5MLuKVKGOxrjVh194=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773839446; c=relaxed/simple;
	bh=gPU1ClQ6+Ep52PUchjVnFrsFHmBmnXK3sRcxeJG3IDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dcv0PxXFPZ8Syv+qQ2hOfoqUSDqX2mEQ0r1tKMWJjHPxC2MGfrJZDxQjzGYjh01XOs3/2HvFowfefM4VkS082apD84i77yRjPXnJ7Oyf2bdyWBSS0SRfdc/PCxw/hMxBODnvs4KiRURSYkT/Pt/thlKPkyS2uNYaE+bIwSrwCI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KmSr1DaX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KmSr1DaX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CC7AC2BCAF;
	Wed, 18 Mar 2026 13:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773839445;
	bh=gPU1ClQ6+Ep52PUchjVnFrsFHmBmnXK3sRcxeJG3IDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KmSr1DaXiYWC5S/3tZLCUuKwaDRgXiBt1JieiZDmmWkS11a/UWK4V3w5wWWl649AL
	 DZz9sTq1DKuyqntEdeUBoUsfL2/2QI3VmHvHR7Dnqi+0ZS7MXksktFqdq9P134BcXg
	 UaYRoNLlpL2Ll+CX0IVWPfJMo5SpaIbMNFHTZoM2HCqLUeQ23pfHtZugDgIyGL2Ev7
	 0z/80suLcti3bxCgdS/kI2oqm3+mHCHyfdrby7jkdCDS4J0a8x/rDgotoaiqBxsWOA
	 laUOaiZTJdXfaVn0bEsWkjAH9m+i6BhDBCpNTz/g4jvUpfXQHn95klDLbEauzdGMn5
	 5t/GPal069AaA==
Date: Wed, 18 Mar 2026 21:10:43 +0800
From: Yixun Lan <dlan@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Junzhong Pan <junzhong.pan@spacemit.com>,
	Guodong Xu <guodong@riscstar.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH v3] reset: spacemit: k3: Decouple composite reset lines
Message-ID: <20260318131043-GKA488271@kernel.org>
References: <20260317-01-k3-reset-usb-pci-v3-1-e4b9a43c7d45@kernel.org>
 <3e9022faae3dc6f5066a1e7cc3752a0193a55bc9.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3e9022faae3dc6f5066a1e7cc3752a0193a55bc9.camel@pengutronix.de>

Hi Philipp,

On 13:39 Wed 18 Mar     , Philipp Zabel wrote:
> On Di, 2026-03-17 at 02:36 +0000, Yixun Lan wrote:
> > Instead of grouping several different reset lines into one composite
> > reset, decouple them to individual ones which make it more aligned
> > with underlying hardware. And for DWC USB driver, it will match well
> > with the number of the reset property in the DT bindings.
> >=20
> > The DWC3 USB host controller in K3 SoC has three reset lines - AHB, VCC,
> > PHY. The PCIe controller also has three reset lines - DBI, Slave, Maste=
r.
> > Also three reset lines each for UCIE and RCPU block.
> >=20
> > As an agreement with maintainer, the reset IDs has been rearranged as
> > contiguous number and pushed as a fix for the driver, and reason is that
> > there isn't any consumer of reset driver so far,
>=20
> Unfortunately that does not seem to be the case for all APMU resets.
> A lore query for all changed IDs [1] yields a patch that adds ethernet
> device nodes using RESET_APMU_EMAC[012] [2].
>=20
Yes, although the ethernet use this ID, but I don't think we should worry
about that, since the ethernet patch is still under review, and ideally it
will be merged after this reordering patch, unless you disagree? and insist
the RESET_APMU_EMAC should not be changed?


> [1] https://lore.kernel.org/all/?q=3Ddfb%3ARESET_APMU_USB2+OR+dfb%3ARESET=
_APMU_USB3_PORTA+OR+dfb%3ARESET_APMU_USB3_PORTB+OR+dfb%3ARESET_APMU_USB3_PO=
RTC+OR+dfb%3ARESET_APMU_USB3_PORTD+OR+dfb%3ARESET_APMU_QSPI+OR+dfb%3ARESET_=
APMU_QSPI_BUS+OR+dfb%3ARESET_APMU_DMA+OR+dfb%3ARESET_APMU_AES_WTM+OR+dfb%3A=
RESET_APMU_MCB_DCLK+OR+dfb%3ARESET_APMU_MCB_ACLK+OR+dfb%3ARESET_APMU_VPU+OR=
+dfb%3ARESET_APMU_DTC+OR+dfb%3ARESET_APMU_GPU+OR+dfb%3ARESET_APMU_ALZO+OR+d=
fb%3ARESET_APMU_MC+OR+dfb%3ARESET_APMU_CPU0_POP+OR+dfb%3ARESET_APMU_CPU0_SW=
+OR+dfb%3ARESET_APMU_CPU1_POP+OR+dfb%3ARESET_APMU_CPU1_SW+OR+dfb%3ARESET_AP=
MU_CPU2_POP+OR+dfb%3ARESET_APMU_CPU2_SW+OR+dfb%3ARESET_APMU_CPU3_POP+OR+dfb=
%3ARESET_APMU_CPU3_SW+OR+dfb%3ARESET_APMU_C0_MPSUB_SW+OR+dfb%3ARESET_APMU_C=
PU4_POP+OR+dfb%3ARESET_APMU_CPU4_SW+OR+dfb%3ARESET_APMU_CPU5_POP+OR+dfb%3AR=
ESET_APMU_CPU5_SW+OR+dfb%3ARESET_APMU_CPU6_POP+OR+dfb%3ARESET_APMU_CPU6_SW+=
OR+dfb%3ARESET_APMU_CPU7_POP+OR+dfb%3ARESET_APMU_CPU7_SW+OR+dfb%3ARESET_APM=
U_C1_MPSUB_SW+OR+dfb%3ARESET_APMU_MPSUB_DBG+OR+dfb%3ARESET_APMU_UCIE+OR+dfb=
%3ARESET_APMU_RCPU+OR+dfb%3ARESET_APMU_DSI4LN2_ESCCLK+OR+dfb%3ARESET_APMU_D=
SI4LN2_LCD_SW+OR+dfb%3ARESET_APMU_DSI4LN2_LCD_MCLK+OR+dfb%3ARESET_APMU_DSI4=
LN2_LCD_DSCCLK+OR+dfb%3ARESET_APMU_DSI4LN2_DPU_ACLK+OR+dfb%3ARESET_APMU_DPU=
_ACLK+OR+dfb%3ARESET_APMU_UFS_ACLK+OR+dfb%3ARESET_APMU_EDP0+OR+dfb%3ARESET_=
APMU_EDP1+OR+dfb%3ARESET_APMU_PCIE_PORTA+OR+dfb%3ARESET_APMU_PCIE_PORTB+OR+=
dfb%3ARESET_APMU_PCIE_PORTC+OR+dfb%3ARESET_APMU_PCIE_PORTD+OR+dfb%3ARESET_A=
PMU_PCIE_PORTE+OR+dfb%3ARESET_APMU_EMAC0+OR+dfb%3ARESET_APMU_EMAC1+OR+dfb%3=
ARESET_APMU_EMAC2+OR+dfb%3ARESET_APMU_ESPI_MCLK+OR+dfb%3ARESET_APMU_ESPI_SC=
LK
> [2] https://lore.kernel.org/all/20260318035542.517554-1-inochiama@gmail.c=
om/
>=20
> Please reorder the resets such that only the decoupled lines get new
> numbers. Especially EMAC resets should keep the same value.
>=20
> > so should not cause any ABI breakage.
> >
> > Also, the changes of DT binding header file and reset
> > driver are merged together as one single commit to avoid git-bisect
> > breakage.
>=20
> This addresses the only remaining checkpatch-warning:
>=20
>   WARNING: DT binding docs and includes should be a separate patch. See: =
Documentation/devicetree/bindings/submitting-patches.rst
>=20
> which is ignored on purpose to avoid a bisection hazard.
>=20
> > Fixes: 938ce3b16582 ("reset: spacemit: Add SpacemiT K3 reset driver")
> > Fixes: 216e0a5e98e5 ("dt-bindings: soc: spacemit: Add K3 reset support =
and IDs")
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
>=20
> regards
> Philipp

--=20
Yixun Lan (dlan)
