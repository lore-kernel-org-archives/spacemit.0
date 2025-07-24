Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA20825D1EE
	for <spacemit@lists.linux.dev>; Thu, 24 Jul 2025 20:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753388728; cv=none; b=PUBSch9Zlx2VegUcGH+qPfwvx9OSHNXF5XaHrcfFYcBj2c8y6x2c+VgjNG/KFYXNhIRjQKIUmUOBdM+VGWdX5aE7XHN1tifqIHqVXFOTpunDJXt+5b54hyx0c/g2iszL2peGCNkeJY4HEi0OllQ5B4Q+EZn3vRik8RobZXIW2UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753388728; c=relaxed/simple;
	bh=zvtBU+DZiryJKPaGlyRisToaBx8a76/8IgaDipJlpKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=il/+lxG2PeLGtagNsT9IXANkTgdBB9wZKKZG/FlE7x/3Y/q5dcQdNduN+VMk94VIz0AwN80AZ3bUgjg7w1EIo6shS11S6vanRm7mjxSLElNriwwFdmA9YrBmWN6qRH/WnucpDOeY7HtabZEggzae+WPZ678VDjRgfiFPIf7RdzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=y9nuM2VT; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="y9nuM2VT"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-87c6dfca35bso63764039f.1
        for <spacemit@lists.linux.dev>; Thu, 24 Jul 2025 13:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753388725; x=1753993525; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FgtiipmWphMgAJou3O815VDaDuhp8ssEMPmLvEqJK1A=;
        b=y9nuM2VTsvemnXaoe0wNJJNMjA4uaI5CGvYZbDYLrhGGh15/lVrgwNbujIkfpRtJpa
         caCdl1jHS+X7uqqJeM+EpMfvGhmHHJBuVsAdtGKU4wqjtNIj8UVT11B1u1kYh4p60ol5
         K0GLg61maGrdJf5zt4vhJUmm9Jub7E7AtlCBBwxZZa7IaEWTK6WHcQGYGwLelkXblhkX
         YNEWximCF5Qx69adlRKQxtajemE2JU0J2EiTY1XjlGhED/8jv4MDMs2hF2XFirmEib+j
         BuzF22jPjt3agK9pRQ7jkPXDQRTyehuAyZM8VMSRqnf6WyX8vSsY7k0/z/rr/JOCJ19A
         +mdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753388725; x=1753993525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FgtiipmWphMgAJou3O815VDaDuhp8ssEMPmLvEqJK1A=;
        b=h1BuVnM7Fgxaud/1APSz4N0xo0tfx9Ycne6L+R/OanO3YNd964p5OeaK1ifnBVXXVo
         PkldGxMwO1poQ5fecb4rgAStp5ug+F1hzv7Ec6I8V+gIHxxBedMqOIayOYqyTM/PF4CU
         riVAYjHtc7O0X+gZdAXiwv73GVufxg7+d2pdXiBPBB2hvWSRRkyRhyBb4t4WCA/Mv0oK
         EnuEmpqKq/vYasznn7s6F8WN7KMSTikT2ttJTER+Ueney0EXFH0JfCSIMFGf1lzikjWE
         KNfP22+oSrR/FZOeQX4Id4Z4GzPmb+mzznsp/wP4n66gW9g3TvAnYIu54qxTT4FS7oH6
         GwxQ==
X-Forwarded-Encrypted: i=1; AJvYcCV19/IH8RJ1426ejCXzogcIRE+TvZAuE+vixoFpUrdC83ANaZag3GJROj0I8NuLi/8LocmpyD61JQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2ToiBzdiU7rTt/8wRne47uKmjFJtYEI7iEG1IQ3R6Kjdsye24
	z10rX0vjYdNWfaeKkxCCM/nFGWBdnc2cDUch9LJrUBQ57IxXgf6yzcV2evLOxpn8bQA=
X-Gm-Gg: ASbGnctTUJ2YNTztrSoaqmUkT3Q30rEJWNMIx99Cqv7t59JKd4XJ76d1QCH/HucJ2Hy
	uXtaffIeZCT7PjhpXuBGJ6+2I4JAkO2gvW8lX4JT26k0AVSVHos5JcVF/MmfilV3ENYlpFi/qkh
	4Qj6FXZCxXtBd9jSyR0zLcBH72Fi9jcDDX9m2hWVaHgeE/ekA4P2UHaJOHs2LVgvo0cUSwRQZGI
	IMbBQqG76gMk4QxiQxf6hM7J1m7rO6GgrqyauMbEZD1mLnf1D1TmXdJkzW1xzMqSD9PKrXDOAKr
	RwtfjmfYNQlIonoRGff9ezSvGAwQpjTbqau1dM55XIuYj/fADseNEDorrh/LMAguEUID20t7O6W
	1tJ+wa1dZqTwEuN2EFmE9ztHV5kfkx2TBqoL8H2IB
X-Google-Smtp-Source: AGHT+IHcP0ElOWvZrgpLuhTxBtnKJ+jEvgaRwOE0f2zEOL16hOo8jW2NcEn379cGMpxfti4Lu3eObw==
X-Received: by 2002:a6b:d20c:0:b0:858:7b72:ec89 with SMTP id ca18e2360f4ac-87c7628a365mr403682539f.5.1753388724877;
        Thu, 24 Jul 2025 13:25:24 -0700 (PDT)
Received: from zoltan.localdomain ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-87c74316a3bsm63080239f.23.2025.07.24.13.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 13:25:24 -0700 (PDT)
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
Subject: [PATCH v9 5/8] rtc: spacemit: support the SpacemiT P1 RTC
Date: Thu, 24 Jul 2025 15:25:06 -0500
Message-ID: <20250724202511.499288-6-elder@riscstar.com>
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

Add support for the RTC found in the SpacemiT P1 PMIC.  Initially
only setting and reading the time are supported.

The PMIC is implemented as a multi-function device.  This RTC is
probed based on this driver being named in a MFD cell in the simple
MFD I2C driver.

Signed-off-by: Alex Elder <elder@riscstar.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
v9: - Added Alexandre Belloni's Acked-by tag

 drivers/rtc/Kconfig           |  10 ++
 drivers/rtc/Makefile          |   1 +
 drivers/rtc/rtc-spacemit-p1.c | 167 ++++++++++++++++++++++++++++++++++
 3 files changed, 178 insertions(+)
 create mode 100644 drivers/rtc/rtc-spacemit-p1.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 64f6e9756aff4..31d355b103d43 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -406,6 +406,16 @@ config RTC_DRV_MAX77686
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-max77686.
 
+config RTC_DRV_SPACEMIT_P1
+	tristate "SpacemiT P1 RTC"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	select MFD_SPACEMIT_P1
+	default ARCH_SPACEMIT
+	help
+	  Enable support for the RTC function in the SpacemiT P1 PMIC.
+	  This driver can also be built as a module, which will be called
+	  "spacemit-p1-rtc".
+
 config RTC_DRV_NCT3018Y
 	tristate "Nuvoton NCT3018Y"
 	depends on OF
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 789bddfea99d8..f41fdb4fabae9 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -171,6 +171,7 @@ obj-$(CONFIG_RTC_DRV_SD2405AL)	+= rtc-sd2405al.o
 obj-$(CONFIG_RTC_DRV_SD3078)	+= rtc-sd3078.o
 obj-$(CONFIG_RTC_DRV_SH)	+= rtc-sh.o
 obj-$(CONFIG_RTC_DRV_SNVS)	+= rtc-snvs.o
+obj-$(CONFIG_RTC_DRV_SPACEMIT_P1)	+= rtc-spacemit-p1.o
 obj-$(CONFIG_RTC_DRV_SPEAR)	+= rtc-spear.o
 obj-$(CONFIG_RTC_DRV_STARFIRE)	+= rtc-starfire.o
 obj-$(CONFIG_RTC_DRV_STK17TA8)	+= rtc-stk17ta8.o
diff --git a/drivers/rtc/rtc-spacemit-p1.c b/drivers/rtc/rtc-spacemit-p1.c
new file mode 100644
index 0000000000000..43ab62494bb4b
--- /dev/null
+++ b/drivers/rtc/rtc-spacemit-p1.c
@@ -0,0 +1,167 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for the RTC found in the SpacemiT P1 PMIC
+ *
+ * Copyright (C) 2025 by RISCstar Solutions Corporation.  All rights reserved.
+ */
+
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/rtc.h>
+
+#define MOD_NAME	"spacemit-p1-rtc"
+
+/*
+ * Six consecutive 1-byte registers hold the seconds, minutes, hours,
+ * day-of-month, month, and year (respectively).
+ *
+ * The range of values in these registers is:
+ *    seconds	0-59
+ *    minutes	0-59
+ *    hours	0-59
+ *    day	0-30 (struct tm is 1-31)
+ *    month	0-11
+ *    year	years since 2000 (struct tm is since 1900)
+ *
+ * Note that the day and month must be converted after reading and
+ * before writing.
+ */
+#define RTC_TIME		0x0d	/* Offset of the seconds register */
+
+#define RTC_CTRL		0x1d
+#define RTC_EN		BIT(2)
+
+/* Number of attempts to read a consistent time stamp before giving up */
+#define RTC_READ_TRIES		20	/* At least 1 */
+
+struct p1_rtc {
+	struct regmap *regmap;
+	struct rtc_device *rtc;
+};
+
+/*
+ * The P1 hardware documentation states that the register values are
+ * latched to ensure a consistent time snapshot within the registers,
+ * but these are in fact unstable due to a bug in the hardware design.
+ * So we loop until we get two identical readings.
+ */
+static int p1_rtc_read_time(struct device *dev, struct rtc_time *t)
+{
+	struct p1_rtc *p1 = dev_get_drvdata(dev);
+	struct regmap *regmap = p1->regmap;
+	u32 count = RTC_READ_TRIES;
+	u8 seconds;
+	u8 time[6];
+	int ret;
+
+	if (!regmap_test_bits(regmap, RTC_CTRL, RTC_EN))
+		return -EINVAL;		/* RTC is disabled */
+
+	ret = regmap_bulk_read(regmap, RTC_TIME, time, sizeof(time));
+	if (ret)
+		return ret;
+
+	do {
+		seconds = time[0];
+		ret = regmap_bulk_read(regmap, RTC_TIME, time, sizeof(time));
+		if (ret)
+			return ret;
+	} while (time[0] != seconds && --count);
+
+	if (!count)
+		return -EIO;		/* Unable to get a consistent result */
+
+	t->tm_sec = time[0] & GENMASK(5, 0);
+	t->tm_min = time[1] & GENMASK(5, 0);
+	t->tm_hour = time[2] & GENMASK(4, 0);
+	t->tm_mday = (time[3] & GENMASK(4, 0)) + 1;
+	t->tm_mon = time[4] & GENMASK(3, 0);
+	t->tm_year = (time[5] & GENMASK(5, 0)) + 100;
+
+	return 0;
+}
+
+/*
+ * The P1 hardware documentation states that values in the registers are
+ * latched so when written they represent a consistent time snapshot.
+ * Nevertheless, this is not guaranteed by the implementation, so we must
+ * disable the RTC while updating it.
+ */
+static int p1_rtc_set_time(struct device *dev, struct rtc_time *t)
+{
+	struct p1_rtc *p1 = dev_get_drvdata(dev);
+	struct regmap *regmap = p1->regmap;
+	u8 time[6];
+	int ret;
+
+	time[0] = t->tm_sec;
+	time[1] = t->tm_min;
+	time[2] = t->tm_hour;
+	time[3] = t->tm_mday - 1;
+	time[4] = t->tm_mon;
+	time[5] = t->tm_year - 100;
+
+	/* Disable the RTC to update; re-enable again when done */
+	ret = regmap_clear_bits(regmap, RTC_CTRL, RTC_EN);
+	if (ret)
+		return ret;
+
+	/* If something goes wrong, leave the RTC disabled */
+	ret = regmap_bulk_write(regmap, RTC_TIME, time, sizeof(time));
+	if (ret)
+		return ret;
+
+	return regmap_set_bits(regmap, RTC_CTRL, RTC_EN);
+}
+
+static const struct rtc_class_ops p1_rtc_class_ops = {
+	.read_time = p1_rtc_read_time,
+	.set_time = p1_rtc_set_time,
+};
+
+static int p1_rtc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rtc_device *rtc;
+	struct p1_rtc *p1;
+
+	p1 = devm_kzalloc(dev, sizeof(*p1), GFP_KERNEL);
+	if (!p1)
+		return -ENOMEM;
+	dev_set_drvdata(dev, p1);
+
+	p1->regmap = dev_get_regmap(dev->parent, NULL);
+	if (!p1->regmap)
+		return dev_err_probe(dev, -ENODEV, "failed to get regmap\n");
+
+	rtc = devm_rtc_allocate_device(dev);
+	if (IS_ERR(rtc))
+		return dev_err_probe(dev, PTR_ERR(rtc),
+				     "error allocating device\n");
+	p1->rtc = rtc;
+
+	rtc->ops = &p1_rtc_class_ops;
+	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	rtc->range_max = RTC_TIMESTAMP_END_2063;
+
+	clear_bit(RTC_FEATURE_ALARM, rtc->features);
+	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->features);
+
+	return devm_rtc_register_device(rtc);
+}
+
+static struct platform_driver p1_rtc_driver = {
+	.probe = p1_rtc_probe,
+	.driver = {
+		.name = MOD_NAME,
+	},
+};
+
+module_platform_driver(p1_rtc_driver);
+
+MODULE_DESCRIPTION("SpacemiT P1 RTC driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" MOD_NAME);
-- 
2.43.0

