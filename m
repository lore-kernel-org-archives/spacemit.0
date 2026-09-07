Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE32478E28
	for <spacemit@lists.linux.dev>; Mon,  7 Sep 2026 11:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780406; cv=none; b=iIGCFKUOv1tjgczD7L4EYxDvh82K8exiqQX0zGrKjSXdzZNwU0YdJakv/nWYaLvDQaeciIlnztr3msJesDYwCtoIu5HPAbpdsLtVy6VdJ+DJi9njIM1mT4YAp0A3EoAdSA061yD0J5fNAm2K4c5h98/oXsX+8v0EFqerkBzoxBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780406; c=relaxed/simple;
	bh=3KvegCNL4h2th2HP4yz1lMrFoOsU01heJpMNzftVqoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tBMx2/st+HYzaT0RuSVoohSL15hYbk3K2WEk9OWYYszK7RdCxF1RIz13ttb2m1MeqF3oXt6kwg6uMaN/FDJGFPCqzZ/f0gT2k7RFks3iRwpByrFcm5afKdtz6MT1DaSwkBkJ2+JxutfnTA4CGt0rVxlFQnXXmfOYA4Uupi1yBPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WHji6Dk2; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WHji6Dk2"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d8fd3b729dso27716125ad.1
        for <spacemit@lists.linux.dev>; Mon, 07 Sep 2026 04:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788780404; x=1789385204; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D4ROjh0Txn+cURQwAkggsPhj+gLlvJP/O4avQg1uNi4=;
        b=WHji6Dk24GJBz2BnOZpXWrLr9r/BhLsYSST1nuX1FTmlNCeewOUAFZuFvfBHfZyage
         89ZUWGed++LY8dC2o2nP14+JxVc55a9Yhl9SURR+Sbnue+OdFnwgFf2+GhA9Xp52nVg0
         qAP4TncLG9RJMmHEoclh8UWVwc4VVfuab7i1hL9YYOv05fXqTZ0T/IaONUih7i0zYdxA
         RyG7AM4Q868JYgq2/UISpr08+bT206IumRAsPW0uasYv7YHX+wfyV4+RSDM7FWpVYGrb
         1p12NMBuJibeKql+tw3bj+2b9jIxIbtOETanqH5BiOvGzsUvpiTRg/OZrHusytq4Cu/w
         oYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788780404; x=1789385204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D4ROjh0Txn+cURQwAkggsPhj+gLlvJP/O4avQg1uNi4=;
        b=g4gTDe3p5OEV7GGqw6aV4Cwx6tZeIrWVn67vcuUEFUvJAmgaAEa7tMlNr9Oe2vN+VJ
         pgcNzx0h6Xi9SMesNT6CWZKmcnIzDwsTgSFbj0xE4fyMcRDH+jfxFEn/YPLq73Dj6DpB
         NvrxJ3kb8ofMmf2fBaLOeGSOZ8nJG50g0Ctzoq500mPAtp0YfHqTX2Z6wK/nqm89NAGH
         s1BKdO01DGHoNwhExHOlgjWZFsA9L6D6Lqlo9pka/ijyqvybvCRxq8d0ivwEXy50/N5m
         2zZ8+e/8jvue8Y8w4yM6cu8esxVnPQFFwHQpYWtRrca8AzaFb8emLI6/hACFXQpl2ymN
         LUmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxioTIPTCNGwgCZayq+pL9LvfCnX8ZZDGTeScKNAHbMExgsF369T+vuFBjJ4mDvlk3D6AAXijKddA==@lists.linux.dev
X-Gm-Message-State: AFuF++lqwHrRQO9jDZH/fWTfO5RLPNGq/QcrxPkbySY6kpaG0706fFbw
	Dy1uXpKJMCWsMY/dOKCTcX97db8nVcB+lCs4EYf6wD40Z94W6j56Iavc
X-Gm-Gg: AYBFou3D+W2WVcGu2nE4C9mm5s34Uiyx23oJ5R7Smz87VuALwGH2QuFw3GC+DWHGY5I
	Qfo5NF7JSPUQvCDfhMcUV1WZeHkmJdVhJPt3RKFPIp6mkm2PfzKq/kB0dbzchgxrSN+hjPzya+k
	rzQPvP6cLZL4QvS4Ypj+ZE5nk2xvtrJsepIkdOpNdYLK3MtoOXI5LG0eXw2WMM5JsAED6Cryi4B
	MDPIIOHLjT3UM2nlGniZ9h9LT0KO5lqZ6wxxysGQQW97AQI0N1DqL6vAivlmorMoT0LYBzT7LLh
	ri71Oambyxi2rmO1/+Ji+EZtcV6Tb/hKlIGltT+TXlSw/jP08EMDNGYo5L2tolOCrl8Gi9UCcef
	74EKxcbvsiKVp2/60ZhGtEOdmiA8ppMB/Eq9TXcRAIKk4KuXENJNzBbzwkjJWYoE8fSnXtX5nmF
	AyNIH9viPmon851wpAOyaPcCzgwXtIztTytOlO
X-Received: by 2002:a17:903:2c6:b0:2d8:d4d3:da50 with SMTP id d9443c01a7336-2db126aae2dmr385170325ad.20.1788780404053;
        Mon, 07 Sep 2026 04:26:44 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1499dad4sm44234655ad.55.2026.09.07.04.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:26:43 -0700 (PDT)
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
Subject: [PATCH v5 3/6] PCI: spacemit-k1: Add device id update helper
Date: Mon,  7 Sep 2026 19:26:02 +0800
Message-ID: <20260907112606.465778-4-inochiama@gmail.com>
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

Both K1 and K3 need to set vendor id and device id, add a helper function
to simplify this.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 1049391beee8..c610b367412a 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -52,6 +52,7 @@ struct k1_pcie_device_data {
 	const struct dw_pcie_ops *ops;
 	int (*parse_port)(struct k1_pcie *k1);
 	unsigned int max_phy_count;
+	unsigned int device_id;
 };
 
 struct k1_pcie {
@@ -151,6 +152,16 @@ static void k1_pcie_disable_aspm_l1(struct k1_pcie *k1)
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
@@ -166,10 +177,7 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 		return ret;
 
 	/* Set the PCI vendor and device ID */
-	dw_pcie_dbi_ro_wr_en(pci);
-	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
-	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, PCI_DEVICE_ID_SPACEMIT_K1);
-	dw_pcie_dbi_ro_wr_dis(pci);
+	k1_pcie_set_device_id(k1);
 
 	/*
 	 * Start by asserting fundamental reset (drive PERST# low).  The
@@ -369,6 +377,7 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
 	.ops		= &k1_pcie_ops,
 	.parse_port	= k1_pcie_parse_port,
 	.max_phy_count	= 1,
+	.device_id	= PCI_DEVICE_ID_SPACEMIT_K1,
 };
 
 static const struct of_device_id k1_pcie_of_match_table[] = {
-- 
2.55.0

