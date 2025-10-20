Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032903314D7
	for <spacemit@lists.linux.dev>; Mon, 20 Oct 2025 16:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760979127; cv=none; b=l9PcCyhjGQuyU75Q+2E/i1Xp9WhkAissIdlarQhcLMTGhSaAvVNQGM+ODkM4BiYjdgIiD+g7bPsTN7JZbKxfpyJOacF74iqzuzC9LmC49VZRKnH8lAkwfjyzF6dN6DLBQOek3IDc3haIYLCTbqjOed8FKIKi1fT1lzT26kesKZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760979127; c=relaxed/simple;
	bh=4nbEQ8HptUqVap6SvzTvdcQnIWSSvjBtVAeIUe9rLpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZpCEaQlq1BmhVId8WzV1y87x+e255BMeb87jv6dUpSa6V1c9JWAnqE2A/l6YZeYf+Rh61voi9UKCjAWBRODzRPcfbwMtfJdF2mdpI2/c3NkSW6DmKmtg1cbfesRxW4EIajqPqG06vZWLM16f3gwDN1cmKs/io5xntqdRgg9v+Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=QNrpe4GQ; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="QNrpe4GQ"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-42e2c336adcso20370255ab.1
        for <spacemit@lists.linux.dev>; Mon, 20 Oct 2025 09:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760979125; x=1761583925; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbkGMRUd18xqKrBxXTdlQugMN1AFOTBEWC3fjv7PzZo=;
        b=QNrpe4GQwtmZLz1bymYd5PetD7DmGdjWbgk+S0dWLFmvpnVU/ZqukcZGLlBRTk68DX
         hmmCteqB+tJ1W/1NhoWriBS4Xzk20cycxrxnak1RRVArynNeT16jd7jaKdkFRoYYyr+G
         LaZSEBJ9K3cCY2kcOTnveWmjiNC+T74Cqj1WCL27HPfCPBa5UNOOSeSc8tOyvFIcWM/b
         Us/AoI43DaHwe7/Qqj3m46MYZg+7inprg/pirYomO+jLTdEMBBtzLLYd7Z7xDLpq5r3R
         XMMloWGwGBk1IOOa2fovHZRxJeQeW7FW+K/caPKH4kqsqMZgYHwxKrJWveSha3/KF7bO
         lybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760979125; x=1761583925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbkGMRUd18xqKrBxXTdlQugMN1AFOTBEWC3fjv7PzZo=;
        b=RPGfveBWlcj4j/zQ8zwGQmpCDh4GUCIuV6lVEH+wnPRmFVc24UQMKTt1N807XBbr7w
         9MVXeutPMilxzgmb49EsLuqK7oxwWkZ8GofQfgaZDBOr36FxL5YMYOyi3ALt/3po083q
         YphmUnTn/pE0xmbC68tw810k9jQK2/vPeGTskuBKqvTP+wIqPCfMKtu4/uTgOVfFDZRb
         N9EHo4ZfaVkWyx12qG5ize90wly9H2S/hKndh3qCmzDOGrqc9WWszyYFJ6eC4rP4DSSb
         BvSBfwCGZfCqwqO07I05Qo5CgWVcFfF0eWt2zXCPYkxA+dj3O9Bg43nhVE7MoRtGOdDs
         xVEA==
X-Forwarded-Encrypted: i=1; AJvYcCW3moESWe378+XknIdaWZRr/kYJ+0DtGM98PhLGJ1HpebCOordSqUCxP/qd47M+Zy0Jl4pkwtg4gg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+FJTnkbCgN79WFycztKlg0UTzfbGFkSRvspmVIA2l1GebzDUZ
	1H/G/gVQ4dep25W8qb3Q03oYZ2LBEf8vDSIRVjNDHOEwX6floxAlSR8WVD89ipQPIx0=
X-Gm-Gg: ASbGncuF3X8j3/IwIFZpMHJuWaLc8z4bYKURQ/PkjvvswrpfgT8wwsNsriszwBkrejo
	8CUfaGhg4rSsxZHtop9Ob/jm5hjo6ovsTFe0KvBF7shyd3dDlCzXN39BhJEF3Ws5ll5B8YNTosD
	mfz7tlQ+O3YW8e533doF3kGzja58a3fBAab0p89Pw0par1VXYQR+IHPsevgtDBixJKvxOwNx7dd
	3krDRI3y40A4lYU32eo22cMejdCPP/6Z4SVenUrhxv8LdgkmY9wzi34oMj1dbThad1qbax7bmmV
	oTOznWW0Q7He5zu7l8Xg1z00fyEg7hCzK8kIRaB0qAeF9mxdS92f6NziHNbPDIYgcEKNUsIn2o+
	HTmDr0O0Qmbpmdmztie1hmKBGMMpW3Kl1xp8hlY/yqKN7WjlWXvWf9n+pXjUe5Rmb4LpHbrO3BV
	g3WQ272N7PkQu4MVjMICqqobkzxLKZLPD4yBLu2vkcEKk=
X-Google-Smtp-Source: AGHT+IHCCXKGX40QH2SOOPyUbP1RmuEfte3N63LZWZHm5ASq68QX+HJbW0W+2yUOmNOCzqkQxIE7PQ==
X-Received: by 2002:a05:6e02:154a:b0:426:e20b:f5d4 with SMTP id e9e14a558f8ab-430c52200admr217203785ab.10.1760979124829;
        Mon, 20 Oct 2025 09:52:04 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9799428sm3116783173.63.2025.10.20.09.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 09:52:04 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: han.xu@nxp.com,
	broonie@kernel.org,
	dlan@gentoo.org
Cc: guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] spi: fsl-qspi: support the SpacemiT K1 SoC
Date: Mon, 20 Oct 2025 11:51:49 -0500
Message-ID: <20251020165152.666221-7-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251020165152.666221-1-elder@riscstar.com>
References: <20251020165152.666221-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow the SPI_FSL_QUADSPI Kconfig option to be selected if
ARCH_SPACEMIT enabled.

Add support for the SpacemiT K1 SoC in the Freescale QSPI driver
by defining the device type data for its QSPI implementation.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/spi/Kconfig        |  3 ++-
 drivers/spi/spi-fsl-qspi.c | 10 ++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 4d8f00c850c14..2e3d8bd06ceb2 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -435,7 +435,8 @@ config SPI_FSL_LPSPI
 
 config SPI_FSL_QUADSPI
 	tristate "Freescale QSPI controller"
-	depends on ARCH_MXC || SOC_LS1021A || ARCH_LAYERSCAPE || COMPILE_TEST
+	depends on ARCH_MXC || SOC_LS1021A || ARCH_LAYERSCAPE || \
+			ARCH_SPACEMIT || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
 	  This enables support for the Quad SPI controller in master mode.
diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index 9ecb756b33dba..f4f9cf127d3fe 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -267,6 +267,15 @@ static const struct fsl_qspi_devtype_data ls2080a_data = {
 	.little_endian = true,
 };
 
+static const struct fsl_qspi_devtype_data spacemit_k1_data = {
+	.rxfifo = SZ_128,
+	.txfifo = SZ_256,
+	.ahb_buf_size = SZ_512,
+	.invalid_mstrid = QUADSPI_BUFXCR_INVALID_MSTRID,
+	.quirks = QUADSPI_QUIRK_TKT253890 | QUADSPI_QUIRK_NO_CLK_DISABLE,
+	.little_endian = true,
+};
+
 struct fsl_qspi {
 	void __iomem *iobase;
 	void __iomem *ahb_addr;
@@ -998,6 +1007,7 @@ static const struct of_device_id fsl_qspi_dt_ids[] = {
 	{ .compatible = "fsl,imx6ul-qspi", .data = &imx6ul_data, },
 	{ .compatible = "fsl,ls1021a-qspi", .data = &ls1021a_data, },
 	{ .compatible = "fsl,ls2080a-qspi", .data = &ls2080a_data, },
+	{ .compatible = "spacemit,k1-qspi", .data = &spacemit_k1_data, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_qspi_dt_ids);
-- 
2.48.1

