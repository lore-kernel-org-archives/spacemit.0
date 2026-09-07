Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791C54749EF
	for <spacemit@lists.linux.dev>; Mon,  7 Sep 2026 11:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780401; cv=none; b=nIQEilhAFlDZOzisFf5RpPv9ocg1MzqZloN9wLHOTFxDpqJt3Ofy9Ageb6cxgv2bVLFEvpHwhKJDjHQzUl1Uom23V5sCJ13EAU7OreEDr/bRu50gGXbCLakPeS1sZRagsW6m1o2krmzX8eLdbnE1FzCDB/FWJM3Sr7fMbAjCPAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780401; c=relaxed/simple;
	bh=mdCPQeEcSAMoGJw0IrGjVzlTvAigGgNLqFZhPQ1+zZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kzgjVfto8wuidm4lQkyHgWsnAq4IoNZu2WTdCFRr0QfQRfM65c1fhpwjYLLD8cVShFo+oef6YhWvk47QXLXnJ4b7/7V4jZC1WrIqtgrsgp5Qzhea6ruCyn/i5HxmIGGZxlewfR0PGRNtEEZr+0yD/LpTB2WEiqJJ2JXNbu1hSPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/QtppmN; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/QtppmN"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-39266382df6so2604880a91.3
        for <spacemit@lists.linux.dev>; Mon, 07 Sep 2026 04:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788780399; x=1789385199; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IYNU3JutMTV98e9RCfpqkVsEuBCUrUdbqqssfR9cXXM=;
        b=K/QtppmNLqcz4uwZ0y4f+JyZUhQ7cj+p3zvxLf1r2ej2dor2c54L+5djizLoyWtUOG
         ZRhMEiJimTK49rmwVes0D+CdY3LwChPhH1rkbhs6yNWvF2KFx4QRTJtjOfNECMPx/zbv
         8XOftB9i2mAgz4wIYK4MCkdn1OGhytMSnwDNunWaL1bTNV2xARD9Z3UE1WW/yFYSoTwX
         wQNdKwl23VxBXoNhVO2VczMN4O8tiC6OVpHVYQO63CZG6t8r6ODnSbnhKTZIPaK1F585
         Uca/L2X7hj2HZFxXhfTiIlZGygOxwQJznlK6/jxiXnaEuwyS4sSdM3Vo8ZU6M7kL6CCq
         GQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788780399; x=1789385199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IYNU3JutMTV98e9RCfpqkVsEuBCUrUdbqqssfR9cXXM=;
        b=knCKF+MSIoXAJvy7RAShed7m/z9SZILvOJvNuqLlOxcKhJLYzo1muEahNbU6Tr4msM
         Q6Jfdq8ORFaiM/x3uy7Td1tuSCtyfSy7jKAkysBZXeEDiiWEqUKYJaLfK0n5dy4xZDOb
         8oQxyfyJy2CRv4lFBaS0czg5thmYzo6cLJo6AywLQ/9dYcjTEtgDOgBuvxeUUJQuo3Po
         C582E1qB0cM4hZqurk20+Rl27fHwMeJsxaUSItSxvsUvWNNfmSusaI/hd2a9H1QZMKpF
         uQci5mKjnMk8cRHmsyd+ubaauuGv6KYhjKlTNmCcgEbvRrD6FG4Q6zuol4u4NgcXVU9O
         mqFA==
X-Forwarded-Encrypted: i=1; AKwUvByDEA6HRDI5LolsxSfDJjQmuc8a60oNFIpiZt5DfZ/PFomxFw3bOzLI6sRleLqVtDhowF44Br90Hw==@lists.linux.dev
X-Gm-Message-State: AFuF++kLCEhD7jE0jxuZa9VNn2NDrku84W8KPe9IEEoRkhIpjnJGc3kv
	Wj7/zrcImHhiuK586YgNMKT8teU4h/x2HssEa4ZHDaoENST5vVmwbIPD
X-Gm-Gg: AYBFou3J0D318jNQT6mcYgrG+2erXvYCzLVnlR+Fn+UaYvvdKJxdTlktRFS6ZOZ3xKu
	uolc4F57aCyMphSwJ0WtEbx3pXgm/BBNt0r0iKNSDSze5dFEJxgQSNP7+aR7IwCB8gx2seC7V42
	PhZIFITpfHpDv0kD8fzbIHsOFAb1209UhXc77jBX5ah8nkemFMDJHp/KAvRuE0bh6Jb63ENLtxN
	ljvcxM7wbNnxoHvSaWwqBvhfuW5+HD08brkSuqXoVPijVqWJyIT2sxiucjD4ASucYO0b9Uu0SGJ
	4wPT9KThwnu3QDPx+FRB722lSDZdYrRMiO+y4SRszuWnIO+4Jvknm49R9ALBqeS7FsObS6cBV3w
	Q9dVv3hSJNhRCGGp8WB4yOoRtkvFzVn8/EtW6UnfSpJIbr0l2CDk5mzPFT/7mE7MeeHQ5MX3yV+
	BWPrFbPx7zkRNeGDmDZN2v/vPDzEXynoCUNOuk
X-Received: by 2002:a17:90b:510c:b0:398:9be6:f999 with SMTP id 98e67ed59e1d1-39b262e27a9mr37011195a91.24.1788780398731;
        Mon, 07 Sep 2026 04:26:38 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2612d3f1sm19984853a91.13.2026.09.07.04.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:26:38 -0700 (PDT)
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
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alex Elder <elder@riscstar.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 1/6] PCI: spacemit-k1: Add device data support
Date: Mon,  7 Sep 2026 19:26:00 +0800
Message-ID: <20260907112606.465778-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907112606.465778-1-inochiama@gmail.com>
References: <20260907112606.465778-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To reuse the K1 PCIe driver logic for K3 PCIe controller, add device
data to handle the K1 specific logic and make room for the incoming
logic for K3.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 30 ++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 0564c46e2f48..9512556d4539 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -45,8 +45,17 @@
 #define PCIE_CONTROL_LOGIC			0x0004
 #define PCIE_SOFT_RESET			BIT(0)
 
+struct k1_pcie;
+
+struct k1_pcie_device_data {
+	const struct dw_pcie_host_ops *host_ops;
+	const struct dw_pcie_ops *ops;
+	int (*parse_port)(struct k1_pcie *k1);
+};
+
 struct k1_pcie {
 	struct dw_pcie pci;
+	const struct k1_pcie_device_data *data;
 	struct phy *phy;
 	void __iomem *link;
 	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
@@ -274,14 +283,21 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
 
 static int k1_pcie_probe(struct platform_device *pdev)
 {
+	const struct k1_pcie_device_data *data;
 	struct device *dev = &pdev->dev;
 	struct k1_pcie *k1;
 	int ret;
 
+	data = device_get_match_data(dev);
+	if (!data)
+		return -ENODEV;
+
 	k1 = devm_kzalloc(dev, sizeof(*k1), GFP_KERNEL);
 	if (!k1)
 		return -ENOMEM;
 
+	k1->data = data;
+
 	k1->pmu = syscon_regmap_lookup_by_phandle_args(dev_of_node(dev),
 						       SYSCON_APMU, 1,
 						       &k1->pmu_off);
@@ -295,11 +311,11 @@ static int k1_pcie_probe(struct platform_device *pdev)
 				     "failed to map \"link\" registers\n");
 
 	k1->pci.dev = dev;
-	k1->pci.ops = &k1_pcie_ops;
+	k1->pci.ops = data->ops;
 	k1->pci.pp.num_vectors = MAX_MSI_IRQS;
 	dw_pcie_cap_set(&k1->pci, REQ_RES);
 
-	k1->pci.pp.ops = &k1_pcie_host_ops;
+	k1->pci.pp.ops = data->host_ops;
 
 	/* Hold the PHY in reset until we start the link */
 	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
@@ -316,7 +332,7 @@ static int k1_pcie_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, k1);
 
-	ret = k1_pcie_parse_port(k1);
+	ret = data->parse_port(k1);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to parse root port\n");
 
@@ -334,8 +350,14 @@ static void k1_pcie_remove(struct platform_device *pdev)
 	dw_pcie_host_deinit(&k1->pci.pp);
 }
 
+static const struct k1_pcie_device_data k1_pcie_device_data = {
+	.host_ops	= &k1_pcie_host_ops,
+	.ops		= &k1_pcie_ops,
+	.parse_port	= k1_pcie_parse_port,
+};
+
 static const struct of_device_id k1_pcie_of_match_table[] = {
-	{ .compatible = "spacemit,k1-pcie", },
+	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, k1_pcie_of_match_table);
-- 
2.55.0

