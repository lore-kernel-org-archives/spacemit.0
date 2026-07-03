Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44427248F72
	for <spacemit@lists.linux.dev>; Fri,  3 Jul 2026 02:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783044046; cv=none; b=XywrBGGBXqBptACJBBi2Zn232JvnpX5+SP4+DRfCSzvTKlkZIl7UQsb+Q3yazrw0/Fxx9UDZYW+KwbckHVpyRH82miOE0CyRLfvsKbxzEEInGCtlhpdROU18QB6yXLYW/VBrsZl+wzAlHeBX6QktEDLsDKhnA7CcMU1xwZ8dHVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783044046; c=relaxed/simple;
	bh=J3/EXKJ9oSwEv7a/c7ZKCeKVURm4IVxq/pxkcsl3f9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S1TgtUB+y0On6qVzZbv14qk7QR+BUsLftimtCtz7ZnL3bLx8qa9otqmV8ozqNCPHNEeTp0JuTZUxkfR+n6Iodyw/RHiZBjG0ToniAi69GfOQyI8lltLgOMlvE3wlDKwxxRN9wbnuCv0QphTMhSo4ru95S3FXXFIyIyv3JAU/zHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUeu6w3c; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUeu6w3c"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-381216921aaso64350a91.1
        for <spacemit@lists.linux.dev>; Thu, 02 Jul 2026 19:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783044044; x=1783648844; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5q+pTBwamVSA/mf9LeULWykUlYzRmW8hf3toSZ8K/5w=;
        b=aUeu6w3cpSaVXlBv+BbrB8ij3GTUaJQFt8iOKbYSG8HjySQ3wj0OsnADpiO+pj/9AB
         zE7LYRMYGpaZNFJSzN1BdV+4+iHDXOriP3d/5hdbKbgmEFgl5N1xoUn0zCsRBhgMA0gQ
         u9x/aikBy03SLwCh02HybobWg5J3l/H+z8NGQT21fn91AW+xWYOpIif6Vi3fKpiYBwzP
         uO9nKQSDOY20wZA49jKZlsIx1EdbHMSkpcpPLQs9CRJsr2S15GqD6swHqFSdIXuMaGZc
         MnBe3Z4QyLOGVxom+4Np97VHpDXd+7mww87ZB8aL9/bpDzZwQB5C4lAJnQjyjkwMa0ka
         pSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783044044; x=1783648844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5q+pTBwamVSA/mf9LeULWykUlYzRmW8hf3toSZ8K/5w=;
        b=gTFJM9LxHLboLHsHyZnEZA53B9nD3u+T5RxfwUG9gQEKQUuFDdafgI0XOP4WIEnFAn
         DMBbK037Uhwm5qjE3rJP6dMPeYTA7f8Z6LUaCWNCb8pop/8yR5A1FAvTPWapwN7KDubx
         Xp8cakXn2xjH86wxoI41NkFVO01qV8/jwDQzDhLha2VoxbJumhQh3K19x2XjXaN9bAST
         RrCUDZer6DKwnlT6FD1Ky/arIOsHh8XgMvsNg6/glMKcKtZKjvET6eClfJ4jmUohUvcK
         mblDsbDBumB+4BFjJuTl/fbY8IjlV9PspZO/8MdTq+E+0bzkbtbWRQbzAzYJfXLQe1e3
         xd1A==
X-Forwarded-Encrypted: i=1; AHgh+RrajBZr4I2Qlmhgy3Sh0J4RPkjh6wnxTiAcHyLcIiiEJvky0JokRM7HVb0VKBVoE87seC8/ZPvFaA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwxWdueN0ncRYI22KRNP1YZg33yfwUns89zeqe2kR0GQikaqb+f
	IRfpb+WLfHnvSd6vJWPvDzDwxDUc2XEK2+SCf/opHvH/jo/aUUuUJcK7
X-Gm-Gg: AfdE7clCgGOV068Ku6vlw/WwTkhOwyRfZAWVY/pQpsqi24F0chLdhyyYK9t7Yowwl5i
	2eAPgXcbiwSLfM4H6PFCiE/uzizn7TDu2fUUvfdCsdYGVRHhCW1pr6EdrkA8HE3eHOErnxLWq4L
	FhKGXP88NPkYHk9zDTZGVdweYHU5TnuAWHzWl2RGBP0O8kHUWOjDxmMmtswto8hyWZ7VimLl7gk
	kzXCNDlHwX7VzwmGb6MqO6sysJ0MUjRsWjBSYte3+i/KwyLvuZQA2kBSAgRQAM0xSRp102I4201
	ZLbv/22KRmvzHehqL84/54mHj8qZL3dJ3Qog0xT06iCVFt2LrtV6FqXrs0os4h6IRtYmWoB+uI5
	6Km0aPBiTxn4BLRS9JsoN9k7lHdM+5l1xgoX/KIhAhmHMnCmNf0H75bCUlyZ/qk+kpfqPh/y/HY
	pw7c8PbsNEHWs=
X-Received: by 2002:a17:90b:3852:b0:37f:9ce3:ca94 with SMTP id 98e67ed59e1d1-380aa1fa176mr8453697a91.29.1783044044437;
        Thu, 02 Jul 2026 19:00:44 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38097d81bd9sm2627846a91.1.2026.07.02.19.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 19:00:44 -0700 (PDT)
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
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Randolph Lin <randolph@andestech.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 2/6] PCI: spacemit-k1: Add multiple PHY handles support
Date: Fri,  3 Jul 2026 09:59:58 +0800
Message-ID: <20260703020003.485436-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703020003.485436-1-inochiama@gmail.com>
References: <20260703020003.485436-1-inochiama@gmail.com>
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

