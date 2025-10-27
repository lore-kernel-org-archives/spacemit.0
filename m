Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DA8272E45
	for <spacemit@lists.linux.dev>; Mon, 27 Oct 2025 13:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761571828; cv=none; b=ETjon20ANIHLIc2GDUIP1SkqhsXJqxMDBZ7LeWlEw0PAZYfMaftV2CgvmzfnAnP6fIiIIR0vFtxOf/IFRk3cRtJZzxdrM7aayO1ZHyNvooOz143JhZFn9CitTZUKQp+bq1Dqvbv+Pv1mwEle8Bo/x8SNMKALmM0t3aTVjf7HNuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761571828; c=relaxed/simple;
	bh=BwADLFKGpa+de95hFRvgOEPMyxxO0x+ASxPYf2FXvD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=If6IZ0wUdUSY0H2NMHTFo/uBGJc3yYdOwpz3rjSdGVfKME9scKYb0zb9LkMJVHRpcyHTvxCzB1CBFdUT0dBx2lgvSF2/4MSLkfxgMW8B4Aw/25Bmb9SNx+JPfUN32FjkndeEZ1rAbJhQ3F1+Zkc01svY4Mdpsvyzi+lwh87/L3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Tm15l76i; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Tm15l76i"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-430da09aa87so22012355ab.2
        for <spacemit@lists.linux.dev>; Mon, 27 Oct 2025 06:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761571825; x=1762176625; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPbR25sftlpl2ir5v+hHNY+KLBX0TEvDp8d/P1ZTVnE=;
        b=Tm15l76iqArr00vkGej7BHUW/F3yuxsU7B5vPxn5NaPkpAmgR78fGPsej++mhi/r/k
         BqftPnqx2xs+yJfBIY9ZYrzWft0XFRtMQitSc/GkaPl1Fd5gbCKrgOror/6eLJEWNEUF
         xLrFDSpEwaGC/Zq+baG9KJFLvI9oKTi3PJSvrQHJq+RSt1zEKAGYfPFY0AmSnAsF70br
         Q+Ie1VOgMEX5KzhmDLbQQ2YqkPNqGIwcHtqWjjPASdWi1eFI9BbdoPSSxofrHfOaQx69
         8zxhEivuJpRRko0mzsEnS5OjtjBDhu89n1YGWfB3Z0k5tYFgHH2T3BG3+cRbGRAHc4LW
         MMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761571825; x=1762176625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPbR25sftlpl2ir5v+hHNY+KLBX0TEvDp8d/P1ZTVnE=;
        b=BvnT54m/LN57T16W3rO4EaClvgRgNF4bHrmcdL+7NE4QXGuc2Pf8LW+jOCRHqRbqmE
         z1mJiUoWDQjYFh9eXCx5WbUVjmmtqugLSMYRF2SqAZ/TZCysIr5UvfmI+nug3EDsqrg4
         W3fZ8xAsVZiIw9JItDZG3Dt6ZIAnvXsU8fv98kqAr8cYvn4xx3J4CIrzcNRuSa3usN1Z
         8HP3LLay9eq9UtZBl+lFI8yIMhPD5utUu926bO7qjnu/OlNTzhuhGuazUUAy6wvyMudf
         nMHZeo2x8zDC8U5rWd0dghdEkOoPL1wanaWFp9w8qU1wl+mTdujcWKMCFEp8RB6ZcPIt
         UAQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWb+aSO2LfGtBEQAow88J11t+VbBqPFFs8KFbPoe7cKpQiTCTFrCZzjLRn7CS5yRCvNmSAIomW29w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyN5L4b2LY09Uam1DIWyAAbp7RbaXdM4g44PIw6iXwTNZQAVVzx
	pmu/36r7J6TeQixsrh6sHJMhBfUY5+tgF8bZjmmOolAGnbcbbTEOjH8OWyib5gBHBjo=
X-Gm-Gg: ASbGnctzrhgJ8zVkz+YuMX8128BwNmFBEa0ao0gNOQx9JYqgcXLQcoRDUy0tM8XSLlJ
	o5H1b6iBq8mDGlqEh2MR8ztcNw1eDBRnkktplW7ASKJmd3ePfpDJVaDNzvVY9Vt1gkjE3HtxX3i
	ul7gRRI1Ce535lsMfme/35TesIJxHknakEylwDzcL/OTsNIiFJKbk0lYQeM9hsjt3H/DupWhRKr
	kXXZmGU8mJZAByVMpioGLelX7x8M7ObiP8Zbuws1lqHPjm1Cot1eUiSwVDt+ZneJNYWnNpmUlfh
	8LFdKQ+vad6xxRkiWInLUiOpjRY0wjcJ3XSgr/5gnuPLxaaSiPyO8PxuxvtI2Il4KgdkBvYeiEp
	YM1meck+0XJn74/qgu1u1qm4WA6w0B03f8g50ckJt9J0apBWsHN71AcUdKefaXTojsz6bzOPdVK
	ODO8Fblt/emQtWCmqmFte1dl3oCT7+aLeYndd2FnikVpo=
X-Google-Smtp-Source: AGHT+IE4vZfshbOMDVZNKh1eoFq+Ds25y5NT2j8sGmj2MHLjX5lybRWfL/HsmrZ3kz3tWd7cuHz3wQ==
X-Received: by 2002:a05:6e02:16c6:b0:430:a7d5:235f with SMTP id e9e14a558f8ab-4320f77378dmr1192385ab.15.1761571825149;
        Mon, 27 Oct 2025 06:30:25 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5aea78e2fd4sm3093057173.26.2025.10.27.06.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:30:22 -0700 (PDT)
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
Subject: [PATCH v4 6/9] spi: fsl-qspi: introduce sfa_size devtype data
Date: Mon, 27 Oct 2025 08:30:04 -0500
Message-ID: <20251027133008.360237-7-elder@riscstar.com>
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

In fsl_qspi_default_setup(), four registers define the size of blocks of
data to written to each of four chips that comprise SPI NOR flash storage.
They are currently defined to be the same as the AHB buffer size.

The SpacemiT QSPI has an AHB buffer size of 512 bytes, but requires these
four sizes to be multiples of 1024 bytes.

Define a new field sfa_size in the fsl_qspi_devtype_data structure that, if
non-zero, will be used instead of the AHB buffer size to define the size of
these chip regions.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/spi/spi-fsl-qspi.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index 2c030dd6facc7..46a3187b33548 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -207,6 +207,7 @@ struct fsl_qspi_devtype_data {
 	unsigned int txfifo;
 	int invalid_mstrid;
 	unsigned int ahb_buf_size;
+	unsigned int sfa_size;
 	unsigned int quirks;
 	bool little_endian;
 };
@@ -737,6 +738,7 @@ static int fsl_qspi_default_setup(struct fsl_qspi *q)
 {
 	void __iomem *base = q->iobase;
 	u32 reg, addr_offset = 0;
+	u32 sfa_size;
 	int ret;
 
 	/* disable and unprepare clock to avoid glitch pass to controller */
@@ -795,17 +797,17 @@ static int fsl_qspi_default_setup(struct fsl_qspi *q)
 	 * In HW there can be a maximum of four chips on two buses with
 	 * two chip selects on each bus. We use four chip selects in SW
 	 * to differentiate between the four chips.
-	 * We use ahb_buf_size for each chip and set SFA1AD, SFA2AD, SFB1AD,
-	 * SFB2AD accordingly.
+	 *
+	 * By default we write the AHB buffer size to each chip, but
+	 * a different size can be specified with devtype_data->sfa_size.
+	 * The SFA1AD, SFA2AD, SFB1AD, and SFB2AD registers define the
+	 * top (end) of these four regions.
 	 */
-	qspi_writel(q, q->devtype_data->ahb_buf_size + addr_offset,
-		    base + QUADSPI_SFA1AD);
-	qspi_writel(q, q->devtype_data->ahb_buf_size * 2 + addr_offset,
-		    base + QUADSPI_SFA2AD);
-	qspi_writel(q, q->devtype_data->ahb_buf_size * 3 + addr_offset,
-		    base + QUADSPI_SFB1AD);
-	qspi_writel(q, q->devtype_data->ahb_buf_size * 4 + addr_offset,
-		    base + QUADSPI_SFB2AD);
+	sfa_size = q->devtype_data->sfa_size ? : q->devtype_data->ahb_buf_size;
+	qspi_writel(q, addr_offset + 1 * sfa_size, base + QUADSPI_SFA1AD);
+	qspi_writel(q, addr_offset + 2 * sfa_size, base + QUADSPI_SFA2AD);
+	qspi_writel(q, addr_offset + 3 * sfa_size, base + QUADSPI_SFB1AD);
+	qspi_writel(q, addr_offset + 4 * sfa_size, base + QUADSPI_SFB2AD);
 
 	q->selected = -1;
 
-- 
2.48.1

