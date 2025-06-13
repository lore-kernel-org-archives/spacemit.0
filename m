Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6442C25A2C0
	for <spacemit@lists.linux.dev>; Fri, 13 Jun 2025 21:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848523; cv=none; b=J0t3XTrCZ6uo4cpaDBIaTmNwczVGAA7mCmWyCZYJOcveW2G4D2Cum4qjCjSMjCAR1f17Wkbd3QvmIXvExSpN3/K7UpeZWV4dwsEFSl7GncyZ8XJF0+E+D4Otx/VGhKib6TmssDs44y7M1K1gxcSJs5VUXze120FZYNjCULRNeuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848523; c=relaxed/simple;
	bh=/NCcF6YCEJOyMhiP8ip3TX+vLuixILptGte5tycyhEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GbFpcsbvVTqSfJopUXs6W8HfA3oZKnaQS4uvyBmV0I1PM4qRdwJMe8Nhd3r5y+4uH8jXuAKLq6UZo/HQ6QZNVJtVxKsiE16Yxyac7rpWaO8xDFxbKOE90ynqjBC4Y42rboZExWgB5LzFHE0zyLEWCFLt/Aa5dx6qd+ZTegl/tNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=QuY0JdcZ; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="QuY0JdcZ"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3ddcbe64d0dso22737705ab.3
        for <spacemit@lists.linux.dev>; Fri, 13 Jun 2025 14:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749848520; x=1750453320; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gi6K0d2gbDCkO0xyzWEymKA3zwyl78Rkz9g9qNQNf5w=;
        b=QuY0JdcZhJ2WqsFCP4zbdQ0/gwAEi0gy9TJSJZIZdNFuclPoDG1C4M1QKWSAGHZcuU
         WEtfGY6vI3O2dESDVsjpk+gitdr4ynLx9ZXGf05n9N23K+kACf5RyTbwfd5a8Qg/C0ZR
         KawMgvOCcnZufgL1g8s3UKrdxB2Eb0uGkxsQF4+QAA6TrziwjEwzOf/fqRiWNgWCIDzS
         VRuEykFjs/mAgNY0PHqtvJ6zp5Olyhh6UBu/g2QRXehgRMcZIbpPSgDxNLc+9D363dYq
         zBCK/c2rU7DrDONS3swjRcv8Jur+E5Nun7Jm5vldp1zMEtdozJASMEJ7qvw9md2oyr/a
         8vRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749848520; x=1750453320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gi6K0d2gbDCkO0xyzWEymKA3zwyl78Rkz9g9qNQNf5w=;
        b=YwMXZcEf0bMcmjeD4spPS3FXE0DicBpvjtNmxM8HH1xCfv98SOHnTZdLVXPiaeArzQ
         ZA73Ob0Q6tJBf0JHmucYV+TZtRVhmztHzLbAF75w0ulxgjXUyVHQmfJrqZkN1ElsXLfB
         CFrvLAL3ui2ajhZnrkziGem7zNLmFQD7ha23E9mYU0F3QWfUXFVfBrpv1w/RqxeFQ59v
         qXcNCY6bKi/IbOMIjP8MegGE4IDMfZ4Z9qVinxqiucTBS2Wkj/jVS2pITxyQQoBJlHnx
         napeaLAa296APOIi7ND8fkHHFBDsmoMGj4HPg4zQEqdhXhsMIYgo5d6DeTO9B6Auyaww
         uBLw==
X-Forwarded-Encrypted: i=1; AJvYcCU/91OKMM3NiOsvqfyPVdY7Y48FSRQIdC0GETnzdX4vIJIJ7qwOWcUFaA3sIb9hlQwjpFz0TSQnbg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyO2Ih06mnjYVmzEVW2mQrSk4QUQ+GoYVR+C1KKTVjyq09bs5MH
	1TGkLkPPlOubBYeGZ5eQ/YkJLTbCgrjUp9CMqv4lq+X3I+GDHRcg6C5/JZ7zUxd9Gfg=
X-Gm-Gg: ASbGncvLYK05wFOJgNgODd8LvC7/YjNN/pLS8ulhccASkRo9GxjTZde0/PtPcaO15vW
	+UDDuYDMLXDw9VIqEroa324114ySB0ui134bgC2Np2bR292S33MDPnHp10ig1X6bmdoUxt5ar2Y
	nHdV43bYE+f74AUnJ1I+HoViuGY8jaKxl1A3CE7pnA2hTo32kbkgIag2SIlE+KWCe+DQSPnnn79
	m7q3iF9WszIeg/9paeBqhu0ZGES2bol7JKS/JQwz8L88bcAVL+HFbuPnbYE89qV5GCr6UtT9RDW
	Q7QjZ1BaFg0AmNJ2ciNMJJIXyQuNrwZw4Kb1gzU8/OTECGIciZnoLr5MukvK2MLzAi/ZPN4BZe7
	apYHOdbbcxPXCzMW/LdwgK+gyML7nyHU=
X-Google-Smtp-Source: AGHT+IHYzBl71DO7p2Gah6d5B9SY/cCvwoxopRRBUcIrRK0VYAC+l9zq9ORsJh/cQvfo3p6WSG2YAQ==
X-Received: by 2002:a05:6e02:318a:b0:3dd:cb92:f148 with SMTP id e9e14a558f8ab-3de07cd16a2mr15293465ab.12.1749848517617;
        Fri, 13 Jun 2025 14:01:57 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019b44b3sm4996315ab.10.2025.06.13.14.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 14:01:57 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] mfd: spacemit: add support for SpacemiT PMICs
Date: Fri, 13 Jun 2025 16:01:45 -0500
Message-ID: <20250613210150.1468845-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250613210150.1468845-1-elder@riscstar.com>
References: <20250613210150.1468845-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for SpacemiT PMICs. Initially only the P1 PMIC is supported
but the driver is structured to allow support for others to be added.

The P1 PMIC is controlled by I2C, and is normally implemented with the
SpacemiT K1 SoC.  This PMIC provides six buck converters and 12 LDO
regulators.  It also implements a switch, watchdog timer, real-time clock,
and more, but initially we will only support its regulators.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/mfd/Kconfig         | 11 +++++
 drivers/mfd/Makefile        |  1 +
 drivers/mfd/spacemit-pmic.c | 91 +++++++++++++++++++++++++++++++++++++
 3 files changed, 103 insertions(+)
 create mode 100644 drivers/mfd/spacemit-pmic.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6fb3768e3d71c..c59ae6cc2dd8d 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1182,6 +1182,17 @@ config MFD_QCOM_RPM
 	  Say M here if you want to include support for the Qualcomm RPM as a
 	  module. This will build a module called "qcom_rpm".
 
+config MFD_SPACEMIT_PMIC
+	tristate "SpacemiT PMIC"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	depends on I2C && OF
+	select MFD_CORE
+	select REGMAP_I2C
+	default ARCH_SPACEMIT
+	help
+	  This option enables support for SpacemiT I2C based PMICs.  At
+	  this time only the P1 PMIC (used with the K1 SoC) is supported.
+
 config MFD_SPMI_PMIC
 	tristate "Qualcomm SPMI PMICs"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 79495f9f3457b..59d1ec8db3a3f 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -266,6 +266,7 @@ obj-$(CONFIG_MFD_SUN4I_GPADC)	+= sun4i-gpadc.o
 obj-$(CONFIG_MFD_STM32_LPTIMER)	+= stm32-lptimer.o
 obj-$(CONFIG_MFD_STM32_TIMERS) 	+= stm32-timers.o
 obj-$(CONFIG_MFD_MXS_LRADC)     += mxs-lradc.o
+obj-$(CONFIG_MFD_SPACEMIT_PMIC)	+= spacemit-pmic.o
 obj-$(CONFIG_MFD_SC27XX_PMIC)	+= sprd-sc27xx-spi.o
 obj-$(CONFIG_RAVE_SP_CORE)	+= rave-sp.o
 obj-$(CONFIG_MFD_ROHM_BD71828)	+= rohm-bd71828.o
diff --git a/drivers/mfd/spacemit-pmic.c b/drivers/mfd/spacemit-pmic.c
new file mode 100644
index 0000000000000..7c3c3e27236da
--- /dev/null
+++ b/drivers/mfd/spacemit-pmic.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 by RISCstar Solutions Corporation.  All rights reserved.
+ * Derived from code from:
+ *	Copyright (C) 2024 Troy Mitchell <troymitchell988@gmail.com>
+ */
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+struct spacemit_pmic_data {
+	const struct regmap_config *regmap_config;
+	const struct mfd_cell *mfd_cells;	/* array */
+	size_t mfd_cell_count;
+};
+
+static const struct regmap_config p1_regmap_config = {
+	.reg_bits	= 8,
+	.val_bits	= 8,
+	.max_register	= 0xaa,
+};
+
+/* The name field defines the *driver* name that should bind to the device */
+static const struct mfd_cell p1_cells[] = {
+	{
+		.name		= "spacemit-p1-regulator",
+	},
+};
+
+static const struct spacemit_pmic_data p1_pmic_data = {
+	.regmap_config	= &p1_regmap_config,
+	.mfd_cells	= p1_cells,
+	.mfd_cell_count	= ARRAY_SIZE(p1_cells),
+};
+
+static int spacemit_pmic_probe(struct i2c_client *client)
+{
+	const struct spacemit_pmic_data *data;
+	struct device *dev = &client->dev;
+	struct regmap *regmap;
+
+	/* We currently have no need for a device-specific structure */
+	data = of_device_get_match_data(dev);
+	regmap = devm_regmap_init_i2c(client, data->regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "regmap initialization failed");
+
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
+				    data->mfd_cells, data->mfd_cell_count,
+				    NULL, 0, NULL);
+}
+
+static const struct of_device_id spacemit_pmic_match[] = {
+	{
+		.compatible	= "spacemit,p1",
+		.data		= &p1_pmic_data,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, spacemit_pmic_match);
+
+static struct i2c_driver spacemit_pmic_i2c_driver = {
+	.driver = {
+		.name = "spacemit-pmic",
+		.of_match_table = spacemit_pmic_match,
+	},
+	.probe    = spacemit_pmic_probe,
+};
+
+static int __init spacemit_pmic_init(void)
+{
+	return i2c_add_driver(&spacemit_pmic_i2c_driver);
+}
+
+static void __exit spacemit_pmic_exit(void)
+{
+	i2c_del_driver(&spacemit_pmic_i2c_driver);
+}
+
+module_init(spacemit_pmic_init);
+module_exit(spacemit_pmic_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("SpacemiT multi-function PMIC driver");
-- 
2.45.2

