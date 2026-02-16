Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E421932572A;
	Mon, 16 Feb 2026 15:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771255643; cv=none; b=hBdWfiGKRpnfdItQZy5BXk+VW0oQxtl4EKHwvh3juAlVyp513a9VSBl5lQOD//5agLL6YJGmfH27M2npRjXTb/YiecXp29e+DiGEzBv9uVyY7RHOo9TMUHdeaGg8L9C/kalkOm6d1G0BTCS4Re0XW4qC9j43DMuI92Gc2MxQcx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771255643; c=relaxed/simple;
	bh=X/o7kKrycyJfueFLIcDFGwo8oG/j/XDcQ+Ni+9bU7j0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FV3Di4/J5vDnFLEwD8I5/oBJKsNQKh+Nndh521LABDCAse8mcvleUn3c+Lfb7g27hlIfldEsDjp+9z+lF76qkzQdfy0uPwVDHxXrSKt5a39uMoJv01+hl24vlSMoiQ+jiVLM9wztC5qzamJVfFSfjpHdkTOBozKzNmQXomJF7bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SnetH2sU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SnetH2sU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B71DC116C6;
	Mon, 16 Feb 2026 15:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771255642;
	bh=X/o7kKrycyJfueFLIcDFGwo8oG/j/XDcQ+Ni+9bU7j0=;
	h=From:To:Cc:Subject:Date:From;
	b=SnetH2sUG0YxWO7tIfyYOK82VUo2EX0zdjXSSTQwAaX0E08C2sIH7RXfkkN9RIiZU
	 rnX972LJIZ1/7iixrUEiL9mve+TtmxHoMDps6OfNwchcThfT5Wg0jydb/lAuDD527s
	 C75k0qbBB6sVH4eH1e6e9OPnygAGybOLumrzk8PzGJs+zepcsqXrauAxKvSGpf4qoA
	 R7S6CV46E5opJv9L+WA2xNTuIwifHHxl1BIV1P1822wnqrBtunnUIv4RE0sb9VzTbm
	 FdP2oFEJ0XCy+hL61mXuwKZjvIilCtnufx5CDeNszAgFEQztD04ulJSMvbs7cGNp29
	 uyEB/eUygtuGw==
From: Yixun Lan <dlan@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Ze Huang <huang.ze@linux.dev>
Cc: Yixun Lan <dlan@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Junzhong Pan <panjunzhong@linux.spacemit.com>,
	spacemit@lists.linux.dev,
	linux-phy@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] phy: k1-usb: add disconnect function support
Date: Mon, 16 Feb 2026 23:26:53 +0800
Message-ID: <20260216152653.25244-1-dlan@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A disconnect status BIT of USB2 PHY need to be cleared, otherwise
it will fail to work properly during next connection when devices
connect to roothub directly.

Fixes: fe4bc1a08638 ("phy: spacemit: support K1 USB2.0 PHY controller")
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Ze Huang <huang.ze@linux.dev>
Cc: Vladimir Oltean <olteanv@gmail.com>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>
Cc: spacemit@lists.linux.dev
Cc: linux-phy@lists.infradead.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

Change in v3:
 - split from v2 as bug fix
 - fix alignment to open parenthesis
 - http://lore.kernel.org/r/20260216090112.n5jjpui3luqsybb5@skbuf
 - Link to v2: https://lore.kernel.org/r/20260214-11-k3-usb2-phy-v2-0-6ed31e031ab4@kernel.org
---
 drivers/phy/spacemit/phy-k1-usb2.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/phy/spacemit/phy-k1-usb2.c b/drivers/phy/spacemit/phy-k1-usb2.c
index 342061380012..9215d0b223b2 100644
--- a/drivers/phy/spacemit/phy-k1-usb2.c
+++ b/drivers/phy/spacemit/phy-k1-usb2.c
@@ -48,6 +48,9 @@
 #define  PHY_CLK_HSTXP_EN		BIT(3)		/* clock hstxp enable */
 #define  PHY_HSTXP_MODE			BIT(4)		/* 0: force en_txp to be 1; 1: no force */
 
+#define PHY_K1_HS_HOST_DISC		0x40
+#define  PHY_K1_HS_HOST_DISC_CLR		BIT(0)
+
 #define PHY_PLL_DIV_CFG			0x98
 #define  PHY_FDIV_FRACT_8_15		GENMASK(7, 0)
 #define  PHY_FDIV_FRACT_16_19		GENMASK(11, 8)
@@ -142,9 +145,20 @@ static int spacemit_usb2phy_exit(struct phy *phy)
 	return 0;
 }
 
+static int spacemit_usb2phy_disconnect(struct phy *phy, int port)
+{
+	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
+
+	regmap_update_bits(sphy->regmap_base, PHY_K1_HS_HOST_DISC,
+			   PHY_K1_HS_HOST_DISC_CLR, PHY_K1_HS_HOST_DISC_CLR);
+
+	return 0;
+}
+
 static const struct phy_ops spacemit_usb2phy_ops = {
 	.init = spacemit_usb2phy_init,
 	.exit = spacemit_usb2phy_exit,
+	.disconnect = spacemit_usb2phy_disconnect,
 	.owner = THIS_MODULE,
 };
 
-- 
2.52.0

