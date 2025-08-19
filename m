Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DFA202F8B
	for <spacemit@lists.linux.dev>; Tue, 19 Aug 2025 01:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755567418; cv=none; b=HEERAAPw83lMd1BIcdT9zvXGIwZ8t0LYvAgyhZ8ohuHKyv50KeN2P3s5EUFfP0vlP6FJRxLq1+YdHiUeB1+2rKWUw0ppDB9t2WIatBNbWDF1A7hzRLZFXu6RFcXJ0h0oZfEAuKVAkaay4LTMuU8FTKt9cXzsn53dij2R9zXt+r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755567418; c=relaxed/simple;
	bh=cbYO9pZP3k7Ta6Ig4gCsEs6GQb+qs2EuZyhEONUipoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cWfNDedAIlayp77u6QXN4Dcfh26k1u6hKDMS1irJ3N+dxt6n131KA7hSDewJHjhf7eZ8LMpey6B2ofKc2/cknXTgBNgHHoIdU3UMbrjKfNnIPQFC7vZB077UkCwGYp2UfMEM//t6UKLSszmrWYAGQ0eN7uT+JnP0lXDhV4Bf9JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=EQ3at5az; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="EQ3at5az"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1755567329;
	bh=uhl8/t0StcVqCaIWEKD+VuekI6N7mwpFLjkaIlWp5yw=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=EQ3at5azQ8aYnyLn82PEuvhoL6PapiDIcshDoSU2YbXiy5XoTlGSkS5dhMflNnDsT
	 elZ14fBMyAXGGuJun5CwQ7ZkGB8MSuhbmttTyVqwmh0g/dl02u0edbJV43Asc0B5Jb
	 nmejDhFlpkuQAYTlxSa70oKMyhKF0pTQqP13aqvU=
X-QQ-mid: esmtpgz10t1755567327t312bb98c
X-QQ-Originating-IP: iIZs0ikRtkS/JR0i6or1EkTqIWUaffHSmjp2ixQuz30=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 19 Aug 2025 09:35:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12480758067493020977
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 19 Aug 2025 09:35:11 +0800
Subject: [PATCH v4 3/3] clk: spacemit: fix i2s clock
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-k1-clk-i2s-generation-v4-3-80174edd04eb@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755567313; l=4010;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=cbYO9pZP3k7Ta6Ig4gCsEs6GQb+qs2EuZyhEONUipoQ=;
 b=t5XOT52tWGiOmBs4rOz5QVFCAK7ITGOYNwnrlciH8aM2d6IIZ2C8YkmqNKa9jpLE2wLrM/PuA
 doV1k5Qt+g7CfXA/hJHL/QNk7LDMqztlWm1EgWJHTb/4s4zYoLqlanY
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NqyNaysCYMTC5xVjjUX+dKhBKpsCzCVHC4/qpNLEU+jcTAARQgI1v/jV
	sHhW9WeKL+lR9RMkW7bqYBh5o+Ray5hoNpvGjChG01V4B93IJ67aYwiVP2kDdwFk+kebn2+
	DX7xNzAgkj5DSIVGPxCGjiNLSeeJw5U+f1+xzqauRxySxFjvqYOV4ck/N2QyqZs1y4g9Bg/
	OOIYid4NZKWUFhuMynUgD+pFBHcx6dKkPqYAqlTHypemC+m8vGwF0dtD1HrKhPRd0us+O+p
	aATSH3RcFJ1jUC4Q5pByMcsUJmYgLz9zb5MLG0cBSEReWeHNBeVqvylizr9p1VK6KElg7kL
	iG+5PMH9xMAmOnpM1XEFd2gZXovor9uQe31WHs+F+lGbr9ASfp9HO9kbb4/x2pk4B/nTEXR
	h6TpqOizdXCgL1ERa2Bi6gHRf70/C4tl8Uruiueg/V/4aVZWXQhO6vvvLtaoqV8CzTDOOMN
	7w0LFq2MpGwiQvH4Z9ADAu6LggoQz4MYEbmcsLLLNHrGcvXz74aWRP2gmVaVvxqhMU17HUf
	eBu4ZagDwdd6BYh56YTnbdb7l4c3sazl3SsOV0IgERq9YsFUFziW8Ud3hDIxi32+tUwWfym
	MFVBk71jlWCHbHe5Sgr5xzNd2tMkzgLf3ZeQb13s6qAcXW1uGxqWdAQrMangeYQE4BZJQ7H
	AcjJikbJxoVDxERJeEYFsMa2xmV9MXNsvNWigPU5b4Y6O9TB7xTjuh4Z9o4YEal/npk6DSZ
	rY4mGvYcdpAUREvJOPIxPz5zzNnVxENS+sJofi/e4mwrOFKmM9IicSclvaU/2qef1rk7uj6
	E76ErVS4XfJB/FUAWonzhBT1LLThkLFN1huws5sKER19OZRt8qwUzn61MPoUaHEcuyxfSLh
	gFlGHQ7ph+bufbYaBABzTi1Evh6UonbVlVES8g35zwgj4SIBNFR9lsuswQNcOejGCUP8zn5
	IyqTS/9rr8eeNg86vs1nlmyDVpJKgHZFND9JR1eRqiRx/omwBCD91QTI+mQUZm1AtsCzkrW
	P+JAajfjf85JtgUNzfnKgO8Dp6kAu/rL0W+eGq3nZSRM7YHQMSgI5hcc6InvabJF60yQETl
	cqN7QJj68GCR3YaFCKstv1YOqXtRz04dvWsKNtwO1HTaiJuoH1SUOFSZWKqmrQ4g4nAnWRJ
	Guv6
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
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
2.50.1

