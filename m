Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D1D1B532F
	for <spacemit@lists.linux.dev>; Sun, 20 Apr 2025 07:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745132704; cv=none; b=CnkNIAKibhNjwGm41Y+1grZkfMFPsGmj9sZ+VCgJCyV4GHJERnUM7fkiCUo/h/MDOAnBTbfXfxT2pLOZl1KqW9wwZQnnyIwcUZ4Id6H1lzTPQzFliztw4jTshQJS8SKw6EbsBVsPwDRu5qlb0L0g+zJfxaUvroAr4H+gCGINWNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745132704; c=relaxed/simple;
	bh=W91bQpfXNZR8c2bsacU3SIoLVlODdZYgId2qdCM6s58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gii69TGHKcEezzHM26do3bWTUw9RYEyUsL8YYfEMJCZnfH0ATxHk5xdFyzBsymG8k3VTuBAzCcUeP56v3ThgKW6HueRajs+6usYUHEApmkm24lu+NUeQrUeGCyJrf/v6SC4XVTogkAZVxPNkQHZT9kQ0A2r2dRywxaz7g+O+SUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=10Ymyz64; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="10Ymyz64"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736dd9c4b40so3649341b3a.0
        for <spacemit@lists.linux.dev>; Sun, 20 Apr 2025 00:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745132702; x=1745737502; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmeaXxUVGYcoGAVjJ4OOwtWzTNoCxB6YzSoPVdDhvp8=;
        b=10Ymyz64toiKK1eKT6uZftyQkwrUkXXz0K0xfQoCFVFfVuKUiDhA46pAgfwhuSUYb+
         Q2nsn/8M2PWt+gZtrAQ+4+yYIa8j4r/umcTNxW42bJKHXfz/x1d6jtsTzytNvkHj3EH+
         dv/4Q9tSdWF8HTs7JG3LEuIMXqUHvTWaxbJn3yhCogdo+tEFPanJiUpHb/hiW3+r1v2W
         Qa8LJMGhzq/oWVZVNtjVDtdjDDpp4MvsKgeNSnCDxPfRu4/5/1yUlroUSY8Ko4EnEJW4
         FIIU8t5klHF+cGxDmaywWYEDSG9LsS+M73MaM7YTQxy057GzVOw79Tx05oDMNGaoPqQD
         OkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745132702; x=1745737502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CmeaXxUVGYcoGAVjJ4OOwtWzTNoCxB6YzSoPVdDhvp8=;
        b=SCSkbuAjqUvFXJBu0xLHqirh36cagBz3o9G9bL/vu+ui2WzKULH2ilx14SzFFXYNdb
         70fQ98NxXFPZ1ZqQ+Nle/zedy+i8hJqp3LHsRTJXU0ltJytWAAGLczAGTYXDv6+JAXqf
         pv9ou6Q7OC6iy+gmSHDQA6KM1B+eD8eG8NSii66zXVubirvZTFOTcJf8aLnDnN8+9Pon
         xIqf8ewcgUgymHDRiQ57S1wWJBK8077vEM/YXqXSbZduv8YEtKjY143U7GT9bqypUms7
         N6shMz69+T4gainanP7E9Nwg/zBdtrPi76AbkI4lMNKiFo4yP5v4SKQ8KzP4kWPM+tJ0
         eXqA==
X-Forwarded-Encrypted: i=1; AJvYcCXiS4dAn8Apq5vnr2ITk8hEVAL3sHKZ1huYbaYvEO54HDBty4eShPmJAu4F/VoYLtcfiI7lyoTKkw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyrfUkDyA9WQ3JMczSy17A7lMzidjxgh14ORvz/exm5lLgfHxKw
	gH5FG9SSk1UQB+nE170bc0xKZaJU4CW5krmEGkl8ZFrBESnCxSsgg5X8VWFQtrQ=
X-Gm-Gg: ASbGnct3VAL2hw3b4RH3Nb9SZGTGIah1QZpcYRsdR47tyhmPtTnkicjazB1geSdxeiP
	MKaai42ZMCdQDXihumFLGRXHK7kZI2lS25lh5yqzyDb0z2wTXeeHvJiolJcg0c+H3rFq/7y0Ips
	sYnAT/qqcfkjHUS9jOCFGc4vhFNWO/17a3BoouDNCb1RVzAFYAj8JiW/0i6ebOlCsT6V2UUd3w6
	Xx7sHOxHmcT2PArKCLNVA1SNiaQbEf1oUPmSEzvzY/J6KmX5++8OtqQ9lwoU2anuNAUeUqT/CcY
	9QAjRE7Q/2yrk3zBtSdvBxe7sdsDFw==
X-Google-Smtp-Source: AGHT+IFx8mnkCm3C+pdkB4oHWAvoXoy60Ij5qZBakPGfhlMZ/vRsdrSNmQaXTxpzNl9oHvgKDHi1sg==
X-Received: by 2002:a05:6a21:920d:b0:1f3:3547:f21b with SMTP id adf61e73a8af0-203cc5ce2bdmr11487230637.5.1745132701993;
        Sun, 20 Apr 2025 00:05:01 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::40b3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db12743afsm3742626a12.16.2025.04.20.00.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 00:05:01 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	guodong@riscstar.com
Subject: [PATCH v2 2/6] pwm: pxa: add optional reset control
Date: Sun, 20 Apr 2025 15:02:47 +0800
Message-ID: <20250420070251.378950-3-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250420070251.378950-1-guodong@riscstar.com>
References: <20250420070251.378950-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support optional reset control for the PWM PXA driver.

During the probe, it acquires the reset controller using
devm_reset_control_get_optional_exclusive_deasserted() to get and deassert
the reset controller to enable the PWM channel.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: No change

drivers/pwm/pwm-pxa.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/pwm/pwm-pxa.c b/drivers/pwm/pwm-pxa.c
index 430bd6a709e9..dd9c6af0f672 100644
--- a/drivers/pwm/pwm-pxa.c
+++ b/drivers/pwm/pwm-pxa.c
@@ -25,6 +25,7 @@
 #include <linux/io.h>
 #include <linux/pwm.h>
 #include <linux/of.h>
+#include <linux/reset.h>
 
 #include <asm/div64.h>
 
@@ -49,10 +50,10 @@ MODULE_DEVICE_TABLE(platform, pwm_id_table);
 #define PWMDCR_FD	(1 << 10)
 
 struct pxa_pwm_chip {
-	struct device	*dev;
-
-	struct clk	*clk;
-	void __iomem	*mmio_base;
+	struct device		*dev;
+	struct clk		*clk;
+	void __iomem		*mmio_base;
+	struct reset_control	*reset;
 };
 
 static inline struct pxa_pwm_chip *to_pxa_pwm_chip(struct pwm_chip *chip)
@@ -179,6 +180,11 @@ static int pwm_probe(struct platform_device *pdev)
 	if (IS_ERR(pc->clk))
 		return PTR_ERR(pc->clk);
 
+	pc->reset = devm_reset_control_get_optional_exclusive_deasserted(
+			&pdev->dev, NULL);
+	if (IS_ERR(pc->reset))
+		return PTR_ERR(pc->reset);
+
 	chip->ops = &pxa_pwm_ops;
 
 	if (IS_ENABLED(CONFIG_OF))
-- 
2.43.0

