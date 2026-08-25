Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F46237F73D
	for <spacemit@lists.linux.dev>; Tue, 25 Aug 2026 04:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787631931; cv=none; b=LemQUwRemAE0XwvAVJ9j/t1cMQ8tTk1GZYqvL4ZCXDzGsmpyYTw5N5Zy9jgd9aOsHh/5ly4O2NixLWTyRaHpQs/IA2gRREydBFbRoADCXQqzeB0VF/Gj6maO75SZ8H7vafkeHO78wK+He7KB6BOoM+UDrkA2GG5UML6/LPo8MWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787631931; c=relaxed/simple;
	bh=ftJ+kbB5E2pxrNsi65+pPim7G0BDdEwVZYL1SbwH0e8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WQer679+/WdVKc60lH/zoaSNrMg9pR+vtpBxp7s8b9cJcFnhzKefeJyuwvOW1Y1+45/YhaFOJgDiMHj17MLv/naM+0Kc+55jSrh12+xikMoncu1OQ9VbUc9SNp0GeyxAzs5DKb7+fP3ArYDjDsPANKt+VG4rEB2Qp7hYVlbCnKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gG5lUlSt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gG5lUlSt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 290001F00AC4;
	Tue, 25 Aug 2026 04:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787631929;
	bh=1Wf6SPnXTLLebF0zvlWcfEnQ+oISAp0ZNT5R1yOuGcs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gG5lUlStp0eftSdOPyZUCp15yeQZWMD7OkLDTmjA1JkP/ZzKyRPhDTzR3Pub/Yuzb
	 7A2ufuDMHmR5v4DoTx1nrt4kCHeiAPe0zZnLR1bo8Ev0AmVR2H3mnSnjCLfABBce96
	 u4DSZyx9dY+7c5bL0ZM+U5esBGlBF/Ng4V767ojFE2xQkw2DTsDhJ7KUJ2iuygcC8O
	 45Ao9dBwao2ZJKq55rm9Y5TJceZUTL7giU4F9D2sVggvfHP8/A1qogMRbJrk5vBzah
	 N1HaSTMsRRWQTx37/qUNxukuIdGjBC3ByVxNgu+UCSrS3EMRrvkU67SfeB5lu8qfON
	 FF5x6KQyxzIXA==
From: Yixun Lan <dlan@kernel.org>
Date: Tue, 25 Aug 2026 04:24:16 +0000
Subject: [PATCH 6/8] clk: spacemit: k3: reduce clock tree for SPL build
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-01-k3-clock-reset-support-v1-6-c430253e759c@kernel.org>
References: <20260825-01-k3-clock-reset-support-v1-0-c430253e759c@kernel.org>
In-Reply-To: <20260825-01-k3-clock-reset-support-v1-0-c430253e759c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11778; i=dlan@kernel.org;
 h=from:subject:message-id; bh=ftJ+kbB5E2pxrNsi65+pPim7G0BDdEwVZYL1SbwH0e8=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqjRkW6qpH4TT7OtHrHnrTHyKe1NIV/4RzcKzt+
 b5Isbvxn1iJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCao0ZFhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+00mw/+MqFjyAXCPayljI7bwMm3VrFzTmT5VnebklU8MOWOS1EYvDjKWNMkW
 fFAtCIUb2a9t6IKMWqm7Z4ROugu0RvVRLBVqSMSH8o4s99zRjOXaECYinbBCfUcCTVK+taVGItI
 fpergZ/3l5WmlSEzJex9zbWKpI9urI2/aDsMxJ7tcJcxANUKEdibJ+F6thjhZdB85eGf932vkTk
 Ae3+EhFOP4FRJ/Ajj8fE/HBSYl0jn6wuRQHKem+Jzxn6c0c54XTVcjXqMPy9mI0LccjGKz02JmI
 dSj+O+lpi7HMG0R+R30qPmo5n5ITZWps5I3wfOUubQXc90SGHaIDo1uqil5i125Hq7uy13h4d43
 s8T4yXYqwgVimybHlNPZAbMJUCA2sq6cQ3ZWJ/Qyw9qDkOaELAtXK0sVPUcLq0ttbaRiY3OEypc
 v8NkYHsNqdagogHdRqyJ9W9TxcAl76ktR7GZK4oImAPSCJEDzpZiPeZeG9j2PQ+elG9NtxvYQXr
 1fkypv443x8VDqU9ZHdLO+3ISIyXoWFOSCpfEd93LYVPwU227J8VpS/JBW+PnnPosoldYyVR9nj
 XBRGBPdLL+NVPUOHFXnnZGvxpLY/G7QeLHEMWUteruz54nnhbnOoCB/zojqfg3q7QsmEOGOtBEJ
 3L92nDCmNE3mEtSQAZ1JQGorUdehBA=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Due to SPL image running in a memory space constraint SRAM environment,
so reduce the whole clock tree a bit to make it fit for final runtime
requirement, only a subset clock tree is registered, which includes UART,
SDHCI, I2C (TWSI), and their PLL/MPMU/APMU/APBC ancestors; while the
full clock tree is retained in non-SPL build.

Where surviving SPL CCU definitions reference parent clocks outside
that subset tree, it will use "clock-dummy" as name of clock parent to
ensure the framework still successfully resolves the parent clock lookup.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/clk/spacemit/clk-k3.c | 141 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 134 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/spacemit/clk-k3.c b/drivers/clk/spacemit/clk-k3.c
index 1ac64aec6ba..c4ac0b18442 100644
--- a/drivers/clk/spacemit/clk-k3.c
+++ b/drivers/clk/spacemit/clk-k3.c
@@ -41,6 +41,16 @@ static const struct ccu_pll_rate_tbl pll1_rate_tbl[] = {
 	CCU_PLLA_RATE(2457600000UL, 0x0b330ccc, 0x0000cd00, 0xa0558989),
 };
 
+#if IS_ENABLED(CONFIG_SPL_BUILD)
+CCU_PLLA_DEFINE(CLK_PLL1, pll1, pll1, "clock-24m", pll1_rate_tbl,
+		APBS_PLL1_SWCR1, APBS_PLL1_SWCR2, APBS_PLL1_SWCR3,
+		MPMU_POSR, POSR_PLL1_LOCK, CLK_SET_RATE_GATE);
+CCU_FACTOR_GATE_DEFINE(CLK_PLL1_D4, pll1_d4, pll1_d4, "pll1",
+		       APBS_PLL1_SWCR2, BIT(3), 4, 1);
+CCU_FACTOR_GATE_FLAGS_DEFINE(CLK_PLL1_D8, pll1_d8, pll1_d8, "pll1",
+			     APBS_PLL1_SWCR2, BIT(7), 8, 1,
+			     CLK_IS_CRITICAL);
+#else
 static const struct ccu_pll_rate_tbl pll2_rate_tbl[] = {
 	CCU_PLLA_RATE(3000000000UL, 0x0b3e2000, 0x00000000, 0xa0558c8c),
 };
@@ -244,9 +254,44 @@ CCU_FACTOR_GATE_DEFINE(CLK_PLL8_D7, pll8_d7, pll8_d7, "pll8",
 		       APBS_PLL8_SWCR2, BIT(6), 7, 1);
 CCU_FACTOR_GATE_DEFINE(CLK_PLL8_D8, pll8_d8, pll8_d8, "pll8",
 		       APBS_PLL8_SWCR2, BIT(7), 8, 1);
+#endif
 /* APBS clocks end */
 
 /* MPMU clocks start */
+#if IS_ENABLED(CONFIG_SPL_BUILD)
+CCU_FACTOR_DEFINE(CLK_MPMU_PLL1_153P6, pll1_d16_153p6,
+		  pll1_d16_153p6, "pll1_d8", 2, 1);
+CCU_FACTOR_GATE_DEFINE(CLK_MPMU_PLL1_102P4, pll1_d24_102p4,
+		       pll1_d24_102p4, "pll1_d8", MPMU_ACGR,
+		       BIT(12), 3, 1);
+CCU_FACTOR_GATE_DEFINE(CLK_MPMU_PLL1_51P2, pll1_d48_51p2,
+		       pll1_d48_51p2, "pll1_d8", MPMU_ACGR,
+		       BIT(7), 6, 1);
+CCU_FACTOR_GATE_DEFINE(CLK_MPMU_PLL1_57P6, pll1_m3d128_57p6,
+		       pll1_m3d128_57p6, "pll1_d8", MPMU_ACGR,
+		       BIT(8), 16, 3);
+CCU_FACTOR_GATE_DEFINE(CLK_MPMU_PLL1_25P6, pll1_d96_25p6,
+		       pll1_d96_25p6, "pll1_d8", MPMU_ACGR,
+		       BIT(4), 12, 1);
+CCU_GATE_DEFINE(CLK_MPMU_PLL1_614, pll1_d4_614p4, pll1_d4_614p4,
+		"pll1_d4", MPMU_ACGR, BIT(15), 0);
+CCU_FACTOR_GATE_DEFINE(CLK_MPMU_PLL1_31P5, pll1_d78_31p5,
+		       pll1_d78_31p5, "pll1_d4", MPMU_ACGR,
+		       BIT(6), 39, 2);
+
+static const char * const apb_parents[] = {
+	"pll1_d96_25p6", "pll1_d48_51p2", "pll1_d96_25p6",
+	"pll1_d24_102p4",
+};
+CCU_MUX_DEFINE(CLK_MPMU_APB, apb_clk, apb_clk, apb_parents,
+	       ARRAY_SIZE(apb_parents), MPMU_APBCSCR, 0, 2, 0);
+CCU_DDN_DEFINE(CLK_MPMU_SLOW_UART1, slow_uart1_14p74,
+	       slow_uart1_14p74, "pll1_d16_153p6", MPMU_SUCCR,
+	       CCU_DDN_MASK(16, 13), 16, CCU_DDN_MASK(0, 13), 0, 2, 0);
+CCU_DDN_DEFINE(CLK_MPMU_SLOW_UART2, slow_uart2_48, slow_uart2_48,
+	       "pll1_d4_614p4", MPMU_SUCCR_1, CCU_DDN_MASK(16, 13), 16,
+	       CCU_DDN_MASK(0, 13), 0, 2, 0);
+#else
 CCU_GATE_DEFINE(CLK_MPMU_PLL1_307P2, pll1_d8_307p2, pll1_d8_307p2, "pll1_d8",
 		MPMU_ACGR, BIT(13), 0);
 CCU_FACTOR_DEFINE(CLK_MPMU_PLL1_76P8, pll1_d32_76p8, pll1_d32_76p8, "pll1_d8_307p2", 4, 1);
@@ -383,12 +428,34 @@ CCU_GATE_DEFINE(CLK_MPMU_I2S4_SYSCLK, i2s4_sysclk, i2s4_sysclk, "i2s4_sysclk_div
 		MPMU_I2S_SYSCLK_CTRL, BIT(18), 0);
 CCU_GATE_DEFINE(CLK_MPMU_I2S5_SYSCLK, i2s5_sysclk, i2s5_sysclk, "i2s5_sysclk_div",
 		MPMU_I2S_SYSCLK_CTRL, BIT(22), 0);
+#endif
 /* MPMU clocks end */
 
 /* APBC clocks start */
 static const char * const uart_clk_parents[] = {
 	"pll1_m3d128_57p6", "slow_uart1_14p74", "slow_uart2_48",
 };
+#if IS_ENABLED(CONFIG_SPL_BUILD)
+CCU_MUX_GATE_DEFINE(CLK_APBC_UART0, uart0_clk, uart0_clk,
+		    uart_clk_parents, ARRAY_SIZE(uart_clk_parents),
+		    APBC_UART0_CLK_RST, 4, 3, BIT(1), 0);
+CCU_GATE_DEFINE(CLK_APBC_UART0_BUS, uart0_bus_clk, uart0_bus_clk,
+		"apb_clk", APBC_UART0_CLK_RST, BIT(0), 0);
+CCU_GATE_DEFINE(CLK_APBC_AIB, aib_clk, aib_clk, "clock-24m",
+		APBC_AIB_CLK_RST, BIT(1), 0);
+CCU_GATE_DEFINE(CLK_APBC_AIB_BUS, aib_bus_clk, aib_bus_clk, "apb_clk",
+		APBC_AIB_CLK_RST, BIT(0), 0);
+
+static const char * const twsi_parents[] = {
+	"pll1_d78_31p5",
+};
+
+CCU_MUX_GATE_DEFINE(CLK_APBC_TWSI2, twsi2_clk, twsi2_clk,
+		    twsi_parents, ARRAY_SIZE(twsi_parents),
+		    APBC_TWSI2_CLK_RST, 4, 3, BIT(1), 0);
+CCU_GATE_DEFINE(CLK_APBC_TWSI2_BUS, twsi2_bus_clk, twsi2_bus_clk,
+		"apb_clk", APBC_TWSI2_CLK_RST, BIT(0), 0);
+#else
 CCU_MUX_GATE_DEFINE(CLK_APBC_UART0, uart0_clk, uart0_clk, uart_clk_parents, ARRAY_SIZE(uart_clk_parents),
 		    APBC_UART0_CLK_RST, 4, 3, BIT(1), 0);
 CCU_MUX_GATE_DEFINE(CLK_APBC_UART2, uart2_clk, uart2_clk, uart_clk_parents, ARRAY_SIZE(uart_clk_parents),
@@ -750,9 +817,19 @@ CCU_GATE_DEFINE(CLK_APBC_CAN3_BUS, can3_bus_clk, can3_bus_clk, "apb_clk",
 		APBC_CAN3_CLK_RST, BIT(0), 0);
 CCU_GATE_DEFINE(CLK_APBC_CAN4_BUS, can4_bus_clk, can4_bus_clk, "apb_clk",
 		APBC_CAN4_CLK_RST, BIT(0), 0);
+#endif
 /* APBC clocks end */
 
 /* APMU clocks start */
+#if IS_ENABLED(CONFIG_SPL_BUILD)
+static const char * const axi_clk_parents[] = {
+	"pll1_d8_307p2", "pll1_d6_409p6",
+};
+CCU_MUX_DIV_FC_DEFINE(CLK_APMU_AXICLK, axi_clk, axi_clk,
+		      axi_clk_parents, ARRAY_SIZE(axi_clk_parents),
+		      APMU_ACLK_CLK_CTRL, APMU_ACLK_CLK_CTRL, 1, 2,
+		      BIT(4), 0, 1, 0);
+#else
 static const char * const axi_clk_parents[] = {
 	"pll1_d8_307p2", "pll1_d6_409p6",
 };
@@ -1029,13 +1106,13 @@ CCU_MUX_DIV_GATE_FC_DEFINE(CLK_APMU_UFS_ACLK, ufs_aclk, ufs_aclk, ufs_aclk_paren
 			   2, 3, BIT(1), 0);
 
 static const char * const edp0_pclk_parents[] = {
-	"lcd_pxclk", "external_clk",
+	"lcd_pxclk", "clock-dummy",
 };
 CCU_MUX_GATE_DEFINE(CLK_APMU_EDP0_PXCLK, edp0_pxclk, edp0_pxclk, edp0_pclk_parents, ARRAY_SIZE(edp0_pclk_parents),
 		    APMU_LCD_EDP_CTRL, 2, 1, BIT(1), 0);
 
 static const char * const edp1_pclk_parents[] = {
-	"dsi4ln2_lcd_pxclk", "external_clk",
+	"dsi4ln2_lcd_pxclk", "clock-dummy",
 };
 CCU_MUX_GATE_DEFINE(CLK_APMU_EDP1_PXCLK, edp1_pxclk, edp1_pxclk, edp1_pclk_parents, ARRAY_SIZE(edp1_pclk_parents),
 		    APMU_LCD_EDP_CTRL, 18, 1, BIT(17), 0);
@@ -1096,7 +1173,7 @@ CCU_MUX_DEFINE(CLK_APMU_ESPI_SCLK_SRC, espi_sclk_src, espi_sclk_src, espi_sclk_s
 		APMU_ESPI_CLK_RES_CTRL, 4, 3, 0);
 
 static const char * const espi_sclk_parents[] = {
-	"external_clk", "espi_sclk_src",
+	"clock-dummy", "espi_sclk_src",
 };
 CCU_MUX_GATE_DEFINE(CLK_APMU_ESPI_SCLK, espi_sclk, espi_sclk, espi_sclk_parents, ARRAY_SIZE(espi_sclk_parents),
 		    APMU_ESPI_CLK_RES_CTRL, 7, 1, BIT(3), 0);
@@ -1124,6 +1201,7 @@ CCU_MUX_DIV_GATE_DEFINE(CLK_APMU_ISIM_VCLK2, isim_vclk_out2, isim_vclk_out2, isi
 CCU_MUX_DIV_GATE_DEFINE(CLK_APMU_ISIM_VCLK3, isim_vclk_out3, isim_vclk_out3, isim_vclk_parents, ARRAY_SIZE(isim_vclk_parents),
 			APMU_SNR_ISIM_VCLK_CTRL, 27, 4, 25, 2,
 			BIT(24), 0);
+#endif
 /* APMU clocks end */
 
 /* DCIU clocks start */
@@ -1148,6 +1226,13 @@ CCU_GATE_DEFINE(CLK_DCIU_C3_TCM_PIPE, c3_tcm_pipe_clk, c3_tcm_pipe_clk, "axi_clk
 
 
 
+#if IS_ENABLED(CONFIG_SPL_BUILD)
+static struct clk *k3_ccu_pll_clks[] = {
+	&pll1.common.clk,
+	&pll1_d4.common.clk,
+	&pll1_d8.common.clk,
+};
+#else
 static struct clk *k3_ccu_pll_clks[] = {
 	&pll1.common.clk,
 	&pll2.common.clk,
@@ -1235,6 +1320,7 @@ static struct clk *k3_ccu_pll_clks[] = {
 	&pll8_d7.common.clk,
 	&pll8_d8.common.clk,
 };
+#endif
 
 static const struct spacemit_ccu_data k3_ccu_pll_data = {
 	.clks		= k3_ccu_pll_clks,
@@ -1242,6 +1328,20 @@ static const struct spacemit_ccu_data k3_ccu_pll_data = {
 	.offset		= K3_PLL_ID,
 };
 
+#if IS_ENABLED(CONFIG_SPL_BUILD)
+static struct clk *k3_ccu_mpmu_clks[] = {
+	&pll1_d16_153p6.common.clk,
+	&pll1_d24_102p4.common.clk,
+	&pll1_d48_51p2.common.clk,
+	&pll1_m3d128_57p6.common.clk,
+	&pll1_d96_25p6.common.clk,
+	&pll1_d4_614p4.common.clk,
+	&pll1_d78_31p5.common.clk,
+	&apb_clk.common.clk,
+	&slow_uart1_14p74.common.clk,
+	&slow_uart2_48.common.clk,
+};
+#else
 static struct clk *k3_ccu_mpmu_clks[] = {
 	&pll1_d8_307p2.common.clk,
 	&pll1_d32_76p8.common.clk,
@@ -1295,6 +1395,7 @@ static struct clk *k3_ccu_mpmu_clks[] = {
 	&i2s4_sysclk.common.clk,
 	&i2s5_sysclk.common.clk,
 };
+#endif
 
 static const struct spacemit_ccu_data k3_ccu_mpmu_data = {
 	.clks		= k3_ccu_mpmu_clks,
@@ -1302,6 +1403,16 @@ static const struct spacemit_ccu_data k3_ccu_mpmu_data = {
 	.offset		= K3_MPMU_ID,
 };
 
+#if IS_ENABLED(CONFIG_SPL_BUILD)
+static struct clk *k3_ccu_apbc_clks[] = {
+	&uart0_clk.common.clk,
+	&uart0_bus_clk.common.clk,
+	&aib_clk.common.clk,
+	&aib_bus_clk.common.clk,
+	&twsi2_clk.common.clk,
+	&twsi2_bus_clk.common.clk,
+};
+#else
 static struct clk *k3_ccu_apbc_clks[] = {
 	&uart0_clk.common.clk,
 	&uart2_clk.common.clk,
@@ -1446,6 +1557,7 @@ static struct clk *k3_ccu_apbc_clks[] = {
 	&can3_bus_clk.common.clk,
 	&can4_bus_clk.common.clk,
 };
+#endif
 
 static const struct spacemit_ccu_data k3_ccu_apbc_data = {
 	.clks		= k3_ccu_apbc_clks,
@@ -1453,6 +1565,11 @@ static const struct spacemit_ccu_data k3_ccu_apbc_data = {
 	.offset		= K3_APBC_ID,
 };
 
+#if IS_ENABLED(CONFIG_SPL_BUILD)
+static struct clk *k3_ccu_apmu_clks[] = {
+	&axi_clk.common.clk,
+};
+#else
 static struct clk *k3_ccu_apmu_clks[] = {
 	&axi_clk.common.clk,
 	&cci550_clk.common.clk,
@@ -1544,6 +1661,7 @@ static struct clk *k3_ccu_apmu_clks[] = {
 	&isim_vclk_out2.common.clk,
 	&isim_vclk_out3.common.clk,
 };
+#endif
 
 static const struct spacemit_ccu_data k3_ccu_apmu_data = {
 	.clks		= k3_ccu_apmu_clks,
@@ -1557,12 +1675,14 @@ static const struct spacemit_ccu_data k3_ccu_apmu_data = {
  * Enable them explicitly here, otherwise Linux gets stuck
  * halfway through boot.
  */
+#if !IS_ENABLED(CONFIG_SPL_BUILD)
 static struct clk *const k3_apmu_boot_clks[] = {
 	&cpu_c0_core_clk.common.clk,
 	&cpu_c1_core_clk.common.clk,
 	&cpu_c2_core_clk.common.clk,
 	&cpu_c3_core_clk.common.clk,
 };
+#endif
 
 static struct clk *k3_ccu_dciu_clks[] = {
 	&hdma_clk.common.clk,
@@ -1675,7 +1795,10 @@ static int k3_apmu_clk_probe(struct udevice *dev)
 {
 	struct regmap *base_regmap;
 	const struct spacemit_ccu_data *data;
-	int i, ret;
+#if !IS_ENABLED(CONFIG_SPL_BUILD)
+	int i;
+#endif
+	int ret;
 
 	ret = k3_clk_force_probe(DM_DRIVER_GET(k3_pll_clk));
 	if (ret)
@@ -1694,11 +1817,13 @@ static int k3_apmu_clk_probe(struct udevice *dev)
 	if (ret)
 		return -EPROBE_DEFER;
 
+#if !IS_ENABLED(CONFIG_SPL_BUILD)
 	for (i = 0; i < ARRAY_SIZE(k3_apmu_boot_clks); i++) {
 		ret = clk_enable(k3_apmu_boot_clks[i]);
 		if (ret)
 			return ret;
 	}
+#endif
 
 	return 0;
 }
@@ -1715,9 +1840,11 @@ static int k3_apbc_clk_probe(struct udevice *dev)
 	ret = k3_clk_force_probe(DM_DRIVER_GET(k3_mpmu_clk));
 	if (ret)
 		return ret;
-	ret = k3_clk_force_probe(DM_DRIVER_GET(k3_apmu_clk));
-	if (ret)
-		return ret;
+	if (!IS_ENABLED(CONFIG_SPL_BUILD)) {
+		ret = k3_clk_force_probe(DM_DRIVER_GET(k3_apmu_clk));
+		if (ret)
+			return ret;
+	}
 
 	ret = regmap_init_mem(dev_ofnode(dev), &base_regmap);
 	if (ret)

-- 
2.55.0

