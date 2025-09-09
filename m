Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD2130C34C
	for <spacemit@lists.linux.dev>; Tue,  9 Sep 2025 09:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409366; cv=none; b=fK9nY7cMTm3ccxkKkbRKa7PZiKS6vFXvj7dRL/cxe34LaHnwK1Yhuj2BXerU5gTgI/MyXDrgk6GOn5ORo2JhRNBdduob8EPLbALzppp4GbrjGMzJEEpnCIdAWSJ254ransNcVh8x4Fnf627jAJADp8ufJxpRs53dTqgdZZC3I1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409366; c=relaxed/simple;
	bh=jG8CMLb4inMj87fVDZoRGePD2w1MG5h8a/maIqRELGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qvi6D9CFITWGMxTTS6IqHkLRe/uTqEHctDGbiZ0G+AR494IrZw5VaP4oEPVWlVWIns/BsQ6FIj1aO4NWy/BpKGtv3FzIu6UWmyHEL5YGb6Q4U8AgIewKAX4X5pUVAbl3ELnSb2OIwKaOfKtvYdifP1OSfp6IoDj035WQvRmjhlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=aW/Kz8pt; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="aW/Kz8pt"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3e7512c8669so414183f8f.0
        for <spacemit@lists.linux.dev>; Tue, 09 Sep 2025 02:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409362; x=1758014162; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bzDGMJfmWh4iChkJ6qtmNZIGp6yJhGT0+TEuoPl0ljI=;
        b=aW/Kz8ptNHvsDCXmYL4HcD6ttE0fgdEl/PZwMkOuu4FfZzujb81qBN2uD0fVALZjFl
         HdBcPJcM0L0idSgVu9qi8q3jXJXnJ15pwxlt1OD6KffHElNBpLBI1UE52WojHf5fWOeV
         fFLrg0FOehxr0fZqf1OgPxFjtsEr0ykugwRNqXx6yDoLWbcDp3PXiuAO9ifMbO/GfsQe
         0mAILhce/7lSfXXrKvJy32YLxkcc9TUKhu8Hb32MSki1VB9eUbiwox2/BAEBxfnIY1Vx
         eZFkbBvBBIOMrMACprqULxYjt7GWBYChTt09RzPhNCI1B8eobQJmO+ryWUjx+D/O3hou
         MtYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409362; x=1758014162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bzDGMJfmWh4iChkJ6qtmNZIGp6yJhGT0+TEuoPl0ljI=;
        b=wlrCGdZgFYEnKVqaTKjrH8LJpTQRaX8PHf32vDN2yiEK9tbZ8TNQ2sSDUwxgLaZm8I
         W9v89h4IZa7CzIUBsCJbGCd30rNJ5RMVNBgdoICmeb2K8+RMIvq2WtE4E3EDZW2zx+HU
         I+BqTJvJyLtnRc3A1dSDjWlsSjIG2pbubhYdaabrdupELqudqDThZuInNN9MDo7DpyHd
         QPBXB0fD7B444gbHvo2YDDMXw/iIQkzIEFvCEcIY8L4zqx/r5PU4o99quat6T3+ZVr/k
         CZ2+J7DtOPWfWs4poZC8M3LPT86zqbh8qCQUL6VRYf/4eCy2nuozHeRxc/PDCYqATwuX
         ltWw==
X-Forwarded-Encrypted: i=1; AJvYcCUCI3Z40crvlZE1dMPkWoWrQnlx4BjnJx56t+tCYjI3ZcOS2QGQc35ehAI1Iue95WKMngP+iTRwaA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzRczsAc0eZ95PeL/Vo4myhlnKqKUIgYDA60wHodKh4He2+RN+p
	hD9x6924G9FHu2F7S37Vl1PgIxOipdmekB5UZdWsAgOD0GpYcpjlkErdIY+MWluNuXE=
X-Gm-Gg: ASbGncvhkxLxTMynRF9H62xLeQK4CcD6SqyLVusg+mofdCXF/fw3e9JhDmhYFUiXEVE
	uG9VTtVuolWVAQdNFaBKga3RixAYRD5G0CSi5mewakzlAWS0WDFMi8ApDAt2bQOGdty4CmbzpuR
	J9Ruq3jL4n3uwJzfuSmgrVClqHJVKYXIUvCZtuhOr3luhQfoIK8Twwot/uWX1verGQwSMZzIYPo
	skkJZ/7IXQXRG9bL/MSP0542+QPcY7NtLtxcHA0NlmRsx0ywg7+sgefh36uxLJ9v9wdRmZSy2Ik
	N0P1hnlutkyKk5q5v9flP5vgjc64dy9CNsX8t/4OnHh/MO92Jj7hxecuzJRGTwNHmP0gkDs0VxC
	vn8PP5EoiBBA4FVd3Xc5ED22mzpdZ
X-Google-Smtp-Source: AGHT+IEXdV8NISTEczU1VIRow+5p3wj26/zBGlI6Z3gmRyg6ivq5S1t8D83LU8LnUsvQNLDOuZ4iCg==
X-Received: by 2002:a05:6000:1ac6:b0:3e2:da00:44af with SMTP id ffacd0b85a97d-3e64317f1b0mr9908320f8f.36.1757409362157;
        Tue, 09 Sep 2025 02:16:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:16:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:37 +0200
Subject: [PATCH 10/15] gpio: menz127: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-10-9f723dc3524a@linaro.org>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
In-Reply-To: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3332;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Lx7WAwqP3xPk38b+MFE7x8Xw00e0BMog5eP3WfeiT9s=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A533XVMdjGZ1Cis8dHGgNwfAnmr6Mx6nPBe
 og/XTnFC0uJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wOQAKCRARpy6gFHHX
 cvK3D/90zMG5N+5srxcF6cRvLhIl8gvluNWyjhGAirS1cpIR4x4XFqa1JRSvlICISA4EibUfKNJ
 PCqqwF+Ps0Sb0gxGvXIdzYawaenP1Ay9crGgWCG8dqA5Oh9GGEe1sAJ3fj+b7hBDr0bKiquZZZT
 qm8UPST9YGHy0qZh+xOow62KdkczRxAojMDQLZh5bNe/oCV04FO+Fi2fM8DdLa/t5tIjf7F2LgB
 x6h9uqy3ExyQRUSRz+yuRRbcf8RmRlNHgEWPxdT/3e82BmiIc1xpTXsQbELVgTrsgj3e7BS7LbL
 u1JuLGpx8VAQiDvKnl89BJUWTfjk1O22JRpUP1mWMrVgOcg7mB2OSrtIK/ddsW5l0rrC59Gmjk1
 qaeMlSXWkhqF29/nX3L9M9rKbGqUuZHBaVvBOvLRP4Xd9268YY19a70HNS76Wwt4rm2E0zsrkOH
 Cbic63a0LkP3gvP4WK+77qLsClCFZZwuKZGK4SYbDmK707BXh3JfQmdYoBi9czJtf53Man5JhgA
 niTsF3TUxsHuWNE13i0oWRxrsXAxGUlQk9nCxmJM7Edlm/ds70XygZ/W9iWscyAP2fou3Kx8RAc
 k0YZYHnRPLejEZmL7Zkig/YHgd750jS6if4fIrKfPjQVHCq8sRJM1mQwOksrvpikMmw2E9pyu3U
 8yS9x2NzZmFxfng==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-menz127.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-menz127.c b/drivers/gpio/gpio-menz127.c
index ebe5da4933bce730c70f83c1c0f86fc4a4cc9906..27cdbc36a5fd468dfcf9e0029651c8d22e176f56 100644
--- a/drivers/gpio/gpio-menz127.c
+++ b/drivers/gpio/gpio-menz127.c
@@ -12,6 +12,7 @@
 #include <linux/mcb.h>
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 
 #define MEN_Z127_CTRL	0x00
 #define MEN_Z127_PSR	0x04
@@ -30,7 +31,7 @@
 					 (db <= MEN_Z127_DB_MAX_US))
 
 struct men_z127_gpio {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	void __iomem *reg_base;
 	struct resource *mem;
 };
@@ -64,7 +65,7 @@ static int men_z127_debounce(struct gpio_chip *gc, unsigned gpio,
 		debounce /= 50;
 	}
 
-	raw_spin_lock(&gc->bgpio_lock);
+	guard(gpio_generic_lock)(&priv->chip);
 
 	db_en = readl(priv->reg_base + MEN_Z127_DBER);
 
@@ -79,8 +80,6 @@ static int men_z127_debounce(struct gpio_chip *gc, unsigned gpio,
 	writel(db_en, priv->reg_base + MEN_Z127_DBER);
 	writel(db_cnt, priv->reg_base + GPIO_TO_DBCNT_REG(gpio));
 
-	raw_spin_unlock(&gc->bgpio_lock);
-
 	return 0;
 }
 
@@ -91,7 +90,8 @@ static int men_z127_set_single_ended(struct gpio_chip *gc,
 	struct men_z127_gpio *priv = gpiochip_get_data(gc);
 	u32 od_en;
 
-	raw_spin_lock(&gc->bgpio_lock);
+	guard(gpio_generic_lock)(&priv->chip);
+
 	od_en = readl(priv->reg_base + MEN_Z127_ODER);
 
 	if (param == PIN_CONFIG_DRIVE_OPEN_DRAIN)
@@ -101,7 +101,6 @@ static int men_z127_set_single_ended(struct gpio_chip *gc,
 		od_en &= ~BIT(offset);
 
 	writel(od_en, priv->reg_base + MEN_Z127_ODER);
-	raw_spin_unlock(&gc->bgpio_lock);
 
 	return 0;
 }
@@ -137,6 +136,7 @@ static void men_z127_release_mem(void *data)
 static int men_z127_probe(struct mcb_device *mdev,
 			  const struct mcb_device_id *id)
 {
+	struct gpio_generic_chip_config config;
 	struct men_z127_gpio *men_z127_gpio;
 	struct device *dev = &mdev->dev;
 	int ret;
@@ -163,18 +163,21 @@ static int men_z127_probe(struct mcb_device *mdev,
 
 	mcb_set_drvdata(mdev, men_z127_gpio);
 
-	ret = bgpio_init(&men_z127_gpio->gc, &mdev->dev, 4,
-			 men_z127_gpio->reg_base + MEN_Z127_PSR,
-			 men_z127_gpio->reg_base + MEN_Z127_CTRL,
-			 NULL,
-			 men_z127_gpio->reg_base + MEN_Z127_GPIODR,
-			 NULL, 0);
+	config = (typeof(config)){
+		.dev = &mdev->dev,
+		.sz = 4,
+		.dat = men_z127_gpio->reg_base + MEN_Z127_PSR,
+		.set = men_z127_gpio->reg_base + MEN_Z127_CTRL,
+		.dirout = men_z127_gpio->reg_base + MEN_Z127_GPIODR,
+	};
+
+	ret = gpio_generic_chip_init(&men_z127_gpio->chip, &config);
 	if (ret)
 		return ret;
 
-	men_z127_gpio->gc.set_config = men_z127_set_config;
+	men_z127_gpio->chip.gc.set_config = men_z127_set_config;
 
-	ret = devm_gpiochip_add_data(dev, &men_z127_gpio->gc, men_z127_gpio);
+	ret = devm_gpiochip_add_data(dev, &men_z127_gpio->chip.gc, men_z127_gpio);
 	if (ret)
 		return dev_err_probe(dev, ret,
 			"failed to register MEN 16Z127 GPIO controller");

-- 
2.48.1

