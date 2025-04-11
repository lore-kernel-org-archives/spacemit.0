Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840F915350B
	for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 13:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744377312; cv=none; b=Hd+hOIcyv55viCJSGn7uY6iDzBI19rhxKtPhG5afG3wdJaGzcwkOk2G8laCXV2DIUL8VgFF18BGUfYVfDTGKxrY4K0OjGT1DY55el8SYIelkgmRBlZWb+aCMgTMK9Pmv77AdwnndOJge9qgIpZuhi+lFiw3nZEcOx5/j041Q39U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744377312; c=relaxed/simple;
	bh=UlAsKNHUgln7eAumKMzvqbycdRrzhxEOvoeet7XkcNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jtXHeRsARyoyRzVKSjyv/4o49KIUO4ryY+e1AoOjE91MB5CDZdO7WM2L4KBgOenv0Fs8YauOnsxagkFxCu4KXWJhJZb2ycZ/ttClFSAXIxbnlQYAFKJKd4M3F6ieE4jEoeDztwSBMek0tFxQVZxTUPuxe2GxucxLXNINdpzc0Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=RnsmHkAX; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="RnsmHkAX"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22435603572so18960905ad.1
        for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 06:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744377310; x=1744982110; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWAPb5H6B8HVYPSKWIXFA9rVM/O356OndjYJjviUmrA=;
        b=RnsmHkAXlvS923uUWpGIUTH+lGO3+2YVcaE1s7fid9BYxomGumF4KSsV7b2f9Ff9vs
         EJIEH3Npem1m1tlZkyR4CYOm7I7UZ5xI1O15l5SjNvvv0pnylxovnTTn7g1KRwTXTsro
         BjHtaa2NztsD7ts8phEEIdT7F/ZMDZ20s56xRGQEukKYeS1CL4x8lgYa7IGDFVs5PXVe
         KOSK9O/dQrKUa/0dKW9Z/Rum+n7NzVvYu/yaZDziJ4UpPis7p2IBvIckTB40sUbE471I
         j+E2ufjxAIFcrTXYetndNc2XR+npwzKxIDg/5PyMy4wOF6M4nhQDYgnHW9jrmrkzOCzl
         jATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744377310; x=1744982110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EWAPb5H6B8HVYPSKWIXFA9rVM/O356OndjYJjviUmrA=;
        b=QtzC5fuxlp1Zwcu3gHMspQxxc3c9N+4kcUJn9P1DKIEGSZTJVDSSD+TUz5FsHhkUQ7
         MEB+O7Nbx4m4xx1WQ54oXzdEZsiEkuYqYg+fy+5qMk0eMWGzOyoKnQvvjqZ/zTo/A61H
         JREOcFMJ7v8UVp2BPa8b4fDYH9XlFclEGmTtUmkL6/opJAgnWR+w561yUqhq7we5uUhs
         eca7buGX+m1trTLm3o207HiQC/9P2aJXUv8PnTHEi2pOeShdiIQTuwL2LYMp8iZumfEx
         axzBpbYBqwUpnF72kBnguUf/9TpXSUkZWoyO5K8f9etzPPVbDipyUL73gnJ9JPFrku9g
         7eig==
X-Forwarded-Encrypted: i=1; AJvYcCXZx+GMKG/qQx0ryK5DvmYqAbNR2xfHLfrdR8qeQAYC7LFs8XHKpZj2l5LsFH7f9m14fO/y0tBHqg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxmfi+KrSdzGJw4VOk89EZHzLz+ZcR9Qos+5PWw7WsJWxr7/Y+0
	f0kIY79SjBWWR1dbYQ9wOrDTkt5UGyBc/JwZ7D8IJtaCgZZYRBJnSUOO37fXMq8=
X-Gm-Gg: ASbGncvGga37IIXHOTCdIMcxVUCC1pDUS1m9RH3CYzU9aSJkncPXB/PG2Jsm0ip+XrH
	dizcrMu06G3ryWil3/tQopQs1WEOdkf8KKJfvhRsIB8Fvhm6D90wrvGGhT0XGbVpLX3ljaz2d1L
	WziLwYY+MUhsFaJ80peHJxhPB7vKov3DOARA+MzF2eMVIj8dNbnwX42aU4CJBlEI07e9i5bBnER
	KTw7KwpHpD9fT+DSypEND3XYCnh7q9HN2eOCY+U7b5zECJfjQbKDDh5Nu369PnEDA+jOU2OulX+
	wSyMhiTNrWdcqvt59TNIVFzjomadXJc=
X-Google-Smtp-Source: AGHT+IHIndEecRT3AvZxYCriHYkwaE37vFsVhEAY5FozYiaAsXwZj9EbWpr4y1scyShWVdTuh6BCLg==
X-Received: by 2002:a17:902:dac3:b0:223:66a1:4503 with SMTP id d9443c01a7336-22bea4bce88mr32987205ad.30.1744377309837;
        Fri, 11 Apr 2025 06:15:09 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a305:4::308a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cc6sm48245005ad.122.2025.04.11.06.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:15:09 -0700 (PDT)
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
	spacemit@lists.linux.dev
Subject: [PATCH 2/9] pwm: pxa: add optional reset control
Date: Fri, 11 Apr 2025 21:14:16 +0800
Message-ID: <20250411131423.3802611-3-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411131423.3802611-1-guodong@riscstar.com>
References: <20250411131423.3802611-1-guodong@riscstar.com>
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

