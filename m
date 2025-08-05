Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7751E2367D3
	for <spacemit@lists.linux.dev>; Tue,  5 Aug 2025 13:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754399932; cv=none; b=A9AXi6lVDsxosTwCQVP/Rcekut0e4M4kP1WOhVDtykv+mFoVecZ+pTuzeQo5vJgGfi2vw8VY+jKaqLl7R7C1q+NQcPpbBCfCy5+hjIa4BwU7Hec4TJqp8o7sy2GsxVG/GYudz+W6XLWolP+QQIFT3iMN0oWn5+QvMATZT+kylWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754399932; c=relaxed/simple;
	bh=GXDLqZ9n8KfIJNwv8n0LBseFgDTIjbKd+WPaDTIUSTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CZI0gclo5r8Jiu4Yz57KKBSfeJvsMLP9tWpkIdfyt58p8Iyd2FgOs2YtEZ3DibnjlFJjyh+mLJVL+fE9YplPn5iWsfOQ5fohrC6SpOdIRieo2E/bQplOp4KxJj39aF5byDho/h0XW3+J2HkZozZOCuu4h+48oHyHGUkkFsgRU8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=iHrcESA4; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="iHrcESA4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1754399820;
	bh=uKRpwftHd76ByzGCZwStgONS7ug7yWYWivbpDDIKLDM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=iHrcESA46HWHQvWuWs+uS8NP5R2DXeSeqPeyMpokGzWgKAB2u+Kq4wAQKUtDUEGVT
	 j4y0X7s67YiuxVtaoVTvoCVN7r0h5LrewyFcUz4y1SsVufZ0YNqMcDV4K55ib+AXlA
	 hTXd8PvY4EoU+4vdJYJYvV8403PajM75P6icoLhQ=
X-QQ-mid: zesmtpip2t1754399812tfdd1d4e4
X-QQ-Originating-IP: v37YLt7kMBXvE8kdPSfrSPPwxyTY26MVd1UE+ZktKOw=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 05 Aug 2025 21:16:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11721054069434364327
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: troy.mitchell@linux.spacemit.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@gentoo.org,
	elder@riscstar.com,
	heylenay@4d2.org,
	inochiama@outlook.com,
	krzk+dt@kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	mturquette@baylibre.com,
	robh@kernel.org,
	sboyd@kernel.org,
	spacemit@lists.linux.dev,
	ziyao@disroot.org
Subject: [PATCH v4 2/2] clk: spacemit: fix sspax_clk
Date: Tue,  5 Aug 2025 21:16:46 +0800
Message-ID: <E801E7AF425E08C7+20250805131646.2216375-1-troy.mitchell@linux.spacemit.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250805-k1-clk-i2s-v4-0-038181284dd4@linux.spacemit.com>
References: <20250805-k1-clk-i2s-v4-0-038181284dd4@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OW4JKxETGMY2ika1YSmcCMBRvpexh30OCOY7ynTPH8cFLJh4SaZtE9uc
	eZ58mp8B64uSkR6+OJQ4lTZEie3KgzHeHcKWHMdraJnRB72kI0veI7j0GUfDRbhfIbzrFQo
	UwvZu1RCOx4Vvompxw9slUaTZjmCs7pRnqBIZ81I0IrmegGRSzVb1hMsvs00T+1Jh+QinB8
	Sdo5lumiD3JOwM5WjC0qFw8ghIw8AsCGb7Q2nYE/+UZuLgfhsAlIsWiiPI+ox0TOIFzKjfE
	gscIMAYiDypj9WL0p+r6ULbsVPhVL1z5CeBWEbi9jM03nwo489KuD8dGWCLh4LFk8OWn8va
	pzMWoeCU1gZVJskJDr2pd7/CjpH+TMXQJsYWHbimvxIukNkdEAr45EBbndN7kRlIiZJVysd
	KuIFSpSO0xxQHka+vBOkJLYNZHDfYHtf86b7leFzvwmMra84mu5Z0lVupJ7qZCOP3ud95/7
	61U2zbfeLJz914Maigj9VYJiEWP5XuOTsc5hVWMgy9oCud/5nA5QRaZffuahMCv8wLN73V1
	CXAdPiZFpmFz2GdXngCYqjXQfis9gYaLSoZFXxd7DJyvTV+J6uNNX4lN0wTQ8GFQETkFfXi
	sNILsX3HtNF9pSZCjh7scg3OGTN7+IZAJLKi+3C2kgaZs6dtAjyRL0lXSrXz6lBa1WiOwGe
	nzoti3+crPUisnyPaoYUsvqFOUGKZ5045DWpkV0YrK+Y2IghNGNfGHSmwGWpqv6llsnThuy
	5kZaqs4dAq561l25Tj37g6QE2bTp5xupcUsCOm45umbL1KlXoGgZ+N5/aokfq7nX/6guVUX
	2rrREAYm97mi+Ook2V3Boc6r3r1MUxvydrT3+fSbUmOW/l9jRlJKYtjkv85FCHXbw6imf2k
	IgM8cX2AZ1xMKWhm5ixhWBTOWvuZ6sshJ+GSEG08MvYS7sTdNmNDzIqhLGiJoBcixwhiYHc
	kaJxyMIhrEUFKAf++R1rgPFXG0NbK9mFaaX9FjI+JlewT/o8yXHUYyiBvzw+/RWgvI9U0Dr
	0h8tKaJMiGgbNIb0jApi7ZQYaZxVFccbEfHuVWvfPIz+P6UsSjERudbCkUCOhRbAyVLz0bJ
	rMx0dYh7OTV
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

Hardware Requirement:
When FNCLKSEL in APBC_SSPAX_CLK_RST is set to 7 (3'b111),
BIT3 must be set to 1 for the SSPAx parent clock to be I2S_BCLK.

This patch introduces SSPAx_I2S_BCLK as a virtual gate to enable BIT3.

Suggested-by: Yao Zi <ziyao@disroot.org>
Reviewed-by: Haylen Chu <heylenay@4d2.org>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/clk/spacemit/ccu-k1.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index cdde37a05235..4a91d28da2fb 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -349,7 +349,14 @@ CCU_GATE_DEFINE(aib_clk, CCU_PARENT_NAME(vctcxo_24m), APBC_AIB_CLK_RST, BIT(1),
 
 CCU_GATE_DEFINE(onewire_clk, CCU_PARENT_NAME(vctcxo_24m), APBC_ONEWIRE_CLK_RST, BIT(1), 0);
 
-static const struct clk_parent_data sspa_parents[] = {
+/*
+ * When i2s_bclk is selected as the parent clock of sspa,
+ * the hardware requires bit3 to be set
+ */
+CCU_GATE_DEFINE(sspa0_i2s_bclk, CCU_PARENT_HW(i2s_bclk), APBC_SSPA0_CLK_RST, BIT(3), 0);
+CCU_GATE_DEFINE(sspa1_i2s_bclk, CCU_PARENT_HW(i2s_bclk), APBC_SSPA1_CLK_RST, BIT(3), 0);
+
+static const struct clk_parent_data sspa0_parents[] = {
 	CCU_PARENT_HW(pll1_d384_6p4),
 	CCU_PARENT_HW(pll1_d192_12p8),
 	CCU_PARENT_HW(pll1_d96_25p6),
@@ -357,10 +364,22 @@ static const struct clk_parent_data sspa_parents[] = {
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
@@ -965,6 +984,8 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
 	[CLK_SSPA1_BUS]		= &sspa1_bus_clk.common.hw,
 	[CLK_TSEN_BUS]		= &tsen_bus_clk.common.hw,
 	[CLK_IPC_AP2AUD_BUS]	= &ipc_ap2aud_bus_clk.common.hw,
+	[CLK_SSPA0_I2S_BCLK]	= &sspa0_i2s_bclk.common.hw,
+	[CLK_SSPA1_I2S_BCLK]	= &sspa1_i2s_bclk.common.hw,
 };
 
 static const struct spacemit_ccu_data k1_ccu_apbc_data = {
-- 
2.50.0

