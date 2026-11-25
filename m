Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795580140;
	b=o5maCPOQEOYKBa07bViN+1CnMpZMC9RZyuk/poZR7zunQRzWfHmPLCOUVascIEXCALTA
	 xS8T2KKpRBiYYk5pUG16Hb47s7RQFp9MlIIRZYDCFf4RX25ngovfbvNrMNlC1jKRBHJX4
	 24d8tJOu3u/IIrxv4eQRfSVbdGlU8LTw+I3XWzN41qEIbhiirb9M+EMeEHihiYMPeqqJV
	 omIzvWWYayyUjKwXXjeIeIcLMhS0uQcCPXuezRSZDCS9rjF/HIT3QIepVOm0glPaVhGfU
	 U6+9FjqWzLt9UqSjR2U+7zWACCfQtRRineVDPVOZ+JVZoUZhdXHujtIs4yTPPH4jaHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795580140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+lnP5N8d/GW3QDCKYsZCJCZ0aJwXzBKVnMHodRhbiOc=;
	b=2wa8bx26Z5/xfCLvCKqw4mkUOqFkFrlWJY2DgMvOzKmYjqIdNGwEViH28fvYfJeiiMWQ
	 m4xXuzVOPxO70CyXNuPYzglnOZgqyJAmqs6Lrj4C0tT0odyS1q6TvW4I3ZxlPx/3EWf5F
	 mSDfjDw3C/iYfWBOcWg2eO8YAm2jIuDKManYxHWvxTf+A7RWxn0Iu0MOKK07Kdr0dCs8E
	 R9uGA4CZpF1X40H1R7CIA1CvuwIGG+J/cppK2b5a4b2chyDTXIF6ygqdCxnkOYnnFCw7a
	 iUSAaU6cvAJdTv52Nbfa+DB+1In8qqOeVB7c7YVio8sjOQLsI515WDx7EKDKjcpmPYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TSUzVdbo;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE95606A329
	for <spacemit@lists.linux.dev>; Wed, 25 Nov 2026 04:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BE95606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TSUzVdbo
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso2986439a12.1
        for <spacemit@lists.linux.dev>; Tue, 24 Nov 2026 20:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795580140; x=1796184940; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+lnP5N8d/GW3QDCKYsZCJCZ0aJwXzBKVnMHodRhbiOc=;
        b=TSUzVdbopFoG8JxN71KfDFASC6GLCU3UkGdPzCIGj/E2ywN9AjTbKfG/WoOsnsjQ5K
         VcOwjkEuRqqlHO3BDBpqcFLcxids3InRAfHYjZdcldUAibv5Jsj5JC0J1W0u7zbf2J56
         TNxxpBgCUJ7g+gnwl+NqWq1tp8U95xZlbetQX4IgJURRqn8Fg8C7jMnPsco8Jxs+J+SA
         JiSMCKWjrJe/aKB5Rh8f3XR3s+rAj4G8yubTWsevu4w6fGeNMGLMsDiUQ98zWD9KYEFC
         PL7TcxjxKO5hPkZR0E7AGhgZ1phGMiePk4XsrwPC/rJYlK7iieF1ZK3Vb0z2Fh0IOj6c
         bpWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795580140; x=1796184940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+lnP5N8d/GW3QDCKYsZCJCZ0aJwXzBKVnMHodRhbiOc=;
        b=qT1dd8YO/DNVv2nbdN9sf9EFnzaAtxe6rOlMfawnStIpQ08xPkR6W3fr8bvEUHf+E8
         941qG/6ZiauZ0/ck8I1bR9cAi4oIerU6sWmY42fEfz0tCKpN2rDlBPJYRtwnSl0qGYHs
         rMSBPSmqSP1VzCZQatuo59YBgZ7BX3xkmzjIMivlW19BlGc6AgKb8W9vuJfuiRaPfjpJ
         XP7x58jNyi5/DmlUFCxCaDMIow9roel/8D3nET19qILfMz6aIXyybcTKKCu0xeMD/cy8
         T8eJ6kjtDtB5AKe/Xm8U1XuZMT3jvMT3+XbEfpjtipR6jn+5EMwb/K+PAn3lfewgOSzP
         fmrA==
X-Forwarded-Encrypted: i=1; AL+hErGCp+cD5D2BETGuVQ02yHCPZmC/0sTcdNLpoK0BN9LqWJhHTEUqYJtN5KAbpKj/aFXshjzSLQoNrQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+GwHub/00yQoYO5tZw5HCAZhNAz4djEfIfW+wjLortQgjg9gyG
	RhlUql6nSMB9o1OIw88URpWk+4a59sd7LoBVw8kDKQnn9ZhX08jcnz65
X-Gm-Gg: AZFdTZdFKsNJOLoZTxaunT1hrhApm6DCDFziW/9qugWCgPqB/h4Efoql6NzrYS1iWpC
	jq6/J2x9mTpY3EMbdqYRVCahtEkNwlu2BVAqHz2RkZpHzS4p2NLzFRppn98/DH69QRnQqdkAcNx
	nXz1cbYSsNcQdQwRCxTO2PrxpzeyWWn1mUQFLQP6uQCbEfyDfDOtHBZEF25yi+GQBancE4UZjDD
	lIfLYPc92kjmSnLwnCpZtO4/fl9uKfGtKygDybrSEFDvjqs+BItSNnwPTWQMTsstQrayD5zsDUQ
	oHmRf6+OMfY/iocNoXsqAAz8cQ69WeNntzVH02TVRscshC99RGQZ/P/432CZ0+gQF58xDMuHiR7
	p709YU2U8yLkq3hIk2ji62Y8PmJ9dT0HTKC2EZQ6jAYJg8LnbJSw1XRJH5p3rm6pUfkElfbNTUL
	b4H+taI20c/+BGXMQk62JlwGaAVNmPKLoWn6CFKujmT11mbiSzW1yk9/UrIMLwdtmlYIB1JxfRI
	4KAp6BJZMJO/hVhQ4p6Q4NLdrM55F95fhtUJFdLEbD1iipXnifKskFOu2CwOMrIfnsMI8v16BMc
	ws10EnT/lXXCbtZ3q0djeaWfyWE=
X-Received: by 2002:a17:90b:2f8c:b0:3ac:9c37:9426 with SMTP id 98e67ed59e1d1-3b41c92a2c1mr16021471a91.31.1795580139611;
        Tue, 24 Nov 2026 20:15:39 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41aab4729sm25258203a91.0.2026.11.24.20.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:15:38 -0800 (PST)
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
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Sherry Sun <sherry.sun@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Alex Elder <elder@riscstar.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH v8 2/6] PCI: spacemit-k1: Add multiple PHY handles support
Date: Wed, 25 Nov 2026 12:15:16 +0800
Message-ID: <20261125041523.242588-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125041523.242588-1-inochiama@gmail.com>
References: <20261125041523.242588-1-inochiama@gmail.com>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCIe controller on Spacemit K3 may use multiple PHYs at the
same time. The feature is not supported by the current driver.
So extend the PHY definition to support multiple PHY handles.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 57 ++++++++++++++-----
 1 file changed, 42 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 658ad2fa87b2..8a3cae32609f 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -54,12 +54,14 @@ struct k1_pcie_device_data {
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
@@ -118,6 +120,25 @@ static void k1_pcie_disable_resources(struct k1_pcie *k1)
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
@@ -173,12 +194,13 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
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
@@ -187,6 +209,14 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
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
@@ -198,7 +228,8 @@ static void k1_pcie_deinit(struct dw_pcie_rp *pp)
 	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
 			PCIE_RC_PERST);
 
-	phy_exit(k1->phy);
+	phy_bulk_power_off(k1->phy_count, k1->phys);
+	phy_bulk_exit(k1->phy_count, k1->phys);
 
 	k1_pcie_disable_resources(k1);
 }
@@ -265,23 +296,18 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
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
@@ -357,6 +383,7 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
 	.host_ops	= &k1_pcie_host_ops,
 	.ops		= &k1_pcie_ops,
 	.parse_port	= k1_pcie_parse_port,
+	.max_phy_count	= 1,
 };
 
 static const struct of_device_id k1_pcie_of_match_table[] = {
-- 
2.56.1

