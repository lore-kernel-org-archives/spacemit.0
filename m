Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E300248867
	for <spacemit@lists.linux.dev>; Sat, 26 Jul 2025 13:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753535417; cv=none; b=fNSlm2GhvrRxYjRZmtAE6OtQjRylYecBEPr8dyr3m0vkLe6BA59rs7yHdoVMuJ5ty9DKbV6Q4qKYxbJJIUf/VBF1Lxt2c5IpsD0CE8wclbXTCIS9Sl6rtkzD5XEvvIA2zMtd2PbGAean0Ns/hOhcHNVd8+2iwLqPWvHbMoCVoJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753535417; c=relaxed/simple;
	bh=Q38X3FLb9rUyS71bvg/6Qwxh+WP/snpwbPt/FQFY2Xw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dUP0SomwK2f5uYN7BOcbzauFwS5vLEA65s3vr54ONRYOr/L7/OZzZTb87OBvzx0tTEVYIUDnC6hxKOUP43OgqD4HJwTdxpZQ7CVZUGx6wVUAqbqI4e6LRmU56XAAV+vsoWmI6Kqkwk1a2McztPxpKQb+VB2TDSWikiLCbPNCiBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=YgFelxAX; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="YgFelxAX"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-880f2623a6dso96365039f.1
        for <spacemit@lists.linux.dev>; Sat, 26 Jul 2025 06:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753535415; x=1754140215; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A31+naPc141WdyGnSXK5HnsnuvFJAqLMKGUUSxCKCSg=;
        b=YgFelxAXMRmJ2PKNHhztN3zHAILrfEX6ZjCcD5c5XoFe5UzVjwVvjhTSWAbOs4AHzw
         viQXXKTgdV+bBl4cxLdh4yHRYxoIk5wrZl4uS5CVLhitBsMKtE+W7Tr6jkyZM19BEeXz
         /U7nWKdGpii/xSuj+uLVJHe3w7xuWESwds2V/JgJGUVv/gckVBeh1wWHY+c2ote3+C4C
         4p0T1lpmlqnMdWKBy6HTqaYFdKtDaP7f5xX+VyFQyKKlFuJ7dJHaGmXUyQntZKmRJy7y
         ntauP9MjAvwxb3LLA6Tus0YTVIoPmRLXjDovNr2G/x6ONKjpWiXGRD8OJfX72hdIvbco
         E1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753535415; x=1754140215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A31+naPc141WdyGnSXK5HnsnuvFJAqLMKGUUSxCKCSg=;
        b=DmBUCj6593xpSwscethf7Y5PSV7SW2M00IYRZ80QpqrPRcoZrzNbpPyaS/pQPMmFP8
         vq2VNxZ40h4sQd2Ek6H8XdqsgiR3qNwrGp17j1rsz1CcWIDE5NToC3VywWoqhFtqeFVf
         SB72XQvufRlfQMzYqRNSwetgCcS2ZajBJbPd4dBxWe1y+FOQrpBmalQC9i9163YU1KSC
         2gJvn08hy17I8W3vnO1ONdp4DpFW4+pSH1N4ZH/1uo9OT9NiFDpiEvHXJoKUQ9gj+Nhi
         LHWraV3FcMeuQFF406hum1mpVD2Qc7T/q+QGhJuOcqtXV1hBcqOP6e5U2nUMFTtMaTqz
         KDag==
X-Forwarded-Encrypted: i=1; AJvYcCXgSXZrtGbMpGW7PRdzohnXxvtnjm0FaSKF2xkDoDYz/slwGRjvzxAluzrXYNm4Xj/NBKVeDbfitg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwIzcvHQSJdZ68pbvjISoA9hVmyOTzNw/DyZPzbG61sdx+g8vr4
	BgU5ZHYTLxSHubonBJWHemR5axW9e4ZrSwdoWllXoE3ccFBrAcr4t1KfUT0EdoiTHDk=
X-Gm-Gg: ASbGncsGZNcYq1Zxsh84s2xnLcbFLnQE/8GggPDVY7KOxlKyrgTTIRvLLQAnppXdcvC
	iU248x8jI97iWkwSCMT0m9HJkoTZckV5bESm9gwreSXWqhVI4zoe5jkF7xecHz5p8ydFNfrmBgw
	ol9spOfqlP2G6rQEfMO50+u2UJAD8CtdyrfYLpvrCAHO3GmBTZUK3onECXA0ucQkFmSKLduMDJb
	+LJjS4oKzYZm/E0Z7wTO6CtyQ4MzJ2j7Hnu6i+S0pvdT7R49Ac9H6U4H3EY/7JhBEa/unWlE/iv
	W79EHqLM4hj2Ip5qE7K+WTYHltSRdSbivbWGyaUb/5/zhyLnpYHB5bbhBk22rfAzgIk6fvgifG9
	gf7VBBhPws97KZmpV5xzick4Y9Iam3hrp8C5AiTmNmJro2nVLZ5zUdvYhIBUzgJV8LA==
X-Google-Smtp-Source: AGHT+IEQtMmfXcpXrDYRw35RuK7bf++10bNgw0KJuXM1PCXb+Br9VU8Nk8Ms01AyRIuf+S7EyGrohQ==
X-Received: by 2002:a05:6602:3d1:b0:87c:5e79:203 with SMTP id ca18e2360f4ac-8800f12d61fmr1072437639f.4.1753535414633;
        Sat, 26 Jul 2025 06:10:14 -0700 (PDT)
Received: from zippy.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-880f7a4ee9fsm49551439f.33.2025.07.26.06.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 06:10:13 -0700 (PDT)
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
Subject: [PATCH v10 3/8] mfd: simple-mfd-i2c: add SpacemiT P1 support
Date: Sat, 26 Jul 2025 08:09:57 -0500
Message-ID: <20250726131003.3137282-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250726131003.3137282-1-elder@riscstar.com>
References: <20250726131003.3137282-1-elder@riscstar.com>
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
index 3622f189c8342..34c69ef4a7e94 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -128,12 +128,24 @@ static const struct simple_mfd_data maxim_mon_max77705 = {
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
2.48.1

