Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8BA32F74B
	for <spacemit@lists.linux.dev>; Fri, 30 Jan 2026 02:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769740060; cv=none; b=U41jjifXktmk9yngDkM19LVUU6lU5NiFFxmT2ZK2FcYMbxBhm0xsncY5GqPSrh5AR0VeqMiN1TazI7rDklC9Lsdbc5dEQfmzj+c2uqBMHdsW58n1WWNygH+Y+xTOAZtb4oaKeuC/6P87nhv20Ke0R1r6IyHIgznkAMvjUzPpfOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769740060; c=relaxed/simple;
	bh=ttQ8rBv1DBstUCXWf7W5fiRuEYVywTcUAO3LhNYpUUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=utnAXbuJfh3XR+nFTrZGl0QoAifWUUKfhzEltCPX3CBz2oNOxa0ziYMBnnAdj1b9YWzcpSNr3AuNiEjORlnoyWdXJmVUL0wkfqR5ePVJn4Iv0JITQR/uyNYOpOChBtIQgO9Ehao12D+L+8tZ20HHTd7LsrNy4/FFXGGu1bF7CjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NgiAIXcU; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NgiAIXcU"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b729f4c154so3170065eec.0
        for <spacemit@lists.linux.dev>; Thu, 29 Jan 2026 18:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769740057; x=1770344857; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIZl5Xq7e2X6jMUzOZkJ4nra133biX/ZFgfGxWt8hQY=;
        b=NgiAIXcUywYyZ32CVeWSAOKX8N2UK1VripcYMqYe1m2Jv0ujxDQZRMT9VvYqq5i7yW
         nbSmHlvlb96QouVOBNdvhcTiZgQGmHW3LO2jZpQVP/cSNr18RZ2CO3gx25Bo7N3f368/
         dnKIF4GB1mxeaUb9tVQCmsNE3lWnUJQYFHSxWUljfXHG++PYUoe3tLn1w1Bu01xKnkAB
         1RRh7aFXSlEmVgtaZJxCwdPN3JAsg5OjsIZoc9UP6JzGKbRLNXMYGM+8Jk7xk7Cl6Hm6
         FdQcHZu5qxLECWyfrTmQYNXlfzX3i1FSq2HlrvIOwhmx5RABWWrywvico/oATL8VYr6+
         bGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769740057; x=1770344857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sIZl5Xq7e2X6jMUzOZkJ4nra133biX/ZFgfGxWt8hQY=;
        b=HA+lxZPJAn1YY8jmH8c9Nh6a6e56etmijbMaHg0WZhDvLS3ArpS5TEaaJwMgU6epD7
         4ZVEe2YZJZYmYXazudD0MedxFmCSLrPIz77ZkbHpOghtmjJKAbppxHt8SI/epULZuv/F
         iNRYz8vFjwoaojL9Gb4CA0gO9lfO7teTTEX6+ht5R51x6cbMMj68No0kvU8lcBhsYpo4
         P353Xd3XVAxG8Prqt4rnVbh4bvKc03L/BvbmkclK5Artrd0WsdLsb2UB1vLbRTNYA3+D
         VFYg88QsmjzR/NijTjcgNNQSriL0En0hqXyH9gJmeqMCM2sqCzZdosCwDy+giQSQ7k7f
         JQcg==
X-Forwarded-Encrypted: i=1; AJvYcCXbc9EtioZR3vo1Lz4AHt5nNkKGnIaBjfPZ8hEcynJKYKWyFw6/sTFm6/6138u4OPJZM0wP/uLRCA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDAJtbaZqhiRox0UXk9JT72vrbHccFNk39I6xpDYy7Asf4LQre
	MLWA40mGsc3ttEatlbWq65Ys9utNh3ra4VcbCbm8/vfuTIPcUXykUfpS
X-Gm-Gg: AZuq6aKQMToVR6HLJTN6hb+RBtKCTNR0C80dtmcOCW2zew6hIPajyqE7cMjTeyVj8ze
	O2w/YpLkh+wrGoQS6SCoi+r1nb5FG77resAKG7hxDpdxmmLLugNX2RbFzrxdtvIuzKtofcVvPzt
	HT+IPMnW/ZrCirnFXv9beSXe3+R8iBFV8qmYtoGRpkgzKXCWQ3Q1+qFVFogSTQ8xoyhhSgZVUpf
	q33GH6nBA81YatefSwkKcOGL/YwqDwvrumug+v00etK6dwvBHsQN91e/TvJczyi/GztcAWR/2p0
	evLy8vJ3WHcFN8oSXlqu6ILNisSSMX5fBsZuZwlesB0uHicNsm76DwQiJtmAqMVG6e4fRbM46AY
	gQpayTQ8xkFLn8vF7YcF8J2zQ7oDpPmQlWIu4SEt5RQS1FiAWR0DqQr+jz9u5sA498fKBfx0n2V
	hEBxksY3tDbQ==
X-Received: by 2002:a05:7300:8186:b0:2b7:c5d7:84b3 with SMTP id 5a478bee46e88-2b7c866dbc3mr1042558eec.19.1769740056871;
        Thu, 29 Jan 2026 18:27:36 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1af8a7bsm9327816eec.34.2026.01.29.18.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 18:27:36 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Yao Zi <ziyao@disroot.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Zhi Li <lizhi2@eswincomputing.com>,
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
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v4 3/3] net: stmmac: Add glue layer for Spacemit K3 SoC
Date: Fri, 30 Jan 2026 10:27:04 +0800
Message-ID: <20260130022705.1059214-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130022705.1059214-1-inochiama@gmail.com>
References: <20260130022705.1059214-1-inochiama@gmail.com>
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
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 194 ++++++++++++++++++
 3 files changed, 207 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 907fe2e927f0..583a4692f5da 100644
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
index 7bf528731034..9e32045631d8 100644
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
index 000000000000..25d497a54ff7
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
@@ -0,0 +1,194 @@
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
+static int spacemit_dwmac_set_delay(struct regmap *apmu, unsigned int dline_offset,
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
+	return regmap_update_bits(apmu, dline_offset, mask, val);
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
+static int spacemit_dwmac_fix_delay(struct plat_stmmacenet_data *plat_dat,
+				    struct regmap *apmu,
+				    unsigned int dline_offset,
+				    unsigned int tx_delay, unsigned int rx_delay)
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
+	return spacemit_dwmac_set_delay(apmu, dline_offset, tx_code, rx_code);
+}
+
+static int spacemit_dwmac_update_ifconfig(struct plat_stmmacenet_data *plat_dat,
+					  struct stmmac_resources *stmmac_res,
+					  struct regmap *apmu,
+					  unsigned int ctrl_offset)
+{
+	unsigned int mask = CTRL_PHY_INTF_MII | CTRL_PHY_INTF_RGMII | CTRL_WAKE_IRQ_EN;
+	unsigned int val = 0;
+
+	switch (plat_dat->phy_interface) {
+	case PHY_INTERFACE_MODE_MII:
+		val = CTRL_PHY_INTF_MII;
+		break;
+
+	case PHY_INTERFACE_MODE_RMII:
+		break;
+
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+		val = CTRL_PHY_INTF_RGMII;
+		break;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	if (stmmac_res->wol_irq >= 0)
+		val |= CTRL_WAKE_IRQ_EN;
+
+	return regmap_update_bits(apmu, ctrl_offset, mask, val);
+}
+
+static int spacemit_dwmac_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct stmmac_resources stmmac_res;
+	struct device *dev = &pdev->dev;
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
+	apmu = syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node, "spacemit,apmu", 2, offset);
+	if (IS_ERR(apmu))
+		return dev_err_probe(dev, PTR_ERR(apmu),
+				"Failed to get apmu regmap\n");
+
+	ret = spacemit_dwmac_update_ifconfig(plat_dat, &stmmac_res,
+					     apmu, offset[0]);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to configure ifconfig\n");
+
+	of_property_read_u32(pdev->dev.of_node, "tx-internal-delay-ps", &tx_delay);
+	of_property_read_u32(pdev->dev.of_node, "rx-internal-delay-ps", &rx_delay);
+
+	ret = spacemit_dwmac_fix_delay(plat_dat, apmu, offset[1], tx_delay, rx_delay);
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
2.52.0

