Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E923E1D1D
	for <spacemit@lists.linux.dev>; Wed, 22 Jul 2026 03:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784691677; cv=none; b=b/ySxDGhlcG21MnrFei4MhgZT/e8YGYmoqjPuoFKuC7umA3yDcmE3sciFfUNZYyarTYNsLTMR9iYMl+XFIIdLjB7SZTmsH9eR7IQDjkmnMbxkJY1+P3uslpsV2abLlViUiPD0+q73dLl6+vhgIVw5NG9M/KB8jh9cp2LMz8Ym/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784691677; c=relaxed/simple;
	bh=omr1+5FGqP/4cAjLJuIvC7am2JBR6QvgB8tGwxi3xIM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sF9mmkkGE4zTOxWLN769wqabwEXmErYcQlgdoij2Ko46EhCdgDXF/YLmISZvAWTFHdvVk3GCnthKbAuqB1pHGISiDoCaBgY+WdToRhLGDYjwGlhcPZQhXwso4Ydd+bWlRumgs7302+i7u6bE3zVfpkUecfDPVOiQUSkSLuTMWis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SsOBquQM; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SsOBquQM"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cce6a0c9c3so110831275ad.1
        for <spacemit@lists.linux.dev>; Tue, 21 Jul 2026 20:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784691673; x=1785296473; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fMsLP/6JMCFywbSNUxwQOz2CeAVV57hRVViNt75YJiE=;
        b=SsOBquQMxKQa6JzdTH0uZxcYxxNzSjPpbPHSAGTC3nzYzwWJkLeYTeMGX4jjq55Yx8
         f/dBv3zi8XaTtjiihJsmaiyk1GDvCoNZ7pvL2+j6MLSPaix/4Rzjpn9EmxqqsTPYscW+
         Y+krYplNh1HEIZWcIPkM6WGwtDgvRkUAgo512ZqAviySrkqEfAJjQz6WN6FBWh5tiOAu
         sC9lPXG2sY4jr9hmyHsnHGIXdgSxlKzFcA3nAguGmlcVUcneYVcdSQLWKKFTQFASqPwR
         9RofucbOjfvdb0n9BnqlHskX0kypaplSMwvEojDKa6mJPQa1Nb4xZr+XedpPZvNZa9F9
         0/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784691673; x=1785296473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fMsLP/6JMCFywbSNUxwQOz2CeAVV57hRVViNt75YJiE=;
        b=ma9tpkAbVPhm4alHlKhrZ5LAUi10UQLLQ3M6qEYjx0lx2+hxfaZd+pL1cT/pO81Lio
         PZrE4ZVkc4/gbF5ZUQF3ivo2i9GB/yNHZMG7sBvXobdFtMdKPRDWyJPkyYDOwNQ/BbtA
         /B/7bfJMy1Ic9b4P5zj5CEySsbx36hQH0SBrGhBFMtbdGyCP9E5zIBKAzDytJt1qITJx
         0RSzrr8MBGDkxYR4MI1W4l8I+g4lukxOoFZrG1I33VHWP0ZdndXAAcHVnlWBMAvM8vE0
         OdVWN/2t0nMLew0pVpI64UOQmvwUEv5QnjhZo7Wh7bz5+AjO6dz+APuUgzT0qvfWqQpj
         Fd9g==
X-Forwarded-Encrypted: i=1; AHgh+RpLKxcmgJQa0SPuljfwzJtnyh0Db006knI48hryIReUaYG3+zLpm4c2iQXrXkiGx6AAgJ65/1Odbg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzcmnvyNrST5s3deX8PHU86obmpbZ7STdLBXS3ZXyWjH9bb6qiw
	4EBqszhyyE6b/fvW+tql+8tzxRQ8r5Uz/xRolsuWm5Y98zzyRuks5BU=
X-Gm-Gg: AR+sD11wAAYMuyNSk1acUGGMzRuj/bis3Tq9n5zkR9/TnN3V+Gnd+vcdVX3ilKFA2Q6
	x0hcjcDmRPJ4TuKc3vsY9RKEOzlBM8LGjhHBVpI+XLmLd/FOdOwTj4w/Yu5KtMz9oj5+aYjxKwN
	KFxuWHmYBbAGMPbQKu4Pguyb3i1q3W+EvGq94Mb8To6VUAh6KN3CSW0nPc+zJOCNWKmZtlfCTxK
	O4yxK79CFZ3P6DLtTCH3T/UX1NWtWTvye5HsZvlwH1SvVh/yilt5c1FWHy8Dz2f818YeZLf56hw
	5fdeafj4OVIc2KEv13k5F5uu9F/wfmPtbWQRP6uUUbLNRD+38v9L57yP5ccOXl0ImAgIQVSosoj
	GYLXhGA4mRyjoSFvKTL4MVxojCBb5RRb4pmrbog7xPVijVgoPWBdtFduDMj+PRtNyt/44lx3U6s
	2kaHzjRR4uCUaUsYEZ279ylnZDPqE=
X-Received: by 2002:a17:903:1247:b0:2ca:de3:15e1 with SMTP id d9443c01a7336-2cf34a0a682mr225407425ad.31.1784691673137;
        Tue, 21 Jul 2026 20:41:13 -0700 (PDT)
Received: from t-rex ([2401:4900:adaa:53ec:4dd9:f3bc:714a:d631])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc193f8sm7523404eec.1.2026.07.21.20.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 20:41:12 -0700 (PDT)
From: kr494167@gmail.com
To: broonie@kernel.org,
	dlan@kernel.org
Cc: elder@riscstar.com,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	surendra <kr494167@gmail.com>
Subject: [PATCH] spi: spacemit: prepare both DMA descriptors before submitting
Date: Wed, 22 Jul 2026 09:11:03 +0530
Message-ID: <20260722034103.12190-1-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: surendra <kr494167@gmail.com>

k1_spi_dma_one() currently submits the TX DMA descriptor to the DMA engine
before preparing the RX DMA descriptor. If preparing the RX descriptor
subsequently fails, the function jumps to the fallback error path without
canceling or aborting the already submitted TX DMA descriptor.

Fix this by preparing both the TX and RX descriptors before submitting
either of them to the DMA engine.

Fixes: efcd8b9d1111 ("spi: spacemit: introduce SpacemiT K1 SPI controller driver")
Signed-off-by: surendra <kr494167@gmail.com>
---
 drivers/spi/spi-spacemit-k1.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/spi/spi-spacemit-k1.c b/drivers/spi/spi-spacemit-k1.c
index 215fe66d27b4..96b41b67fcbf 100644
--- a/drivers/spi/spi-spacemit-k1.c
+++ b/drivers/spi/spi-spacemit-k1.c
@@ -278,25 +278,25 @@ static int k1_spi_dma_one(struct spi_controller *host, struct spi_device *spi,
 			  struct spi_transfer *transfer)
 {
 	struct k1_spi_driver_data *drv_data = spi_controller_get_devdata(host);
-	struct dma_async_tx_descriptor *desc;
+	struct dma_async_tx_descriptor *txdesc, *rxdesc;
 	u32 val;
 
-	/* Prepare the TX descriptor and submit it */
-	desc = k1_spi_dma_prep(drv_data, transfer, true);
-	if (!desc)
+	/* Prepare the TX descriptor */
+	txdesc = k1_spi_dma_prep(drv_data, transfer, true);
+	if (!txdesc)
 		goto fallback;
-	dmaengine_submit(desc);
 
-	/* Prepare the RX descriptor and submit it */
-	desc = k1_spi_dma_prep(drv_data, transfer, false);
-	if (!desc)
+	/* Prepare the RX descriptor */
+	rxdesc = k1_spi_dma_prep(drv_data, transfer, false);
+	if (!rxdesc)
 		goto fallback;
 
 	/* When RX is complete we also know TX has completed */
-	desc->callback = k1_spi_dma_callback;
-	desc->callback_param = drv_data;
+	rxdesc->callback = k1_spi_dma_callback;
+	rxdesc->callback_param = drv_data;
 
-	dmaengine_submit(desc);
+	dmaengine_submit(txdesc);
+	dmaengine_submit(rxdesc);
 
 	val = readl(drv_data->base + SSP_TOP_CTRL);
 	val |= TOP_TRAIL;		/* Trailing bytes handled by DMA */
-- 
2.55.0

