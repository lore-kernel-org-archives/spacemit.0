Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875D82F3646
	for <spacemit@lists.linux.dev>; Thu, 10 Jul 2025 17:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169878; cv=none; b=eomSAsx0iWsnlJUnS6WJJPaYe/XnKOPhHSPURKaFc2S2gIh2A1N7y+fNRAO4pflOVk19pZx174jsQ8f2qjMscwf0ktI1xLDy8AdSLHdPFymuGNSuh3Nkv3XT6qSp9M9ybXL6D/V0WExeH/DqhOHiJx8BkD0NrT1uEoo8SYJ1Y3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169878; c=relaxed/simple;
	bh=BzqfhdrRj8WtN/UBi9Mi4cmy9MEs58bo8wDPQk/UcCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kfOWeNB2ZVEbKNkf4OZDWyg/0HGn6AMLm3iIGa3310WPbdjDAgj/ypKz+IyKRRsguXZe6n6++pfjO0u/TdhmnjXDX0X13hEkxu2Y63bbhnwSP/4QpPBeFWlqGX13iiqP41kXoPfieJzd9sJQrbzWGxkN9Dscy4SMaXQ8HCUv3ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=tXX2jqlv; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="tXX2jqlv"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4a52d82adcaso17572861cf.0
        for <spacemit@lists.linux.dev>; Thu, 10 Jul 2025 10:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752169875; x=1752774675; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8bj6vCPGaU4Rfnhycvs3EmL9A7DZOIkUvKzqHFKHDro=;
        b=tXX2jqlvzOUzXU0ZxqNrCYlJMQG2fPCiCSlZSnm+/6CJynCMoaSECA5Mj30wJ+nuI2
         VkjTR4+KdNc1/CrIdhDLtvdAfy08RxKPhkuKrZLfE46zYi2FZj1H0HbuXHnjLFPpFR0C
         BJHhFaj7bv7dvigihHEN7804dkh7EJ93v5CWc0bBXnGVFRdcAOrz2hua1L4wzccWYZQq
         KDt3fL7JkdPNxu2BKm0PiBFCLeBGYUagrJKDiM47GVQ1qvHlQOpWjQtNRN39UeOgYpbE
         tIvnaFlkgCkMt7tEVASq0zKcxoT218vFVvL4vmvUJ0XdUbLDQNuYu0EcRO1PmJbj0+5E
         Bn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169875; x=1752774675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8bj6vCPGaU4Rfnhycvs3EmL9A7DZOIkUvKzqHFKHDro=;
        b=FIkL/3oQlnjcwbtYpeJHInDp5lnoWWuM5s/MtBDI5CaiGmBZJofOa9jO8BpiGPc20g
         9dnzEThZgvkhn5QAewVnni8mioJQD4B9nuDaCt7pmNmapEVsRk+jDx24RrwvWp7VmgMz
         K3J1w9qA2KCLQpPv0duDaIYesZbiBDTlTjfV9itM5jMFxCjD3/SkgM4jRJYjne2dQu/O
         0DokXJnKDKk0oM8UCPTbImHHyYgxZ4RSFLvW3gvfTg5Zo70ol84+A3J8AAgQ74i9NkIs
         +cEZhDTIaiWcj5qY3sa+cnzlgTACRL/nYvkD93f2vu0bfWbV3lAEhY3/yXlUjmYwFsMO
         gcGg==
X-Forwarded-Encrypted: i=1; AJvYcCVSZP2/oEgst4HIZ+dSb5OvPcqKoKh1HyE3Uunr9ETiOKFaNTleQMUQUqnMBqWYya338HhbzN/EoQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzKLKlstcCgGcFKuRvifF+YDxWSPnp7WzANl54UKsbhk92zyAcP
	R2h8GwYuHDXdlKeyqTEf1Ozfjean1kHbl7fiU+0qtdWMUMCvuWHAWFxFQOfr8Q3VN9A=
X-Gm-Gg: ASbGncsqLpJmmO4HYbCybXno1j5ObgczbN+B/J0Vr0IADW1fGrDlNaqJ60q9ck7uYL5
	eMfq+2bC6xBgHdVRRmZTTmdA+SWfKcftvj1DuNttWhdtW3pxeMaKafG6EQ+sCWcu1xypPANERE5
	DtSmB7KYBpaXwdnCUzr77w9RUKl/3DFwOJrke4W9N4oKx/FBrZfULD4i/dCw5gnaQDtXWMAsrji
	cxUGa3E7v1ZZ2zilNuShScNG7nQk0C6v/5bxCMI4qT1jThoulfy3FVYSPvv170uIJHGVLPGZYDS
	JFgX3aTUh24v6sqXV+ukL7C+61B4hGqbvS/1eNa0srccyN+cBjyK+nkqvk2yyvGd9IhjiB9v88t
	lGwM6/mpNCbJBvPoYxUQl44Yy2duG+rFMG4A=
X-Google-Smtp-Source: AGHT+IHjd05z9zRG+d0D/5sAqmS973i9wsR1kMR5ICZA5P0UJpiwl0r28sLktoJDRFvR6m807O/spA==
X-Received: by 2002:a05:622a:5c90:b0:4a9:b29e:6208 with SMTP id d75a77b69052e-4a9fb89824cmr4772551cf.15.1752169875317;
        Thu, 10 Jul 2025 10:51:15 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee300sm11165941cf.73.2025.07.10.10.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:51:15 -0700 (PDT)
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
Subject: [PATCH v8 3/8] mfd: simple-mfd-i2c: add SpacemiT P1 support
Date: Thu, 10 Jul 2025 12:51:01 -0500
Message-ID: <20250710175107.1280221-4-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250710175107.1280221-1-elder@riscstar.com>
References: <20250710175107.1280221-1-elder@riscstar.com>
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
index 5138aa72140b5..df44c2664fbfc 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -97,12 +97,24 @@ static const struct simple_mfd_data maxim_mon_max77705 = {
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

