Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0246035DA40
	for <spacemit@lists.linux.dev>; Thu,  9 Jul 2026 04:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783569685; cv=none; b=hiVGvRBno/SUIDFKIpI3A0XdRqN3bzt0MSlkWmnldMKAoEO99l+5kHkvad0e/6Frt3W2DHSPq9M04CXmvRoZKHaGE+1Va2yP8U2DCQxCPNyBsKpugeNvwenzBYpUz7WdstF89dRrzSik0+/Nn/QoWWoKXriYMreVCvPRtOZCuxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783569685; c=relaxed/simple;
	bh=04yEbrBAj5g/Fp2zUPgpONY8/+NGEPJo0vMYeCOwxNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TeGg83IoxqdgAAhQNLlfPV7uPZ4pZh9EYNa9DSjBRfR2dyvxTHBkLCLQ/Pu3gMsGnC/uIDRSKVFOK6vVhHcZr1AJhdJkG8U7PB6w/+K5CIOOHPWUllmVObzIQdJFNCISL3y6gCwigt6Dz/HD6bi8Yds14NGCpvoxLwpacxoulo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kmWeEJSa; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmWeEJSa"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3825c406ffeso1515675a91.0
        for <spacemit@lists.linux.dev>; Wed, 08 Jul 2026 21:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783569683; x=1784174483; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KkWnYh3cllnXcTwBIcvBSJWZoRydH1m54nLp+o8irTo=;
        b=kmWeEJSaI737hcIj+U7U7kQZ67pMtMNKyjN/CMiHIKkk8ou2XuVAn78FVoZPm2+hgo
         zSyQgqqHNQbdMdvWsTn+9l8otd4DDztGefSCYTeC54OSK+MWNeoWPJ8xSjc+HnG3DFhE
         3IaM2/EZuabsaK//T9pyBkxAMkik8rfj0Xsm9jGzH+pKTzvbvo6Yz8MGyGDR7bkLRtg+
         QhAJhqQ+MuGFsHxZcGDNGKgl4LGPjbOHyCUrjJSrwEYFQHR1BuUeuj9bTv9DMVJQ65+7
         lOp2gOmkfJUaJBQ65RvT+hgD51FRVOnkDFLI8jMDf90uLELjgmDU6ffasT83RMDS1Muz
         CnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783569683; x=1784174483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KkWnYh3cllnXcTwBIcvBSJWZoRydH1m54nLp+o8irTo=;
        b=XpW11WK9FaDKfzzpk/FicL7VQARIDy+owIk6we0nSRkleCIotm4CYnAe18pgWEPotK
         UULNf01IxColZYP3QFiiJT6QbVhRZJxddBnW8CufVwzxB7InplleP/HCtInS4hxsCNlX
         LpEaCTopy5g2pSdFj4vdjLn7lbgP3KxUm+sxx90QBKUZz2qAC4df/04YcDBUYkqnv7J3
         qitQsZ5ddPFEA05DTR7M4eaTSNjD/m5jLImR4DamMSKWXDmn7iyA9sZjmBFiAcivskbf
         QIl5sl6mQ3JeGZ84Xwppq/DmH0sIMd8Zz2LADOSgijzWx9kNpDQxMCJlv5e9+Fnh+mkm
         uBIw==
X-Forwarded-Encrypted: i=1; AHgh+Rrafq1N69A3nighzfuewD7B0RJsBD5obPskBCbp4+OkydNHWWo70+uk3KAlbs+FaFlzHse4f5g3Xw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwxbUKYohBFsgZvcMGN5ZdxywsZdFIfkzjqATNK2c/lx217LN2a
	jvgJ3yJHwV/YVq399cOiYPDC5hUzlRBBGoSHES2gugDgR/3g1tr8KStZ
X-Gm-Gg: AfdE7cl9v9jzUNfGEKtZTxHMmtyQRMJZO78DqMCv/ZbIkHtfLXCeYdieAH7srGk7UUm
	RjP848bK/mt+z6rtKlgpgMoXkoq1vG2Ri1d4wACmuSPdtgGXrayrSyFTsqlfVo/TyHoct8jxfNJ
	ZFgteayAAKXl72FQqCqvzxIKT4WuPwf08YXjiuE6/N/y6fQL0W6c6OVylTa7/25cEIrBunmTMFg
	WzA1Cp3q8t3Ma7XJbPLrbK5K+Nge4oGkXTXsrpfBkO4vrwGWKXampbwNW6sF437dU9qGUMWHC/g
	u5zu6rTqm6NArG10CoQkvbWtY5yAs3fTGI0d55sOJD8Bhnwfv8MeYZaK5EACE4uRzRHdDGFvpTl
	AuO1VqCgeKNwD1fwltU/aC7avoSeqZBinn/kZb/Yso4Y1qnPDp3DYovHf46q/CK6abJCPuJERXN
	o=
X-Received: by 2002:a17:90b:56c8:b0:36d:66d4:270e with SMTP id 98e67ed59e1d1-38941101e99mr5534226a91.5.1783569683198;
        Wed, 08 Jul 2026 21:01:23 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5506b418sm423373a91.2.2026.07.08.21.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:01:22 -0700 (PDT)
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
Subject: [PATCH v4 1/6] PCI: spacemit-k1: Add device data support
Date: Thu,  9 Jul 2026 12:00:21 +0800
Message-ID: <20260709040027.958400-2-inochiama@gmail.com>
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

To reuse the K1 PCIe driver logic for K3 PCIe controller, add device
data to handle the K1 specific logic and make room for the incoming
logic for K3.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 30 ++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index be20a520255b..f6ae8ff3589a 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -49,8 +49,17 @@
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
@@ -278,14 +287,21 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
 
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
@@ -299,11 +315,11 @@ static int k1_pcie_probe(struct platform_device *pdev)
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
@@ -320,7 +336,7 @@ static int k1_pcie_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, k1);
 
-	ret = k1_pcie_parse_port(k1);
+	ret = data->parse_port(k1);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to parse root port\n");
 
@@ -338,8 +354,14 @@ static void k1_pcie_remove(struct platform_device *pdev)
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
+	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data},
 	{ }
 };
 
-- 
2.55.0

