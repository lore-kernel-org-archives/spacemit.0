Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F9036E47A
	for <spacemit@lists.linux.dev>; Wed, 23 Sep 2026 01:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790128290; cv=none; b=uVFXb26dfz+wXNVhbwn4k3XTj2MHnBs9rBiWb1Y3/78ug6c6ZuVOyXkmObH3/uQCEuYys3N9gBgJt1EymjHStnRaX/f4RABjQzFj9StwY1gOrozwYbjgmCQPluTmPPE/2Yss9rFDbftevYJq23rqVE5JeKj/8iRfMXIHTBbmx78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790128290; c=relaxed/simple;
	bh=h2OAHMQcGpb0AsWpFEucPqrsPoM9+UcRqt7PH7w3D9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WVpaPXCly8e5uSIm6m+Spd+2l556OCnOwtiCKBPbQsZcOz6vdMt7V+uEbhK6ykgtHL0zHKsV02tJKT8q/z9LOk2JTcDAZoPOldPfivj6Vh1LN58uNd1CTN7auQ+/D1D2u3eWaCnuv6H0wjhw4LMWtYV0t4Cgqy7y2M/sVLDG1Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QdhGxDJn; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QdhGxDJn"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4aa0f1766so377095a12.0
        for <spacemit@lists.linux.dev>; Tue, 22 Sep 2026 18:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790128287; x=1790733087; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3mM3n6clTLJK9jPcXnqbcvBUkpBEQhM5nHViLUCww2U=;
        b=QdhGxDJnpH7SwBSLNG35ED7chVXa+bNzGH3324gA1w4ZO7PtMe9B7dIGSJ4S+i8swk
         hfzbJaEPi6L2BrOGegiNyWlvAtaESLru5QpnXdSqu+BzUwlhNuWoEeWM8Gaei+CI+q5k
         W0C3d1dPMAKh1YVCbNB2AmokuQHxp2cecjfnC6VAeFwu8giQsbhHW0LqOTu5egKexpQk
         gYgN44UGOvXVhRezGnlb3CAOlAjflm9OOVU0UPej08I4jkXBz7w6hcX5opikqlVmqj7w
         4Ivj1KHDkA8C3y2sBogMmwh2mAe4YJy5zfbx0sgBenBCngUjSfJ+YQenQ0/WFumjTOYG
         8PwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790128287; x=1790733087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3mM3n6clTLJK9jPcXnqbcvBUkpBEQhM5nHViLUCww2U=;
        b=0L3YUumk1eZqFRHbG2QCu5omt/KO3EdBYd9oYCFUvNtVDCgtMSLniS+z5gIxRKetph
         sgU1BSgyfgj2mlyc7YIL8HArO9oRH7X1jxjqIpEAlkhCEFeF3bZaV80IZgwEPjN9OZkk
         JRsjgSaY4yAWZD83HCa89paoh36uxJDui8a4EuUDbYY6jyFcoTQ1IML339x2myChjWtC
         9rXN/i+BkGU9UiCOz8igfJnRMe2ODTqN3A+dgJKF6RHec47Wwsr339w3iuMHgigTIvXD
         +McBG55xTL4cere808fx0ZqZbaUvBvpGHUUR1foe+zeVQMxIDOTUVhANic7m64+pmOt3
         nVJA==
X-Forwarded-Encrypted: i=1; AKwUvBz4X+wMITWAeM4ayvoZQ7yYwLjLMTiTr2GqSqrSRxjH2s5bsYrnGAivqu91JziBabJPr8f6LO1IMA==@lists.linux.dev
X-Gm-Message-State: AFuF++ljmZmoqQ7Kp0zc6j/Tb7yn+DoS10NovFkbz8Hxj3aH3n7nkoVL
	02ml4o2Mbq3mQNsa0oodWV+MA0sjueAynrDfqwwlAaVR860pplD+A2X7
X-Gm-Gg: AYBFou2YFzNAvS72MNp0UberOfENhu7t1xU6EFhapi8rLnRm4apz0fMtGcDIetayEZ0
	+9mKag01dFU7AzapqagPKoRSe5LPKKP+IDSJBn93pXItmE5Fc8EKsuxOEpBnZB9TnXAC2/pw9QP
	sq1VTC9/JWjEE7BYlzWTMHqo6aoBXWOVe8pdhbosBqam8meb7M18ygju1iTSgS9D7iB5Q19Abzl
	D3VYCF4uEE6K6tKZQfz8SjfWQ9G/mHdxfS5pVFeftRGmQhCFdroI7dNZ1GdRunWqiNhu8AjjRzp
	1qfjrWxXXHjM53XvSTgQbBy0gSSHVHc5FF9wVpcaYHVeKGmuTU0xfZge30i443XrGRL4GDysnev
	nwm4e3JfOOZOfaet33oTA0hCsCEhTLfmktK3Djywtv3VVmB/KS6pusQtIaSDrmY4Gg7eR84LRnR
	/CBFgxYKvm7bTdJd16U4bqvh8I7E1uKRBKb9pAmy/FWNYBCQ+nf9pUZ9m70w==
X-Received: by 2002:a17:90b:33c9:b0:39e:6c6a:657e with SMTP id 98e67ed59e1d1-3a07e6a6e38mr1007010a91.65.1790128287307;
        Tue, 22 Sep 2026 18:51:27 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddae723sm1924413a91.5.2026.09.22.18.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:51:26 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Sherry Sun <sherry.sun@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vidya Sagar <vidyas@nvidia.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Randolph Lin <randolph@andestech.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v6 6/6] PCI: spacemit-k1: Add Spacemit K3 PCIe host controller support
Date: Wed, 23 Sep 2026 09:50:15 +0800
Message-ID: <20260923015016.64069-7-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923015016.64069-1-inochiama@gmail.com>
References: <20260923015016.64069-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCIe controller on Spacemit K3 is almost a standard Synopsys
DesignWare PCIe IP with extra link and reset control. Unlike
the PCIe controller on K1, this controller supports external MSI
interrupt controller and can use multiple PHYs at the same time.

Add driver to support PCIe controller on Spacemit K3 PCIe.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/Kconfig            |   4 +-
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 139 ++++++++++++++++++
 2 files changed, 141 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index dcfbe7e229fd..f9c27165260e 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -443,7 +443,7 @@ config PCIE_SOPHGO_DW
 	  Sophgo SoCs.
 
 config PCIE_SPACEMIT_K1
-	tristate "SpacemiT K1 PCIe controller (host mode)"
+	tristate "SpacemiT PCIe controller (host mode)"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
 	depends on HAS_IOMEM
 	select PCIE_DW_HOST
@@ -451,7 +451,7 @@ config PCIE_SPACEMIT_K1
 	default ARCH_SPACEMIT
 	help
 	  Enables support for the DesignWare based PCIe controller in
-	  the SpacemiT K1 SoC operating in host mode.  Three controllers
+	  the SpacemiT SoC operating in host mode. Three controllers
 	  are available on the K1 SoC; the first of these shares a PHY
 	  with a USB 3.0 host controller (one or the other can be used).
 
diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index ec59ccb710ec..c3b935f424cd 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -28,8 +28,18 @@
 #define SMLH_LINK_UP			BIT(1)
 #define RDLH_LINK_UP			BIT(12)
 
+#define INTR_STATUS				0x0010
+
 #define INTR_ENABLE				0x0014
 #define MSI_CTRL_INT			BIT(11)
+#define RDLH_LINK_UP_INT		BIT(20)
+
+#define K3_PHY_AHB_IRQSTATUS_INTX		0x0008
+
+#define K3_ADDR_INTR_STATUS1			0x0018
+
+#define K3_CACHE_MSTR_AWCACHE_MODE	GENMASK(14, 11)
+#define K3_CACHE_MSTR_AWCACHE_BEHAVIOR	0xf
 
 /* Some controls require APMU regmap access */
 #define SYSCON_APMU			"spacemit,apmu"
@@ -44,6 +54,9 @@
 
 #define PCIE_CONTROL_LOGIC			0x0004
 #define PCIE_SOFT_RESET			BIT(0)
+#define PCIE_PERSTN_OE			BIT(24)
+#define PCIE_PERSTN_OUT			BIT(25)
+#define PCIE_IGNORE_PERSTN		BIT(31)
 
 struct k1_pcie;
 
@@ -315,6 +328,123 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
 	return ret;
 }
 
+static int k3_pcie_init(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct k1_pcie *k1 = to_k1_pcie(pci);
+	u32 reset_ctrl = k1->pmu_off + PCIE_CLK_RESET_CONTROL;
+	u32 val;
+	int ret;
+
+	regmap_clear_bits(k1->pmu, reset_ctrl, LTSSM_EN);
+
+	k1_pcie_toggle_soft_reset(k1);
+
+	/* K3: Set IGNORE_PERSTN and drive PERSTN_OE high (assert reset) */
+	regmap_update_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
+			   PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE | PCIE_PERSTN_OUT,
+			   PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE);
+
+	ret = k1_pcie_enable_resources(k1);
+	if (ret)
+		goto failed_resources;
+
+	regmap_set_bits(k1->pmu, reset_ctrl, PCIE_AUX_PWR_DET);
+	regmap_clear_bits(k1->pmu, reset_ctrl, APP_HOLD_PHY_RST);
+
+	ret = phy_bulk_init(k1->phy_count, k1->phys);
+	if (ret)
+		goto failed_phy_init;
+
+	ret = phy_bulk_power_on(k1->phy_count, k1->phys);
+	if (ret)
+		goto failed_phy_power_on;
+
+	msleep(PCIE_T_PVPERL_MS);
+
+	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
+			PCIE_PERSTN_OUT | PCIE_PERSTN_OE);
+
+	val = dw_pcie_readl_dbi(pci, GEN3_EQ_CONTROL_OFF);
+	val = u32_replace_bits(val, BIT(7),
+			       GEN3_EQ_CONTROL_OFF_PSET_REQ_VEC);
+	dw_pcie_writel_dbi(pci, GEN3_EQ_CONTROL_OFF, val);
+
+	k1_pcie_set_device_id(k1);
+
+	/* Finally, as a workaround, disable ASPM L1 */
+	k1_pcie_disable_aspm_l1(k1);
+
+	return 0;
+
+failed_phy_power_on:
+	phy_bulk_exit(k1->phy_count, k1->phys);
+failed_phy_init:
+	k1_pcie_disable_resources(k1);
+failed_resources:
+	regmap_update_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
+			   PCIE_PERSTN_OUT | PCIE_PERSTN_OE | PCIE_IGNORE_PERSTN,
+			   PCIE_PERSTN_OUT | PCIE_PERSTN_OE);
+
+	return ret;
+}
+
+static void k3_pcie_deinit(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct k1_pcie *k1 = to_k1_pcie(pci);
+
+	/* Assert fundamental reset (drive PERST# low) */
+	regmap_update_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
+			   PCIE_PERSTN_OUT | PCIE_PERSTN_OE,
+			   PCIE_PERSTN_OE);
+
+	phy_bulk_power_off(k1->phy_count, k1->phys);
+	phy_bulk_exit(k1->phy_count, k1->phys);
+
+	k1_pcie_disable_resources(k1);
+}
+
+static int k3_pcie_msi_host_init(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	u32 val;
+
+	dw_pcie_dbi_ro_wr_en(pci);
+
+	/* For IMSIC interrupt */
+	val = dw_pcie_readl_dbi(pci, COHERENCY_CONTROL_3_OFF);
+	val = u32_replace_bits(val, K3_CACHE_MSTR_AWCACHE_BEHAVIOR,
+			       K3_CACHE_MSTR_AWCACHE_MODE);
+	dw_pcie_writel_dbi(pci, COHERENCY_CONTROL_3_OFF, val);
+
+	dw_pcie_dbi_ro_wr_dis(pci);
+
+	return 0;
+}
+
+static const struct dw_pcie_host_ops k3_pcie_host_ops = {
+	.init		= k3_pcie_init,
+	.deinit		= k3_pcie_deinit,
+	.msi_init	= k3_pcie_msi_host_init,
+};
+
+static int k3_pcie_parse_port(struct k1_pcie *k1)
+{
+	u32 status0, status1, status2;
+
+	/* Clear the status registers */
+	status0 = readl_relaxed(k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
+	status1 = readl_relaxed(k1->link + INTR_STATUS);
+	status2 = readl_relaxed(k1->link + K3_ADDR_INTR_STATUS1);
+
+	writel_relaxed(status0, k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
+	writel_relaxed(status1, k1->link + INTR_STATUS);
+	writel_relaxed(status2, k1->link + K3_ADDR_INTR_STATUS1);
+
+	return k1_pcie_parse_port(k1);
+}
+
 static int k1_pcie_probe(struct platform_device *pdev)
 {
 	const struct k1_pcie_device_data *data;
@@ -392,8 +522,17 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
 	.device_id	= PCI_DEVICE_ID_SPACEMIT_K1,
 };
 
+static const struct k1_pcie_device_data k3_pcie_device_data = {
+	.host_ops	= &k3_pcie_host_ops,
+	.ops		= &k1_pcie_ops,
+	.parse_port	= k3_pcie_parse_port,
+	.max_phy_count	= 6,
+	.device_id	= PCI_DEVICE_ID_SPACEMIT_K3,
+};
+
 static const struct of_device_id k1_pcie_of_match_table[] = {
 	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data },
+	{ .compatible = "spacemit,k3-pcie", .data = &k3_pcie_device_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, k1_pcie_of_match_table);
-- 
2.55.0

