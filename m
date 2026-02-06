Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFB9364EA5
	for <spacemit@lists.linux.dev>; Fri,  6 Feb 2026 10:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770372329; cv=none; b=nu9gvz6QIopJnH3QmMcmS6reV491AmMLTFgb/yBtDkFSeZksaqMCfzJRkd4peTql1sI3WxA3CfvgPW36kEi3/jfuwUds7ulkq8Lq/cjxDh2AQ/2TMlQwn7gD7NeHixldboxH95cPZLWSCizEBgQaablDaoCFApwgwnNsHo0SMH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770372329; c=relaxed/simple;
	bh=dJAxpl3GBsiydeEGO9/m30YuzowqppMcArSktU9KvF0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VyZD6NJ8tu4+lAghL8bzs7XGZnWNQR3s20eJ/FfnG8Tzdd3pAdM8wMpLSNZ64TH8HxJWXOiicvAIAr5zpFL+RdH/W4YLQ+6xZlDsNwKr30VTx5aun+pYRKhLkdKQe+iMOhBqVV3szv9c03/toX5PXEn1H1Twk7WMiAGny6s0/mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [58.61.141.99])
	by smtp.qiye.163.com (Hmail) with ESMTP id 335ee35ab;
	Fri, 6 Feb 2026 18:05:20 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Yixun Lan <dlan@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Ze Huang <huang.ze@linux.dev>
Cc: Rob Herring <robh@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Mark Brown <broonie@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-riscv@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: [PATCH 2/2] phy: spacemit: add regulator support to K1 USB2 PHY
Date: Fri,  6 Feb 2026 18:00:09 +0800
Message-Id: <20260206100009.873182-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260206100009.873182-1-amadeus@jmu.edu.cn>
References: <20260206100009.873182-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c3269cc2d03a2kunmb90599ad38e393
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGhkaVkodGE0fTh1OGB1PSVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VNSlVKT0pVQkJZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVUpCS0
	tZBg++

USB VBUS may have a regulator supply. Add optional phy-supply
support to avoid the need for the regulator to be always-on.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 drivers/phy/spacemit/phy-k1-usb2.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/phy/spacemit/phy-k1-usb2.c b/drivers/phy/spacemit/phy-k1-usb2.c
index 342061380012..c163a29dabf9 100644
--- a/drivers/phy/spacemit/phy-k1-usb2.c
+++ b/drivers/phy/spacemit/phy-k1-usb2.c
@@ -75,6 +75,7 @@ struct spacemit_usb2phy {
 	struct phy *phy;
 	struct clk *clk;
 	struct regmap *regmap_base;
+	struct regulator *regulator;
 };
 
 static const struct regmap_config phy_regmap_config = {
@@ -98,6 +99,12 @@ static int spacemit_usb2phy_init(struct phy *phy)
 		return ret;
 	}
 
+	if (sphy->regulator) {
+		ret = regulator_enable(sphy->regulator);
+		if (ret)
+			return ret;
+	}
+
 	/*
 	 * make sure the usb controller is not under reset process before
 	 * any configuration
@@ -139,6 +146,9 @@ static int spacemit_usb2phy_exit(struct phy *phy)
 
 	clk_disable(sphy->clk);
 
+	if (sphy->regulator)
+		return regulator_disable(sphy->regulator);
+
 	return 0;
 }
 
@@ -171,6 +181,16 @@ static int spacemit_usb2phy_probe(struct platform_device *pdev)
 	if (IS_ERR(sphy->regmap_base))
 		return dev_err_probe(dev, PTR_ERR(sphy->regmap_base), "Failed to init regmap\n");
 
+	sphy->regulator = devm_regulator_get_optional(dev, "phy");
+	if (IS_ERR(sphy->regulator)) {
+		int ret = PTR_ERR(sphy->regulator);
+
+		if (ret != -ENODEV)
+			return dev_err_probe(dev, ret, "Failed to get regulator\n");
+
+		sphy->regulator = NULL;
+	}
+
 	sphy->phy = devm_phy_create(dev, NULL, &spacemit_usb2phy_ops);
 	if (IS_ERR(sphy->phy))
 		return dev_err_probe(dev, PTR_ERR(sphy->phy), "Failed to create phy\n");
-- 
2.34.1

