Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5884C24BCE8
	for <spacemit@lists.linux.dev>; Sat, 26 Jul 2025 13:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753535422; cv=none; b=fgsRjHrBGOGJMrgM1h4oQqaCeQqv6FYC/ohC4yrjKy8TyRJuRAXN7fDihWKdOJXf2FUagvjzHcIjEk9e98jYe2uMoLcJW44jh+QjOlMEqyxt5zDfZiLkcH6c23DyYH+6keE1EqqpHfMQ3fOvMcjODP10wy0/AaNWF2b8ZkYnpNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753535422; c=relaxed/simple;
	bh=C67aKO7FCd5ZDQiMSKTLq4HBKkrfUiLt/UEjYJGWykc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rLHBrd3Kn38bMgV+l13+fQsz0UHqrgLBS3SggCVIYIeIrLDPQWTipeSXkHPaAgvch9NDhwIGNeNMzx5KnsMPwkoeIVdKR9orlj6hXmeZCV2v7mbolwCdx0zsBLL9qShm3HfGGi5eS6OotYJa9Hz9VbabPDom3YYEMRqfyb11NHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=NqmIndiS; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="NqmIndiS"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-87999c368e9so246173839f.0
        for <spacemit@lists.linux.dev>; Sat, 26 Jul 2025 06:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753535418; x=1754140218; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skQxKpPrKNdpCm7T4rAP4k9qKdZRbQN/uiLC1I5fUpk=;
        b=NqmIndiSrkg3ce4URQYLJhy37ntOb22O5PtSatZbgy98ES+oTLk5wxDcY2FlEMJ4rT
         1ubs02TOCwDgtvmadT0j7Q+W/gdIPbGUDsGLAnaloTcwpdlFCM9gnBR3syriZdrbpNmi
         GTzqL+a+QDFjTJIl8vHeKfGInvFXG5QyNIHOhfYr/Z3Gf5o4v6jUDRBnMs9MpEeRfrSX
         DbgJOIshAwxSLs4oerbXBz03Pu3DU8bEKEleltTK6BJhxa9uUaqeZ8Cm40l9aZVo7ybA
         ZC5WRzCwqgeBv6r+RGVBJCRpGMs+uar1HkP4gNgCxG6j4/U4vGQXqHksm6YPTYfDAxOQ
         iQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753535418; x=1754140218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=skQxKpPrKNdpCm7T4rAP4k9qKdZRbQN/uiLC1I5fUpk=;
        b=erLlmX0lFoelLEW1KXBJH0jpNtFDywPQ/mbLI0jePry8mQhDaMMIH2SfwrUAWVRgOu
         l4gsf2DDvH+vG9E2hsyQ48AYoUQrtLoteN2YWC80D/FuBuoJDEUu/z09BzFk7F5PDx9V
         KEQoNg04k8u5W3skDvxYxem8Ktjyyn8ZUa5cCTh6V65wyHYSqIkuXPSWWZ6O8n6o/3vr
         aglXLL6jWUBmF5tHHOpFViXHfyTHpsM1aq6e3mfZ6nwNe8/m+3o0ZJ4ok+b5yh7vvzzQ
         t4pIxToSKAz5NDuUQq8inYWdHbrCd+0ZuQW4AyYyaH5Zh7jRRo5MF5LIkbNwM/3Mk6Xm
         jTAw==
X-Forwarded-Encrypted: i=1; AJvYcCU3C8wu9SR7WvtsK+wJLeqxTULaP+S2xZc+1HJchB2xLVnYwox7ka9VQi0fbAbZ37Fg2L+tOv58lQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxvCxI9bmYbWHLI2Vjui75VdM940MVGFa4qfLZmVM55nt1mHf+s
	E/SBX0trV0kzlAgfy5z0hFboGRM/tgccAs6sgd86B7ZXD3Us/RFyKO+CES+s2iEm4jo=
X-Gm-Gg: ASbGncvyE6ix59lszobTlFrryyvBeiqOxcP2aetA+mQZgVufcDyrArq1zQi8xMwhlu7
	BNnNtojQ3hBy/uvbDMRCkUnqA2MXVWK7e2zKYp8zb3//63IDtKG8BhyW+AcSasy3wLQxTVrAE5J
	lQAAZn5+mYCwY1we/Q2LUfVVABdvHlRBEJRg1WC8D+hvxL+LpQmHuU3OLnd9SKUPUQCN8tMU9q+
	WjLGKxkl5Vd2nqI88QbWv64xumYGff8v8IWq805UpFXWJ0N/0h8w/7LL2Sa6ALuyd1tX7L+cWIT
	XHlqV5/FLOI1kiDYPLvhMA6Twa07cFtpIvSviziaVehkv7FDiz1LiUs6KSVhS7/pKiziX7BtsZ1
	roeaz/LmOtramE3/X4fzTxAF0p1rg4tkr1JhpFqB1r/FSL/hwzOTUWroYC/KRHW/wXA==
X-Google-Smtp-Source: AGHT+IEOUDVs8LinrMieT7Bj2nM5l4zO9dDYMygetDt1jIp1At+3JnR8H5mlhp0nDQK9+1WX3RkAVQ==
X-Received: by 2002:a05:6602:60cc:b0:879:c9db:cbf0 with SMTP id ca18e2360f4ac-8800f101692mr1086353239f.2.1753535418382;
        Sat, 26 Jul 2025 06:10:18 -0700 (PDT)
Received: from zippy.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-880f7a4ee9fsm49551439f.33.2025.07.26.06.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 06:10:17 -0700 (PDT)
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
Subject: [PATCH v10 5/8] rtc: spacemit: support the SpacemiT P1 RTC
Date: Sat, 26 Jul 2025 08:09:59 -0500
Message-ID: <20250726131003.3137282-6-elder@riscstar.com>
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

Add support for the RTC found in the SpacemiT P1 PMIC.  Initially
only setting and reading the time are supported.

The PMIC is implemented as a multi-function device.  This RTC is
probed based on this driver being named in a MFD cell in the simple
MFD I2C driver.

Signed-off-by: Alex Elder <elder@riscstar.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
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
2.48.1

