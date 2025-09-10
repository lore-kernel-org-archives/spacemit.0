Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3703F306494
	for <spacemit@lists.linux.dev>; Wed, 10 Sep 2025 07:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757488408; cv=none; b=evs0/uDft5Fze5EwPvylgqeTEt6geI0MJb4pHFstrAYD/bxtXUDfCt0wgEWogvvy0C3Rekebbv496KCPYa0XpnlJ5b0QAh4291WogsZkCKpt7Ur1pPDXstaptush6gmnGDbtsFqKI/bOwPW5RzgCTv83x3I2Ja20x5LUaQMJKPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757488408; c=relaxed/simple;
	bh=HibveWzwd76lNGw0hoPtFesB/eis3CiQnF9lnEPr4gs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qVFt86AMT6oWatuGZ8c6+0wd0amD9FpTkDmEIjEMX+4LGsAwiYZzitQeeuwUEEH1aPgPslHpNgGZVO7IHSz9f/Z7QKHrJEJjYqg75+aKXDn8v/8aj9K89d1i+soNLtcZYgtzBHM/tUtNkCth9XI16IsuWb6DGxPwFEhJ6hkjK6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=B35OJeo/; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="B35OJeo/"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45df7dc034cso3426685e9.1
        for <spacemit@lists.linux.dev>; Wed, 10 Sep 2025 00:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488404; x=1758093204; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PgdrM4aJRYrczpVTjbdMrpsxOv5ioO0+n1bSkbQmCXA=;
        b=B35OJeo/TChGOFdOBZpWosIJbjQfCIOYVZkvwsVpK8Vo7nyQD/BDZ6Y1zd+FiqzF4r
         0MFomfDx1atlcwGJYPCA244jOr1q0Cof5/BJkimPiqaX/AhOpjdEITP1HGeUnm1y98oY
         5DajXVquC6+Gmhh+HgIf+Gq1BKqqYj/hijd6VTluvdseuYCz0XZmrmxeIQL5lkKWMEEn
         o1aXvjN//ULijRYcXFPBO6LqAm8RQ/DxcAGXtj919WHws2kfSX9vJCbPjqYljkrJfYvU
         Cr0hEszYAeYlsfrk2gpBKNoNBbxpQUMSJ1Vs1NdVFRRIRovTK3/jrjuJxXwCic+ggeCk
         Z4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488404; x=1758093204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PgdrM4aJRYrczpVTjbdMrpsxOv5ioO0+n1bSkbQmCXA=;
        b=fftG0kyxWxnLciz1ZMDra/ZEf4LmPTHH7XAeSp+/M9oA2Rfs57Ab3UtiJHb2bg2Xbs
         J0Khq07A73CJGtw6/loZgGmE9JrWqzvdg82R/ZHhpJ6Wi+CWVV/wRpUhF+xuPi8XHQHp
         ur+ZkBc3SqnMqrlphXN2VTbrl/s91oyWxx4XtibgOaXSC4qsCny5Kyy2H8q77GxJBp9K
         9wyfTkExsaQjG9xKJh3kwQ9F8YNh2WdTvWmdAdI6saJ4i0+6XuBWjoE/SvV3Zj9rdcGP
         eqUwqEvIt86a+NekXiAwIP5vwLdO2FWhexedB5F81QTy/MDb6C+mVR8usUbXuB1d/7xz
         KpAw==
X-Forwarded-Encrypted: i=1; AJvYcCU7i1/HkYQKPpwpAD3EVJ4GFU9+mzC8zu5P4E2d7yEWb3EXcAc6DfFRU1CiGKH4FDsxpwYReIVzHA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4ZprakhvwKNlgBHJTr7+bs+Q93VKlLrTa4cNkge/K7FfaQKtn
	Uizhlwc8IPrc3ONDBNQFreb0qbtuf+3PM5cDkxU+X8jOwc6DkJKmEEKJQodTv5Jw9Qg=
X-Gm-Gg: ASbGncuFszU/Dzn0wWGf7fAY23HCzhNRvQzDBk5HV9OaKfMqa8ejfBBQFrvvnPY1z5+
	dZJgxJYAhD2mgOb+8Gea1g0Y6FHKgsbS9GYSLbVG3OaJcK/dCCFq27M9z4tx6DbuEMbCrI5Oist
	I+zaa4tG8MC48mDh1jvzlEvO3auu5L4VMjZR0x72l5vylzAE4T8vHPNrwGR0PVIEmMM3CLG4kFx
	MEksgCoHTKGq2iUl/Lg7c/V23q+M0+BLyk3AV9olWrwhD2ey+mRzmxrzQ2JIu35fczkCzLxByrF
	EpBAYJdPvhb+Q18OHiN0sYAilIBwquKsQ/jcN/fMAl7eF3jEDyaZXHurf9ey1xobuITe6WhSvWO
	H+OVBQFRm/4z05mvHrmU1DfEEf0iCFR9o3A48lg==
X-Google-Smtp-Source: AGHT+IH52c0NDjTg92BlFI1StBbf2SlfXbs3hSBtxvJaf6s0LfTwWHF4zDme3188iCv7fISkb9TvkA==
X-Received: by 2002:a05:600c:548a:b0:458:bfb1:1fb6 with SMTP id 5b1f17b1804b1-45ddde6a471mr110866285e9.2.1757488403590;
        Wed, 10 Sep 2025 00:13:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:13:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:12:50 +0200
Subject: [PATCH v2 14/15] gpio: mmio: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-14-f3d1a4c57124@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2870;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=jTYzXHXb5czFalzYciLNM7kw2y7Wfknx1rBEQWD7H2o=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTvYeCo2U5//1kw2eyb8GaFucYbACnhM1h1b
 j06xC/+zTqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7wAKCRARpy6gFHHX
 cjZVD/9AFqlvniqbT8HvF7F7bzr3GPnqTQ0kCgmRscqp7Q9nkhIRz798jAllvC7arbNGc6Bd/RR
 C64IshK/9T6PmCTb+thHDxg39m28kKBoWH+p2PNkHLz4ekmmyLblZKGwCzUYg2qMavLi1t7OOgr
 3QuG/P4WFoXwe9ty7Z44O2ZITUKFWF+aq45RponrykKQtLfyg+257GPvlx+qj5oTiXV5jxsaEbM
 0Lptqy1v/MepVKY7QL9OW5xP4U2OnpLLHcIaxF7bN9z28L4JcII4h3oJn6B3NDss+cLn3uVNSX2
 4vCnNMIiibPIFdgzJvDuIU0HP4Rgvge9/sJZdobf/KwcIf1ZlrnqH7trBjzQ+v8tXlMhY44M8mE
 mSYlYN77g00pU1hZMXt2ptHkrBwtY+oknQfieQe31B9bzQT4nLf/yW7hohCkD8oR1YcVIPEoHGX
 4zh+hMw/Z9e6srBa1u0J0TMB7l6igulBC6BiOqd1qoxvJzxS1KvcYCKGv0bnjbEDiu94Ad+KF4F
 JUSl6rEBXpdR4lLTQ8P0T8cgh+b+v0l9cz6IpL2gRujbwWSF8wWko1Oe+l8Ob9qw673A1dV2UTI
 ELiQzt6TSguDmVitgU2Yu2NxFJAoOQfbuBnYqdqbb7DaNGlNAxUxeZNc8EpHHrdQNm5PMxraSAM
 iP+AJ2/RibBc5cg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mmio.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 79e1be149c94842cb6fa6b657343b11e78701220..b4f0ab0daaeb11bd88723f8b1c15bd09225f1d97 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -57,6 +57,7 @@ o        `                     ~~~~\___/~~~~    ` controller in FPGA is ,.`
 #include <linux/types.h>
 
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 
 #include "gpiolib.h"
 
@@ -737,6 +738,8 @@ MODULE_DEVICE_TABLE(of, bgpio_of_match);
 
 static int bgpio_pdev_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
+	struct gpio_generic_chip *gen_gc;
 	struct device *dev = &pdev->dev;
 	struct resource *r;
 	void __iomem *dat;
@@ -748,7 +751,6 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	unsigned long flags = 0;
 	unsigned int base;
 	int err;
-	struct gpio_chip *gc;
 	const char *label;
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dat");
@@ -777,8 +779,8 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	if (IS_ERR(dirin))
 		return PTR_ERR(dirin);
 
-	gc = devm_kzalloc(&pdev->dev, sizeof(*gc), GFP_KERNEL);
-	if (!gc)
+	gen_gc = devm_kzalloc(&pdev->dev, sizeof(*gen_gc), GFP_KERNEL);
+	if (!gen_gc)
 		return -ENOMEM;
 
 	if (device_is_big_endian(dev))
@@ -787,13 +789,24 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	if (device_property_read_bool(dev, "no-output"))
 		flags |= BGPIOF_NO_OUTPUT;
 
-	err = bgpio_init(gc, dev, sz, dat, set, clr, dirout, dirin, flags);
+	config = (struct gpio_generic_chip_config) {
+		.dev = dev,
+		.sz = sz,
+		.dat = dat,
+		.set = set,
+		.clr = clr,
+		.dirout = dirout,
+		.dirin = dirin,
+		.flags = flags,
+	};
+
+	err = gpio_generic_chip_init(gen_gc, &config);
 	if (err)
 		return err;
 
 	err = device_property_read_string(dev, "label", &label);
 	if (!err)
-		gc->label = label;
+		gen_gc->gc.label = label;
 
 	/*
 	 * This property *must not* be used in device-tree sources, it's only
@@ -801,11 +814,11 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	 */
 	err = device_property_read_u32(dev, "gpio-mmio,base", &base);
 	if (!err && base <= INT_MAX)
-		gc->base = base;
+		gen_gc->gc.base = base;
 
-	platform_set_drvdata(pdev, gc);
+	platform_set_drvdata(pdev, &gen_gc->gc);
 
-	return devm_gpiochip_add_data(&pdev->dev, gc, NULL);
+	return devm_gpiochip_add_data(&pdev->dev, &gen_gc->gc, NULL);
 }
 
 static const struct platform_device_id bgpio_id_table[] = {

-- 
2.48.1

