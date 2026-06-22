Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA7C3911AA
	for <spacemit@lists.linux.dev>; Mon, 22 Jun 2026 08:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782118231; cv=none; b=plPBc6+LJYvgfdonxlnObF1In33fzTrQ1TrmifQT3iBJfJ5t6q7UNVrjfj+GTVhvFjMHM73EyL2X3gieOJCNoMbVF5mBeIHzwLXanXX7X2D7y8xZ6N73laHa+/eMKp5CT58gJ5BQiHrjVOHZlAv+3QYDuJvf03SF+WgYZ7WIbVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782118231; c=relaxed/simple;
	bh=UbKvqS4nmtJLSX0uHeMY5CnLqR2OV1bZSaX0QMfgNfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WEphioY2PMPKqAzZjwSz1MQLw/pbWYqcIApVbThNLIJhYaUqsLeVz5aOqUY0xWAep3Rp9Oh6D7PsB2WtXsqgmo10w5Noi5Bmp3Om6prsn6stgj7sM7O0iFf6+BwK4bipAXbawOrgNBDDXyMH47yLfAVDRozjTYWzDVjtC0pMnM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KfkCP125; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KfkCP125"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bf20f6be6bso27139655ad.3
        for <spacemit@lists.linux.dev>; Mon, 22 Jun 2026 01:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782118228; x=1782723028; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wsb3msrVzMFjEIZt2d7WOPQ7wBUcHqp6O0aoLnTn6WY=;
        b=KfkCP125AXUM7ZLBnD43iSrXx9YoPIxOcWnU5mUdqPCV3DA8Yt3bVng0HluSGPvfs8
         QZLljGpIpQch/2woEEZrwV6a1lGR+ODIKcerPg6r5T3xTGhr3sApkiiTSWeVsn3D+Xzo
         FMC2fmKIPHegpBCeZoLe2MnK0OMJ7KXZko0cHMCyVEfnArNorGP21JHE6RNU0Pvg/5mH
         zn4oHR0DjX8ew5ip5fqoCymbitCWGd/VCYJxCylgreQyI1jRzo36yDl+lbHlOiIsuiDW
         B/vKxGr4d6vWCbHOL6+Q2t1Pvr4cTXc7WwTRjg7GGnbONC/RL3QFtpwJrjtj30EiSm/L
         ErKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782118228; x=1782723028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wsb3msrVzMFjEIZt2d7WOPQ7wBUcHqp6O0aoLnTn6WY=;
        b=ZfnBZECdkydrrAN25arCOMZOA0E9KdWy4uN59UOoeppEDlXXlZZNd64emVZmOTAPEs
         FPwQR3RFDWE6XcVdzR5laL9aL7OOZHLOlOJYdJzXyLvQ3diFvdPnsH56wAdEDgw0Mj+p
         xd338by1cEG6qmIq+uwAZYHTsvbaAaemoL8XZ/vt6eF0SRLUUSGskuN1kzFNe6m7jwZG
         lOWIKBtozgiADHe+r3WBsd+w704+UYtOvrN1yJLvlCEA0ld5BN81cudWYK0neaZ2nb2+
         Y7yBtB9CmMSk9C1B03mOrPmepex2+BH5SmBNywaC/ZXluJsEkghLtk1yGk6c3eXJnHhY
         RbgA==
X-Forwarded-Encrypted: i=1; AHgh+RpEfKQtrKsBK/sHu2wZ6TfegnAfcU0AEHQCzd8o8BBRbQ84NZFEGuE6laVvsYf0+nvKJ1CL3aB+2w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzepZdQyFsZ21j+gn8nyymxmi0SSJW3UNsETwW6EbnEgaSdCFi6
	2bBAJYGSXjkaH4DQupuJepP7EinbhBzor0exGY3qH7ryvrR8zZN3lTpf
X-Gm-Gg: AfdE7ckjCWYiQKA7awfkS9sURul+a3tVEMB+dn3LzRRSYOlC0bEezF1BWdO0ffB1RKh
	LsLPX8RYheQB4x7Je5tvLZarK593/XzX898xXm24e9EyHivHEwmfEHposbZ3n6kab9K/6LnWP3H
	INljjWhrP9PiwsGCClJu93M4jOzldtbt/4M3yGUzufIscpE4iaVqkSwwyglNHYCd0bt1/AII1lI
	GEqST+jd3j37tZrP4C3FZ6CUxp6yT229VJjjUqA606iCVsKSFBvpUntH9ZKcdUFfoDqgNeGdMSS
	cY8G/kZ0OUHcR6BALGQFZBFQfwz4+rdyDrmwl4vg/nyWrR1ZI0SQPB5k2+As+OEtlVzLl6hEJa1
	iP5EX7YJltD16zxvbFAUqBAXc3p6KJipD0F9wPFayIYnFPEh9C3IQE0F4eGO+DU6N
X-Received: by 2002:a17:902:f650:b0:2c2:245a:3364 with SMTP id d9443c01a7336-2c718fbc332mr147180715ad.32.1782118228124;
        Mon, 22 Jun 2026 01:50:28 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7444a9c7csm65858905ad.73.2026.06.22.01.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 01:50:27 -0700 (PDT)
Date: Mon, 22 Jun 2026 16:50:10 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Christian Bruel <christian.bruel@foss.st.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Nam Cao <namcao@linutronix.de>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Randolph Lin <randolph@andestech.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vidya Sagar <vidyas@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 5/5] PCI: spacemit-k1: Add Spacemit K3 PCIe host
 controller support
Message-ID: <ajjz9RVlgCf1pt9c@inochi.infowork>
References: <20260517014841.254085-1-inochiama@gmail.com>
 <20260517014841.254085-6-inochiama@gmail.com>
 <2dec4fe6-30d8-4949-bdc1-e32508340b87@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2dec4fe6-30d8-4949-bdc1-e32508340b87@riscstar.com>

On Tue, Jun 09, 2026 at 11:11:24AM -0500, Alex Elder wrote:
> On 5/16/26 8:48 PM, Inochi Amaoto wrote:
> > The PCIe controller on Spacemit K3 is almost a standard Synopsys
> > DesignWare PCIe IP with extra link and reset control. Unlike
> > the PCIe controller on K1, this controller supports external MSI
> > interrupt controller and can use multiple PHYs at the same time.
> > 
> > Add driver to support PCIe controller on Spacemit K3 PCIe.
> 
> It seems like you're creating a lot of new code for K3.  In
> some cases it's very similar to K1, and it's not clear why it
> needs to be different.
> 
> I'd much rather see a patch that prepares for K3 support by
> doing minor refactoring of the existing code to support K1
> in a way that will make adding K3 support more natural.
> Then a patch to enable K3 should be simpler (and can focus
> on what is truly different).
> 

I can not understand what you see, the init logic of K3 is
completely different from the K1, so a new function is need.
For other logic, I have reused all things as I can.

> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >   drivers/pci/controller/dwc/Kconfig            |   4 +-
> >   drivers/pci/controller/dwc/pcie-spacemit-k1.c | 169 ++++++++++++++++++
> >   2 files changed, 171 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> > index f2fde13107f2..fae971ecd876 100644
> > --- a/drivers/pci/controller/dwc/Kconfig
> > +++ b/drivers/pci/controller/dwc/Kconfig
> > @@ -439,7 +439,7 @@ config PCIE_SOPHGO_DW
> >   	  Sophgo SoCs.
> >   config PCIE_SPACEMIT_K1
> > -	tristate "SpacemiT K1 PCIe controller (host mode)"
> > +	tristate "SpacemiT K1/K3 PCIe controller (host mode)"
> >   	depends on ARCH_SPACEMIT || COMPILE_TEST
> >   	depends on HAS_IOMEM
> >   	select PCIE_DW_HOST
> > @@ -447,7 +447,7 @@ config PCIE_SPACEMIT_K1
> >   	default ARCH_SPACEMIT
> >   	help
> >   	  Enables support for the DesignWare based PCIe controller in
> > -	  the SpacemiT K1 SoC operating in host mode.  Three controllers
> > +	  the SpacemiT K1/K3 SoC operating in host mode. Three controllers
> >   	  are available on the K1 SoC; the first of these shares a PHY
> >   	  with a USB 3.0 host controller (one or the other can be used).
> > diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > index 7f6f1df31cd8..7854d26220a9 100644
> > --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > @@ -23,6 +23,7 @@
> >   #define PCI_VENDOR_ID_SPACEMIT		0x201f
> >   #define PCI_DEVICE_ID_SPACEMIT_K1	0x0001
> > +#define PCI_DEVICE_ID_SPACEMIT_K3	0x0002
> >   /* Offsets and field definitions for link management registers */
> >   #define K1_PHY_AHB_IRQ_EN			0x0000
> > @@ -32,8 +33,20 @@
> >   #define SMLH_LINK_UP			BIT(1)
> >   #define RDLH_LINK_UP			BIT(12)
> > +#define INTR_STATUS				0x0010
> > +
> >   #define INTR_ENABLE				0x0014
> >   #define MSI_CTRL_INT			BIT(11)
> > +#define RDLH_LINK_UP_INT		BIT(20)
> > +
> > +#define K3_PHY_AHB_IRQSTATUS_INTX		0x0008
> 
> Can you add INTX support for K1 as well (perhaps in a separate
> patch)?
> 

I have no knowledge about INTx support, and the vendor refuse
to provide any information about this. So no support for this.

> > +#define K3_ADDR_INTR_STATUS1			0x0018
> > +
> > +#define K3_CACHE_MSTR_AWCACHE_MODE	GENMASK(14, 11)
> > +#define K3_CACHE_MSTR_AWCACHE_BEHAVIOR	0xf
> > +
> > +#define K3_MAX_PHY_NUMBER		6
> 
> You used "count" in patch 2 as the field name.
> 
> >   /* Some controls require APMU regmap access */
> >   #define SYSCON_APMU			"spacemit,apmu"
> > @@ -48,6 +61,9 @@
> >   #define PCIE_CONTROL_LOGIC			0x0004
> >   #define PCIE_SOFT_RESET			BIT(0)
> > +#define PCIE_PERSTN_OE			BIT(24)
> > +#define PCIE_PERSTN_OUT			BIT(25)
> > +#define PCIE_IGNORE_PERSTN		BIT(31)
> >   struct k1_pcie {
> >   	struct dw_pcie pci;
> > @@ -262,6 +278,152 @@ static const struct dw_pcie_ops k1_pcie_ops = {
> >   	.stop_link	= k1_pcie_stop_link,
> >   };
> > +static int k3_pcie_enable_phy(struct k1_pcie *pcie)
> 
> Can you just make K1's single PHY be a special case of
> having "N" PHYs?  I.e., just set the phy_count for
> K1 to be 1, so this loop would work for both K1 and K3?
> 

This is reasonable.

> > +{
> > +	int i, ret;
> > +
> > +	for (i = 0; i < pcie->phy_count; i++) {
> > +		ret = phy_init(pcie->phy[i]);
> > +		if (ret)
> > +			goto err_phy;
> > +	}
> > +
> > +	return 0;
> > +
> > +err_phy:
> > +	while (--i >= 0)
> > +		phy_exit(pcie->phy[i]);
> > +
> > +	return ret;
> > +}
> > +
> > +static int k3_pcie_init(struct dw_pcie_rp *pp)
> > +{
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	struct k1_pcie *k1 = to_k1_pcie(pci);
> > +	u32 reset_ctrl = k1->pmu_off + PCIE_CLK_RESET_CONTROL;
> > +	u32 val;
> > +	int ret;
> > +
> > +	regmap_clear_bits(k1->pmu, reset_ctrl, LTSSM_EN);
> 
> Should the above be done for K1?  Would it hurt?  Handle
> both K1 and K3 the same way if possible.
> 
> The next two things are identical to k1_pcie_init().  Make
> the code common if possible, so it's very obvious what
> really needs to be different between the two.
> 

No, I have diff the code and find only about 40% of logic
are similar. However, these logic is fragmented, so I decide
to add a new function, which is easier to maintain.

> > +
> > +	k1_pcie_toggle_soft_reset(k1);
> 
> The "k1" prefix is fine for now, but if this driver gets
> used for more devices in the future, it might be worth
> renaming things to emphasize that it's not K1-specific.
> 

Currently I have no knowledge on the new device and do not
think it is a good idea to change the name. Anyway, it is
possible to change to kx, but I do not think it is clear.

> > +	ret = k1_pcie_enable_resources(k1);
> > +	if (ret)
> > +		return ret;
> > +
> > +	regmap_set_bits(k1->pmu, reset_ctrl, PCIE_AUX_PWR_DET);
> > +	regmap_clear_bits(k1->pmu, reset_ctrl, APP_HOLD_PHY_RST);
> > +
> 
> You enable the PHY here much earlier than what's done in
> the K1 code.  Should the K1 PHY be enabled earlier?
> Also, I don't really think there needs to be separate
> versions of the code that enables PHYs for K1 and K3.
> 

IIRC this is a specific logic for K3.

> > +	ret = k3_pcie_enable_phy(k1);
> > +	if (ret) {
> > +		k1_pcie_disable_resources(k1);
> > +		return ret;
> > +	}
> > +
> > +	/* K3: Set IGNORE_PERSTN and drive PERSTN_OE high (assert reset) */
> > +	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> > +			PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE | PCIE_PERSTN_OUT);
> > +	usleep_range(1000, 2000);
> > +	regmap_clear_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC, PCIE_PERSTN_OUT);
> > +
> > +	msleep(PCIE_T_PVPERL_MS);
> > +
> > +	/*
> > +	 * Put the controller in root complex mode, and indicate that
> > +	 * Vaux (3.3v) is present.
> > +	 */
> > +	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> > +			PCIE_PERSTN_OUT | PCIE_PERSTN_OE);
> > +
> > +	val = dw_pcie_readl_dbi(pci, GEN3_EQ_CONTROL_OFF);
> > +	val = u32_replace_bits(val, GEN3_EQ_CONTROL_OFF_PHASE23_EXIT_MODE,
> > +			       GEN3_EQ_CONTROL_OFF_PSET_REQ_VEC);
> > +	dw_pcie_writel_dbi(pci, GEN3_EQ_CONTROL_OFF, val);
> > +
> 
> The following block of code (roughly) is done right after
> enabling resources in the K1 version of this function.
> 
> Maybe the order you do it is better, but in that case,
> change the (existing, and soon, common) code to do it
> however is best if that's the case.
> 
> You should try to factor out the common parts and minimize
> what's actually different between the two.
> 
> I would also expect that the device ID would be stored in the
> platform data rather than having both init functions hard-code
> the value here.
> 
> I'm going to leave it at that for now.
> 
> 					-Alex

This first thing you should know is the init logic of K3
is totally different from K1, I have asked for the vendor
and they told me it is better to treat them differently,
even if they are using the same ip. 

For the request of the device ID setup, I think I can add
a function for it.

> 
> > +	dw_pcie_dbi_ro_wr_en(pci);
> > +	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
> > +	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, PCI_DEVICE_ID_SPACEMIT_K3);
> > +	dw_pcie_dbi_ro_wr_dis(pci);
> > +
> > +	/* Finally, as a workaround, disable ASPM L1 */
> > +	k1_pcie_disable_aspm_l1(k1);
> > +
> > +	return 0;
> > +}
> > +
> > +static int k3_pcie_msi_host_init(struct dw_pcie_rp *pp)
> > +{
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	u32 val;
> > +
> > +	dw_pcie_dbi_ro_wr_en(pci);
> > +
> > +	val = dw_pcie_readl_dbi(pci, COHERENCY_CONTROL_3_OFF);
> > +	val |= u32_replace_bits(val, K3_CACHE_MSTR_AWCACHE_BEHAVIOR,
> > +				K3_CACHE_MSTR_AWCACHE_MODE);
> > +	dw_pcie_writel_dbi(pci, COHERENCY_CONTROL_3_OFF, val);
> > +
> > +	dw_pcie_dbi_ro_wr_dis(pci);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct dw_pcie_host_ops k3_pcie_host_ops = {
> > +	.init		= k3_pcie_init,
> > +	.deinit		= k1_pcie_deinit,
> > +	.msi_init	= k3_pcie_msi_host_init,
> > +};
> > +
> > +static const struct dw_pcie_ops k3_pcie_ops = {
> > +	.link_up	= k1_pcie_link_up,
> > +	.start_link	= k1_pcie_start_link,
> > +	.stop_link	= k1_pcie_stop_link,
> > +};
> > +
> > +static void k3_pcie_clear_irq_status(struct k1_pcie *k1,
> > +				     u32 *status0, u32 *status1, u32 *status2)
> > +{
> > +	*status0 = readl_relaxed(k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
> > +	*status1 = readl_relaxed(k1->link + INTR_STATUS);
> > +	*status2 = readl_relaxed(k1->link + K3_ADDR_INTR_STATUS1);
> > +
> > +	writel_relaxed(*status0, k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
> > +	writel_relaxed(*status1, k1->link + INTR_STATUS);
> > +	writel_relaxed(*status2, k1->link + K3_ADDR_INTR_STATUS1);
> > +}
> > +
> > +static int k3_pcie_parse_port(struct k1_pcie *k1)
> > +{
> > +	struct device *dev = k1->pci.dev;
> > +	u32 status0, status1, status2;
> > +	int i;
> > +
> > +	k1->phy = devm_kmalloc_array(dev, K3_MAX_PHY_NUMBER, sizeof(*k1->phy),
> > +				     GFP_KERNEL);
> > +	if (!k1->phy)
> > +		return -ENOMEM;
> > +
> > +	for (i = 0; i < K3_MAX_PHY_NUMBER; i++) {
> > +		k1->phy[i] = devm_of_phy_get_by_index(dev, dev->of_node, i);
> > +		if (IS_ERR(k1->phy[i])) {
> > +			if (PTR_ERR(k1->phy[i]) == -ENODEV)
> > +				break;
> > +
> > +			return PTR_ERR(k1->phy[i]);
> > +		}
> > +	}
> > +
> > +	k1->phy_count = i;
> > +	if (k1->phy_count == 0)
> > +		return -EINVAL;
> > +
> > +	k3_pcie_clear_irq_status(k1, &status0, &status1, &status2);
> > +
> > +	return 0;
> > +}
> > +
> >   static int k1_pcie_parse_port(struct k1_pcie *k1)
> >   {
> >   	struct device *dev = k1->pci.dev;
> > @@ -363,8 +525,15 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
> >   	.parse_port	= k1_pcie_parse_port,
> >   };
> > +static const struct k1_pcie_device_data k3_pcie_device_data = {
> > +	.host_ops	= &k3_pcie_host_ops,
> > +	.ops		= &k3_pcie_ops,
> > +	.parse_port	= k3_pcie_parse_port,
> > +};
> > +
> >   static const struct of_device_id k1_pcie_of_match_table[] = {
> >   	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data},
> > +	{ .compatible = "spacemit,k3-pcie", .data = &k3_pcie_device_data},
> >   	{ }
> >   };
> 
