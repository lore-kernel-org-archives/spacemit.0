Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129CC439F70
	for <spacemit@lists.linux.dev>; Wed, 22 Jul 2026 16:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784737504; cv=none; b=m8NaDv5OBBz+Nc8234LoZod5Bs2NWIBcU8s8O1S1hBbnFB57bz1BY1GriKL7j6FWdgI4stNOYYdO8RhMJzudho5Dow4APklo8j7TXMuxtv96vWH/arXxDnS2d4Yt0fW4R9bq1jLBMsggsiLoZLx9hx4orhgOAt5DhyXSldlyHYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784737504; c=relaxed/simple;
	bh=afNZGMtYzA30KV4bDEhm00UcoH2/+9UJYMOEjo4Xyt8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=USeoHBh/p6VfZ6zfkeScHuVp5lklH7hitDB2OI1QMToCVsHDi3spc+K0vGni2FUkRXEuMQhs0l0AN5cEPHP7TOZRM14s+RcsSg35ClTrUp4OEgofAVyUXz7fWsoH7w6dWpbDKVdeqwXBplXo8w7wczZULT3JzJ4nYvzvo0u8d0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jz9OK3VH; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jz9OK3VH"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca7bea5e5b3so9168596a12.1
        for <spacemit@lists.linux.dev>; Wed, 22 Jul 2026 09:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784737502; x=1785342302; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tXYrafFh6v41hHNrCujwkEXP25aXy1QcuniyU+tuiOM=;
        b=Jz9OK3VHc1WMyFcYM634kqG4tJBkzzwUixfbHc42PFV1dXwD9evsqGDVCiY2mSojbm
         bu+TRV6zrHU2X5klomkYPpSHJPAqRSlcy/wCmq4qAIO/+iugvwCG/IfTtOTvVcagZYIY
         JZlNDvW7I/wdTkGnyIeJCEj9tt+V4+hcAaASohg/kzNCGpe77YNSPvwfLkIH913Fj8pm
         VnmBTcxBqa9oKfojpNh4J+LKFYrnZwFquUXLTeDEp9PUKQN+nhEJ/MevZqI5VbOc5ApT
         r0x1ZYAdgZZFuc/q45d84P1mt1xcNvEmNjWH/MU/hYZZFWih66K01SdsA88SVZormACQ
         YXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784737502; x=1785342302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tXYrafFh6v41hHNrCujwkEXP25aXy1QcuniyU+tuiOM=;
        b=hDb64auNSC+tGdVtDslbgr7sPpB93slGwHElYaK2Zh+yKF18tDiktkLc3uk4nj1I57
         2ztJS4OisCSiJMrlygvmC0mtjG3ka7Y+1Xe3/LQX2kHGdHNcTntNsZfaCL5f4RN0pDaq
         jEdfeVA9L0AoijqkCwU8gXaivPn9ppy2jS9dYf4AKx9nAI78L6BwGy60aNw4nRdwt3Jt
         hOdCSsn01A/PPSnDuIcIqP/poCngTSOqSua5BtQfMqHCLZMZURwQC+8fYq6mrkMKMdBG
         HozMNnL99MQYmH0uIdINln2mQCkr2cSRkbTaH667tJzbDC5YgkcuxXeZ/p6hnfwCOndb
         up5w==
X-Forwarded-Encrypted: i=1; AHgh+RqP7ADKULadmb03iTf6yf1d5QbnhIsd8miWKDV9AWFCBHfqDg/U6GMo8k0d2plnstf7GegOSrSmwg==@lists.linux.dev
X-Gm-Message-State: AOJu0YysT2BgF/gyIMZUNPAWvs1foKSmRbd/To0+SgYt14Qlm741/x5t
	RefBcwFdE+MySCFHQMlQq9UHOpigERRZKKh6f4fAVdgfhq9eyj/kOJM=
X-Gm-Gg: AR+sD13pu1iWyTxRDcHduZ0YbJOOQEUl5Bq/pwUj8lnNUfMHY3QBVVXh8bEPBcKwoDc
	O4sRcMSRcxQSQmhmtM1M0806uoIrWmteII79sLKc4TbnvEwB0oJl+o2+9PSs22hfrZvev1NQ177
	j/X75XRSxfWdP3OUEMdGhb0DvORFyWXSZvrD1rVGV6xgjzBwQ3uEfyKT3hOShtzOMWxibKXRW1a
	z7gXNcwt7Cln7LGIAag/R3qAKT1V3NOCWe8UUz8hFIeL3FhCV/y1MLn0IC+qqI2BT7BdlCpNSOx
	NjvVSLeHd+cvmpVfZ1QKv2qs6BrVMl2esJjHdCVPUA7LrieCYRoXAKdVvxu3WrJqmLyvR2bpXq1
	BvTr2ng6V64S3+GNwwATBGsE663qy3uOYXX1Eu1e0J1y63cbfE2T2+qRr1Xp9YZrsYKkVE8+W7o
	0zfFLuxns+85OVQYQ6cCcx7f58IF6TsHfbDdqt
X-Received: by 2002:a05:6a20:a10a:b0:3c3:88a5:83db with SMTP id adf61e73a8af0-3c3ad6036b0mr25638872637.5.1784737502208;
        Wed, 22 Jul 2026 09:25:02 -0700 (PDT)
Received: from t-rex ([2401:4900:c212:546e:3d3e:f0d9:52c0:8a0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc6162csm10753122eec.7.2026.07.22.09.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 09:25:01 -0700 (PDT)
From: kr494167@gmail.com
To: broonie@kernel.org,
	dlan@kernel.org
Cc: elder@riscstar.com,
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Surendra Singh Chouhan <kr494167@gmail.com>
Subject: [PATCH v2] spi: spacemit: prepare both DMA descriptors before submitting
Date: Wed, 22 Jul 2026 21:54:44 +0530
Message-ID: <20260722162444.11415-1-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Surendra Singh Chouhan <kr494167@gmail.com>

k1_spi_dma_one() currently submits the TX DMA descriptor to the DMA engine
before preparing the RX DMA descriptor. If preparing the RX descriptor
subsequently fails, the function jumps to the fallback error path without
canceling or aborting the already submitted TX DMA descriptor.

Fix this by preparing both the TX and RX descriptors before submitting
either of them to the DMA engine.

Fixes: efcd8b9d1111 ("spi: spacemit: introduce SpacemiT K1 SPI controller driver")
Reviewed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Surendra Singh Chouhan <kr494167@gmail.com>
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

