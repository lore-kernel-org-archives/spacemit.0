Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7BD2E7379
	for <spacemit@lists.linux.dev>; Thu,  9 Jul 2026 04:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783569688; cv=none; b=M07XNMxxK7tgMkzlFge3yoz7cw3TJBWYGNVMjEbVRv73uDJDssnE7NqJChxhcoMIpLuY/KSH9PdHdPjGTIapfX6WeKu3M6iK7b51PuMJ7AZQKb40+mWffrJ5TyVTKUiCKKoT98pRlkRKmdp4o+ydwQdvCVzGn7OtPTsOOvjy454=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783569688; c=relaxed/simple;
	bh=J3/EXKJ9oSwEv7a/c7ZKCeKVURm4IVxq/pxkcsl3f9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mF9Jv4iFKPKSsOYf3th0j9+DOU6XipVDCIrz6Ef8HZYqichtnhxAwU+we8J8J+Zef7nIWa4VZFUy0esIWV5AfiBiTD1Td1wei4M6bwe2i2GOzuPYvIVAjLoRFOMgw/wpbQ0enoezgZNACI5Q7EQUQVqr05wQUwsu4vEbwtwOYtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHR9RuMe; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHR9RuMe"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38175907a56so418731a91.0
        for <spacemit@lists.linux.dev>; Wed, 08 Jul 2026 21:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783569686; x=1784174486; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5q+pTBwamVSA/mf9LeULWykUlYzRmW8hf3toSZ8K/5w=;
        b=nHR9RuMeBdUcD2kdljGT4bIA2FzMpY6rv4VOgr28NxF0lYhmL+7qvrRexW/9md+LH8
         OLUESP6Xo58aBe3Eg1AbibFnkPu6nojQEcgbAbR4haMI/rGze7TIJ/4sv81j+WvRK43I
         0JadUHRjWRXHOgjnBdLNAZ2G8H7mNCzUqNiepbyrbiPudObnrsMsV+NCnjuxLpt64bxf
         Q5CUjRT7G9cTuy21Khrip/HwF3hJrGOHOEG2viipR82KkS0q22eOyCrzcI3gnqwSoPkM
         ZBKWLHq+qzHc1+R0HzykAVI+gabfO96uRCYhsOOI5sdF7/tepFKMLCxe7AkiilJy1BUX
         scTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783569686; x=1784174486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5q+pTBwamVSA/mf9LeULWykUlYzRmW8hf3toSZ8K/5w=;
        b=eruuD0rPd6YII4jwOJKR1QkovHww+bmOeh3x5VqGrBNYB5ZBtQIwpkDc3xf07qBrRs
         q1XSE1HccqfBD2wknmbHvXcsQKifzEu+5UE/cxztiiATlZfCzU5hUrROiPM6PeIpycmX
         I5ChWcIedhzBs+pS5XUTmrslvBelaKuNUK5VUC8QjpUD0y7MY9HQOvtxAUNLBiBtTYsG
         J9GPyP2hiv3mZzPEkoa1LxacZGKpTMrfZDpMaqSp55na05wvDQ5KaKCD/orw686GEgG+
         /37Z3fooQxMJULaierDxMhgsqorQUtM17WG+ZybiRkvTvMFG+ciI0Nk0DOLdJV6gtIDE
         /3ag==
X-Forwarded-Encrypted: i=1; AHgh+Rrdmm8Q8/ugAZu0QJOa68hI/N0eukpM73TbCKfRAFL4983oqDDdFPANuBQovoIiiB+SVybtd0EpoQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+v2jkfb5voyJ31y1j8vdOd7s3+ym2Isj//i/Ddhy7dUkjMv5d
	a+uEzikBJuOryf/CYV/QvQC/XUNalmh14VzsM+14frirBwB5sZoar2/0
X-Gm-Gg: AfdE7ckDRZva5kRMuYIB5AsvNyQLzGa0sOD5SztmtSwjhSOOk1M36Or5iUInxqMjFKl
	RvDfnJ+xl2Nxgwf02AuBz/aYLK8li0vPEGzNWvnDQLeko8bvI0qv/jFyq/II9GTucN9mMNdxi6X
	eGpX3bcJoZOFEy5pdRFYt8PFA5bHJKvK4SnbA4Df6YNc82j+9yFPgdUZdtVMwv+bIE76A3ubJ8r
	0duA6ntuE4Xwz8JPp2EHK1EyDcAYKM5DC3yBEosXHmMlraGmnY8MpoFMvJ9UXtbj/dXedGldx0t
	cAEnmwtx96ITbIUoyaH2J6053M7uungqI6MuqTDb6IsA6IsNejLRYmLIVxXbbAFy10bgJ4nDWMT
	m3uasfXAE/WxUqOfYYtAIUxSeWeWY2QNmOb+CR64nvCD2rTadi0Mc+kas7lCA0n/MnxMds68Qi0
	o=
X-Received: by 2002:a17:90b:524f:b0:36b:769c:c037 with SMTP id 98e67ed59e1d1-38b73c6a1fcmr1044903a91.5.1783569685878;
        Wed, 08 Jul 2026 21:01:25 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a55557f25sm443538a91.5.2026.07.08.21.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:01:25 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Nam Cao <namcao@linutronix.de>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 2/6] PCI: spacemit-k1: Add multiple PHY handles support
Date: Thu,  9 Jul 2026 12:00:22 +0800
Message-ID: <20260709040027.958400-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709040027.958400-1-inochiama@gmail.com>
References: <20260709040027.958400-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCIe controller on Spacemit K3 may use multiple PHYs at the
same time. The feature is not support by the current driver.
So extend the PHY definition to support multiple PHY handles.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 70 ++++++++++++++++---
 1 file changed, 59 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index f6ae8ff3589a..e22ecbd09579 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -55,12 +55,14 @@ struct k1_pcie_device_data {
 	const struct dw_pcie_host_ops *host_ops;
 	const struct dw_pcie_ops *ops;
 	int (*parse_port)(struct k1_pcie *k1);
+	unsigned int max_phy_count;
 };
 
 struct k1_pcie {
 	struct dw_pcie pci;
 	const struct k1_pcie_device_data *data;
-	struct phy *phy;
+	struct phy **phy;
+	unsigned int phy_count;
 	void __iomem *link;
 	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
 	u32 pmu_off;
@@ -119,6 +121,54 @@ static void k1_pcie_disable_resources(struct k1_pcie *k1)
 	clk_bulk_disable_unprepare(ARRAY_SIZE(pci->app_clks), pci->app_clks);
 }
 
+static int k1_pcie_get_phy_handle(struct k1_pcie *k1, struct device_node *node)
+{
+	const struct k1_pcie_device_data *data = k1->data;
+	struct device *dev = k1->pci.dev;
+	unsigned int i;
+
+	k1->phy = devm_kmalloc_array(dev, data->max_phy_count,
+				     sizeof(*k1->phy), GFP_KERNEL);
+	if (!k1->phy)
+		return -ENOMEM;
+
+	for (i = 0; i < data->max_phy_count; i++) {
+		k1->phy[i] = devm_of_phy_get_by_index(dev, node, i);
+		if (IS_ERR(k1->phy[i])) {
+			if (PTR_ERR(k1->phy[i]) == -ENODEV)
+				break;
+
+			return PTR_ERR(k1->phy[i]);
+		}
+	}
+
+	k1->phy_count = i;
+	if (k1->phy_count == 0)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int k1_pcie_enable_phy(struct k1_pcie *k1)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < k1->phy_count; i++) {
+		ret = phy_init(k1->phy[i]);
+		if (ret)
+			goto err_phy;
+	}
+
+	return 0;
+
+err_phy:
+	while (i--)
+		phy_exit(k1->phy[i]);
+
+	return ret;
+}
+
 /* FIXME: Disable ASPM L1 to avoid errors reported on some NVMe drives */
 static void k1_pcie_disable_aspm_l1(struct k1_pcie *k1)
 {
@@ -174,7 +224,7 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 	 */
 	regmap_set_bits(k1->pmu, reset_ctrl, DEVICE_TYPE_RC | PCIE_AUX_PWR_DET);
 
-	ret = phy_init(k1->phy);
+	ret = k1_pcie_enable_phy(k1);
 	if (ret) {
 		k1_pcie_disable_resources(k1);
 
@@ -194,12 +244,14 @@ static void k1_pcie_deinit(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct k1_pcie *k1 = to_k1_pcie(pci);
+	int i;
 
 	/* Assert fundamental reset (drive PERST# low) */
 	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
 			PCIE_RC_PERST);
 
-	phy_exit(k1->phy);
+	for (i = 0; i < k1->phy_count; i++)
+		phy_exit(k1->phy[i]);
 
 	k1_pcie_disable_resources(k1);
 }
@@ -266,23 +318,18 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
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
@@ -358,6 +405,7 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
 	.host_ops	= &k1_pcie_host_ops,
 	.ops		= &k1_pcie_ops,
 	.parse_port	= k1_pcie_parse_port,
+	.max_phy_count	= 1,
 };
 
 static const struct of_device_id k1_pcie_of_match_table[] = {
-- 
2.55.0

