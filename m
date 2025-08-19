Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108791FDA8E
	for <spacemit@lists.linux.dev>; Tue, 19 Aug 2025 01:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755567393; cv=none; b=L/9kDmUdl6Jr6BcoQGrAhtpSadyR5GZXiWI45mj/WrkFfjlSsp+NRt9g9Sh4BzSMon3lYDr8yg6c6+3gf6GafkbHpgbL9QyXEn9Ypns7Lnp+druY8UYw6/IUtqxgg058ifMde1ieME7atKQemlux1idvaCdIrneAQU5b0V6Ip2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755567393; c=relaxed/simple;
	bh=wdMPiVIeJsJzFwdu5LLU9FO4SL7n/gJ/QmRKRGDI5Co=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HD5HVxbWiqRjxNfTzkX8mO7IVyyphenJsLlp5W4XPWzD1mE3tbL0syDlvn7v4UsCVH7snmLGSRalTNc9WpIYxvJtvufhaQvA2ziFWf7F68TiiBERVaRHAcP1cIMQBPU+R9Cd7IZAgwxte2DP1/1kKD+9VEWcyMcrRa62emUKv+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=w/4W7oEY; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="w/4W7oEY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1755567326;
	bh=fgMPbHla/RHj3NVfFAEZIZq6Vq/k5kuht5xvr+kXOT0=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=w/4W7oEY0DNwpX0ZEesegVK5fy+wR1UGPYgN0w9xyGHThLrPe62rzh3tMM2Ac8s1m
	 XmAQRJaR+OXAovoYUDpF8Cd9pqp+vuBnUAMjIlGoqhQr2A/T1cCOjsUR4UrCiU4OSP
	 pSxqJgDlBexZvVKGYZI3jhZy6Iqv9p4svyNOt4pQ=
X-QQ-mid: zesmtpgz9t1755567324tc7ddb23a
X-QQ-Originating-IP: A3TFw07MyzdE9155DEy/FetY79CGxV5ka6P9joBSQeA=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 19 Aug 2025 09:35:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4631062309127417572
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 19 Aug 2025 09:35:10 +0800
Subject: [PATCH v4 2/3] clk: spacemit: introduce pre-div for ddn clock
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-k1-clk-i2s-generation-v4-2-80174edd04eb@linux.spacemit.com>
References: <20250819-k1-clk-i2s-generation-v4-0-80174edd04eb@linux.spacemit.com>
In-Reply-To: <20250819-k1-clk-i2s-generation-v4-0-80174edd04eb@linux.spacemit.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
 Inochi Amaoto <inochiama@outlook.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755567312; l=4272;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=wdMPiVIeJsJzFwdu5LLU9FO4SL7n/gJ/QmRKRGDI5Co=;
 b=Q96ug52EU2Of0CxnUDnM1QxIBiIB6dMVI3LNmdn95jtmBy6J49sjtf0UQlZIK6LCsXkS7hvlT
 GShMocafTUADz1shi8qPp6VGkCF/l6kJst+nFIuet3CgGN9G0euqG2j
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: M2+XtCuIGUlWtIrBjXawux1LlF19yHUNFMmGV6O+mJ28z/HN8x/FIJkG
	gXKmuPeNrsTj1pKAqKUpsE1VS6MBykaLBLbrERFpJtz+fIGKkoPBSZzcNFezdS/coXewgnb
	qLtVT5Os4O9yxqEQqaHzX+kdhERzvyU/lpbPebvK3zG9qxZEEO9wiUHBr/MxAJGhTCybcbA
	fHAGB3atp1XSMNPFk9qbADJYntBB6DVTEIGm8s97+I6a03/jtmZKUPWBHIVCmBpSVRZ7ERM
	Zhx/nlSnaL+zxsxi893qiuMM+43+4oYQOpHuZwj4Kv48a485GPtSEtDlVqIC094ytNJxsJg
	L/4/yPTPsbZsNJ8oH1k2xepQAqqaTmuPhvkGAxrAPiQiEkHMSAoZ/++y/wvoH0mPNyzjIRJ
	e7VWo3pzGxyw1Inf2M7hzoOUzIuByEuzj6kp5lDUe6pAAay4SemEQQckrchnQwd9qalR/fw
	iiRgdaGfOpQQNBpp3yW7+YdksNyJj1DykpHk+UbJUaNmkapnzSIpZpK16cSfVI9r2KEpujt
	hVIFQxGMZeMjWvmQz3AiJU1+wVPx//m08Z+1mzWpGEMdEiAhgGxfFtXQGXKRKQAcg0NRpTp
	N51mmWmJQ1j3fazKUU3juhnN/sR03JNKwu1GwyKXt+p2JxMxxOkg1nsfFwzcZ7nlqoc7tHH
	2x+6lENlDItjq2JvF2eCUOnVHU/XqGG7nvyZB3mDXY2qUSXPThCOjtaU88ELJIOjkGMfFyl
	C35Ug7KokppxJ223LD56JAQv9XJps3iuC+h4vR7z9yLTjhR8CIDshysBaV7bq2I9sNAsAkM
	bwMqIAOJgU7jCYLEbWP0n2/Ya88TkjdMAk7CYPb0+011K5xSDnVBbLGyRfNZT8E/jkGreRr
	FC6ZuyCR/0Bmvk/pPG1Jq5JzNEVj9bcGFaOUJ2rV8y9/4f6VkKQsaRf92HmxaRiywQeVoto
	tdIV52+jzpvscaOyL72GPQFibc5bjnvGLiqatnXP3DBAEPzPST9avdQqXxx6Z5f44SlvE4W
	U7ZntEjzEeXGyCsv2I403U0vChx+oXpSzQYZoppJuqY5Cx/LJrJCFxSTMuSp73rOHJE4K+z
	4iIXIkjpq5CVhaQHjrIlWKQT/Xr+NTZqu2fP83KDreWTJhdstEi0jTxKi+cE/z4E5wtTKhj
	TCbMQevBCekfcW8/cFs2UMy00IKUCW0zc5R8Y81nU27wlXs=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

The original DDN operations applied an implicit divide-by-2, which should
not be a default behavior.

This patch removes that assumption, letting each clock define its
actual behavior explicitly.

Reviewed-by: Haylen Chu <heylenay@4d2.org>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/clk/spacemit/ccu-k1.c  |  4 ++--
 drivers/clk/spacemit/ccu_ddn.c | 12 ++++++------
 drivers/clk/spacemit/ccu_ddn.h |  6 ++++--
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 65e6de030717afa60eefab7bda88f9a13b857650..7155824673fb450971439873b6b6163faf48c7e5 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -136,8 +136,8 @@ CCU_GATE_DEFINE(pll1_d3_819p2, CCU_PARENT_HW(pll1_d3), MPMU_ACGR, BIT(14), 0);
 CCU_GATE_DEFINE(pll1_d2_1228p8, CCU_PARENT_HW(pll1_d2), MPMU_ACGR, BIT(16), 0);
 
 CCU_GATE_DEFINE(slow_uart, CCU_PARENT_NAME(osc), MPMU_ACGR, BIT(1), CLK_IGNORE_UNUSED);
-CCU_DDN_DEFINE(slow_uart1_14p74, pll1_d16_153p6, MPMU_SUCCR, 16, 13, 0, 13, 0);
-CCU_DDN_DEFINE(slow_uart2_48, pll1_d4_614p4, MPMU_SUCCR_1, 16, 13, 0, 13, 0);
+CCU_DDN_DEFINE(slow_uart1_14p74, pll1_d16_153p6, MPMU_SUCCR, 16, 13, 0, 13, 2, 0);
+CCU_DDN_DEFINE(slow_uart2_48, pll1_d4_614p4, MPMU_SUCCR_1, 16, 13, 0, 13, 2, 0);
 
 CCU_GATE_DEFINE(wdt_clk, CCU_PARENT_HW(pll1_d96_25p6), MPMU_WDTPCR, BIT(1), 0);
 
diff --git a/drivers/clk/spacemit/ccu_ddn.c b/drivers/clk/spacemit/ccu_ddn.c
index be311b045698e95a688a35858a8ac1bcfbffd2c7..06d86748182bd1959cdab5c18d0a882ee25dcade 100644
--- a/drivers/clk/spacemit/ccu_ddn.c
+++ b/drivers/clk/spacemit/ccu_ddn.c
@@ -22,21 +22,21 @@
 
 #include "ccu_ddn.h"
 
-static unsigned long ccu_ddn_calc_rate(unsigned long prate,
-				       unsigned long num, unsigned long den)
+static unsigned long ccu_ddn_calc_rate(unsigned long prate, unsigned long num,
+				       unsigned long den, unsigned int pre_div)
 {
-	return prate * den / 2 / num;
+	return prate * den / pre_div / num;
 }
 
 static unsigned long ccu_ddn_calc_best_rate(struct ccu_ddn *ddn,
 					    unsigned long rate, unsigned long prate,
 					    unsigned long *num, unsigned long *den)
 {
-	rational_best_approximation(rate, prate / 2,
+	rational_best_approximation(rate, prate / ddn->pre_div,
 				    ddn->den_mask >> ddn->den_shift,
 				    ddn->num_mask >> ddn->num_shift,
 				    den, num);
-	return ccu_ddn_calc_rate(prate, *num, *den);
+	return ccu_ddn_calc_rate(prate, *num, *den, ddn->pre_div);
 }
 
 static long ccu_ddn_round_rate(struct clk_hw *hw, unsigned long rate,
@@ -58,7 +58,7 @@ static unsigned long ccu_ddn_recalc_rate(struct clk_hw *hw, unsigned long prate)
 	num = (val & ddn->num_mask) >> ddn->num_shift;
 	den = (val & ddn->den_mask) >> ddn->den_shift;
 
-	return ccu_ddn_calc_rate(prate, num, den);
+	return ccu_ddn_calc_rate(prate, num, den, ddn->pre_div);
 }
 
 static int ccu_ddn_set_rate(struct clk_hw *hw, unsigned long rate,
diff --git a/drivers/clk/spacemit/ccu_ddn.h b/drivers/clk/spacemit/ccu_ddn.h
index a52fabe77d62eba16426867a9c13481e72f025c0..4838414a8e8dc04af49d3b8d39280efedbd75616 100644
--- a/drivers/clk/spacemit/ccu_ddn.h
+++ b/drivers/clk/spacemit/ccu_ddn.h
@@ -18,13 +18,14 @@ struct ccu_ddn {
 	unsigned int num_shift;
 	unsigned int den_mask;
 	unsigned int den_shift;
+	unsigned int pre_div;
 };
 
 #define CCU_DDN_INIT(_name, _parent, _flags) \
 	CLK_HW_INIT_HW(#_name, &_parent.common.hw, &spacemit_ccu_ddn_ops, _flags)
 
 #define CCU_DDN_DEFINE(_name, _parent, _reg_ctrl, _num_shift, _num_width,	\
-		       _den_shift, _den_width, _flags)				\
+		       _den_shift, _den_width, _pre_div, _flags)		\
 static struct ccu_ddn _name = {							\
 	.common = {								\
 		.reg_ctrl	= _reg_ctrl,					\
@@ -33,7 +34,8 @@ static struct ccu_ddn _name = {							\
 	.num_mask	= GENMASK(_num_shift + _num_width - 1, _num_shift),	\
 	.num_shift	= _num_shift,						\
 	.den_mask	= GENMASK(_den_shift + _den_width - 1, _den_shift),	\
-	.den_shift	= _den_shift,					\
+	.den_shift	= _den_shift,						\
+	.pre_div	= _pre_div,						\
 }
 
 static inline struct ccu_ddn *hw_to_ccu_ddn(struct clk_hw *hw)

-- 
2.50.1

