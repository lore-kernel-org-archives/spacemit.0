Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239F6214A8F
	for <spacemit@lists.linux.dev>; Wed,  9 Apr 2025 21:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744233470; cv=none; b=ecG/udKFHQi13oiGPzaRBn7Hu9GwjyWcQxsq37nJAiJonmP4B4tj4ATIOeYcMHPmYCk+Z1muoZybH1EB5qGlhDsNAJ16hAGcOxfGkjRPYqiqLYK4lNeD/PNHnv/W810pdwu6Y9G0l8iS9jkG1L0lUuJSBNDd1FjY+kbbA5z6jn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744233470; c=relaxed/simple;
	bh=LS7YZ++WbsdVQE1UX7G+UOQmXOkD2lQl6Z+x5E+PHkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kbu4RH4wukA4usq2e0r2hrWc6NNf5yAoc5plGZwRHkFEFrX2TROpqLgFSdJBduhFG4aL+9NsmbGziUHgHGJx3QMfhBIFoI4J5gwAXQNJylcrbEGnqWLDwvsy51ArDtmBiNd1qui68kbR8H/jNYuHSGOHg0C0Q5P93WhC8bTQjIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ki9KxjBQ; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ki9KxjBQ"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3d450154245so1377895ab.2
        for <spacemit@lists.linux.dev>; Wed, 09 Apr 2025 14:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744233468; x=1744838268; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/Ujt2BqpTFQspxt7ElIhz1eo1LmzpQ0jjYgAj4gQFw=;
        b=ki9KxjBQEg1btDavPrw0aiRLv29M3o9Gng5SO7UWpE0dNhpzFnJuS843BkRV2+ob7p
         Gdn9RTA99kXJxpSPlyQ5+UG2y7c0O0GL/wOTZn5lSL+v56uPv7PS3YU3xgTM4Gnqn5kF
         uIlfsqeReACxLBhT2V/n5AKD89kALBjQ/SF/Wu0RmEYPfGPRFqqxRbE+9SX22QVJjMVt
         +9ksHOXUxjUhcftXeWcnMtGD9uLW7Q0/HOWZ5vOyo1cEUeIiHqXOjcHgTbQuFHZ29SRp
         pj4QN1CF9pYIjUK1EbstsBu2HnJXp7dTXDhe6t/hu+lolNoYiFN4gkcs5JxOXJU/HxYU
         P4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744233468; x=1744838268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/Ujt2BqpTFQspxt7ElIhz1eo1LmzpQ0jjYgAj4gQFw=;
        b=LVrdac0+Jv3J5KzG0pvW0+wvCb0sJLr4cXmTwsRnQ+TxoetoZBcoamfFBeIX6xEONO
         lLqtY0gEBQbEeTKUuA9Bxc+N2itwxGhr1W7Hil8QrB+24DLUirQDkRK4Q+gyZ1pqywYl
         bxiBYjX47ohB8a9RdBX6MAGQaXFSrFrQmQwybf4Kn9NXGuhwcLAKJUBw8kCdvjHsmO5S
         3wdl6yGvxhq9Gzd4Y+vcJS8nvg4PQ+ew3mIoX2lkKMwtPLQFs0J3vSLUiwWHzOZz3eW9
         bDNAmbDF8P15StiReIPKzw1SWYI7KDfmJCPXOHNnTmAedxRVrGkIcZDpY8hHfQbrTaCP
         Y4mQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdomoQWLmPW4vGDHVRZZ1uz91Bw4PW4wLaEi8bqUB82Dh1pmcbiI6bzeupEeC//pkYJASFtnT6Ag==@lists.linux.dev
X-Gm-Message-State: AOJu0YwpjiekK/Z2bZBdvifv8tVFSvKMARIAyGQ0I6MmBlmCV+m/4rxM
	FGuyBbBZ87x9ElOuDC3fP/KcGdalsDr02ZMzQaQF3NI8WqvNrvxqElUBUt49EhE=
X-Gm-Gg: ASbGncvPfFbWQAq6WArVD94nYMy/+hYM9Delkcj739mpsb7kCZfBJ3jw2gwi7ia4ktJ
	QLOeZLKggW4Gqxq1Ettp9cfmyPD2d6OGL90jk28bbD6IoA/AOHX8nuetrsCUXgaLFt9gN0olQnR
	o5Owcndi2Ax72STishbBdhbmXnSCfRj5NhDz2rXKYPmYntdxS18fXk+slPPxtHwKW2jWX4Q54XY
	eW9c0U/fej8rT08P2/7dnvAwr8TBm8y+zVxM8Ebev5GkOtqO0uPmjRLQdWRM21pZ3mTcfH9kgDp
	QzOWFp01qmceJ7ub6k23/cqKRpmBDBByOKdwiXQRuVUzXTTKrUvapxKFYGclCxx85ru3CQFvw6P
	GmMdojKIPI1nqnQ==
X-Google-Smtp-Source: AGHT+IEA351OHRV1gFr2V6hEs8tVqEYmZ8Jl/cV8rxcpoeDrDqiVZAMMDJF5x+pEwEG48cVA0Jzrbg==
X-Received: by 2002:a05:6e02:308a:b0:3d3:f040:5878 with SMTP id e9e14a558f8ab-3d7e477abafmr8500765ab.21.1744233468227;
        Wed, 09 Apr 2025 14:17:48 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf8e91sm420735173.6.2025.04.09.14.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 14:17:47 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/7] clk: spacemit: rename spacemit_ccu_data fields
Date: Wed,  9 Apr 2025 16:17:35 -0500
Message-ID: <20250409211741.1171584-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409211741.1171584-1-elder@riscstar.com>
References: <20250409211741.1171584-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "clk_" to the names of the fields in the spacemit_ccu_data structure
type.  This prepares it for the addition of two similar fields dedicated
to resets.

Move the definition of this type closer to the top of the source file,
after constants are defined but before objects are defined.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 5804c2f854071..8a8d228b46c3f 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -129,6 +129,11 @@
 #define APMU_EMAC0_CLK_RES_CTRL		0x3e4
 #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
 
+struct spacemit_ccu_data {
+	struct clk_hw **clk_hws;
+	size_t clk_num;
+};
+
 /* APBS clocks start, APBS region contains and only contains all PLL clocks */
 
 /* Frequency of pll{1,2} must not be updated at runtime */
@@ -933,11 +938,6 @@ CCU_GATE_DEFINE(emmc_bus_clk, CCU_PARENT_HW(pmua_aclk),
 		APMU_PMUA_EM_CLK_RES_CTRL, BIT(3), 0);
 /* APMU clocks end */
 
-struct spacemit_ccu_data {
-	struct clk_hw **hws;
-	size_t num;
-};
-
 static struct clk_hw *k1_ccu_pll_hws[] = {
 	[CLK_PLL1]		= &pll1.common.hw,
 	[CLK_PLL2]		= &pll2.common.hw,
@@ -977,8 +977,8 @@ static struct clk_hw *k1_ccu_pll_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_pll_data = {
-	.hws	= k1_ccu_pll_hws,
-	.num	= ARRAY_SIZE(k1_ccu_pll_hws),
+	.clk_hws	= k1_ccu_pll_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_pll_hws),
 };
 
 static struct clk_hw *k1_ccu_mpmu_hws[] = {
@@ -1018,8 +1018,8 @@ static struct clk_hw *k1_ccu_mpmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
-	.hws	= k1_ccu_mpmu_hws,
-	.num	= ARRAY_SIZE(k1_ccu_mpmu_hws),
+	.clk_hws	= k1_ccu_mpmu_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_mpmu_hws),
 };
 
 static struct clk_hw *k1_ccu_apbc_hws[] = {
@@ -1126,8 +1126,8 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apbc_data = {
-	.hws	= k1_ccu_apbc_hws,
-	.num	= ARRAY_SIZE(k1_ccu_apbc_hws),
+	.clk_hws	= k1_ccu_apbc_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_apbc_hws),
 };
 
 static struct clk_hw *k1_ccu_apmu_hws[] = {
@@ -1196,8 +1196,8 @@ static struct clk_hw *k1_ccu_apmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apmu_data = {
-	.hws	= k1_ccu_apmu_hws,
-	.num	= ARRAY_SIZE(k1_ccu_apmu_hws),
+	.clk_hws	= k1_ccu_apmu_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_apmu_hws),
 };
 
 static int spacemit_ccu_register(struct device *dev,
@@ -1207,13 +1207,13 @@ static int spacemit_ccu_register(struct device *dev,
 	struct clk_hw_onecell_data *clk_data;
 	int i, ret;
 
-	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
+	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->clk_num),
 				GFP_KERNEL);
 	if (!clk_data)
 		return -ENOMEM;
 
-	for (i = 0; i < data->num; i++) {
-		struct clk_hw *hw = data->hws[i];
+	for (i = 0; i < data->clk_num; i++) {
+		struct clk_hw *hw = data->clk_hws[i];
 		struct ccu_common *common;
 		const char *name;
 
@@ -1238,7 +1238,7 @@ static int spacemit_ccu_register(struct device *dev,
 		clk_data->hws[i] = hw;
 	}
 
-	clk_data->num = data->num;
+	clk_data->num = data->clk_num;
 
 	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
 	if (ret)
-- 
2.45.2

