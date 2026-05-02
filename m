Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2009D33066D
	for <spacemit@lists.linux.dev>; Sat,  2 May 2026 10:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777716839; cv=none; b=FFIZKA+YoeW9N5U6wIxOdQm/W29vnbV1kGveeGRxZN3Ito8pde6zeoqS00U2SavFXy9B/VzpGmTgWq22CdmUj9y3iMy0dSJSh3XM90LBsGj40jUfPQHVRDa6fBBxNvyjWTz3zAcaIN4bVEWDM3nGl+1ksa8+4F8UA2nSLUKFbuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777716839; c=relaxed/simple;
	bh=IIn0BqYi016AJzSVBnUNDk9SvN+vM/Po4/FcjBlMWf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kr3RgiN4KzJkqzLAj7pGC5zhJVPJPJq75sadw090Lq3jhV1/7/xOawMgrjOMztCDNzXIYAOG2fKSLWotzZVL2mQfeLqLY1NUPGdeVtQ7XbgnDD2Q7SFmwmZIZ3Ro7GGqTlUDlwfDrmZBTw1kWLj2FCTs41rwW7NyMIffw6aaSNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hefZXZz+; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hefZXZz+"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c70fb6aa323so897992a12.3
        for <spacemit@lists.linux.dev>; Sat, 02 May 2026 03:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777716834; x=1778321634; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gr6D/Xzdn4v9rbHKlmP/r4GXGKbaNof+CbkZ0R6qh7Y=;
        b=hefZXZz+LyP4mj11PXpTIcKFwbZx2cU/Ij55oAl55RJ7JDVcd1Mg59cU/fQMrib1hA
         QBkghDq6jVAsrWt3zI29qLmK4vz2IVvBNVsMS4QDMBqFtZ5zqKNbm9HfNmQvzh73G91c
         BsUX9ojKvouzl5Uq/9VmEi+dfvo6Qp6FL38BctuerxsXfbzHPIbTZbuTalT8t8iA2y+I
         O13yprNbX0LLqZSbVRFmAJS65/NZRGb48cYczMY5yBgr5M1aiF2jqJjKS41Qk48n3rdp
         aY3QhnW2ciffpEi1+JAnbbaDbZrU6q32CzR3iMplL01qbrxDR00G3t8tE16/w5upcHrS
         7IVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777716834; x=1778321634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gr6D/Xzdn4v9rbHKlmP/r4GXGKbaNof+CbkZ0R6qh7Y=;
        b=acJ4IbS4O/RohiPfQ+mI2oXsNNZN9nab/rXFkXMHqy0aI2y77qqBE0CSAXvK4Q6t0g
         Z/ds9v1VcduXdBVXHf7OUQvL9N01RrrhRlckJ4DPW7zqa0oSPWT20pVnTvHlmjeiMWbE
         lMtGJw7/q0cHq9TKY8Ci9BEHaYYAJYGpjnpY7jvZFzKw0BGTKOa4KA2UgT27Ts5Opc/F
         d0y/SkOS3voW1tzvqum9EoL+SAMbGymk3owc66vlhzQ9ezAqxTdWr8iUMbplo5Rwoywc
         Wo23fS3Igwz4ZqBRFkg7IjeKjOkL8DDSu2JZHDA6hNb8A8jtEs9RFsdW5OEa16kJwKNn
         gOLQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zYToR4mrb1pm+D8swsBURal+ele3zkTrV/do9r//yCq8tQESNVg6qFtuLwY19rIZ/aMWQnH84MQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxk6Erk8TR9o4Y7rhT2TcTEPcZqYFF52EPnwMoDsZfHVWyfoUBx
	tygCz2JQP+lasgPH3IwbZ8NmAul5H154e5jaoYJjQfbkrCmBN7V7k6Tf
X-Gm-Gg: AeBDieu2Dy3IDPFupwpzmJXaJQxtt/Fd+3MtjJXrrm1jLMLYG7IlJQLY9cCeLg6oJhH
	kPJSkMh6N96Ji0AjlI/mLDZHe0g82DqSWIxqHtSq1sM0gMIA8+/PnVzBLwJUoiRjAJejZ6VM4/F
	+RS4Dz6aJ2lkJAy/s1S/qcAusM9eHm/SElNK1ewy9EpJ2KDbYU15sgfx1ghkPO/NAgp4x0z/xqG
	rME7sR65YZzG2MH2yYyXQTNF7ACz96gzLZ9g2u70xWZU9N3tlpo8MiGU9xEhoByhyovpVSFG3D4
	tV2mV+gee7x+Df0FbORKsfduglhGc7k9xMXa1dyPAh5smPmAXL+IN8ozL/sQ4aAiI3VYYOEjFEJ
	xUfSZAyMaaiZ79OEGw/shm7XDv5Sxq4iDJvdgy6Buic9TtKCafXaDEqSUkqsMkIElFxKIXP1DFA
	AUSHATOP/a8g7VlB3hU0zsvnWbHK4MhhlMt8vMJK9fyqEq
X-Received: by 2002:a05:6a20:72a7:b0:39c:235:c5ec with SMTP id adf61e73a8af0-3a7f1d18314mr2674945637.34.1777716834197;
        Sat, 02 May 2026 03:13:54 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515ad0049sm5842519b3a.33.2026.05.02.03.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 03:13:53 -0700 (PDT)
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
Subject: [PATCH 5/5] PCI: spacemit-k1: Add Spacemit K3 PCIe host controller support
Date: Sat,  2 May 2026 18:13:18 +0800
Message-ID: <20260502101319.2364052-6-inochiama@gmail.com>
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

The PCIe controller on Spacemit K3 is almost a standard Synopsys
Designware PCIe IP with extra link and reset control. Unlike
the PCIe controller on K1, this controller supports external MSI
interrupt controller and can use multiple phy at the same time.

Add driver to support PCIe controller on Spacemit K3 PCIe.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 238 ++++++++++++++++++
 1 file changed, 238 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index f2a722e5edb5..fa529ac18f2d 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -23,6 +23,7 @@
 
 #define PCI_VENDOR_ID_SPACEMIT		0x201f
 #define PCI_DEVICE_ID_SPACEMIT_K1	0x0001
+#define PCI_DEVICE_ID_SPACEMIT_K3	0x0002
 
 /* Offsets and field definitions for link management registers */
 #define K1_PHY_AHB_IRQ_EN			0x0000
@@ -32,8 +33,27 @@
 #define SMLH_LINK_UP			BIT(1)
 #define RDLH_LINK_UP			BIT(12)
 
+#define INTR_STATUS				0x0010
+
 #define INTR_ENABLE				0x0014
 #define MSI_CTRL_INT			BIT(11)
+#define RDLH_LINK_UP_INT		BIT(20)
+
+#define K3_PHY_AHB_IRQSTATUS_INTX		0x0008
+
+#define K3_PHY_AHB_IRQENABLE_SET_INTX		0x000c
+#define LEG_EP_INTERRUPTS		(BIT(6) | BIT(7) | BIT(8) | BIT(9))
+
+#define K3_PHY_AHB_IRQENABLE_SET_MSI		0x0014
+/* MSI defined as BIT(11) in existing INTR_ENABLE, reusing */
+
+#define K3_ADDR_INTR_STATUS1			0x0018
+
+#define K3_ADDR_INTR_ENABLE1			0x001C
+#define MSI_INT				BIT(0)
+#define MSIX_INT			GENMASK(8, 1)
+
+#define K3_MAX_PHY_NUMBER		6
 
 /* Some controls require APMU regmap access */
 #define SYSCON_APMU			"spacemit,apmu"
@@ -48,6 +68,9 @@
 
 #define PCIE_CONTROL_LOGIC			0x0004
 #define PCIE_SOFT_RESET			BIT(0)
+#define PCIE_PERSTN_OE			BIT(24)
+#define PCIE_PERSTN_OUT			BIT(25)
+#define PCIE_IGNORE_PERSTN		BIT(31)
 
 struct k1_pcie {
 	struct dw_pcie pci;
@@ -263,6 +286,213 @@ static const struct dw_pcie_ops k1_pcie_ops = {
 	.stop_link	= k1_pcie_stop_link,
 };
 
+static int k3_pcie_enable_phy(struct k1_pcie *pcie)
+{
+	int i, ret;
+
+	for (i = 0; i < pcie->phy_count; i++) {
+		ret = phy_init(pcie->phy[i]);
+		if (ret)
+			goto err_phy;
+	}
+
+	return 0;
+
+err_phy:
+	while (--i >= 0)
+		phy_exit(pcie->phy[i]);
+
+	return ret;
+}
+
+static int k3_pcie_init(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct k1_pcie *k1 = to_k1_pcie(pci);
+	u32 reset_ctrl = k1->pmu_off + PCIE_CLK_RESET_CONTROL;
+	u32 val;
+	int ret;
+
+	regmap_clear_bits(k1->pmu, reset_ctrl, LTSSM_EN);
+
+	k1_pcie_toggle_soft_reset(k1);
+
+	ret = k1_pcie_enable_resources(k1);
+	if (ret)
+		return ret;
+
+	regmap_set_bits(k1->pmu, reset_ctrl, PCIE_AUX_PWR_DET);
+	regmap_clear_bits(k1->pmu, reset_ctrl, APP_HOLD_PHY_RST);
+
+	ret = k3_pcie_enable_phy(k1);
+	if (ret)
+		return ret;
+
+	/* K3: Set IGNORE_PERSTN and drive PERSTN_OE high (assert reset) */
+	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
+			PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE | PCIE_PERSTN_OUT);
+	usleep_range(1000, 2000);
+	regmap_clear_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC, PCIE_PERSTN_OUT);
+
+	mdelay(PCIE_T_PVPERL_MS);
+
+	/*
+	 * Put the controller in root complex mode, and indicate that
+	 * Vaux (3.3v) is present.
+	 */
+	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
+			PCIE_PERSTN_OUT | PCIE_PERSTN_OE);
+
+	val = dw_pcie_readl_dbi(pci, GEN3_EQ_CONTROL_OFF);
+	val &= ~(0xffff << 8);
+	val |= ((0x1 << 4) << 8);
+	dw_pcie_writel_dbi(pci, GEN3_EQ_CONTROL_OFF, val);
+
+	/* Set the PCI vendor and device ID */
+	dw_pcie_dbi_ro_wr_en(pci);
+	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
+	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, PCI_DEVICE_ID_SPACEMIT_K3);
+	dw_pcie_dbi_ro_wr_dis(pci);
+
+	/* Finally, as a workaround, disable ASPM L1 */
+	k1_pcie_disable_aspm_l1(k1);
+
+	return 0;
+}
+
+static int k3_pcie_msi_host_init(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	u32 val;
+
+	dw_pcie_dbi_ro_wr_en(pci);
+
+	val = dw_pcie_readl_dbi(pci, COHERENCY_CONTROL_3_OFF);
+	val |= (0xf << 11);
+	dw_pcie_writel_dbi(pci, COHERENCY_CONTROL_3_OFF, val);
+
+	dw_pcie_dbi_ro_wr_dis(pci);
+
+	return 0;
+}
+
+static const struct dw_pcie_host_ops k3_pcie_host_ops = {
+	.init		= k3_pcie_init,
+	.deinit		= k1_pcie_deinit,
+	.msi_init	= k3_pcie_msi_host_init,
+};
+
+static int k3_pcie_start_link(struct dw_pcie *pci)
+{
+	struct k1_pcie *k1 = to_k1_pcie(pci);
+	u32 val;
+
+	k1_pcie_start_link(pci);
+
+	/* Enable INTx */
+	val = readl_relaxed(k1->link + K3_PHY_AHB_IRQENABLE_SET_INTX);
+	val |= LEG_EP_INTERRUPTS;
+	writel_relaxed(val, k1->link + K3_PHY_AHB_IRQENABLE_SET_INTX);
+
+	/* Enable MSI/MSIX specific to K3 */
+	val = readl_relaxed(k1->link + K3_ADDR_INTR_ENABLE1);
+	val |= (MSI_INT | MSIX_INT);
+	writel_relaxed(val, k1->link + K3_ADDR_INTR_ENABLE1);
+
+	return 0;
+}
+
+static const struct dw_pcie_ops k3_pcie_ops = {
+	.link_up	= k1_pcie_link_up,
+	.start_link	= k3_pcie_start_link,
+	.stop_link	= k1_pcie_stop_link,
+};
+
+static void k3_pcie_clear_irq_status(struct k1_pcie *k1,
+				     u32 *status0, u32 *status1, u32 *status2)
+{
+	*status0 = readl_relaxed(k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
+	*status1 = readl_relaxed(k1->link + INTR_STATUS);
+	*status2 = readl_relaxed(k1->link + K3_ADDR_INTR_STATUS1);
+
+	writel_relaxed(*status0, k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
+	writel_relaxed(*status1, k1->link + INTR_STATUS);
+	writel_relaxed(*status2, k1->link + K3_ADDR_INTR_STATUS1);
+}
+
+static int k3_pcie_parse_port(struct k1_pcie *k1)
+{
+	struct device *dev = k1->pci.dev;
+	u32 status0, status1, status2;
+	int i;
+
+	k1->phy = devm_kmalloc_array(dev, sizeof(*k1->phy),
+				     K3_MAX_PHY_NUMBER, GFP_KERNEL);
+	if (IS_ERR(k1->phy))
+		return PTR_ERR(k1->phy);
+
+	for (i = 0; i < K3_MAX_PHY_NUMBER; i++) {
+		k1->phy[i] = devm_of_phy_get_by_index(dev, dev->of_node, i);
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
+	k3_pcie_clear_irq_status(k1, &status0, &status1, &status2);
+
+	return 0;
+}
+
+static irqreturn_t k3_pcie_irq_thread(int irq, void *data)
+{
+	struct k1_pcie *k1 = data;
+	struct dw_pcie_rp *pp = &k1->pci.pp;
+	struct device *dev = k1->pci.dev;
+	u32 status0, status1, status2;
+
+	k3_pcie_clear_irq_status(k1, &status0, &status1, &status2);
+
+	writel_relaxed(status0, k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
+	writel_relaxed(status1, k1->link + INTR_STATUS);
+	writel_relaxed(status2, k1->link + K3_ADDR_INTR_STATUS1);
+
+	if (FIELD_GET(RDLH_LINK_UP_INT, status1)) {
+		msleep(PCIE_RESET_CONFIG_WAIT_MS);
+		/* Rescan the bus to enumerate endpoint devices */
+		pci_lock_rescan_remove();
+		pci_rescan_bus(pp->bridge->bus);
+		pci_unlock_rescan_remove();
+	} else if (!status0 && !status1 && !status2)
+		dev_WARN_ONCE(dev, true,
+			      "Received unknown event. status0=0x%08x status1=0x%08x status2=0x%08x\n",
+			      status0, status1, status2);
+
+	return IRQ_HANDLED;
+}
+
+static int k3_pcie_post_init(struct k1_pcie *k1)
+{
+	struct device *dev = k1->pci.dev;
+	struct platform_device *pdev = to_platform_device(dev);
+	int irq;
+
+	irq = platform_get_irq_byname_optional(pdev, "app");
+	if (irq > 0) {
+		return devm_request_threaded_irq(dev, irq, NULL,
+						 k3_pcie_irq_thread,
+						 IRQF_ONESHOT, NULL, k1);
+	}
+
+	return 0;
+}
+
 static int k1_pcie_parse_port(struct k1_pcie *k1)
 {
 	struct device *dev = k1->pci.dev;
@@ -373,8 +603,16 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
 	.parse_port	= k1_pcie_parse_port,
 };
 
+static const struct k1_pcie_device_data k3_pcie_device_data = {
+	.host_ops	= &k3_pcie_host_ops,
+	.ops		= &k3_pcie_ops,
+	.parse_port	= k3_pcie_parse_port,
+	.post_init	= k3_pcie_post_init,
+};
+
 static const struct of_device_id k1_pcie_of_match_table[] = {
 	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data},
+	{ .compatible = "spacemit,k3-pcie", .data = &k3_pcie_device_data},
 	{ }
 };
 
-- 
2.54.0

