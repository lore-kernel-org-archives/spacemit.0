Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B76E82899
	for <spacemit@lists.linux.dev>; Sun, 22 Jun 2025 03:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750562992; cv=none; b=fMIVLeMsgBRk1qlLZopcnbhSVZ0b/1Hv/ZK38TlZwckCLIcvyWBXPbV+rqrVW2eWHyyWEsaArLCKfUKYpiIVPHICgDS5fk1TiqMAmhX9KWPJMPY2hZZFhFXyIhr+d405Lci1eTXwS7A5Jv+37m/5YieyXO5889wiK9I9MPpwuwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750562992; c=relaxed/simple;
	bh=/f7vOi/zQqnML93HoZkMK7Obd2bgrfdMaoiLko3E59M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RLEMKfFvg0aAWzHG/qvU71iv3XH4PnK5tPI7zvK6Y9ZMHqZqLV+FxGVY95KGS+yWX6q9ta2FMGnLBCLej8aubFlbIfeZRxdqQvxcAYy96qcvY7ARPEbGUA5b8ULuNgq2gTKDRbtNeGvTiAE5T1fF3ppyZ294rDxFZjp1Y8ia1JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=bEDju1ul; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="bEDju1ul"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6fac7147cb8so62181636d6.1
        for <spacemit@lists.linux.dev>; Sat, 21 Jun 2025 20:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750562988; x=1751167788; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdegzUcdk0GMXdJnlI+cKOaIH3OWb8viJpt7TGJFQQQ=;
        b=bEDju1ulqHMphb+BWRW8edXEi2svshTlxL/H+JezGMLMLd0VRISkNPnsAtZfp+yxKJ
         zdXvetT5dKYCFuMnoZd2LuLdkp8LgX2uxSbQGeAMY6J8YMdaVnWlk33q2mgk8Sy9NDxk
         ADnvRHaPoGCl6BFdKmknzhJSMI7cINrU3jpsdT9cBpyIfFMeG0OhMsb4NU1R/Z57FVoF
         guyusKJGTU+DcZ7NYXVCpW1Sk70e/dt9sXVL76rhacbMKCc79o91mc516ade8HNSVfyi
         /V1InWYH8ItYeOohXSCefv+AlAfeDhuTRC1DoYJjoPpukXCDI9Kc85ip9QmXfNj0Y/gE
         7EBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750562988; x=1751167788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zdegzUcdk0GMXdJnlI+cKOaIH3OWb8viJpt7TGJFQQQ=;
        b=iPVdz8MYYikWMrnttJc3cOpoqhRw0TCfq6mmbIaZIRjgrsHo6XSEuJE7k8sQJBHDpj
         x16NSwU/jImLHJ8oA7y5PYjH4sVye7vinHttIhIc8njVxSpzTMPwhx1++5ZTsv30m1oJ
         acWdK/LKoQlbhD3WGu6XgBX4uWfQy4vN8U5CBMuFyXIzUEIGarx3YOl32SQ0GuHwL5cp
         jYrGgRfVDMQ+QIonuZ/QvLxYGKUyFz4H2OraVT8pjHQlI9RFLtWP9ZBfNYJnfgu79u3d
         WHwImr1b8+w2XaeBaW9XRrbmfyieEa2sSPKkbp+k1q2u7LSM5T6JLedg6LTLvpHt4R6m
         lwQg==
X-Forwarded-Encrypted: i=1; AJvYcCVFH3ordUM1+8iQohT4rkY0gVujcC346j1k07ebaWDZJgueBlOTFljQu4q6Xu5+1Grpo/2slOJMgA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz14kiusC5NbCyb8faTJXZgeDPBuKWivc9jV+sKRSI3rqTpcjzk
	jPplMGqpXSaLqgNnP6B3eDNYHXqKRELFFBzMoEps/d74LczJUODF3imVlx5hQyAKW+c=
X-Gm-Gg: ASbGncsWvDoZvVY6u/Qaq5UQAl82aBUP5qS16uixDNiFRBj7KzCX27jhDCSJ/ZviGAA
	BcUDheS0ZiEKJaJIFzss1ijV+/H1U7U35SgdCOSEKjMLLjjAUFR3fxxjHi88HBb7/hrIB6+GqeX
	ebmFzBKJBO0gORr9WbrTbexRSy8ztgFSK981GB1CRHsZmT9uJx9gkYQHggm/EK/ujzt3wbP52H9
	+ehd1Gr2lTcSU0cqEVObeIpQdNnO4cVhrS3wOE1S5YygUAheRlqt8XYLoul7xuGXH+AcHSnw3W0
	oj4KQKoUYhBdEBuiXaXiMc2nIJlpfwZ1pdvWw0kOmxVNC3xfSR4BWxjMT5odbSfk98WBC3oL5II
	dj8iV2XKE515tJN3PaHAlo+ojQAcXXD5ohqShgLiAkY6QWQ==
X-Google-Smtp-Source: AGHT+IGgivgJ0hOyBSwVTJjkONfdleyZ5q/Eg8WQ3nCbQOeaT7UCkBc1niaKvoGFFoFSZB9qNGIrtQ==
X-Received: by 2002:a05:6214:29c1:b0:6fa:fcb0:b893 with SMTP id 6a1803df08f44-6fd0a48a539mr131773656d6.14.1750562988574;
        Sat, 21 Jun 2025 20:29:48 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd0945183dsm30014526d6.44.2025.06.21.20.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 20:29:48 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	alexandre.belloni@bootlin.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	wangruikang@iscas.ac.cn,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-rtc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
Date: Sat, 21 Jun 2025 22:29:34 -0500
Message-ID: <20250622032941.3768912-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250622032941.3768912-1-elder@riscstar.com>
References: <20250622032941.3768912-1-elder@riscstar.com>
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
v3: - Support is now implemented in "simple-mfd-i2c.c" by defining a
      "spacemit,p1" match entry with match data defining the PMIC.

 drivers/mfd/Kconfig          | 10 ++++++++++
 drivers/mfd/simple-mfd-i2c.c | 18 ++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6fb3768e3d71c..a83884da6befa 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1182,6 +1182,16 @@ config MFD_QCOM_RPM
 	  Say M here if you want to include support for the Qualcomm RPM as a
 	  module. This will build a module called "qcom_rpm".
 
+config MFD_SPACEMIT_P1
+	tristate "SpacemiT P1 PMIC"
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

