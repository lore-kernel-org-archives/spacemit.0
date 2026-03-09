Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF9724503B
	for <spacemit@lists.linux.dev>; Mon,  9 Mar 2026 00:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773017031; cv=none; b=jQxoaehKwRkqgCmMx9dgf8B2NlGluCbtYcVedjTaejqSm4Xg2iCdyBj2BxvnoY+QcU6VMF91dnabv6C7BAHcnpE+L3x+1J3N8o+Mt0397RMCQpyrB7WBuN/egHyhcz3nTgSWkpKfUW/i7CrtDa9X9+ZLlf/M3g2Br4H/k11Hj2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773017031; c=relaxed/simple;
	bh=FDxruWIOtQXtmUi4x3J7VmPAuRASCxm6RhkcUuUCUd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N9QcBzLr70NNdy4tde1fKSEzzQ2ZJFVjZPz+rNfW/Z/h+vT4pfqnCjVgSSuJEYBCYZ8blGQ2WAy1V+wOsuRNKnPTlWppbfQYEc3phvXPKU3lCKlaNUaxQaWCa34ia0UVNk0E32AIljxB1yRhRbUI+Vwhf3h9IWc1XY4IEglCdoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=klrubB0i; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="klrubB0i"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ad9f316d68so48089095ad.2
        for <spacemit@lists.linux.dev>; Sun, 08 Mar 2026 17:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773017029; x=1773621829; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixbx+gDUYeAq/vVDXktJDZ6vOxwnCAtm0z9wr9CgNqc=;
        b=klrubB0i0BcA8rzZ5X6AT3AUMdDOeOePLvDeZrV0qDPR5c1V7Fq+rc85pjL2SCb6Ak
         feymO+ikLjBR8U2zBra/uCRFX/l2lTDe2PmrveZPqWhX50HUJaAKVycaXj9uLnf9m13v
         ztZOcl9+c2VtkRf5JE8U2TjS21AgDyfC9Z4iHNDIfXoPnucda7ZcHe7NHyj3NnaZ12D5
         yHCTURSdx4iR/zVnxP9PRAXpJL1m1KP8hyIAoNZD89IDVNCTKjIuHDBIGEUMU52reyUq
         GFWAX4RlTZxvSRlrHuM2+wdR8fyWUqIqbgwt5tXN2JdtM2gkFl9pNZLTfKnPR6JZwQ1H
         DreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773017029; x=1773621829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ixbx+gDUYeAq/vVDXktJDZ6vOxwnCAtm0z9wr9CgNqc=;
        b=dtRA2NuAZ+T31fD5NnGu7ZE67huT2lsc8R+5rn5jTwqfSep1gpOTBiFEHSbbc0SQba
         df+LkJ/QQSrvjPg08EfJKeGn9zFdLnYdG8pG7hAyLb1LrAt6eXEhfGb4RNerondxIcHW
         o7pzY8Vf4sE+npwD9A6L0ljBiae/FPNW0Bj+t5jZhMpg7IcP5nwHb8rYb5Rbsux4Iif8
         fb3pz9dHnegzwLti7zjq30sUFa/Pb9cEZgaN4qxUGYcPZxmW2cnVn8eUo9dZqMB7LUGb
         J7lnwgC2tPDhusd7iykpHK79WmKy7/J5sdKT9XonokRfv4tu68hUAJp+qkU90crZjWZJ
         sOWw==
X-Forwarded-Encrypted: i=1; AJvYcCXuLAVxkn7rweoJfLekAPrNdwb5VH6ePDLHq7d6l+c5iUpZSdRah6OW4qfV2CvArWtIOmmXSmMfdw==@lists.linux.dev
X-Gm-Message-State: AOJu0YypblCKGcHVeomFUtiv/NaXeMqWOSDZ28yK4l4LEx19EJeDXiQv
	RneOjdzkKxM7qsZE/DWbkIrkiVO0ZTJvYWbE7iMvRWYt6B4xQ7RpyxuX
X-Gm-Gg: ATEYQzw+JJW3yxja1FlotkdvyNBxiXIMTCBYMJCrvh0sQYGSHaHf8QrVJ/c/A9+Pn3c
	wgDxmHsWxWZeDoW6/hUhgki98PgwEJuIJNxCjfy6Q9yLrvkMvbKcBwsNrX8b08JC0Q8w5LiwKcb
	iEr6De95ytWrNhk6+WPaG9L3Sf89RCG/V5zACXVD3t3v/TWzdapkxvMz7k5R8rbgbDaUx7u16dv
	9O2B9W3X5b7g1g3E4whiJZ/pfsPHHDnoopPfLz5kcUjVUgyKrxwXYJmAvYm372ASS5kcJH+8CKV
	i9Gm0G/6uJ7LxnP/OyGhFGOmmNYnXguF/ENK9Tl1nXE8T7sxzoV2EG77ePckXOPK1xEurBUvlhc
	i1Hbp0H94H9NfTMV9V6iL7upDENkrgxO9bv+9GlUgEImeZaLocjD28xemx9BO8JxCnNrfrO6tBg
	12fvRYgxAVzEWLQ3HOjf+FJa2qQHcyRt5ZLg==
X-Received: by 2002:a17:903:b4e:b0:2a9:62ce:1c15 with SMTP id d9443c01a7336-2ae82269e63mr93309645ad.0.1773017029142;
        Sun, 08 Mar 2026 17:43:49 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e57740sm88653645ad.15.2026.03.08.17.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 17:43:48 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <me@ziyao.cc>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v8 3/3] net: stmmac: Add glue layer for Spacemit K3 SoC
Date: Mon,  9 Mar 2026 08:42:44 +0800
Message-ID: <20260309004305.315018-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309004305.315018-1-inochiama@gmail.com>
References: <20260309004305.315018-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ethernet controller on Spacemit K3 SoC is Synopsys DesignWare
MAC (version 5.40a), with the following special points:
1. The rate of the tx clock line is auto changed when the mac speed
   rate is changed, and no need for changing the input tx clock.
2. This controller require a extra syscon device to configure the
   interface type, enable wake up interrupt and delay configuration
   if needed.

Add Spacemit dwmac driver support on the Spacemit K3 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 227 ++++++++++++++++++
 3 files changed, 240 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 07088d03dbab..d3a6ab7383fc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -216,6 +216,18 @@ config DWMAC_SOPHGO
 	  for the stmmac device driver. This driver is used for the
 	  ethernet controllers on various Sophgo SoCs.
 
+config DWMAC_SPACEMIT
+	tristate "Spacemit dwmac support"
+	depends on OF && (ARCH_SPACEMIT || COMPILE_TEST)
+	select MFD_SYSCON
+	default m if ARCH_SPACEMIT
+	help
+	  Support for ethernet controllers on Spacemit RISC-V SoCs
+
+	  This selects the Spacemit platform specific glue layer support
+	  for the stmmac device driver. This driver is used for the
+	  Spacemit K3 ethernet controllers.
+
 config DWMAC_STARFIVE
 	tristate "StarFive dwmac support"
 	depends on OF && (ARCH_STARFIVE || COMPILE_TEST)
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index c9263987ef8d..945c5354eced 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_DWMAC_RZN1)	+= dwmac-rzn1.o
 obj-$(CONFIG_DWMAC_S32)		+= dwmac-s32.o
 obj-$(CONFIG_DWMAC_SOCFPGA)	+= dwmac-altr-socfpga.o
 obj-$(CONFIG_DWMAC_SOPHGO)	+= dwmac-sophgo.o
+obj-$(CONFIG_DWMAC_SPACEMIT)	+= dwmac-spacemit.o
 obj-$(CONFIG_DWMAC_STARFIVE)	+= dwmac-starfive.o
 obj-$(CONFIG_DWMAC_STI)		+= dwmac-sti.o
 obj-$(CONFIG_DWMAC_STM32)	+= dwmac-stm32.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
new file mode 100644
index 000000000000..f6379ae6e858
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
@@ -0,0 +1,227 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Spacemit DWMAC platform driver
+ *
+ * Copyright (C) 2026 Inochi Amaoto <inochiama@gmail.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/math.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#include "stmmac_platform.h"
+
+/* ctrl register bits */
+#define CTRL_PHY_INTF_RGMII		BIT(3)
+#define CTRL_PHY_INTF_MII		BIT(4)
+#define CTRL_WAKE_IRQ_EN		BIT(9)
+#define CTRL_PHY_IRQ_EN			BIT(12)
+
+/* dline register bits */
+#define RGMII_RX_DLINE_EN		BIT(0)
+#define RGMII_RX_DLINE_STEP		GENMASK(5, 4)
+#define RGMII_RX_DLINE_CODE		GENMASK(15, 8)
+#define RGMII_TX_DLINE_EN		BIT(16)
+#define RGMII_TX_DLINE_STEP		GENMASK(21, 20)
+#define RGMII_TX_DLINE_CODE		GENMASK(31, 24)
+
+#define MAX_DLINE_DELAY_CODE		0xff
+#define MAX_WORKED_DELAY		2800
+/* Note: the delay step value is at 0.1ps */
+#define K3_DELAY_STEP			367
+
+struct spacmit_dwmac {
+	struct regmap *apmu;
+	unsigned int ctrl_offset;
+	unsigned int dline_offset;
+};
+
+static int spacemit_dwmac_set_delay(struct spacmit_dwmac *dwmac,
+				    unsigned int tx_code, unsigned int rx_code)
+{
+	unsigned int mask, val;
+
+	mask = RGMII_TX_DLINE_STEP | RGMII_TX_DLINE_CODE | RGMII_TX_DLINE_EN |
+	       RGMII_RX_DLINE_STEP | RGMII_RX_DLINE_CODE | RGMII_RX_DLINE_EN;
+
+	/*
+	 * Since the delay step provided by config 0 is small enough, and
+	 * it can cover the range of the valid delay, so there is no needed
+	 * to use other step config.
+	 */
+	val = FIELD_PREP(RGMII_TX_DLINE_STEP, 0) |
+	      FIELD_PREP(RGMII_TX_DLINE_CODE, tx_code) | RGMII_TX_DLINE_EN |
+	      FIELD_PREP(RGMII_RX_DLINE_STEP, 0) |
+	      FIELD_PREP(RGMII_RX_DLINE_CODE, rx_code) | RGMII_RX_DLINE_EN;
+
+	return regmap_update_bits(dwmac->apmu, dwmac->dline_offset,
+				  mask, val);
+}
+
+static int spacemit_dwmac_detected_delay_value(unsigned int delay)
+{
+	if (delay == 0)
+		return 0;
+
+	if (delay > MAX_WORKED_DELAY)
+		return -EINVAL;
+
+	/*
+	 * Note K3 require a specific factor for calculate
+	 * the delay, in this scenario it is 0.9. So the
+	 * formula is code * step / 10 * 0.9
+	 */
+	return DIV_ROUND_CLOSEST(delay * 10 * 10, K3_DELAY_STEP * 9);
+}
+
+static int spacemit_dwmac_fix_delay(struct spacmit_dwmac *dwmac,
+				    unsigned int tx_delay,
+				    unsigned int rx_delay)
+{
+	int rx_code;
+	int tx_code;
+
+	rx_code = spacemit_dwmac_detected_delay_value(rx_delay);
+	if (rx_code < 0)
+		return rx_code;
+
+	tx_code = spacemit_dwmac_detected_delay_value(tx_delay);
+	if (tx_code < 0)
+		return tx_code;
+
+	return spacemit_dwmac_set_delay(dwmac, tx_code, rx_code);
+}
+
+static int spacemit_dwmac_update_irq_config(struct spacmit_dwmac *dwmac,
+					    struct stmmac_resources *stmmac_res)
+{
+	unsigned int mask = CTRL_WAKE_IRQ_EN;
+	unsigned int val = stmmac_res->wol_irq >= 0 ? CTRL_WAKE_IRQ_EN : 0;
+
+	return regmap_update_bits(dwmac->apmu, dwmac->ctrl_offset,
+				  mask, val);
+}
+
+static void spacemit_get_interfaces(struct stmmac_priv *priv, void *bsp_priv,
+				    unsigned long *interfaces)
+{
+	__set_bit(PHY_INTERFACE_MODE_MII, interfaces);
+	__set_bit(PHY_INTERFACE_MODE_RMII, interfaces);
+	phy_interface_set_rgmii(interfaces);
+}
+
+static int spacemit_set_phy_intf_sel(void *bsp_priv, u8 phy_intf_sel)
+{
+	struct spacmit_dwmac *dwmac = bsp_priv;
+	unsigned int mask = CTRL_PHY_INTF_MII | CTRL_PHY_INTF_RGMII;
+	unsigned int val = 0;
+
+	switch (phy_intf_sel) {
+	case PHY_INTF_SEL_GMII_MII:
+		val = CTRL_PHY_INTF_MII;
+		break;
+
+	case PHY_INTF_SEL_RMII:
+		break;
+
+	case PHY_INTF_SEL_RGMII:
+		val = CTRL_PHY_INTF_RGMII;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(dwmac->apmu, dwmac->ctrl_offset,
+				  mask, val);
+}
+
+static int spacemit_dwmac_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct stmmac_resources stmmac_res;
+	struct device *dev = &pdev->dev;
+	struct spacmit_dwmac *dwmac;
+	unsigned int offset[2];
+	struct regmap *apmu;
+	struct clk *clk_tx;
+	u32 rx_delay = 0;
+	u32 tx_delay = 0;
+	int ret;
+
+	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to get platform resources\n");
+
+	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
+	if (!dwmac)
+		return -ENOMEM;
+
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	if (IS_ERR(plat_dat))
+		return dev_err_probe(dev, PTR_ERR(plat_dat),
+				     "failed to parse DT parameters\n");
+
+	clk_tx = devm_clk_get_enabled(&pdev->dev, "tx");
+	if (IS_ERR(clk_tx))
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk_tx),
+				     "failed to get tx clock\n");
+
+	apmu = syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node,
+						    "spacemit,apmu", 2,
+						    offset);
+	if (IS_ERR(apmu))
+		return dev_err_probe(dev, PTR_ERR(apmu),
+				"Failed to get apmu regmap\n");
+
+	dwmac->apmu = apmu;
+	dwmac->ctrl_offset = offset[0];
+	dwmac->dline_offset = offset[1];
+
+	ret = spacemit_dwmac_update_irq_config(dwmac, &stmmac_res);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to configure irq config\n");
+
+	of_property_read_u32(pdev->dev.of_node, "tx-internal-delay-ps",
+			     &tx_delay);
+	of_property_read_u32(pdev->dev.of_node, "rx-internal-delay-ps",
+			     &rx_delay);
+
+	plat_dat->get_interfaces = spacemit_get_interfaces;
+	plat_dat->set_phy_intf_sel = spacemit_set_phy_intf_sel;
+	plat_dat->bsp_priv = dwmac;
+
+	ret = spacemit_dwmac_fix_delay(dwmac, tx_delay, rx_delay);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to configure delay\n");
+
+	return stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
+}
+
+static const struct of_device_id spacemit_dwmac_match[] = {
+	{ .compatible = "spacemit,k3-dwmac" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, spacemit_dwmac_match);
+
+static struct platform_driver spacemit_dwmac_driver = {
+	.probe  = spacemit_dwmac_probe,
+	.remove = stmmac_pltfr_remove,
+	.driver = {
+		.name = "spacemit-dwmac",
+		.pm = &stmmac_pltfr_pm_ops,
+		.of_match_table = spacemit_dwmac_match,
+	},
+};
+module_platform_driver(spacemit_dwmac_driver);
+
+MODULE_AUTHOR("Inochi Amaoto <inochiama@gmail.com>");
+MODULE_DESCRIPTION("Spacemit DWMAC platform driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

