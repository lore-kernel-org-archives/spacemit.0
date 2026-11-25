Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795580137;
	b=upr583AcEUqzCMvfthj87910BLA/MmlppiKV21MEzEE1OmP9eGAL6VNslqLz8B6brjbo
	 WrejlKP99ownsrWdX/9kV5czSaReDMzBkXWJF6FACUxaI9OhSomY6plbcEPyf4NQwwSB3
	 ST4FPnh5bi8xZr0sQIg18UVVouWXUKU2QLDphxF24tjnq8w88gNZHxVw+39c73fGt/I3X
	 7Mf18iJNEt0ZoN4deM2hDGkfWCqet7vPwjfsZp2hTjrfGaNWEN9CoCR5UVAp6C1ZrMc5q
	 tg69DyA4i56OmuRL1CTpxu9qf3B4xsS6lRPSbnEtprizkykCXpLm3jBMNKt+sannJjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795580137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D/X9ZyEdnOXOVxwhtJ+XxsYI1vONhPEcHfkavK3jVzU=;
	b=wlPsLt3YnOI5XAvCVNPd1rMJEmMzdI2gz9ageDzmjUsUjtbKVVr2aBCdPUzJZbMd1d6x
	 V6nBEJadXCKMmFhGOo/cAxC+DZoS4qHBDv3+gj4czSZagj5i6Al+GmZFU9vWCflS267hb
	 nheaNjrrKwBEOCWKdzV3MIMOsE98j9qLoWhxId7UY0Zk1zfvO9fCcQ07Zs5yrNGj4x4sT
	 QGlYFvDTAjsHx7ZB0e12zb9y3GGWiFUjXYQ2DDFxNG3A/v3RRUdg/0cKvRfOfWqP6cd/D
	 yMrrj8ylEmTuzCFuRlPgcdcqhP8vtzclzew47ssyGF5S3+WfQyZpc9jVsmCDRZoQgsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vxWvKLKM;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1C4606A32E
	for <spacemit@lists.linux.dev>; Wed, 25 Nov 2026 04:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C1C4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vxWvKLKM
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f0464dd6b6so31714445ad.1
        for <spacemit@lists.linux.dev>; Tue, 24 Nov 2026 20:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795580136; x=1796184936; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/X9ZyEdnOXOVxwhtJ+XxsYI1vONhPEcHfkavK3jVzU=;
        b=vxWvKLKMaCzLbIsd6GbjljveoGhtnxBlJUeM2QOAD1SIyxxrB3eQ5sV0tl11BlxLcP
         pfgYeboAIlDldPBVefBhBsZeD2G1Gsx+y4iRsZ4Gzpa7zbBLjLV4dj+EaERTiDosKVWO
         80QOhggZbABqC1G1pJf9hVZ73+D855k7gpOUIIkBLMXzkhN6ojDUN/yDXdkFeQEbck+N
         w7xz35WsAmeKqTxid/hsrn07mbDOJKNje0HmujIzFxiCAjz64Q02oH8TICpnr6RRmBzk
         sSARY+4bvU8pd/7pvY+q2q5rNmTF6/paQLIlvtpaeX7E5b5cnyQHX4FFiuq2Abm2LThu
         PzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795580136; x=1796184936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D/X9ZyEdnOXOVxwhtJ+XxsYI1vONhPEcHfkavK3jVzU=;
        b=2SspstmYw5M+8Q3GRVIAGsKgYN99S/dD/vfPDzAooxWkjmuvoZIAxsYAF7BOwBTuw4
         AAlkOt3JCD91WMMpTlI/RA2MWXjmOysc3zs7ZpydguSI95EXqNDU92ov47qTd87WPMY+
         70mso4vr7hqHtssZq6QIM4IYAfKhXsBAQLlWD02bqeyAFZqF8SMB/VrT/qmLVM69X26O
         YpyofDo8h6G3klIFYS6QaC7ZSHE26Ll2kqZtWGmzruVBZVtoGK9sDf5HK/yKC0zCxags
         1tDky1nzcZaS33noHDA26MWBpLO7hnKL/wJkjHn6/SPPclz9Sl9tF9cHaBa6TPywIyuO
         uNFQ==
X-Forwarded-Encrypted: i=1; AL+hErGx4CqAXO+vBcTgHismFULsqgRMZaTJeKzrjsGd2zgpu1SDsv6ZDlqbq5a1/5WtDFocpvOx/cRzKg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+sKWes1OgP4m6JhzP77Ud1oiMEMCuc1fryFsS2SFwHT4XzHS0H
	m/8MY42l5nNO96v+mdgNDRqszKHTy5EVa+B5NzzfivDnFBEmnz1eGazT
X-Gm-Gg: AZFdTZdW3hEP/1UVxtxacfTUXsX6ZqnwyxWnb6dGiTt2jqZbAqbxMdnjLwsHGIeTsPH
	INlFXZwJUM4bcY2rXDnWCVBa0LH3zcamsHNl8c81PE20YuiD+WSiaisRHlq5w92VJ3UQ1/hsoDU
	QI9LuUf3AywVg6pbhqZmqaK6JryNGqZZfwSMz11MmwUFpIF8JtdeE0yiuYvuJ0f/OeyTSlqVcoJ
	QwRRGBR4RY7uUU0lnkRUYnqtBQY0Cz330dLP6ecVDBg5MgsHTEi63xKzTjJn7d9AGIh9hVFLo1W
	ceQ+Rg/TEyFij4cJIJbtn0i38L8GH6WSYpCVD3DJWK+5swP1lxiChEn0d6TxkPpDgJnucvbUQt/
	3wbkF1dOdZwoR66RDpwc14DQzjVuOdvksGTrYlmhRDtKoi2ni+K1aiyUkZ0R07lgK/Zs6JV29nt
	TBKjdQ2dvlV62TntoNISNFLbb1UqLeQ8PgXZum++YagB00fEB2LF3ieqg1sIok5fvbR5yc4WslY
	k5eE0qGGzlqx9u5oitCQDvjgMLLYt4Eily42gkYo9ziJZNuv4v7IwZkGJCSNO0CvEx7uadTVjyv
	SfnVYJZmIxidRUMTZ3ajmjfhsY96
X-Received: by 2002:a17:902:e80b:b0:2eb:1dd7:3aa4 with SMTP id d9443c01a7336-2f03f181759mr177341625ad.34.1795580136016;
        Tue, 24 Nov 2026 20:15:36 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04f8aca00sm68640555ad.38.2026.11.24.20.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:15:35 -0800 (PST)
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
Subject: [PATCH v8 1/6] PCI: spacemit-k1: Add device data support
Date: Wed, 25 Nov 2026 12:15:15 +0800
Message-ID: <20261125041523.242588-2-inochiama@gmail.com>
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

To reuse the K1 PCIe driver logic for K3 PCIe controller, add device
data to handle the K1 specific logic and make room for the incoming
logic for K3.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 30 ++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 92a71ea90ac3..658ad2fa87b2 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -48,8 +48,17 @@
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
@@ -277,14 +286,21 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
 
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
@@ -298,11 +314,11 @@ static int k1_pcie_probe(struct platform_device *pdev)
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
@@ -319,7 +335,7 @@ static int k1_pcie_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, k1);
 
-	ret = k1_pcie_parse_port(k1);
+	ret = data->parse_port(k1);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to parse root port\n");
 
@@ -337,8 +353,14 @@ static void k1_pcie_remove(struct platform_device *pdev)
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
2.56.1

