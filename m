Received: from mail-pj2-f20.google.com (mail-pj2-f20.google.com [74.125.227.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C09486435
	for <spacemit@lists.linux.dev>; Tue, 29 Sep 2026 08:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671107; cv=none; b=i/08mYz8OsScAl7ea3Qri/SJSSmDcHHvA2CvIhqn/MPh4VGplDjTnYdEsQZ4TO4JDEGBIRh8Il3PxNUmGUx3JaV3Tz5Su2R2VnhWicJBPgKvsqK9bFVH2IfDEYFQUDcBlBfxFumRmDGeAPeCByfm6J13DZOlsuQya736LgLOtsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671107; c=relaxed/simple;
	bh=4JdfCyLALDJ6xYLBR2RbOX+FqRbOvU8Uw5004bIWvpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eqe+eJEAHKR1y5c5Xp9JkaJlWRZ/TKKkAnVYeP6ldvU0FVgieS4lqNipi9dkboppI/NoG2b30ZlElVrAJpKJgLQ43J4Fu2XSFD8djrZR13T/HS164T/phhuUQkDS+7L7mH0yN0EplItWvzLlUGrmAFhh/g7cIb0yLoemvV9X5Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hs6eIlt4; arc=none smtp.client-ip=74.125.227.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hs6eIlt4"
Received: by mail-pj2-f20.google.com with SMTP id d9443c01a7336-2d747ed9866so27984415ad.2
        for <spacemit@lists.linux.dev>; Tue, 29 Sep 2026 01:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790671104; x=1791275904; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9taEhUKeB1oizn7sfoRMW1tAn++l1MHVxmwejzHWtjA=;
        b=hs6eIlt4jAKhjaa28QyfwiTIB3/k7g7B6p9HsS1qFxvCB9k2X7GvarBx0bwe/ay1DC
         tAQNWSckSqEGmrvrHBMnrtl0rJqsnQRWx8vVpCpps3fP/0vZSt26HOYFbo+LHNozGpc3
         4yD79VUQ92jxcaqUbUEcjQCMribWC0Q/x6R9wIf0mr6NngwsuDF9ElXR1GSLUpb7sJbQ
         JlkskF0o5kGCYcwIY8nvueC8aAl6yrdwkt+vopyNzw2pmthU2bLrExxWBr4lW2jdgOVZ
         IVZ3kJpQWXse9xVIgFOTAf6y8jPgosJtdSB8ioI7tedb3taaHMwo0qqONEpCHfz37upl
         a2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790671104; x=1791275904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9taEhUKeB1oizn7sfoRMW1tAn++l1MHVxmwejzHWtjA=;
        b=Z4HGJRLhnrc7Kx5IOpP8trOC7jfVaRjD7lwpsaAIbKI6kiiXMvtCWgiKV71rTo5sbE
         7rAteB3ai2DzxkotoNM+1UN9IzwNKOm7eMLZUgnLc0gXfb3uke//Dwt7aC25btGSYtFO
         XwJCU1HCmZwLTK9ESyb68dqgA4ak97I1XwQMM/AwsPyBGqsou8k4ewl3Blrx/P1PjbP/
         q5mX7Q1LJBRLDZ85CMg657KtrQctRvcS0pO1MGodrg+VpK6ai32R6xhUCAJB9qhF9xdO
         LYIA8wNzmj4VcurTbExjmXOd39iSi9MuAHRq2lzcmbbR2fectTkDVayn6yqiDIOif5Ck
         SNOw==
X-Forwarded-Encrypted: i=1; AKwUvByMjqsKLUcH0Aa1D7ikjxImXgg32JPVXJRk6Vw1dhRov64SzueROSFaAY0LuOn4EybOc7BBBR3SNQ==@lists.linux.dev
X-Gm-Message-State: AFuF++lNUBIs1Y4yF4ie5qPPSbK3daoQ/ZDM+qmlYJWt4zyE1rJSPDGS
	X/X0nFRx8zOw7JryJE5n/7S6LOwIKCbXE96gxki1SQOxGRK573iDJ7/y
X-Gm-Gg: AYBFou1iqL+qavzQ4mDNjL8RsZyMHTiKG20iZcuhmKMfN84KRRzZSV7BH39fSJ8KKXZ
	1d0U8oASmWMLF6qsYdBX4m/jiG2Xz7hXxMfGriwcpN1/XsdyOFRK6hXCgQ1Q9tIw8ZRfYQJGIwT
	yTIrwu6so+4J+Bo2wqO2LpWM5qTp4840UDB+7pXqhkVYkn5A0lEoCTKi5wSreGyBBMftgoclLQl
	wQMCGDpvw43irPHLVLO2Do+Oo4HexOaswaMlWQuFZlycKjJkOJcjg7+cIdzjN6SkBo2bO7YTOMm
	jUWTwT14WaARFgtjy6ULC5XmYXYB4WOKQEepfTyLdPlAS/mPAqbS7+gkFi4cxObW1J/NAeu9n+M
	X3mTwu7cz9mKHBW6hrrevCX7ZnFL2ATGdwlzz0YEzH2SdZbmYea8Qt6mJKpYWF7ybz9kzIw6dPL
	2FnXinjquhDhBrqQ5z/ZEC4AHiDcPna+D6R7McExA3aqlgH9m3l/Ev4xGa+tdbICcRjEza
X-Received: by 2002:a17:903:2312:b0:2dd:c170:2d4d with SMTP id d9443c01a7336-2df7da9eccemr117563315ad.24.1790671103914;
        Tue, 29 Sep 2026 01:38:23 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91475206sm51407475ad.82.2026.09.29.01.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:38:23 -0700 (PDT)
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
	Arnd Bergmann <arnd@arndb.de>,
	Niklas Cassel <cassel@kernel.org>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Randolph Lin <randolph@andestech.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
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
Subject: [PATCH v7 6/6] PCI: spacemit-k1: Add Spacemit K3 PCIe host controller support
Date: Tue, 29 Sep 2026 16:37:52 +0800
Message-ID: <20260929083755.458238-7-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929083755.458238-1-inochiama@gmail.com>
References: <20260929083755.458238-1-inochiama@gmail.com>
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
index ec59ccb710ec..61b430f2294a 100644
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
+			   PCIE_PERSTN_OUT | PCIE_PERSTN_OE,
+			   PCIE_PERSTN_OE);
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

