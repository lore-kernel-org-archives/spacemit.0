Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685B736A5F2
	for <spacemit@lists.linux.dev>; Fri, 24 Oct 2025 19:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761333361; cv=none; b=StkT9HzRlCScH44lAWhEz/PYdGumFMmNUMpc9eT0PIZkekSHt2Xm3DBvGcVeCGKPoFxgn9beJ9WZQxE5g5c5XPSFlIkVCr+Tm6AnkAWz9vaYLv0bjFn1ToWXuTlZhD6aS4qld7nTDZloobTD4SEpqxymCAx9VPfOU6H6fMbJsyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761333361; c=relaxed/simple;
	bh=h91Mh4hoPgByHdcKd6/RneQUViXMJHcN0u0JxmaBjQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=obB3SHdltiUd/QbK/q4t3lUpfyswKkYo5HyvEJZOMBCJ0Nk1QKvDKhfibmjk+2w0iiPxc7hLmL/Paml0sm+z9FdygoRtLUyBy8Wn6SjlCJ+W26dReNAvDsTNc67KewMbFQPRUlubsXelOSWFhpT5J0RJLn4dO/6gk0vXTi8UwL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ARmMc1I3; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ARmMc1I3"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-938bf212b72so100048639f.1
        for <spacemit@lists.linux.dev>; Fri, 24 Oct 2025 12:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761333358; x=1761938158; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXEnNR948aKFzOMEVavf8q+kCpka+pPq8yUEtfNzTFc=;
        b=ARmMc1I36m1jUly53/sKlP+kXJg1jYXF7iS1JEQ/eAyfrSmUL6iqpWIsGhQKLP5lW1
         uGzqp5Obc0/0pUJLWEvL+sXuz4+TczjzWB5EDB2lt9rnGYFbdBBD0O5qidPM5ie9Osnm
         DP+hguSXITNOT/BYnsClERVYy8dEyG/f9i9vcP7yOySdUmNbQY09P+J3tsp1pZkym2zm
         Fir+MzUnA3VIwurKrHwwF+c73O4Vdf8yTLYfFu+JI+k1Mh0QvoQvH4A0T8XLsHw1mO5H
         cqxcqPZeUDRfzoV6BD6mJxIWY603kr9tVvYHur9hQUr/I8/0Ow3hjUV+5GLGuUAw2zB/
         Z6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761333358; x=1761938158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OXEnNR948aKFzOMEVavf8q+kCpka+pPq8yUEtfNzTFc=;
        b=hBGIk83jkU3CU7NT7QRXIF4vRuUiVq9hzs4NZ4K2SgLbK//jwsu0/jgb36lmK6xlfD
         Jn9U17YoAlPcnl1Y7mWe6MhXsXa+ywknmsjprkjiZKDRR9APUQ2A7tVBp5K6dt0F7vij
         FsLVwkxbWdrPDdmebMn5FB5gDsAiIKzjPUckdleZZlFEL9mG1IFiV39pjlM1bvx432ga
         HvmPWFv09s0rQljJoZ/IvTRSY3fMJgpkmNgt1rJwlXasHQEshhey3Rc0xRL82gE5DYL9
         CImdDM7a7gl8pyZlTgNzgOE14lLrjc7o0WFAUojaN8E8I1sYsp4gpJMMbAJgpxUzPdCO
         4WTA==
X-Forwarded-Encrypted: i=1; AJvYcCUXamAVtLGRLBlGH81KA7mwXBqBpAS5XNalLMqIGf85m7E7z9004YOn0GIHzdEMfJ23d9LFs9xFfw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwHs59xnG5YJeP3PlwjEiTEtJPg1C6SIIYJXeBi7qdXBZQ6TKOB
	zE8fg8Vvu0TVPT0MPQ5eTkqdB5FMnXem7cixrP0eyzLHaPZCObOzBCFU+elDmym3lzs=
X-Gm-Gg: ASbGncs18qFutY766aCj6fONIlZEwZe71VVViTKyM20CU2re5k3gSxaPCkiJ0iC7Ms9
	LC8cyzGU+tIV4xYNEQ2hzeMTR5P9SH/9oQh/04Qk9j/Jfua7vCs9XXOhuLUAvpjcea8EsD1J33E
	oSA3zQSP2bvUEMxihDDO9O9Kqw0BEhWmtcRi8n2VcIH1v37s1TPURbSo/a8GTZt43p3i3vvsjaW
	BeJ6YBWp2wpqUFOgn3z7Jql4dbqvwjzoo73uJvHZxdA1I1/4Q4j+kS6PXCbD3KCRRrmUTvTPK8e
	Bf7+ApI77uegId5b1oPazuwEr5yo/Cr2xwrlWsk3spRs8/DLPE/1VQ4mzb+k5SSTQ3eOw8Dc5Lt
	eN1MI7FIrbqpVKMa+SNpOB6I6MV1D+DRj3AWdxVZ7A8ugIU5KQYvhmPdW5+T0fs87W4nawYH9hI
	nkWzs3hV6yf8/fh7Cg3AaP/mpL02B6U8aH1Npakq6HwhQ=
X-Google-Smtp-Source: AGHT+IEtD+Cr8mACF/K0NonNKa9lBHI7Tp+o5Vfp1juGLlBk90z7fTUTAMVH9dichKlDp3Ypt60Lnw==
X-Received: by 2002:a05:6e02:148d:b0:42d:bb9d:5358 with SMTP id e9e14a558f8ab-430c527f7a5mr415578465ab.27.1761333358489;
        Fri, 24 Oct 2025 12:15:58 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5abb7fdb7c7sm2427824173.44.2025.10.24.12.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 12:15:58 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: han.xu@nxp.com,
	broonie@kernel.org,
	p.zabel@pengutronix.de
Cc: dlan@gentoo.org,
	Frank.li@nxp.com,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank.Li@nxp.com
Subject: [PATCH v3 3/9] spi: fsl-qspi: add optional reset support
Date: Fri, 24 Oct 2025 14:15:43 -0500
Message-ID: <20251024191550.194946-4-elder@riscstar.com>
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

Add support for one or more optional exclusive resets.  These simply need
to be deasserted at probe time, and can remain that way for the life of the
device.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/spi/spi-fsl-qspi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index c887abb028d77..1e27647dd2a09 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -36,6 +36,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_qos.h>
+#include <linux/reset.h>
 #include <linux/sizes.h>
 
 #include <linux/spi/spi.h>
@@ -267,6 +268,7 @@ struct fsl_qspi {
 	const struct fsl_qspi_devtype_data *devtype_data;
 	struct mutex lock;
 	struct completion c;
+	struct reset_control *resets;
 	struct clk *clk, *clk_en;
 	struct pm_qos_request pm_qos_req;
 	struct device *dev;
@@ -857,6 +859,8 @@ static void fsl_qspi_cleanup(void *data)
 {
 	struct fsl_qspi *q = data;
 
+	reset_control_assert(q->resets);
+
 	fsl_qspi_clk_disable_unprep(q);
 
 	mutex_destroy(&q->lock);
@@ -902,6 +906,10 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	if (!q->ahb_addr)
 		return -ENOMEM;
 
+	q->resets = devm_reset_control_array_get_optional_exclusive(dev);
+	if (IS_ERR(q->resets))
+		return PTR_ERR(q->resets);
+
 	/* find the clocks */
 	q->clk_en = devm_clk_get(dev, "qspi_en");
 	if (IS_ERR(q->clk_en))
@@ -923,6 +931,10 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = reset_control_deassert(q->resets);
+	if (ret)
+		return ret;
+
 	/* find the irq */
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
-- 
2.48.1

