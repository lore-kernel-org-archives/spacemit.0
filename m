Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.67.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003E623645D
	for <spacemit@lists.linux.dev>; Thu, 11 Sep 2025 03:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.67.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757561731; cv=none; b=MZA7NBMzJzyfB0arkBpIeS+ygQsSCjlyco0/q86uzzSyWGWJTV9GHLn00uMW4Ax8gyqGA6YR0KcgR1GK1uzmgX9iuLcF34H9i4/IIqqnR4irjDZOVgwWQkEd7LO6owuSH3zunEOpxaMUl+i8fEF1Kv02L3b2Kc8vwlrgrFvCj+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757561731; c=relaxed/simple;
	bh=um/BmDrcrL0kuow4Mg9YUsckGkNepV1kSLVg1UlzI78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TUa7b79txW+/2kcSCty7jpxREoDEKM8CjKqrl69pyzozX3wViWRre18Bq41SoDhUlk3xdu8mvuNq6WQ6ILdcspfe3W0kDsEEkildzPuDvIexk0tUnc1Z7oc20kZc9zd5DVwJN+qC1PrTY/gwFpM59KOF5O2s8lGEiCcSJFCTzZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=SGJu44LT; arc=none smtp.client-ip=114.132.67.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="SGJu44LT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1757561658;
	bh=6dv7CsMYSMIwRgfQgFkuw6XwJ6YSMwlWfwNLaJZz9VU=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=SGJu44LTkeobZJOHSxoXXJZqzgBl1pbm3qzi4KPNbOvM2M6mO4NFA9B5YbuX7yBn7
	 DGCT90m7TROWvcyd68hs11PofwpXxu7i8gOB54aFZgfL2WjxEP/mAfqLngOZZIH1vv
	 x0OhCGsvGAJRpzODoJdS6SiB+RsM86Q9PkIwt3gU=
X-QQ-mid: zesmtpsz8t1757561656t73c75677
X-QQ-Originating-IP: atI6jdhOTO99dK0qo4mLzd5Ax7YIXq4ZclxUwACk0GM=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 11 Sep 2025 11:34:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11099552558053467934
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 11 Sep 2025 11:34:04 +0800
Subject: [PATCH RESEND v4 2/3] clk: spacemit: introduce pre-div for ddn
 clock
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-k1-clk-i2s-generation-v4-2-cba204a50d48@linux.spacemit.com>
References: <20250911-k1-clk-i2s-generation-v4-0-cba204a50d48@linux.spacemit.com>
In-Reply-To: <20250911-k1-clk-i2s-generation-v4-0-cba204a50d48@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757561644; l=4272;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=um/BmDrcrL0kuow4Mg9YUsckGkNepV1kSLVg1UlzI78=;
 b=z1OFKwF+QDZ8bs6TETX7P1vRlSxis+A8oFuHuR8uWEkspKrqdM5HtNAflp/q3Caesb+NZ4VCC
 2mRA2Y3Z890DxgfO37pcYRwxZBERKDeqLbN/s0p/Im+sPeHcAL8fo2d
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OV5xRVowR16SUzOxg8PoyXr5U4uV9Dvc/ZWlK1rk7t8j2A+qw6TciN//
	6422Cjs0AIAyjHrBscqVe1euazkajxRWOUUSA4MGfUlMboll9d3Q3aIhQjawoPxzDxG1AeN
	MPboGlCj+cxQ8IzO997JaiNs3naU+LSCevJFs6k+qaXSlJpaWvyko4ClLR8Vf1QXXyuyF4m
	Jtkcjpctdm9Kh78Vosfx1x+14pZUKuIrDNFuDix9d+z9kHcuHvdX1oJGHFbBIkfhPUska88
	OvcTd23rtN7MOgrOF+wHWR0U7iz0Tbh2S0klNRbTBAZ13tmyf5En81K07ziQdIql0tYb5ZL
	v6bMPglGHatlD2vtpXG+HivlpLXm+5nBez2SXF3j0OiPJriP04Z9Q34IvGvi/Nh2y1I5UdS
	oQZthgGcDaLED7zXT58TT7B+zLt5zkrGZ/r7zNLK2IcnWUcvOUi4xUrqHOh/ciPzenhzj5q
	GmKjF91dxtgHnXDm/DGjqwiJZSjjI9y0Cezxy0kVRAkH3gLcl55VKZxR4Bp8w0xKmfT768o
	hNwMwrCCWUS0W/P1+YP0rEp4VW6LqbCR50Uu+/jRQDDvsV3xXIkqRTygqMxtN64+YdqoATM
	ZMW34VhMbw0/bt4bfXsy5Do5enn4/zOxl+Qyd2tro3razv/NAoD65+SE8gosmQ7O5HEiJtu
	l4Azqch7/v4XLIiBztnn+FQSSAEScPKswrKggo4yCGp4aZqDjyZVZtF9CfRHYeFVu9YSSNx
	sBWI+E5RAmnOINqpnAODW6G3udFJEucuXp3A1ZcOjd/Y/m2DsEJ5XuxjW2SwDX+Buv1ebEq
	elfr6vMz3hAhRlnhPcXBrbtrXa9da7iKJfl9qvxuMphvd8r/gPDFH4sjDH880i5+ColnXBC
	iZfdxyAxMGEaqTMHCt3W9rWJdBwG92TppJo8XpmsImjMlHkKwB5MaBnpxWa05RUoRf5X4Rx
	W5qPCcaAcOcnh/6fdCOmRdW3mk/jtbAvEHQB0ny2rI/4ZapPQ0atkFHrMNrX9E1ltndlJLG
	OkvzZUXDcpa8TS3XgPSZ72O4+JFVRtUyD/6UyZkoRTAKSgYmRMOGBU6CcIKmsRG/QxbZxDy
	FFDYuwR+iF1385gYXtL/4D2rDYJnRCP2JHn5nSWloxe
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
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
2.51.0

