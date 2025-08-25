Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8B1302766
	for <spacemit@lists.linux.dev>; Mon, 25 Aug 2025 17:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756142469; cv=none; b=Cu8IEnGgO+/ffBOuTYqDSX06WfHHSVMPvr0CHv5ajdxee+HaENBVjX/OlVjkVm0pHHwQgJpum+uDLHVrxjJ8V0ce1OB2bhYxeO9YZ1RkK8g6y6Gvj0LWmALSjLt2SaDs/UIKFpjI+sEjxWllvmoJEAsuc8zusdKh7XPKW3ZjDQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756142469; c=relaxed/simple;
	bh=kLbEyV4+fFyC+TUqNZrAw1uQ1gefiZUYe69lZaahSEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LPeGHUCcBiUblvTw6eLtWPZUkI0yr77neahWe1qNTORRCc140a1H93N4K3hsnoSisJe1+qFaU380eeDzZ3fhlPPp9SMYUXzX0nYl1XHUEbf6t2HlN6NrKdiO3PcXyaKjjtzwgCgMDtSHVYymoTjBTKyln+934iHMgIk8DpZgxkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=WARUJ4XW; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="WARUJ4XW"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-88432ccadeaso399664239f.0
        for <spacemit@lists.linux.dev>; Mon, 25 Aug 2025 10:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1756142466; x=1756747266; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0sFVnEsjQI8DSCz2p8AAK/l9KvhsbeOnyoF33jmhL4=;
        b=WARUJ4XWlP6W0S7mgAr0V/7sYnScMwydryXxaOX6PaE4B3kLHV3oLAp2izdDwn8u7M
         VKk2zZL3c71DRe7kXE+29LbsRcBfpbHe4lpajIRZwrGj0WAmnl3EZGtwr/o/2J5u94B4
         6oyPJlVO9qUaVk1VfTK/FHoTAloPkmf90bG1VJZGNWBWqPM6PwNndQO1q8OlcWZtZjo2
         Bpl2iF3oZwG5B4leItJ5Aifc0xh7xFG3kql/bPHKOckT/v1/nIzAs9RZv+bgl15JmMPK
         yyrgn30A+3uF/zUU8vIfrCYZ1MAG20Der6JsCVa3VHVhIialFC68/QvFjUOjLiWP5jM2
         ts4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756142466; x=1756747266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U0sFVnEsjQI8DSCz2p8AAK/l9KvhsbeOnyoF33jmhL4=;
        b=rOsSnqz/adkdEDM2jINiPBdw6fl3ZIGDylS7ZCnRp+vb3tEUd5YqxRZQq+Gnphlw9n
         k2M+YW8DVz6TXzpsMTr3vamKEye5Z+H4jKQKJ+CpxN+WNmw/SfXV2mOe3uxHDKOpvSKL
         t+znUkmzXbgVixh0af/6LAyVdMq2AV9iPFWkqxVasKgsAFY8OZfkkme2Gqhay8O2S2Rl
         YDcTZMMx5gz5JHwBXUF/CziSgdfsTGVcWMeAMWRp2ftKSagMQeR10Yfk8dtl5s2Xsvv4
         AjaHzJUgjdpgmCwQnxgL/iav4lyVfWPHLv3/o7+iuVaOmxRjIQDGr4dsjkn0OMSDcpBb
         IBIA==
X-Forwarded-Encrypted: i=1; AJvYcCV6N4WogIiB8JoOCZWG8D2MMuPYoQFyGWknDESlrmI/iE5ycASqPhHK19ZR4F9QYsO32XJbjcfU1Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywv300mpPEVHNuKKIeoKoZWqBwvqegvec0nm2+eAwc2jixGPviz
	OPVKR08nP2+2BiVO44EDUx7LmlVaPiDCmbT4MzD1J/ks3xeTZcGRNw244K3SWGUuRnY=
X-Gm-Gg: ASbGncsXZumPsfRpkWG4T7oM+5pBnqyjWvMIAz1AUzPAvETWE7joGZrnL+SmTDUfFM9
	8LV3/c6NnOMJn0uEuBjvbUMlqZvTQnizy+j6AuQXlV7BFUEwAEt87zHCJqCi6tMk+EBzWpCRzPn
	1GfmDmCp9C43w3KnazLQJBt3/i9RX2+Gcpy/eUz48cGHv27NxwVH540WPrgFsA4BwAiHPAFXVoN
	SvjAwdYk9RFkAzx63A1T3dC2TxqgegOFJUiedKMGM9MpSEuKl57YZ0xlCEWVpyR6yD/TFZDu6l+
	X+wLjH6yXq1JghOHUdpkl00TD4fvdX4tQdCeqA2qdLR+B90C5ZtpQ8EHTk9NJ4Fx+xxnDPV6pDQ
	iWtGRsrh5Xy1GoUMV2paxbOElbGWd6MTnnNiABbW88aSSUzWRuNuKu3HlZYONaZCM7g==
X-Google-Smtp-Source: AGHT+IGWgOuFATu1r9Jbw0eEl71eCRbkbibShP98TgfmuQSt5odlFDdF/6MhlxOuqMidvthIxLdvqg==
X-Received: by 2002:a05:6602:2c13:b0:886:eac3:d5d with SMTP id ca18e2360f4ac-886eac30eb2mr130369839f.2.1756142466361;
        Mon, 25 Aug 2025 10:21:06 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-886e60c4737sm76275439f.26.2025.08.25.10.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:21:06 -0700 (PDT)
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
Subject: [PATCH v13 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
Date: Mon, 25 Aug 2025 12:20:51 -0500
Message-ID: <20250825172057.163883-3-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250825172057.163883-1-elder@riscstar.com>
References: <20250825172057.163883-1-elder@riscstar.com>
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
v13: - Have MFD_SPACEMIT_P1 depend on ARCH_SPACEMIT and select I2C_K1

 drivers/mfd/Kconfig          | 13 +++++++++++++
 drivers/mfd/simple-mfd-i2c.c | 17 +++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index a403a3daedd52..e5cdefbea71a1 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1238,6 +1238,19 @@ config MFD_QCOM_RPM
 	  Say M here if you want to include support for the Qualcomm RPM as a
 	  module. This will build a module called "qcom_rpm".
 
+config MFD_SPACEMIT_P1
+	tristate "SpacemiT P1 PMIC"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	depends on I2C
+	select I2C_K1
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
index f7798bd922224..63ac263888606 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -93,6 +93,22 @@ static const struct simple_mfd_data maxim_mon_max77705 = {
 	.mfd_cell_size = ARRAY_SIZE(max77705_sensor_cells),
 };
 
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
@@ -101,6 +117,7 @@ static const struct of_device_id simple_mfd_i2c_of_match[] = {
 	{ .compatible = "maxim,max77705-battery", .data = &maxim_mon_max77705},
 	{ .compatible = "fsl,lx2160aqds-fpga" },
 	{ .compatible = "fsl,ls1028aqds-fpga" },
+	{ .compatible = "spacemit,p1", .data = &spacemit_p1, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, simple_mfd_i2c_of_match);
-- 
2.48.1

