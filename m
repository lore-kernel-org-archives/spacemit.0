Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F222D46C4
	for <spacemit@lists.linux.dev>; Wed,  2 Jul 2025 21:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751492231; cv=none; b=ZSQ0Bpqv1z3MYODmM7tbuF9KeLkd5y9OjmCzpaFhPcIWv4aZyHKkY3d5qbQLFX/uNmW3p1sv4QY5Ql6RG4UMdfOkhZMuWeajkdvKRFTG1PYrioZW4NXXML7FXl4T3RUnmwv/xibeVNZCvBy4I+BXJlBQNhmRkSILaiqLh3oiqno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751492231; c=relaxed/simple;
	bh=vjAoZdys16BCatinR/V21qk6bDas+9kyqQElG7gYOyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B7Bv2QscSJLlCEtLtQHUH/N3VC7xL6z4o71HuJDxdD9Xbk2IZedHruJFjnpwXJxDT2agto/pmA5LRRAQwjfaQXm04Wgo0PsIBgrKi3mMg4ZVXMVzHztDBmMoqeh+PouD8RSpyBD/FfBYjxorY65HIixX+UYC/iwytlYwEN/uSDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=MEsm1v+q; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="MEsm1v+q"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6fad4e6d949so34627406d6.0
        for <spacemit@lists.linux.dev>; Wed, 02 Jul 2025 14:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751492229; x=1752097029; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9QbUmj59wRT1di1iGfusS/bH4bYig6dp2mkPaC/GC4=;
        b=MEsm1v+qQ9/B4+6RLc2kUwq77NFfVugzsAB6LxdygXh13NYUD7j9fXPQuOS8pwjWRJ
         B7jdqWAIabpiWgN9rVYTOVJzmiKjubXl+1dKQ2rrL0lPfhCXnG01iwWS6BaqEq1CbNh5
         iqL3vcYhMidXi5LQuFctwANBwX8psGpVFqpUwyFSoU3V2Gt7PmCTcCOnOzZWPT1JAY5E
         CGO7PLM45TkY57iI1OnEqfqIurDUbk5lusAgAsOCgFs3r1ye8SxfBZBOB1reY6zyPTDM
         upT8XcnXglCXhvcp6RmxZZq8yaCT40IqHDvL97/Z3tpL8VTmqldw83ZnKrdmYxxN8BgZ
         BZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751492229; x=1752097029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C9QbUmj59wRT1di1iGfusS/bH4bYig6dp2mkPaC/GC4=;
        b=J3OS2PnezDBfjX77ud9B7cb4KHG6RAZGEIovbnHgIrC5BpCO1YVEg9iV0fCDi2p22Q
         INmYyA5e3q2zQqkMtPq4Bypea1jsg8rlPqtYo55eqbHIoeCzsXLP/17j8QMNjp+qNPOV
         /XMOHcn9AYRllECN2ym4V6Mugc5Dq2qWCoBgEd2JbfJi+1A7tLV8bDvcpCkYVc9hRZ9K
         uYlvZk4fhsGQHVyeChKRG/lAZSteIlZj2ClsospC/06oGdWPQDnxFdOkJoe2M95U6hwr
         317BsNpuepznp1r8x3Pc21nHWxGRWIN+bE2bVKhbrqhq6B0Jyo/S9HpM021jGBNXfIKH
         K0lw==
X-Forwarded-Encrypted: i=1; AJvYcCWPjKh5mFZtPV99sq9QyXdLZBzgxzDAujH9N04i+ge9F77v/8Kfvf8v13qiubznNWwnIOgXhXhbGg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzpoAiJuc1sZVXlr07gscDTutXJJVS1jSd9GoGzMcr+hsGnj062
	2zJx0AnJqMlbOqOr28gkechRUApjWcQZhpEPj+dwnJO5NlXUsuzhVZr+gd5hFngptOg=
X-Gm-Gg: ASbGncsh9vtCIzV9smw61seZtIqFYFR9PXOTRK3f+caslGG6rKdRqKalsME4M/z9HBg
	n2s6KCsePN47neH4kU/L4rovHp9ri5eprIqUOnzg7EX5iU5c5uKSvKfPhc62GOPggx3dYzgmUfi
	zcvNoRHmPweNWcgeeSeYMQej+yIvvdgf3f78MCEeEzhD7zKk9aqJfECkDD41c7dbnysKPcKTIp1
	/Y+UOM9vPB4bNnUpGO3OFlYGtcZ+kbpN0CGV3p+6djWKfRYE/q1/9A+IwLUF8CjdeVmlnuG5oXZ
	Pu+cnqP20ICrjLj+WOxJOqBrlmgdw7ivW/XhGMEPfjiCnAWUuDJspxu2zNpLIMD1biTbaT7o6VA
	9tbBbWQKLIIgcbFU7KHX5Ium3nClRM0/mR6w=
X-Google-Smtp-Source: AGHT+IGHBPpKrSSwLwzqeOwEldJB7kkfzgUut8xtD4fDxnQG/VP7sB0/kJKkmFEHtrrUYH6env2kYw==
X-Received: by 2002:a05:6214:2b94:b0:6fd:ace:4cf7 with SMTP id 6a1803df08f44-702b1b0658amr50726846d6.24.1751492228549;
        Wed, 02 Jul 2025 14:37:08 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771bc01bsm105691746d6.40.2025.07.02.14.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 14:37:08 -0700 (PDT)
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
Subject: [PATCH v7 3/8] mfd: simple-mfd-i2c: add SpacemiT P1 support
Date: Wed,  2 Jul 2025 16:36:52 -0500
Message-ID: <20250702213658.545163-4-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702213658.545163-1-elder@riscstar.com>
References: <20250702213658.545163-1-elder@riscstar.com>
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
index 3f959f4f98261..a8f658eaf4108 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -102,12 +102,24 @@ static const struct simple_mfd_data maxim_mon_max77705 = {
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

