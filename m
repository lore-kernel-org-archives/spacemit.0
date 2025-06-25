Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894542D4B7C
	for <spacemit@lists.linux.dev>; Wed, 25 Jun 2025 16:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869693; cv=none; b=R3TkHOOxT/VTsOrRVhwFtQ8+SoZRENy62JSf5SBoHpDIUM41vzIVOifpFDuca7pP3aUWkFfV1y7W8zgoGUVmArPtGwkR+YyqWjk+Ug0Px/9JfhuAj3n9ELvs749dSudagHDLtdFUYW/HL5ZshtO7dY+tNhdXKGkWr9rsQHenA3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869693; c=relaxed/simple;
	bh=iBNxwWt5RVG6aorzlp6NmbugrktgSEKzYp0YaYxUbVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W6/9oyNXGX7DgDe/V4qH1cBphyHTOyH+Cf3ELcQj7KtkP963LQLJa0hGXgbK3cAKYm9+T3zmATgsmWzThz/banfSvtAYJnsW80zq9i7SU5xOxtOTdDAgD2PsdrrdlA2R0oBZVvzYg6oHdBH5pJV4ZY1+KhFTKWQWogLRO654pNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=g75i49dY; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="g75i49dY"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6f0ad74483fso1344686d6.1
        for <spacemit@lists.linux.dev>; Wed, 25 Jun 2025 09:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750869689; x=1751474489; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ECik/dLyp7V3J7nKrFzv5/sHAYEHXhANSBESMnVLr0=;
        b=g75i49dYbnfC0Pk5Iavh+1izpEBfEvQmIqX8A64PCStHSnO5cJlHmxwT/5almrdRm9
         s0CsjNQRUBb+l0K24OpMVf/Bm0wmTS6GsAAYB5yDK+FaYtIS39ZIbJzueOw7V7r5u6WD
         6Fhasb1kS7hswQBFqe6AybQVdLPk1ZwUXVb+QJr9jQaKHKoH/w3zkm0Yy9DygjH+aZyO
         Fn80c4Og8zLKsbpG4m4d+z5qfg5nikgQUrBkcapeRZmlQqWRiIKRUOh5RnRe4UwIAXcj
         BoP+2+DdujLD4MUFRm6XgG7tcjH5vGtX+VsMF+UlH7jHv8gKEqMklAbMaVTkXctoSIG4
         fcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750869689; x=1751474489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ECik/dLyp7V3J7nKrFzv5/sHAYEHXhANSBESMnVLr0=;
        b=taQ0eZ907tsP2oCOr/Ts2kU1wPyglL/K6qJ6f/53LcRMmiEiZFuub2MQPlECHIMwbk
         lR/8yuuyEaw8Q+3jjuyrdDj+oL2vG4/oit6Fiaad1vViWPwxF88JxravM55utIbR/7dm
         XKpooaGxqKhxorc5/WMQaRbi6ggyajwEuis3+lLZ0m3a/tgBDUB5gbPIB500NFXu+ir+
         rAlHW7V2urpvrqOGJPiSMW24pQAJ9rF7sseb/wFYYMkE1fIUW94Y7YAyVSId7DKgnjPE
         tSl/AudpENQJTrI0pMDXS6HywxxlOyxkVztQ3SrZnHcwsEZWDVJVhhXXXJXesHMXkxYl
         AosA==
X-Forwarded-Encrypted: i=1; AJvYcCXG0gj3uMTiR0wTEznBdhCy1LxFIdPrsc4tM3PotKncQ9lq4SGsS1ZBJeRgzsUsucm+mAAuZjlzrg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxSO70m6BycT9CrimyM8vpTRq8BzAhjedY/cEFWKE38DdW5gMuO
	j86dCTicC//Hn0R0DwcOTgGUqdZMi9QptDQizZch7Liyq8geMwxPYA82QQcX4lVDLFg=
X-Gm-Gg: ASbGncsguiptIdjssN7hmazFyc21o16vh3MJ2c3QUdWe+LowvFVXaIyTxiRyevlm2to
	YTIXdHrw+jKDC6lvJvaC4hBR2vMK9nd3XGroWLG3fLr15jAFsDroEgnIk3zkDPa/bBUIW7WKtPP
	nb/4WT4QHNyEe00frWXp0vJDZKFPg/EeJgNzqU/ANYWMTmvxYKQhzH2q5GSiFlhBSG12oBbpVm0
	JeI61DqeOAwu+qh2KuYLHmJ9cEMDF5The5yvkak8RPHBCBLvszsDuOFHQGFlG7BKrwfi1JRDNRL
	eQjqotF1JSLuJvmycGRQdE35dAkKkVe4FjXW53jL6+KCX0ye8uLHLb2zl4+AZ6Al9b7iiBfLDaG
	12zQp1yj/Gc8m0QSXs1RYaJTHInkBSxxbHRs=
X-Google-Smtp-Source: AGHT+IH2Rw6qDhj6gxPxTkfHXvCTXxfzxWK7HJ7WiW9c6J8c8xpC7Qe6SfN17xAiNow/8qw/cdT4KQ==
X-Received: by 2002:a05:6214:dad:b0:6fd:1687:2e1b with SMTP id 6a1803df08f44-6fd5efac323mr56502306d6.27.1750869689350;
        Wed, 25 Jun 2025 09:41:29 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3ffdb190esm576783085a.86.2025.06.25.09.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:41:28 -0700 (PDT)
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
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/7] rtc: spacemit: support the SpacemiT P1 RTC
Date: Wed, 25 Jun 2025 11:41:15 -0500
Message-ID: <20250625164119.1068842-5-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250625164119.1068842-1-elder@riscstar.com>
References: <20250625164119.1068842-1-elder@riscstar.com>
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
v4: - Rename the source file
    - Rename the config option
    - Get rid of the time_unit enumerated type (just use indices)
    - Loop in the RTC read_time callback until consecutive reads
      produce the same result
    - Return an error from the set_time callback if re-enabling the
      RTC fails
    - Don't report devm_rtc_register_device() errors

 drivers/rtc/Kconfig           |  10 ++
 drivers/rtc/Makefile          |   1 +
 drivers/rtc/rtc-spacemit-p1.c | 169 ++++++++++++++++++++++++++++++++++
 3 files changed, 180 insertions(+)
 create mode 100644 drivers/rtc/rtc-spacemit-p1.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 9aec922613cec..93620f2c9b29c 100644
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
index 4619aa2ac4697..a24ff6ad5ca58 100644
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
index 0000000000000..fdb8e3502c198
--- /dev/null
+++ b/drivers/rtc/rtc-spacemit-p1.c
@@ -0,0 +1,169 @@
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
+	u8 times[2][6];
+	size_t size;
+	u32 i = 0;
+	u8 *time;
+	int ret;
+
+	size = sizeof(times[0]);
+	ret = regmap_bulk_read(regmap, RTC_TIME, times[i], size);
+	if (ret)
+		return ret;
+
+	do {
+		i = 1 - i;
+		ret = regmap_bulk_read(regmap, RTC_TIME, times[i], size);
+		if (ret)
+			return ret;
+	} while (memcmp(times[i], times[1 - i], size) && --count);
+
+	if (!count)
+		return -EIO;
+
+	time = &times[0][0];
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
+	int ret2;
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
+	ret = regmap_update_bits(regmap, RTC_CTRL, RTC_EN, 0);
+	if (ret)
+		return ret;
+
+	ret = regmap_bulk_write(regmap, RTC_TIME, time, sizeof(time));
+
+	ret2 = regmap_update_bits(regmap, RTC_CTRL, RTC_EN, RTC_EN);
+
+	return ret ? : ret2;		/* Return the first error */
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
2.45.2

