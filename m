Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF96A47BCEC
	for <spacemit@lists.linux.dev>; Thu,  8 Jan 2026 14:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767882197; cv=none; b=SVI7vcKmxBdt/A2N+jhNLkp/d+f7IPAwWaKlTYDKiqZNiPPG9JxwAlesUSQCSOy6dpqWq/tw+XI/s/wmrsZP2iLSTJ0t/iUS5b6dNC15cngM/2Rz+1WDZdwcwQkuedx91ftqAu6WUKYVRuZ1xuICNWZMboGeTHKX861fAptesEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767882197; c=relaxed/simple;
	bh=f5ClC5mG4GcVXz7wL0WuqoU4Bj74MmSUh43rHPKY8Oc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UF0j52cmWZ3COOFLEAgHoztx3uy7FFZXRJ5wXMjMKa+0tjbWQdiy4E6sId0T89WWKgTVMZIoFZA4W/PGSWwJ1U8lQCAs3FHwbh2uDW8WmgwbIR079iuAooZio+QwvOA2TvAN7d7R2SnxyqzEOUoRrGNNpb0o6vzkwtx8NgJDcT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=GdfCsFfm; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="GdfCsFfm"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7aab7623f42so2815423b3a.2
        for <spacemit@lists.linux.dev>; Thu, 08 Jan 2026 06:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767882194; x=1768486994; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ek4+J5z7iMVE3UoqqZLSFX17x8G5Wc4n/tfTFWI/PHI=;
        b=GdfCsFfm0KUMVI+Y01zmeKFH5CYmc5D1n3E9DJXqhcR8Wj2X30WmNoYYNb91tXOEsw
         vtVqvsxiMgitrQYh7uu++rSJY+vd1LoM+uHaT8q1rIiN1tbRi9hulG8CQdG/sJGBjpOs
         mVZ1CHS9VAZL0Tvc2AMC5Kah/1cU2RBQgXWK2W7rsX0jwXH+FsCQ3nndbbLR9bI5aOGI
         hg/T05d6Risy6l7RGHUcd4Y42Qgs3h1Vu198hXfzZ04XkiOQDP2L2CQ61m8jVOcCJhdV
         Ev05eeyUh3AX3SG3mV2lBiQKIQWEGcy/bfDQiax9xKDAqbOf/6WWoj7F3zKrdlXThzEr
         VHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767882194; x=1768486994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ek4+J5z7iMVE3UoqqZLSFX17x8G5Wc4n/tfTFWI/PHI=;
        b=pGkLK1oyJcr5hR3VUOuo0KGOxj+xIvgFuAs17VDeoQjjmzoATdwTbgpM6fKJo2E1eK
         KaKYtcDDs+A5oXayZsUWDLsxamX37kpe8q+rgQNyn9gI30MPHAmT0UOq66lUQA1Ezkab
         APmfIOE52QWc2CNjTYvrl1y+HdVDzGCZqdPColNI9TktEC4DqoghW4QMHBjHhVCBR1kz
         9L4kTzCT81iWcfwRmxvSg4mPzX+HTpR4NQSRlvuctkKUlIPIjxK38jBNCGJrFz9nmtg0
         B4w/BoU6T0SMee+zA4XUgXpeQQp85I167SACow5YD2X0nUxTPJb3sLsEkiCBUhodDlyh
         dzRg==
X-Forwarded-Encrypted: i=1; AJvYcCUngM+bVL0BvqTzTQ6Z3prOYi1Xvr88uesIV23psHcnzXUkXvfC1oDLroiYNUBIHEk+bk1VgbPBng==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUmecj7a/zRqI1PmxVbGBPnDgNGDoj8nCpRkAXakx9YnAO7eoi
	O6/aYFhdo2HO5GpYMydKLsTGKwPlk0SwRx09tHgpAnsnXLirRyoTg69kqRCobn6ZTPg=
X-Gm-Gg: AY/fxX4Ett+zzd6ifaLWgMEvoVnPBujswKt6MK7jYgG2PhCle/2JneGMMMETI86HTbg
	bFgjKmyrVwUwo9pteYYWrtdwrU4Ildm5pqP8yzFWmV750a9KW5C/20rJIMzD+WEeBhehHQVXHZX
	dtoZGyC8U4K0m02uSS+Mf7XulnQOliblffmqxCE6pF6vfbjCXxp/PuDK3SzD/rO8qnvoWH9K6w7
	2VVQxNCYx+NHJnrQqL0jXV1BXyz2uAkujVzncv3HSdEabo8qvKVdBI5uuxld+dvffQSc7QroD/G
	C+8/z+UM53En1RKIOzel2hDz8MWPBPy8SgQp0wyTFO3GBqsg9dkfgpy4gRSVhGcXSjcibLGDwYQ
	rd1IJz9RZKBHD1fm0WG4YyY6ubvEZjNPS/zEAOPqLN66la6T+9TZhj08IlZDpY86dYVBTn/fz7X
	JCSl1GxBPqyK24x/GeXRSqLxNcUQqPR/c=
X-Google-Smtp-Source: AGHT+IHhXo6q1QuygWc5cKoTIJxec9jU2FLWFkfZShEs9ltY9Su5Z9NN5no1InJoRxaTlcTFJckmoQ==
X-Received: by 2002:a05:6a00:218d:b0:81b:ad74:80c2 with SMTP id d2e1a72fcca58-81bad7482b2mr5683577b3a.28.1767882194137;
        Thu, 08 Jan 2026 06:23:14 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40df])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59e7c16sm7927906b3a.53.2026.01.08.06.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 06:23:13 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 08 Jan 2026 22:22:16 +0800
Subject: [PATCH v2 3/4] reset: spacemit: Extract common K1 reset code
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-k3-reset-v2-3-457df235efe9@riscstar.com>
References: <20260108-k3-reset-v2-0-457df235efe9@riscstar.com>
In-Reply-To: <20260108-k3-reset-v2-0-457df235efe9@riscstar.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Haylen Chu <heylenay@4d2.org>
Cc: Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

Extract the common reset controller code from the K1 driver into
separate reset-spacemit-common.{c,h} files to prepare for additional
SpacemiT SoCs that share the same reset controller architecture.

The common code includes handlers for reset assert and deassert
operations and probing for auxiliary bus devices.

Changes during extraction:
- Module ownership: Use dev->driver->owner instead of THIS_MODULE in
  spacemit_reset_controller_register() to correctly reference the
  calling driver's module.
- Rename spacemit_reset_ids to spacemit_k1_reset_ids.
- Define new namespace "RESET_SPACEMIT" for the exported common
  functions (spacemit_reset_probe) and update K1 driver to import it.

This prepares for additional SpacemiT SoCs (K3) that share the same reset
controller architecture.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Use dev->driver->owner for the reset controller owner instead of
    THIS_MODULE to fix the module reference counting issue pointed out
    by Krzysztof Kozlowski.
---
 drivers/reset/spacemit/Kconfig                 |  17 +++-
 drivers/reset/spacemit/Makefile                |   2 +
 drivers/reset/spacemit/reset-spacemit-common.c |  77 ++++++++++++++++++
 drivers/reset/spacemit/reset-spacemit-common.h |  42 ++++++++++
 drivers/reset/spacemit/reset-spacemit-k1.c     | 107 +++----------------------
 5 files changed, 144 insertions(+), 101 deletions(-)

diff --git a/drivers/reset/spacemit/Kconfig b/drivers/reset/spacemit/Kconfig
index 552884e8b72afeb05cdb9b6565ad8e7fd32f990b..56a4858b30e136296e1f9c85b7b13ccee91fe7b4 100644
--- a/drivers/reset/spacemit/Kconfig
+++ b/drivers/reset/spacemit/Kconfig
@@ -1,10 +1,20 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-config RESET_SPACEMIT_K1
-	tristate "SpacemiT K1 reset driver"
+menu "Reset support for SpacemiT platforms"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
-	depends on SPACEMIT_K1_CCU
+
+config RESET_SPACEMIT_COMMON
+	tristate
 	select AUXILIARY_BUS
+	help
+	  Common reset controller infrastructure for SpacemiT SoCs.
+	  This provides shared code and helper functions used by
+	  reset drivers for various SpacemiT SoC families.
+
+config RESET_SPACEMIT_K1
+	tristate "Support for SpacemiT K1 SoC"
+	depends on SPACEMIT_K1_CCU
+	select RESET_SPACEMIT_COMMON
 	default SPACEMIT_K1_CCU
 	help
 	  Support for reset controller in SpacemiT K1 SoC.
@@ -12,3 +22,4 @@ config RESET_SPACEMIT_K1
 	  unit (CCU) driver to provide reset control functionality
 	  for various peripherals and subsystems in the SoC.
 
+endmenu
diff --git a/drivers/reset/spacemit/Makefile b/drivers/reset/spacemit/Makefile
index de7e358c74fd7b0fac3ec2c18d985331af64fcbb..fecda9f211b24a54707b3f425b9325be1f2f7738 100644
--- a/drivers/reset/spacemit/Makefile
+++ b/drivers/reset/spacemit/Makefile
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_RESET_SPACEMIT_COMMON)	+= reset-spacemit-common.o
+
 obj-$(CONFIG_RESET_SPACEMIT_K1)		+= reset-spacemit-k1.o
 
diff --git a/drivers/reset/spacemit/reset-spacemit-common.c b/drivers/reset/spacemit/reset-spacemit-common.c
new file mode 100644
index 0000000000000000000000000000000000000000..0626633a5e7db6e31be4ed36505b15291eb186b1
--- /dev/null
+++ b/drivers/reset/spacemit/reset-spacemit-common.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/* SpacemiT reset controller driver - common implementation */
+
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/module.h>
+
+#include <soc/spacemit/ccu.h>
+
+#include "reset-spacemit-common.h"
+
+static int spacemit_reset_update(struct reset_controller_dev *rcdev,
+				 unsigned long id, bool assert)
+{
+	struct ccu_reset_controller *controller;
+	const struct ccu_reset_data *data;
+	u32 mask;
+	u32 val;
+
+	controller = container_of(rcdev, struct ccu_reset_controller, rcdev);
+	data = &controller->data->reset_data[id];
+	mask = data->assert_mask | data->deassert_mask;
+	val = assert ? data->assert_mask : data->deassert_mask;
+
+	return regmap_update_bits(controller->regmap, data->offset, mask, val);
+}
+
+static int spacemit_reset_assert(struct reset_controller_dev *rcdev,
+				 unsigned long id)
+{
+	return spacemit_reset_update(rcdev, id, true);
+}
+
+static int spacemit_reset_deassert(struct reset_controller_dev *rcdev,
+				   unsigned long id)
+{
+	return spacemit_reset_update(rcdev, id, false);
+}
+
+static const struct reset_control_ops spacemit_reset_control_ops = {
+	.assert		= spacemit_reset_assert,
+	.deassert	= spacemit_reset_deassert,
+};
+
+static int spacemit_reset_controller_register(struct device *dev,
+					      struct ccu_reset_controller *controller)
+{
+	struct reset_controller_dev *rcdev = &controller->rcdev;
+
+	rcdev->ops = &spacemit_reset_control_ops;
+	rcdev->owner = dev->driver->owner;
+	rcdev->of_node = dev->of_node;
+	rcdev->nr_resets = controller->data->count;
+
+	return devm_reset_controller_register(dev, &controller->rcdev);
+}
+
+int spacemit_reset_probe(struct auxiliary_device *adev,
+			 const struct auxiliary_device_id *id)
+{
+	struct spacemit_ccu_adev *rdev = to_spacemit_ccu_adev(adev);
+	struct ccu_reset_controller *controller;
+	struct device *dev = &adev->dev;
+
+	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
+	if (!controller)
+		return -ENOMEM;
+	controller->data = (const struct ccu_reset_controller_data *)id->driver_data;
+	controller->regmap = rdev->regmap;
+
+	return spacemit_reset_controller_register(dev, controller);
+}
+EXPORT_SYMBOL_NS_GPL(spacemit_reset_probe, "RESET_SPACEMIT");
+
+MODULE_DESCRIPTION("SpacemiT reset controller driver - common code");
+MODULE_LICENSE("GPL");
diff --git a/drivers/reset/spacemit/reset-spacemit-common.h b/drivers/reset/spacemit/reset-spacemit-common.h
new file mode 100644
index 0000000000000000000000000000000000000000..ffaf2f86eb39df72b079095b3f5da3622e132c8d
--- /dev/null
+++ b/drivers/reset/spacemit/reset-spacemit-common.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * SpacemiT reset controller driver - common definitions
+ */
+
+#ifndef _RESET_SPACEMIT_COMMON_H_
+#define _RESET_SPACEMIT_COMMON_H_
+
+#include <linux/auxiliary_bus.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+#include <linux/types.h>
+
+struct ccu_reset_data {
+	u32 offset;
+	u32 assert_mask;
+	u32 deassert_mask;
+};
+
+struct ccu_reset_controller_data {
+	const struct ccu_reset_data *reset_data;	/* array */
+	size_t count;
+};
+
+struct ccu_reset_controller {
+	struct reset_controller_dev rcdev;
+	const struct ccu_reset_controller_data *data;
+	struct regmap *regmap;
+};
+
+#define RESET_DATA(_offset, _assert_mask, _deassert_mask)	\
+	{							\
+		.offset		= (_offset),			\
+		.assert_mask	= (_assert_mask),		\
+		.deassert_mask	= (_deassert_mask),		\
+	}
+
+/* Common probe function */
+int spacemit_reset_probe(struct auxiliary_device *adev,
+			 const struct auxiliary_device_id *id);
+
+#endif /* _RESET_SPACEMIT_COMMON_H_ */
diff --git a/drivers/reset/spacemit/reset-spacemit-k1.c b/drivers/reset/spacemit/reset-spacemit-k1.c
index cc7fd1f8750d422f3d8f96367ae259f38418c44b..8f3b5329ea5f627ab454e15bf485b155c9f48ca5 100644
--- a/drivers/reset/spacemit/reset-spacemit-k1.c
+++ b/drivers/reset/spacemit/reset-spacemit-k1.c
@@ -1,41 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
-/* SpacemiT reset controller driver */
+/* SpacemiT K1 reset controller driver */
 
-#include <linux/auxiliary_bus.h>
-#include <linux/container_of.h>
-#include <linux/device.h>
 #include <linux/module.h>
-#include <linux/regmap.h>
-#include <linux/reset-controller.h>
-#include <linux/types.h>
 
-#include <soc/spacemit/k1-syscon.h>
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
+#include <soc/spacemit/k1-syscon.h>
 
-struct ccu_reset_data {
-	u32 offset;
-	u32 assert_mask;
-	u32 deassert_mask;
-};
-
-struct ccu_reset_controller_data {
-	const struct ccu_reset_data *reset_data;	/* array */
-	size_t count;
-};
-
-struct ccu_reset_controller {
-	struct reset_controller_dev rcdev;
-	const struct ccu_reset_controller_data *data;
-	struct regmap *regmap;
-};
-
-#define RESET_DATA(_offset, _assert_mask, _deassert_mask)	\
-	{							\
-		.offset		= (_offset),			\
-		.assert_mask	= (_assert_mask),		\
-		.deassert_mask	= (_deassert_mask),		\
-	}
+#include "reset-spacemit-common.h"
 
 static const struct ccu_reset_data k1_mpmu_resets[] = {
 	[RESET_WDT]	= RESET_DATA(MPMU_WDTPCR,		BIT(2), 0),
@@ -214,91 +186,30 @@ static const struct ccu_reset_controller_data k1_apbc2_reset_data = {
 	.count		= ARRAY_SIZE(k1_apbc2_resets),
 };
 
-static int spacemit_reset_update(struct reset_controller_dev *rcdev,
-				 unsigned long id, bool assert)
-{
-	struct ccu_reset_controller *controller;
-	const struct ccu_reset_data *data;
-	u32 mask;
-	u32 val;
-
-	controller = container_of(rcdev, struct ccu_reset_controller, rcdev);
-	data = &controller->data->reset_data[id];
-	mask = data->assert_mask | data->deassert_mask;
-	val = assert ? data->assert_mask : data->deassert_mask;
-
-	return regmap_update_bits(controller->regmap, data->offset, mask, val);
-}
-
-static int spacemit_reset_assert(struct reset_controller_dev *rcdev,
-				 unsigned long id)
-{
-	return spacemit_reset_update(rcdev, id, true);
-}
-
-static int spacemit_reset_deassert(struct reset_controller_dev *rcdev,
-				   unsigned long id)
-{
-	return spacemit_reset_update(rcdev, id, false);
-}
-
-static const struct reset_control_ops spacemit_reset_control_ops = {
-	.assert		= spacemit_reset_assert,
-	.deassert	= spacemit_reset_deassert,
-};
-
-static int spacemit_reset_controller_register(struct device *dev,
-					      struct ccu_reset_controller *controller)
-{
-	struct reset_controller_dev *rcdev = &controller->rcdev;
-
-	rcdev->ops = &spacemit_reset_control_ops;
-	rcdev->owner = THIS_MODULE;
-	rcdev->of_node = dev->of_node;
-	rcdev->nr_resets = controller->data->count;
-
-	return devm_reset_controller_register(dev, &controller->rcdev);
-}
-
-static int spacemit_reset_probe(struct auxiliary_device *adev,
-				const struct auxiliary_device_id *id)
-{
-	struct spacemit_ccu_adev *rdev = to_spacemit_ccu_adev(adev);
-	struct ccu_reset_controller *controller;
-	struct device *dev = &adev->dev;
-
-	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
-	if (!controller)
-		return -ENOMEM;
-	controller->data = (const struct ccu_reset_controller_data *)id->driver_data;
-	controller->regmap = rdev->regmap;
-
-	return spacemit_reset_controller_register(dev, controller);
-}
-
 #define K1_AUX_DEV_ID(_unit) \
 	{ \
 		.name = "spacemit_ccu.k1-" #_unit "-reset", \
 		.driver_data = (kernel_ulong_t)&k1_ ## _unit ## _reset_data, \
 	}
 
-static const struct auxiliary_device_id spacemit_reset_ids[] = {
+static const struct auxiliary_device_id spacemit_k1_reset_ids[] = {
 	K1_AUX_DEV_ID(mpmu),
 	K1_AUX_DEV_ID(apbc),
 	K1_AUX_DEV_ID(apmu),
 	K1_AUX_DEV_ID(rcpu),
 	K1_AUX_DEV_ID(rcpu2),
 	K1_AUX_DEV_ID(apbc2),
-	{ },
+	{ /* sentinel */ }
 };
-MODULE_DEVICE_TABLE(auxiliary, spacemit_reset_ids);
+MODULE_DEVICE_TABLE(auxiliary, spacemit_k1_reset_ids);
 
 static struct auxiliary_driver spacemit_k1_reset_driver = {
 	.probe          = spacemit_reset_probe,
-	.id_table       = spacemit_reset_ids,
+	.id_table       = spacemit_k1_reset_ids,
 };
 module_auxiliary_driver(spacemit_k1_reset_driver);
 
+MODULE_IMPORT_NS("RESET_SPACEMIT");
 MODULE_AUTHOR("Alex Elder <elder@kernel.org>");
-MODULE_DESCRIPTION("SpacemiT reset controller driver");
+MODULE_DESCRIPTION("SpacemiT K1 reset controller driver");
 MODULE_LICENSE("GPL");

-- 
2.43.0

