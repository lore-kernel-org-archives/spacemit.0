Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF495248893
	for <spacemit@lists.linux.dev>; Fri,  3 Jul 2026 02:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783044050; cv=none; b=SNmqk1tScuFaxI61AbcPYtRKJq4C4DoRRgf/Fp65lGvhOkiEOApbopEWStZlFs3KvG49hMKbU8EYaVofnN6JcfXMy5aR1Iq3BFGopjBW8t+5oOwyF0HJ0Km+kiBX0P2qNLd+mjLqNmzH419ccMKahSMQoO5UvUWLlQ4fpDBos3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783044050; c=relaxed/simple;
	bh=jCP5Zz2e1jsHNyBDmkkcnVgytoZly9neC/WVj1uD+uo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VcsewFNM4lrDaG0Xq1IWqbPxE/BQtAY50u0CkwRPkXFMwi1+nxLVa7EpLypZn+DMAFvfVcyb+2bF19WULydDEZ9BMOWmP+IWtca/opSQrlgpZc5mOf/YaCrz4KTxqB01VvSIcRjLmJlHZimS66+xpa9Ppam76cR7TlT1L91aGWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d5PYoU7v; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d5PYoU7v"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c96bfabc8d4so27106a12.3
        for <spacemit@lists.linux.dev>; Thu, 02 Jul 2026 19:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783044047; x=1783648847; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7O6mnMyk+6LPMo3beQtKUpBA4veH6tNlOCZqSC3QPZs=;
        b=d5PYoU7vZBKlQZdMPkvv7IiOdvy+FICuVRXxVPEylZbyp2PCNfx16n3D/WZxEzFUAe
         FJ//mSMe3QcvTMuZvuDDR/KW3gIKVLvEjc4A3Nzzx/0yHkLKZcGAKZhcHvLIvZyNVHBz
         adI5WKcBb0hNPDI1Y5F6lpj2JDZjzZwjpg+EwNbfE2IzpCQ6EUnlfhKishaY5BE93T9g
         U3FMfYTThDZKqJgQfgZ02xb0J4aE0+t80iVvGqfbelawa4UyDZk7Q0lxBt9clXFGzM4Q
         08Zs3yVAmKiG5eSKuqpBKq/j7C7SqPEhQ7aDvO0G9UWzZG9H4CnnIbVPuWIInmHMfwFh
         gLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783044047; x=1783648847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7O6mnMyk+6LPMo3beQtKUpBA4veH6tNlOCZqSC3QPZs=;
        b=HGt2KF6WGj+WlS2GlRs32CC70I/1YkSywHyZcP4jQs3tJ2QEyXPMXxrS3KRCjR2cwD
         X/5hOIikYiCPqTtZHOXqQcApPLTdPpLNelRMi01fALWvsgg2jlZsrc383wmjoBh+DGMc
         RzCGnf5lzASJj9ld1FZA6JVLerqFkdmqmbKocRRESlLzn3njfNWWR/016iV5Ac9A2BoS
         qqvMFDTAsx4d2+dLFOdpharWVuEc2yg3kvtCJ9nmKRZOkRYgdVTiTMrNSTc4pRcWL3+Q
         L2w6YdgE0PzUnrQBP70VB+oPwDeIRqftczxypeQmc+kKdnnma68ajKgs0MSebXIGMQsu
         KG8g==
X-Forwarded-Encrypted: i=1; AFNElJ9rsrX5mbEeAFiykixe825OSTy5TMNeR9VG0P+ogLGTkyHN/xDWUeZ1u1zUTd1hpfRdKMLF6pZj9A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyylBT+ZvvKe0CXA3vQeUXxxM6GNg16qhq6RzjKesEp/Sz9L31x
	rqOIVCNOGBNEcTLspfMhLCe7hbEDrUJ7dSIlX4X5C5onT9PghAJL+eyO
X-Gm-Gg: AfdE7clPictfRaH7un/g+MwZxEcVPHCDxc4HhDUZAz9kUiMLEUjORDR56s6s7UKmeOL
	OLvYlccmFOjjfc9rgaUPgxh34GYV4+CMV4Yn2Zp0HWe+kV9GilgVcoW5wlhAGeKgXPSatT2TTc6
	O4zQWoLnwgT7IK5BqDk+qanYszLauCoN/CmpfwHCmhLKJYOGkxx8NPgbCOncia+vGDP67h1qgpg
	wxtqxpjqvtKgIFQrMT3z4ED2I6tNEGkNisCPMiQztuHa+4SUFn3ntM9Ms1gj3oO2C+mj3KwnEQ8
	/kqRLdOTOlumaKhlFAeuIZGMNUL7aRiYscgehER8kIUKhLAFfXkKDz1OKo/uYA1LjJ8ZIoDucCN
	77nHR8KhjnOzUftPHw6gHoveiHvAdHYwUIaO8TVGqZmcUEL0g1KzRx5a/096kZziac1v6YTK2iC
	lNTpgNvtPtnlI=
X-Received: by 2002:a05:6a20:c98b:b0:3bf:7e2a:e874 with SMTP id adf61e73a8af0-3bff4038a89mr8316617637.1.1783044047021;
        Thu, 02 Jul 2026 19:00:47 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8f3d74ccsm2024844a12.9.2026.07.02.19.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 19:00:46 -0700 (PDT)
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
Subject: [PATCH v3 3/6] PCI: spacemit-k1: Add device id update helper
Date: Fri,  3 Jul 2026 09:59:59 +0800
Message-ID: <20260703020003.485436-4-inochiama@gmail.com>
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

