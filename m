Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0114116E863
	for <spacemit@lists.linux.dev>; Mon, 18 Aug 2025 09:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755509394; cv=none; b=ZtiqFu0u5A4py7Gy25wbsH1WkHj2wGSVPtf0f9uCXzzIZPRywArThS+MW3zOmNDS4MqPtb8230LROYy9FJYqhrTIGwUYTVA896NA9wEWJR3uC16yvUJtUEbfnyso3kPrAG3wNdlnxKMm3aWTAZbxTcWrhlsVgqQS57YesYy1mT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755509394; c=relaxed/simple;
	bh=FOB7j1hlhVZDsG+zyDRMWyOCbt8PIEXCVAaCiq/WXRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XyJYU/0gpOwf+P+lo1WBlwWJ5gBLxqyfw8qnP0V9ErPgAK55RDHpTVHJSwSQcKKMtF487ndUNBU/iFmSky5B+uBZd2wC9s7pOeWo/1HAo7c/JpqNOzbaFMTtOyn3Wf9r6IeTHbN0IP9MfLM3VEjL3aATv5O4ICEUl7iU8llVX6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=MBGnRQcF; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="MBGnRQcF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1755509320;
	bh=P0uoMf5MS5hqK/AadmBbjxqCSSW+t8LKJc1Paz1/HdI=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=MBGnRQcFssfHahxfN4HOgJj/+/lN3mD1HBipx55z88KB7osa7es3Cj4lX6qsj6LXT
	 YIXx923sffE8TLLKHrNz/ngZWXZmfdf2pjUHc9Q46zZmIKCVwkQTCTDf/GKw0OVKyP
	 NFcpzApePzUw/PtTrBDzS4oFAN+yp/g+FPFMZX1U=
X-QQ-mid: zesmtpsz6t1755509318tefe082fa
X-QQ-Originating-IP: h/AA42SpewFkwa0CFAT8ZKkIBNMIUI7l+DNAVLVoz1M=
Received: from = ( [14.123.254.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 18 Aug 2025 17:28:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14834764785882491220
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 18 Aug 2025 17:28:21 +0800
Subject: [PATCH v3 2/3] clk: spacemit: introduce pre-div for ddn clock
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-k1-clk-i2s-generation-v3-2-8139b22ae709@linux.spacemit.com>
References: <20250818-k1-clk-i2s-generation-v3-0-8139b22ae709@linux.spacemit.com>
In-Reply-To: <20250818-k1-clk-i2s-generation-v3-0-8139b22ae709@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755509307; l=4228;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=FOB7j1hlhVZDsG+zyDRMWyOCbt8PIEXCVAaCiq/WXRc=;
 b=M/lFs4kyl89mj2sEORYsOaGP3qlKajC1gTtgFdc/qX9ZBRO7aDVIo9wGpaaLa6UjHn9XEOTSZ
 O5QXfiPnJeZC/zgHitor1IuClRtwCBaR92PmkyrzarTgog/NntUIRYC
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MkhAA4qIuU0pPB+rZqkBzsubnPsmuYv8U7ZFe4B88f4beEBEPc9bDEwW
	wRSq42sibcyd0+8MfiC2y7dTiAttgoo3J7z5djtlcjw4FaDJB1CvMRSsmULsbxBiv5LswNw
	jVyfNlDZYv6gPTsdFZ1WiPMMulL6HXpJ3cfflEcTnMBz8uliPYkzHWTICcgyMXjcWxplBrA
	Y8IK0wgkQ3xaar3+vX0TpGsAodaDxEaIopwQFTQUhE6Dot0wM6Od00GLR92/W9/Kg2B0ZWh
	gKHPjfqnAdq4SLhdkLJQlbWu/PqgZQ2/jc59bNXSbHNZ0S2RBETgPcV28RzxnR5j5qFMTtG
	vEo+NB2LuXWnPFAoGaRIPjp+Iijylg5pzZD2GhCT5yhMT2guaSyFEor5mzorEeQt95YThSz
	1tUpZIgMvx1wdy4ZcCpQ91UQHbMSmuvuBJhk28v6bF0o76LBmrcS/zDy/7idQ32AnMsXnZV
	2FWT7MGep/oedsipuMS2Ie3uMdGeU5VnFVuhDh2RJLn0uVyDIebYPXBaE/CC8SDGU9GIe4A
	yxf4eh4rU2JdajOCKSEHhuoctmKfyrrsZ39GHCO7nLSZRMY3+M/dgUFnyEb01fL/keHt9Vw
	1g7sRkJTCTqyP5/pf6jzxQdTWVau8t81JxObhhONL/4nkmV2QdcZLkcqopYowjxumkLesOn
	vVhMB4IvYOz02Ue96dK7RXuMnvBRpNKLZFhTHlj/1VrFl22pFGi6/vk8eq+CfhT11chvvT1
	X1VLWZq5sVyBzCRVlM5Mh4Y04vDcaPT56P5bbKMfM6eg3ikaoSDBbqInaeeEduRHgZ5ALmx
	OWOkg60UWC7JQP8LJf4Rws/i0CHzj9YhcD+RdyU76OAs6x+TgYlr4ZhObXMbYISox2FSLj+
	6C24VZa5pGCkZH3p5pgeQzFhlGI6yCoaM12fZW/SV/EaRGbrQYqw4MbkDP60w0bQRxux84o
	VaEKyJUg8Z6aX7EXiGTkAMZ70JjrHfo+TTgnszsnrJGT1voBzyLOJ9wRadHMV/7TRK0C138
	DlXyGAc5/4iVZqLvzZdIc7MsiA+wu2+LqQwZHZjYDI69PhuF4g3l0Vom+hu9yz1YQCV5yj2
	ev0fWU2A1sX/lLUp82NmUMX9YGiKtLGQBJeyQ7+BYLa
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

The original DDN operations applied an implicit divide-by-2, which should
not be a default behavior.

This patch removes that assumption, letting each clock define its
actual behavior explicitly.

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

