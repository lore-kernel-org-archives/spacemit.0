Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7B42367A8
	for <spacemit@lists.linux.dev>; Thu, 11 Sep 2025 03:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757561736; cv=none; b=D2cV7OareTwh8abbYUtnTRvuspN8btuCERnoQKvwGDpI8h+8Ub+IzofkPiLM0APiWbiHSKHycqPk2Bpr5brehLmQ3vUZ4pk3Ny7JQtLpHfc4FF/jL3VGY8veemkPBufB3Ds0yJJ61H7CtW1JsrNtHkhrQSw/cAtaQoCwqFZoZ2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757561736; c=relaxed/simple;
	bh=8vF7EJspH6w1AlvO0Jhpe6nfMvzzMDDLu+qMOL0JjTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=egEXElr5sfN95LyFdfgBl2M+Q1e402DuYVOp8mMPviBF6j9wA9AF3jItGAns8sBnm2YlnNHNu1ZKF0UpUPpA8E+8k7EY+GWuxGdMaFOONm6f6oO3q9nAbROCzXvVY6/VlNCNTv2WbS6mxjhzXr9h5y8j78c7ctrqNPmQJohDEwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=dlf5cqnW; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="dlf5cqnW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1757561662;
	bh=6cIpFHh8JqmTbERos517ybZUEXPDKNh75tATmTM7P3k=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=dlf5cqnW39q0U9OqXPs36q4aQhBrW23ouhilOI+KEdhcwwa66IxTdzfpb2u2Sfeg6
	 rI9q3taDedWIKQDi+eFJpEp/ln777/9OAR9fHNJLz6K7oHvChAPZBbvN3EglGxjcrv
	 T8C8uha+tCi7IVUi9x/pUJ9jyvRFoLK23Adf2Fdk=
X-QQ-mid: esmtpsz21t1757561660t871e2e00
X-QQ-Originating-IP: QJTV/3qbzO7kVHvyxsNO+eqgGoYbsBX3FUfXfw0F3+M=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 11 Sep 2025 11:34:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12270443823912362904
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 11 Sep 2025 11:34:05 +0800
Subject: [PATCH RESEND v4 3/3] clk: spacemit: fix i2s clock
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-k1-clk-i2s-generation-v4-3-cba204a50d48@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757561644; l=4010;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=8vF7EJspH6w1AlvO0Jhpe6nfMvzzMDDLu+qMOL0JjTg=;
 b=10oG8zpdU52YluNw4UoXjusApo3IbWbq+z6jZ7QTwnEIDsRNVpJLfhG28nn0Ci6E5yfMrH5i6
 yry+XbgPjh6CthSUdzQKpJi69cltQvTJGIcNCdA8DVdUH8THeYmeWFf
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N2J0ax+MgH9H54sWauMbioDcCC7deST/B5nGOUl0kNR/nv9E2eLgW2q4
	Is5zN7iBpZoiUd17HuXsRpvpgvo3x4IjvnZfBV/NFXuxqWXSFLCDOLXN47lKuYLr7MHEdEW
	qIuAgnuS750RFA5jPv6YWFVghZXSqpvwlO4qC0HYu5UAA4qAxhzZtdUF2BFdamdonZDwWXh
	5IXvuCRJLddPQVOrdHLJSbz7EmBinqXeIpk84MhCI9gJza1LSdI2B+3GmeuzBCCu+g4Wfxj
	UB5+fQVot3dnxbd+iYcnXC7PjuEWN4gvES2nyD5InnyAprAX+ZSwUL87PHN4JpFcPykcj6M
	cxD5wcrEyenYMtcOzXAKCJeLPubg0WP6VJja4vehPkGXSDWJcN9namF3Ozbex37LiHu8iA7
	s7iFiQXDQaGjFUuWYQbtNAuLoM3RXorZg8Sqn+mm+fTXRgD7MVZ1FUVBMK6wS5tUYzANFxW
	6Qr/ZSvtIW2OoarbC2jRsSrAswimNQhw4mAODp+gp77dUord0Vg5tXcM8NCRfBi/3z7dG+R
	IGcFDklGw8HPOevxShc2tv8cR/0ZdGkRz4h1De9+OB4XyiGFSsTsqvedbuexrRwmYI49rHP
	Z57paOMEDhbhvlQeqdcdjaq0u91b2xa1EVBN/d8rwCaLyDZaIWQsOPQFOWg5nuXHe2PzSfs
	K8vMPQYX6a9zrc25RZwW64Rvrwhj0FiV4avQg7DzIp10AF3hU8SzO90WqvGJJtADcN/oATR
	QcR3gaIJw767kbiAqtYBM9Vni02pfSuALJqef8F/ah8yBcU1trPL9xJPISRi5l/NVe12V5O
	AkMbht/89J7NPib2p8AmGzKaXxwVbmtrlm+fFrQM0DlHohWsume0BOw910mbGkKwD17pFNK
	AjxCEHkx0uWHeikXnawzDlk02wqX/B67NT/g8vF3HR1nOvniMHC7bHhZpKut8vsutc5ugsp
	cLTHQidSmlSP85OfHNhaiJ0ph3MjHPzs/3twuLpEHVFHI9vShVd1TqOuKb0F2X3bHcnJeY3
	3DeCbdN+pbv3EC828/fyRBJTa+Q+VKxuBb9WFaInPmk8qnlEhKSdijcWEHMkBUe8eCLKfQD
	JzO8Cf9yP52+4HeWsIGBlA=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

Defining i2s_bclk and i2s_sysclk as fixed-rate clocks is insufficient
for real I2S use cases.

Moreover, the current I2S clock configuration does not work as expected
due to missing parent clocks.

This patch adds the missing parent clocks, defines i2s_sysclk as
a DDN clock, and i2s_bclk as a DIV clock.

A special note for i2s_bclk:

From the register definition, the i2s_bclk divider always implies
an additional 1/2 factor.

The following table shows the correspondence between index
and frequency division coefficients:

| index |  div  |
|-------|-------|
|   0   |   2   |
|   1   |   4   |
|   2   |   6   |
|   3   |   8   |

From a software perspective, introducing i2s_bclk_factor as the
parent of i2s_bclk is sufficient to address the issue.

The I2S-related clock registers can be found here [1].

Link:
https://developer.spacemit.com/documentation?token=LCrKwWDasiJuROkVNusc2pWTnEb
[1]

Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Co-developer: Jinmei Wei <weijinmei@linux.spacemit.com>
Suggested-by: Haylen Chu <heylenay@4d2.org>
Signed-off-by: Jinmei Wei <weijinmei@linux.spacemit.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/clk/spacemit/ccu-k1.c    | 28 ++++++++++++++++++++++++++--
 include/soc/spacemit/k1-syscon.h |  1 +
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 7155824673fb450971439873b6b6163faf48c7e5..50b472a2721121414f33e9fac6370f544e6b8229 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -141,8 +141,28 @@ CCU_DDN_DEFINE(slow_uart2_48, pll1_d4_614p4, MPMU_SUCCR_1, 16, 13, 0, 13, 2, 0);
 
 CCU_GATE_DEFINE(wdt_clk, CCU_PARENT_HW(pll1_d96_25p6), MPMU_WDTPCR, BIT(1), 0);
 
-CCU_FACTOR_GATE_DEFINE(i2s_sysclk, CCU_PARENT_HW(pll1_d16_153p6), MPMU_ISCCR, BIT(31), 50, 1);
-CCU_FACTOR_GATE_DEFINE(i2s_bclk, CCU_PARENT_HW(i2s_sysclk), MPMU_ISCCR, BIT(29), 1, 1);
+CCU_FACTOR_DEFINE(i2s_153p6, CCU_PARENT_HW(pll1_d8_307p2), 2, 1);
+
+static const struct clk_parent_data i2s_153p6_base_parents[] = {
+	CCU_PARENT_HW(i2s_153p6),
+	CCU_PARENT_HW(pll1_d8_307p2),
+};
+CCU_MUX_DEFINE(i2s_153p6_base, i2s_153p6_base_parents, MPMU_FCCR, 29, 1, 0);
+
+static const struct clk_parent_data i2s_sysclk_src_parents[] = {
+	CCU_PARENT_HW(pll1_d96_25p6),
+	CCU_PARENT_HW(i2s_153p6_base)
+};
+CCU_MUX_GATE_DEFINE(i2s_sysclk_src, i2s_sysclk_src_parents, MPMU_ISCCR, 30, 1, BIT(31), 0);
+
+CCU_DDN_DEFINE(i2s_sysclk, i2s_sysclk_src, MPMU_ISCCR, 0, 15, 15, 12, 1, 0);
+
+CCU_FACTOR_DEFINE(i2s_bclk_factor, CCU_PARENT_HW(i2s_sysclk), 2, 1);
+/*
+ * Divider of i2s_bclk always implies a 1/2 factor, which is
+ * described by i2s_bclk_factor.
+ */
+CCU_DIV_GATE_DEFINE(i2s_bclk, CCU_PARENT_HW(i2s_bclk_factor), MPMU_ISCCR, 27, 2, BIT(29), 0);
 
 static const struct clk_parent_data apb_parents[] = {
 	CCU_PARENT_HW(pll1_d96_25p6),
@@ -756,6 +776,10 @@ static struct clk_hw *k1_ccu_mpmu_hws[] = {
 	[CLK_I2S_BCLK]		= &i2s_bclk.common.hw,
 	[CLK_APB]		= &apb_clk.common.hw,
 	[CLK_WDT_BUS]		= &wdt_bus_clk.common.hw,
+	[CLK_I2S_153P6]		= &i2s_153p6.common.hw,
+	[CLK_I2S_153P6_BASE]	= &i2s_153p6_base.common.hw,
+	[CLK_I2S_SYSCLK_SRC]	= &i2s_sysclk_src.common.hw,
+	[CLK_I2S_BCLK_FACTOR]	= &i2s_bclk_factor.common.hw,
 };
 
 static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
diff --git a/include/soc/spacemit/k1-syscon.h b/include/soc/spacemit/k1-syscon.h
index c59bd7a38e5b4219121341b9c0d9ffda13a9c3e2..354751562c55523ef8a22be931ddd8aca9651084 100644
--- a/include/soc/spacemit/k1-syscon.h
+++ b/include/soc/spacemit/k1-syscon.h
@@ -30,6 +30,7 @@ to_spacemit_ccu_adev(struct auxiliary_device *adev)
 
 /* MPMU register offset */
 #define MPMU_POSR			0x0010
+#define MPMU_FCCR			0x0008
 #define  POSR_PLL1_LOCK			BIT(27)
 #define  POSR_PLL2_LOCK			BIT(28)
 #define  POSR_PLL3_LOCK			BIT(29)

-- 
2.51.0

