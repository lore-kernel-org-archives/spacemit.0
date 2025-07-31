Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203DD2F24
	for <spacemit@lists.linux.dev>; Thu, 31 Jul 2025 14:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753971370; cv=none; b=Yvbm21TzkmybD+PikSuOo4YkziwEQieCjjt/iYohKTlp9/3TEjZkuSmhtGsiSt15Jd/N0MCIQE1vrXfKfKRQN7WLGCl+JDlIAnir/5LpDLPBx8rBagj222sIDu9S+CVx1bn3mVwgib2a+RjzPHRyh9bt8vqZxnzsZuQncCmos5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753971370; c=relaxed/simple;
	bh=uvU3LuSqoqO9vOKX5HTH0ipYicugJ67Oj+k5+VRnS3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tncCpv6DLEHzXuEpAEyP0PPnjM+zBMtQnUicDBgXlKu6dmmuoyL2S5QUvgHQVFKYRlDq9aquSDIOAjtcmoLybiBh58rqDJNUCfa8T7LbcPIvYNIHyp49FKw8wfv61i3bKZ9sT+7mGFCK4kojVN5DF02sgpLaoVmc42y9vOSZkc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Rb+VBMrp; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Rb+VBMrp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1753971271;
	bh=kwpHZPpXI0p0rDKtDHDqYa7tblu6wTfxnrUTp9ZaScY=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Rb+VBMrp8Fg7ghD1rdcWB+9xUM4AX0InATigGa3re32I+dC1rbO4x2qyInIeIgNAj
	 ObenpdekMtyRDgiEZZORu49umJDOOKTu6JT2bxfUtR8DQUxbMpmq8/pTri8kWNcZTW
	 qa06YetxIxoOJMVxg64TlteA7rWLk5d7TCgPNmsg=
X-QQ-mid: zesmtpip2t1753971263tce60f3fd
X-QQ-Originating-IP: gnNPd1aSkP2AdkgB8BLPeffI5/XcgeNT52Y3+ZsaTQ8=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 31 Jul 2025 22:14:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9338058772431844133
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 31 Jul 2025 22:14:07 +0800
Subject: [PATCH RESEND v3 2/2] clk: spacemit: fix sspax_clk
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-k1-clk-i2s-v3-2-2f655ddb0c6f@linux.spacemit.com>
References: <20250731-k1-clk-i2s-v3-0-2f655ddb0c6f@linux.spacemit.com>
In-Reply-To: <20250731-k1-clk-i2s-v3-0-2f655ddb0c6f@linux.spacemit.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Yao Zi <ziyao@disroot.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753971252; l=2875;
 i=troy.mitchell@linux.spacemit.com; s=20250712; h=from:subject:message-id;
 bh=uvU3LuSqoqO9vOKX5HTH0ipYicugJ67Oj+k5+VRnS3M=;
 b=Hs6I00fFkfEOYEfv/6jaE3m7Rz5lshC/OlJ0gChrnQaIqc3WnAp49ascaBRDqReYBhqqqx7nO
 qOW46P5t3BbDHV/QbytBEZAkcd7U4/2bwss/iRzYr7bGKtOcc4amtuM
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=zhRP1xE0bftrurqSWI+SzcSdJGIZ0BTTY9Id0ESzqlI=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OJftjPC664kmGSvVbjwMXdR/m8HSHiQS9Tg7J64FEta2itPhShcz56VS
	EThD2AomRcJJiMfD8IveTwbXtGsU4dtBgxqJ4N+AzV0F5sf+wIA5edNWLU92MhhlgqwSTLd
	UbHxab+UoDCuwGqj9sasSB/yP1O9yhhG0aVz/Sz05vOdBkv8Gs9mFblVSDyXoqrqExcSH1/
	PqsERaWjJToUVlYA6qPXaAlPZBEXj0e9U3Ym7Ip6SZVgzOZWqahaRVyXSHU4GYINiKYaxcj
	/yUz6iBgsCAktlkByRmmTsKEe47vLKhvhgQIfD1rXGH3P3Dl6q1K1ix/FMy6l3aek5EqynA
	5bQNcTSxE/yNLwDk0/hdZwElxDPkWg+2STh2ohVYk/KLP6VpIs10scWXHaWaYp2kC2AwlB5
	BKJamB2uRoPeB73HbgDFJ5t1BFDL9fu5rOzC2p+S0Bbz4T3eyOExZzip4j//61h2PiL9ufH
	F3SJuxAWnJgGYs63jwG9KMEM1FRCww3FwiP+XmYWdb0h4Qzai6azugztniuwTYfrsZ4EMRu
	VH/VXNvyIYFlX5kEh72DO+Z1Ym+dzbSN0lAEM1nTz7eFpUYj73FyF2Q6C7z3QK8ebfJADmX
	Q00Xu/q2c3FY7wo3sfI7esarlnNsWUERWGIFGkHsUPT2psLMNrmaEqsaxEOkWcAauFXioLS
	wuKL3sFX8ag8iMwJb9tMN7NUSoSdiGgYqrSRm0ZSrRXGrh6zU6DNmj7DQ2kcEXdjLhqdFBC
	yRsqnN3RPjZMCbZu69v1dDzSIiotSK+kNx1KYQo2KqaXTEpQYU08UUZiMiyjc4KwTGA8+HT
	Q5SKmnux5HQDnd0/IzLGaZ6QgBW9VVu4KK5IsO+ZBHcWRtx5kzgCnDBSLDTfQE4HmNvWJUU
	uAAmGlvgNwBlYTcR97pqMbauTqUepj82w8mG19/y/8cTv4/K8B6xRgQLBZKqlU6wpb17VRr
	ECd0X1A+V5j+OWdlIFbfHLFH3ZKJ3/IsIpK1/u8O5uP6qX70/xPq+tSsJgfT7IzwkvI7aSZ
	8zglL8oO8gD7h3gAFDEkny4JBJOs6Q9AG5+H5wTotxPtCJCseF2Jx3f6Pg8PV7qbkU63Zxm
	J24sdQ70HcATgQayFIOW7/IJa3kBGJJkgltQp86g0LRqEUI8MWYA9WhO8zUNR9z5DvxvMpc
	8ZSA
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

Hardware Requirement:
When FNCLKSEL in APBC_SSPAX_CLK_RST is set to 7 (3'b111),
BIT3 must be set to 1 for the SSPAx parent clock to be I2S_BCLK.

This patch introduces SSPAx_I2S_BCLK as a virtual gate to enable BIT3.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Suggested-by: Yao Zi <ziyao@disroot.org>
---
 drivers/clk/spacemit/ccu-k1.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index cdde37a0523537c2f436e481ae8d6ec5a581b87e..24a561499a7c11b6a661c026f0bd2fac28fe7b04 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -349,7 +349,10 @@ CCU_GATE_DEFINE(aib_clk, CCU_PARENT_NAME(vctcxo_24m), APBC_AIB_CLK_RST, BIT(1),
 
 CCU_GATE_DEFINE(onewire_clk, CCU_PARENT_NAME(vctcxo_24m), APBC_ONEWIRE_CLK_RST, BIT(1), 0);
 
-static const struct clk_parent_data sspa_parents[] = {
+CCU_GATE_DEFINE(sspa0_i2s_bclk, CCU_PARENT_HW(i2s_bclk), APBC_SSPA0_CLK_RST, BIT(3), 0);
+CCU_GATE_DEFINE(sspa1_i2s_bclk, CCU_PARENT_HW(i2s_bclk), APBC_SSPA1_CLK_RST, BIT(3), 0);
+
+static const struct clk_parent_data sspa0_parents[] = {
 	CCU_PARENT_HW(pll1_d384_6p4),
 	CCU_PARENT_HW(pll1_d192_12p8),
 	CCU_PARENT_HW(pll1_d96_25p6),
@@ -357,10 +360,22 @@ static const struct clk_parent_data sspa_parents[] = {
 	CCU_PARENT_HW(pll1_d768_3p2),
 	CCU_PARENT_HW(pll1_d1536_1p6),
 	CCU_PARENT_HW(pll1_d3072_0p8),
-	CCU_PARENT_HW(i2s_bclk),
+	CCU_PARENT_HW(sspa0_i2s_bclk),
 };
-CCU_MUX_GATE_DEFINE(sspa0_clk, sspa_parents, APBC_SSPA0_CLK_RST, 4, 3, BIT(1), 0);
-CCU_MUX_GATE_DEFINE(sspa1_clk, sspa_parents, APBC_SSPA1_CLK_RST, 4, 3, BIT(1), 0);
+CCU_MUX_GATE_DEFINE(sspa0_clk, sspa0_parents, APBC_SSPA0_CLK_RST, 4, 3, BIT(1), 0);
+
+static const struct clk_parent_data sspa1_parents[] = {
+	CCU_PARENT_HW(pll1_d384_6p4),
+	CCU_PARENT_HW(pll1_d192_12p8),
+	CCU_PARENT_HW(pll1_d96_25p6),
+	CCU_PARENT_HW(pll1_d48_51p2),
+	CCU_PARENT_HW(pll1_d768_3p2),
+	CCU_PARENT_HW(pll1_d1536_1p6),
+	CCU_PARENT_HW(pll1_d3072_0p8),
+	CCU_PARENT_HW(sspa1_i2s_bclk),
+};
+CCU_MUX_GATE_DEFINE(sspa1_clk, sspa1_parents, APBC_SSPA1_CLK_RST, 4, 3, BIT(1), 0);
+
 CCU_GATE_DEFINE(dro_clk, CCU_PARENT_HW(apb_clk), APBC_DRO_CLK_RST, BIT(1), 0);
 CCU_GATE_DEFINE(ir_clk, CCU_PARENT_HW(apb_clk), APBC_IR_CLK_RST, BIT(1), 0);
 CCU_GATE_DEFINE(tsen_clk, CCU_PARENT_HW(apb_clk), APBC_TSEN_CLK_RST, BIT(1), 0);
@@ -965,6 +980,8 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
 	[CLK_SSPA1_BUS]		= &sspa1_bus_clk.common.hw,
 	[CLK_TSEN_BUS]		= &tsen_bus_clk.common.hw,
 	[CLK_IPC_AP2AUD_BUS]	= &ipc_ap2aud_bus_clk.common.hw,
+	[CLK_SSPA0_I2S_BCLK]	= &sspa0_i2s_bclk.common.hw,
+	[CLK_SSPA1_I2S_BCLK]	= &sspa1_i2s_bclk.common.hw,
 };
 
 static const struct spacemit_ccu_data k1_ccu_apbc_data = {

-- 
2.50.0

