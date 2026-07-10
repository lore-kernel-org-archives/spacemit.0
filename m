Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C292C4343E1
	for <spacemit@lists.linux.dev>; Fri, 10 Jul 2026 16:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783699315; cv=none; b=R+fZ6p1mF9iGIPN+RsGlPhzoHqEqjJ+ODryMp0LNurzpunP8WztBlH4CAV0dXNinAPtTyt8uAy3HB4WBenZ5ChO3l0UWMhqHloTV0IVrvns+Rrwoq8+CYtkJ1Qljdb6lyZa0axBFZRSxk8rBm+f4zLJtkk98P92+hIM5T113VOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783699315; c=relaxed/simple;
	bh=BuusjmyLM9llTrQ0v7SsMQLhFi2DSB/Rbltw114e7q8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hVv1jhmVWuVbS8zl/WMq8q4UnAqT6dIzIwZ+67kiBOf5g3yGRzuss2sPpJZCVi1qq4ZkFOioUHNHoJWaNbRae3Dst9KNyS/p9AcQ/zvuBgH+uGFY86hmJ52D99s0yjDz6nz8gxlrfeNNvNNiUDYaH2KEG8i5Ht28NJ+LSCjsNwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=aqbzgk9B; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="aqbzgk9B"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51c0ecfaee7so6664031cf.0
        for <spacemit@lists.linux.dev>; Fri, 10 Jul 2026 09:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1783699307; x=1784304107; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fWNfOaNlHk0GiFu1v0JlG7D8WzjWj+a5Z4WDgZZuLZs=;
        b=aqbzgk9BOQDEJNSis0B79XJ/Ah9F+GwStRp0TyxJzFeIFwOogKal6gtixpJxdbi6Ad
         XdtHvW8Z1kGU1b3dPm59dArK3Zvv9J4Ev92NVHC1YNWZqmfTcdURyoLYgtbbdsTBZkqH
         bq150jOQR3Y9Ms9wu5C+33ILEVs8jPoqZmJrr7Bf/ypTBMVM9S5ZzBhwVOeoPcsjJi4A
         ToXO2MnpWLf7wD0VZm8Er1u/F41FXpf3C4naSy7bwMP3z2G08MSNzD5p5Cs5clPOVx3i
         yWCBaw/KgMcQWRSylGltm/yQEPMRuWsuWciUNdf4/T+AOtXd042+kloxKbHFK2lv/L6L
         sJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783699307; x=1784304107;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fWNfOaNlHk0GiFu1v0JlG7D8WzjWj+a5Z4WDgZZuLZs=;
        b=rlR3BjvdWkjdcSoFGxTLN9SHqZQE5/ZVcvCBllYqLNDPnS+ZrVbnvdPZ+4SRaQNLJk
         FcvJoOHFgL5+X3ysu6Y/PjIpFADdgoxoONw2N+2FKarKNgykfNBDw8vIKAQ3oeQrhXYd
         xKAvLMylazbMy+PGRzeiAp36Y0qAzoJcxCNW4uEPGKLNrcf1ejU6hSZYjm8LFtISeXJT
         ahq6gFhjfr/x/SBNENDEBZjVwIv/3MaOGjxlF9YZlGRQIpW6TCR5Hs3+SWye4A4PiPyz
         uzMGO4n2SedpmUzLL/BYdyo1JPMT+YM3qsDMHEfp9hPJ6BvcvJsoeEiJtmLW0ss+lGZ6
         juQQ==
X-Forwarded-Encrypted: i=1; AHgh+RqhJZzaTzjCMOSsjorelcgw+EUsDgj3cUjjj10p4tXqXZlJ+ohbsOFO+1Kx2BlgGYSjFMLcnduRmA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwI1d6xinFrKQXjmS6lu907Xa1j5VV8HUxdcKAZoWB0xpzbGJOr
	u19BoYaF5jxnglWGr9oLdyyDqlOzd5a1gVOXZs0sRHWgASc0+j5CFVPwrah0QqdSfTA=
X-Gm-Gg: AfdE7ckxBNoXHR7Iy3oEzb8JZBzyQPW/BY9OxcXodMA7Wa2ZemtAJ08zC2lOkWI5m5D
	XQWZoPs6HWtenMUObROO8SdB0fh09CTcRxMFX17VNGXcwhrEmQ+c5B5NOa2uCaxxhCut8yflmf/
	NdP9jrpjsrbmN4KbqBeUED760CrloDgEDreV/g/FZ4ETPIgit76mAzfPlS6oLuZNYpr7CmOCMoK
	gWuXzIThkZYLXL0avexqif/XCEFYHkfu+qjv0O/2Vdbrigr7EVCfNWJXghHR49napm/pkgN+4U6
	gDeGn+hFH9NAJFa2jw0Xws9/lqBV9SsjTTPcSs2ve4o+mmD2SkMG21sq/fuccLYXDB+L+ce4cVp
	i+0/rygxqfWK+mtNgjbXrIxKaSUa8HYzTrP122jIVOmXkxZWC6IJkCp0BxiUtCsF/6M9tYEWMw6
	9xrLK+G9j9hOxV
X-Received: by 2002:a05:622a:1aa5:b0:51c:7b12:5fff with SMTP id d75a77b69052e-51c8b57c8e8mr126511541cf.75.1783699306855;
        Fri, 10 Jul 2026 09:01:46 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caaf5f61csm18644921cf.22.2026.07.10.09.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 09:01:46 -0700 (PDT)
Message-ID: <900e6239-bc00-46b6-aa9f-abe219c039d2@riscstar.com>
Date: Fri, 10 Jul 2026 11:01:44 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] PCI: spacemit-k1: Add Spacemit K3 PCIe host
 controller support
To: Inochi Amaoto <inochiama@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Christian Bruel <christian.bruel@foss.st.com>, Frank Li <Frank.Li@nxp.com>,
 Nam Cao <namcao@linutronix.de>, Qiang Yu <qiang.yu@oss.qualcomm.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Xincheng Zhang <zhangxincheng@ultrarisc.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Vidya Sagar <vidyas@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-7-inochiama@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260709040027.958400-7-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/8/26 11:00 PM, Inochi Amaoto wrote:
> The PCIe controller on Spacemit K3 is almost a standard Synopsys
> DesignWare PCIe IP with extra link and reset control. Unlike
> the PCIe controller on K1, this controller supports external MSI
> interrupt controller and can use multiple PHYs at the same time.
> 
> Add driver to support PCIe controller on Spacemit K3 PCIe.

I think it would be good to summarize how the K3 differs from
the K1 here as well, since they're sharing code.  It looks
like it supports up to 6 PHYs, not just 1 (as the K1 does).

> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>   drivers/pci/controller/dwc/Kconfig            |   4 +-
>   drivers/pci/controller/dwc/pcie-spacemit-k1.c | 126 ++++++++++++++++++
>   2 files changed, 128 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index aa0b784c85b4..dacbac5cc35c 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -440,7 +440,7 @@ config PCIE_SOPHGO_DW
>   	  Sophgo SoCs.
>   
>   config PCIE_SPACEMIT_K1
> -	tristate "SpacemiT K1 PCIe controller (host mode)"
> +	tristate "SpacemiT PCIe controller (host mode)"
>   	depends on ARCH_SPACEMIT || COMPILE_TEST
>   	depends on HAS_IOMEM
>   	select PCIE_DW_HOST
> @@ -448,7 +448,7 @@ config PCIE_SPACEMIT_K1
>   	default ARCH_SPACEMIT
>   	help
>   	  Enables support for the DesignWare based PCIe controller in
> -	  the SpacemiT K1 SoC operating in host mode.  Three controllers
> +	  the SpacemiT SoC operating in host mode. Three controllers
>   	  are available on the K1 SoC; the first of these shares a PHY
>   	  with a USB 3.0 host controller (one or the other can be used).
>   
> diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> index 31aac056b68e..680acc93f539 100644
> --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> @@ -23,6 +23,7 @@
>   
>   #define PCI_VENDOR_ID_SPACEMIT		0x201f
>   #define PCI_DEVICE_ID_SPACEMIT_K1	0x0001
> +#define PCI_DEVICE_ID_SPACEMIT_K3	0x0002
>   
>   /* Offsets and field definitions for link management registers */
>   #define K1_PHY_AHB_IRQ_EN			0x0000
> @@ -32,8 +33,18 @@
>   #define SMLH_LINK_UP			BIT(1)
>   #define RDLH_LINK_UP			BIT(12)
>   
> +#define INTR_STATUS				0x0010

This register offset should probably be named K3_PHY_INTR_STATUS
(or maybe it's just K3_INTR_STATUS?).  I see that INTR_ENABLE
doesn't have a prefix, and I don't know why--that should have
a similar name.  (Please fix that in your next version as well;
I think it's OK to included it with this patch with a simple
mention in the patch description.)

> +
>   #define INTR_ENABLE				0x0014
>   #define MSI_CTRL_INT			BIT(11)
> +#define RDLH_LINK_UP_INT		BIT(20)
> +
> +#define K3_PHY_AHB_IRQSTATUS_INTX		0x0008

So is this enabling INTX support?  If so, you should do that
first in a separate patch that only applies to K1 (and that
should be verified to work correctly).  If all you're doing
is ensuring the status is cleared, that's OK here, but if
you don't enable it I'm not sure it matters.

> +
> +#define K3_ADDR_INTR_STATUS1			0x0018
> +
> +#define K3_CACHE_MSTR_AWCACHE_MODE	GENMASK(14, 11)
> +#define K3_CACHE_MSTR_AWCACHE_BEHAVIOR	0xf
>   
>   /* Some controls require APMU regmap access */
>   #define SYSCON_APMU			"spacemit,apmu"
> @@ -48,6 +59,9 @@
>   
>   #define PCIE_CONTROL_LOGIC			0x0004
>   #define PCIE_SOFT_RESET			BIT(0)
> +#define PCIE_PERSTN_OE			BIT(24)
> +#define PCIE_PERSTN_OUT			BIT(25)
> +#define PCIE_IGNORE_PERSTN		BIT(31)
>   
>   struct k1_pcie;
>   
> @@ -340,6 +354,109 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
>   	return ret;
>   }
>   

I ask a few questions in this function; I'm basically
asking "are you *sure* this must be different for K3
than K1?"  Because for the most part this function looks
very similar to k1_pcie_init().

> +static int k3_pcie_init(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct k1_pcie *k1 = to_k1_pcie(pci);
> +	u32 reset_ctrl = k1->pmu_off + PCIE_CLK_RESET_CONTROL;
> +	u32 val;
> +	int ret;
> +
> +	regmap_clear_bits(k1->pmu, reset_ctrl, LTSSM_EN);

Would it be OK to clear this bit in the reset control
register for K1 as well?

> +
> +	k1_pcie_toggle_soft_reset(k1);
> +
> +	ret = k1_pcie_enable_resources(k1);
> +	if (ret)
> +		return ret;
> +
> +	regmap_set_bits(k1->pmu, reset_ctrl, PCIE_AUX_PWR_DET);
> +	regmap_clear_bits(k1->pmu, reset_ctrl, APP_HOLD_PHY_RST);
> +
> +	ret = k1_pcie_enable_phy(k1);
> +	if (ret) {
> +		k1_pcie_disable_resources(k1);
> +		return ret;
> +	}
> +

The handling of PERSTN looks different for K3 than K1.  Could you
implement a helper function that abstracts the differences?

I don't really understand what's happening here, but if it's
comparable to this for K1:

         /* Deassert fundamental reset (drive PERST# high) */
         regmap_clear_bits(k1->pmu, reset_ctrl, PCIE_RC_PERST);

...then a callback function (similar to parse_port) in the device
data might be able to be called for both platforms, allowing
the init function to be common for both.

> +	/* K3: Set IGNORE_PERSTN and drive PERSTN_OE high (assert reset) */
> +	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> +			PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE | PCIE_PERSTN_OUT);
> +	usleep_range(1000, 2000);
> +	regmap_clear_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC, PCIE_PERSTN_OUT);
> +
> +	msleep(PCIE_T_PVPERL_MS);
> +
> +	/*
> +	 * Put the controller in root complex mode, and indicate that
> +	 * Vaux (3.3v) is present.

Here too, you could abstract what's happening and that might
allow the init function to be common for both (all) platforms.

> +	 */
> +	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> +			PCIE_PERSTN_OUT | PCIE_PERSTN_OE);
> +
> +	val = dw_pcie_readl_dbi(pci, GEN3_EQ_CONTROL_OFF);
> +	val = u32_replace_bits(val, BIT(7),
> +			       GEN3_EQ_CONTROL_OFF_PSET_REQ_VEC);
> +	dw_pcie_writel_dbi(pci, GEN3_EQ_CONTROL_OFF, val);
> +
> +	k1_pcie_set_device_id(k1);

This is done earlier in k1_pcie_init().  Could it be done at the
same time for both platforms?

> +
> +	/* Finally, as a workaround, disable ASPM L1 */
> +	k1_pcie_disable_aspm_l1(k1);
> +
> +	return 0;
> +}
> +
> +static int k3_pcie_msi_host_init(struct dw_pcie_rp *pp)

Why is this needed for K3, but not for K1?  Does this
enable any functionality that K1 could use and benefit
from?

> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	u32 val;
> +
> +	dw_pcie_dbi_ro_wr_en(pci);
> +
> +	val = dw_pcie_readl_dbi(pci, COHERENCY_CONTROL_3_OFF);
> +	val = u32_replace_bits(val, K3_CACHE_MSTR_AWCACHE_BEHAVIOR,
> +			       K3_CACHE_MSTR_AWCACHE_MODE);
> +	dw_pcie_writel_dbi(pci, COHERENCY_CONTROL_3_OFF, val);
> +
> +	dw_pcie_dbi_ro_wr_dis(pci);
> +
> +	return 0;
> +}
> +
> +static const struct dw_pcie_host_ops k3_pcie_host_ops = {
> +	.init		= k3_pcie_init,
> +	.deinit		= k1_pcie_deinit,
> +	.msi_init	= k3_pcie_msi_host_init,
> +};
> +
> +static const struct dw_pcie_ops k3_pcie_ops = {

This is identical to k1_pcie_ops, so isn't needed.

> +	.link_up	= k1_pcie_link_up,
> +	.start_link	= k1_pcie_start_link,
> +	.stop_link	= k1_pcie_stop_link,
> +};
> +
> +static void k3_pcie_clear_irq_status(struct k1_pcie *k1,
> +				     u32 *status0, u32 *status1, u32 *status2)

I don't see any value in this helper function, at
least not based on how it's used now.  It is used
exactly once, to clear (by writing) three interrupt
status registers.  Just do that inline.

Even if you want to use this helper function in a
second place (when handling the itnerrupt), don't
pass in these status arguments, they're not needed
in the caller.  Just define them here.

Also you could read/write each register, and use
a single local variable (status) to hold the value
read and written.

> +{
> +	*status0 = readl_relaxed(k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
> +	*status1 = readl_relaxed(k1->link + INTR_STATUS);
> +	*status2 = readl_relaxed(k1->link + K3_ADDR_INTR_STATUS1);
> +
> +	writel_relaxed(*status0, k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
> +	writel_relaxed(*status1, k1->link + INTR_STATUS);
> +	writel_relaxed(*status2, k1->link + K3_ADDR_INTR_STATUS1);
> +}
> +
> +static int k3_pcie_parse_port(struct k1_pcie *k1)
> +{
> +	u32 status0, status1, status2;
> +
> +	k3_pcie_clear_irq_status(k1, &status0, &status1, &status2);

Is it really necessary to clear the IRQ status *only* for K3?
It seems like it would be a good idea (or at least harmless)
to do it for K1 as well.  And in that case, it should just be
added to the existing k1_pcie_parse_port() function.

> +
> +	return k1_pcie_parse_port(k1);
> +}
> +
>   static int k1_pcie_probe(struct platform_device *pdev)
>   {
>   	const struct k1_pcie_device_data *data;
> @@ -417,8 +534,17 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
>   	.device_id	= PCI_DEVICE_ID_SPACEMIT_K1,
>   };
>   
> +static const struct k1_pcie_device_data k3_pcie_device_data = {
> +	.host_ops	= &k3_pcie_host_ops,
> +	.ops		= &k3_pcie_ops,

I think ops could just point to k1_pcie_ops here.

					-Alex

> +	.parse_port	= k3_pcie_parse_port,
> +	.max_phy_count	= 6,
> +	.device_id	= PCI_DEVICE_ID_SPACEMIT_K3,
> +};
> +
>   static const struct of_device_id k1_pcie_of_match_table[] = {
>   	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data},
> +	{ .compatible = "spacemit,k3-pcie", .data = &k3_pcie_device_data},
>   	{ }
>   };
>   

