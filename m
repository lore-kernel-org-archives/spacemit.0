Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999010;
	b=fg8ku5LxvNDTPrXLhjJylhu7uBxwHbzFf2tDEcl2EJ00As10TBS17qrknARfj99wwyV9
	 SerxBK1KAzEo7LQoGwSWqxOqFdNEeq0/dQnpOwW1404u4ftjzkBhxJcZBGeVmcpjm5+w3
	 AZIgsUer5vrBBmdbYV0VbAy0Pxa0dkFYVj+zVMqh8NH161BR3Qr38TFF0opuN5SB5iTHl
	 wK4WVe4Lm5ycCPqmE/Kw+sPoVmnvYU0s1DxNsggbcgkoO27HmmNtmPD8I1/WDWCEcIZ+p
	 qI6jYDXIsAU3KLuG+7YuXEuZJlqfZptrkzuxIPzg5VPP3x5DyQksDZIxZAErg93XjpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pcrm3vnLSGimQb5rCI5RJTtZbp3UKYK7ig1rjNTiXnM=;
	b=fFiNTxIFHv61OOPj9loKRs/h/JBcJs6VkpRyyRClKKVS8eOtXllG5H9fagxEe6Gguv0A
	 eq/aYZcvg/bVlEMAUEgprHpn1z7in+r/kOWGSk9TGHxfqpYz+tuNC6IAgbTeLC5Lc952U
	 ENlvyuC2SMGb4wVD8+i7sZAFHHy7Uedxy/5MuAMP0Ood0tL3pZn6/aY+spGh/tDdeF+6E
	 c8btoOYUdBgBbXEKp/2e/o0hbBH4nMKGkdKE/N21lRxE1McLHfaAmy98D2ZaRxaO2bvVi
	 jdCAUCJSuD4aPakIT6hufJs3WM6IKYBT8uB015JFP2qMU7OpbXDFgTJt/lkAcrD7c4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gXWW839u;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC970606A32C
	for <spacemit@lists.linux.dev>; Wed, 18 Nov 2026 10:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC970606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gXWW839u
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38318d69173so199641eec.0
        for <spacemit@lists.linux.dev>; Wed, 18 Nov 2026 02:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794999009; x=1795603809; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pcrm3vnLSGimQb5rCI5RJTtZbp3UKYK7ig1rjNTiXnM=;
        b=gXWW839unK1I0CzvQQ4Nvgivcn6ccBLJH4na46qysA5uDf3SRJofwDfvUyHepgYliC
         S8Ze6QXtmSPHb+onMzWigzz2xX4AC/59Ak6iTfyqwO4pIC4PZRf77/VW8OZaapwwKKV+
         BpzoPLN/lYbTS53SUFqXzJbHiOUA+A/msoHw9TPcAgAtJ8MNNaZWLOwxBWc7JzKzJFae
         bGxtQJoZqRH4SrUGYOCyXvVntF8Vk/I2TxOXf2zqHYIawggEmGFIcMj3wvgQEZBp4gI3
         BjDg/cOHyPgNFF9HNga8ZkwyvuGa782SCGm/eiPZY5unhRWUpSgZ7paTDhfEFOBns+1o
         9NmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999009; x=1795603809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pcrm3vnLSGimQb5rCI5RJTtZbp3UKYK7ig1rjNTiXnM=;
        b=oiNk3wvSfwNPNy8x7f0MlfnbQmnIitOMeK/jqJGPYy/p1Cm7dqv1HgAXg+IK19z/df
         pFniXcMpau27U+DgpsdxOVYEobUxzERRtNwk1KUCjyr18rT+yXeskx3HycyJUvXJPlMa
         VjwAJbJWXK3aWbihfj4syy2ojqSVjzHI3loqPtPnndh0PZhnL905/Hy2wJp17oNdKHlA
         7ymjugeVfCJ0w91Zw950xujbIV1SK32uksOVtZc0HnZCLCvLCN46sz1psxsANCZ6mFoX
         oD9cq3lfL41dB9ECjSbnu9rvSv5zQqmy4gfC9C3ZRlNKK+sK9816wOPHN2LcSSXkJmsQ
         seIw==
X-Forwarded-Encrypted: i=1; AL+hErFbuT6LhHMajs54M/KQd3PDf0RRtsLh7kxR7vJ/SDYG5fI+S5k7RYVmY2BCfwKMtz/aho8qpio4Qw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/CnCZh9lgXmAwwTdgQbVmzONJZG1TQ9GrM2Fhk+TejqXVxCd05
	h3pcPsb1hsMep6hle1RHqOl67YQOidGzSBWriJcjfYmY2z4CEtga2Hyd
X-Gm-Gg: AZFdTZdVffpEOWnB9eAmG/sO3x+mhvIUeZbWjPA/Incp5BafB7oHaaawQY6ivOyP+Ok
	lkXnj1X9kLD0Rm2YJZ4Ai/kWDzXq6Dm0qWAZmkLZdxluOl6wQUAOdp7Ry4GP6EkESfmqR4f6u75
	KWyPV/WfUqUUnI3POrZxdfxwydCDUPkKUZYQyu5tu7IgascbagrDzsSYBj2gTy1c12gFMNCDsGA
	UIN3HeChvLwcryBqeOQoVhBtl3uR6ki2zUe0K4/Xm+RQVbZRJEMN7uPiKOZxkVIuZoZfy3FlA9M
	SYBHayrRN+8W+BY8wppoWU9N2d/K9tVMqCog/Xa1hgqCWifW66w8AYvNyJVs+A/nBKAhdZUVrGG
	elc1kfq7MSbJkbBzdXLgsZsG2qAmkFhRI89tGl4VIBDcXQsyE0C8JXwhO3DlrRP5dJGhtf8pOkG
	CtpqIGutevA11PeZpWkgl7y0oZ13f03ZfOwXgwh1B6n0daGvsFE00LTe9UuKI+RSNP1nx2pl0Pf
	kMSAdnliJpZop3qrx2KGQGFYcqpgyktEsyzfvIwQDTdXK04SpWXfG4G32RNsYIm8ygnGjRIjsOe
	v016/KlzqMInpWmW3QdXuynfTZsyAHxl
X-Received: by 2002:a05:693c:2113:b0:37a:a9db:6bd2 with SMTP id 5a478bee46e88-3828026960bmr2342283eec.11.1794999008833;
        Wed, 18 Nov 2026 02:50:08 -0800 (PST)
Received: from archl-rock5b ([45.112.0.182])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a45260a8sm11729913eec.3.2026.11.18.02.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:50:08 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-pm@vger.kernel.org (open list:SYSTEM RESET/SHUTDOWN DRIVERS),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v2 3/3] power: reset: Remove SpacemiT P1 reboot driver
Date: Wed, 18 Nov 2026 16:19:15 +0530
Message-ID: <20261118104935.1716-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118104935.1716-1-linux.amoon@gmail.com>
References: <20261118104935.1716-1-linux.amoon@gmail.com>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT P1 reboot driver uses I2C-backed regmap operations to
request system shutdown and restart through the PMIC.

The system-off handlers run in atomic context, where regmap operations
may sleep. This can trigger invalid wait context and
scheduling-while-atomic warnings during shutdown or restart.

On SpacemiT K1 platforms, system poweroff and restart are handled by
OpenSBI through the SBI System Reset (SRST) extension. The Linux PMIC
reboot driver duplicates this firmware functionality and is no longer
needed.

Remove the driver along with its Kconfig and Makefile entries.
The P1 MFD driver and its other functionality remain unaffected.

Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
New patch
---
 drivers/power/reset/Kconfig              |  9 ---
 drivers/power/reset/Makefile             |  1 -
 drivers/power/reset/spacemit-p1-reboot.c | 87 ------------------------
 3 files changed, 97 deletions(-)
 delete mode 100644 drivers/power/reset/spacemit-p1-reboot.c

diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index bce996bbef28..9e997d58fcc6 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -295,15 +295,6 @@ config POWER_RESET_KEYSTONE
 	help
 	  Reboot support for the KEYSTONE SoCs.
 
-config POWER_RESET_SPACEMIT_P1
-	tristate "SpacemiT P1 poweroff and reset driver"
-	depends on ARCH_SPACEMIT || COMPILE_TEST
-	depends on MFD_SPACEMIT_P1
-	default MFD_SPACEMIT_P1
-	help
-	  This driver supports power-off and reset operations for the SpacemiT
-	  P1 PMIC.
-
 config POWER_RESET_SYSCON
 	bool "Generic SYSCON regmap reset driver"
 	depends on OF
diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
index e31cab4ba78e..2d5bdd1584cc 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -25,7 +25,6 @@ obj-$(CONFIG_POWER_RESET_LTC2952) += ltc2952-poweroff.o
 obj-$(CONFIG_POWER_RESET_QNAP) += qnap-poweroff.o
 obj-$(CONFIG_POWER_RESET_REGULATOR) += regulator-poweroff.o
 obj-$(CONFIG_POWER_RESET_RESTART) += restart-poweroff.o
-obj-$(CONFIG_POWER_RESET_SPACEMIT_P1) += spacemit-p1-reboot.o
 obj-$(CONFIG_POWER_RESET_ST) += st-poweroff.o
 obj-$(CONFIG_POWER_RESET_TH1520_AON) += th1520-aon-reboot.o
 obj-$(CONFIG_POWER_RESET_TORADEX_EC) += tdx-ec-poweroff.o
diff --git a/drivers/power/reset/spacemit-p1-reboot.c b/drivers/power/reset/spacemit-p1-reboot.c
deleted file mode 100644
index c0454b547718..000000000000
--- a/drivers/power/reset/spacemit-p1-reboot.c
+++ /dev/null
@@ -1,87 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (C) 2025 by Aurelien Jarno
- */
-
-#include <linux/bits.h>
-#include <linux/platform_device.h>
-#include <linux/regmap.h>
-#include <linux/reboot.h>
-
-/* Power Control Register 2 */
-#define PWR_CTRL2		0x7e
-#define PWR_CTRL2_SHUTDOWN	BIT(2)	/* Shutdown request */
-#define PWR_CTRL2_RST		BIT(1)	/* Reset request */
-
-static int spacemit_p1_pwroff_handler(struct sys_off_data *data)
-{
-	struct regmap *regmap = data->cb_data;
-	int ret;
-
-	/* Put the PMIC into shutdown state */
-	ret = regmap_set_bits(regmap, PWR_CTRL2, PWR_CTRL2_SHUTDOWN);
-	if (ret) {
-		dev_err(data->dev, "shutdown failed: %d\n", ret);
-		return notifier_from_errno(ret);
-	}
-
-	return NOTIFY_DONE;
-}
-
-static int spacemit_p1_restart_handler(struct sys_off_data *data)
-{
-	struct regmap *regmap = data->cb_data;
-	int ret;
-
-	/* Put the PMIC into reset state */
-	ret = regmap_set_bits(regmap, PWR_CTRL2, PWR_CTRL2_RST);
-	if (ret) {
-		dev_err(data->dev, "restart failed: %d\n", ret);
-		return notifier_from_errno(ret);
-	}
-
-	return NOTIFY_DONE;
-}
-
-static int spacemit_p1_reboot_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct regmap *regmap;
-	int ret;
-
-	regmap = dev_get_regmap(dev->parent, NULL);
-	if (!regmap)
-		return -ENODEV;
-
-	ret = devm_register_power_off_handler(dev, &spacemit_p1_pwroff_handler,
-					      regmap);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Failed to register power off handler\n");
-
-	ret = devm_register_restart_handler(dev, spacemit_p1_restart_handler,
-					    regmap);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Failed to register restart handler\n");
-
-	return 0;
-}
-
-static const struct platform_device_id spacemit_p1_reboot_id_table[] = {
-	{ .name = "spacemit-p1-reboot" },
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(platform, spacemit_p1_reboot_id_table);
-
-static struct platform_driver spacemit_p1_reboot_driver = {
-	.driver = {
-		.name = "spacemit-p1-reboot",
-	},
-	.probe = spacemit_p1_reboot_probe,
-	.id_table = spacemit_p1_reboot_id_table,
-};
-module_platform_driver(spacemit_p1_reboot_driver);
-
-MODULE_DESCRIPTION("SpacemiT P1 reboot/poweroff driver");
-MODULE_LICENSE("GPL");
-- 
2.56.0

