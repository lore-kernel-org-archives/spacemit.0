Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEEB20C463
	for <spacemit@lists.linux.dev>; Tue, 13 May 2025 21:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747173236; cv=none; b=vEAhIRLLYGBblpUsP4YX2DNE+ngtMid8zWWgZP/fnPzQ3iEuXfIImyBqNAJ+EzMXnBwqAj6JUTpk3PxSVdVo+HdOpSTTJfoE9rm+9uYS69qrzXd/S+rZvryK6sEv7JG+jYJtgV2QmdmyOx9zf/y1ldL1w2sw1gB7RtuTNXgox5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747173236; c=relaxed/simple;
	bh=Yykr4pXHm+eFZeLoxnQj4YQ7g7m8no0bRdRqTGC2FXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nBzf8nD68Hr1b2XBiChGd8dXzO8Pee06wvX0/XUJqodqqgdLmc0IBnhw2zq2L8ZOKH9uBlGD9xE9xkO0aBs3iRMVLbedhR4c+tE++BAt/Hb7Y3DX+PVDAT0Tl/6+oPU803+wnSZgDMozpdFRqMSixvl66fQQ2SG0crKc6ht5Z/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=YOwU7tk7; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="YOwU7tk7"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-85e751cffbeso527932939f.0
        for <spacemit@lists.linux.dev>; Tue, 13 May 2025 14:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747173234; x=1747778034; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CofZ6mxwdPQ5E5kE6D3I1SRbGpA+t1hpeEYsYL5jGT4=;
        b=YOwU7tk7KylhRdjSU65IEfRx9UMLPS9NYkFqgc1p9WBrUKr/U6Y4pWmLR5ZcfJ5Ewi
         y4p6umgKwIlKgP3fXpkBMM1wLjPl3vxgRh60/P3ErUuMxEWZPHgs6L/QU8kPGJatdIy0
         TYsR95xU9BLs7lS5CXOwEAjeYrKb1AHjnFKK+gCMA7JQt23Xb7NVEy1bUDbzIWxoVwSe
         fzkjPVno7WbTFEkENVRgCWZzosv3haImi1Nu/NDw9hxXj4iN49r0SmMaTH7zkQAM3YS5
         ucXQrT505tv0vUcZJY5L6GMWaYSZIU8AIS8XzulV5rwv6V0NIOyeaQopgG+230ofmamG
         hjrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747173234; x=1747778034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CofZ6mxwdPQ5E5kE6D3I1SRbGpA+t1hpeEYsYL5jGT4=;
        b=mJsT6gmXBrx6gNrGAiEadMGthAk1lTNx8sqk0eqpXY5kjB+jPos47yO191ilgctGXQ
         xVv2mwXn2u8fhgLEpU0/43wlitYEoZdCbR5adV2uye9OMeGollwQxIFuFO2gtdwwLyr4
         w+mqIJl2L3JRtGLjpevwPxcx74oLdZRFaG5cezovTQCZL+q+TPZr1VyulrXYye5fCREM
         94gYGs2tGHcQK0RGRut8jOW73IDMO/6jvXSTyJNm3H8krMXeDMB8P+oIn1GV+RP4vOmj
         tiOA4+MAxxWUJFCSpueGpzaZbQ2PstUAJsdf/1QAkA3lCMPfViccBqz8VzdNQz4dK6vb
         l5aQ==
X-Forwarded-Encrypted: i=1; AJvYcCULATy0jipc4aLq4Z+CfaXXalck+UKQ+fp2oSx2gzTHo0tYrVn+15hTOi5XuubEmDlW1EoGLrnd4Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMgtaCoZIsq6fC1Sjz5dUwkBCavDTB9mIIaLP3ZhEiRj1RMeFz
	6aH4Am4g/Sy903Ny/0haIUV/YxdgNWEStxGc7glMlwUwpWKrZat/jHTsWLhN4dI=
X-Gm-Gg: ASbGncufVKYFG8k4W4JwAAb4TCaZN67niUagQ6jLqQ9XYxDxDsrarY83c31GCY2AVfK
	7MbUgctuxF9fSKUCG1QrHSz0A6k4WcOnl04latdCseN2WvCS6DqG8pt5kYU8J4fEerXvUbRhLhp
	kej+e1Q2ReS3kXu+qjVTF699rFQFxVHhjw0KgpRGXVOFnrYzTPG7iBl8SWu3pAAGh4x1xNCWpRs
	JbE80+bFcHr3b1oOqQAACYcyU73Sb24VQ9o6Ycfxa0MIPpB3Hp58fEwh6P0h0J4lecIycOH3vse
	e6lt/meHV7mtbYyWe0FdANNZxhzwX7VF9E3i48wDhBrnJR2hUNLtG7xzv9vIjQAQQxXza9mhnGh
	5dMsFWtBnz88EGjh+E+Yxv4Z7
X-Google-Smtp-Source: AGHT+IE+tdGzdtN7678iU4Ivi8ODMsCF92xBzdacl7enWU++qN65n+N0dHtpayrDwOqxA6q/g4x1TA==
X-Received: by 2002:a05:6602:3a01:b0:861:d8ca:3587 with SMTP id ca18e2360f4ac-86a08dcff41mr132336939f.4.1747173233800;
        Tue, 13 May 2025 14:53:53 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-867636e0dedsm239622539f.32.2025.05.13.14.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 14:53:53 -0700 (PDT)
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
Subject: [PATCH v10 3/6] clk: spacemit: set up reset auxiliary devices
Date: Tue, 13 May 2025 16:53:41 -0500
Message-ID: <20250513215345.3631593-4-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513215345.3631593-1-elder@riscstar.com>
References: <20250513215345.3631593-1-elder@riscstar.com>
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
Reviewed-by: Haylen Chu <heylenay@4d2.org>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
---
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

