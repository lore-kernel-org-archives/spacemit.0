Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE23D223715
	for <spacemit@lists.linux.dev>; Mon, 27 Oct 2025 13:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761571821; cv=none; b=ArAKWHdheFM3hb6XUyUmFv+GNHSqO+KP+cpKPkAYyrdUa25cpOo1bdwPf7EG7ig3q6iJfyceTXg6EJCUcWl5pVbzYywopQoVZTRxlN69IuaWIQRhwmD7FAMHzFbH1UT0dDf5VKcJpbievI4A1JTWKQ63H+MSRgI4aHte7ef1QhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761571821; c=relaxed/simple;
	bh=h91Mh4hoPgByHdcKd6/RneQUViXMJHcN0u0JxmaBjQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iiEs/LncyJIzaeULy0Os/VEkcOG/TCuhizEr8nUhKoJGrIvFmV8NHjMDCZ4crqGJyJfJVHGbSHFcBZKf8BKwr14+fZodpVDE+Y26Ft6ZSvn+pahw2zGtevhzOprFyRXEpj9Jk5/lCSS7TKr4u4uzT8Jl4jqAQMJ65ni57kAKa2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=uM4lY3M2; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="uM4lY3M2"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-430c17e29d9so19345525ab.1
        for <spacemit@lists.linux.dev>; Mon, 27 Oct 2025 06:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761571818; x=1762176618; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXEnNR948aKFzOMEVavf8q+kCpka+pPq8yUEtfNzTFc=;
        b=uM4lY3M2f9geEQRiWS55eCWCCkwKjNVvcNl90UBwWlVr/RK5qIiyCH7W4Up6mqcikK
         sS65Wd2B7g8slC+sh4L9bVy6OS47a2Tti1HdlDDWTtVUlabR2bIwAsVvQYv98eT/p2br
         u1uiWE49CMdCKeB3T0F/7hRRRXq4pad5hZcfTSAxwVFMjn8Yc/CSQHnjvsGqceuibTR7
         TfMjoeMowwZf13B/U54Kxjc5gT1h9T32zEWllReO1ktvZlsraS8fv1t6LnqpRhHtI8MC
         KNrE5MUbAJG3UPnJjQz+hv3Sjx6vnXihVmvHgRdyAlMMbH1JW1l4snyJdJyqE1d48I0e
         QxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761571818; x=1762176618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OXEnNR948aKFzOMEVavf8q+kCpka+pPq8yUEtfNzTFc=;
        b=C6Oc/a1jOaaw9JwO/5vx4cWabq++mczVGNL9WRA/POSdJJ5JDUuzO6PNMHuo7kaV/f
         xh5yPcnm82fTclVXgbOzPXZ3pT2UkRi3JOxMUQZpym385Vh9LFJe9LWBHPkfQQFK5U+D
         lx0UPQi7R9S2ZyDVz3hF1rrHX6shuRVKU5x/BtqB04OuEuRCvFW+3IwrnkRSAC0X/Qh+
         0uWyKSDr5j8wbQCo+LBahS2Ng5qnhP6Bi+e1lJ40XGJkiq+G9wNBmNh/sn1uSfi7ETfK
         0RrgIZHcZCwGO5ZSrLVoAJ+IRPSuVaiVVoaSmAS8DGnXyZgpbmRmr5qopv1cYtbHy1sX
         qShg==
X-Forwarded-Encrypted: i=1; AJvYcCXUFdf+KQTfdrQYKgmjbRnNbe9OEjOa3lBfsbOK5KqGLgxNQ2yHLb3+FKJl+8B0tfzQB1rpt0C1EQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYeP8TlCI4AOGWQHLCnoFA6SlYkFk6HrP0FdJjwmaqltKPhQWN
	Uhb5nzfAbPpQlER4edxzJOTvFLcrZCAKS9xj1NdKFWmomr39b3lPzOAGa9+qd+KqAA4=
X-Gm-Gg: ASbGncsjagNHEs4BeQ+HpujaGNEWo2LtvBMGQtg0Mvt9SJ3+NJ+WltnIJ+d/0UIs1r2
	Qq5vEPnkAXOFeh3Ygca1HQQWVXN8L7XF9SkFcpuTwrELIMRx+TKUqk9Af4CwVi99I//19fNaoSL
	0XUduImhJ+WRW4xuatZg4TymBT6mbp1awORebGkDg461tMRCY48inGvW2H2jZsuXznjKxGsiK90
	3QQKMJW5jQ0kKcm7FnGzuxvgR9e1uYNDx5eDAnpMYYndirhWsFrobJ3NMWcc5htH6XSO/Luea62
	Tl+UyehrCuoDuW6MJ4mmKzDwElgEgqT37os2OlmRPtuNyKL/2kzqwUTlbLyN8GfCLmkifMKYO+/
	wDEL2pAzAgInbsIi/EIdkT47mAZFf7CfxRNJk+Bx8ZTVhiSAwbsyqbGlkOHaFZ8okjemXfJbVUL
	gxluBfJJyWqvASG9v5tXxQriHyYC9K+KsC4S5HoDzA/iw=
X-Google-Smtp-Source: AGHT+IH0glKysst9aA3Dl1hO2CkWup00aLcqDqNV6Kijix8yVXf6s0ExlLzii7wtaTpwbQLaOSZlgw==
X-Received: by 2002:a05:6e02:2689:b0:430:aea6:833f with SMTP id e9e14a558f8ab-4320f6c7f59mr1567415ab.8.1761571818580;
        Mon, 27 Oct 2025 06:30:18 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5aea78e2fd4sm3093057173.26.2025.10.27.06.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:30:18 -0700 (PDT)
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
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v4 3/9] spi: fsl-qspi: add optional reset support
Date: Mon, 27 Oct 2025 08:30:01 -0500
Message-ID: <20251027133008.360237-4-elder@riscstar.com>
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

