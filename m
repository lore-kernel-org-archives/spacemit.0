Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5D226B743
	for <spacemit@lists.linux.dev>; Mon, 28 Jul 2025 14:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753712457; cv=none; b=D9HFM2Am4KLcEXFebNpi7/liTZeg9ckQ4B2BmlYglZdTfCOMIAa879GAtDsUL+Z26qlBurtv4kiXx5atYJgb0E89PMhIipDPl65qbyV0N2S1HT/+Bxa8rJ/L0cqGWKkXD4NY76yc2LKdJhWhg7QSFuElHoW0eShuFNdNk9LabRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753712457; c=relaxed/simple;
	bh=uvU3LuSqoqO9vOKX5HTH0ipYicugJ67Oj+k5+VRnS3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nIKwyATAVDrSKtixhXadxnGaQSKQLSHpYdHuHqRzPUbqD1QYICyEP/0ofCOuMtjl7h0a4Wd7kcZDduVpEuakQgN7VOC2XhNmw/xDQbVFmL3NFoHfK+ZvyupLh7N6fcEWJk7tV+CWR4KAK+mrxknIDcJmWqbzSImOywR1kt1SaBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XaggACfQ; arc=none smtp.client-ip=209.85.222.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XaggACfQ"
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-7e346ab52e9so571568285a.2
        for <spacemit@lists.linux.dev>; Mon, 28 Jul 2025 07:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753712453; x=1754317253; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwpHZPpXI0p0rDKtDHDqYa7tblu6wTfxnrUTp9ZaScY=;
        b=XaggACfQAFfQcyS19M3NAR81VNXww+mPsPlMc3zFe95UZdx8T8wormkdX8I7Ms1SDt
         v5/LlIkuvUSU7gU7aWmImeeORU5iQdIDebY0f98Wk4OWhCmojs720BmK+TbzwlVGz271
         w7H7lBbLJwJMJZ5Q6HAZ9a2U+4EtAf6M93G5ya3kRviZA3sgFdKy2+zhRbYPTv8QUr88
         Hz1GH+o8/AXzy1cFHQkLP3pAKmC2oKZWBPVwLyJ0JKPwB2qiWJXxQn+m5qruWKQw7wRc
         TyHNtJL2rFbmHuwsElXJV1Utv00akz6nxQ76XFaXTmMKppoNbVGIfgoDz6hIiZQMyGIR
         jdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753712453; x=1754317253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwpHZPpXI0p0rDKtDHDqYa7tblu6wTfxnrUTp9ZaScY=;
        b=BF7JqHaAWNZSUxayI+cILizgVmyqLRbyRFRIToltvvumDUQSdJfigwK+T1f/cS7xqx
         bfCdDlTOqbtgy0y95clClE79VrdX2WD1gDTRlBABBcidmDhQ0a+Fj62ML5QtTSaTRnOR
         3rDbVTco9hfy/bhs3QxtDVlo5xmaWHIQhRMJrZ+D+LI5EAWvfRtX8IZmBo7RnfvfU07s
         7F3sXrGpOtWoyBaFfrWGgIYQtBXp3GAf0Rx9FdDypCHPNZK0+JJqG1cOHT8JMg6Peh6i
         ST9P/Qan/jJZUxBrfqozWT8ckSXD2spsewBYoGF2UZgFs5cWgKH0pU7bXhVUPl6s/4lJ
         N8Jw==
X-Forwarded-Encrypted: i=1; AJvYcCXjqamweklu51Aepb3zKHZYze8yeOqHGuq39qniM0cWWeTQv+mRN/6x3MwOEbYt3mTNN/W2UEmg9Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNJF0qOoWQAs1vR7042MNZGUIfaaIH/ME4VGtSpYi05NFgJd6j
	j9AyNjxVQdaKE0pLZ4G3vXvlaSSI9kV9IP3p5FKAqzHGIItNB2MxwTEgfOK9qpvDCh7/Ww==
X-Gm-Gg: ASbGncsJ/lhCAWZaHH2UcEMAFQ/43eZtmOSYNN2nyw86yYLg/p9iRXSrQDhB1FfeYH+
	SH8ph2BxIresR7GN+dAoCFjfm9D28/BSBO5lKXDhFQ4ABw5MHEEbdwEdztLbdCDt5LfA2i7aup9
	RcViGxs3frlv3bjWxqd01x8hWtM86VM0WxlSULqDUVC9LqJu4XNtgfLM3+sUNMfcJBQDF8GJ8Cs
	MVToL2zosKk41n59b0v36ioy2vdMLPsPj6KD9rXbXY+9x0JDcksxA5xz41YsSTK/8AmsCgGq+Q8
	KfciPU58CFFybtSQaC39Ryv6OkVx0anY8FEkqJHxbCdcb+8xSmTBzM1AUIaJQa/P7JGmwtaeYjk
	YAOu6Q1dtf18DfPVjirjc6PFjafM7CPxS
X-Google-Smtp-Source: AGHT+IGNkNTYdf6BLasYK8+uoS65PqFGHaWC/DpiGuyNp2KNVMbN6+x1bh6pNoVy9S9XOmC8dksPIw==
X-Received: by 2002:a05:6a00:1a8c:b0:746:24c9:c92e with SMTP id d2e1a72fcca58-76332b4ffe8mr20182948b3a.8.1753712440665;
        Mon, 28 Jul 2025 07:20:40 -0700 (PDT)
Received: from localhost ([2408:8256:2284:4127:de49:6dc9:a446:157a])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-768faf4bb9asm893691b3a.132.2025.07.28.07.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 07:20:40 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 28 Jul 2025 22:20:16 +0800
Subject: [PATCH v3 2/2] clk: spacemit: fix sspax_clk
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250728-k1-clk-i2s-v3-2-5d7579f02227@linux.spacemit.com>
References: <20250728-k1-clk-i2s-v3-0-5d7579f02227@linux.spacemit.com>
In-Reply-To: <20250728-k1-clk-i2s-v3-0-5d7579f02227@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753712415; l=2875;
 i=troy.mitchell@linux.spacemit.com; s=20250712; h=from:subject:message-id;
 bh=uvU3LuSqoqO9vOKX5HTH0ipYicugJ67Oj+k5+VRnS3M=;
 b=RwJKdnLixQKy07JYdGH7iFd0nnjBb6RbhYTaUrhC1Qraje6WyuilaOhHmgkWSnYvZDzbRCoeZ
 d8+uAlhTgKBAJoi9L54Y7Y3XNDmjaIt5i8vUIYspoyyyo0431qObHps
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=zhRP1xE0bftrurqSWI+SzcSdJGIZ0BTTY9Id0ESzqlI=

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

