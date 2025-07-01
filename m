Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CFB24E4A1
	for <spacemit@lists.linux.dev>; Tue,  1 Jul 2025 05:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751348277; cv=none; b=JHUvKIYqe9VJc/dWplWnWdRJCP1yYiBhMaYE04ug1wct/WUMfVZpYSg5XUt/Xh3GHXIEZcNqdMwGZbU2B7A5TR+Cp53ybtZuVSOFcC3MSX2btnNeMhi+JQ7fk1pa3yIDtKSVqpOE+nestBdm1gN93agPfIziBdMlolmPoQLjPFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751348277; c=relaxed/simple;
	bh=n9Us7UC90VOU/li9dlUeh0qJzrEE5RTni5LFzh63b+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e291XIK5dbdBDqfvh0foEb39WTm2HuMhwBQuPHbcElaWSgZPQIfny26aVLfCdstbgfgMNLXC60l3ZzCdKtmy6c2fr9dbDAK2Bw1b8gnaBBWb1ZJ/4VC7+bqU+D/4Eje19UinmOOYAdyKl9sfxppil0SuOoPl2Z8USjRgJPKO2m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=dMe9p2NE; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="dMe9p2NE"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3135f3511bcso2228957a91.0
        for <spacemit@lists.linux.dev>; Mon, 30 Jun 2025 22:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751348275; x=1751953075; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OgkMXCCp3lXpUTtLPZUq7+FcCnIZ36CClHz2F6hgg/c=;
        b=dMe9p2NEetginyFIww4ZFAH7/zJyo+qv8XpfVZ9wrZLWdw/BgD3hspbTxdsnwXLQVO
         WI9kalxb1H3veCMHQLj8Ydy1WQK23Ggi1lknMPLGmCJN5YYOT+YrPEaulD+Usmlj/9il
         kaV+9z9jBx7URHauWUTPNWdYOuiovpIvwT2Jz5MA0purzDHGZ09J+Mt8rnTj5AlntW5L
         m9hqnvHJXy5MPTmWbxkHF4zRE5R2WDQrTBsiOmE+qtJrUrzF7KujIEdhbahgNC1ol/9x
         mW5q5Wd+RiDw3BJOBpEgWSemv+cGEMkg2HnwX9h0me1hC2u+WuEFkHApmn90r7LTfxsJ
         EQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751348275; x=1751953075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OgkMXCCp3lXpUTtLPZUq7+FcCnIZ36CClHz2F6hgg/c=;
        b=ttmMSGCTr1DS6ts9TCIwrQuft1eYYvve1mpIhfiEwJwaebKPdplcV6cqEvDBKQwFdg
         kcs0NOQlB2xQnXrgcxscW2d6D4hKbKS5ae2YpQs2ryDDqeicNnNb72iPtHTHi3CqzoqE
         TMbxkmrqgYvwCqkpL0Sqpg/op/xya08Etvcx5+3ZZfRkrP/kysFZb2C3zKWk94jjJOkA
         FT1fUFAv0lw94BuCZnrnXKSibIHJbm/y7ZsVOJRLE+NXAswuI7qFvKbxnhd5l5UwrJ92
         6IeBiV+pX+0TUftXh3fsn10j7lz5ia6L/AOInMJsjNdg2qucqYDyfXNJODmEYr8iKhAj
         Dx4A==
X-Forwarded-Encrypted: i=1; AJvYcCUoIohPccmbW3HcJxGlq/QcGnor5aU9JNPbg1eo34Wbz0ZMInbnievTauFZREVQzWpAUW7l3TVr1w==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywd6ZwhgpNgfK1TlPwXAaBaPZLGaxlihQYgCQgzLMB5AttSf8Va
	1X2WWEJ3rk9rSsGBi/eRonijWm92Tphbm/jMmJ2fWqZiAr06fu33PidTVaF/1pIlL+g=
X-Gm-Gg: ASbGnctWAZxBXenkCZGEu29A1qlRmOdbEwAWk8kzuiNizNukQ3u1idXZ+kMOR29iYhF
	N0K5oCAk/asNJwszLxorDwZqMvgjpngrYvmVOjjbB8XPGyH0T6XIy+J4ozLkqvAvYyly7CYDJa+
	9hnejBQvlStiPfp6WdROOnhnshKwNj00Twly5dBPaoojDv8AbF5tcK1gIS/LX0dBwDwr/aNNPh6
	sB92JtghIgVZ0sDu7EYrBo2a9XBPfjHDtUGfHCWh7Cw6CkF+nJVw2Q7tfm05dgIIv8W1YOwO+jk
	2i49VyNHRZZ4MXcHp8QEARxo5D5BM8ocp9kJPjI=
X-Google-Smtp-Source: AGHT+IHiipoIqFDXP36F8aMSuW4HpbiTpTi3qEOpw0AtYIq3Z5klUPs1xtkEis7GRnmZy5rq7VtuOQ==
X-Received: by 2002:a17:90b:50cf:b0:314:7e4a:db08 with SMTP id 98e67ed59e1d1-318c9243f36mr27007305a91.18.1751348275126;
        Mon, 30 Jun 2025 22:37:55 -0700 (PDT)
Received: from [127.0.1.1] ([2403:2c80:6::3092])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bf5fsm101729865ad.115.2025.06.30.22.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 22:37:54 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 01 Jul 2025 13:36:57 +0800
Subject: [PATCH v2 3/8] dmaengine: mmp_pdma: Add optional reset controller
 support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-working_dma_0701_v2-v2-3-ab6ee9171d26@riscstar.com>
References: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
In-Reply-To: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

Add support to acquire and deassert an optional hardware reset controller
during mmp_pdma_probe().

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
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

