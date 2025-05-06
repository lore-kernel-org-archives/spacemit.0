Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193D3218AD7
	for <spacemit@lists.linux.dev>; Tue,  6 May 2025 21:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746565613; cv=none; b=CT83zrl/sAsPSQLGoqwkBZSer60ju4vsbRYfVf92X0W9Yj+TcqETVos3EMEWoTG9/wwYhbb6UPKvW0ioJdb20dbXtYVBeJl1l7W3rdaeWDL3F1XlvCKR6s4Mf0E5//Fm0Abun/xCV2GqDBiAr2AUU5DMINqwyoEAGmdkxK7Zp24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746565613; c=relaxed/simple;
	bh=Q9A7ivkauVlgucb1lRiZVv7VAIqJk0Dt1cBSdIS+1MA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pXBLLoP0+1Wrg1FQZsi5Fq+k+PpMrq80gzmbXmOnrKT28hfIBgT7ZnySpl8lRPf2BHBZUuEj0hlOuk0hKehecy7/IJ2PVVVJXQuSbxtptkarWo4NlePRb6fkiIPIibEHgEhCo67WqREtEookxm+D/pCinQPTefrFMP5CPidu6s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=enkhQv6U; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="enkhQv6U"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3d8020ba858so32216125ab.0
        for <spacemit@lists.linux.dev>; Tue, 06 May 2025 14:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746565609; x=1747170409; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jme2oFU9Z+jcmGst64hAoFvbFfUFjd99f802R0svshY=;
        b=enkhQv6U5U0h5A08kg1Oc4A3AevM8w3i8dIui5WSECbZc4PT+YpNRFLgRcm48ZHrnB
         TDclPaYVI/pHgXYceCUnZiKaygFlLVN3jCZ8jNGIQKsWMOawbzdb3Ppj9EwX9rxTr6/Q
         Nov9Miy5Z3xSM1Mfu9deMNaKXp9HVKmq9Ejg70RCWUhRyoavSgYmKj/F4ojPmP1KWEC7
         Ac7/AqyZBWP4ro4eo9qF3A0bvkgNRGURug0JmAK55L/LAliL/HqZjv1aW8SV++3ummOX
         GrZObaZs30n0hQ8HfWv44bIXe2wx2UaHipLMoTaJPQ+VjesVj1JMfjdihUMWacTu8BRm
         phHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746565609; x=1747170409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jme2oFU9Z+jcmGst64hAoFvbFfUFjd99f802R0svshY=;
        b=NqRi3iuzGYeC65X+vSUhAzKj43HOSdUN8ed3Tctx77jSlnsMvDxdxkiz17eMsvxhnz
         W71y7YfrW2B+Aet4XWGJgmglBv2LCyNBebbpg1J/qv3BpGbyqa+NpAnNa+G8Gxjt+YyD
         pVK2KaWv8NYukwVu6v9nfxR/ilqBHrGIUjz+AnM7MuylMU1FyyGFrpElUkQ9cx3AFRyF
         pNT17gCGWk9gH0kmAPw/uWljBUVVKjN5sPG2xbs6fKmRWPbu/eclfhBemrsK9+/B8wDD
         amjLYnqlu1ji20c9UPQ/rjCmnjCpmyGjZob0wkKiAtTLdp+2a2rgj7y7zrWKPFgcDCea
         O0/A==
X-Forwarded-Encrypted: i=1; AJvYcCVxCI83bZxjftfQzIly8I770+1ezDY2WVV9PnAIDsJjQJnKJd3gOgZ1Wsv6FleqM6Z8/IDOuh1W6w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx19liahHvtSlUG18JzvmepUqehpDzDa3velccLIQcxYca9gdc3
	Fcp8as3WlLAqgGzdtXbFh5OO3V0iGzy4WaZSxjCdN3OjRinNcB9AdxGtzGRBsHo=
X-Gm-Gg: ASbGncuhtomFIT24iMWuU1gAGBpEN4eX/AYbxs0D86gbBFKdQe0uUYe44VutdHNl8PI
	QpPzC2e+H0ybvz8aNRNAQsp86e3CPJX+S3AqitbwZqgqr2Uipul7UVkp9aFEACREukv6VBvYsWr
	hBZNer2sCv2sNgLS7+tU8tBX4T2jC40TBRoPoapHrCkgVH9yMUt4zsaPW6OyVi6v95bqIVhXCDI
	6KlU/2o8ktyJVhi5FPx1jW+eroirj0K2pVbqUufA30SMLAAFMJJ3e5mdr7ieDSIJ3AZ7LhTGGii
	3aPFNSt4gkmpN375kP1ONTkpp7bOcgQMxX8b9tSi4tWMAP/D2sSgLytamGIwx7dQFQ5BnZ02X9e
	VFGP251hB/VSDbw==
X-Google-Smtp-Source: AGHT+IGYwKA4uXQW3ijIOTs5HDkFa1SjzFI8ZE8DNwl6JYQYd64vEUmEQBbyVONgtUbEbjRZVgQbwg==
X-Received: by 2002:a05:6e02:1c2c:b0:3d8:1d7c:e192 with SMTP id e9e14a558f8ab-3da738f849emr8607825ab.7.1746565607731;
        Tue, 06 May 2025 14:06:47 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88aa588basm2419559173.79.2025.05.06.14.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 14:06:47 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/6] clk: spacemit: set up reset auxiliary devices
Date: Tue,  6 May 2025 16:06:34 -0500
Message-ID: <20250506210638.2800228-4-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250506210638.2800228-1-elder@riscstar.com>
References: <20250506210638.2800228-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new reset_name field to the spacemit_ccu_data structure.  If it is
non-null, the CCU implements a reset controller, and the name will be
used as the name for the auxiliary device that implements it.

Define a new type to hold an auxiliary device as well as the regmap
pointer that will be needed by CCU reset controllers.  Set up code to
initialize and add an auxiliary device for any CCU that implements reset
functionality.

Make it optional for a CCU to implement a clock controller.  This
doesn't apply to any of the existing CCUs but will for some new ones
that will be added soon.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c | 85 +++++++++++++++++++++++++++++++----
 include/soc/spacemit/ccu_k1.h | 12 +++++
 2 files changed, 89 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 9545cfe60b92b..6b1845e899e5f 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/array_size.h>
+#include <linux/auxiliary_bus.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/mfd/syscon.h>
@@ -21,6 +22,7 @@
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
 
 struct spacemit_ccu_data {
+	const char *reset_name;
 	struct clk_hw **hws;
 	size_t num;
 };
@@ -710,6 +712,7 @@ static struct clk_hw *k1_ccu_pll_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_pll_data = {
+	/* The PLL CCU implements no resets */
 	.hws	= k1_ccu_pll_hws,
 	.num	= ARRAY_SIZE(k1_ccu_pll_hws),
 };
@@ -751,8 +754,9 @@ static struct clk_hw *k1_ccu_mpmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
-	.hws	= k1_ccu_mpmu_hws,
-	.num	= ARRAY_SIZE(k1_ccu_mpmu_hws),
+	.reset_name	= "mpmu-reset",
+	.hws		= k1_ccu_mpmu_hws,
+	.num		= ARRAY_SIZE(k1_ccu_mpmu_hws),
 };
 
 static struct clk_hw *k1_ccu_apbc_hws[] = {
@@ -859,8 +863,9 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apbc_data = {
-	.hws	= k1_ccu_apbc_hws,
-	.num	= ARRAY_SIZE(k1_ccu_apbc_hws),
+	.reset_name	= "apbc-reset",
+	.hws		= k1_ccu_apbc_hws,
+	.num		= ARRAY_SIZE(k1_ccu_apbc_hws),
 };
 
 static struct clk_hw *k1_ccu_apmu_hws[] = {
@@ -929,8 +934,9 @@ static struct clk_hw *k1_ccu_apmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apmu_data = {
-	.hws	= k1_ccu_apmu_hws,
-	.num	= ARRAY_SIZE(k1_ccu_apmu_hws),
+	.reset_name	= "apmu-reset",
+	.hws		= k1_ccu_apmu_hws,
+	.num		= ARRAY_SIZE(k1_ccu_apmu_hws),
 };
 
 static int spacemit_ccu_register(struct device *dev,
@@ -941,6 +947,10 @@ static int spacemit_ccu_register(struct device *dev,
 	struct clk_hw_onecell_data *clk_data;
 	int i, ret;
 
+	/* Nothing to do if the CCU does not implement any clocks */
+	if (!data->hws)
+		return 0;
+
 	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
 				GFP_KERNEL);
 	if (!clk_data)
@@ -981,9 +991,63 @@ static int spacemit_ccu_register(struct device *dev,
 	return ret;
 }
 
+static void spacemit_cadev_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	kfree(to_spacemit_ccu_adev(adev));
+}
+
+static void spacemit_adev_unregister(void *data)
+{
+	struct auxiliary_device *adev = data;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+static int spacemit_ccu_reset_register(struct device *dev,
+				       struct regmap *regmap,
+				       const char *reset_name)
+{
+	struct spacemit_ccu_adev *cadev;
+	struct auxiliary_device *adev;
+	static u32 next_id;
+	int ret;
+
+	/* Nothing to do if the CCU does not implement a reset controller */
+	if (!reset_name)
+		return 0;
+
+	cadev = devm_kzalloc(dev, sizeof(*cadev), GFP_KERNEL);
+	if (!cadev)
+		return -ENOMEM;
+	cadev->regmap = regmap;
+
+	adev = &cadev->adev;
+	adev->name = reset_name;
+	adev->dev.parent = dev;
+	adev->dev.release = spacemit_cadev_release;
+	adev->dev.of_node = dev->of_node;
+	adev->id = next_id++;
+
+	ret = auxiliary_device_init(adev);
+	if (ret)
+		return ret;
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
+}
+
 static int k1_ccu_probe(struct platform_device *pdev)
 {
 	struct regmap *base_regmap, *lock_regmap = NULL;
+	const struct spacemit_ccu_data *data;
 	struct device *dev = &pdev->dev;
 	int ret;
 
@@ -1012,11 +1076,16 @@ static int k1_ccu_probe(struct platform_device *pdev)
 					     "failed to get lock regmap\n");
 	}
 
-	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap,
-				    of_device_get_match_data(dev));
+	data = of_device_get_match_data(dev);
+
+	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap, data);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register clocks\n");
 
+	ret = spacemit_ccu_reset_register(dev, base_regmap, data->reset_name);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register resets\n");
+
 	return 0;
 }
 
diff --git a/include/soc/spacemit/ccu_k1.h b/include/soc/spacemit/ccu_k1.h
index 7df75043e78af..8b2581fb3055d 100644
--- a/include/soc/spacemit/ccu_k1.h
+++ b/include/soc/spacemit/ccu_k1.h
@@ -2,6 +2,18 @@
 
 /* SpacemiT clock and reset driver definitions for the K1 SoC */
 
+/* Auxiliary device used to represent a CCU reset controller */
+struct spacemit_ccu_adev {
+	struct auxiliary_device adev;
+	struct regmap *regmap;
+};
+
+static inline struct spacemit_ccu_adev *
+to_spacemit_ccu_adev(struct auxiliary_device *adev)
+{
+	return container_of(adev, struct spacemit_ccu_adev, adev);
+}
+
 /* APBS register offset */
 #define APBS_PLL1_SWCR1			0x100
 #define APBS_PLL1_SWCR2			0x104
-- 
2.45.2

