Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85482E338B
	for <spacemit@lists.linux.dev>; Fri, 27 Jun 2025 14:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034200; cv=none; b=CGb+3PNccmMv6gw1PhOxlgYJ95l9tQJJ9Rz1C4xvlHj8DmlnoCy0ndoYczRRarstvYmCvs5abutOsctiRxBOGH0Ih9mybbXPBUMQ0RV77eJi9qt7Ygrk+FnMU/Bs3vjijPOCFk1ftjlQxEDaH3Y+EYhDX81wOyoddpS8OJx0C6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034200; c=relaxed/simple;
	bh=b+d+F+NfMBETraAATTzaFJEm4lSRbVG8DDRdAYWb/+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FRhXrG1+LJNXyZGIloRtki4CNJSE42CUrPP7h0/DJ2oZAbOYjliTh7WMcJZyWn5xH2JOCivCQ+nn0H49rgR0kWP4f80eUpiGyaxqVCXfdVfXxAu0hTz8MJOfJhiZleAcaFnHO6jRyI3LM7BZHoS0dZUirw0EaJMPN6d07gIlP9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=K2uEJry4; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="K2uEJry4"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7d21cecc11fso352225585a.3
        for <spacemit@lists.linux.dev>; Fri, 27 Jun 2025 07:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751034197; x=1751638997; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ImtcgLzIrcawut2MtN3yGlOkEUyWKtboJHD9r18H14s=;
        b=K2uEJry4LidZhonueXBmTck68xkrKThlCL/sU2LwhEN9GGePWuIPKRmCCs3gUtDQVw
         PtZSoh0QFIWZkHylYyPbur95vGr+2AkyXOb+hojw7sXq3G1cEodtWpwBO5ZCGllTK0K4
         jdI435RvKa8zwH2+Gvy3dmLkt8PTxSRRHWs0zXd0qiH5vJ4dHGs9Wy68XMZYj7J/A0ff
         OsxIPqKA/jiqyCF43qZFYEcIODs0mBf7Rs2HNcunwZXQMjKR3GIj6oOvZBm+4LRkTAy6
         ER/cR1kmJbm48wg2xGdUjro6R/j2c8loiXrSxxizCwmK0FBDF9g47Rij1/ZflXe1Ah1J
         qH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034197; x=1751638997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ImtcgLzIrcawut2MtN3yGlOkEUyWKtboJHD9r18H14s=;
        b=IhGfQ6u4uKUGJHd17+fEgAj/crQolROFWjlcfrg2GYMzuslTC2mmn8xEH4bsccwBay
         R7ZQ1Xn4ftZsIgYXtlpxTcDlVk8qLbp0+2BMQ2SsLgjul0+/S4pDQznCO0T6xai1ZBQS
         3q7KmNThe0X4fD+CN97bQdxRy4SxCFLiNmE/cUQKnsiTxmzaYoTVTMBjJX6G/ldutHuj
         CPCy+sd519j9TbJ6dzrQ/rOWaka01CqExmOSjVUOhxNSYhiVu/TeRiW/AwX0iM133pcq
         GvJhq6mAEj9Am8Wq5fWDppmJLPxYyT5va7kflH3EOdr0DMUAfv/etR+KxV5zw8e0aoXp
         2mJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVt64p6KC8MBL5+rTMYgQ6GPeNLlut7nf08Db8Z1ZLRqlUpcWBm9qohcExJVq8MedFZAnQ3dANfaA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxUecFxQbgQKVqj/iFS7FVcxOKrcJTtAhK86jZ540jFZJYdPGJN
	X02BNff7khpFdc6za1nbEJct/INukvkFqYrF62G4j2La/NG9hhHGDVK29XadmMwI5Bg=
X-Gm-Gg: ASbGnctpMSegdJBbYzA+9ojOAPeXxOdG+T8LGYhrb3lCGh4aJACeHROtfl3aKKiZXTg
	JkDFScf+HddRLxA+9BQIiwrFjMSoJshSUWXS9zRCCPEKBVNy9QNzp982/dN1q5uKEieBuaY2EZg
	KamRe+jXIpX9cSQqP1oXDvJfVS24pIu+7bgvCvALfYQqlkQUApNhtDE3KN1j0J5L2YWtc9R5aLF
	F+7On3G1+Xy/dvyHAzj38wzfTQLfM2tw9YwfhgP/Z2lzIKzT7nlll2nlQkCHwcEK4yXHYdejQt3
	fAwtm6cfOEDrEx04n1GdCMgNihsZnPngoEGlAIMid6RGLFfJPruyNUp1Q1wU5Z2hfGUBlFzcyET
	dN6fbBMWX25QJkdpISrKth8aQf3H+6thOFTFktTLwXkqq2w==
X-Google-Smtp-Source: AGHT+IGVK1ecJTiuAsTlRFYL0Ii2pcfzFGLsDuQjxdb465KNunRg1KkMZc7lQpWfV88VHg+Ky4I8gw==
X-Received: by 2002:a05:620a:178c:b0:7d4:43cf:68e with SMTP id af79cd13be357-7d443cf0696mr474156085a.17.1751034196660;
        Fri, 27 Jun 2025 07:23:16 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44323b4c4sm135708785a.106.2025.06.27.07.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:23:16 -0700 (PDT)
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
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/8] mfd: simple-mfd-i2c: add SpacemiT P1 support
Date: Fri, 27 Jun 2025 09:23:02 -0500
Message-ID: <20250627142309.1444135-4-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250627142309.1444135-1-elder@riscstar.com>
References: <20250627142309.1444135-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable support for the RTC and regulators found in the SpacemiT P1
PMIC.  Support is implemented by the simple I2C MFD driver.

The P1 PMIC is normally implemented with the SpacemiT K1 SoC.  This
PMIC provides 6 buck converters and 12 LDO regulators.  It also
implements a switch, watchdog timer, real-time clock, and more.
Initially its RTC and regulators are supported.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v6: - Update to specify max_register rather than a full regmap config

 drivers/mfd/Kconfig          | 11 +++++++++++
 drivers/mfd/simple-mfd-i2c.c | 12 ++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6fb3768e3d71c..01805c3eec57d 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1182,6 +1182,17 @@ config MFD_QCOM_RPM
 	  Say M here if you want to include support for the Qualcomm RPM as a
 	  module. This will build a module called "qcom_rpm".
 
+config MFD_SPACEMIT_P1
+	tristate "SpacemiT P1 PMIC"
+	depends on I2C
+	select MFD_SIMPLE_MFD_I2C
+	help
+	  This option supports the I2C-based SpacemiT P1 PMIC, which
+	  contains regulators, a power switch, GPIOs, an RTC, and more.
+	  This option is selected when any of the supported sub-devices
+	  is configured.  The basic functionality is implemented by the
+	  simple MFD I2C driver.
+
 config MFD_SPMI_PMIC
 	tristate "Qualcomm SPMI PMICs"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index c1dc315d44dcf..81573a4830076 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -87,12 +87,24 @@ static const struct simple_mfd_data maxim_mon_max77705 = {
 	.mfd_cell_size = ARRAY_SIZE(max77705_sensor_cells),
 };
 
+static const struct mfd_cell spacemit_p1_cells[] = {
+	{ .name = "spacemit-p1-regulator", },
+	{ .name = "spacemit-p1-rtc", },
+};
+
+static const struct simple_mfd_data spacemit_p1 = {
+	.mfd_cell = spacemit_p1_cells,
+	.mfd_cell_size = ARRAY_SIZE(spacemit_p1_cells),
+	.max_register = 0xaa,
+};
+
 static const struct of_device_id simple_mfd_i2c_of_match[] = {
 	{ .compatible = "kontron,sl28cpld" },
 	{ .compatible = "silergy,sy7636a", .data = &silergy_sy7636a},
 	{ .compatible = "maxim,max5970", .data = &maxim_max5970},
 	{ .compatible = "maxim,max5978", .data = &maxim_max5970},
 	{ .compatible = "maxim,max77705-battery", .data = &maxim_mon_max77705},
+	{ .compatible = "spacemit,p1", .data = &spacemit_p1, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, simple_mfd_i2c_of_match);
-- 
2.45.2

