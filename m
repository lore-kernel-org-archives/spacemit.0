Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE7D4519A6
	for <spacemit@lists.linux.dev>; Wed,  9 Sep 2026 07:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940297; cv=none; b=tCxVAAb8JpOpSFosLnvwphfVqEcnV3vIp8zvBTUqVrvxr3tM61yeuCf2TPu+avOpuSk0aVv4gtzlGegG148KJUH45PaEV1VlfGyxaQxGGZC53P7IcvWLSLPxuy5X+xAP5OQJH9ST42mTgwQrhvOM5ZCSGU7h/Q6v87Iwv6lrhWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940297; c=relaxed/simple;
	bh=L93RZFfSNxCUGv3IQaOPX+eNMIHvMrFA8PqhAa8TdM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ByDZyvEN4/Tc6FiyIIZa2vhpunoM2Vvp/Izm3bd6VEsshvw8YBpvyyUIfuAkJCrjsVXQ2h5tUiXJv0INwjDgtso3GZR0wfi+Yofw2vqtLZHhZQzzULVFo08vtW75YVIzXrFyGSuB17Us2nMK7l2VCP/AFMEUTiS3YBVrw6XcHfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RUl6Q+HF; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUl6Q+HF"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d944747d41so60560215ad.0
        for <spacemit@lists.linux.dev>; Wed, 09 Sep 2026 00:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788940295; x=1789545095; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jKrEyC/4kP8ddKpasgLPQzfssOl6topa0dwYgM8fxlQ=;
        b=RUl6Q+HFXjpq2Rsw+U62zYnVtOY1nKcz5CzKMwxfRI34VnBB6YoUSzlbyt6p+2CsJU
         mqhEtBsHAH7axu2Gw5Mr983YH4ysklWAgbI8xYcnkxnaPVbhiPXFKW9IGp2hJOX1HhZe
         SAv5wut2Ab+YhPlokoJCBtBn+iHRo123Ayqebrft+P+PPlpec55Oduh7J+iV9dP7mQ+R
         wMJEtqF9MGF9LGB2DhxgoYsvJ3h6/uQFLGpi7gUkHkkKicb+vbnPHdfBCNLqQhFW/RC+
         pUqjC4YR58qDxujSA2UyZfa6MhDFQpzp0F/ckBm0OW5vaCPMGeCXnQoBwYkQg2mah0PI
         elMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940295; x=1789545095;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jKrEyC/4kP8ddKpasgLPQzfssOl6topa0dwYgM8fxlQ=;
        b=P9F6JMjU2ymixn5zcwYH9Uz6kQ681R5bwYMvsL2C5qoSy8AZTlQ4iSW+MjlOhpt4TY
         fk7LSI1jn7WKNPssGPKT0Iiv9ccbo3Z8AhIyyGmqxtispDNAlIMKzaNofTNivO3aBuXU
         xnXkS8tDKBL/tL+s3P9pqHmwUzUXro3VKugPAYoWCZUdQ2KYKTjZLsTgheuQ+sU0nFaI
         rWFqVdCrFvcH0+OOwXhCsVzfQI4U4PljmvKJaxnH7enM4ERwCqWHV/PbKleFe86F0+86
         H9kfnG4OB5qFGI253Fnpfievh+/Id2jWqjw/V9abW67eVdMf1tsL8FFbHRgcwuNnhywo
         g1ww==
X-Forwarded-Encrypted: i=1; AKwUvBzWsHDVBDln42f1DjS8XmWjZFOnS9vobDygfAk4tOsXvsjFVT0zEtU2DCTN4P+WoE1USCODEVux1w==@lists.linux.dev
X-Gm-Message-State: AFuF++lgZdV8jY9TwQYFXxAfrBDrrWkJcuomgXBWQgKqig+1RVSVOPMX
	SfKu/hUh1qlJRvhi95j8GfmSuAUNqusbREyoGK1HUb1QZj+zSTU/H9OW
X-Gm-Gg: AYBFou2kwXfu/SDPpkVtbYvSVvGKF8nTOyhG+N3RjthDqZubCRVEl/qJlj/RyTGLQzL
	1yat5LamS5j6m54RJOSNytljC8d6edd6Ba7st/s77LT8/9OHSzJHFpkgCgRyPtN7BRqMKeE6umQ
	R7M+EPNoRFPbk6k2YZLdQyn3k/QdBIUdtLOy61HlqnMSnpmsEpkxRZ9nokTDDi1ekmZYsj5MtTD
	0fBAXLKleot09foWeT0ckGsvw9yRo9rp9xeMHaztkWAcHvOhbNcYyuvevo+7byARXP6HKC6US2T
	iAKRy2qdOBTyxhFOBCvTQk8jaLDcjitio4LB1KvcH0E8I3sJjDDaQE/gofrzYTW7xv4Xr1CBMwn
	FzJz+Jaiq4BFvOqq3L9tIQulHHl7DBPydqMkTF6E9okOtC5ZYaFy+Rm3WMwuypiOKUaYR4za8QS
	lHOmm2D7s6+1TQRemL1jDxq8h2xOgZag0mjDdp1zuLsY+ffu6lKnTWus7f+nu7yFn/vUKNeA==
X-Received: by 2002:a17:903:3c47:b0:2db:eb5:47ea with SMTP id d9443c01a7336-2db12106896mr504658855ad.0.1788940294598;
        Wed, 09 Sep 2026 00:51:34 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1497d9f9sm67640495ad.32.2026.09.09.00.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:51:33 -0700 (PDT)
Date: Wed, 9 Sep 2026 15:51:02 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Frank Li <Frank.Li@nxp.com>, Niklas Cassel <cassel@kernel.org>, 
	Sherry Sun <sherry.sun@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Bruel <christian.bruel@foss.st.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Alex Elder <elder@riscstar.com>, 
	Xincheng Zhang <zhangxincheng@ultrarisc.com>, Randolph Lin <randolph@andestech.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Vidya Sagar <vidyas@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Danilo Krummrich <dakr@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v5 6/6] PCI: spacemit-k1: Add Spacemit K3 PCIe host
 controller support
Message-ID: <aqEOHmlKdKqQWYE8@inochi.infowork>
References: <20260907112606.465778-1-inochiama@gmail.com>
 <20260907112606.465778-7-inochiama@gmail.com>
 <DL940SRP94AG.408BKFWHDVY3@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DL940SRP94AG.408BKFWHDVY3@linux.spacemit.com>

On Mon, Sep 07, 2026 at 09:14:23PM +0800, Troy Mitchell wrote:
> On Mon, Sep 7, 2026 at 07:26:05PM +0800, Inochi Amaoto wrote:
> > [...]
> >
> > @@ -303,6 +316,116 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
> > [...]
> >
> > +static int k3_pcie_init(struct dw_pcie_rp *pp)
> > +{
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	struct k1_pcie *k1 = to_k1_pcie(pci);
> > +	u32 reset_ctrl = k1->pmu_off + PCIE_CLK_RESET_CONTROL;
> > +	u32 val;
> > +	int ret;
> > +
> > +	regmap_clear_bits(k1->pmu, reset_ctrl, LTSSM_EN);
> > +
> > +	k1_pcie_toggle_soft_reset(k1);
> > +
> > +	/* K3: Set IGNORE_PERSTN and drive PERSTN_OE high (assert reset) */
> > +	regmap_update_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> > +			   PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE | PCIE_PERSTN_OUT,
> > +			   PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE);
> > +
> > +	ret = k1_pcie_enable_resources(k1);
> > +	if (ret)
> > +		goto failed_resources;
> > +
> > +	regmap_set_bits(k1->pmu, reset_ctrl, PCIE_AUX_PWR_DET);
> > +	regmap_clear_bits(k1->pmu, reset_ctrl, APP_HOLD_PHY_RST);
> > +
> > +	ret = phy_bulk_init(k1->phy_count, k1->phys);
> > +	if (ret)
> > +		goto failed_phy;
> > +
> > +	msleep(PCIE_T_PVPERL_MS);
> > +
> > +	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> > +			PCIE_PERSTN_OUT | PCIE_PERSTN_OE);
> > +
> 
> Should we use pci->pe_rst when reset-gpios is provided, and keep the PMU path as
> a fallback? The SDK handles both cases. The DWC core requests that GPIO with
> GPIOD_OUT_HIGH, but this path only releases PERST# through the PMU, so an
> endpoint using the GPIO would remain in reset.
> 

I do not think this should be included in this version. I found PICO-ITX
has no reset gpio support. This means I can not test this feature.

I suggest adding this function when there is a board using this function.

> > [...]
> >
> > +	/* Finally, as a workaround, disable ASPM L1 */
> > +	k1_pcie_disable_aspm_l1(k1);
> > +
> > +	return 0;
> > +
> 
> Would we also need to configure IOMMU bypass during initialization? The SDK sets
> the PCIe A/B/C bypass bits in PMUA_PCIE_SUBSYS_MGMT when there is no usable
> iommu-map. The proposed K3 PCIe DTS has no iommu-map, and I could not find the
> corresponding bypass setup in this series.
> 
> Is bypass already guaranteed by firmware or the reset state, or should the
> driver set it here? My concern is that enumeration could succeed while endpoint
> DMA still goes through an unconfigured IOMMU.
> 

I think the firmware should mark it bypassed as the default, at least
I have notice this behavior, but I am not sure whether it is the builtin
firmware or the uboot do this trick.

> > [...]
> >
> > +static int k3_pcie_parse_port(struct k1_pcie *k1)
> > +{
> > +	u32 status0, status1, status2;
> > +
> > +	/* This register require a RAW for cleanup */
> > +	status0 = readl_relaxed(k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
> > +	status1 = readl_relaxed(k1->link + INTR_STATUS);
> > +	status2 = readl_relaxed(k1->link + K3_ADDR_INTR_STATUS1);
> > +
> > +	writel_relaxed(status0, k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
> > +	writel_relaxed(status1, k1->link + INTR_STATUS);
> > +	writel_relaxed(status2, k1->link + K3_ADDR_INTR_STATUS1);
> > +
> > +	return k1_pcie_parse_port(k1);
> > +}
> > +
> 
> Are these status registers accessible before the controller clocks are enabled
> and resets released? k3_pcie_parse_port() runs before dw_pcie_host_init(), which
> calls k3_pcie_init() to enable those resources.
> 

Yes they can. It is something interesting.

> The SDK uses the same ordering, but I am not sure whether it relies on firmware
> leaving the registers accessible. If so, would it be safer to move this clearing
> into k3_pcie_init(), after enabling the resources?
> 

In fact, I have no idea about which clock control this MMIO area, if it is dbi
clock (but I guest it is not), it is kind of weird for this clear and should
move to the init. Do you have some knowledge on this?

Regards,
Inochi
