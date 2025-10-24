Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DAC369992
	for <spacemit@lists.linux.dev>; Fri, 24 Oct 2025 19:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761333365; cv=none; b=LSoK+NfDBXqfKHXRdTCnRGfRdxE91cJdgZ2449B2E+/rvu1PlK1QEj2PcPnLMLa+LFkimBqSSzVcfJrOs0sNQ6J1LsPH7/MCybE/nCu3ZDA2WjwmAaGSLPxeOYdIxS0ScyqCLgWEF2sQW4XlazgkhLVstoI1R0ogMgJjo79r5wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761333365; c=relaxed/simple;
	bh=fJYpRFRILxdNLkxi4Dero+aiC/WPnQUq9uXWEscfpMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NHX3PueEwq++/R8YTuyWITB92a0UCKln3PrGGAATynwz8ctnPSA3PAmSl7r5nG1hmSBBBJu9NR70XvWwrFkDakxbeR6nQXvJ45zAtIDRiSZb6TFsL7tAX3OKSNpuxxNdyouEKx6g9Ql8FwoTgywHPUZwyhj5Hx8Xb2MRpkseoNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=SAlv8e5i; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="SAlv8e5i"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-430cd27de3eso11021265ab.1
        for <spacemit@lists.linux.dev>; Fri, 24 Oct 2025 12:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761333363; x=1761938163; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPf7dJcoXU9s785ZftOfTSEvtOpAo2Z85GYUpq2DxVw=;
        b=SAlv8e5ihW+ztMZ26W9h9WfT1Y1jG/PgUcnqIRvkqOUBPV3C3YtNiNuvjNO5k2J8+i
         bysYFNKKE/ggcAo2q59vYpGy/PP53cF3db2qFRszRASF3XBB1AP6JAL5MQJ8FfXL/c+9
         4vQXjFaWf8d2endntX8pO5G218oJ2Thw4gAO5Odje19oAAd3Ir6+QwLdzD8GgWoqD/5C
         ySpTLd1fP2SASsn1YMob0DBJQD8MLCTkAdJ9k6dYMmDjW1hmb2u1kqfmrr851KfNUUsr
         99yeUPewzKkFCn1o1dAvfQUQ4oRsOdSUBLmGx3/1cleVqH0GQ88u/r8U0BK5GHYVSQ9B
         +6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761333363; x=1761938163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPf7dJcoXU9s785ZftOfTSEvtOpAo2Z85GYUpq2DxVw=;
        b=ThHyjEaDtI/pCEu3sZA/080kF7B1UEv7lgz69baqcBwA5zeI6HS2sqXuO6amud+gFG
         xqSuESGwnHbKur2EebsBMBZAF+ABgH8Ni7eDQ0cY78d00doGQ360nGvd+MhEMERJMvvq
         OzbZfSC9a+cW0aT/oLakzA6k/QwWl5xbOzucBF67hYvV+xYDNdrB+HrfP9yJ7iY/LCCV
         EjOL/liB/KDiUsZxE+9dvLhVqvWBl+nv08RTvQTWbkyh+ECsiRNjfQZn4Mx5Jsm8QR9h
         wKsUKs1YhrDDjPfIiN6DNNB6IvaypQy2qs/bXZTIxJycPpRZdzRmOUkz+qyL6pmNmsJx
         Ljpw==
X-Forwarded-Encrypted: i=1; AJvYcCXpe/VcaFltRrPbQtqSGSOT3z8US9uL65I0P0eNupMpyH1qnyhzJSgEA2qlqq63Nuje4d+8gQ0I1Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwE7+n7ZztqhB5TWSPENEdTDkM/01/5qcxsK8vy3ipBcIBJ8Zj3
	BDxLyCRMCIqBhmojp3lmj8A8SeXn0pCenP3QGL2aND1ukdkfpPatL9CPGusbJrfPx6U=
X-Gm-Gg: ASbGncv4TH53NHAfDmGS9FYKMIzt+91K5waq7s2M0RW52eTtx/xAU6b1i9aRY3dyjH/
	Acg48tY+N+KxW6cYKW30NW8eIRnM25SPuMOvv59wV3IvEJgFHvvTYK5gvdWV5/u8MhAQR5GKU4V
	JsJfz55CviVtxfIikqiH7VIRCG+HlVgehlj7H7prHBpSc3+PN/TZqO6LLj1qSo3XTy8ABwg5ED/
	mALEpDLE3fKcswfem6UG+27HctFM7qmDkfrIKwqTkZRZ6amTlLeZtlPazzIihkd9C7tdS2REngs
	xG2EJ41KiX12Ra0jLdDXnHoXDTg6rMJJoJnBWlWzCCUP0P7U5JuPxer5h8gexGMJn87tH55Rp4e
	tmbyXUDvRvVsywXB+pLGKxinFW0NiDjW4bdzlxGEkKDnguguhJUv/I751TauS606zPSNSHSk5Xq
	/OPVcBpK3yGkwtpjxl3LNg+pTosfF2Ym4ajJAsVg33oxezDi7frtXJHQ==
X-Google-Smtp-Source: AGHT+IE7iOHD5RLmA2kk1MvUlsZ0DBgSjQiI4X5X30Jlm6cwRYZovCXte2pXzgLa3TLg4hmhyFE+dg==
X-Received: by 2002:a92:cda3:0:b0:430:b4ca:2696 with SMTP id e9e14a558f8ab-430c514e290mr430965745ab.0.1761333362623;
        Fri, 24 Oct 2025 12:16:02 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5abb7fdb7c7sm2427824173.44.2025.10.24.12.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 12:16:02 -0700 (PDT)
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
Subject: [PATCH v3 7/9] spi: fsl-qspi: support the SpacemiT K1 SoC
Date: Fri, 24 Oct 2025 14:15:47 -0500
Message-ID: <20251024191550.194946-8-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251024191550.194946-1-elder@riscstar.com>
References: <20251024191550.194946-1-elder@riscstar.com>
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
v3: The sfa_size field in spacemit_k1_data is now assigned to be SZ_1K

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

