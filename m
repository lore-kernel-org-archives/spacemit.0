Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752F8233936
	for <spacemit@lists.linux.dev>; Wed, 23 Sep 2026 01:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790128280; cv=none; b=MmRSxWAUJtOcEFA6JMUc3kwvtpjaZMmiN8ZhN4fyUtdzpoQ1zipC+yYYxPfmjGvqooECpcZbyyyZDOma/o8vM0psH6VaKTNDBszvnem7BY5zoznzUN6sCe0mqORJyKodsYxxtqwVoESzkCXuQrG+n+QDera0BbJL5BkfFu7HQMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790128280; c=relaxed/simple;
	bh=DwZ2kccFnk2nP9CPd+wLNtgKXGDoIz2uRStav+nEg2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t0/M2JZusRV+1ZOqgioDbZRRHSkk1Vd4DruuV94gWIsYw/3QCyT6QM4h9gFIwtFiXbjvmegmw35ZpByz/RRuqe5nb5oS4MCBhd1lKmkz0l5fuRPyPfDoyFFdu1pBU5fTrdrp72NoZW6M6PCI5g/Ah0d+a6SDlsEGtGi3kqxY9is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WxseWRKw; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WxseWRKw"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd1so293933a12.0
        for <spacemit@lists.linux.dev>; Tue, 22 Sep 2026 18:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790128278; x=1790733078; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cWIERes12OVbNPYRqquvHTMVDdUpX3EZuxH/wCFzrNQ=;
        b=WxseWRKwLKtHLl+tBXt1KhOMpxjN/SnYgcdu5ubiWKypQ38vtkE2quzbmIfAwv7aww
         Im8YfLUNJOJwSTO2ZP7qe23UHbiyTLu+sDllKX1zCkKhyYiZCXhQ1YReqz1EAHMEv61P
         eQLG08aN6FAhbtbJhVz2og3IDvtS8ifvAitUhFRKIvDE9rCmbTixxxhWlhRHF+fe5YKv
         WF/m5TXVlVyhRDHfgdM/PJ6Wy8wcYHdEnmr2wE0tvpRq3OSSXrX3BQRqFk/N/PAPf/wb
         S5g6NymwG9tibMqRkTcbDJO36pBQemmSmsS1cxt/jSycl1dPrVeYep2SOMqD0+YUgD1F
         xx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790128278; x=1790733078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cWIERes12OVbNPYRqquvHTMVDdUpX3EZuxH/wCFzrNQ=;
        b=K0MVChbfOjq+sJ92XeeKpGzwe7NXsQV0z7i3bViIyfBRMTXGuuxdh9fBGUz49zBuYW
         7iIZX/409l9VCpr37ZiP3RdEDHb37iJDpruVDD2WVImF10qRGLJ2CO87BP8oq7wISf6J
         ScGbYcudFy8/hIq3Lo8P5mL3pT80NOj3Kw0k7xf8/eRCJhymcH5jFMOzGe4OPohvy6NL
         q4pk8XKKpppGFgCEF4LVc+BPFS4B0RK85OS4d/WexyfCJoWf9npNuAbipiXIVjKohlYs
         KQCZpZuJPoRfpBKH2tnX4pTrp2lJUkEGKrQDlrubBKocUzQNdowSNjdSqwn0gqKUPggU
         NZLw==
X-Forwarded-Encrypted: i=1; AKwUvBxIbR4XP5VKmftxI+h4QCJwAB8LYnQhdF0S1j4/AoWjug7Ywoa4R9J0+yOP6CLoSnKHiUI0xbjNMw==@lists.linux.dev
X-Gm-Message-State: AFuF++kRrg+5TFQxj0JHeifog9gJjpkDLCVgWn88PXZzLbtTShgfz62L
	Ym8SygkCFcIaVUaGry+A7QXAvCeo7y0w9TuuIeoQ4TztdlXSGEvEQ8kF
X-Gm-Gg: AYBFou1k8VY4db+ZO41bJAcHNOxph9P5DZeF2vI/hL+1HSPE3Ucig65eKxUn6UkXgo/
	NoLGMr2C0+d99Njc/31qIdU1EIhvtBQ7DxHxscIzlnM9lPIdW0WbwWmzLNMB13yXV4YvEn/pLMY
	Grd66LtNQV1q7FhsDl4tCoiCj3enehdDCPnnhkSlKK0BCI5x57dqm1nuFfWV5qB/7FSwrIpLKqQ
	Yqflw+i2lustU/DCl3Oy7QSo0F4qPwUdyJjj2GPF7VblrulQLe1Jrk3FgNZTUvD7reDDBjshe9X
	XZ6K+XU8F0XL0OSVxBmwaF27UFIzl0mpoPLvAPqwAGSM9SDKI96/KoCWOJ+uypOtxhN6TCWqgrd
	/X1leGNBQYftV7GLGOFQB4vP8Kos79aRRoN82WNg+JfBJQDoMhAscKa9qg6pFdv/rS9k3S6xRca
	4k7H/OUJZTs4PFi3mKSefY3Rz+c3V9pGv698EPpSdaOq/cSgeJgBkKI+oq7g==
X-Received: by 2002:a17:90b:258b:b0:39d:f66e:1720 with SMTP id 98e67ed59e1d1-3a07e54e52fmr1026309a91.13.1790128277812;
        Tue, 22 Sep 2026 18:51:17 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07dc74977sm1959022a91.17.2026.09.22.18.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:51:17 -0700 (PDT)
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
Subject: [PATCH v6 2/6] PCI: spacemit-k1: Add multiple PHY handles support
Date: Wed, 23 Sep 2026 09:50:11 +0800
Message-ID: <20260923015016.64069-3-inochiama@gmail.com>
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

The PCIe controller on Spacemit K3 may use multiple PHYs at the
same time. The feature is not supported by the current driver.
So extend the PHY definition to support multiple PHY handles.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 57 ++++++++++++++-----
 1 file changed, 42 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index ab2953ad8f56..8c4f0b09fe24 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -51,12 +51,14 @@ struct k1_pcie_device_data {
 	const struct dw_pcie_host_ops *host_ops;
 	const struct dw_pcie_ops *ops;
 	int (*parse_port)(struct k1_pcie *k1);
+	unsigned int max_phy_count;
 };
 
 struct k1_pcie {
 	struct dw_pcie pci;
 	const struct k1_pcie_device_data *data;
-	struct phy *phy;
+	struct phy_bulk_data *phys;
+	unsigned int phy_count;
 	void __iomem *link;
 	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
 	u32 pmu_off;
@@ -115,6 +117,25 @@ static void k1_pcie_disable_resources(struct k1_pcie *k1)
 	clk_bulk_disable_unprepare(ARRAY_SIZE(pci->app_clks), pci->app_clks);
 }
 
+static int k1_pcie_get_phy_handle(struct k1_pcie *k1, struct device_node *node)
+{
+	const struct k1_pcie_device_data *data = k1->data;
+	struct device *dev = k1->pci.dev;
+	int count;
+
+	count = devm_of_phy_bulk_get_all(dev, node, &k1->phys);
+	if (count < 0)
+		return count;
+	if (!count)
+		return -ENOENT;
+	if (count > data->max_phy_count)
+		return -EINVAL;
+
+	k1->phy_count = count;
+
+	return 0;
+}
+
 /* FIXME: Disable ASPM L1 to avoid errors reported on some NVMe drives */
 static void k1_pcie_disable_aspm_l1(struct k1_pcie *k1)
 {
@@ -170,12 +191,13 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 	 */
 	regmap_set_bits(k1->pmu, reset_ctrl, DEVICE_TYPE_RC | PCIE_AUX_PWR_DET);
 
-	ret = phy_init(k1->phy);
-	if (ret) {
-		k1_pcie_disable_resources(k1);
+	ret = phy_bulk_init(k1->phy_count, k1->phys);
+	if (ret)
+		goto failed_phy_init;
 
-		return ret;
-	}
+	ret = phy_bulk_power_on(k1->phy_count, k1->phys);
+	if (ret)
+		goto failed_phy_power_on;
 
 	/* Deassert fundamental reset (drive PERST# high) */
 	regmap_clear_bits(k1->pmu, reset_ctrl, PCIE_RC_PERST);
@@ -184,6 +206,14 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 	k1_pcie_disable_aspm_l1(k1);
 
 	return 0;
+
+failed_phy_power_on:
+	phy_bulk_exit(k1->phy_count, k1->phys);
+failed_phy_init:
+	k1_pcie_disable_resources(k1);
+
+	return ret;
+
 }
 
 static void k1_pcie_deinit(struct dw_pcie_rp *pp)
@@ -195,7 +225,8 @@ static void k1_pcie_deinit(struct dw_pcie_rp *pp)
 	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
 			PCIE_RC_PERST);
 
-	phy_exit(k1->phy);
+	phy_bulk_power_off(k1->phy_count, k1->phys);
+	phy_bulk_exit(k1->phy_count, k1->phys);
 
 	k1_pcie_disable_resources(k1);
 }
@@ -262,23 +293,18 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
 {
 	struct device *dev = k1->pci.dev;
 	struct device_node *root_port;
-	struct phy *phy;
+	int ret;
 
 	/* We assume only one root port */
 	root_port = of_get_next_available_child(dev_of_node(dev), NULL);
 	if (!root_port)
 		return -EINVAL;
 
-	phy = devm_of_phy_get(dev, root_port, NULL);
+	ret = k1_pcie_get_phy_handle(k1, root_port);
 
 	of_node_put(root_port);
 
-	if (IS_ERR(phy))
-		return PTR_ERR(phy);
-
-	k1->phy = phy;
-
-	return 0;
+	return ret;
 }
 
 static int k1_pcie_probe(struct platform_device *pdev)
@@ -354,6 +380,7 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
 	.host_ops	= &k1_pcie_host_ops,
 	.ops		= &k1_pcie_ops,
 	.parse_port	= k1_pcie_parse_port,
+	.max_phy_count	= 1,
 };
 
 static const struct of_device_id k1_pcie_of_match_table[] = {
-- 
2.55.0

