Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8EC27780C
	for <spacemit@lists.linux.dev>; Fri, 22 Aug 2025 03:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755832012; cv=none; b=EjjG1vichGolmvY5DN5degnZtlN5movwTVXciYV5ktGJjxC4kj7u1PYMUDeNm23n46kOrV+RMqIw4Y8mkmWK+IyIgGexpJaB7GnSSOUNitz1Qp7+f554YrYjVHVCSUeMltnjZRXJ0NxgN6wc1ZxwhmtP2cVT+N5RpdFesPyLC7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755832012; c=relaxed/simple;
	bh=ET9r67SBgRJAysqntixUlTo+ibcE6/lAnyl7Y1qAqb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nMPMg5xfpQ3jHyZ9suF3cd+xftScAS1WlvIa9/QT144YMtWMbHuloR8x1WktbK8LO+jft8nWJSqPgd82rinjp4XP0Payjpeat6gCE6YEd/rA95TH34NfDuMDeZf0vcCTTCy1BHOKzbe/pbcKIS8QmU2FgimKbFhotj88OUPqv2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=k3wiMH7K; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="k3wiMH7K"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b471740e488so1341185a12.1
        for <spacemit@lists.linux.dev>; Thu, 21 Aug 2025 20:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755832010; x=1756436810; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dC7kl9A7D2BWwkfx5jwlJiGlSj0s6ZSSxNG7ocAEL44=;
        b=k3wiMH7KoqjAUT+aTCFbM8ZuNi8psMQKzoz6g+nNS2HXPytSqnlE/Ai4N8wRP4oSrD
         YxgsR/28pcVrjJZdQqZ2mhrd2xU9CHhSybVCvEi27PYskQvEYPrtJ4OIJ/766aQlezZu
         GjmSR8mJTjoUw/wHU/Ai75whDvyGX8zJ5omGSf/iBq+npFynYMgxe9B+GktI9/mh7ffv
         YI5WaaEmBmJyn+adTd6+PDUn07uxUbo68tcyeGCBEk54OmUPofABGhRzFcMys2bzrnmF
         mEV4vfcEl3ldgB26Aqp56n4FyOJEiZT7eA2YXh74Ev4yeUolCL6T0Do1h0qboSaSt0Al
         3/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755832010; x=1756436810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dC7kl9A7D2BWwkfx5jwlJiGlSj0s6ZSSxNG7ocAEL44=;
        b=ChPLdqAi0WYkO3PHeXYyYyzV7pSRuM3Bv2DZEU/5A8tVmRObaki/uU79+Nr83YBnki
         2Bi+xC/Oef+XEMfEux9Tpixp2978fTHur7rBwDaBfo4dSy1Pv6SaEGGcLYjMy68EDOm8
         POckJR6Uep4cmgdECDBIyLdVYzj1yN+3rS3ATGVDw8Q7zYPP5pIFt+2H6GYH3JxzH46m
         zZ9ZaU+/TnzFmmT3Mc7JcRVyGJJQGSST2UnRSBczfm+2jcwQ5a8utyWrcFS1soTMCew0
         4k9gWfAl6vwhFIF4DWcWJ2GN/gM+glyVAnGz8SKJ4ytHdk5KwscPx9Euk7CtRFGRk5LI
         sXMA==
X-Forwarded-Encrypted: i=1; AJvYcCWnXSYzyTNOScTdqsPMia2ZRMblAFnl/ZOEqFZHzmIJ+yW0oQJLvYQ5wpPYbF2UrCHmq5kN5q5K/A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4YnBMvY+3uO50Du8Lbf57HLe5DezKjk6SVMtPHb6N57Zxu8n0
	IGxRNifFNiw0bEWSxetFf7plhTM+Lr29XrZghcPg56X+qvEvdKsVXNIkNFsIAxcOWDU=
X-Gm-Gg: ASbGncv6++U9hENfmE2T3+lS2b4Z68Hr+HjbPHcjqoNdw/MfIN+dhQcVdzWSX2bgBSJ
	1YyM5rJAWp9FMzY8Hyh3zey9vhMtIKIK9YmK2TUcsMV3OjBXLZY58m0Ur3PoIu9GwHxpCefXBQP
	0hx71Zl7x1cRbyuKahtons1MW80lSdsWCy8rzgdD96vu3msV2Y/FxKM1YO7xf08ikGGoZs6GqA9
	iLdhQ1SNmCf5jjfbe8M1814QHftZ5lWpOOmH3ecoJ6wNe/rxPkP1h+nFNUA8xKK+nPeFFRA7MwI
	8H7OE+IGXNpz8zwwguLuRhbVHZi/D6035qbG0KZI2yc3dYJQ+KiBMAVuDRkDNuWXwCBwzOlePvV
	AyOvW6i+6/jWnXOsNxSxQHWHl5DoOmfacXA==
X-Google-Smtp-Source: AGHT+IEAIhdT3Tfgdb8iNC0j7z0iqiuqLPLYGzXSr+7++MUa1eCRn81F36zR4QAh/yOgPvq9YcRdkQ==
X-Received: by 2002:a05:6a21:339c:b0:220:aea6:2154 with SMTP id adf61e73a8af0-24340b016bamr2141981637.17.1755832009592;
        Thu, 21 Aug 2025 20:06:49 -0700 (PDT)
Received: from [127.0.1.1] ([222.71.237.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47769afc1bsm2756777a12.19.2025.08.21.20.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:06:49 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 22 Aug 2025 11:06:29 +0800
Subject: [PATCH v5 3/8] dmaengine: mmp_pdma: Add reset controller support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-working_dma_0701_v2-v5-3-f5c0eda734cc@riscstar.com>
References: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
In-Reply-To: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, duje@dujemihanovic.xyz
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2

Add support to acquire and deassert an optional hardware reset controller
during mmp_pdma_probe(). It is optional because in Marvell devices
such as "marvell,pdma-1.0" the resets property is not a required
property. But in SpacemiT K1 PDMA, "spacemit,k1-pdma" as the dt
binding schema file stated, resets is required.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v5: No change.
v4: Updated the commit message, no source code change.
v3: No change.
v2: No change.
---
 drivers/dma/mmp_pdma.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index 4a6dbf55823722d26cc69379d22aaa88fbe19313..fe627efeaff07436647f86ab5ec5333144a3c92d 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -16,6 +16,7 @@
 #include <linux/platform_data/mmp_dma.h>
 #include <linux/dmapool.h>
 #include <linux/clk.h>
+#include <linux/reset.h>
 #include <linux/of_dma.h>
 #include <linux/of.h>
 
@@ -1021,6 +1022,7 @@ static int mmp_pdma_probe(struct platform_device *op)
 	struct mmp_pdma_device *pdev;
 	struct mmp_dma_platdata *pdata = dev_get_platdata(&op->dev);
 	struct clk *clk;
+	struct reset_control *rst;
 	int i, ret, irq = 0;
 	int dma_channels = 0, irq_num = 0;
 	const enum dma_slave_buswidth widths =
@@ -1043,6 +1045,11 @@ static int mmp_pdma_probe(struct platform_device *op)
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
+	rst = devm_reset_control_get_optional_exclusive_deasserted(pdev->dev,
+								   NULL);
+	if (IS_ERR(rst))
+		return PTR_ERR(rst);
+
 	if (pdev->dev->of_node) {
 		/* Parse new and deprecated dma-channels properties */
 		if (of_property_read_u32(pdev->dev->of_node, "dma-channels",

-- 
2.43.0

