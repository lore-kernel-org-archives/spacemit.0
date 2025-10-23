Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E01D34C991
	for <spacemit@lists.linux.dev>; Thu, 23 Oct 2025 17:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761242376; cv=none; b=eipue2SvmBn7NZRIG/FX37GCEq+UA1zfaPTxbkuuzcwf8T4+NmYQvuV0DJNA5S7b1fJVS2cVHovLvWQDvGYlR8bcmnKbdx5J8gvnAA8cvON+zkHu95RR5hZsndNSytt+5cjsZNmrwo7OGIVkhaYQirbqDyQSLyQcAEHVyZVcKRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761242376; c=relaxed/simple;
	bh=Rrh/pWH2FUlHdUUjlORE05zGutMOLV+OfzEJrgFk/ZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IN2KZNacx+Qj7Qyw6Cfvf8pkKdRmrJ99DPU8D3DneQxODoUq9CJ9GMP5NjZaiIR48kcB9odB6wAkqhsIZau5fc/BYqOSN8Xgx0vJTZnxIdKPC5flQDcDYh+tCNY3PBMgNQkLu90uUUbtOcLSSLDt4XPSLN/sOt3R44SAhTFvm1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=kL3grqMd; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="kL3grqMd"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-33bafd5d2adso1129953a91.3
        for <spacemit@lists.linux.dev>; Thu, 23 Oct 2025 10:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761242373; x=1761847173; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAhNnAyRlJ+k8SadU3zB3G7wfuMMC4IwP0K85LfBSkY=;
        b=kL3grqMddZ2jY2p37Z3qevYGXMeZDTH2GlJjMyZMgWSbRhZyKHVz4t1kqLu6YaUhot
         LUGeSKzkj0MPsL8NNZre9jDRXSr+zBHTs8QvuwX0Q0Dfuq+f+BApSzoUghPQgH8kYBFb
         HuP91G7tQi1aZn6UQ6TApPboVAxfR6ENtqVolTu/x+vWPdEEqKPm88UM/pOUyNsEyowq
         6aLY/rjmzpVic1oERzT708MP8+InEDv/J1eCYBh/3B3kYWjaU7hP6DWLqtsMm/01RrSt
         Jpf5Dv5LbF19pGnNKV8bdUBGBwNPoSqby48UKYmwz8MkmL6jQQ2xvu9zyngAMrNnOV0f
         2mIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761242373; x=1761847173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zAhNnAyRlJ+k8SadU3zB3G7wfuMMC4IwP0K85LfBSkY=;
        b=ihrMavbjCbzZgWRAq+8yqzv99cVJvkXVqBGvs5P40H92lhvw8f3Pgt148NrdeESaDu
         UTGKl3yd018mBfFADzPZo/0cEkVv3XhpNokIMh1QA5Cb1ygezOKyoDaAkAzFGwkzTSwU
         K2G2BjIaD+K0INhHYBx3EK0TLsYE2uDkWe9oB0wD5iI++W2juO6moy1U9YDxnNVUG/4h
         Xt6CdGOBwWZWbeWnPlOB8KtEkKLWfcbd8tE7NPu05j8OC/5N+c48VGs130EmV6kMW5wx
         AfqLhJzc/YP2hsiPfGoSGpIm0K5LwFsaeGbNxJSKuWW317do6Gu57wGEub+IH6VTbJeH
         svgg==
X-Forwarded-Encrypted: i=1; AJvYcCUdzx+tl3ENrclAK0vvbORsuDpAthujlpvD2f6tEdTf+ewKMNAdV1KLwYVBnRjCnxXMJ9Lql3e0qw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxPSF3GcdmDLW/mQJg99CsUR0UgwTa3WgQigRr8gYUYn1aLLMZm
	o/NXDry1SCb/bsQUE8qcCCJXIZJlUwGt42o+BDt1XO09jDvh3J9ISpoSBWfd7u1xf74=
X-Gm-Gg: ASbGnct4kkM1ekBtSBThEWABS/KQdZ3uWpI6jMZbG2I8W1yuaGDzvmmedMqrsvdexOm
	rgipxl834O1uAHvsTKytPYn5HQteUW9A/DHSW/sNe6oayrzqL7/AeeEn3Yf7+D8mbIgSeyO8DDS
	p90e0HtY2aM94ANKqZ2lGB+NUnzcUu6DVhUjM6idIioisTlJTO3+NbpiKrX2S/VblMxKTlpwxIQ
	RRdjITgkkxkwhkhw8wfa9wRq6s2mF1ibqIwWdOmv/xIzCnBmLuh0wafrICcbuBqmpW8zBqQFK+o
	z9ne6EwMsTen5E6uSdyfjnblsx3JQRSzXwe5Bt9XOQGEmH4foh1RlyETDng2YFcpK/ge6JLGqaW
	kTjSL6SyiJm34lvXyqfGnhmvH9KTZcVoUAB6hSupCc39VPYlZ0eb1Whd+HbHM+XX8HqfLjJCz4I
	0MoM7gWnBXa1a9rFG05eI7RJ0=
X-Google-Smtp-Source: AGHT+IFxReVTv/oRMBHe2/GGbvb5RBCKr3lQm/bLqjIeSeFbGb+ib3c+ylwSGN6jx8ccpilEbhjGQw==
X-Received: by 2002:a17:90b:4cce:b0:335:2b15:7f46 with SMTP id 98e67ed59e1d1-33bcf8f75b2mr32365987a91.21.1761242373019;
        Thu, 23 Oct 2025 10:59:33 -0700 (PDT)
Received: from zoltan.localdomain ([208.115.86.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223d1265sm6447431a91.3.2025.10.23.10.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 10:59:32 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	han.xu@nxp.com
Cc: dlan@gentoo.org,
	Frank.li@nxp.com,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/9] spi: fsl-qspi: support the SpacemiT K1 SoC
Date: Thu, 23 Oct 2025 12:59:19 -0500
Message-ID: <20251023175922.528868-8-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023175922.528868-1-elder@riscstar.com>
References: <20251023175922.528868-1-elder@riscstar.com>
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
v2: - A continued line the Kconfig file is now aligned

 drivers/spi/Kconfig        |  3 ++-
 drivers/spi/spi-fsl-qspi.c | 10 ++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

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
index a474d1b341b6a..d4b007e8172b2 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -268,6 +268,15 @@ static const struct fsl_qspi_devtype_data ls2080a_data = {
 	.little_endian = true,
 };
 
+static const struct fsl_qspi_devtype_data spacemit_k1_data = {
+	.rxfifo = SZ_128,
+	.txfifo = SZ_256,
+	.ahb_buf_size = SZ_512,
+	.invalid_mstrid = QUADSPI_BUFXCR_INVALID_MSTRID,
+	.quirks = QUADSPI_QUIRK_TKT253890 | QUADSPI_QUIRK_SKIP_CLK_DISABLE,
+	.little_endian = true,
+};
+
 struct fsl_qspi {
 	void __iomem *iobase;
 	void __iomem *ahb_addr;
@@ -1003,6 +1012,7 @@ static const struct of_device_id fsl_qspi_dt_ids[] = {
 	{ .compatible = "fsl,imx6ul-qspi", .data = &imx6ul_data, },
 	{ .compatible = "fsl,ls1021a-qspi", .data = &ls1021a_data, },
 	{ .compatible = "fsl,ls2080a-qspi", .data = &ls2080a_data, },
+	{ .compatible = "spacemit,k1-qspi", .data = &spacemit_k1_data, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_qspi_dt_ids);
-- 
2.43.0

