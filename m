Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161C825A323
	for <spacemit@lists.linux.dev>; Thu, 24 Jul 2025 20:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753388726; cv=none; b=lUar8nRszTPb+K4OoD5w4kSJqkuhLtETofl8YB4rA/mFy0bfTuWhB2vMoH/B3AFNbRJCRaIoAhZypiRFOFre2hd84Zx9UWb2vZu4NcmzjpCQn8ntmt+sCMke23c26EMQl7aQnl0CBrgIL8NO3d66YDsLbwnTiD829/PH9ofqsBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753388726; c=relaxed/simple;
	bh=9yAQfyGYVLXyfkkTfqeVQq5G8Mv2h6aGEzS6CgeOAAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BFda47AAiur/ju8GD9XVp1/oQX/1NGUOuzQntCiYt4XFzTMVFAZalhs3A9nfWUy9jbRyXRjQCTLcciPRcWZrnadmNd/LmDqPeMDT0dDANLmfjgllWsUVkjCC5JtKp+Pl5Y30i3WcVC8ZTIqctT3d074lS/4bcZvcG6AGESo1ODA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=GY7qXG5n; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="GY7qXG5n"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-87c4bacb68eso43731939f.3
        for <spacemit@lists.linux.dev>; Thu, 24 Jul 2025 13:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753388723; x=1753993523; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lc2aqqc97NOP0EfL+BSZC9Lj19cWycz2K5gJfriPT8I=;
        b=GY7qXG5nm7VsU8tnDEMUntAN8G7dyEHfVUhmJoT3WaPtVznP4t0909qePjwaxoBskN
         M9sWXYIGuhMuCdxqrVVqWcUiagi6ZIhLHPAq6UjT5cA41EINYNeyXdnb254OKoWRn3Oh
         +LKzI7+7JcX6tfd2O6cvPAIoyfkOn3ybZgXKPUm0FCVEriHZm9zoT36vgRcqcMo8Ash9
         anpYXJRS7LUpxOESZwqH8yKRwSw8h/N+9Jo4dC690TEaYkaTno640/aBnhqdkgTpwzHo
         xVRwNwt6RF7nJj3Xu6nE++3lWV69prhVHDRcDRrEoVERIYx+F0tSD/JeV0vm8eBntTIO
         JDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753388723; x=1753993523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lc2aqqc97NOP0EfL+BSZC9Lj19cWycz2K5gJfriPT8I=;
        b=qjfrQ06T3cHwez+XAJ9gDEEAkNQ5gi5KRmCBWeHnOz8XoKfKw8MYq4kdkgfTHUUsOd
         3fuSp/e1WnVWvOLW1ZSKPWDwfW1EHAL4cupbjtrlnDzjcuoDYAOYnDZoVlx60wK+u7m8
         HpFPR5Inn4J7SUL1vy7lK9t/hgwOwGkoqB8L+UydDd8HnPLdoxtArRJwHY4EFbq90ymd
         VKm4GWRVNjWXvQhG1XCIa3ZcWDcKoUVh6QU54LJvi/GPrYwSVy4tV6Ykrh/qcMG0qflQ
         eOKu3dS2IJ4d1vo7XtQOTrhfous7QRHItjkfq5QKhbFI7GyDkS8G2/o7/ntUew0Psu2D
         PYNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4CqP2dY9ymoNAyqXUnrMAWrjGe31ZJjD4OBa9uSmB00LQMnHfBgCs3UPfNg8NWu0b/H/mjjLXcw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+Pqf+InTgnZ5JQT3+Lctbj3kIXfT4l+T5ppSX8wAftIBGdmkd
	SpfPsbMQApmQPyugJqYcd+d/UVfgXn/jsyNGhaCyQO6dYiQ5bacSz+5c1m4K99poxto=
X-Gm-Gg: ASbGncs6Z3BraMvTSPfT6EqUoSi04grjDB189TwUNFVyYs01/XOgfk6hBaTxM/GQoEa
	NtQ/LDxsya7px4VqGuRkJvr1ThFVyA9lUOQkkb2diap1rbh2qRbReyrNMBemV2gGhwpn7M934jI
	CBx9uWZ2r4lnpnzder1/u0pGv//bc3BSIHVeL+S3JpV1ju9Zi9gO9LhT6vAjySqyoZzcCgV2Jfu
	+Q1ZmR83OftZb7bd+dGELRU9GGkWLuiKffOpFexpW/QW46mDnr0dssg/tE/MAljr4lakCEI7qgc
	Ff27L3cVYczXFYL45ZntOGV3uSsMp3dN35AMJnfwl+2OAV9VmARyZC2+BrIWW3POjljgOFsi5aE
	O7soIF0aurM3nYxoMsIHlJV61u19QMwovApXlPA2O
X-Google-Smtp-Source: AGHT+IG5crWSYMqOT4gzv3/s0kwhaMnMRggcqK/SrWQWiRkfz5Jy1E/lYbJb+xTUBrb7PdJVKYvuFQ==
X-Received: by 2002:a05:6602:3710:b0:876:19b9:1aaa with SMTP id ca18e2360f4ac-87c65037cbamr1427124639f.9.1753388723127;
        Thu, 24 Jul 2025 13:25:23 -0700 (PDT)
Received: from zoltan.localdomain ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-87c74316a3bsm63080239f.23.2025.07.24.13.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 13:25:22 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux.amoon@gmail.com,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 4/8] regulator: spacemit: support SpacemiT P1 regulators
Date: Thu, 24 Jul 2025 15:25:05 -0500
Message-ID: <20250724202511.499288-5-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724202511.499288-1-elder@riscstar.com>
References: <20250724202511.499288-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the regulators found in the SpacemiT P1 PMIC.  This
PMIC provides 6 buck converters and 12 LDO regulators.

The PMIC is implemented as a multi-function device.  These regulators
are probed based on this driver being named in a MFD cell in the simple
MFD I2C driver.

Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/Kconfig       |  12 +++
 drivers/regulator/Makefile      |   1 +
 drivers/regulator/spacemit-p1.c | 157 ++++++++++++++++++++++++++++++++
 3 files changed, 170 insertions(+)
 create mode 100644 drivers/regulator/spacemit-p1.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 7423954153b07..3e7feeebf8aca 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1395,6 +1395,18 @@ config REGULATOR_SLG51000
 	  The SLG51000 is seven compact and customizable low dropout
 	  regulators.
 
+config REGULATOR_SPACEMIT_P1
+	tristate "SpacemiT P1 regulators"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	select MFD_SPACEMIT_P1
+	default ARCH_SPACEMIT
+	help
+	  Enable support for regulators implemented by the SpacemiT P1
+	  power controller.  The P1 implements 6 high-efficiency buck
+	  converters and 12 programmable LDO regulators.  To compile this
+	  driver as a module, choose M here.  The module will be called
+	  "spacemit-pmic".
+
 config REGULATOR_STM32_BOOSTER
 	tristate "STMicroelectronics STM32 BOOSTER"
 	depends on ARCH_STM32 || COMPILE_TEST
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index be98b29d6675d..278f5b8d1c7d7 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -162,6 +162,7 @@ obj-$(CONFIG_REGULATOR_S5M8767) += s5m8767.o
 obj-$(CONFIG_REGULATOR_SC2731) += sc2731-regulator.o
 obj-$(CONFIG_REGULATOR_SKY81452) += sky81452-regulator.o
 obj-$(CONFIG_REGULATOR_SLG51000) += slg51000-regulator.o
+obj-$(CONFIG_REGULATOR_SPACEMIT_P1) += spacemit-p1.o
 obj-$(CONFIG_REGULATOR_STM32_BOOSTER) += stm32-booster.o
 obj-$(CONFIG_REGULATOR_STM32_VREFBUF) += stm32-vrefbuf.o
 obj-$(CONFIG_REGULATOR_STM32_PWR) += stm32-pwr.o
diff --git a/drivers/regulator/spacemit-p1.c b/drivers/regulator/spacemit-p1.c
new file mode 100644
index 0000000000000..d437e6738ea1e
--- /dev/null
+++ b/drivers/regulator/spacemit-p1.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for regulators found in the SpacemiT P1 PMIC
+ *
+ * Copyright (C) 2025 by RISCstar Solutions Corporation.  All rights reserved.
+ * Derived from code from SpacemiT.
+ *	Copyright (c) 2023, SPACEMIT Co., Ltd
+ */
+
+#include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/linear_range.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/driver.h>
+
+#define MOD_NAME	"spacemit-p1-regulator"
+
+enum p1_regulator_id {
+	P1_BUCK1,
+	P1_BUCK2,
+	P1_BUCK3,
+	P1_BUCK4,
+	P1_BUCK5,
+	P1_BUCK6,
+
+	P1_ALDO1,
+	P1_ALDO2,
+	P1_ALDO3,
+	P1_ALDO4,
+
+	P1_DLDO1,
+	P1_DLDO2,
+	P1_DLDO3,
+	P1_DLDO4,
+	P1_DLDO5,
+	P1_DLDO6,
+	P1_DLDO7,
+};
+
+static const struct regulator_ops p1_regulator_ops = {
+	.list_voltage		= regulator_list_voltage_linear_range,
+	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+	.set_voltage_time_sel   = regulator_set_voltage_time_sel,
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.is_enabled		= regulator_is_enabled_regmap,
+};
+
+/* Selector value 255 can be used to disable the buck converter on sleep */
+static const struct linear_range p1_buck_ranges[] = {
+	REGULATOR_LINEAR_RANGE(500000, 0, 170, 5000),
+	REGULATOR_LINEAR_RANGE(1375000, 171, 254, 25000),
+};
+
+/* Selector value 0 can be used for suspend */
+static const struct linear_range p1_ldo_ranges[] = {
+	REGULATOR_LINEAR_RANGE(500000, 11, 127, 25000),
+};
+
+/* These define the voltage selector field for buck and LDO regulators */
+#define BUCK_MASK		GENMASK(7, 0)
+#define LDO_MASK		GENMASK(6, 0)
+
+#define P1_ID(_TYPE, _n)	P1_ ## _TYPE ## _n
+#define P1_ENABLE_REG(_off, _n)	((_off) + 3 * ((_n) - 1))
+
+#define P1_REG_DESC(_TYPE, _type, _n, _s, _off, _mask, _nv, _ranges)	\
+	{								\
+		.name			= #_type #_n,			\
+		.supply_name		= _s,				\
+		.of_match		= of_match_ptr(#_type #_n),	\
+		.regulators_node	= of_match_ptr("regulators"),	\
+		.id			= P1_ID(_TYPE, _n),		\
+		.n_voltages		= _nv,				\
+		.ops			= &p1_regulator_ops,		\
+		.owner			= THIS_MODULE,			\
+		.linear_ranges		= _ranges,			\
+		.n_linear_ranges	= ARRAY_SIZE(_ranges),		\
+		.vsel_reg		= P1_ENABLE_REG(_off, _n) + 1,	\
+		.vsel_mask		= _mask,			\
+		.enable_reg		= P1_ENABLE_REG(_off, _n),	\
+		.enable_mask		= BIT(0),			\
+	}
+
+#define P1_BUCK_DESC(_n) \
+	P1_REG_DESC(BUCK, buck, _n, "vcc", 0x47, BUCK_MASK, 254, p1_buck_ranges)
+
+#define P1_ALDO_DESC(_n) \
+	P1_REG_DESC(ALDO, aldo, _n, "vcc", 0x5b, LDO_MASK, 117, p1_ldo_ranges)
+
+#define P1_DLDO_DESC(_n) \
+	P1_REG_DESC(DLDO, dldo, _n, "buck5", 0x67, LDO_MASK, 117, p1_ldo_ranges)
+
+static const struct regulator_desc p1_regulator_desc[] = {
+	P1_BUCK_DESC(1),
+	P1_BUCK_DESC(2),
+	P1_BUCK_DESC(3),
+	P1_BUCK_DESC(4),
+	P1_BUCK_DESC(5),
+	P1_BUCK_DESC(6),
+
+	P1_ALDO_DESC(1),
+	P1_ALDO_DESC(2),
+	P1_ALDO_DESC(3),
+	P1_ALDO_DESC(4),
+
+	P1_DLDO_DESC(1),
+	P1_DLDO_DESC(2),
+	P1_DLDO_DESC(3),
+	P1_DLDO_DESC(4),
+	P1_DLDO_DESC(5),
+	P1_DLDO_DESC(6),
+	P1_DLDO_DESC(7),
+};
+
+static int p1_regulator_probe(struct platform_device *pdev)
+{
+	struct regulator_config config = { };
+	struct device *dev = &pdev->dev;
+	u32 i;
+
+	/*
+	 * The parent device (PMIC) owns the regmap.  Since we don't
+	 * provide one in the config structure, that one will be used.
+	 */
+	config.dev = dev->parent;
+
+	for (i = 0; i < ARRAY_SIZE(p1_regulator_desc); i++) {
+		const struct regulator_desc *desc = &p1_regulator_desc[i];
+		struct regulator_dev *rdev;
+
+		rdev = devm_regulator_register(dev, desc, &config);
+		if (IS_ERR(rdev))
+			return dev_err_probe(dev, PTR_ERR(rdev),
+					     "error registering regulator %s\n",
+					     desc->name);
+	}
+
+	return 0;
+}
+
+static struct platform_driver p1_regulator_driver = {
+	.probe = p1_regulator_probe,
+	.driver = {
+		.name = MOD_NAME,
+	},
+};
+
+module_platform_driver(p1_regulator_driver);
+
+MODULE_DESCRIPTION("SpacemiT P1 regulator driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" MOD_NAME);
-- 
2.43.0

