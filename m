Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2D130FF29
	for <spacemit@lists.linux.dev>; Tue,  9 Sep 2025 09:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409373; cv=none; b=l/SzRJIpPnQwwu0yl/cK3fZ1ah90Kjv4BVs9/YghUbY58TUHXrhMxsBrijP518Hd1zIoOihcgY13/pw1+KZnk1L6evToLm7LaWywu6wertuFm1jAs6CzbzcNgFVuaivtx16bk78kCZH3QGoCAZuf+Zpo5x63u9qcgAkljMK+3fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409373; c=relaxed/simple;
	bh=pfY5A0u470ZWmlLJkPgoDVi7l1fJw/+hwUAmIObpEP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y0azb98NtWsFwGpCSpktP3DQcRc40W91ZePtK6JaNGsS1jHAZQDILySsZXC1YguH7LKjD7vo0niOA8thIB0ls55RZxBvhQr3BUWGANGGni2mNg/+Qn4+7AQIthgwlULiF446r0DJLPHDh8zSdtWfZ97rtEpGsf6Bp7HXwo+EHHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LvMyDv13; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LvMyDv13"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45dd5e24d16so37522695e9.3
        for <spacemit@lists.linux.dev>; Tue, 09 Sep 2025 02:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409370; x=1758014170; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7NS6kcVwueQk8PTITkKoVosiwdk6Lg4fQNiLC3+K+D0=;
        b=LvMyDv13JHCQHf48pHCwqBGeD/M1kwA/gLEVdODzmz9t23Gf99+jYAu4S4LnSGFOq3
         PjBZG0eZoW75B5ka3V+96QrTaybtWbt9iRSM2fuLgFw7UwDyuLPt7/Iiji2aK+G+w/PE
         0ellVMrrH6MtuVIhqZ8leNRQRiJNPlVrOs0azr0sUFcA68aPBaUuRSjfHjMWdDQE4gOA
         zjSMrZiJDXbl3rJKJ1Wy6+wInNZdVOvmXb9M7vFsGADC2D3kXdDkCqmBCUX9AM2UHbQC
         66/RG/HFfAKhtmXqXtK7ZF5qnSr7IqOD177ssBbC0vW5SjA1cMHwKbt+peO3MnzGGEkU
         KKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409370; x=1758014170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NS6kcVwueQk8PTITkKoVosiwdk6Lg4fQNiLC3+K+D0=;
        b=FhWbHGFKIcE+0g3OJpw98j6V7o/U3jYXGZHhemnxo8DuKLbvaSnNRybJPlBlKXJ9yH
         D/1Ki4wN8PBiel5HBia9O4GRPAZL8MrirmrFM7TIwKKMw7ZmdY4cRqf5IY0h4vAYoH5B
         M1EqRns13vQ6PM6brYIT0UF7nF/pWAlBNpBDGW5zqqCx/VeJv1PZYQwMOkb9ZRR32Vfb
         r0Jhi+Yn7l5lNSLt08rSWcVRIEo2a9tVaomoLXpoEd7E+3zymdoxD9Yxyx4F22y728zI
         4yXQWYj6CuMqOMq8vnzLIsdkZYFk5AXPaBjLZeBnDd8J/D6O7Fe7dQSDSy3+gHBgXaqR
         9TTw==
X-Forwarded-Encrypted: i=1; AJvYcCXvUEpXorBjKjQYf8XN7rTzpmo4sikmSA/jXAY5e7AZPk2mPrWrwd+s+xrysQzblCUqA+LR+nc41g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxqeDAfEYiTE9YKvNMX7ILUyUfLHvbNo4s9Tiho1zy8Uk+muZhR
	ezZVahp5R3i40SbzwKUm3VgVGpwh3NHMC/F7CUkgpbZqEwv/erQux00vLkxfemZiz9o=
X-Gm-Gg: ASbGnct1TJxXXHS+MxWDCK8SYy74/HplTUBOn0f5aK2SbPH8AnJlHqRFe/36fsiRlcs
	FZbBCb83SixuYyLTT6rXECZAZgXCopSCyWqTp0fVFtQOYs4Zd3KS+67nySSNQOLRhTUypmrZoKI
	eKw2+Zx4m/NywVDANKtuTqSPVKRZaK7SR1rc1vXPMjfoGl7SBmwOz/500Dl5QJ0uQ8R/XjspXro
	RlwsrZoiYF1l2VRgejfjei7IeGQzKFbPYqEX1dxd7+Oq8AK93b1HMS8Y+e9nu3LKamhPNpzY7uK
	BA5rJG8LJ5xprL6FjXO6OCiW0W3S4siCLDxjl0iGetsH07k4eh+KpXX1XfyRmJ2fyEk6DF6/uFv
	NGruXXas8sBAgRAb575Jai9JLTW8X
X-Google-Smtp-Source: AGHT+IGoJXBvUJSpBt2lyPYKxW7iuqKGK81p5w4PzJvmsSblYb1erZflWT5xfvs5LzLHjloaRsoS9A==
X-Received: by 2002:a5d:5f82:0:b0:3e7:4271:8c6d with SMTP id ffacd0b85a97d-3e742718faemr7197437f8f.34.1757409369974;
        Tue, 09 Sep 2025 02:16:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:16:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:41 +0200
Subject: [PATCH 14/15] gpio: mmio: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-14-9f723dc3524a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2852;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ghLIXnylAYcLYVJg4ksyA9B4/RaoUKjw1Cc8UARhArE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A7M1kWuQRnL65yzzeom2IENhFIls+CzXrAj
 boY3wL6vvGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wOwAKCRARpy6gFHHX
 cjUbD/sHaYXToO+u0YqX7txBkP4Ezr0jc2j0S4iqMhj2XV/ZOkALp/qxGiMGm3GaPndvBOHLlko
 a+JYIaEtSb2cUM4o/Q7qpaiHJY7TST7XfNadxyDo/SfLQtQr7BzQ5FBU7+WU8omyvO2EonGCvah
 cCGCSQagVc7uqle5HXUtXcx5bglGy23IdFAi3D5HcPbgu8r4hegVKRPB35R3L196GVHJOARdZlJ
 SqGKqXaoRrqsCjoV7KfdkJs7Aq8KZs5lAMV/E7/Vjs0OQ5oL+IGXlf1pkfPQrk+m+bxxPo+CD1s
 o1co0Zh6+J34EVC5uiOvxm4QiWuJNJZ4OrU//m1bYHhAksr0qaLZmf6sd2eJ05ZyV2pCwbRyGcK
 NdN/wr81ld7t7tuLtbiWO85UH3i8G7+jlHyAB5kk4Bu1czKO0SCtM90ng3QeNoqhG/sI++TESm4
 JXHWeVwLLpSZqMU2Bf3EBFk0bPm1futJyBqmHcfDoPrXUJck+4IC/VrLUn09S8Y3evWzn9eTA2L
 NoxZIkWhOuNM8wZeBEuOPJ3IROTEAl0i0TNfkgOm76aAzuo5LXUEgUbIHQbNNi1KB3Wy8DD5i8d
 nkF6QDdT+keKJjVnvSQGBqIefYenhz+NehXtlsxXnYQKSdf3vpEEpWJ9iObJDEZVE3REDYl3+Il
 tXWZSivklUydFdQ==
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
index 79e1be149c94842cb6fa6b657343b11e78701220..a5e2f8a826af40ec96d2a3ea58240f1ca8ed250c 100644
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
+	config = (typeof(config)){
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

