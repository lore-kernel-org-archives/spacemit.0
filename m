Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F4C2F5487
	for <spacemit@lists.linux.dev>; Mon, 29 Dec 2025 11:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767006281; cv=none; b=t9gyiVX/XVb6Q6Pn9JXrNlUefexIM/saqihasnKI4hOeb5vUUtBdIQsJEPbUjVtlZBcc7R0eDG2yXMq0UYOJSv3P/ldO7SclwkMUIolGyP/ECXl4drw1z5ujWEt1E+8XFpAPp/NloFLLf6L1gHRvNUqSHo1t/3Oophcohkmhn5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767006281; c=relaxed/simple;
	bh=RsddBKXcXNBN6uteiOLIgOTh3ySE9OyMuf3EJ4yv7QQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GqIIOp58uetQS8e3W5G3BXm4cSGv/YlSOHUTgwE0effoi9pRcJuWhcmk2z6NofX08jEGuWTvZU81JCe1bRhQKMiIw88cNj8HJnBGWFtOC8p9uMaBfxJXCBY8Cg66v9o4Qj20Ctf5GxHlAYHYN4383I35zvdBXwONn1RgDEIIbko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ecjaYy4h; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ecjaYy4h"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7ade456b6abso7273968b3a.3
        for <spacemit@lists.linux.dev>; Mon, 29 Dec 2025 03:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767006278; x=1767611078; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NutY8oGnV9Zcjg1HhCkSuN3oUX9zSpR9l+AYE5RL7so=;
        b=ecjaYy4h7RffGnq/Vddq2zZvrUF0Xsy8Xu3/HuuAHwinTvknElEra3azspkaxteXOe
         BSZM7HYWlLVhdjaL6DY+5OrHapMqkS8uaOAAZsjCPOoMd51i2UgnTI/synqjNJZhD88I
         iwPul1X2y27t5QZWC91jHbQIBP9f3K9jQO6LtIHTDf30LUxMMnyUfbcfy/P7Tv9TLTIK
         qZvyqiXNC9+QsIHrSqQ1doAG2x0JPrUeKW/fqEY5cQY1qiLnCRdk01DLXMLcsg82gjrT
         TYt1VU99HB2VIqIB36g2323D0ECgUoF7ilPPz15Nh73tCrN2wW4D9Vx+6cyXmprdkquM
         S2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767006278; x=1767611078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NutY8oGnV9Zcjg1HhCkSuN3oUX9zSpR9l+AYE5RL7so=;
        b=xNPXMdNb47UpgfWNWK+pAHccBJ1CrieynloaQ2r++nBuXw1UZBkriverkghvj1YMRk
         KyWIpm5nepbkN5WwKcIiPn8JKotDEyo+1ENZHYkocieshiI0I4S7VR+8cpQNoCoPp2YR
         sybXhblY7vO79rpB6oU/wQcWj/joTY+zHI7WBshaG+eXfLISUzSWaOgokCmxIQFDEkZL
         SUkc96JhscHgzGCB+AKPXZz+qOXp9XJ2L2lbSM4qtKpHk0h3dE6P1RfHmVQx5YRBamLw
         8+XblGgPiW5J4hTpTB+Wa0Iyx31LnjRuhdhzCpW3dk/3ZMxr3xhCWqnkqaE5NgXIo7Jy
         Sb6A==
X-Forwarded-Encrypted: i=1; AJvYcCWy1y3WtaYBS1rs3nNqkMjmD0KMqY3kH7eqg3BGRdXOS8SZbJMY4tewUvTew3GCxIciTcBZ82NfJg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0GBIQ2rdcoZmmFnfH59Y9RRJjkq6D4BrZ1D+IG2jLeNLTmz5f
	g3ASK6eifnKUv6qrFuKm1XhegyIkMGxHaVvQM5BNRbZO/9VndtjYBzB4Zmk96+/Zewk=
X-Gm-Gg: AY/fxX5U1x9O44KuPPB9AUq9MAmzKa9B/6Mgh+h/nXehLtcCxEoQ+fKactgfWxm0G8P
	vMYZiqO3f0Am+D8J5TDgYTmaAwzOV9WOJMJI0mMkGC7cD5FbfK0LevztmQFi1DCqRJ1S8FV0iV4
	w2Fr8Q9Z+pMRzFf+Mae4zvkHP1CDE6SYV6BGWJzswilw8DLML3HyPolsf9xPxfh3/q8oiiMsmdi
	LVjOcCTXc+Y3DQM+kVx3TcZxpz+cPIhu/ZhdI25dQsLuTNL7JE7s/TnWk0rfeTFsbrYCOqYGnHk
	97Uo2yCz0KyGB4LAskSycU51ILkEVoUjiGiMyc1/wvPjRUDbnpIfLyjnPgUKZHdUHbVtmOduQMo
	CtpsprSjgGe6wG7A0roH5jw0kbg6/9CRMx878n0in1laOGo/VHUFBGk2n4+fnPsl+necs+u3ckd
	BzV5lEN69KJxCM2bz5w/+c1OyDCCoc6PI=
X-Google-Smtp-Source: AGHT+IHfeiIksTtfIy4K6stcAIxC74/Hla6q+1XJihM0aXZQApg1DFbJQyfFOwjQsOzrQyXBDO74Fw==
X-Received: by 2002:a05:6a00:600c:b0:7e8:4471:8d9 with SMTP id d2e1a72fcca58-7ff66974f9amr26857864b3a.58.1767006278498;
        Mon, 29 Dec 2025 03:04:38 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40d7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7aa32916sm29338817b3a.8.2025.12.29.03.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 03:04:38 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 29 Dec 2025 19:04:06 +0800
Subject: [PATCH 3/4] reset: spacemit: Extract common K1 reset code
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-k3-reset-v1-3-eda0747bded3@riscstar.com>
References: <20251229-k3-reset-v1-0-eda0747bded3@riscstar.com>
In-Reply-To: <20251229-k3-reset-v1-0-eda0747bded3@riscstar.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3

Extract the common reset controller code from the K1 driver into
separate reset-spacemit-common.{c,h} files. This prepares for
additional SpacemiT SoCs that share the same reset controller
architecture.

The common code now includes handlers for reset assert
deassert operations and probing for auxiliary bus devices.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 drivers/reset/spacemit/Kconfig                 |  17 +++-
 drivers/reset/spacemit/Makefile                |   2 +
 drivers/reset/spacemit/reset-spacemit-common.c |  79 +++++++++++++++++
 drivers/reset/spacemit/reset-spacemit-common.h |  53 ++++++++++++
 drivers/reset/spacemit/reset-spacemit-k1.c     | 113 +++----------------------
 5 files changed, 158 insertions(+), 106 deletions(-)

diff --git a/drivers/reset/spacemit/Kconfig b/drivers/reset/spacemit/Kconfig
index 552884e8b72a..56a4858b30e1 100644
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
index de7e358c74fd..fecda9f211b2 100644
--- a/drivers/reset/spacemit/Makefile
+++ b/drivers/reset/spacemit/Makefile
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_RESET_SPACEMIT_COMMON)	+= reset-spacemit-common.o
+
 obj-$(CONFIG_RESET_SPACEMIT_K1)		+= reset-spacemit-k1.o
 
diff --git a/drivers/reset/spacemit/reset-spacemit-common.c b/drivers/reset/spacemit/reset-spacemit-common.c
new file mode 100644
index 000000000000..e4b3f0e2c59d
--- /dev/null
+++ b/drivers/reset/spacemit/reset-spacemit-common.c
@@ -0,0 +1,79 @@
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
+const struct reset_control_ops spacemit_reset_control_ops = {
+	.assert		= spacemit_reset_assert,
+	.deassert	= spacemit_reset_deassert,
+};
+EXPORT_SYMBOL_GPL(spacemit_reset_control_ops);
+
+static int spacemit_reset_controller_register(struct device *dev,
+					      struct ccu_reset_controller *controller)
+{
+	struct reset_controller_dev *rcdev = &controller->rcdev;
+
+	rcdev->ops = &spacemit_reset_control_ops;
+	rcdev->owner = THIS_MODULE;
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
+
diff --git a/drivers/reset/spacemit/reset-spacemit-common.h b/drivers/reset/spacemit/reset-spacemit-common.h
new file mode 100644
index 000000000000..9900a92f2c88
--- /dev/null
+++ b/drivers/reset/spacemit/reset-spacemit-common.h
@@ -0,0 +1,53 @@
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
+/* Common reset operations */
+extern const struct reset_control_ops spacemit_reset_control_ops;
+
+/* Common probe function */
+int spacemit_reset_probe(struct auxiliary_device *adev,
+			 const struct auxiliary_device_id *id);
+
+/* Common auxiliary device ID macro */
+#define SPACEMIT_AUX_DEV_ID(_prefix, _unit) \
+	{ \
+		.name = "spacemit_ccu." _K_RST(_unit), \
+		.driver_data = (kernel_ulong_t)&_prefix ## _ ## _unit ## _reset_data, \
+	}
+
+#endif /* _RESET_SPACEMIT_COMMON_H_ */
+
diff --git a/drivers/reset/spacemit/reset-spacemit-k1.c b/drivers/reset/spacemit/reset-spacemit-k1.c
index 8922e14fa836..111acbdb5040 100644
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
@@ -214,91 +186,26 @@ static const struct ccu_reset_controller_data k1_apbc2_reset_data = {
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
-#define K1_AUX_DEV_ID(_unit) \
-	{ \
-		.name = "spacemit_ccu." _K_RST(_unit), \
-		.driver_data = (kernel_ulong_t)&k1_ ## _unit ## _reset_data, \
-	}
+#define K1_AUX_DEV_ID(_unit) SPACEMIT_AUX_DEV_ID(k1, _unit)
 
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

