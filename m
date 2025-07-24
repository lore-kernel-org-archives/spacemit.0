Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5C7254AEC
	for <spacemit@lists.linux.dev>; Thu, 24 Jul 2025 20:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753388724; cv=none; b=NndlDK4tgjizLSRUVjj+QQqsAyXrU6rpVFzkdDOkrhZZ6Fth/Po+VDOvkl8+sAe5ZYaHtlpVm3I2/AQyhfR1QtM3TfIKcMjWioTEjDlZhJshSy5q3cktfIUHHJaus/s/58jtx8zzGfY91UhztHD0LeC6xAZqxbwcbhkzYjsU8hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753388724; c=relaxed/simple;
	bh=l8Y690TjTxBtWa5UK1Ikcjm4OIFZIWjVnz92Fpv/IF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S1PzJwWAWBrDbZTHO2ooDmrghwEBd29oAqkj8FQwiHXP2uXP/wycm6DGn1lKovte/zriQBtTf9TMJoaL0MteaB85n/VG2d0A4aD9xEX0FAS/mCGwAzkPpFKeKtxVwLhkBOXNfz3LI4vNQZwlM5JkIHsOoFKv6drFZt6U4vpMqnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=dBPiIp++; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="dBPiIp++"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-87999c368e9so112070539f.0
        for <spacemit@lists.linux.dev>; Thu, 24 Jul 2025 13:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753388721; x=1753993521; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fMagwIpZN5H+ZLBoespMypsP1iYS62LYPB3IOcPtBU=;
        b=dBPiIp++Xq7nGFZPqKbQMSI2h+WmjTnxz6VLGZAM4YdPRDjNNBBq4gM+ZsKBBw3smd
         2ZSErA0krrIFJrcNQ/VKuSKMfrPT9nvXAvv08CXadSprzGB8h4vRnY4Wl2EfIgfbTu68
         fs/sjDZG2MAGmhmdrVjm6ipvXngDtga3ybML4FhSX62kUqC8vDLayhdDfrM0HvhMgoif
         nZILEkbvMMce6KLj7/0UDnqZaiovgzTjl3ETvpWVDzjrmmRtoocsU5ITSn8K8v+O/Qaf
         lNmv8oLIgj1w13rN0y3wSKDxnLmhZrZqS8r7z9liEHSw0ddQi9ivT/CloJQfna4lpVqn
         wgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753388721; x=1753993521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1fMagwIpZN5H+ZLBoespMypsP1iYS62LYPB3IOcPtBU=;
        b=lgjDloo7y6nwnExCka6wWn9bW0pZYNMReqtzYF3Aap7CThmqB9OJ4V0UWCVRtfsewg
         rLxGIIbzKplb6R00/qChH1K105OUWDi9/nwD591dTasNVkP4CAPMidBdu4XxGJaf1Kp3
         UhtBM2zs2XjvjaLwGskdOTLDCcfUvEEIunSInpcaelwv+EX3Iw+WRV2+b9PvB6Px2ePQ
         dGA19ewxKc7XjqPA0+6YVs84MGUNm7gAp7yptSth64Y5l/FNrEebK5so6RVGQzDmwgmt
         TQg9V4mGFVDBmd0FRDy3YVjy2P/5HLUuwcI4KmvCpOyIUjrXdMCCFBF4KO3UR648IwBp
         GDVA==
X-Forwarded-Encrypted: i=1; AJvYcCUVCd1meeLzT1wsE+p9qLuq+jDZwkV1mNIcsegJeL/BvSlkPIr9evy30PMYOCxzxwH9WQrgey18uw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3qqm/+AExU4+2r4aN0JtnTJgxd2pFoOIjluDRDieCTRTVChxo
	rP73igi2pVWZlfBFulQEBwX+Shr3U/q9D3SJ0N3GF0pkS8YpQjwm2kmp1eK2FfLKHds=
X-Gm-Gg: ASbGncsabD81Vk/lOrczAVA8lnUBoGv1WEQWAYIYjA+7I44N4KFI/xHjQHCTiViGgtk
	nQ0H2j1E7iHk2zqMdPqWSv49CEna2hkWNR0EVDbVQadHfzvBp+GOGCTYcl2RfgRMJ5iwEuZcXIY
	pVEvhPXPCdD9Drf5vnH4f6/l+OBvkqcfWGh8LZTrmlcTInRPWBkitmcHebqX3oyRDX4BUaT4lGo
	udUj4jdQXTTqbP5JnZHxNNOR5w6gmrJgg1DAkM2rSgq1gRfXCDiXVpc0cSVFTQpgAnyamBoWXk8
	rbuL8VyzP6nY7TLxmPIMKqEaZM9tmFeQ6NmcnnuLtw6NwBNRKcaLXFtsmopcKK6IuH1EvcpOUR0
	o18EuuXLqo1p67iygjLvXT/aGkb4o/W1vEFAMpWIP
X-Google-Smtp-Source: AGHT+IEzuYz5qj+oH/RB69ZJfeLnXb048BakkEMmEAOuLS639h8MxrVG/7gNIToNr5fzMcWgRRoxxQ==
X-Received: by 2002:a05:6602:2c85:b0:879:c609:f5a1 with SMTP id ca18e2360f4ac-87c6504722bmr1515412339f.12.1753388721347;
        Thu, 24 Jul 2025 13:25:21 -0700 (PDT)
Received: from zoltan.localdomain ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-87c74316a3bsm63080239f.23.2025.07.24.13.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 13:25:20 -0700 (PDT)
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
Subject: [PATCH v9 3/8] mfd: simple-mfd-i2c: add SpacemiT P1 support
Date: Thu, 24 Jul 2025 15:25:04 -0500
Message-ID: <20250724202511.499288-4-elder@riscstar.com>
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

Enable support for the RTC and regulators found in the SpacemiT P1
PMIC.  Support is implemented by the simple I2C MFD driver.

The P1 PMIC is normally implemented with the SpacemiT K1 SoC.  This
PMIC provides 6 buck converters and 12 LDO regulators.  It also
implements a switch, watchdog timer, real-time clock, and more.
Initially its RTC and regulators are supported.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/mfd/Kconfig          | 11 +++++++++++
 drivers/mfd/simple-mfd-i2c.c | 12 ++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 0ea3a97bb93d1..21b117eddfea4 100644
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
index f3ba79c112d4e..fd5d7b60433fe 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -121,12 +121,24 @@ static const struct simple_mfd_data maxim_mon_max77705 = {
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
2.43.0

