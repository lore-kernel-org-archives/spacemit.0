Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E79296FBA
	for <spacemit@lists.linux.dev>; Mon, 12 May 2025 18:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747074744; cv=none; b=dNFFXV1/BU/1dgfrX2u9WtURbefTuDqcYhUAIfiw1jIHTM8dBq8mANHtgjwzLNAb1g8kHsqCo79JSvyDfyk1LXnsW4Efc+IGTMfX9Q7suQp5q7+mtpCT1F6Cg4KHTgNzu45TV8fpz9Mr0srCLaeE2VbwgApb8asX+HWR7R+ElOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747074744; c=relaxed/simple;
	bh=xgpCiUJGtvGf1BAHGTAuudGf6F2I/Rj1q8VF0JNlic8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I5UoaCDTxIWKKw/o/AWom4HuJX2wobXfbYV7XSHUQaeFlM5M/dt93c2EGq0/aavKx4H0uWnvycfM7vJNlaLAaxNpadK0jqRPnwoycic2pczIWw1i8Rd/PJCvQ2D2CSjGzQHjVV4HKhJFGe0sKqoxtfzorUOJcFp4m4KysNg58yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=YhyBpbvG; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="YhyBpbvG"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3d93deba52fso13680115ab.0
        for <spacemit@lists.linux.dev>; Mon, 12 May 2025 11:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747074740; x=1747679540; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHuJ6WqRUAvgev7G1xc3D9GkPxjqZj5gltQE5BvIVqM=;
        b=YhyBpbvGJ9PoNJ8Ii9AMbbNu5qJmA31z905kzrMA5z6X0FsvK7aJmHimzovqwgHQb0
         NHmOy0zCOdZlANzVRWdrnYtWEUjMHK7a+ga0S0sTnBCRnb4qFam6WsHT70+DrRD2hi2Y
         tZc89q3yMUfmkjp+c9enaAURxxBh7kNDSN6PHZGNJTx/0x33CKbUDQUC8b0/27djwKnM
         sl1Q6GNcrrPIanoGfg7EhEXlfDQIH1MjPAO6sX7g7IcSYJVCHuJevGbQFPB72rsZqfcB
         eqPGUiEcfBX2TSlqhzmxNjniKJqF5J059uJYly/2zGX8ktKoMw4RScH05eXSTIrTrPMJ
         W/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747074740; x=1747679540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qHuJ6WqRUAvgev7G1xc3D9GkPxjqZj5gltQE5BvIVqM=;
        b=nmmgGWjrDevZQVJKZfxKisocSz9bepEL4wKSgQtsqNPmiojqMxi0oOZ8OdYEB1Ca1H
         wmzq8uOKEa5RHVEgcZozWB6qsrRvzdmapcUH4+M6PEWzGxsh/RAOt4hHW0tu1gZv/D5D
         u/BA27hHxUavnrzwB53+tAhZmvWmjYAZuTVWgfSsQc6edmMED275G4N769/PEYsvFB8n
         YOxmOdnT1t5jiL6EsQ9wdok51ypaLec8YG6H2qGYnwN3O6GuWUSqfoPLcecaW2LvcDfd
         25WFSx9QYQb5hKKaR5LqIel7avHTWdagZ+Ub8PiTaHoFxYRdX4zp0MS8gpPz9a86UBri
         ssaA==
X-Forwarded-Encrypted: i=1; AJvYcCUB4kc2p9a2rVRVLhfAItoe/qWDPsgL4t3t8voacVaVFNjJwVJ5B4xQ2X8L5ANf7OQvQNX0FaIFlw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwrO9IZewvnVjE8Nde2qIQaVBhXuk+tgCRDdFbwzJOtK17Ai9Ad
	0z2wkLRSSKdb+J0BilwFwGflDBGgez33AKyTq8H/6s9q9YouuU26F34dY66uqAU=
X-Gm-Gg: ASbGncuIfu6E1Ub4tJW4DTcDP06UOT6ljCDolFuBD5l0Uu0bGV14fqjGKr2d572mkXl
	7lSQb1EwOIsI2uJHCSXxtCWGqnsTRiAMs5pYe7P9CYF1V8w5oSrX2j3Yxi+jJkqazcHPyCc/kv2
	6UXXUTMMi4bjLmrdAC0wtN5lIvtrdRVhCEoMIZqDF6sP3m+BNE3JaT7dnn+xI+35Vi4Hfgmh0OB
	LkuoG7fd8Q7sh1SSL9GAaumo+t7mieZjGjrCdj/nkpiTV3/xKJfYO58qmLbyujC3BT+zZRs4dCa
	YJn+lU4o3GiuMLeYAa6WjI486JLE1JJ1u1cUHRaIpGxs5tmW9i3FgyEDIYG0rkU3j285fut/CFL
	LpJjQIgaL2Y0fJkrcY+dIT98xAEumBNFeVHY=
X-Google-Smtp-Source: AGHT+IGUH+gZ5O6Fete7qaAHDA+Q222i/nqrKcsohnG7ZuXIwBBzOkJoTzCRcfNjs5a6IdfGjvFzEg==
X-Received: by 2002:a05:6e02:2611:b0:3da:7c94:cd41 with SMTP id e9e14a558f8ab-3da7e1e7b72mr171347565ab.7.1747074740524;
        Mon, 12 May 2025 11:32:20 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa22496e9fsm1740333173.11.2025.05.12.11.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:32:20 -0700 (PDT)
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
Subject: [PATCH v9 3/6] clk: spacemit: set up reset auxiliary devices
Date: Mon, 12 May 2025 13:32:08 -0500
Message-ID: <20250512183212.3465963-4-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250512183212.3465963-1-elder@riscstar.com>
References: <20250512183212.3465963-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new reset_name field to the spacemit_ccu_data structure.  If it is
non-null, the CCU implements a reset controller, and the name will be
used in the name for the auxiliary device that implements it.

Define a new type to hold an auxiliary device as well as the regmap
pointer that will be needed by CCU reset controllers.  Set up code to
initialize and add an auxiliary device for any CCU that implements reset
functionality.

Make it optional for a CCU to implement a clock controller.  This
doesn't apply to any of the existing CCUs but will for some new ones
that will be added soon.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v9: Use ida_alloc() to assign the unique auxiliary device ID

 drivers/clk/spacemit/Kconfig     |   1 +
 drivers/clk/spacemit/ccu-k1.c    | 104 ++++++++++++++++++++++++++++---
 include/soc/spacemit/k1-syscon.h |  12 ++++
 3 files changed, 107 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
index 4c4df845b3cb2..3854f6ae6d0ea 100644
--- a/drivers/clk/spacemit/Kconfig
+++ b/drivers/clk/spacemit/Kconfig
@@ -3,6 +3,7 @@
 config SPACEMIT_CCU
 	tristate "Clock support for SpacemiT SoCs"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
+	select AUXILIARY_BUS
 	select MFD_SYSCON
 	help
 	  Say Y to enable clock controller unit support for SpacemiT SoCs.
diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 801150f4ff0f5..1c9ed434ae93e 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -5,12 +5,15 @@
  */
 
 #include <linux/array_size.h>
+#include <linux/auxiliary_bus.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
+#include <linux/idr.h>
 #include <linux/mfd/syscon.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 #include <soc/spacemit/k1-syscon.h>
 
 #include "ccu_common.h"
@@ -21,10 +24,13 @@
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
 
 struct spacemit_ccu_data {
+	const char *reset_name;
 	struct clk_hw **hws;
 	size_t num;
 };
 
+static DEFINE_IDA(auxiliary_ids);
+
 /* APBS clocks start, APBS region contains and only contains all PLL clocks */
 
 /*
@@ -710,8 +716,9 @@ static struct clk_hw *k1_ccu_pll_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_pll_data = {
-	.hws	= k1_ccu_pll_hws,
-	.num	= ARRAY_SIZE(k1_ccu_pll_hws),
+	/* The PLL CCU implements no resets */
+	.hws		= k1_ccu_pll_hws,
+	.num		= ARRAY_SIZE(k1_ccu_pll_hws),
 };
 
 static struct clk_hw *k1_ccu_mpmu_hws[] = {
@@ -751,8 +758,9 @@ static struct clk_hw *k1_ccu_mpmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
-	.hws	= k1_ccu_mpmu_hws,
-	.num	= ARRAY_SIZE(k1_ccu_mpmu_hws),
+	.reset_name	= "mpmu-reset",
+	.hws		= k1_ccu_mpmu_hws,
+	.num		= ARRAY_SIZE(k1_ccu_mpmu_hws),
 };
 
 static struct clk_hw *k1_ccu_apbc_hws[] = {
@@ -859,8 +867,9 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apbc_data = {
-	.hws	= k1_ccu_apbc_hws,
-	.num	= ARRAY_SIZE(k1_ccu_apbc_hws),
+	.reset_name	= "apbc-reset",
+	.hws		= k1_ccu_apbc_hws,
+	.num		= ARRAY_SIZE(k1_ccu_apbc_hws),
 };
 
 static struct clk_hw *k1_ccu_apmu_hws[] = {
@@ -929,8 +938,9 @@ static struct clk_hw *k1_ccu_apmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apmu_data = {
-	.hws	= k1_ccu_apmu_hws,
-	.num	= ARRAY_SIZE(k1_ccu_apmu_hws),
+	.reset_name	= "apmu-reset",
+	.hws		= k1_ccu_apmu_hws,
+	.num		= ARRAY_SIZE(k1_ccu_apmu_hws),
 };
 
 static int spacemit_ccu_register(struct device *dev,
@@ -941,6 +951,10 @@ static int spacemit_ccu_register(struct device *dev,
 	struct clk_hw_onecell_data *clk_data;
 	int i, ret;
 
+	/* Nothing to do if the CCU does not implement any clocks */
+	if (!data->hws)
+		return 0;
+
 	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
 				GFP_KERNEL);
 	if (!clk_data)
@@ -981,9 +995,74 @@ static int spacemit_ccu_register(struct device *dev,
 	return ret;
 }
 
+static void spacemit_cadev_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	ida_free(&auxiliary_ids, adev->id);
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
+	int ret;
+
+	/* Nothing to do if the CCU does not implement a reset controller */
+	if (!reset_name)
+		return 0;
+
+	cadev = kzalloc(sizeof(*cadev), GFP_KERNEL);
+	if (!cadev)
+		return -ENOMEM;
+
+	cadev->regmap = regmap;
+
+	adev = &cadev->adev;
+	adev->name = reset_name;
+	adev->dev.parent = dev;
+	adev->dev.release = spacemit_cadev_release;
+	adev->dev.of_node = dev->of_node;
+	ret = ida_alloc(&auxiliary_ids, GFP_KERNEL);
+	if (ret < 0)
+		goto err_free_cadev;
+	adev->id = ret;
+
+	ret = auxiliary_device_init(adev);
+	if (ret)
+		goto err_free_aux_id;
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
+
+err_free_aux_id:
+	ida_free(&auxiliary_ids, adev->id);
+err_free_cadev:
+	kfree(cadev);
+
+	return ret;
+}
+
 static int k1_ccu_probe(struct platform_device *pdev)
 {
 	struct regmap *base_regmap, *lock_regmap = NULL;
+	const struct spacemit_ccu_data *data;
 	struct device *dev = &pdev->dev;
 	int ret;
 
@@ -1012,11 +1091,16 @@ static int k1_ccu_probe(struct platform_device *pdev)
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
 
diff --git a/include/soc/spacemit/k1-syscon.h b/include/soc/spacemit/k1-syscon.h
index 039a448c51a07..53eff7691f33d 100644
--- a/include/soc/spacemit/k1-syscon.h
+++ b/include/soc/spacemit/k1-syscon.h
@@ -5,6 +5,18 @@
 #ifndef __SOC_K1_SYSCON_H__
 #define __SOC_K1_SYSCON_H__
 
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

