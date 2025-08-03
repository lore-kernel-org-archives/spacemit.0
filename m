Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC56A191F92
	for <spacemit@lists.linux.dev>; Sun,  3 Aug 2025 02:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754189902; cv=none; b=XNHUvWNu40Za2aF/VfKD3h5il+G8h+CnCkT7a8HmzIb/7kMQp37CIjXlH5fJkJkYf60ZMWEQ3Tmgsmd2D6mO9cKB0S0bgH0wg9F99e/tp9u2c+YkuAaL332EpLIQvtQNxVMJH7pmjBLBdL61wvn7yFkQdh6ora/hqXZ7VYPa7qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754189902; c=relaxed/simple;
	bh=Vy3dh1W+OnJYZ/v5Lz/MZTnW63W8BbEAjIg6oorEZCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O7pRCQJV1yTR1ypjwKkf3iLkOo7+cuO2CYTaO1T1UfZic1YXBR+4cBL7CoAF9UrFdPvqbPmyjLByVirEBSTSOR4MJmULwiL3l0nHboF+CTOPKo7enLJSKYwAYZQf2SvKQBIwvZF/rnaWKNBKSOfbT9Kg0Y/JJN7LwRcqeGoCtPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=D3h4rSBn; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="D3h4rSBn"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3e3f378ea68so21105965ab.1
        for <spacemit@lists.linux.dev>; Sat, 02 Aug 2025 19:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1754189900; x=1754794700; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NseEEgxawgGlvZ2aogsjO1yTSFjdm2ClsU1ufLIjy44=;
        b=D3h4rSBnTq6mshqYF0vfhvghzVXGYaVDM5IdPCrcdg+mytzddyrLMNDofIC5rLn7Md
         RCE7NXysG6eYs7ugDoj1gxWEGmRdPb49wmoZBVt52NY1tIRf3t6CktfYuePOL29Tm6M/
         GChYzVIuHZs5hwirjCvViIAoOLKqePzJgKzPAugK2sRHnhu/DbxC9Q6JMuSBd1KQ42IT
         VjpFp3B0D1Ai7BIUru7Aypt6rvtSK3GOU2YyqMkgjihelBe68QGr5xEEi2wKrH6SE5X2
         +rkH+EwSBI++W0WIcHSLLt+fVwGA9KPoVvjkdZk9qNEwaP7yOHEiz09MA4f8qwhwU6zY
         s50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754189900; x=1754794700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NseEEgxawgGlvZ2aogsjO1yTSFjdm2ClsU1ufLIjy44=;
        b=K3UzQb7mplkYtCgPLIpXUKWvp6BqWV2rkpm7n5Es6P7oOkoxryGoGXa1ctR4WBZGnq
         Hr20RD0GlvH/IGxV6mYFqJCh1oZO851uk+ImL5hxn44UxKIM/fTlkUKHwvwBUK0TG8T4
         K0JAegqsEy4pJ+HW0pm9aP3spco+hZgwTm0EyzLpKKFR8YlL8R1KnKP5HlmcWC4zReub
         TDzz/p/zF0rvTMm/3JembD5Nl0K9pSiA+CPFjM5v8Zov2CzhJ7h7bMTyTNoBSq5W/hED
         hjG2n0jNIFfZ/T8Yifa/CcO3Vkze3fQrTrKrf3tIYbC7qrAIa9EUOhgQuBbeP46zyu35
         yKXw==
X-Forwarded-Encrypted: i=1; AJvYcCWRcJ1buoYUj0E0v+Bl3sauYPLLCsJ8IUQPvHyUEeQOGFK3d+jKMcNwVRSt5QOrT3r2maZ72NCSyg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9h9svbltt1lK1WliQ0932ERbrjiRULUjXbMoH5ctgZ+GdBq0i
	6lSMgbsIvfC+dF3xHASdebYajViizYoYwnOUSwWHkFNzdESUKklMGle5U46jdif6Xvk=
X-Gm-Gg: ASbGncuV6MgnGGRe6P1adqHhxkHsZqf/vsa3vVKan7seh8lD6Wv2pwivKzmKZh+tmxd
	1lqfhLZc5mhBoMCyRvsaWbx17r6qy97B+nkRBL0SiH3+TTzrBA7yDkn5skLOGsR4e1vFaxHdzyZ
	7HKozlJtzoxNblj4cPocbGLhUFcmDgDNbVDwpxtj+07ma7J/7nMJfm1Yig+DSmO3jIU+6bjY+gd
	AodQtNepl3USgYjCiH6PEfIhuP+NHlhkWf8q1HEKjWNoMCMVynA5ISHmkha9lilzB772VLpaBW5
	wTcXFO/GT9qFujWZ6Ri7H8dfae2YG80hPVD0zAvGEr7NX8iwdaRbdaVtcODcusA3oCWBlnCgiqB
	M6HZ4lLuNzfEcvkni7iMlS4TyfKuWif/0gdchv/6+v08TmEHFrePbnyHM55e+EmQZww==
X-Google-Smtp-Source: AGHT+IHbWkpg5C9tOqNoKe/8SDkAZAG3y2fHUU7GpFbL1Wroag43Y3qOh1rkD1ERdFbRzCvMRbwEWA==
X-Received: by 2002:a05:6e02:351e:b0:3e3:e4b2:8a5f with SMTP id e9e14a558f8ab-3e416116edamr89715755ab.8.1754189900043;
        Sat, 02 Aug 2025 19:58:20 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50a55b1ac2esm2251906173.1.2025.08.02.19.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 19:58:19 -0700 (PDT)
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
Subject: [PATCH v11 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
Date: Sat,  2 Aug 2025 21:58:06 -0500
Message-ID: <20250803025812.373029-3-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250803025812.373029-1-elder@riscstar.com>
References: <20250803025812.373029-1-elder@riscstar.com>
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
index 8f11b2df14704..3fe242ffcb31d 100644
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

