Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160F01E633C
	for <spacemit@lists.linux.dev>; Thu,  9 Jul 2026 04:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783569692; cv=none; b=DjptIsUPZe7s0JeK62ElV2TfzvsoWRw6eGDT6vJ+i5y2cw7QPqZf+V2kejQff55BsqLNby6E2e1JgDU+XWCw6fnyoRFJtxMFx6Uz1LA1qX9ax0yynHmT8wJdLcP3ySMcEBG3L08uePmq1I0QtSzWxv2w3ylpeL7d1pXHvV6slMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783569692; c=relaxed/simple;
	bh=jCP5Zz2e1jsHNyBDmkkcnVgytoZly9neC/WVj1uD+uo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EudSo1FEQNXXR+J8BiPCZOupJD3XJy3c0XA4oA5q9Ov+vWttHCdr4NaPQxlTmlrGsYxioSXdPJqzsL05DwUJ0E1qiGlaoLuF3cxhUN3A+oUq7zJyzkkwkSAvXobWQGkxTn0Tt1BKYevA2/yBp4b+pW8adDkx5mlUHF5w5vt/6E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSkUZENO; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSkUZENO"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-845ea8924a2so1557890b3a.1
        for <spacemit@lists.linux.dev>; Wed, 08 Jul 2026 21:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783569688; x=1784174488; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7O6mnMyk+6LPMo3beQtKUpBA4veH6tNlOCZqSC3QPZs=;
        b=SSkUZENOlJ/Llbi227jhZTQkBBbtbPV2qySERwLBcCWeDQrUSFWRO/7T6Q9G3t7QQz
         xqhMEEl+rFDFHBpAp6z/taw//ngos0J08pLoZXSLtE/JqMEJc8KNcgyHxLNSmS8pUML3
         UA4kbAYiT9mPVG6jZ9T+N25/2xd2OGrq0yJ9CI80Qgteuhuqr0i+PDtZWBYibZ13qipa
         ouaaVVRO/SOAp87EN4x5M6L0MBAglmKUCDPUmWgBRSVFvB3ShKuOLwVugXb5tyGrf6Vt
         6Zo29Xks7qoA8+QdHYsmO9mrPMvdzYRBwzKLYf+XWsgZkEQyNoC/V2kWZ8rXO0um44WE
         ivSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783569688; x=1784174488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7O6mnMyk+6LPMo3beQtKUpBA4veH6tNlOCZqSC3QPZs=;
        b=n6zUcQaRdsuKhCB6WqfNY1ZwDH/kc1qEbIXC1rjddjDe+VT/ZNpuJgCmmJunejotC2
         2NEnROqWtEQDJ+KWnV/RX0Av/NpykU4/MwUVp/ujIrUAD3/0683oFIBWth6qZm3v0jeS
         +k++DKRdWDL8jSTVd8IP4rJJobV1IckUxYx6g/bfsv7SKvdNxZV9MO1isBTgXFfHcPok
         BJu77frlNGM2KaR9fhAIpXq0YciuFGZo4E2iW8HC4i/PD+0Oo59kWUYW9TXBJQFckxaZ
         ZTVSaBj6OQ1HRF5gpOVJ8ujYiiaia+0/qcn9R5gukkF87qV1Hvg4PAoEGuCufc0tlTUY
         Su8g==
X-Forwarded-Encrypted: i=1; AHgh+Rq7PoLg4EK0xvZKmRvM9pIE/T5BqaUUXunoEz0CNPU6hGLTFCUs2HBsrVa8lu8XeyjTE3IG2VdbsA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywhvmmj1D9P5kuDj2Qbj7d36vHaAKIad5Qu+moMyh2Qp/WnrPcq
	y/2oHhM/x05/Z2NFFHuxRhzruCXk2RX78vRpdOIVmqjlAN9WxosQp6EO
X-Gm-Gg: AfdE7cnmw9kYq6p1HNFQ574E/WG+V1l8v+4eUqb6wAdEj/sYOzA8e6T5RQyNHZFsmWA
	h6dig8LE+xTcm9/9Hs2UGFuiTsuF+y1qC477/8PmvbUmcrHGUtKNoFLmFivRlhsIxR5RsqurnLq
	zwFoZwTWbYA1pwfOfGNYwFVMMqBhBx8Wde9Q6/CaDz22/dfbC2elQxHExhcJH+mu6GCdE29C6Wm
	IHSZe6KEMefh0gTdpYMvBk21CcRaOb3DhKou3tfr1wJ+3IBmtXthkYbneKRRdyzq89D3c/p1sOL
	9v5PcULdXwTNrmSl73BJ0wVNxAn8pVsLpRP0SlGdzt2vjPLT14V8zLHL71FlzDx4MZ3gzWzNreA
	F7s3Uo/QX2k/kEv8paiYp5vuV6HNziB1oDadgGtrydZjJVaJc1zTJ+wBz2jBqT/C9
X-Received: by 2002:aa7:9067:0:b0:846:1b9:cb63 with SMTP id d2e1a72fcca58-8484356de46mr5839163b3a.62.1783569687912;
        Wed, 08 Jul 2026 21:01:27 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7a96fsm7868309b3a.46.2026.07.08.21.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:01:27 -0700 (PDT)
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
Subject: [PATCH v4 3/6] PCI: spacemit-k1: Add device id update helper
Date: Thu,  9 Jul 2026 12:00:23 +0800
Message-ID: <20260709040027.958400-4-inochiama@gmail.com>
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

Both K1 and K3 needs to set vendor id and device id, add a helper function
to simplify this.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index e22ecbd09579..31aac056b68e 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -56,6 +56,7 @@ struct k1_pcie_device_data {
 	const struct dw_pcie_ops *ops;
 	int (*parse_port)(struct k1_pcie *k1);
 	unsigned int max_phy_count;
+	unsigned int device_id;
 };
 
 struct k1_pcie {
@@ -186,6 +187,16 @@ static void k1_pcie_disable_aspm_l1(struct k1_pcie *k1)
 	dw_pcie_dbi_ro_wr_dis(pci);
 }
 
+static void k1_pcie_set_device_id(struct k1_pcie *k1)
+{
+	struct dw_pcie *pci = &k1->pci;
+
+	dw_pcie_dbi_ro_wr_en(pci);
+	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
+	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, k1->data->device_id);
+	dw_pcie_dbi_ro_wr_dis(pci);
+}
+
 static int k1_pcie_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -201,10 +212,7 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 		return ret;
 
 	/* Set the PCI vendor and device ID */
-	dw_pcie_dbi_ro_wr_en(pci);
-	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
-	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, PCI_DEVICE_ID_SPACEMIT_K1);
-	dw_pcie_dbi_ro_wr_dis(pci);
+	k1_pcie_set_device_id(k1);
 
 	/*
 	 * Start by asserting fundamental reset (drive PERST# low).  The
@@ -406,6 +414,7 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
 	.ops		= &k1_pcie_ops,
 	.parse_port	= k1_pcie_parse_port,
 	.max_phy_count	= 1,
+	.device_id	= PCI_DEVICE_ID_SPACEMIT_K1,
 };
 
 static const struct of_device_id k1_pcie_of_match_table[] = {
-- 
2.55.0

