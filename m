Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6D52D4B67
	for <spacemit@lists.linux.dev>; Wed, 25 Jun 2025 16:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869689; cv=none; b=RVF7el46H53qW9kEEgmdHbWKPqV8tUpnrw4qQPBYvLZij9KNfXH83BdQKLRkscCRuyU8SVnr9lhA8xqg84wm1sD1+MGWDpSzI6p0xDU3+9p76OLxyTuiqooXCcahe/+ntSvHMTfRaVwL76W7y+F0NpUFtArdKBtApXCxlXwIYlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869689; c=relaxed/simple;
	bh=3NwBP3VAjPu7EVZaVzYEgfspykpp/rccLhvU9/CZmWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OCfUSyJ7IlvW7N0oa2fmCWHSsisW3JAcLO3ep4kT0PPs+UFc6k+yjw4vTZfFjKTTtUjuYIdQ0l2+LILaydsmXtknRqDjVmEhMvsbVKD0rK43yOtbXE2jKnqfrk5Mp3j1zpmlZJBf+l2Ltsvjnudq48LimtGSEDKeQAgj6nriNeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=BySZS/zQ; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="BySZS/zQ"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6f8a87f0c0fso1936586d6.0
        for <spacemit@lists.linux.dev>; Wed, 25 Jun 2025 09:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750869686; x=1751474486; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EiYMAk+n2KFVeD6iTdiytYbReYUGJB4T1awuY5N83BA=;
        b=BySZS/zQ6ZYrPEElu0ANCrYvceCDuA0VsPW++vsmC0WErionAuJmxxNUFmey1j/+Yz
         ZR28UypeOKjDdwoW1m8VKDtq/dhznSlXqzu2ASpd7ppjuFdtYB4lFVKpKuXGHmQ5Frfc
         uAYwKtqhAQCOM4DpkA4EUNmADWmmh/6R5gMrCLsdk6Sbf7tJJj0tTdEQvlZZN2D+rBNH
         p0vm7VTEG+VrQaRv+xp6ACoilQLskYM9wQ9PCxXU2vNgkoBUjl+YnmhEVpVaCnzxMVu6
         VDdRQWEnWRYi37uxFv5trdtksx0ODOqOrGNRHBDK4hfxxu5KiIpNYpPFw46g4hoMXJ6M
         OukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750869686; x=1751474486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EiYMAk+n2KFVeD6iTdiytYbReYUGJB4T1awuY5N83BA=;
        b=eDzxySqBJp6c3deHvr2mIUXOfjAAkeEio5S5ystUjr0F3nMDquRLitrHyp24F7pR5w
         tQzI1qKbBT+O9m/9So9zbwicG0EcI+PXM3veydQFls8kaj198gloSh55ZXUqdrr1aeAj
         Ttfh/xsX9iz8xawQgiTSZtFFhJSTTJ0DGzo1GCUQi8o1KFCLXpXZKLF3C3Dtu4k0wlPq
         ojODLLkVhK40Xp0uYx77l5dZ8Bao1UWiYtlxrpQVawqB7mLNqTVG34V0CGbOns0VITm2
         ndFQyazhG2qBlOsXeJPH/2IdHq+mvsvTD0bCZQBQKJuPIiEsPf44Jc4T1wr/bD8/+5Vd
         EMrA==
X-Forwarded-Encrypted: i=1; AJvYcCUBkbm4ZNqyTycMe/bW45eox9HEe4tZ863CF51nk3YiN6Svy9jAMGamVkMNhoI3Ak6YrgYbAFCmRg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhfzvxMOgPDLnAgrAvJzZcXBSgODxnNAZNBPlZjjpgjRDDLEvi
	xoPXYomexFcXlIPbe43e0LvN8TcRcVtu2cDcyIZVqkKJHz5f+4JfZDBj1b6VIbCjWTk=
X-Gm-Gg: ASbGnct4z8M2w8AkmrvFsUO8hnlzqEcPxhm4h9UZBI6RYe6fBkEhJK8mKJTwbanF945
	VzQXbzUXLbY+D+NZRmakrE4J/Y/aOtUQG5sRs6312DadvMNv3jBg4XQ/KuugJ5aL3pL9iCj6rPo
	mRhxl5f9PxdN7FO8/5tB8F4jCXqmuPaefBDDDGSHFUPJM+SMfzJoPppMc47QMzuW1IwYwoVPCMa
	1AEn88Ur2FPoe62Ar/hht+F7RHAHCSV6w05ILy49T+xqMutpdE3+cID/ECXia1bYIDlXkr4vkRN
	/pwNiANHuhkQDFnJFHGbk8LM55L+kXPwBjQQi9t6EoB1jnMLhZbH8Z2uX7dOEo2kKkUxjFmeFWt
	edeZGhRo8NHq7FyGm2pYJHkpSXCR6X6jgFu4=
X-Google-Smtp-Source: AGHT+IE1or5SFKNkcRKmq8LFw9DnBikVJYe2AFiC9sbCjtCfT/HtlItDWp87qBFYsQunHs2yQD2B7Q==
X-Received: by 2002:a05:6214:f0b:b0:6e8:fcde:58d5 with SMTP id 6a1803df08f44-6fd5efa696emr52880996d6.42.1750869686196;
        Wed, 25 Jun 2025 09:41:26 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3ffdb190esm576783085a.86.2025.06.25.09.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:41:25 -0700 (PDT)
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
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
Date: Wed, 25 Jun 2025 11:41:13 -0500
Message-ID: <20250625164119.1068842-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250625164119.1068842-1-elder@riscstar.com>
References: <20250625164119.1068842-1-elder@riscstar.com>
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
v4: - Add a dependency on I2C, to avoid a CROSS_COMPILE build error

 drivers/mfd/Kconfig          | 11 +++++++++++
 drivers/mfd/simple-mfd-i2c.c | 18 ++++++++++++++++++
 2 files changed, 29 insertions(+)

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
index 22159913bea03..026cd92e20ad3 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -93,12 +93,30 @@ static const struct simple_mfd_data maxim_mon_max77705 = {
 	.mfd_cell_size = ARRAY_SIZE(max77705_sensor_cells),
 };
 
+static const struct regmap_config spacemit_p1_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0xaa,
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
2.45.2

