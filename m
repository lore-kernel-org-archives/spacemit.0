Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47A430F927
	for <spacemit@lists.linux.dev>; Tue,  9 Sep 2025 09:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409371; cv=none; b=pVfUBVBnQq53roq3N+FB7IR/g96+bHlUzZ9Lk16QWs0Dc8lNebGleHnYzME3oPmKwxrA6QdWfF5qn5+klfO+xH6sq35Ie4QaFM/rwF8soeZQRwVRG4WMzuYhephB5M5iydRUsihRvT9iZ3+LM9kscUt4BCt2yqtOWnhvN+ddazM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409371; c=relaxed/simple;
	bh=KDFwPnbkRvx0fTKChYEHU+W71Zlm+jzr4ejpjKKTNkI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O4vBohh+YUMwiuS9IgugMQ42mgG+VzcEZIxRZcaT7T7vQ3QWYM6S7t6lzni5/J0/QS5HDe4akOqpKiG616wQBN9Mee3gB4A2DII38vk9OkG6426yFIHyNoPjdPpAJwoFTHY+o9SNxymNUkVdYRHybwyK353w38cDwPlRLoY/xPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zGg6DswC; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zGg6DswC"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45de6415102so16931695e9.1
        for <spacemit@lists.linux.dev>; Tue, 09 Sep 2025 02:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409368; x=1758014168; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMmaVn+LZJgn5b7c1rWtdZrF0XHWPwWhtZTr2dtFlt4=;
        b=zGg6DswCdOnSCvjxiww8mV/WOpEpDTvrw9F0saKUztdFNcEikZs0hOtZVdO+l9Nci/
         qed93da2TXaxsd68FjyrXnsOgqcs8GW22qQMQnZWVrQQd3PQnP7HrB9rc1QpRrtI8p5m
         5mzqfHXsdP2JJV6D9VXpfrgAY7odzg1MmjTwoxinYeKjxePeU1IShJHjnICCqdDc4q+L
         AzTzdM50LkCCHG8Tfre7UM+FhLaJ6OD4r8llWxKmRilYhZLemGzL4TOQiItDp4Kv/JMP
         MQOKjyf4SX6hcF0Y2wsor7K/SOPa76oRAkvwyd+yXXqD8IZ4mK8c+Cz8nrciTOd18+wV
         ZW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409368; x=1758014168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMmaVn+LZJgn5b7c1rWtdZrF0XHWPwWhtZTr2dtFlt4=;
        b=kARgPZ57o331GNn35jGNtMABFk89NrUUlTvKAB9Cg3fpggLg1Aifcer8XtteHjxwcL
         CmTik5FVAegreHdL56g7y0P3eObs+n1Vh6EZJaIcZJXfqg1mdv2KMC+iLfqPBmvWLMoA
         zNlPh1vLV8cVPeR5ug1D1AJrNcg8/WjvJA/27Wadr5JATIHGxjqVB396Va88AFDJK1FY
         YFpkGbDzsC29zDbGKur+4D5+HDv705ARk3eENn8EWRUAlMwYb1zkp3J/wL4eZcWtgTEv
         TD1I+vbOqmkQzWkC5V5ekXrcLb+u+pQ+ADFbBOyPdVgl0kr3/GKoXkrfY574uvbJfgAk
         fXrA==
X-Forwarded-Encrypted: i=1; AJvYcCUmSXoQdP2LhybTki3EVAwN/W5eaKeG4Hj/TnDA8U/QktSRNt8wvHUxttSfRy1iNBBEjx/UEZEo6w==@lists.linux.dev
X-Gm-Message-State: AOJu0YygcaQL5hezVCycdSDByn5289oeAwo7e7gTv8FuE1GZUuuBHpHU
	SymR4X/P70Ti2FLEQ9pFnvgbWd1R1xif8dg1+WmEm66+/W+E9/okQsb0+FPIL8/15Lk=
X-Gm-Gg: ASbGncvf+uJPCIGSm0JEtaLw87F3LNrRDOBxI6D6hf65ragn31L3hFaM04e/MRdXJOO
	3k1RwelB9r2AIioto4w3PskixxCwHaqM+JB+0biK1IMeWmRJpvEzs4MoVMDcktgTpEXVYHStzJJ
	KBwM0F0771BSkjMgYTuVR8wfe6yWty+Cj9dtloVPF43TqYuGXvr+vmph/khbBq+7U8g1LN2+q4G
	BqybdnESSBrjlaE8pvru7ThkeLEcbiSwRoRMVnP5FRa1haTkyLnuC8ZPVKIrs2YS69JB16qH5kJ
	lOC0Vr2E7UpzY/XGUnUHlLJ32VD2KP+Y9mlzxCgNa92Fyf6IhpRaZJBZpAQUSXdaneLXLlBrFNy
	m10j4zhZFCC15ZlqFfQ==
X-Google-Smtp-Source: AGHT+IFmO6VqhZ9BkxEjJhWWUjTF6UtWEURBON8fvebih0GzMhUphDe9TftqByslO0IRvxtisIwrOw==
X-Received: by 2002:a05:600c:19ce:b0:45b:b05a:aeeb with SMTP id 5b1f17b1804b1-45dddec8ff1mr97136895e9.28.1757409367901;
        Tue, 09 Sep 2025 02:16:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:16:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:40 +0200
Subject: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2177;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=OpZH1E4uX1rbCcdgDBOgsBrK0sLVF3+FQJb0MPT9Hmc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A6p94D+S/c4LzuEPR6IThg0j1mZ/5T2G686
 meGifKdh+SJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wOgAKCRARpy6gFHHX
 cvcmEADOfAiuC1Ep9RvIkJ+mqoo9WSMNXkDcTeYwBaiwwjIz0muCH85jNMqW9b3ZFhtBFSJuNtX
 arXg6eVDNEk4OcNWPJoc69s1QTJ9+jgvdXEqIvD/bmYCRDMpo+jQnl8UeLBhd7CBBEa45+1a68E
 M+d7xx0SBcN6nLNJqgO912DPu80/cw/gjXeHHbHoFmaCoklpIroAj2MEnMLoRluFVHoFaQ9d+8K
 Bu4Pzdqqu0HRLMJ1LAFhIF3VYoI+tpwPNIgT3E8/+5gmTzkcVW9Z+k/HLDTuKTyzC8lur0Ery/Y
 kT014qHXyE5TGEawY/IxfimrrtPXPu+wV2svkqUHpN3Pv7Qgph9GzQ8xluK3HnRV1tt1HUK/IMe
 f7j/0tewxNFyFeAGBlEua07W3bCnMCARotAno704aWDtPSIuP314GWm3T8z+l44QTe1F7vVVj/2
 8Q8vQYPB7OxkgxJv93dnJymPuJ1f4r/osq1nj6J8nngFzM2/Kc+UleQrCg+vmNpBSv4PTsApf16
 usJOj6hIKzfx05g/FzdSTDCqDptEEALnloKNJqBv1h8Y/qzjzei+M2XQmue1W5e8k7FqFuoP0zo
 AKlT5n8Ntxzdvl3e7GrObrqLBzaR9CTUOYcDGkDl1ixM/qLuQAJZWWxzTQZWfNeu0QrOndJIM/o
 3Bex3gwvCoubkBw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sodaville.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-sodaville.c b/drivers/gpio/gpio-sodaville.c
index abd13c79ace09db228e975f93c92e727d3864ef8..6bc224d3a561077bf3438a70591e1f313ac834f3 100644
--- a/drivers/gpio/gpio-sodaville.c
+++ b/drivers/gpio/gpio-sodaville.c
@@ -9,6 +9,7 @@
 
 #include <linux/errno.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -39,7 +40,7 @@ struct sdv_gpio_chip_data {
 	void __iomem *gpio_pub_base;
 	struct irq_domain *id;
 	struct irq_chip_generic *gc;
-	struct gpio_chip chip;
+	struct gpio_generic_chip gen_gc;
 };
 
 static int sdv_gpio_pub_set_type(struct irq_data *d, unsigned int type)
@@ -180,6 +181,7 @@ static int sdv_register_irqsupport(struct sdv_gpio_chip_data *sd,
 static int sdv_gpio_probe(struct pci_dev *pdev,
 					const struct pci_device_id *pci_id)
 {
+	struct gpio_generic_chip_config config;
 	struct sdv_gpio_chip_data *sd;
 	int ret;
 	u32 mux_val;
@@ -206,15 +208,21 @@ static int sdv_gpio_probe(struct pci_dev *pdev,
 	if (!ret)
 		writel(mux_val, sd->gpio_pub_base + GPMUXCTL);
 
-	ret = bgpio_init(&sd->chip, &pdev->dev, 4,
-			sd->gpio_pub_base + GPINR, sd->gpio_pub_base + GPOUTR,
-			NULL, sd->gpio_pub_base + GPOER, NULL, 0);
+	config = (typeof(config)){
+		.dev = &pdev->dev,
+		.sz = 4,
+		.dat = sd->gpio_pub_base + GPINR,
+		.set = sd->gpio_pub_base + GPOUTR,
+		.dirout = sd->gpio_pub_base + GPOER,
+	};
+
+	ret = gpio_generic_chip_init(&sd->gen_gc, &config);
 	if (ret)
 		return ret;
 
-	sd->chip.ngpio = SDV_NUM_PUB_GPIOS;
+	sd->gen_gc.gc.ngpio = SDV_NUM_PUB_GPIOS;
 
-	ret = devm_gpiochip_add_data(&pdev->dev, &sd->chip, sd);
+	ret = devm_gpiochip_add_data(&pdev->dev, &sd->gen_gc.gc, sd);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "gpiochip_add() failed.\n");
 		return ret;

-- 
2.48.1

