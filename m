Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFBF478842
	for <spacemit@lists.linux.dev>; Tue, 29 Sep 2026 08:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671092; cv=none; b=gcsX48eDcJLO9dSV9Ofi2GplNneEtMJVd4oi/gsTaIOvh0O8rQZKbr4tOc/qmx7yS2DVskrkWubLItZQv8dkohukmwTXKQVVKDlskD+EJF6w5xh+nDIi5SLjVNYctAvq90MfdAWOUo7HyikhHju7x5VgZBnFvDJaK93T7JIE+Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671092; c=relaxed/simple;
	bh=tzjrnSGriiNsUvWgycospNy4s2NeOSuRgB+TBE7F6QQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NL4lEvpmh+MC8bbZ+fgulwLvDvG7vY4VZxTyJRaLXOy6VKr1k6QDjthfQCuvGJmiOWR4laew6s393BUPC715gnJrv8CIGc/RAm8YXlgbZJABPQS43bkHAMSsBBp4C9AQMvcbFXf8Wz1Wj5R4rDHdzxymJrjugTc/zDoCdW9oZx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dp4y3yQs; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dp4y3yQs"
Received: by mail-pz2-f38.google.com with SMTP id 41be03b00d2f7-cc79a5bdf9fso518228a12.1
        for <spacemit@lists.linux.dev>; Tue, 29 Sep 2026 01:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790671090; x=1791275890; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hb0/W1AZf3MAAAZ7FNUC0CLHYr19qqSE//LGC9bNTDk=;
        b=dp4y3yQsidx82RnwQ7ndcz7CHPKKEBLJY71aKiKYkPZ9ivIJGeBzIMjfnFvAqR8vZN
         TQx40c8A1FirUhQqNiHYLcOEkom9E7FgW8o9tOoA+dctFIMWITSms/Jd/XQ4yUYwCIH9
         2vXabzOXpTJuUY6ZTk2W3N/kmbZ+Nf971lKn63BHLoC+DjU7iHXoFeSwun6exbgcQ8yX
         8DDhjVT5gA5P8lA7f+22T/Fw6CCZKKuQH/Jb3ej912Z+A5bcl/CSPXdOWnAr/w0y5EP3
         b5jFrtVeQs/KP8T/lYZBIe+4fE2LUk9lAMFHuZLwMbS7fBKNr2pavhNNFRup9B7UoT1Y
         JdtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790671090; x=1791275890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hb0/W1AZf3MAAAZ7FNUC0CLHYr19qqSE//LGC9bNTDk=;
        b=2JNpp1dO0z1GnUIAnayptDTsD6Tquysz3b/tg2CGOoFKGwMnTimIQAV9ZWrr/aIgQD
         C3QEJ378igtxvqenIa0JScZQjqqQOhJCekbhCTLfzClF7TvBaF6ErLbUZkCPhjF4VApz
         W/R2GDab2j1V7rUW0KvnlQDUF1QMki8XhXg0azQoM4fdpdHSzttzsXXgj2/bQjRx0jIe
         LlJGtuAggdqsK9feXgHWIhRiJ7o8/rht/2DBp67Y/vn2N+qYxjxDRPKea6KQWn+8aP0t
         hl+rLmu9/FtPoZUYj39VyT6zNTyBDnvHiAwwLEKnwj2Rricp10uB2wR5vXgM4L/yt0yo
         cYsA==
X-Forwarded-Encrypted: i=1; AKwUvBxxiEbGqDXGp0T3LTdjTNhX+4bev83klcepYsSb8XlbWdGBoNiEKggTgcpH449JS0VTl5XAeQeabg==@lists.linux.dev
X-Gm-Message-State: AFq9FYLZnFg90WTMHf2zuLfpQ9c7qqSw7ALUpTZWeDTqx/pCjAdxpRUR
	B9b+gq30DguCUsL6YaUfMHctGicz+E3fV1xwuQMzpLTsuYRznKYfFF37
X-Gm-Gg: AYBFou2XkIJG7bxYOvnpTVkhvdfjuOesxkBL0dU+0ohQJNGNMKZNETfQLHwBF/FnNNk
	e2HM/CY2dGR4utAciSdh6PSu4TthuaEdXGlMBkDo/E5LwNpRYvwvnikFYx1kl2u8GOskUTLigdk
	nDLy7JMGVTyn4BMiZAj7PYTeARsBPGfcumfviu6FaJrzsiE0jdP2v+Kf8T6ROkS9PRGmGsacj60
	HFTXGEvHGhaldNtnBqqDhHD9eH+Kng1SLvip+1qGNinzb1pDhp7Y4QHwIpY7HscaQEUmLG8qA55
	JkZ9ffmxnVsK1bx73RLbH/Adnf8o93J2a7/HwLUlQRn9JsIZP3GRE3/YfzvfBXG5rvg46MwDPTF
	zTIn4w/Yk1H7eZlZmrv5Gk1jYPp+DtErZdvlUJ674Wt727lLvtKHnoqKRGs8BxOQ9EOQGzVpOb0
	cCXlyI8B60s4Z9Bw3sNNB7v/JDFW4qcqCvEEaZU2N+uFxzVlkkCPxb+Uu3BQR0iD5Y2Kpn
X-Received: by 2002:a17:90b:538c:b0:395:8124:ac53 with SMTP id 98e67ed59e1d1-3a49c0b06cbmr995624a91.6.1790671090167;
        Tue, 29 Sep 2026 01:38:10 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498c4b665sm1745414a91.2.2026.09.29.01.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:38:09 -0700 (PDT)
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
Subject: [PATCH v7 1/6] PCI: spacemit-k1: Add device data support
Date: Tue, 29 Sep 2026 16:37:47 +0800
Message-ID: <20260929083755.458238-2-inochiama@gmail.com>
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

To reuse the K1 PCIe driver logic for K3 PCIe controller, add device
data to handle the K1 specific logic and make room for the incoming
logic for K3.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 30 ++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 0564c46e2f48..ab2953ad8f56 100644
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
+		return -ENODATA;
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

