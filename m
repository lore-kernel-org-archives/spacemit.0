Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C7228BAB7
	for <spacemit@lists.linux.dev>; Mon, 14 Apr 2025 19:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744658246; cv=none; b=hqRABSCXl5AaywVnfR1u1Zuo1jnnDQt7C+bTNfG1WrxTq+rnyozE2kK+HyfapcYAW6GqHHiMHfjPf8+xzXMbqeaVSoZi5z69v4pGo+GYszOwm5U1Uo9NI1Zj7HhDYl4Zdw2DRAArxHCAUslSnE6Ne9FRo+hTFoUlxSr2dmhvc4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744658246; c=relaxed/simple;
	bh=EAW+HDTqn4JOg/LwTabgEKzUOriy6DOvjcW5MZPwhWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TgFVBJ3wvjJw9KBP6WDLXwU3oy3o1c/Ud2286qx9U/Q03MoUprvdKvvzbVzxJwXvpiSuJd3/o2k4pN2M4AA+EdEzikJizLhxSvyqoApBgtLvwIMJ//5hCThOt4sM4dGSnAwonqptfAy3B1YsctyvxrU19d/egXdhQqSSh6PTXUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=fccDSlmo; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="fccDSlmo"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-85d9a87660fso407896939f.1
        for <spacemit@lists.linux.dev>; Mon, 14 Apr 2025 12:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744658244; x=1745263044; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQupJEb/nO7YYkb/BsP/LHrq8C6tspApeBZ7h7HnR4g=;
        b=fccDSlmoSUO8HNc+8Q3iM62h70hu4za0hSf9VEAc667Ufg7GnFuX9Zzyr5D9lq8l8Y
         xW69eKPMfWkVrwRu5l1nqIDZViZXsANfV+gFRPfw/UIlEsAimkqCH+QRxRvrskp4nRPG
         97Ybd0WCuNyL5JmAV8pOQWl9O7vOPoH9fuQLJZF8fr2JTaTkwzmjwN+G4iaqsSo95+T4
         NeStRNMD+IuK5cPqptrNRBNdTZsemokiycs4DPYaASnNF9QdfW2X492ku7Qfld3LqGoy
         64AjjkQ/iRf1jDwL9OmO5lNgkYQnLGvnAdX4pLX+VqJjv0CHHHDnD93nfOpFXzCD56PR
         jbUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744658244; x=1745263044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PQupJEb/nO7YYkb/BsP/LHrq8C6tspApeBZ7h7HnR4g=;
        b=mJdmH/PgADwHZb9dpDAVR35oif0Fg4OOUkKMJLddo9F22Zglz0AVBHGdjIMSJHrwbe
         mUI6JCAPOnWeH1Xzi5rBtnaRKm2tZq5LzaClwPXMQ8ROPglGO02cfBO5I8hXD75+uErF
         sjQp6QFibpTQU2NHtTdt5BdBtiAiHaH8pcrEaksUYgaW3yCvxauKqCgcMbUIOoJh8HBW
         J0gtCNQCC4ncUDoXIrt24XHrygocUpRvzLjXO7OWwIVxPkGMgFaaK+leG4OlR1FKCmEX
         cX65SrlUOxIwJZf2bwEUDCFVkQgqx+L+xs/i2BkT7Kxzxii+EJW8L23CWaXiNts8CATa
         NbSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIrQfsIRpQTQzA+JsT14d+IbZ4ADPV0PAO8G+UDVjZ7XSHwL8iYYtjj9m9mPlxpX25CkRG7HqWhQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxsiLO9H6BrP8++E3HyGh+LvCCaRnSV9XEqMdvB97XvaqxieoBA
	H5KQSG6waBq/wC+qK/CFkkT2JCk9wuFvWergWfsUfH/9xlHLn0mj+7/imP0isRU=
X-Gm-Gg: ASbGncsHsLdqE/8bpYiW6iqkjrhp58DAN+SU0XacbahwF6mb6Xeb19wLm90D0W9ssmm
	oDATLRzxZgrVamoqvh+hsRTXW3417AdJItwFknwYaIgh6447k2WUdJ3vFuKIA3lj3A/AOLGyOwj
	MTy3/RRCp+725v+3oaONH97f8BVvv3WSB/s0SJV9IL/pUdMEn83DhuMhbbA343UMxgQGEWIxeH6
	KhAd148da5AR423llVNSHWnWGj5tmwo3im8W8wWhhKfcqn7a+/FAznaiGIX5yDGjcQad1yNMhqW
	kH+rL/mrUQR/6TMzR/1K6bmZ64ynLA0KC9K1W23Q5YfOqiXpWu+hRIjviam1HZjPA0aL4cFcwhw
	lQU320djCZ7bEe6li3umqef5f
X-Google-Smtp-Source: AGHT+IHzgkKPo3rteT6o1FQjeZVctNmK9CtfxtQBm7TMKIVPM8zC+qltuaZQi09FYGKSfneN1EH7HA==
X-Received: by 2002:a05:6602:4145:b0:85b:3885:1592 with SMTP id ca18e2360f4ac-8617cc32960mr1403266539f.10.1744658243876;
        Mon, 14 Apr 2025 12:17:23 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e026d1sm2715662173.94.2025.04.14.12.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 12:17:23 -0700 (PDT)
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
Subject: [PATCH v4 2/7] clk: spacemit: rename spacemit_ccu_data fields
Date: Mon, 14 Apr 2025 14:17:09 -0500
Message-ID: <20250414191715.2264758-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250414191715.2264758-1-elder@riscstar.com>
References: <20250414191715.2264758-1-elder@riscstar.com>
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

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index a55957806db31..4db91c1b1d280 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -130,8 +130,8 @@
 #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
 
 struct spacemit_ccu_data {
-	struct clk_hw **hws;
-	size_t num;
+	struct clk_hw **clk_hws;
+	size_t clk_num;
 };
 
 /* APBS clocks start, APBS region contains and only contains all PLL clocks */
@@ -819,8 +819,8 @@ static struct clk_hw *k1_ccu_pll_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_pll_data = {
-	.hws	= k1_ccu_pll_hws,
-	.num	= ARRAY_SIZE(k1_ccu_pll_hws),
+	.clk_hws	= k1_ccu_pll_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_pll_hws),
 };
 
 static struct clk_hw *k1_ccu_mpmu_hws[] = {
@@ -860,8 +860,8 @@ static struct clk_hw *k1_ccu_mpmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
-	.hws	= k1_ccu_mpmu_hws,
-	.num	= ARRAY_SIZE(k1_ccu_mpmu_hws),
+	.clk_hws	= k1_ccu_mpmu_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_mpmu_hws),
 };
 
 static struct clk_hw *k1_ccu_apbc_hws[] = {
@@ -968,8 +968,8 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apbc_data = {
-	.hws	= k1_ccu_apbc_hws,
-	.num	= ARRAY_SIZE(k1_ccu_apbc_hws),
+	.clk_hws	= k1_ccu_apbc_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_apbc_hws),
 };
 
 static struct clk_hw *k1_ccu_apmu_hws[] = {
@@ -1038,8 +1038,8 @@ static struct clk_hw *k1_ccu_apmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apmu_data = {
-	.hws	= k1_ccu_apmu_hws,
-	.num	= ARRAY_SIZE(k1_ccu_apmu_hws),
+	.clk_hws	= k1_ccu_apmu_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_apmu_hws),
 };
 
 static int spacemit_ccu_register(struct device *dev,
@@ -1050,13 +1050,13 @@ static int spacemit_ccu_register(struct device *dev,
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
 
@@ -1081,7 +1081,7 @@ static int spacemit_ccu_register(struct device *dev,
 		clk_data->hws[i] = hw;
 	}
 
-	clk_data->num = data->num;
+	clk_data->num = data->clk_num;
 
 	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
 	if (ret)
-- 
2.45.2

