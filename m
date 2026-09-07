Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B48E157487
	for <spacemit@lists.linux.dev>; Mon,  7 Sep 2026 13:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786927; cv=none; b=nEWa/r2etL0HMou802CJz3WYn6pDVFf/tU8vpgfwJcZT/t2gcs1WrMKqzy+MLTdL+WUwEBoHo8b2ucIr0XAvCzFQiW17hcO9ql0CAk9+8ZXpsjIk8+u3Nfjk0AJsFh4ChSSJ9nc6iqlyPLOqB+uOtR1GHSu1bS0r0zMwKSGSOA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786927; c=relaxed/simple;
	bh=e1bBDi7MJrBSJ7SJxpLWFvW53bN8KowynwD3Zggbe9U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 In-Reply-To:References; b=rsPDScdKc2s50I99D5N8NDt4dgFygQmTGVr8XzoGbjAdkZSxE+UgC7G1FF3fjfsSDx3qq2u25I+bY6AAPuBbnTCPuaZ4lRheAyjVhnspIfI6ceS6WAPaly+vydzQDUcY+6mcNcu5X+pUSPYFYPgnXEdMAE33VtG/ant9UXWmgG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=O5RVqvpN; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="O5RVqvpN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788786871;
	bh=Jk81SOn3/8DCg9Sox3f3yf72BQ53Su58jLkQOm28g3k=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=O5RVqvpNQRMoltwwxPWLjw9ebpujJ70vO1pMXRexd8qx74JxwB9cZGr+Dc1UEYXe/
	 3MB1MMRxH9yCMofcxFls/tNhTrtfWLLGnhJ/r3aBk8UiJ3mXmcootFEcBQjQVuy7NG
	 zLu2fXgjcA9RKtVTpLGlc6PMu1Vzm6IRas6p+gr4=
X-QQ-mid: zesmtpgz4t1788786869tac4a6f92
X-QQ-Originating-IP: OzXVZnIteLlUqwcgDV6bIEY0nAxOM5yVRWMFcHV3YdA=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 07 Sep 2026 21:14:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16469169757696969586
EX-QQ-RecipientCnt: 41
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=b1ec608241a1d67d557c4119b4b934d57a888dda4ac98415da6425cd98df;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 07 Sep 2026 21:14:23 +0800
Message-Id: <DL940SRP94AG.408BKFWHDVY3@linux.spacemit.com>
Cc: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, "Yixun Lan" <dlan@gentoo.org>, "Longbin Li"
 <looong.bin@gmail.com>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v5 6/6] PCI: spacemit-k1: Add Spacemit K3 PCIe host
 controller support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Inochi Amaoto" <inochiama@gmail.com>, "Jingoo Han"
 <jingoohan1@gmail.com>, "Manivannan Sadhasivam" <mani@kernel.org>, "Lorenzo
 Pieralisi" <lpieralisi@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, "Rob Herring" <robh@kernel.org>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Frank Li"
 <Frank.Li@nxp.com>, "Niklas Cassel" <cassel@kernel.org>, "Sherry Sun"
 <sherry.sun@nxp.com>, "Arnd Bergmann" <arnd@arndb.de>, "Christian Bruel"
 <christian.bruel@foss.st.com>, "Krishna Chaitanya Chundru"
 <krishna.chundru@oss.qualcomm.com>, "Senchuan Zhang"
 <zhangsenchuan@eswincomputing.com>, "Alex Elder" <elder@riscstar.com>,
 "Xincheng Zhang" <zhangxincheng@ultrarisc.com>, "Randolph Lin"
 <randolph@andestech.com>, "Siddharth Vadapalli" <s-vadapalli@ti.com>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, "Vidya Sagar"
 <vidyas@nvidia.com>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Danilo
 Krummrich" <dakr@kernel.org>,
 =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?=
 <u.kleine-koenig@baylibre.com>, "Pengpeng Hou" <pengpeng@iscas.ac.cn>,
 "Anirudh Srinivasan" <asrinivasan@oss.tenstorrent.com>, "Gustavo Pimentel"
 <gustavo.pimentel@synopsys.com>
In-Reply-To: <20260907112606.465778-7-inochiama@gmail.com>
References: <20260907112606.465778-1-inochiama@gmail.com>
 <20260907112606.465778-7-inochiama@gmail.com>
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N/HQSHwfvuIP8U3GKpM4u4fURsdB/lpD04rj1pPq90zjf4lHPwi6bul9
	s44mdLhhWqWGQTxTaHvg502Tjl1Q0NbTN1abmx4Sk1U561mZQNfrFElNfP9zQSj1kJoII3C
	MRKl/iaxNtZA5p2eTFoQxTT+kT6RBRivGfpuzdzGG6ZYuhHg4dYxAhyVjE2u7eIwRz4q5wZ
	885x7remQZHxLB55UitaF5ILZqmDNQr81lMbebMau/x4hcfNFZymh5LHKttFOBiuJGCEe0s
	iLO1ZD+HZr/MwNPdJXqR5ghbXmoGV17TLOBWQYIK5ttj5H6c/SMB4N6jRM1vKg6lwb7FlLF
	8NAbAo1yju0oZDygjkB3jucoddZf1mimVKCo6WfxqD74VHChhu8MGpwO5yVxHHo7BmA+cm+
	00MzWcDf3UZI3w97c4q0cwwwmEWshdXukzwFDXO/Xx44gg8PIOkJD0eIs5R2IYexA7xp5aw
	yp145G3p9cZLSqdj8tYhGcvz++nYI6KfXV2aBsTEJq93kUElpq7KUzKXgGsnajufhzLPfm6
	oUHAZlFaH55A3Fn48CeSK8PShc5Zq6E+H/kbvcionVIO+DSfyimwNEZG/7gt/TT0MXo4I22
	PTyH6ug1vdP3VCcYZ39469PfCwpCFFV0snOdsacM7NaI3k89Z1MrjylOAPL3N93kIf88kKW
	c2F2BHVPGqgjDiFNxatlTlHoBujPN5iB9qcN21uRuCO92OXlESaB88jDy0CF5U0uiOuKWmR
	i7Jb/pYcmXG2lUEMBXi9RjZTPRdcrdWpJCKpRhnDAOIIUEsIU5MhZ39tAojH9oZvhOgIwUT
	W83wzUlTPgVn/aLwxUjPnBDi8SFlht14NTYzktISzII9T0NJb6+yqthVtuAh1pIoS4X6yxg
	GBfCt3D/m9kOtCWeFkacbAlNB52Crl9IySf6nghsVhRnEELjpSlk7HUk9SK+594YFAQTXtL
	fMoTclNpjp/C2OPKAa+L6+PFc8UGTXHKlnSzGtGJaqPsTfB8O1czt9yvzdLoqBh+HY8ODee
	5qwoEiBkCUxYSRMQMv5CRFNJoQlHidnFGnRJ9WUVggArNGBBfCsMJaKOMf1ms8loJH2FbNu
	6WlIwDy+7sY5IEc70FvxAIyCLziNJrOPw9zzHZ9CCmf
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

--b1ec608241a1d67d557c4119b4b934d57a888dda4ac98415da6425cd98df
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 7, 2026 at 07:26:05PM +0800, Inochi Amaoto wrote:
> [...]
>
> @@ -303,6 +316,116 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
> [...]
>
> +static int k3_pcie_init(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci =3D to_dw_pcie_from_pp(pp);
> +	struct k1_pcie *k1 =3D to_k1_pcie(pci);
> +	u32 reset_ctrl =3D k1->pmu_off + PCIE_CLK_RESET_CONTROL;
> +	u32 val;
> +	int ret;
> +
> +	regmap_clear_bits(k1->pmu, reset_ctrl, LTSSM_EN);
> +
> +	k1_pcie_toggle_soft_reset(k1);
> +
> +	/* K3: Set IGNORE_PERSTN and drive PERSTN_OE high (assert reset) */
> +	regmap_update_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> +			   PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE | PCIE_PERSTN_OUT,
> +			   PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE);
> +
> +	ret =3D k1_pcie_enable_resources(k1);
> +	if (ret)
> +		goto failed_resources;
> +
> +	regmap_set_bits(k1->pmu, reset_ctrl, PCIE_AUX_PWR_DET);
> +	regmap_clear_bits(k1->pmu, reset_ctrl, APP_HOLD_PHY_RST);
> +
> +	ret =3D phy_bulk_init(k1->phy_count, k1->phys);
> +	if (ret)
> +		goto failed_phy;
> +
> +	msleep(PCIE_T_PVPERL_MS);
> +
> +	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> +			PCIE_PERSTN_OUT | PCIE_PERSTN_OE);
> +

Should we use pci->pe_rst when reset-gpios is provided, and keep the PMU pa=
th as
a fallback? The SDK handles both cases. The DWC core requests that GPIO wit=
h
GPIOD_OUT_HIGH, but this path only releases PERST# through the PMU, so an
endpoint using the GPIO would remain in reset.

> [...]
>
> +	/* Finally, as a workaround, disable ASPM L1 */
> +	k1_pcie_disable_aspm_l1(k1);
> +
> +	return 0;
> +

Would we also need to configure IOMMU bypass during initialization? The SDK=
 sets
the PCIe A/B/C bypass bits in PMUA_PCIE_SUBSYS_MGMT when there is no usable
iommu-map. The proposed K3 PCIe DTS has no iommu-map, and I could not find =
the
corresponding bypass setup in this series.

Is bypass already guaranteed by firmware or the reset state, or should the
driver set it here? My concern is that enumeration could succeed while endp=
oint
DMA still goes through an unconfigured IOMMU.

> [...]
>
> +static int k3_pcie_parse_port(struct k1_pcie *k1)
> +{
> +	u32 status0, status1, status2;
> +
> +	/* This register require a RAW for cleanup */
> +	status0 =3D readl_relaxed(k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
> +	status1 =3D readl_relaxed(k1->link + INTR_STATUS);
> +	status2 =3D readl_relaxed(k1->link + K3_ADDR_INTR_STATUS1);
> +
> +	writel_relaxed(status0, k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
> +	writel_relaxed(status1, k1->link + INTR_STATUS);
> +	writel_relaxed(status2, k1->link + K3_ADDR_INTR_STATUS1);
> +
> +	return k1_pcie_parse_port(k1);
> +}
> +

Are these status registers accessible before the controller clocks are enab=
led
and resets released? k3_pcie_parse_port() runs before dw_pcie_host_init(), =
which
calls k3_pcie_init() to enable those resources.

The SDK uses the same ordering, but I am not sure whether it relies on firm=
ware
leaving the registers accessible. If so, would it be safer to move this cle=
aring
into k3_pcie_init(), after enabling the resources?

                                            - Troy

--b1ec608241a1d67d557c4119b4b934d57a888dda4ac98415da6425cd98df
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCap64rw0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvJyoBAMpzza2UFaPDU3N6OzT6Pqz98vTMH5QXSPlFsd2z
64hpAQCY98sw331RfVmJSB3JJfdQnKR6BfPFZ+1YGs40dQ6dBA==
=p+m0
-----END PGP SIGNATURE-----

--b1ec608241a1d67d557c4119b4b934d57a888dda4ac98415da6425cd98df--
