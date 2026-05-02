Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375E1325491
	for <spacemit@lists.linux.dev>; Sat,  2 May 2026 10:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777716831; cv=none; b=S98T60HF22nVg+i6ZKpVQtdgF9YUsI3Fz5a1GRi3iXTfHP6bnGzAtOf+zRpzUiSp0AFqEQujCJd0KgoKvYAbNyuYaAb1WQlrfnXuLntPQVIIi5nf8LhHzAU2uIVG96mWrO2Tv55oh5AzcStZGqe7l5IandubTSalCM8UqdjfO40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777716831; c=relaxed/simple;
	bh=3pw1bdZuuXwrz+VnxjRJOnM0J5m0J5qcFaU9OOGALKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZsOPiu0O/dSgbVMpk9ykbRLwM3eaZT7Qa3PC7+Zc1a0+uozgsFSl0Yo0B2s5d1hS5+OGBAoR9nl+/fBj2fcstad1EOyKr1F/t2VC/DrKSozhxxjyEnCU87XLZ3INgK1s74ZTJaz1JJ1V9/Mky/kE6lQElYT40wWhI/3is6hA5Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s8TMGoXb; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s8TMGoXb"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b2589c26e3so23116545ad.1
        for <spacemit@lists.linux.dev>; Sat, 02 May 2026 03:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777716826; x=1778321626; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmMzz9kPOMJ2V6hEeqZMS4vdi4snOlkMyKNu1sYiAzY=;
        b=s8TMGoXbfpLhECnx+YoFfFN+tGCG/lLjBelZLEAeJrS65M4GdzUWBtidKW+N4weu+s
         cZNGHWFLe48vPEAjccAE3dg5b+JkqfO7Fsxdl+iRHSS5gKfw5v+yiVB5jLtA7c0R3sLZ
         HSIeAvlF+arMzKGPY+sfLPubq0ifg0jAsYWFmLVT2XncEDSBDFWxMVG+48jSOkt61IjG
         YMZv1Ix9NxWBgKiow3Ac28hb5YMWUEAsDlZI4BSQSGt0p0f1OPqpfNBFH0Obdg+dx1C2
         TBzGypWuTLqPesmBH1F8YqGl4ORkzGhz7vpjRSYNI7v4GpJCkzfW+Zx1BE3kGJFsDFtx
         t+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777716826; x=1778321626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KmMzz9kPOMJ2V6hEeqZMS4vdi4snOlkMyKNu1sYiAzY=;
        b=ZO/ivpn9nUL0aee/G5zoAPZrjXh2bb/Zami8N9by7MNSJq4RNY1/F1HIgGFqReaLpQ
         emIr9ds7oxt9HTvcxZWLBrvgnk7XKFGmDiLl9oGWoGXIJOfL/iDB4DplV/q/hTkyCKWs
         iTynHWV9jIeLfTDg8+Ae2hV+KqMpm2coMIMb/ajlUSPe1pxsN1sINdg5hK0dguzVOavg
         5lBHRPMtO/X5EYWQMTLXmV82whXCoBxqVXzHP/43Ss+QLQx8kiT3+Qu7RZgNSuotoDrO
         OXvgPR7+/BPJrNhyq/1231+w7qfd88XrxPsdQsNTBeljE/wzoUjQzIRi17Tu2CKCfpwK
         EBUQ==
X-Forwarded-Encrypted: i=1; AFNElJ8A6UuAcB8TxhyMsYUgJqpD+8PSgdNZkLzCP5Ca7njCSBGtsxiYFMJe+gUdVC+VuSK6gEhPo+mikw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyoLBMIXCM/sR7ZfPabV5w7hwZ/3jbzmYCAeBuzIWeAEW+ZydJa
	nd6GoZgk6cJYw5/SQjnMB4zMKVyXhg+y2zQyuUp+s9ye2aQrojMZSs0g
X-Gm-Gg: AeBDieuGzlNAp9qQTeOYQU7pnbxlR8YLpUEpuNEupOmbSSsYAr0UdqqLta5F3s93hIB
	+IFfngnFgHoxsB2kNM5sYaZaZLoP+LRZyFL+4+8xgg2Yt7gjWZaW3EpUxxpgXe4vp/idTKSBRz/
	7r1ad2Rdwc+fv8BI61iAzW5UUYvT6cG7n7yE5kBKkj5fuOhuhe8tz4aHF4WUK6MA2LCcWNbHnN1
	oQF3zeG8fyDs6nWhI7pt+/udLf+ZyI6g8izXoEjImi6ivZGODnJ2shhFdY9x5A/wUsd9b+oS05i
	vqrhHrPrpUI58aJTNb05bBYMyq6S3wTsaF2u/nvaOFq48uIZmLXNxqWXezh4TluXld27QJi70C/
	ntQmLvpQxNynlby8WvNLC2sp7TevjFrKJNhUK5b8i5gwBv8QLtGg8k0vRqRjI/DqqQJw8q9rb/n
	UOARGgW51CiSi3b7D4Nnyz4L6qM52s0PBE3g==
X-Received: by 2002:a17:903:3d4c:b0:2b7:ade8:2407 with SMTP id d9443c01a7336-2b9f25e8353mr15599855ad.19.1777716826438;
        Sat, 02 May 2026 03:13:46 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caaadb1esm48776715ad.20.2026.05.02.03.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 03:13:46 -0700 (PDT)
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
	Inochi Amaoto <inochiama@gmail.com>,
	Alex Elder <elder@riscstar.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/5] PCI: spacemit-k1: Add multiple phy handles support
Date: Sat,  2 May 2026 18:13:15 +0800
Message-ID: <20260502101319.2364052-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260502101319.2364052-1-inochiama@gmail.com>
References: <20260502101319.2364052-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCIe controller on Spacemit K3 may use multiple phys at the
same time. The feature is not support by the current driver.
So extend the phy definition to support multiple phy handles.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index cd3cd038ad2b..f2a722e5edb5 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -51,7 +51,8 @@
 
 struct k1_pcie {
 	struct dw_pcie pci;
-	struct phy *phy;
+	struct phy **phy;
+	int phy_count;
 	void __iomem *link;
 	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
 	u32 pmu_off;
@@ -172,7 +173,7 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 	 */
 	regmap_set_bits(k1->pmu, reset_ctrl, DEVICE_TYPE_RC | PCIE_AUX_PWR_DET);
 
-	ret = phy_init(k1->phy);
+	ret = phy_init(k1->phy[0]);
 	if (ret) {
 		k1_pcie_disable_resources(k1);
 
@@ -192,12 +193,14 @@ static void k1_pcie_deinit(struct dw_pcie_rp *pp)
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
@@ -278,7 +281,12 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
 	if (IS_ERR(phy))
 		return PTR_ERR(phy);
 
-	k1->phy = phy;
+	k1->phy = devm_kmalloc_array(dev, sizeof(*k1->phy), 1, GFP_KERNEL);
+	if (IS_ERR(k1->phy))
+		return PTR_ERR(k1->phy);
+
+	k1->phy[0] = phy;
+	k1->phy_count = 1;
 
 	return 0;
 }
-- 
2.54.0

