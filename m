Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0792773E3
	for <spacemit@lists.linux.dev>; Mon, 27 Oct 2025 13:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761571829; cv=none; b=ZugkdkM43nS+O//EPLfVJtNwmreVzfNaE81AU6P24k5bGYxXEHDN0h2a0KRfOV2pOFtNYXNT7OsHfV5Vclnjr1YWTYYS/A/BymJRdpzY6ohed9ANIrY2ppTQG4LcWJZ7mCAvVOHrngLC296E9Wo22jUj72mnD9pDFfgTUpbkHY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761571829; c=relaxed/simple;
	bh=1A6G+O+DOvefLV+rD2dNTlkz0auSGEUbdA/tj/OiN/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AhYrObYaQC6xgl9aRGrN6sD2E8+k7rur2tIWWmcnlxVZWFlrZ3D511Ge/xJEWMiAlpIbt4ilhgn1jwibPjXzeuEH4H0CCXdd8ZnUQfNT8Xl8dOduquPBK3+DoqJvRxUY3ncbjj2rDGADqZDzNRXq2erNsjS7plOzQP7/OMFY8mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=KKYhWZB4; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="KKYhWZB4"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-945a2c8e52cso62422439f.3
        for <spacemit@lists.linux.dev>; Mon, 27 Oct 2025 06:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761571827; x=1762176627; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Sro30bK07ZDN2ex4WerPYEtaKK8tB8dVPj/Yht/kY4=;
        b=KKYhWZB47F4RWGoVNnk6Qw4KD7f2Fsj0GW9yIvAwArm8xeDNUSqOpGxJGhsgaX67Tl
         /6FwNXtNnTFx64SBGgeSm1mF18J0YVH7BZnCCgdGS49foJ6H/xHmObCzg/2OpSj1TrBU
         O7L+sxbVYPl726Y+SqY1AEPeBtG/A0sLvpLvLhz5Wx3ftAdamyNSUrTWNF1n3kxusUE1
         eGI6Ccr9zi0NqZAA8f3bzWc8c7uLQ4VhJv7nXlvfFV+4jDYk5Vf5U5nESPqvqg+5REug
         2wyKlnEZeZjV4twCuCgzvrs1D6B0bj5NYin6KpmCX4adlPFx1BcYSRBStBZgzdCX2TlF
         yp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761571827; x=1762176627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Sro30bK07ZDN2ex4WerPYEtaKK8tB8dVPj/Yht/kY4=;
        b=tIfL4P8PYsDSSp8DcurxnQu3Nk99iJ1Xn4gXlu7bvi6gVwEpDvf4Prp+fvZg4j8pmA
         93NsEd+P+yKldPVeqXT8HBqAGOZJSTyowIkotsD0AtgowJ95sZ4EYEJQ+jdwFoBgcjmN
         y71jml0r5rOL10+2G5eUBsMD2XtJoWkvD4fvjZnd/aEZzw16JY8oF8pRbJWzhyX/FGmA
         QtrSeo9V/pxvw/a2NtUBPE0reJ5pznp2+4px1cuCvZEQ/tuelUHYQYXkqQD/2emZsX7s
         /MOzpaijrmT7GCBNC8ZkyoZpB0foxQccYhp9J3E1yS3BveW/jvSY8cLUXUit+pMpcDfe
         BCdg==
X-Forwarded-Encrypted: i=1; AJvYcCWLMc/Dx3rEO8k0neSqLUOummYrLc31D5CUeVxVaLaX7DZ8fut5Yd3mz3yIdfJTp+/SlYv5uum7iw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxOSzlvYz/YqZPUNV+r3nKSKd0xm+T/S5ABBD46vedYg6wCYs/B
	y29ZuX2W6NcRGpSRgEPXSvaLPmYqUhNbHtkxJ1FAsX5Of6iU0iXLjaBY9z4CZMYynK4=
X-Gm-Gg: ASbGnct+KgZwL7nuBswbg0Frv0YzDNDjU7bI80LngzCUIm8IXW1raU/2sKZB7yBE92Q
	t9KK2NbrIdq0tO1N03YGQXyHIkRkZzbj0yW20qUhPZwQamk7GU2DeAtEBW+y902a/QEpuKo20E2
	MrwKOTuDWddSpbMjoPbHpLrXRISZ/Odt7sWIaNR3d5epzlb1R1VrKK5VHYy0crt6is8t6f+9Q77
	6sPbLxyJj5x8HxqH1Mk/S2qEEmTY2dsglqNbB47owh4caMT9S+mhsBF/RQTY1S+KhDDiYiXhOyJ
	jj4XXkbiLDoyethB8RcHIdVxEP35bdG3OaCW+52joENQLOa4YU46O9hBWhrOntZj4EbyHfrkX75
	xCV5juFt1+ckXON8jGZoM8XL8nXAB0bM3iVwOZe9egpMVrH73WSDfJj4ZPT3Y0AC3eMXXbmXSR1
	j43S6DAMWC3/AJaFaa1b0rV3ihdq7X/A2QYZ6jxFxpcY/CT3zJ2rUaRA==
X-Google-Smtp-Source: AGHT+IE/dyb28DRdvs9oMw6bZQwYlyqE3BQFW88FuQ4+GtxGKYPnc6qBw31lrQ++KNgKjicl1u85uw==
X-Received: by 2002:a05:6e02:1c2e:b0:42f:a60a:8538 with SMTP id e9e14a558f8ab-4320f778af8mr1256935ab.16.1761571826897;
        Mon, 27 Oct 2025 06:30:26 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5aea78e2fd4sm3093057173.26.2025.10.27.06.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:30:26 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/9] spi: fsl-qspi: support the SpacemiT K1 SoC
Date: Mon, 27 Oct 2025 08:30:05 -0500
Message-ID: <20251027133008.360237-8-elder@riscstar.com>
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

Allow the SPI_FSL_QUADSPI Kconfig option to be selected if ARCH_SPACEMIT
enabled.

Add support for the SpacemiT K1 SoC in the Freescale QSPI driver by
defining the device type data for its QSPI implementation.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/spi/Kconfig        |  3 ++-
 drivers/spi/spi-fsl-qspi.c | 11 +++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 4d8f00c850c14..592d46c9998bb 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -435,7 +435,8 @@ config SPI_FSL_LPSPI
 
 config SPI_FSL_QUADSPI
 	tristate "Freescale QSPI controller"
-	depends on ARCH_MXC || SOC_LS1021A || ARCH_LAYERSCAPE || COMPILE_TEST
+	depends on ARCH_MXC || SOC_LS1021A || ARCH_LAYERSCAPE || \
+		   ARCH_SPACEMIT || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
 	  This enables support for the Quad SPI controller in master mode.
diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index 46a3187b33548..a223b4bc6e637 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -268,6 +268,16 @@ static const struct fsl_qspi_devtype_data ls2080a_data = {
 	.little_endian = true,
 };
 
+static const struct fsl_qspi_devtype_data spacemit_k1_data = {
+	.rxfifo = SZ_128,
+	.txfifo = SZ_256,
+	.ahb_buf_size = SZ_512,
+	.sfa_size = SZ_1K,
+	.invalid_mstrid = QUADSPI_BUFXCR_INVALID_MSTRID,
+	.quirks = QUADSPI_QUIRK_TKT253890 | QUADSPI_QUIRK_SKIP_CLK_DISABLE,
+	.little_endian = true,
+};
+
 struct fsl_qspi {
 	void __iomem *iobase;
 	void __iomem *ahb_addr;
@@ -1003,6 +1013,7 @@ static const struct of_device_id fsl_qspi_dt_ids[] = {
 	{ .compatible = "fsl,imx6ul-qspi", .data = &imx6ul_data, },
 	{ .compatible = "fsl,ls1021a-qspi", .data = &ls1021a_data, },
 	{ .compatible = "fsl,ls2080a-qspi", .data = &ls2080a_data, },
+	{ .compatible = "spacemit,k1-qspi", .data = &spacemit_k1_data, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_qspi_dt_ids);
-- 
2.48.1

