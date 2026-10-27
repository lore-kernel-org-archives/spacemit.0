Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090632;
	b=lFr2XnWmQ2w4ENsjPFiiBXuRGsxSIxJlA6kDRGdKaEJZf2XU2RSOwdF0KnskhC1ziHlf
	 xMh6IRoj3yBaLPzWsZ97BRqt09M1xic5w/HJIrsY5LtUXP4TftEqDhWz/+mQNFnye9fxj
	 G7+hYSfgDxg9CPg9YhlyLnkJAsK88rtWYVWyBv1+wtLhJU/SbuBHFwH37Nf44xtyoue9L
	 Zu+dzArBQATOo0F/oo7yGhsCLyhIPgZGZtKyTRsI/IXpvOMW3mD6hesbxOL8rpkZj4QQG
	 gfHAnlhXWSuwjmMMxt5YLHbkNkYOSRrD4HOLrjXlPi6Msg1x0APzvxQF/HbtB7b/YZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=WdGWi2lCPsVOQrfWu4TCiPig1JxwAx4MQlsKT53PN3c=;
	b=3Cai5ry3RtnJ7xxSA6ytJFshMe0TNUuYW4r/pD4ZxQlCq/rxE3q0ahrMl27SAupgVqzt
	 Ch1/OSNK78NJZuraRLODN/f/3nbuWSigC8z9VSCHKlYR6ecNFLLOD+hss7mSPRxXNWEB0
	 N4gQznZITLt4vUkK8Ez7glyJ+sEn27BfY9IOB1N7DgN9SBb188QqOd6ZYaOVLC/WfSEbc
	 bxMWa+H5ubH+KvagvCUNGwnj/njlsG2DxfeGttPMGfu1mw7d5Netymw6mdA9Zw0tQwhCw
	 UPC1HTjefOMYpU/rrUqygiqRAZs74Pgli52407jrEKksaQw7emzIB6YYb4Rnl9P8E9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NJHF3vSS;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81160606A31B
	for <spacemit@lists.linux.dev>; Tue, 27 Oct 2026 08:43:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81160606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NJHF3vSS
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ea0efd636dso31000845ad.0
        for <spacemit@lists.linux.dev>; Tue, 27 Oct 2026 01:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793090631; x=1793695431; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WdGWi2lCPsVOQrfWu4TCiPig1JxwAx4MQlsKT53PN3c=;
        b=NJHF3vSSQnYu9NkNGtKm2EUwDMKwJAznoW9N4s+8IUB3TPn3kje3t6fxHb1Ct4JpNH
         TM0wIhHqP9pY4ivVix//IVTmrIsfNwbgBOleGqYYgwTWrbk6EHy2gGx40dVapvCP6ut2
         vJEn0BN09XMVBkASSLCQYEHMfRS7W05SwGkcIwa//qmLM0+0NVNRJckdVQCcTK0uO/bd
         nYabnf5spL1snJE5CaewIylxpNgWpeA0B0VrT0zTDMEJjjfffmPNKAxgg/eoZu466Q9D
         5/QhEuKiNQdd5ZwvbIhMPAw0WRU2deg51tpcKQNbn7XPjhskBER8kqIkKsV2SskpwtDg
         5f2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090631; x=1793695431;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WdGWi2lCPsVOQrfWu4TCiPig1JxwAx4MQlsKT53PN3c=;
        b=SyhYiVFvCNxvQtbTzNxWwuNV/vYuXPYZv9x8oDPLUj4nQxSaMB0YFGzoPf48qLp+dC
         zeoCA5wIOhdkB/vfzo9QGbX4B6dyp4/Y+Z8AWVW5I4fjBr3sRIue0sBI0pbDxxLxYGwV
         AxV6Abo2whcH2CMQJX4pUMX4WpeS+3Rez6MQyB6JOJVWI0nPgs8eWC7c4yKs2LW5DiZ7
         cbCs9mv6V9rap6BoPBDM9ruPuj9xdju/WKL3uiNrCARHgBwQXPt6FTMSYHSqkDr/w5Dr
         Ozs7p/p0gg4027H5GsSXenR5cP6dMwSQ1qBWnr8nwGRAjhuViXAskBAi8djflSNk39/k
         /j6Q==
X-Forwarded-Encrypted: i=1; AKwUvBx6LJetsBsF3U9YnD0g8o3eHI3PI9my50J9p336Zsfr2TgNTWwvak/ZTYMuw66vNOtiZZgkqCiZPg==@lists.linux.dev
X-Gm-Message-State: AFq9FYLBckKMjLbwUo+1D1xVgUwLS0CLQ6IDs2zQ5OVs9D4XNSTSiukU
	LIAV5jP8BTUAyn0v18ivmZoBR8gdzKGQ/PRya7oDnAhIEE4V1K0ZPvFT
X-Gm-Gg: AYBFou00uEY6iBviiFP+xCUUNevRS35nCCHvAe/fRyNQZGBJk4+gU8vCJqArApgitSr
	foCZHHQ5TQ7/VnktAo/dXzc2cyRv2Gf1exIOMGd0MFRzURAjLJzigAt8IXSlqPqFvAKSQlZJqbq
	0XmtOdAsL0p66Pn0Ljp5XzrMwKw1XLsX0rkrku17I9hcsbzWtO8zDKOhOHif7R35iz5rKYKABTe
	2DsbHcNDzzHeXp+ley5mrGLtLq7APjl7stRoOiO1y1TdV5yEqADySIpzNArHiVHBLvue/wR5899
	P4DZB4H78QlYB83uZF9QYSWAaYx8/cUuVsMXg+lLoHkBwvHjGljlPSAwayE2a5AOKyqFGN5ppS6
	5vkXlRli7hyV8V7loTKdMCfLep/MM9fYwD9mxI8y3wFuMJ7slsi/0BYNght7ikG+VKhQnmDx/fJ
	i/v908cj0njuKswziFJ5CrFS432OUuAS3ZDiu33Mc1vJXO9GDwg7YvYaDnJiXc22SfcWtxvyuvE
	9f7jiuSu6loU6HW5h8+BBsAb0jVbrYJKExbPeXCHhiTVgxb/BYqOg==
X-Received: by 2002:a17:903:2389:b0:2e9:6788:9379 with SMTP id d9443c01a7336-2ea9c821072mr73512925ad.32.1793090630759;
        Tue, 27 Oct 2026 01:43:50 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm5640215ad.35.2026.10.27.01.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:43:50 -0700 (PDT)
Date: Tue, 27 Oct 2026 16:43:04 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Frank Li <Frank.Li@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Niklas Cassel <cassel@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Randolph Lin <randolph@andestech.com>, Xincheng Zhang <zhangxincheng@ultrarisc.com>, 
	Alex Elder <elder@riscstar.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, Vidya Sagar <vidyas@nvidia.com>, 
	Pengpeng Hou <pengpeng@iscas.ac.cn>, Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v7 6/6] PCI: spacemit-k1: Add Spacemit K3 PCIe host
 controller support
Message-ID: <auBkBSr5N_FlCPxD@inochi.infowork>
References: <20260929083755.458238-1-inochiama@gmail.com>
 <20260929083755.458238-7-inochiama@gmail.com>
 <179232693939.2114.10956498814503201256.b4-reply@b4>
 <athvDzJHs7WQmBnx@inochi.infowork>
 <bddc44d0-5446-40a9-b211-28d0b03f89ad@ti.com>
 <179308804504.2479.5374380919602671853.b4-reply@b4>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179308804504.2479.5374380919602671853.b4-reply@b4>

On Tue, Oct 27, 2026 at 01:30:45PM +0530, Manivannan Sadhasivam wrote:
> On 2026-10-21 13:56 +0530, Siddharth Vadapalli wrote:
> > On 10/21/26 1:26 PM, Inochi Amaoto wrote:
> > > On Sun, Oct 18, 2026 at 06:05:39PM +0530, Manivannan Sadhasivam wrote:
> > >> On 2026-09-29 16:37 +0800, Inochi Amaoto wrote:
> > >>> The PCIe controller on Spacemit K3 is almost a standard Synopsys
> > >>> DesignWare PCIe IP with extra link and reset control. Unlike
> > >>> the PCIe controller on K1, this controller supports external MSI
> > >>> interrupt controller and can use multiple PHYs at the same time.
> > >>>
> > >>> Add driver to support PCIe controller on Spacemit K3 PCIe.
> > >>>
> > >>> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > >>> ---
> > >>>   drivers/pci/controller/dwc/Kconfig            |   4 +-
> > >>>   drivers/pci/controller/dwc/pcie-spacemit-k1.c | 139 ++++++++++++++++++
> > >>>   2 files changed, 141 insertions(+), 2 deletions(-)
> > >>>
> > >>> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> > >>> index dcfbe7e229fd..f9c27165260e 100644
> > >>> --- a/drivers/pci/controller/dwc/Kconfig
> > >>> +++ b/drivers/pci/controller/dwc/Kconfig
> > >>> @@ -443,7 +443,7 @@ config PCIE_SOPHGO_DW
> > >>>   	  Sophgo SoCs.
> > >>>   
> > >>>   config PCIE_SPACEMIT_K1
> > >>> -	tristate "SpacemiT K1 PCIe controller (host mode)"
> > >>> +	tristate "SpacemiT PCIe controller (host mode)"
> > >>>   	depends on ARCH_SPACEMIT || COMPILE_TEST
> > >>>   	depends on HAS_IOMEM
> > >>>   	select PCIE_DW_HOST
> > >>> @@ -451,7 +451,7 @@ config PCIE_SPACEMIT_K1
> > >>>   	default ARCH_SPACEMIT
> > >>>   	help
> > >>>   	  Enables support for the DesignWare based PCIe controller in
> > >>> -	  the SpacemiT K1 SoC operating in host mode.  Three controllers
> > >>> +	  the SpacemiT SoC operating in host mode. Three controllers
> > >>>   	  are available on the K1 SoC; the first of these shares a PHY
> > >>>   	  with a USB 3.0 host controller (one or the other can be used).
> > >>>   
> > >>> diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > >>> index ec59ccb710ec..61b430f2294a 100644
> > >>> --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > >>> +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > >>> @@ -28,8 +28,18 @@
> > >>>   #define SMLH_LINK_UP			BIT(1)
> > >>>   #define RDLH_LINK_UP			BIT(12)
> > >>>   
> > >>> +#define INTR_STATUS				0x0010
> > >>> +
> > >>>   #define INTR_ENABLE				0x0014
> > >>>   #define MSI_CTRL_INT			BIT(11)
> > >>> +#define RDLH_LINK_UP_INT		BIT(20)
> > >>> +
> > >>> +#define K3_PHY_AHB_IRQSTATUS_INTX		0x0008
> > >>> +
> > >>> +#define K3_ADDR_INTR_STATUS1			0x0018
> > >>> +
> > >>> +#define K3_CACHE_MSTR_AWCACHE_MODE	GENMASK(14, 11)
> > >>> +#define K3_CACHE_MSTR_AWCACHE_BEHAVIOR	0xf
> > >>>   
> > >>>   /* Some controls require APMU regmap access */
> > >>>   #define SYSCON_APMU			"spacemit,apmu"
> > >>> @@ -44,6 +54,9 @@
> > >>>   
> > >>>   #define PCIE_CONTROL_LOGIC			0x0004
> > >>>   #define PCIE_SOFT_RESET			BIT(0)
> > >>> +#define PCIE_PERSTN_OE			BIT(24)
> > >>> +#define PCIE_PERSTN_OUT			BIT(25)
> > >>> +#define PCIE_IGNORE_PERSTN		BIT(31)
> > >>>   
> > >>>   struct k1_pcie;
> > >>>   
> > >>> @@ -315,6 +328,123 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
> > >>>   	return ret;
> > >>>   }
> > >>>   
> > >>> +static int k3_pcie_init(struct dw_pcie_rp *pp)
> > >>> +{
> > >>> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > >>> +	struct k1_pcie *k1 = to_k1_pcie(pci);
> > >>> +	u32 reset_ctrl = k1->pmu_off + PCIE_CLK_RESET_CONTROL;
> > >>> +	u32 val;
> > >>> +	int ret;
> > >>> +
> > >>> +	regmap_clear_bits(k1->pmu, reset_ctrl, LTSSM_EN);
> > >>> +
> > >>> +	k1_pcie_toggle_soft_reset(k1);
> > >>> +
> > >>> +	/* K3: Set IGNORE_PERSTN and drive PERSTN_OE high (assert reset) */
> > >>> +	regmap_update_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> > >>> +			   PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE | PCIE_PERSTN_OUT,
> > >>> +			   PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE);
> > >>> +
> > >>> +	ret = k1_pcie_enable_resources(k1);
> > >>> +	if (ret)
> > >>> +		goto failed_resources;
> > >>> +
> > >>> +	regmap_set_bits(k1->pmu, reset_ctrl, PCIE_AUX_PWR_DET);
> > >>> +	regmap_clear_bits(k1->pmu, reset_ctrl, APP_HOLD_PHY_RST);
> > >>> +
> > >>> +	ret = phy_bulk_init(k1->phy_count, k1->phys);
> > >>> +	if (ret)
> > >>> +		goto failed_phy_init;
> > >>
> > >> You got me confused with this PHY bulk API for a moment. I think you are trying
> > >> to control all the PHYs of the multi-port RC setup at once. But I believe
> > >> that's not what we want mostly. Each port is an independent entity with its own
> > >> PHY, PERST# etc... So the RC driver controlling all the PHYs at once, doesn't
> > >> seem logical.
> > >>
> > > 
> > > In fact this thing is different. Accoring to statement from spacemit,
> > > for software, it does not need to care about how the phy topology,
> > > and which phy/phys is/are attached to the RC. It just needs to enable
> > > all the phy and configure the APMU, which is the one that give some
> > > control on PERST# and others. The phy itself does nothing on this.
> > According to section "14.1.4 PHY Configuration Block Diagram" in the User 
> > Manual for the Spacemit K3 SoC [0],the x8 Lane PCIe Controller namely 'PCIe 
> > A' requires multiple PHYs (ranging from PHY0 to PHY5) to be 
> > initialized/enabled simultaneously for a single Root-Port configuration. So 
> > the phy_bulk_init() API here seems to be used in that sense. Mani's concern 
> > is that the PHYs for all PCIe Controller instances are being configured in 
> > a single invocation to phy_bulk_init() rather than the potentially multiple 
> > PHY instances of a single PCIe Controller instance. Since k3_pcie_init is 
> > invoked per Root-Port instance (i.e. per PCIe Controller instance), the 
> > phy_bulk_init() API should configure 'all' PHY instances _strictly_ 
> > associated with the corresponding PCIe instance. This might already be the 
> > case.
> > 
> > [0]: 
> > https://spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k3/k3_docs/k3_usermanual/14_connectivity/pcie.md
> > 
> 
> Thanks for sharing the link to the doc. I didn't know this SoC allows muxing
> multiple PHYs for a single RP. Now the bulk API makes sense!
> 
> For the next iteration, please include a link to this page.
> 
> - Mani
> 

OK, I will include that, thanks.

Regards,
Inochi
