Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C475261B71
	for <spacemit@lists.linux.dev>; Mon, 27 Oct 2025 13:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761571824; cv=none; b=B7bqNf2JoTX+ow7OStbCoSNM/K/tH6kbC3nbHcEb37LTPS6FC6jIsZoY9rMe4NLmPvQyyToPY0Mj10tBBm81JkK3SXo8yWFhrtNtxRkuv6J7vTf5rglWRiAfm06RyNap//hweC9s2MphWl77MJIrbpE+5XASJpTqf/3m+2lDSAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761571824; c=relaxed/simple;
	bh=irpydtjBnNGkoYUkduEdVKqR1Dq2M0mmWm+e59RVSDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rsRkAnHSUgKtqKd1HhaTpV1Y1A3jfbE3TZe3/WwFiYfahsiuh8TXLr8spww4PVJE21G46zChQi7fGdSDtBqVz/eVy9QDHe3aWdbGFUYcpZG1qpVL+4oLDbNanRdf/O3t3IvBhzmmeVjP6wQ6Buthjosokq4Zl4nk1jnf9/Dh0oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=BxR1knJO; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="BxR1knJO"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-93e7e87c21bso507190339f.3
        for <spacemit@lists.linux.dev>; Mon, 27 Oct 2025 06:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761571822; x=1762176622; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwBrji1LVVqX5QLhYIQg8MHPDU19g5B0S1hpvpp4hEc=;
        b=BxR1knJO+6eUQXmbHH/Y7yZRK+JdNWEwOb5bsdz+baXNWdD4QxE9QRkKQ6boyoAK53
         95Vqc70ZzJUWrcMQtrEweEhdtx+lt8NGRjX93x06ABaP0PtcpiPOdG2eb9WKhAQprtpz
         BNTs7+wrO76mpv/imsTucdwsk69G1yFHiN84ZshNTkPPs88A9netDAsPhMKmsAb1wV9p
         ynDV/0gMTRvIGYnU2NdP8naH6MLDI8xRrZp1wk7VQxP/jtQ6/UnujWcytIwnt3xU8p4I
         vh/v/c/O+PsXz8IW/fCDIKgGBhZC5grs/MtyXINpJWXpazwga1uqCtTjak+POoF2ACja
         nJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761571822; x=1762176622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WwBrji1LVVqX5QLhYIQg8MHPDU19g5B0S1hpvpp4hEc=;
        b=P0DkxWygWIlqeEGsVJIrLWUqFbFyjoEcny5kHPuYmhb1rxk98Bm6HehGWSiB6IohE/
         mGnN1khxSCPd0Hk4TeK6GS0STM+rEzeHEidxYtOmck1oJAqx12IOz/SV1ajtuBfS1qpm
         3okUvsnSJXESrM61Iv74FHc5rLMwe/8XuHBr1e1pwLvK2jyBHMYXmBsqTCDeZN8Sl+Pz
         euQ2r/VlkR9GrX5VZT5UsL+uOKNZmuWjnkqrSjImdCslFi5fLFw5O7pWHmOTvqaX7azm
         HAXH646aCAsle0XQJGthKp5ybJkfnvKTzurz35X98aBd4hK/ZTUseHV5KwvN8EcxSZy3
         G97Q==
X-Forwarded-Encrypted: i=1; AJvYcCWS5Ysy+yDULv+DaPmLxBHT6I0kH8QIsdP/PDlmoYzYByoJLBXGHP3zUEVV8bb0EUcGBgFCtsREWQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwzD4IoY+0WAZn72a5WWIocrlqezHybKT9CiAApOx/qEcBQyPeg
	3n4v2b+2p/kN5uVtQZa1ro+yg1+XNxYSK8Ui0WQONiQA9Cg2zjxxqnHWQ642eIK1wQygB718mQB
	0tb5oIXo=
X-Gm-Gg: ASbGncvdNiBSgK/aGoCw8gF+GZ/uC9KFfladJU22EwGaVW24fqjYvHQverqADJdQ1fh
	y4JdgyEy6j963715nWzvD+Dm97+v9MFrov+CAhrngg9MePHWt6umAUZdZ8jggnLSr1GOovNGZKJ
	eRGtiM3srj3h4Ka4wlGlQzSJYk8eXzcFOBGvLbUZ6beGzSjkkrazz9vM6/FinP0wEmhSRpVHiJz
	yUWBZ4DEtmlX9jO4aJku6tyEGXSZaH9Z2WLZtwGUELzRHNPtdEfAAMvPSKP2CQjT+8s4E7TJO19
	dZ/UE6yAEpi30VmfjZbsieqKFwMgoNWmMM4Ho6XVYYeYqi4pCbDm9jbShmlSQ0rkjMC6N47IG96
	y/SPL2wiojchxk3ezxgXetQMBjK6OhXvx5RGNL3maM48wTozfPDWrNFrHFgngX6KsX3sQwNJH3x
	s0Jzx10ZqUdHXmmx+V27aUXBRNsqOX60hstmZNeqem8igUulYMLGEoRp0pX5hodVJ/
X-Google-Smtp-Source: AGHT+IEea/t006sDIUwyJirb8lhRy1y9vqvFLUYDpT5bn8joxV7TPLkwITOKKA0xlex/9Fj770b8Lw==
X-Received: by 2002:a05:6602:1687:b0:93e:8c1e:cc5d with SMTP id ca18e2360f4ac-945b819d91amr15227739f.5.1761571821923;
        Mon, 27 Oct 2025 06:30:21 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5aea78e2fd4sm3093057173.26.2025.10.27.06.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:30:21 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: han.xu@nxp.com,
	broonie@kernel.org
Cc: dlan@gentoo.org,
	Frank.li@nxp.com,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v4 5/9] spi: fsl-qspi: add a clock disable quirk
Date: Mon, 27 Oct 2025 08:30:03 -0500
Message-ID: <20251027133008.360237-6-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251027133008.360237-1-elder@riscstar.com>
References: <20251027133008.360237-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT K1 SoC QSPI implementation needs to avoid shutting off the
clock when changing its rate.  Add a new quirk to indicate that disabling
and enabling the clock should be skipped when changing its rate.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v4: - Added Frank Li's Reviewed-by

 drivers/spi/spi-fsl-qspi.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index 1944e63169d36..2c030dd6facc7 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -197,6 +197,11 @@
  */
 #define QUADSPI_QUIRK_USE_TDH_SETTING	BIT(5)
 
+/*
+ * Do not disable the "qspi" clock when changing its rate.
+ */
+#define QUADSPI_QUIRK_SKIP_CLK_DISABLE	BIT(6)
+
 struct fsl_qspi_devtype_data {
 	unsigned int rxfifo;
 	unsigned int txfifo;
@@ -306,6 +311,11 @@ static bool needs_tdh_setting(struct fsl_qspi *q)
 	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_USE_TDH_SETTING);
 }
 
+static bool needs_clk_disable(struct fsl_qspi *q)
+{
+	return !(q->devtype_data->quirks & QUADSPI_QUIRK_SKIP_CLK_DISABLE);
+}
+
 /*
  * An IC bug makes it necessary to rearrange the 32-bit data.
  * Later chips, such as IMX6SLX, have fixed this bug.
@@ -536,15 +546,18 @@ static void fsl_qspi_select_mem(struct fsl_qspi *q, struct spi_device *spi,
 	if (needs_4x_clock(q))
 		rate *= 4;
 
-	fsl_qspi_clk_disable_unprep(q);
+	if (needs_clk_disable(q))
+		fsl_qspi_clk_disable_unprep(q);
 
 	ret = clk_set_rate(q->clk, rate);
 	if (ret)
 		return;
 
-	ret = fsl_qspi_clk_prep_enable(q);
-	if (ret)
-		return;
+	if (needs_clk_disable(q)) {
+		ret = fsl_qspi_clk_prep_enable(q);
+		if (ret)
+			return;
+	}
 
 	q->selected = spi_get_chipselect(spi, 0);
 
-- 
2.48.1

