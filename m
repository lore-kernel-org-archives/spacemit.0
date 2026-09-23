Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8322C38838B
	for <spacemit@lists.linux.dev>; Wed, 23 Sep 2026 09:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156109; cv=none; b=WGWtDcpT6jUUNczRAEhffeZN8yyhQjJ1bU4Y6WlER09pNmKTiSu5ML3Vldl4xnoMp4GtcN7bAR/BtQMnzNmLICOaGxjKqsRHIjlBuxqAoEQUtVBqQbHQS+iTcS/Q+WzXrersGnEPYp6+pxfh0UqOZIIGrWwE9+RF8gO1LbN1dC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156109; c=relaxed/simple;
	bh=JP7DEjP7awEWWLjW9vIGisEhSJhFiA0Totop8y8QqeQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T4Q9e5JwXZKdmpZkuN5gvsg6DGkZP5q7vPQ+9Kd5bUtjMaFooopikX0/0i3TJduxpBxtN/OaCEWa1NGE2MKH+wZdu4koQEPUDfspCUIRYYKDGWGAGMEGEuFd8Mrg9rS3xMmi+xncFdE3+it9+d/Fk9lRegVINWr3M/kLxcrQy54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A+/oJHva; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A+/oJHva"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77141F00893;
	Wed, 23 Sep 2026 09:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790156108;
	bh=7x35Ic33Aq4gkFACjIzfADU9VYTPmYUU9RwTTXMZvEQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=A+/oJHvaoA3JSLQ+9jvY2PnrMhQI2wAa2MY+iZw8v8UTOBjolqJlkiyaLhTee1CWW
	 zmS2zxIe0VOQ7uO6uC7AhHWKyZbqofmQ0fROrT+uinl7O8BSFYBmlPj3p5+CLJeA+8
	 hhMTxDAzSwqgkPJoEJwxSF06fF0WmqgfdyT440B79xkKgDrw4U2QJAljDxZ9DcZ+8w
	 +UIKbhr8Ab3PD8miSTvcDJfpByTWgzEPZer0u55f88qrMiZngZ7BnsDBy4vVlrMAGN
	 xOW4px7AjoaNqmvHWSCNYmDAYpd97fhA1yjpYIpPxW5B31+XFPo6GMJj5B51/ievIj
	 8GJXCHe82aF4g==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 23 Sep 2026 09:34:26 +0000
Subject: [PATCH v2 3/8] clk: spacemit: ccu_pll: add plla type clock
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-01-k3-clock-reset-support-v2-3-6ec0abb1c7b5@kernel.org>
References: <20260923-01-k3-clock-reset-support-v2-0-6ec0abb1c7b5@kernel.org>
In-Reply-To: <20260923-01-k3-clock-reset-support-v2-0-6ec0abb1c7b5@kernel.org>
To: u-boot@lists.u-boot-project.org
Cc: spacemit@lists.linux.dev, u-boot-spacemit@groups.io, 
 Lukasz Majewski <lukma@denx.de>, Tom Rini <trini@konsulko.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, 
 Raymond Mao <raymond.mao@riscstar.com>, 
 Guodong Xu <guodong.xu@oss.qualcomm.com>, Peng Fan <peng.fan@nxp.com>, 
 Torsten Duwe <duwe@suse.de>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Alexey Charkov <alchark@flipper.net>, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7457; i=dlan@kernel.org;
 h=from:subject:message-id; bh=JP7DEjP7awEWWLjW9vIGisEhSJhFiA0Totop8y8QqeQ=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqs50thcHCTqfg2LvtjAXCIGeUo2g35vmsHqOLq
 Y9VasnkLLOJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCarOdLRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3mSRAAnpNtz8VW8NGgQM2jvu8xdfCj7C36dSJfECasSpdkd85NQWhj7IFov
 9TZFL1+Tf2S6M4hdVPRgIVWjqesw0zsmidwRCDCaQOgnbIqFOACrAhkXVTAi8jjzBCK3OBoZ6e2
 iISdVm02fXLEw0Hkf+Gy/RCHQe4SSe4AZJdVLxwVcUFSvkebRq3XY8Kgxt4y2As1/gQIPttrDFW
 p+rG/oF/rQuxQwCNTA3ubJGhkOmPeCIdxsDluhiZg8DQs9wvXqEZfOhV9oJ8ug4qUfiJICp9huw
 /tmBI9blB5Tmy4TUw3kHvqeIybUIpi3UowAa5DwLE9CdGuunMFxbggQrQPTOHJS5kXs4z1r8Ark
 vBg0M/IQKpuzq4MW9J3BtzDyBhTyK3G9mVXOLhLji1biT9g39orZNj9S/rohDclDigP+U72h/RF
 byhSfaa4I1W5rD8/CcWGyR2XladaqDcx2LlOm95NK1TeN2yL0DSB+GnwUkl2xUXG7x68nqvRgoh
 1csJWZb7Fbs7ti4ALsx9P2463pc9KXeRt4o8xSvitPyiYNdFiDgS1fUyYgWVjem2NxUpqagF/Il
 mvkKGtjcJBpXMZCCb5mwP6wNsQWNYPMkMY5wMM2AtypxMRNyQUpHamTN1oB6YF40GSCxajW4oJv
 JLDMxnRoEJU//D4c39y6Rv5O8yYXgw=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Based on upstream Linux:
  3a086236c600 ("clk: spacemit: ccu_pll: add plla type clock")

Introduce a new clock PLLA for SpacemiT's K3 SoC which has a different
register layout comparing to previous PPL type. And, It is configured
by swcr1, swcr3 and swcr2 BIT[15:8].

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/clk/spacemit/clk_common.h |   1 +
 drivers/clk/spacemit/clk_pll.c    | 124 +++++++++++++++++++++++++++++++++++++-
 drivers/clk/spacemit/clk_pll.h    |  43 +++++++++++--
 3 files changed, 163 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/spacemit/clk_common.h b/drivers/clk/spacemit/clk_common.h
index ea5ebf57784..60702414f2b 100644
--- a/drivers/clk/spacemit/clk_common.h
+++ b/drivers/clk/spacemit/clk_common.h
@@ -36,6 +36,7 @@ struct ccu_common {
 		/* For PLL */
 		struct {
 			u32 reg_swcr1;
+			u32 reg_swcr2;
 			u32 reg_swcr3;
 		};
 	};
diff --git a/drivers/clk/spacemit/clk_pll.c b/drivers/clk/spacemit/clk_pll.c
index 56da70af58a..36de37c3a25 100644
--- a/drivers/clk/spacemit/clk_pll.c
+++ b/drivers/clk/spacemit/clk_pll.c
@@ -13,7 +13,8 @@
 
 #include "clk_pll.h"
 
-#define UBOOT_DM_SPACEMIT_CLK_PLL "spacemit_clk_pll"
+#define UBOOT_DM_SPACEMIT_CLK_PLL	"spacemit_clk_pll"
+#define UBOOT_DM_SPACEMIT_CLK_PLLA	"spacemit_clk_plla"
 
 #define PLL_TIMEOUT_US		3000
 #define PLL_DELAY_US		5
@@ -21,6 +22,9 @@
 #define PLL_SWCR3_EN		((u32)BIT(31))
 #define PLL_SWCR3_MASK		GENMASK(30, 0)
 
+#define PLLA_SWCR2_EN		((u32)BIT(16))
+#define PLLA_SWCR2_MASK		GENMASK(15, 8)
+
 static const struct ccu_pll_rate_tbl *ccu_pll_lookup_best_rate(struct ccu_pll *pll,
 							       unsigned long rate)
 {
@@ -155,3 +159,121 @@ U_BOOT_DRIVER(spacemit_clk_pll) = {
 	.ops	= &spacemit_clk_pll_ops,
 	.flags	= DM_FLAG_PRE_RELOC,
 };
+
+static const struct ccu_pll_rate_tbl *ccu_plla_lookup_matched_entry(struct ccu_pll *pll)
+{
+	struct ccu_pll_config *config = &pll->config;
+	const struct ccu_pll_rate_tbl *entry;
+	u32 i, swcr1, swcr2, swcr3;
+
+	swcr1 = ccu_read(&pll->common, swcr1);
+	swcr2 = ccu_read(&pll->common, swcr2);
+	swcr2 &= PLLA_SWCR2_MASK;
+	swcr3 = ccu_read(&pll->common, swcr3);
+
+	for (i = 0; i < config->tbl_num; i++) {
+		entry = &config->rate_tbl[i];
+
+		if (swcr1 == entry->swcr1 &&
+		    swcr2 == entry->swcr2 &&
+		    swcr3 == entry->swcr3)
+			return entry;
+	}
+
+	return NULL;
+}
+
+static void ccu_plla_update_param(struct ccu_pll *pll, const struct ccu_pll_rate_tbl *entry)
+{
+	struct ccu_common *common = &pll->common;
+
+	regmap_write(common->regmap, common->reg_swcr1, entry->swcr1);
+	regmap_write(common->regmap, common->reg_swcr3, entry->swcr3);
+	ccu_update(common, swcr2, PLLA_SWCR2_MASK, entry->swcr2);
+}
+
+static int ccu_plla_enable(struct clk *clk)
+{
+	struct ccu_pll *pll = clk_to_ccu_pll(clk);
+	struct ccu_common *common = &pll->common;
+	unsigned int tmp;
+
+	ccu_update(common, swcr2, PLLA_SWCR2_EN, PLLA_SWCR2_EN);
+
+	/* check lock status */
+	return regmap_read_poll_timeout(common->lock_regmap,
+					pll->config.reg_lock,
+					tmp,
+					tmp & pll->config.mask_lock,
+					PLL_DELAY_US, PLL_TIMEOUT_US);
+}
+
+static int ccu_plla_disable(struct clk *clk)
+{
+	struct ccu_common *common = clk_to_ccu_common(clk);
+
+	ccu_update(common, swcr2, PLLA_SWCR2_EN, 0);
+
+	return 0;
+}
+
+/*
+ * PLLAs must be gated before changing rate, which is ensured by
+ * flag CLK_SET_RATE_GATE.
+ */
+static unsigned long ccu_plla_set_rate(struct clk *clk, unsigned long rate)
+{
+	struct ccu_pll *pll = clk_to_ccu_pll(clk);
+	const struct ccu_pll_rate_tbl *entry;
+
+	entry = ccu_pll_lookup_best_rate(pll, rate);
+	ccu_plla_update_param(pll, entry);
+
+	return 0;
+}
+
+static unsigned long ccu_plla_recalc_rate(struct clk *clk)
+{
+	struct ccu_pll *pll = clk_to_ccu_pll(clk);
+	const struct ccu_pll_rate_tbl *entry;
+
+	entry = ccu_plla_lookup_matched_entry(pll);
+
+	WARN_ON_ONCE(!entry);
+
+	return entry ? entry->rate : 0;
+}
+
+static const struct clk_ops spacemit_clk_plla_ops = {
+	.enable = ccu_plla_enable,
+	.disable = ccu_plla_disable,
+	.set_rate = ccu_plla_set_rate,
+	.get_rate = ccu_plla_recalc_rate,
+};
+
+int spacemit_plla_init(struct ccu_common *common)
+{
+	struct clk *clk = &common->clk;
+	struct ccu_pll *pll = clk_to_ccu_pll(clk);
+	int ret;
+
+	ret = clk_register(clk, UBOOT_DM_SPACEMIT_CLK_PLLA,
+			   common->name, common->parents[0]);
+	if (ret)
+		return ret;
+
+	if (ccu_plla_lookup_matched_entry(pll))
+		return 0;
+
+	ccu_plla_disable(clk);
+	ccu_plla_update_param(pll, &pll->config.rate_tbl[0]);
+
+	return 0;
+}
+
+U_BOOT_DRIVER(spacemit_clk_plla) = {
+	.name	= UBOOT_DM_SPACEMIT_CLK_PLLA,
+	.id	= UCLASS_CLK,
+	.ops	= &spacemit_clk_plla_ops,
+	.flags	= DM_FLAG_PRE_RELOC,
+};
diff --git a/drivers/clk/spacemit/clk_pll.h b/drivers/clk/spacemit/clk_pll.h
index 3987cc1141b..0de027dc7a6 100644
--- a/drivers/clk/spacemit/clk_pll.h
+++ b/drivers/clk/spacemit/clk_pll.h
@@ -20,14 +20,28 @@
  * configuration.
  *
  * @rate:	PLL rate
- * @swcr1:	Register value of PLLX_SW1_CTRL (PLLx_SWCR1).
- * @swcr3:	Register value of the PLLx_SW3_CTRL's lowest 31 bits of
- *		PLLx_SW3_CTRL (PLLx_SWCR3). This highest bit is for enabling
- *		the PLL and not contained in this field.
+ * @swcr1:	Value of register PLLx_SW1_CTRL.
+ * @swcr2:	Value of register PLLAx_SW2_CTRL (PLLA only).
+ * @swcr3:	Value of register PLLx_SW3_CTRL.
+ *
+ * Regular PLL type
+ *  | Enable | swcr3 | PLLx_SW3_CTRL - BIT[31]    |
+ *  -----------------------------------------------
+ *  | Config | swcr1 | PLLx_SW1_CTRL - BIT[31:0]  |
+ *  |        | swcr2 | Not used                   |
+ *  |        | swcr3 | PLLx_SW3_CTRL - BIT[30:0]  |
+ *
+ * Special PLL type A
+ *  | Enable | swcr2 | PLLAx_SW2_CTRL - BIT[16]   |
+ *  -----------------------------------------------
+ *  | Config | swcr1 | PLLAx_SW1_CTRL - BIT[31:0] |
+ *  |        | swcr2 | PLLAx_SW2_CTRL - BIT[15:8] |
+ *  |        | swcr3 | PLLAx_SW3_CTRL - BIT[31:0] |
  */
 struct ccu_pll_rate_tbl {
 	unsigned long rate;
 	u32 swcr1;
+	u32 swcr2;
 	u32 swcr3;
 };
 
@@ -38,6 +52,14 @@ struct ccu_pll_rate_tbl {
 		.swcr3	= _swcr3,		\
 	}
 
+#define CCU_PLLA_RATE(_rate, _swcr1, _swcr2, _swcr3)	\
+	{						\
+		.rate	= _rate,			\
+		.swcr1	= _swcr1,			\
+		.swcr2	= _swcr2,			\
+		.swcr3	= _swcr3,			\
+	}
+
 struct ccu_pll_config {
 	const struct ccu_pll_rate_tbl *rate_tbl;
 	u32 tbl_num;
@@ -69,6 +91,18 @@ static struct ccu_pll _var = {							\
 	}									\
 }
 
+#define CCU_PLLA_DEFINE(_id, _var, _name, _parent, _table, _reg_swcr1,		\
+			_reg_swcr2, _reg_swcr3, _reg_lock, _mask_lock, _flags)	\
+static struct ccu_pll _var = {							\
+	.config	= CCU_PLL_CONFIG(_table, _reg_lock, _mask_lock),		\
+	.common = {								\
+		.reg_swcr1	= _reg_swcr1,					\
+		.reg_swcr2	= _reg_swcr2,					\
+		.reg_swcr3	= _reg_swcr3,					\
+		CCU_COMMON(_id, _name, _parent, spacemit_plla_init, _flags)	\
+	}									\
+}
+
 static inline struct ccu_pll *clk_to_ccu_pll(struct clk *clk)
 {
 	struct ccu_common *common = clk_to_ccu_common(clk);
@@ -77,5 +111,6 @@ static inline struct ccu_pll *clk_to_ccu_pll(struct clk *clk)
 }
 
 int spacemit_pll_init(struct ccu_common *common);
+int spacemit_plla_init(struct ccu_common *common);
 
 #endif /* _CLK_PLL_H_ */

-- 
2.55.0

