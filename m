Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9062203710;
	Thu,  5 Mar 2026 01:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772672477; cv=none; b=YII96ASOK09zyTTMan3vzhNNZLlrmb+eY2XT5J8oINMzHZWeHBGuvIPwG2+vX6JeVSrKxc97VLSF0YoHqSfoTbd7wiIm20KSrf98fYpT7mi6lyWC0Bl8tA+puyNjsE6Z3pDSU0wLhQKVtht/7tGuUd4aYoO4zHYpNTJtagUOYWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772672477; c=relaxed/simple;
	bh=OifWCP3vKhA76Fxz0repuDACNgSR1+4dScnDDulrEWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c2huHIbOTkSUMaHU4hv6XK9nB54c4/oPYGYO8KsgzO7pd5dVHBLuEwuqolzF3ujRkierMktVgbfmWzZ3BXtj99v6N12BK9uhsKoM8leOjkfZGF6LQZXrmjecctC3OKGmkh4b33AnZUyR4DMF2Lrqgd5PoogCvKBvT6wvzuRszRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Co5AAq71; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Co5AAq71"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDFF1C4CEF7;
	Thu,  5 Mar 2026 01:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772672477;
	bh=OifWCP3vKhA76Fxz0repuDACNgSR1+4dScnDDulrEWs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Co5AAq71WtXBQ39bsUV3pnWurkEvHENiYLZkXRZD0OpRZvzfmbx6CJIqv3IG9Dh3H
	 5ZGqsQcZGPY9UpDLbUeyC4mXKmE+u1L4gLP1JtnGLuvLCriJCx0P3jZYo+Nhpv5P9t
	 Rp9DewiDAYEKKHKCiTp3un5S6OyRFkEPjByzwMILbvRx6GD+gCdntQMq/HL2ShuhXH
	 TJn70oEefhez+RiaiMjgyUajLC0mVaG35eqSegA2LpH2JBH1W1MCIuwP9ri97H2ZJi
	 Enq9CAjjjcxvAIl0oPr/+mk39+StyWq7pfRy4qJs7x10KIBL2adrmAA+2pnVIvT7y4
	 BI3yg7eU/eQ1w==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 05 Mar 2026 01:00:52 +0000
Subject: [PATCH v4 2/2] phy: k1-usb: k3: add USB2 PHY support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-11-k3-usb2-phy-v4-2-15554fb933bc@kernel.org>
References: <20260305-11-k3-usb2-phy-v4-0-15554fb933bc@kernel.org>
In-Reply-To: <20260305-11-k3-usb2-phy-v4-0-15554fb933bc@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>, 
 Yao Zi <me@ziyao.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3549; i=dlan@kernel.org;
 h=from:subject:message-id; bh=OifWCP3vKhA76Fxz0repuDACNgSR1+4dScnDDulrEWs=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpqNXQ52oxOWLTT0KQ3j/qZu7FHDVIWtIXTea/3
 450zd6HzEWJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaajV0BsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3t9w/9H0QtQhU6nZ1JAXa70DL+bIwvjt1cZZ605FMaIVCwQICVj2kohBDwn
 4EYFUlsp9Kp5K7Q8KUdXgibW578McfczTbYzShSejl+b1rXCQTMOC63MZEyAkev2yGfY5XBGxnf
 fXTKB7nVK/TiWP45/O56a75ZjFd2X5Ljsrh1OSFggOYXQm1SCSIh7WBFWDpqfnKsimoYXBc71Az
 nHfo9dGns0yKtW835cEQbjfvK106g4UzahC6sOZFc7wfL5JFuLazDZaCtaldpO2Hl4d/5dt3ixa
 fxWqeo+1eu3V4MF4Ol5WyL1y5kZJAGHou937A+b1o3URRqPgxjpr7yFK9l9HxtT9rF3ObNrJknK
 D3W8cCxRr8e/GtBaRQMk0w9W5zEiyaFs3X+5FPo67j8EpFQgHvIxD9AeQSG/8JwF+VqCA4Hs9aX
 i9EeQ5OF1zFMKfWEc1jytfwJSNUIAmyCirfmpqGaGimUXhNJ7QtWKHEDwRgXBbc2FY0KIgjf4zS
 2OImc1ZmALKLVKc15i+CWdef6Zz1G5HMfy/zMrsv6ID+30yo9aXY20mDEW2ComxH8NuPxzFdeCa
 fLBztPkLT/97KsN6kUXT2OwV6ShKGXjB6zsIg1RWLcGvOfp0by1szH0P+QAKnhLJioy0ztOj1uQ
 wGym+6VWGgwN0p/37QqVA0MuLM+pLs=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Add USB2 PHY support for SpacemiT K3 SoC.

Register layout of handling USB disconnect operation has been changed,
So introducing a platform data to distinguish the different SoCs.

Reviewed-by: Yao Zi <me@ziyao.cc>
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/phy/spacemit/phy-k1-usb2.c | 34 +++++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/spacemit/phy-k1-usb2.c b/drivers/phy/spacemit/phy-k1-usb2.c
index 9215d0b223b2..87b943d9111f 100644
--- a/drivers/phy/spacemit/phy-k1-usb2.c
+++ b/drivers/phy/spacemit/phy-k1-usb2.c
@@ -51,6 +51,9 @@
 #define PHY_K1_HS_HOST_DISC		0x40
 #define  PHY_K1_HS_HOST_DISC_CLR		BIT(0)
 
+#define PHY_K3_HS_HOST_DISC		0x20
+#define  PHY_K3_HS_HOST_DISC_CLR		BIT(8)
+
 #define PHY_PLL_DIV_CFG			0x98
 #define  PHY_FDIV_FRACT_8_15		GENMASK(7, 0)
 #define  PHY_FDIV_FRACT_16_19		GENMASK(11, 8)
@@ -145,7 +148,7 @@ static int spacemit_usb2phy_exit(struct phy *phy)
 	return 0;
 }
 
-static int spacemit_usb2phy_disconnect(struct phy *phy, int port)
+static int spacemit_k1_usb2phy_disconnect(struct phy *phy, int port)
 {
 	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
 
@@ -155,10 +158,27 @@ static int spacemit_usb2phy_disconnect(struct phy *phy, int port)
 	return 0;
 }
 
-static const struct phy_ops spacemit_usb2phy_ops = {
+static int spacemit_k3_usb2phy_disconnect(struct phy *phy, int port)
+{
+	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
+
+	regmap_update_bits(sphy->regmap_base, PHY_K3_HS_HOST_DISC,
+			   PHY_K3_HS_HOST_DISC_CLR, PHY_K3_HS_HOST_DISC_CLR);
+
+	return 0;
+}
+
+static const struct phy_ops spacemit_k1_usb2phy_ops = {
 	.init = spacemit_usb2phy_init,
 	.exit = spacemit_usb2phy_exit,
-	.disconnect = spacemit_usb2phy_disconnect,
+	.disconnect = spacemit_k1_usb2phy_disconnect,
+	.owner = THIS_MODULE,
+};
+
+static const struct phy_ops spacemit_k3_usb2phy_ops = {
+	.init = spacemit_usb2phy_init,
+	.exit = spacemit_usb2phy_exit,
+	.disconnect = spacemit_k3_usb2phy_disconnect,
 	.owner = THIS_MODULE,
 };
 
@@ -167,12 +187,15 @@ static int spacemit_usb2phy_probe(struct platform_device *pdev)
 	struct phy_provider *phy_provider;
 	struct device *dev = &pdev->dev;
 	struct spacemit_usb2phy *sphy;
+	const struct phy_ops *ops;
 	void __iomem *base;
 
 	sphy = devm_kzalloc(dev, sizeof(*sphy), GFP_KERNEL);
 	if (!sphy)
 		return -ENOMEM;
 
+	ops = device_get_match_data(dev);
+
 	sphy->clk = devm_clk_get_prepared(&pdev->dev, NULL);
 	if (IS_ERR(sphy->clk))
 		return dev_err_probe(dev, PTR_ERR(sphy->clk), "Failed to get clock\n");
@@ -185,7 +208,7 @@ static int spacemit_usb2phy_probe(struct platform_device *pdev)
 	if (IS_ERR(sphy->regmap_base))
 		return dev_err_probe(dev, PTR_ERR(sphy->regmap_base), "Failed to init regmap\n");
 
-	sphy->phy = devm_phy_create(dev, NULL, &spacemit_usb2phy_ops);
+	sphy->phy = devm_phy_create(dev, NULL, ops);
 	if (IS_ERR(sphy->phy))
 		return dev_err_probe(dev, PTR_ERR(sphy->phy), "Failed to create phy\n");
 
@@ -196,7 +219,8 @@ static int spacemit_usb2phy_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id spacemit_usb2phy_dt_match[] = {
-	{ .compatible = "spacemit,k1-usb2-phy", },
+	{ .compatible = "spacemit,k1-usb2-phy", .data = &spacemit_k1_usb2phy_ops },
+	{ .compatible = "spacemit,k3-usb2-phy", .data = &spacemit_k3_usb2phy_ops },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, spacemit_usb2phy_dt_match);

-- 
2.53.0

