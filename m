Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9781030EF77
	for <spacemit@lists.linux.dev>; Sun, 12 Jul 2026 07:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783840970; cv=none; b=QhPTIFH+HuDfByf+1pYuwRiYRqiN0WYZAglDQqkNkHbngVFEdqRISkfp1csrl3xXIYsDi5fxgeE5hfCTER0tcCGfzL5yw5QHlj9JlVMBfQADNG1tz8mqrfI2iwSBiVZMGnllU4rhsoQWpkh0XTkFWovwnsAqz6DaOYeGQvoOPmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783840970; c=relaxed/simple;
	bh=kXEn1jR7t/PsbVa4mS0/vjK8RikIIYOpEAcxhMVtPss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LKPs3So7TWBtz223wUi8FK0uZLYrApajAb3YeFYPMngSjQlO+JC2UiwPL05Q/j/zgyLLv+T1wuTdizruGf9dVs30TpI89OHRLRIZG1QnGkNlWxSAx8HU0MhavvmxZvX70tzOWu5xzCsPCnBzJX6i3a4KfXoXRbqTUT+0i4qMJ58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6hopffl; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6hopffl"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc6dd436c6so25815595ad.2
        for <spacemit@lists.linux.dev>; Sun, 12 Jul 2026 00:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783840968; x=1784445768; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1YVff9t5wehszsbuc81mT3z1iJBzopqdoQscWyTxBF8=;
        b=k6hopfflC1YWWaFgHj+xf2EZMxwgvgpcCUc7StBKl1zOVlw7NGdDyXxtYAhjlp8tao
         6BwmsuFU0IpFTFB8GZoljJMpMVkTn0BLd53EiR5sefxUpdMtcCI/Bxw5Yzhp9Tgt1Ale
         wpRtZTnFMqItCGROzSp+aYxQXDSH9NgfkxcLtAqTYY/BFTT1xqUkU823uPEN1nCweK3n
         E5+Plrdx9+qkJ3cmDxjhMTvz/Vu6hAMjulh5EvGZ2WyPHF0kQwCMe2ShCyks3LzcWtGw
         IaZPIP/L7VML17HJHnqFN2F0nx2BtqVXMHSE3+7TgQI78rowKa0zEbHL6qNi5jYnrT3b
         gsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783840968; x=1784445768;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1YVff9t5wehszsbuc81mT3z1iJBzopqdoQscWyTxBF8=;
        b=D20B1B3316IOo4wVjsqDMlSc2uayJK+7cX6rpjWk/LrKVRDe0raup7dMU27yo312pG
         Unp+gqRfhcnjq2qBpU8IHM6fgiSgnxDk68D4wzQicLo+2mEjhuFvgR+q9X807l71xJbP
         zvsVfTqisII+5lEPYMrerVAlj9PKLa9EM1FEVZSIRZaFnnu4pafteWrR9tg+nXqUSFfE
         2j06NNFTo+85py8imEu477JjFXvm1iLFTaCZ2BVq423kfyx1rZzF1uXWDFRxaEJNXMUR
         fQF1RZFGwUy0IRDfvUjy7Ecn4z/bMkqioCAvDQwHVbg2HJLRdSu9EBbi1H+c8CRm4lP2
         HM8A==
X-Forwarded-Encrypted: i=1; AHgh+Rpg7R6P66ZnwOppjNirl3I36yZPAKUWsAuNoXTCHOTEp/QNRDuxV0KOqjhr5cnnuscW9nYW6072cg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyG9ANuaBLWQt6XCsy1zV3IKxwksu38RCkFUNzElfm6rsbnTxXw
	fGDRqQx1qX/BVyL9IDhMTa/4OMVc9jiQ5bjRU2zohAkBkG6V24e8Chtg
X-Gm-Gg: AfdE7cmKEQbP/VGbqPIxUBAZztMcoZlVV/8tmWrF3qP3ZSrFrxzRuuwzCxayzK38fs+
	mb/dTnjrDc8deuASQCR/yuUVScz7rlWXkyA/kORPjzk8djnDPSbVnY7/waSE9QWo0Xz6whJfy7x
	VQ6gl4+iRY35e/j7HD6BbPqUsWJZA8cNAeEOy74xFq/kUYZdnMj2YEiNl0PYOnSseLxtdnfrSJ6
	kQ6wHgZmhF9L14cw3mp//SH4qlqH3F/jv1Hjp4qfKvjTkQTG4hmmi+K2B5zjd465iG2cJcqr4sG
	wNyJbCHwR1DVikbIGGnHAMzhvwk2b5j1mgRiqiUAuUWOMJoXXm56d0WHehQDmEUuUqLIhiatb4F
	RvhAUheTgF5IwJj7bCBZZ+dxod+vt+KcxrTn26aPonqZcg+V4YfniLKRc471/voOQ
X-Received: by 2002:a17:903:1aeb:b0:2c9:97a8:aff5 with SMTP id d9443c01a7336-2ce9f4d41acmr56801705ad.46.1783840967850;
        Sun, 12 Jul 2026 00:22:47 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d451sm82121015ad.65.2026.07.12.00.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 00:22:47 -0700 (PDT)
Date: Sun, 12 Jul 2026 15:22:03 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Christian Bruel <christian.bruel@foss.st.com>, Frank Li <Frank.Li@nxp.com>, Nam Cao <namcao@linutronix.de>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Xincheng Zhang <zhangxincheng@ultrarisc.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vidya Sagar <vidyas@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 6/6] PCI: spacemit-k1: Add Spacemit K3 PCIe host
 controller support
Message-ID: <alM8oPEsZ1lJU0DM@inochi.infowork>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-7-inochiama@gmail.com>
 <900e6239-bc00-46b6-aa9f-abe219c039d2@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <900e6239-bc00-46b6-aa9f-abe219c039d2@riscstar.com>

On Fri, Jul 10, 2026 at 11:01:44AM -0500, Alex Elder wrote:
> On 7/8/26 11:00 PM, Inochi Amaoto wrote:
> > The PCIe controller on Spacemit K3 is almost a standard Synopsys
> > DesignWare PCIe IP with extra link and reset control. Unlike
> > the PCIe controller on K1, this controller supports external MSI
> > interrupt controller and can use multiple PHYs at the same time.
> > 
> > Add driver to support PCIe controller on Spacemit K3 PCIe.
> 
> I think it would be good to summarize how the K3 differs from
> the K1 here as well, since they're sharing code.  It looks
> like it supports up to 6 PHYs, not just 1 (as the K1 does).
> 

Thanks

> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >   drivers/pci/controller/dwc/Kconfig            |   4 +-
> >   drivers/pci/controller/dwc/pcie-spacemit-k1.c | 126 ++++++++++++++++++
> >   2 files changed, 128 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> > index aa0b784c85b4..dacbac5cc35c 100644
> > --- a/drivers/pci/controller/dwc/Kconfig
> > +++ b/drivers/pci/controller/dwc/Kconfig
> > @@ -440,7 +440,7 @@ config PCIE_SOPHGO_DW
> >   	  Sophgo SoCs.
> >   config PCIE_SPACEMIT_K1
> > -	tristate "SpacemiT K1 PCIe controller (host mode)"
> > +	tristate "SpacemiT PCIe controller (host mode)"
> >   	depends on ARCH_SPACEMIT || COMPILE_TEST
> >   	depends on HAS_IOMEM
> >   	select PCIE_DW_HOST
> > @@ -448,7 +448,7 @@ config PCIE_SPACEMIT_K1
> >   	default ARCH_SPACEMIT
> >   	help
> >   	  Enables support for the DesignWare based PCIe controller in
> > -	  the SpacemiT K1 SoC operating in host mode.  Three controllers
> > +	  the SpacemiT SoC operating in host mode. Three controllers
> >   	  are available on the K1 SoC; the first of these shares a PHY
> >   	  with a USB 3.0 host controller (one or the other can be used).
> > diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > index 31aac056b68e..680acc93f539 100644
> > --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > @@ -23,6 +23,7 @@
> >   #define PCI_VENDOR_ID_SPACEMIT		0x201f
> >   #define PCI_DEVICE_ID_SPACEMIT_K1	0x0001
> > +#define PCI_DEVICE_ID_SPACEMIT_K3	0x0002
> >   /* Offsets and field definitions for link management registers */
> >   #define K1_PHY_AHB_IRQ_EN			0x0000
> > @@ -32,8 +33,18 @@
> >   #define SMLH_LINK_UP			BIT(1)
> >   #define RDLH_LINK_UP			BIT(12)
> > +#define INTR_STATUS				0x0010
> 
> This register offset should probably be named K3_PHY_INTR_STATUS
> (or maybe it's just K3_INTR_STATUS?).  I see that INTR_ENABLE
> doesn't have a prefix, and I don't know why--that should have
> a similar name.  (Please fix that in your next version as well;
> I think it's OK to included it with this patch with a simple
> mention in the patch description.)
> 

I suggest not adding prefix here, as you have added a INTR_ENABLE,
I guess they are a pair. The thing I am sure is the INTR_STATUS1,
it should be K3 specific.

> > +
> >   #define INTR_ENABLE				0x0014
> >   #define MSI_CTRL_INT			BIT(11)
> > +#define RDLH_LINK_UP_INT		BIT(20)
> > +
> > +#define K3_PHY_AHB_IRQSTATUS_INTX		0x0008
> 
> So is this enabling INTX support?  If so, you should do that
> first in a separate patch that only applies to K1 (and that
> should be verified to work correctly).  If all you're doing
> is ensuring the status is cleared, that's OK here, but if
> you don't enable it I'm not sure it matters.
> 

No, it is just cleared.

> > +
> > +#define K3_ADDR_INTR_STATUS1			0x0018
> > +
> > +#define K3_CACHE_MSTR_AWCACHE_MODE	GENMASK(14, 11)
> > +#define K3_CACHE_MSTR_AWCACHE_BEHAVIOR	0xf
> >   /* Some controls require APMU regmap access */
> >   #define SYSCON_APMU			"spacemit,apmu"
> > @@ -48,6 +59,9 @@
> >   #define PCIE_CONTROL_LOGIC			0x0004
> >   #define PCIE_SOFT_RESET			BIT(0)
> > +#define PCIE_PERSTN_OE			BIT(24)
> > +#define PCIE_PERSTN_OUT			BIT(25)
> > +#define PCIE_IGNORE_PERSTN		BIT(31)
> >   struct k1_pcie;
> > @@ -340,6 +354,109 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
> >   	return ret;
> >   }
> 
> I ask a few questions in this function; I'm basically
> asking "are you *sure* this must be different for K3
> than K1?"  Because for the most part this function looks
> very similar to k1_pcie_init().
> 

Actually I was told from the vendor, and I had limit detail
about the regsiter. So I have to treat them as different
chip. And there is no public evidence that show they share
a similar design.

In my personal view, the common part of the IP should be
the same as they are both desingware IP, but for the vendor
specific part, I think the vendor does change something
heavily.

By checking your following advice, I found you stepped into
a bad design that reuse everything without checking its logic.
I agree with the common function point should be abstracted
and reused. But I do not think it is a good way to reuse the
a logic sequence as it improve nothing and make the reader
confused.

Also, Improving K1 is beyond this patchset , this patchset
only add the K3 support and reuse some obvious things. This
will following the minimal change. And since I know nothing
about K1 PCIe and you, as the author of this driver, should
know more details about K1 than me. Stop asking me for 
anything about improving K1. It is not the part of this
patchset ane make you silly.

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
> Would it be OK to clear this bit in the reset control
> register for K1 as well?
> 
> > +
> > +	k1_pcie_toggle_soft_reset(k1);
> > +
> > +	ret = k1_pcie_enable_resources(k1);
> > +	if (ret)
> > +		return ret;
> > +
> > +	regmap_set_bits(k1->pmu, reset_ctrl, PCIE_AUX_PWR_DET);
> > +	regmap_clear_bits(k1->pmu, reset_ctrl, APP_HOLD_PHY_RST);
> > +
> > +	ret = k1_pcie_enable_phy(k1);
> > +	if (ret) {
> > +		k1_pcie_disable_resources(k1);
> > +		return ret;
> > +	}
> > +
> 
> The handling of PERSTN looks different for K3 than K1.  Could you
> implement a helper function that abstracts the differences?
> 
> I don't really understand what's happening here, but if it's
> comparable to this for K1:
> 
>         /* Deassert fundamental reset (drive PERST# high) */
>         regmap_clear_bits(k1->pmu, reset_ctrl, PCIE_RC_PERST);
> 
> ...then a callback function (similar to parse_port) in the device
> data might be able to be called for both platforms, allowing
> the init function to be common for both.
> 
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
> 
> Here too, you could abstract what's happening and that might
> allow the init function to be common for both (all) platforms.
> 

The comment will be removed as it does not reflect on the real
logic.

> > +	 */
> > +	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> > +			PCIE_PERSTN_OUT | PCIE_PERSTN_OE);
> > +
> > +	val = dw_pcie_readl_dbi(pci, GEN3_EQ_CONTROL_OFF);
> > +	val = u32_replace_bits(val, BIT(7),
> > +			       GEN3_EQ_CONTROL_OFF_PSET_REQ_VEC);
> > +	dw_pcie_writel_dbi(pci, GEN3_EQ_CONTROL_OFF, val);
> > +
> > +	k1_pcie_set_device_id(k1);
> 
> This is done earlier in k1_pcie_init().  Could it be done at the
> same time for both platforms?
> 

It can move, but I think it is necessary. See the consideration 
above.

> > +
> > +	/* Finally, as a workaround, disable ASPM L1 */
> > +	k1_pcie_disable_aspm_l1(k1);
> > +
> > +	return 0;
> > +}
> > +
> > +static int k3_pcie_msi_host_init(struct dw_pcie_rp *pp)
> 
> Why is this needed for K3, but not for K1?  Does this
> enable any functionality that K1 could use and benefit
> from?
> 
> > +{
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	u32 val;
> > +
> > +	dw_pcie_dbi_ro_wr_en(pci);
> > +
> > +	val = dw_pcie_readl_dbi(pci, COHERENCY_CONTROL_3_OFF);
> > +	val = u32_replace_bits(val, K3_CACHE_MSTR_AWCACHE_BEHAVIOR,
> > +			       K3_CACHE_MSTR_AWCACHE_MODE);
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
> 
> This is identical to k1_pcie_ops, so isn't needed.
> 

OK for me.

> > +	.link_up	= k1_pcie_link_up,
> > +	.start_link	= k1_pcie_start_link,
> > +	.stop_link	= k1_pcie_stop_link,
> > +};
> > +
> > +static void k3_pcie_clear_irq_status(struct k1_pcie *k1,
> > +				     u32 *status0, u32 *status1, u32 *status2)
> 
> I don't see any value in this helper function, at
> least not based on how it's used now.  It is used
> exactly once, to clear (by writing) three interrupt
> status registers.  Just do that inline.
> 
> Even if you want to use this helper function in a
> second place (when handling the itnerrupt), don't
> pass in these status arguments, they're not needed
> in the caller.  Just define them here.
> 
> Also you could read/write each register, and use
> a single local variable (status) to hold the value
> read and written.
> 

It fine for me. I will merge it in to the probe function.

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
> > +	u32 status0, status1, status2;
> > +
> > +	k3_pcie_clear_irq_status(k1, &status0, &status1, &status2);
> 
> Is it really necessary to clear the IRQ status *only* for K3?
> It seems like it would be a good idea (or at least harmless)
> to do it for K1 as well.  And in that case, it should just be
> added to the existing k1_pcie_parse_port() function.
> 
> > +
> > +	return k1_pcie_parse_port(k1);
> > +}
> > +
> >   static int k1_pcie_probe(struct platform_device *pdev)
> >   {
> >   	const struct k1_pcie_device_data *data;
> > @@ -417,8 +534,17 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
> >   	.device_id	= PCI_DEVICE_ID_SPACEMIT_K1,
> >   };
> > +static const struct k1_pcie_device_data k3_pcie_device_data = {
> > +	.host_ops	= &k3_pcie_host_ops,
> > +	.ops		= &k3_pcie_ops,
> 
> I think ops could just point to k1_pcie_ops here.
> 
> 					-Alex
> 
> > +	.parse_port	= k3_pcie_parse_port,
> > +	.max_phy_count	= 6,
> > +	.device_id	= PCI_DEVICE_ID_SPACEMIT_K3,
> > +};
> > +
> >   static const struct of_device_id k1_pcie_of_match_table[] = {
> >   	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data},
> > +	{ .compatible = "spacemit,k3-pcie", .data = &k3_pcie_device_data},
> >   	{ }
> >   };
> 
