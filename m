Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD14143736
	for <spacemit@lists.linux.dev>; Sun, 22 Jun 2025 03:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750562994; cv=none; b=Izid443FgoAlvkly70SQMQjRmo2HMDuBtJhi1ioQo0oRiLgNqowH7m7/p6CLRSTqYo1BdX12r/TVT6WMrNbAJP1C8Yai9SoeFZC9+FbAyozd7afI4U2cPHKCDfixpIt8yOhuUxW9AWpMt4nK01rmhtfEGj7w8hQpxb+IgtYwrYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750562994; c=relaxed/simple;
	bh=Go0wu4UyU0raaHDkQ1guPLHZtEwJ0SpS66RX5zWEIgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZjDnGuhF+4o70iZNg9FrCM0AYdU9M1rnH11tfaNs66kOUbVh30e8NMcJgqgjnfQfX2QWNOnbA81ej3T1C3QBnbwwfFlL1ulKi5NF3A7Erv058L6acp2cEzOzP6miDs2Ek1TgLNqDekCBH+6hszcRArFfvt7PJj2rafOLjxiVJi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=1T78YPw4; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="1T78YPw4"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6face1d58dcso48817406d6.2
        for <spacemit@lists.linux.dev>; Sat, 21 Jun 2025 20:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750562991; x=1751167791; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYVDfYJEfBaM0ssLbKCKZebV837CxPuDOg/+Kg5KUqU=;
        b=1T78YPw4BnqAMLjj61En98WiALo/6FTOElcgTkLdZwkJWJp4Tft5o+nMjokIPlecx+
         gpU8A9sI8XyfQc4Z4MTy26EftwL7QdikdRwP2XiNHeb+WADysGBxdzUIkTsFz+F9gngT
         e0+Cmw1mcCwdhCrpe1HlyLzftHVXB1ricHxQi6mu4HrWNzzrJxQe2sTyjskAf32jlz2j
         wjqzDWTQlaJ0Oz/LMc11/5RSaOYKNanFaSZFv5eqfYHGgwvqED/iSBtz0xv45nhvk7Wb
         YZZ4+ZgMGKptQHSQL9y1om6aVvLgeY52i4wto3iQQitDe1ivC6uTAAp/zxHFu/qXnJ0a
         dKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750562991; x=1751167791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYVDfYJEfBaM0ssLbKCKZebV837CxPuDOg/+Kg5KUqU=;
        b=r0AiQ0ctka8zN6qNLLT6yqLMRNb1fe7zFsc7JfcuYtVZbiyiQNxL1/7LKc4QoP3leq
         T9QgNAo2/nC1rkH6ewkxt0jZJB9DTJVgCni/9xG+AQOibnplREYYUHiF5LYjYFU5yAKb
         B4hKEUwFVSfFPJgt5uY2xVNdqxD71DJcpx0FyrUYe+xM1vtau9YJ9A0bO5kuynVvH31g
         jyl4d6wVFDCkE/1OXYUaR+bjPZJs5SuTdrzESJY9mDbiZemSHDleuG3zJeIG+5PXJ0xo
         TY4/7QIGzSagxz8EBFW0D4v48a3Gnx8/T48eDrodmJTyNx/tVBFbrBPS0xSaJ4wm6q4V
         zL6w==
X-Forwarded-Encrypted: i=1; AJvYcCVs49wBEpRWLPaX519xA4BNelX3JcNp6BYAa1z0QrEFERizEU1coBrq+/XNfZfrxJDZjqFv6nkv1g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxI9XdbZ9cP9Ij3EG1kNku9JnNhfpXMY8PA94Fz6UbG27R2gvzE
	B2TQN6/dcR+KsqdEv0EVOsp7HUAMcuL9qs1ogAOTRbaBWbPiPjmvW6QMSjBiQefOfV4=
X-Gm-Gg: ASbGncuttt6MZobIdLrS+nMi+Iug5IbqumTx72JLuSHg849pbxUbpnyXA654DbuccFD
	zgBTSDfbWoFxZ2mbsJcUdK0TmC/xxU+zAp4GnidHIKbcAcF5qwDVlcy5+idh/1EAn2fyM9xFO/R
	MAJPdfA8la6OmJglcBtpTCKRD2yyqlvTRuw1Eox6QP0Z/klLwY1t/eayDheY8/QOyprCawIwRj3
	cRwupiKkNXrHT1AE3r8ulrSLA7SYRJvf7pPO5k4tO+O2ICqJE0dmtbMHi2pEaX/fABAzePgcBAw
	FNs9r4xV0iPEUclMqeZiycR2UFrW5HG34zR+i1R9/RoR55uV7JG1xRvfaCJyWyC6AY14juygjBk
	HlJRunHS5+N9gseb1ce98+p38z0ppemXepiU=
X-Google-Smtp-Source: AGHT+IEzbUQ+7RVQuRV0EbLr3Cx1IwLGHmCYPT6OmFah/l6Db4G4Rk9xcbyX4PneJMhTkAYKbjMc7A==
X-Received: by 2002:a05:6214:469e:b0:6fa:9a6a:7cfc with SMTP id 6a1803df08f44-6fd0a51c75emr132820726d6.26.1750562991350;
        Sat, 21 Jun 2025 20:29:51 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd0945183dsm30014526d6.44.2025.06.21.20.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 20:29:51 -0700 (PDT)
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
Subject: [PATCH v3 4/7] rtc: spacemit: support the SpacemiT P1 RTC
Date: Sat, 21 Jun 2025 22:29:36 -0500
Message-ID: <20250622032941.3768912-5-elder@riscstar.com>
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

Add support for the RTC found in the SpacemiT P1 PMIC.  Initially
only setting and reading the time are supported.

The PMIC is implemented as a multi-function device.  This RTC is
probed based on this driver being named in a MFD cell in the simple
MFD I2C driver.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - Added this driver to the series, in response to Lee Jones saying
      more than one MFD sub-device was required to be acceptable

 drivers/rtc/Kconfig  |  10 ++++
 drivers/rtc/Makefile |   1 +
 drivers/rtc/rtc-p1.c | 137 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 148 insertions(+)
 create mode 100644 drivers/rtc/rtc-p1.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 9aec922613cec..27cff02ba4e66 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -406,6 +406,16 @@ config RTC_DRV_MAX77686
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-max77686.
 
+config RTC_DRV_P1
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
index 4619aa2ac4697..f8588426e2ba4 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -171,6 +171,7 @@ obj-$(CONFIG_RTC_DRV_SD2405AL)	+= rtc-sd2405al.o
 obj-$(CONFIG_RTC_DRV_SD3078)	+= rtc-sd3078.o
 obj-$(CONFIG_RTC_DRV_SH)	+= rtc-sh.o
 obj-$(CONFIG_RTC_DRV_SNVS)	+= rtc-snvs.o
+obj-$(CONFIG_RTC_DRV_P1)	+= rtc-p1.o
 obj-$(CONFIG_RTC_DRV_SPEAR)	+= rtc-spear.o
 obj-$(CONFIG_RTC_DRV_STARFIRE)	+= rtc-starfire.o
 obj-$(CONFIG_RTC_DRV_STK17TA8)	+= rtc-stk17ta8.o
diff --git a/drivers/rtc/rtc-p1.c b/drivers/rtc/rtc-p1.c
new file mode 100644
index 0000000000000..e0d2c0c822142
--- /dev/null
+++ b/drivers/rtc/rtc-p1.c
@@ -0,0 +1,137 @@
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
+/* Offset to byte containing the given time unit */
+enum time_unit {
+	tu_second = 0,		/* 0-59 */
+	tu_minute,		/* 0-59 */
+	tu_hour,		/* 0-59 */
+	tu_day,			/* 0-30 (struct tm uses 1-31) */
+	tu_month,		/* 0-11 */
+	tu_year,		/* Years since 2000 (struct tm uses 1900) */
+	tu_count,		/* Last; not a time unit */
+};
+
+/* Consecutive bytes contain seconds, minutes, etc. */
+#define RTC_COUNT_BASE		0x0d
+
+#define RTC_CTRL		0x1d
+#define RTC_EN		BIT(2)
+
+struct p1_rtc {
+	struct regmap *regmap;
+	struct rtc_device *rtc;
+};
+
+static int p1_rtc_read_time(struct device *dev, struct rtc_time *t)
+{
+	struct p1_rtc *p1 = dev_get_drvdata(dev);
+	u8 time[tu_count];
+	int ret;
+
+	ret = regmap_bulk_read(p1->regmap, RTC_COUNT_BASE, &time, sizeof(time));
+	if (ret)
+		return ret;
+
+	t->tm_sec = time[tu_second] & GENMASK(5, 0);
+	t->tm_min = time[tu_minute] & GENMASK(5, 0);
+	t->tm_hour = time[tu_hour] & GENMASK(4, 0);
+	t->tm_mday = (time[tu_day] & GENMASK(4, 0)) + 1;
+	t->tm_mon = time[tu_month] & GENMASK(3, 0);
+	t->tm_year = (time[tu_year] & GENMASK(5, 0)) + 100;
+	/* tm_wday, tm_yday, and tm_isdst aren't used */
+
+	return 0;
+}
+
+static int p1_rtc_set_time(struct device *dev, struct rtc_time *t)
+{
+	struct p1_rtc *p1 = dev_get_drvdata(dev);
+	u8 time[tu_count];
+	int ret;
+
+	time[tu_second] = t->tm_sec;
+	time[tu_minute] = t->tm_min;
+	time[tu_hour] = t->tm_hour;
+	time[tu_day] = t->tm_mday - 1;
+	time[tu_month] = t->tm_mon;
+	time[tu_year] = t->tm_year - 100;
+
+	/* Disable the RTC to update; re-enable again when done */
+	ret = regmap_update_bits(p1->regmap, RTC_CTRL, RTC_EN, 0);
+	if (ret)
+		return ret;
+
+	ret = regmap_bulk_write(p1->regmap, RTC_COUNT_BASE, time, sizeof(time));
+
+	(void)regmap_update_bits(p1->regmap, RTC_CTRL, RTC_EN, RTC_EN);
+
+	return ret;
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
+	int ret;
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
+	ret = devm_rtc_register_device(rtc);
+	if (ret)
+		return dev_err_probe(dev, ret, "error registering RTC\n");
+
+	return 0;
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
2.45.2

