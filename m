Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715422E5436
	for <spacemit@lists.linux.dev>; Thu, 26 Jun 2025 14:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947520; cv=none; b=qEHwwlq0tWRBBx23AMDTF5hgdUTmh0JgExI5BnroXSXLOu+PJUz2M3nMzF7TDvf+vbmG7Fy9tETP5mMs5COZAr4WfB3t0QQJai913GYP5Em81SB/1SurORBExOoD2GF2N5Y4j9nu+A8m8/AxEFrShxnoL83oodGULVlhvS90Jfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947520; c=relaxed/simple;
	bh=TOD13ffTPElASni26XgeRgQdq0G/4M0LdcwD2Hv4v24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uyZ+Dg/XhkmHMyd5a6Rhbp1kY53ZMn45FHG43iNifTbpU8GLj7cuU8rQ8uYikBGT82Yf20+nANMUhG/dlSA/NQr/6A66T0ZMb1pGL1Cr6RJTXLS2OX0LBKZslmehhY45KnzVVB58rHWyC33wfA1jUNhV6sKUG+8p3Vfq/AUocGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=PeSCENgG; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="PeSCENgG"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4a58c2430edso12308581cf.1
        for <spacemit@lists.linux.dev>; Thu, 26 Jun 2025 07:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750947515; x=1751552315; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZ5hZb53byMy6O+kgnQ/7o78O0jkXDe0+NDrOq4Do84=;
        b=PeSCENgGxBEKv6+CXM2tFpWLxUZlHdVp+ziYsBhQg7kxhG+xHXbZLv/nKsuzqJvrhh
         2lEJceFWa/WkYwbrLTwIDvWIebOvGB6pLCDWFMjZ0NlS5IckoiqxK+zSRzKqa6VRvvk0
         RL5hQIhznW1MMAGsZxvRz3hDjjQ5t3rqgG9H0zhLVxiJ9LKC/wm5toHG7fdNoQCKRzP3
         RbjL5yTF+ypdmlJZVaEkehw27kzsI1aiklAE9l4+CSjymvV20o35KSfajW0fnUl0h47r
         OR6OYh1hMsE3kdy4smsHbfpwxR50jwk883NSIHx0uG8VOZm30w9Z9IwhfD07tX/XCKYg
         fJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947515; x=1751552315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZ5hZb53byMy6O+kgnQ/7o78O0jkXDe0+NDrOq4Do84=;
        b=V8K3bzvIWRag2Hfpg0h8hzU2zPyx+7pjtTGZnatMuBLEp0u2y+cToPwoT6Vo0q7tSo
         dcUQbp6zHWtpwZVRJruRDXBYdc2Qa6y73RtMZ6q+nZYNBinZKoXyKz3f8eO6zrbNJC3K
         CeThMMtB3ILs4n8mnQNlWSB7cT9USyGh4xK9JtA4tlAOgjq5vmrd/gaI/701VanP9Nec
         yBZqTaV9lc3rMd3Iflbs8hjwrAluoRyNz9+GP8Y6WUEDFvm+ckzAE7p3rmiCjwirO2SM
         5+teEF2s36ky/ZAWePd+ncosVXijezQGLJueGqXjqnpdsUbKDKM6ah3+2tOXku054goY
         Yvng==
X-Forwarded-Encrypted: i=1; AJvYcCWY11Rxu0MxafuBsBIcSQuaMd+JocXPVvwimapO8TyAUdS4LXsrOEv+XGOWaTiNJmTER+bonIqJsA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwWEqrG6DyeR4y1xL0sJKcuqgH/68x1p+/1/OvxdDunf7/f2ENi
	MYWR8XSULX0ipk8g7Q1mhqvlU8olRFo7EEZ5dmu5N0COasFIy/TX2I8r5ZPccSAICpc=
X-Gm-Gg: ASbGncsjI53P6N/+sP3Q+AVNCjlTNx3EGf9dd9HphXjLHwQ+o6CszhKbXWdByakwX7o
	CkHJGhIj+ebwonjFmnxFupv+utQ74zdxpPJv8Cy1GGnvnXA8UgR7ttNfe6S7RVXQDC822xDvb70
	Bj2Q8vp3TvqFjvshF4iSv1Nfzx1/LAEjKcC8u2YTcZ3VeC+N2EyVgeZMnfUErHSIOl4jyJVp8sv
	QxVzKOADFCKnGp8kLaSHiiC4wTrcoXmPxr9CjaAPFpZ5gPkAsZh8bF51YdXWNW6S3PZu3ZedSDW
	ngYHFx2N2wWKGfzMPO4FdcETGPDnTmDy/Q3SFhlQOCycIsWbs+EV8RNpxq2P+BK/uLqzXsLkBaE
	lZgQmOf0PioaKE5iQGQvaxCEiF/vU9TXF7qjvbWRp5Lz6cA==
X-Google-Smtp-Source: AGHT+IEo5qUjncPNNeJ4vUf95+jNv5wrktztcnKidKdsP+7iFgU5PUhhf5ynIvp3aZOcL04L/dj9Dw==
X-Received: by 2002:a05:622a:400e:b0:4a4:3475:d882 with SMTP id d75a77b69052e-4a7f2de0d53mr56801981cf.6.1750947515077;
        Thu, 26 Jun 2025 07:18:35 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779d6df17sm70266101cf.30.2025.06.26.07.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:18:34 -0700 (PDT)
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
Subject: [PATCH v5 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
Date: Thu, 26 Jun 2025 09:18:21 -0500
Message-ID: <20250626141827.1140403-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250626141827.1140403-1-elder@riscstar.com>
References: <20250626141827.1140403-1-elder@riscstar.com>
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

