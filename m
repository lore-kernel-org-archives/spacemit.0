Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C9D30C371
	for <spacemit@lists.linux.dev>; Wed, 10 Sep 2025 07:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757488387; cv=none; b=pLs2/RvW5WpDHZJnJrOFRonYX+g7/QezBs2gO3+oHlPZou40QW3YLtZHF2lXUVj0V1SzQvGPdtLtkt2ZDJBRCDZTVxV9yXoNRjmaXsglmSOddeRR49GH+JYW6uIZ7/KWCH7AS2Bpy/33m+iOiC38aFNuaOGJVAHmXRbBnTQMWdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757488387; c=relaxed/simple;
	bh=yVgPPOcE+ewclBktjz5E2v2YtjZnxTx9c2rSBG/L3iY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mkitdJcTDUh08X11XwSdTf+do6DK77+e2OWJcIuJe/y2+WQ1AQwYi58Auo5inQCF53s+lQEDLaFYYXMfiVLSqoeHWRCDOpzD6NsUo0OCU5aLw5kOuyuaF4xJJSctgt1cwivH9OoU4s9vJ0cDYZzLQeUfzWRdYLaf3hs9e0w2o88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uiZbVonb; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uiZbVonb"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45df7ca2955so1443585e9.3
        for <spacemit@lists.linux.dev>; Wed, 10 Sep 2025 00:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488384; x=1758093184; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHR8kEAINHQx8cEJdNb56gXGfX3p65LuAbViPfkkq1g=;
        b=uiZbVonbrLwX8xCM8bzZZmYyivzwB5BHXXjMWMTgWC1Di/bguOV4PiYZXChjqLok8I
         c7+n3mpxrtqkozrP6WV3g5rHkopf7VjcbIK3voR37/pmQHU8hnpu0VisX5FZdRJg9R2v
         ZIPo/tUboC4bIkSMjy7xYMCL/+Y6wjdcEPn4iNAf9HcrhM2RdS2JrqWZYyASYYqcLRFM
         WJzmrk8WOn+BejI9NvcUymowkShPBqFArJZcAGAa0xPjzVgTQNBvV3GADFyC+Dc518Wz
         3bqqa2wlHDrXNikuJnlpAJJMbrgo4oSRO6y9vzm3vHayMhRo2iZKouRzCNTtHKylOR4o
         xZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488384; x=1758093184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHR8kEAINHQx8cEJdNb56gXGfX3p65LuAbViPfkkq1g=;
        b=qmGWEXqPg9k2fwLr+87NGk+eW8gVA58eqvkGY/FmWggjvGqaU43AESrOhcDmXhc9l5
         c7aGNgz80ktt4pdsagiZmUAzVbasU9owVAFpUMdEoGCliApbxELhZRtVs31asiG170St
         EZNHIC/rq09LECN/2R/gaP5cDZdBpnobBOR5ZV9RX9JMs805HHHHSjieNQtSkkhmAyS/
         CxOUZIMikk/1692IzLf6khkgbF0WBYGsJDnV+jg2GP1lJQ+o6eQDaHQRsvMBOPBM79+v
         vyDOtHkjGwgihwPO/6uJQSp+LQ0Cg1ZSXbhQz1Yr2CTESoQMIechTgaASC1UeFfB82aq
         ddIA==
X-Forwarded-Encrypted: i=1; AJvYcCXzDNbNUh4L0cNZS/gppinBwohv9SHf8UsPDTZeIQVBJj/z7UhPjgORdhDZj9x8ipxeghiSuR1ZMA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzv0iGhX1oxO65je5GnmGxN78qSKJSYVQ6Na91zoXYkVbkH60ox
	35cUBjGX16umATKaiv5mqViIqtO/Cra9afIQLvQnT+7HOMvmYrhfG23rngmvPBS5vG0=
X-Gm-Gg: ASbGncuZpgb2+vNmomv0B4+enpXOa76M+TpFaIVb8Y/0MOU0BeR+7TlJTff40Qlz2AN
	M/vjxz7LGPNTTVSGNE1O1H+5AgsZevtykUp+2Trrfrj3amntMyaY4pwhik4QGOMjQ6I2TdavsrO
	SSSBE+D8lKfJQWPWEO7vtYhNzvV+T95Eh4iAs7vaaVvMlCw6eVccfsmTCSqdkUJAE4daJWlBbIP
	Fwb67/TMyxaKEfp9JxiDGYqT9RnhXySWGXEGRj9d0nYZZEY5uh71fC7PAG9kCvg8DvSa2EUgaE3
	h9AgO2a2hhnSLjkvEubXfXaJqS76RdM6SPugKzADhV2WaOPpRUzfaHiuDDoHW8Rtrwna63Aim2j
	JlO4o3DMwKdA6ewdRLUYSyC37U7c=
X-Google-Smtp-Source: AGHT+IFSdci3CHq8VqUJcbVpnmzo+2lQEmXOuKmC8RRv+wtgm3NDfrNeLIsCyZlc4vVFVDxHItzjfQ==
X-Received: by 2002:a05:600c:c4ab:b0:45d:d505:a1c3 with SMTP id 5b1f17b1804b1-45dddef8c61mr118822845e9.37.1757488383998;
        Wed, 10 Sep 2025 00:13:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:13:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:12:42 +0200
Subject: [PATCH v2 06/15] gpio: xgene-sb: use generic GPIO chip register
 read and write APIs
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-6-f3d1a4c57124@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1238;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=We0X7xb7ACmLY+lbQa1fcNw6pP25NDN5z92R8VM93TU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTtTDj4oNGwDRR7+qL+H0qpz1nceYdGpGDPH
 ia1yPhYhmCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7QAKCRARpy6gFHHX
 cltID/9Ctub5VaMhx1Y9F7RnCwKevVF+bxKd+hpiZxi/K5bnOELNFhQC9MrYe3Jo/xgNtSOubP+
 e6d48QqOuSuIV5d++/Pwni9yyHDsRzqCfGPA2sfV/Bab6KBoWxhzDFn7s3lGqcOecV05i8onc8w
 wFCuxdoJ2i+LvKp0salt7xPfvkjgcIgKGzQmTopLYLKahtb4dC4nWif9HBKqL3RiNU2dkpEQiAI
 ippQcDB6/0i6YRrnVZAEtqpMgKaPwyRaKiOa0VdiVA+ZmDw7GrC1p+27jgEkErOCxYboKXTW5Ae
 gKTqLhDKSVO7c8IKGCdbIQxYiJEsGZCrYFuLA0pAogyydqwf/ZrcVP6UgJSOttmdPXlWCEfaWHy
 cLBcQnSi7cTCuPVS9mvSF6h4umNbP3tpRfb6pOfp7l0RY4i9BJsC6WTDRDQ/vHekGy86Kwi6Esq
 IzhKLr3OO4wfaano0EJJ5Gs84UnV4nMnYW9Nts1TM7oIybmuoDUgWV2QyuT4HcBQmTL6/b7FDyw
 82BVH/fdSFI2eKKOB3z+/AkHtl9+TcngTVS3xIAQWvL6HdAmpBuy2zbPJ7GMd0eV+meic7kYxxF
 1/MoGJeiOoVwFVOK5uGV2GtBCFo8xz97rQ3SKuV2hyxM9CExMXw9JCmDOBulmxf8+Vd8Afmotk7
 5UhY14It5j5GHJw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The conversion to using the modernized generic GPIO chip API was
incomplete without also converting the direct calls to write/read_reg()
callbacks. Use the provided wrappers from linux/gpio/generic.h.

Fixes: 38d98a822c14 ("gpio: xgene-sb: use new generic GPIO chip API")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-xgene-sb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index c559a89aadf7a77bd9cce7e5a7d4a2b241307812..62545e358b6c4b1cab25e1135cb24ccc3e955078 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -63,14 +63,15 @@ struct xgene_gpio_sb {
 static void xgene_gpio_set_bit(struct gpio_chip *gc,
 				void __iomem *reg, u32 gpio, int val)
 {
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 	u32 data;
 
-	data = gc->read_reg(reg);
+	data = gpio_generic_read_reg(chip, reg);
 	if (val)
 		data |= GPIO_MASK(gpio);
 	else
 		data &= ~GPIO_MASK(gpio);
-	gc->write_reg(reg, data);
+	gpio_generic_write_reg(chip, reg, data);
 }
 
 static int xgene_gpio_sb_irq_set_type(struct irq_data *d, unsigned int type)

-- 
2.48.1

