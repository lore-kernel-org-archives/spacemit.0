Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238D8475349
	for <spacemit@lists.linux.dev>; Tue, 29 Sep 2026 08:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671095; cv=none; b=KDQ/sgnVG1zH6kAurqpJR7lUB2uHs/lae7HevP82JUquAf8wOvcX/MDferwcr3OJ+QRWYhBvBbq7jGqCY4ig4CUcO97Xkka0FUpAt0L5NknZX5/GFZjMRoIkcRvQB2J9fJ7t5XSKjRfW+EQu5IEyN1LHlM/N3qUSVGQZLiy+VP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671095; c=relaxed/simple;
	bh=DwZ2kccFnk2nP9CPd+wLNtgKXGDoIz2uRStav+nEg2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j+Xpt5iHh4872QUBkmt0fYBi83jA79sBq3zxSOC1t1rrauvWxS6mxF8FB+ri8F/q07b6WyrOswh5nAHy8qYoerpC4TJMMww/qiwn2VY4s86eKgAEX2aUxfTZxJiiAGr5k2sOto/kWEVy5PXx5sTZyLySgE+Bi2y0BZi4dJmK8mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o3o0WJwL; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o3o0WJwL"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc7979d1deaso992939a12.1
        for <spacemit@lists.linux.dev>; Tue, 29 Sep 2026 01:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790671093; x=1791275893; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cWIERes12OVbNPYRqquvHTMVDdUpX3EZuxH/wCFzrNQ=;
        b=o3o0WJwLmILPLIgZ3hbBy/LFa5LSLBtsgGgi8YyMja/w552DwCu9jnDTv0jtUA/E2E
         /NmYE2u8L5zEeO792BhAehO3e//IDgkHFkrJFYVbpui2C70icBI1dJkLlzo3miQbIhef
         29cAt4zGBfuyA5vGIR42bXrwsvXJdvuXkntPo096ZqfpNQQ+YxVAEjTVV4SN37yNRVx9
         sWZdrTScSoTDf0lEq1Nj74F+ulOV0YZGqo46C9ELkjvckXCl7xX96fs3qrFhKNjguzjx
         wWTTqj2EYI8nXfTi4IqaXHjDzfOvnC/d647l1eCTErPYuH98/CwetH/zrK60sYcLUWf6
         JDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790671093; x=1791275893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cWIERes12OVbNPYRqquvHTMVDdUpX3EZuxH/wCFzrNQ=;
        b=u2B7FZWbOIWvwGr3YQMlBX44GGAiklVRvSKsYtqDvMdxTF4yFfPdEouWFKZUy31YE5
         Ilw6dnjrs8GRRjHhoM8pT5TKduZ0w0X1k4xJ6zOzAmQexV+wtbGpHKtAVF/gIU+xIyQz
         wScnpOEOqvGezIhKCpmBiIrWrhy5SByMFfgVdjN6ZzEXN9QQEaRuwITIbsvCiAnHlLKU
         cRPocwwFAE9rwnk8pIH99a80Pw4UfucKrCUVC8La5P4B+bjweBaCbzDSoEX0R9GQXIyt
         gk651XPqUZYNhB8+EX6eniktZu+CWTkZ+KHcOlxokbtJyOn56ml9KJ+aN/6OK1I1mlQA
         SGFw==
X-Forwarded-Encrypted: i=1; AKwUvBwdz95Sky+YseFpBipfVd4JMyyu/nRVI2iqkhjNOLXXN/JaohHwc5Ba1NoiQXuCMwZpH5KXwUi+zQ==@lists.linux.dev
X-Gm-Message-State: AFuF++ndcGopfW6hYfuWvAmnf61EdU7nzJct2EdVTut3J4lZtXjqdmqr
	+tSjrHnl2wz6u/k4AsYSHJl+uydn+q+xKcH7D66bOZIWrxDw6mDnoHxj
X-Gm-Gg: AYBFou3fFub1hyKarmmJO05bkH72PE5bAj4cElJ3JI1xBlXUTOHn5EKqsOA35wcZtG9
	fTqObmI/Xh8ytdXWTgkL7c6M1rMdRMYFubFOaISX4UqvLSl15+twYhhMC1Ptb62sUYBI6qXiFtH
	lUsHJ1O4CLmz6o/AjA4jECaJ4WKAHrowpgWS5xsPbSJpIux/T0aOD8Dgb26hlRClJmvcjaJsGNp
	g3ql5EOYljKfU1n2cBoEM8Zu99W/Vhx5SDt67HAaxHITtcoKOAD+ap1VJo/k6rUCpym1Tqz2t9m
	/KCxBBNGqkh8t1VRjB1WDR1kXbmx4fYjrl5sgXxKLGyvyH8AcB9qXLd2JhmlMeB/niLYGMHpje/
	GjGmkpgfkGZaGAWb5izN+6NUFq1ABZSwt7yT/p2igJQz1BBwxS4eBSXz1FZIU4ueEXKYYVbKoma
	jHn3oNteOn+Heestw1jVaYfENYyIznboZdnuYcfAHxeWpc2Ox5Ucq0oxzi+7u1oQ/CMgr5
X-Received: by 2002:a05:6a21:9082:b0:3de:4ff3:6b10 with SMTP id adf61e73a8af0-3de4ff36c9amr7089255637.70.1790671093419;
        Tue, 29 Sep 2026 01:38:13 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885defd9e9dsm432299b3a.6.2026.09.29.01.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:38:12 -0700 (PDT)
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
	Arnd Bergmann <arnd@arndb.de>,
	Niklas Cassel <cassel@kernel.org>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Randolph Lin <randolph@andestech.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v7 2/6] PCI: spacemit-k1: Add multiple PHY handles support
Date: Tue, 29 Sep 2026 16:37:48 +0800
Message-ID: <20260929083755.458238-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929083755.458238-1-inochiama@gmail.com>
References: <20260929083755.458238-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCIe controller on Spacemit K3 may use multiple PHYs at the
same time. The feature is not supported by the current driver.
So extend the PHY definition to support multiple PHY handles.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 57 ++++++++++++++-----
 1 file changed, 42 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index ab2953ad8f56..8c4f0b09fe24 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -51,12 +51,14 @@ struct k1_pcie_device_data {
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
@@ -115,6 +117,25 @@ static void k1_pcie_disable_resources(struct k1_pcie *k1)
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
@@ -170,12 +191,13 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
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
@@ -184,6 +206,14 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
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
@@ -195,7 +225,8 @@ static void k1_pcie_deinit(struct dw_pcie_rp *pp)
 	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
 			PCIE_RC_PERST);
 
-	phy_exit(k1->phy);
+	phy_bulk_power_off(k1->phy_count, k1->phys);
+	phy_bulk_exit(k1->phy_count, k1->phys);
 
 	k1_pcie_disable_resources(k1);
 }
@@ -262,23 +293,18 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
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
@@ -354,6 +380,7 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
 	.host_ops	= &k1_pcie_host_ops,
 	.ops		= &k1_pcie_ops,
 	.parse_port	= k1_pcie_parse_port,
+	.max_phy_count	= 1,
 };
 
 static const struct of_device_id k1_pcie_of_match_table[] = {
-- 
2.55.0

