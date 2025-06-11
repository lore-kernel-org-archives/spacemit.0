Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5485C284682
	for <spacemit@lists.linux.dev>; Wed, 11 Jun 2025 12:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646779; cv=none; b=DNFaD3X6ZhdW2Ts+sS3KATuqWc9jSmVYNEVbjfHp9r0QxIhNby74SZauG/a2fWzkYDrr/0fRHaB4IN/2SJ6jKTgzdGf+qxvaRooIkk0JfOnd4xheQnSxd0lmxsGpRclxYb3XAP9+3Zm+3fH7sSkn8a2jWWaUF1gonWE2pR71Lh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646779; c=relaxed/simple;
	bh=IEX/J2M3ey3rn2zFNEOh92droBLT2UE1LPg1xMt9/e4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UqZwAoqTjaqjLNNKF12NIRRqdjh3fXvA3Pg5oBpM4kVEoSGQ89r9KHXJima2JJJd0J39hLcpu6NkIx7AZi6WPy0Lf935PHV6gYewxJXAwEQS4IU6tGHciw0G1k6apJh1+39Rr7YboXJeX4vLB//GT8P8ANwzjlTmFID5X+OSuVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Z7GuZS2l; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Z7GuZS2l"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2349f096605so79093475ad.3
        for <spacemit@lists.linux.dev>; Wed, 11 Jun 2025 05:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749646776; x=1750251576; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbUdwqpOjgljwseuYvc1wSTutki3xIN9U2HpImhqa58=;
        b=Z7GuZS2lSoZtV/N+oYv+zewzjazfhk97YsD6b6d2oZs2ctQpEBTuaZfXHJEjb0YOGf
         8o7PhNPA4U8snUfi5XSF0md5VkyhhvxvXbYhnVpA7uyeDBquMft14Wj1XeMltlZerOrg
         oUlwZwaT/gfi3/71frjvjMggyxOfz1Y0S5CvwhHPyYO67+KAb4vpKs8dkc3cj66Frk0s
         uEp9v7E8JRtpvzeSxIYFcthVXTrNcFh6GmbmTap0w9dII9AviTosQV9Gk0K76/Mjv+DT
         C8euc0bjnkfYcp6Ttx+dz+1rGQ7DZd0++pygz6xtsXJ+hPFnjnpmCfPsjsOVUXHbvDLn
         jo4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646776; x=1750251576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bbUdwqpOjgljwseuYvc1wSTutki3xIN9U2HpImhqa58=;
        b=To+/hGxB/ZEx4xjYbOcLXb8c30CCYpopTeNOi/44FGiq/7Yrgx8x+cCM2x8qfpJMMi
         5SddsC1sPiGUmeHo25Hw38UlIEZMkwUpsKpjDriszn8+YvO/MIdavy7LLV6srxwpBsAP
         FxD35gkXd4hGp3qVo5GeyHerpa0DxjZXXbOMHTpn9/1GCgCVEUWbfuzYj+OaWr5Y7HO1
         /InIC4E5NrhpIkrPJLB/l8itgoZrwp98pt4drDjGLHJ3AKBktM2iW7fyBWeparxIwkd1
         6NZqOyIh1cAqb+nlMYCBkH9To24tzf9R3EZe1rxbarGpR+M9OmNjorhx+90KBmn63h95
         iNuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiH+MwK/hxYGVInySpO7RRBRy4AsOnX+qB39G8gox9NId9TL5Efj/+sz108taiRUZPdh9A+Fif9w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwfmXrM1IPry7lvwWoknoOuqRpg6o3o+5jUK3cUu/xk2LDgxN84
	WASxg3OETGna2UP9IgHr1O7X86fzCRNKrhBbgzLmqO6/uiSJBCOmfbSb3snKgLZN40U=
X-Gm-Gg: ASbGnct6oM8b6liD3UQYPw5S/dzkHroaPQR7r6O4DWl2zOSJpTvOZBpaR/tCKzlAZwY
	z6eMj7DVrRaQu6VrzyamTAjHfKC7EoMexSGtPMKwKmXv7mtefWlkKyMRXNPuqLUTqDve9NocB1P
	qaSKKaCudzaSTj22ZXXxeJCzn//O5kUsmNYmk1Q1aQVY+av6Dxxabzod9Q3moYH4QZQExLz8ypF
	tPAMp1eeF7GT6iFZgiptwydnlwLdfsfwtFHXtuOR8yF7dj/kWqe54i61vDim48Eq3Y2NXWbX+cy
	/fJpQVn70QYlXFhaawWHMsXuLuOq/m7Apib9IjAw3x7SfRs7s5uy7UIsQn+AwU8jDcHRZBvWujf
	nHoTy/PsJ38KXHZcceFePNQ==
X-Google-Smtp-Source: AGHT+IFwmOGY2tPNuPQv/TIROenh+j1fH/hIa0++yIAIoLEcfqCONIj2DYpz4kpbLhhFofJZJXqRvQ==
X-Received: by 2002:a17:902:cf0f:b0:234:986c:66d5 with SMTP id d9443c01a7336-23641a8ba0bmr41504395ad.5.1749646776539;
        Wed, 11 Jun 2025 05:59:36 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a00:31a4:6520:3d67:ceb1:7c60:9098])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030925e3sm86984115ad.53.2025.06.11.05.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:59:36 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	emil.renner.berthing@canonical.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	joel@jms.id.au,
	duje.mihanovic@skole.hr
Cc: guodong@riscstar.com,
	elder@riscstar.com,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 2/8] dma: mmp_pdma: Add optional clock support
Date: Wed, 11 Jun 2025 20:57:17 +0800
Message-ID: <20250611125723.181711-3-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611125723.181711-1-guodong@riscstar.com>
References: <20250611125723.181711-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for retrieving and enabling an optional clock using
devm_clk_get_optional_enabled() during mmp_pdma_probe().

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 drivers/dma/mmp_pdma.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index a95d31103d30..4a6dbf558237 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -15,6 +15,7 @@
 #include <linux/device.h>
 #include <linux/platform_data/mmp_dma.h>
 #include <linux/dmapool.h>
+#include <linux/clk.h>
 #include <linux/of_dma.h>
 #include <linux/of.h>
 
@@ -1019,6 +1020,7 @@ static int mmp_pdma_probe(struct platform_device *op)
 {
 	struct mmp_pdma_device *pdev;
 	struct mmp_dma_platdata *pdata = dev_get_platdata(&op->dev);
+	struct clk *clk;
 	int i, ret, irq = 0;
 	int dma_channels = 0, irq_num = 0;
 	const enum dma_slave_buswidth widths =
@@ -1037,6 +1039,10 @@ static int mmp_pdma_probe(struct platform_device *op)
 	if (IS_ERR(pdev->base))
 		return PTR_ERR(pdev->base);
 
+	clk = devm_clk_get_optional_enabled(pdev->dev, NULL);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
 	if (pdev->dev->of_node) {
 		/* Parse new and deprecated dma-channels properties */
 		if (of_property_read_u32(pdev->dev->of_node, "dma-channels",
-- 
2.43.0

