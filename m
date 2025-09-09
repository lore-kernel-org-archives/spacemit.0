Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F633074AF
	for <spacemit@lists.linux.dev>; Tue,  9 Sep 2025 09:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409358; cv=none; b=t7zqG/zhvOsnfYMqDxSrx92EnRtsPe2jaVqbO3BZE5gPldpBoldB5bZJsBe3WTQbR7rFjoMNm1jjJam8ZXXFS79LAICRVFgwSLhUXmsmHTdqdLrMrh7aQKNijH2wwF/3zMZuGU9HdAUN+R2EsbS2+05d3ZSRLGDetVSSJMDAdjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409358; c=relaxed/simple;
	bh=yVgPPOcE+ewclBktjz5E2v2YtjZnxTx9c2rSBG/L3iY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lrn/lnyGs3+pe42atM7NMmBbP5UqTbrI+fhMq/iOeTxEY5JwX33WXZIVZsxDGFWqOrxx+4PGsgbIOGz29MCYhFjNOO/05BNHOqCL0dQuqAuEiKh3iop5Nrw6Rknw4x2GTaVoWJ4ifMU1BioDvKPl15sCNqayZ0IVLmmPr0a7SPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1nx1w3YR; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1nx1w3YR"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45de1084868so12554785e9.2
        for <spacemit@lists.linux.dev>; Tue, 09 Sep 2025 02:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409354; x=1758014154; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHR8kEAINHQx8cEJdNb56gXGfX3p65LuAbViPfkkq1g=;
        b=1nx1w3YR5X87OubLGfHDsGdLBsReeKDFeW4vBz8x8QvttE2N8j9N2GfLFhoWubPIyp
         tDU7zd5NBOFgnsTE2IXpIaI1CcLa+pE/d9iBJirAnNpP8T4he/plFR3zuXQaoc7VEXsP
         dfjT8+ApzAyJMxhYNo02gdmIfn/Ti5UlSSdqUxxRP6bs12tQD6uo0bo6qt4oImx6Fh9n
         ua6UNTG4vd42LYATBHoWSYSCUSrUPkX1nnq52JGbJHVk60blVG0NZphFT9hvwIEx692V
         kF7mrPPt8hCMkBanjnW33vm6j1kAHKL1wRq61LAQIDR7y6pExryq5Aa4fwFgeNx5IiBN
         96Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409354; x=1758014154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHR8kEAINHQx8cEJdNb56gXGfX3p65LuAbViPfkkq1g=;
        b=uKQOtiOnGgIl9kgftwn4/1m71mGnM9A3Bb06coT6sOqhNVBFkK497t/4vUvzYlmVQq
         WM72dF/C363rFQFMhNBHoSpRQvU5dELb1whZRwNY6b9V2Xt/tJiG8zIanyUFGxnWpx3I
         AxHt8Rm5pP1Ffl4blViYEowmGeL8hMO+qYZDRcmk4hc7RkNjzx7tewxAr6m57xJzF3Y8
         Y/WrgqCBNyPJ4Btq79vGY0WDv556aj+wiJzsXCk0MBKQSj3cWBPwWLLqAwdqi7tVmdo3
         +hRjnX/Hdqjja0pmhnXI7QLpAk/ZH67yoW/2hKyiwxovdwhpMdVepq/xX3bi2SW9PQTS
         ctqA==
X-Forwarded-Encrypted: i=1; AJvYcCVZGeZ8xMFiIi5U/t581BxIl2lfn8rEtrIHF2cXUjymx5PpRdr8Ilk0p5VuaK8lSz8ow0+kfdusAA==@lists.linux.dev
X-Gm-Message-State: AOJu0YweSgAam0NCM0btCJyodQO42aadfevOygzGUgWntn1s+GcGokI2
	PcHDjBIDeZd29EKxey+NEqjbqKU+x9GlXSerTv/7scYjSQnNaBXl51eKJU0/4zPPJCM=
X-Gm-Gg: ASbGnctPQ9fW0r7EFHc/BJWNsBk0jYbreJZq71ePka8JO1y+xpKyy7XbiKtbPk3xsQU
	Sxwox5K+5YwlQKE1gc3pnpyWOOlm3sYg6Jq0uV7wyZU/59kzMdd2XvplxWJIByqjWFTFAGVSkjT
	FuqTwaldxOaEI+R9si/wzkliMhZ3A+70EymEjXyd0yV9lr0WMBzBiFBZcqIjAQOk5LxdvW8iJqW
	hbcDx6NiDNH4Ft5Ti5584IdDxxIB4PaCRX5qvRPiU5e0grTYxJzY1HeoKgL0fys8bIJF/nw4nas
	1/dVSTDbC5NagIRlNkIs+hBNfSl+pnaxkGcVMM0dyN7STt3m3BIE+1CIXklRNYaCOdYCQq9jGSg
	ETxH6k2f2mHIviiTPWpc5Q+BS8Ccc
X-Google-Smtp-Source: AGHT+IHhcgO6dwZxJtkrv/4cgFJ9AZZjVhBwJVC7OCJoGvWxqWltiwPbbtdGBypNoYfTrgC0pMDsDA==
X-Received: by 2002:a05:600c:4f47:b0:45d:d903:beea with SMTP id 5b1f17b1804b1-45dec7992demr29926925e9.30.1757409353851;
        Tue, 09 Sep 2025 02:15:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:15:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:33 +0200
Subject: [PATCH 06/15] gpio: xgene-sb: use generic GPIO chip register read
 and write APIs
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-6-9f723dc3524a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1238;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=We0X7xb7ACmLY+lbQa1fcNw6pP25NDN5z92R8VM93TU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A4pQZLBZn4BjfERAi0jFAen5It67lNNEGX4
 28/FwbaFj+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wOAAKCRARpy6gFHHX
 cppTD/4ubzT5gkUPHClRcXZW7nUjOwMKszigAjd07nNOb4PF0UpVU/Xa7EnK+Syz6p0XN914Vg1
 dMG2j9qlrjrNzhrbPetN/pzgg0RJ5FtkBeCt0QXzTIM/a+OIXPh7USmz0K2fiNPTPV2j9/afS9Q
 o1uvp7fh5vygt/dxzTY3GXRvzvAvlXF7Nj7cXXbufdr+leL6pNp9oAtHKmepILW5EXpYFjMoStH
 jbkjAo0gaQWdhdfr3K7hUFVirfvRgS3xp/s0PuStezskzt2soyUXvzAk68x1n1aoTsHvj8e18/M
 ELZsqbHx5BzbZXplavqjtoWHWaIHPaZGUK5I96znEf7RNJcznFDPSn3z2hemiZlD5j5zjVbaiQJ
 e7fMVvjPH1WvX60+a5oopYA1ZIZjLNqd31TgZltatr7zdX2BQbFJRQo8bHngbWak1gQiVh/7Cex
 zwXws2yfiUCjol1anGcqyeNvCPSA0b+vzKTlM9Yg+31ZHNGWeisiXTVtlVO8mxr5JdJg8IXJFhE
 HIN1TnCnnyCKDjmqRucW6M/Sj4KBGnUNgwFtA+dnhk1DDyvACq73VpW4OXZUPBsKF9uHpEHvW0M
 ymUv6nH3ayojO3TG4dtSPtFoY2Y4aol+CHE8v2IqHm74wWbdOuT7cdf+yMxDJ/DCtZs3ND+cIUd
 3eWJFcmxF3LRACg==
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

