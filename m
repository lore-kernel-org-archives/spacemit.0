Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169151F4CBD
	for <spacemit@lists.linux.dev>; Wed, 13 Aug 2025 02:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755053122; cv=none; b=k75LZfx7A20LR7reES98Nqa/l/l8uMhPOt9Ba3vvjTvvTyScsRynsYMnL2rjzub5TlQJ7fLasD8FEci9yyrM3SFGmK8qP3B3GDQ1NMr8+/3fCZWPYcrEh+15ezVXPBD8VybPHBoS53ufsfPwJ1ULfo/BO96eC3J6wry9efZ1Bf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755053122; c=relaxed/simple;
	bh=qAyi6Z4J1VmKuMgL9UNLnXal9YSPn3d/+rrwoINafhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wa9LkoZlk411URejbhNddm2OBGMHCvYYN1Jd1CXp5g+UYwfQGNtS2K5tC5ndy+ZePWNWYwJG0Yj2czCxWL9yrBfPXZwXpqky2Ckd9J7wz8EPfHw5bl4B8dgakbfUQH8/Ytn/d1gDWX0BVaMUy9OIcFgeUU81gyr+dyV7UuZxg3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=GVyoaxev; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="GVyoaxev"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3e54f4ca0dfso23795765ab.3
        for <spacemit@lists.linux.dev>; Tue, 12 Aug 2025 19:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755053117; x=1755657917; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpWSmw9lis/Pk9ItaAyFFmK9qCXYijFo17aiCbiLfY4=;
        b=GVyoaxevQZYubHeIQSkl+eGwIqO++fVPa/mfzpLqoioP03OjCRmcH3+VenM2J+5lkp
         jYxE+1q0VQNyc21ys+k7QdtGB90Sp13mudCT8LHR5uJnxT9H/HuE1qhHoI9S5elumBUN
         YSCVpb9lRQjGV/HG5gMmYbpOjbCSqdjB8HbeaAXMtBaT5ZeUhI9hDr4jtbJUbL66Tt/X
         q5Q3ybqW0gVGmIby71/A3VWvJiDs19Km5/97BuuKEqPoStECUi4okcXg2Js8LZQ/B4IN
         VVKt0sl6G48j2PlVzJ2+6G+cE5I148SIgP1XV/KgZ7duDdiG6EbJsGt1fcNhKELpiurt
         O6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755053117; x=1755657917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jpWSmw9lis/Pk9ItaAyFFmK9qCXYijFo17aiCbiLfY4=;
        b=Z9Adg6d6v06BNIcjpfGLTCpCLxebVa+ug7qvmlP4d/9y48D2DY8ISnoNq5XNHOZP5Y
         kJhLm2GI3O0GzqmZQUTb5kQXVFQ7EH7msZbC2ynTHWkYKfkmQ1+Ofy46A4GHWRNiLYG7
         qJzpvRPbQBnn6dFekOtBqxb1RBs30HVroyyeqypvgesyxjHQqbUDih/hH1DOUQCVtIM4
         NxNSJMnpvJ5oTw+uhmFBseJHxmuakwVqXUayEZeJe2pPlY7XmF+jveIURNTXxlc7DXEM
         484vYfaSaWBueMmV/FjF8fRYuuBZfepkFoDdZSDAJCE3i+N/u7FHONEOLpRVUFXXSf4s
         qcXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRaxDCaRe0L/f69VcHASKG0HwXtIlEPz+mox8+TDjUlDB50IngERtfngcVeTbuZ5rKA81jEoQffg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyfptP5pqR+APKOCXP0VW25Em64DGZkauo/r8HRWnAOyMAI2rSf
	912O+z5RhBcWIX99f0LgUpojuMvK1jPsIhckHcRYve5JnIqABSTF+mT0gG2d3lsVkLc=
X-Gm-Gg: ASbGncs4DCukSj4iB2pl3muyHeP6nGobOYei385Bp8ZCzf4iLUVg1Me1/6s8iAD8K2A
	kpSkOZ+dOFF9VGM4rzCCXsGQ6X+U6WMvpYzohC5U0ZglGcmsObc9H2tHCIIcyoTyOkalQRITnAT
	nw5wnCqszDhI2oXju9M/wnmJ70I/ig82aruJgAPGM/3rX/i0+qZrTjtXS1PgYePFBVbNFdQMDLR
	OxQYolmV9gjyHbXWHtoPGz2Nbrb0UTp5VGUhdfJGJJJfVO6aITKLupMkknBKIaDTM3dbE+qovjK
	BhBEHFo1v6BjgqHeLQkpbJaZ4SaSy362RDd2ZUnr1/g6k0AV+IQcTfIl/MWOqmHHNUsWXfb+MJr
	s5D9HwDc7IHZE8b3ILjKcSJ7zG59EKeeg6Bkxb8Izlj34G9pKno2IcgmiNn83c5yyMA==
X-Google-Smtp-Source: AGHT+IF/iYJMmWmcL8yZLA7oNGcNRdI/2yJYPqEsD9FqvoMdXobCS2emz+maEDlXX84/h0VsLJTXHA==
X-Received: by 2002:a05:6e02:380e:b0:3e5:4eb2:73d4 with SMTP id e9e14a558f8ab-3e56739943fmr24223705ab.5.1755053117425;
        Tue, 12 Aug 2025 19:45:17 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9bcfbf6sm3430829173.54.2025.08.12.19.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 19:45:16 -0700 (PDT)
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
Subject: [PATCH v12 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
Date: Tue, 12 Aug 2025 21:45:03 -0500
Message-ID: <20250813024509.2325988-3-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250813024509.2325988-1-elder@riscstar.com>
References: <20250813024509.2325988-1-elder@riscstar.com>
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
 drivers/mfd/Kconfig          | 11 +++++++++++
 drivers/mfd/simple-mfd-i2c.c | 18 ++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 425c5fba6cb1e..4d6a5a3a27220 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1238,6 +1238,17 @@ config MFD_QCOM_RPM
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
index 22159913bea03..47ffaac035cae 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -93,12 +93,30 @@ static const struct simple_mfd_data maxim_mon_max77705 = {
 	.mfd_cell_size = ARRAY_SIZE(max77705_sensor_cells),
 };
 
+
+static const struct regmap_config spacemit_p1_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static const struct mfd_cell spacemit_p1_cells[] = {
+	{ .name = "spacemit-p1-regulator", },
+	{ .name = "spacemit-p1-rtc", },
+};
+
+static const struct simple_mfd_data spacemit_p1 = {
+	.regmap_config = &spacemit_p1_regmap_config,
+	.mfd_cell = spacemit_p1_cells,
+	.mfd_cell_size = ARRAY_SIZE(spacemit_p1_cells),
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
2.48.1

