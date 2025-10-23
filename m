Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5392734B42B
	for <spacemit@lists.linux.dev>; Thu, 23 Oct 2025 17:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761242371; cv=none; b=tnErUutQBMFtrcTF+MPmZF2MUZyXFJsM23TE+du/Pom0lxwFs3IGyr03Ls7HiLluqx8WLte8hnx5BtL6g5ZdFnpXAHRR4Z5KbiNE8wI+AF/CFj4rQASokIzSlEqCBQ+8u0CGyqVj209+QAXnVk5RyUzeu3zNCyDSwTi5soDU71A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761242371; c=relaxed/simple;
	bh=7lcSZM0dC9g4v/BNnBxiVygQKnTYtxHeK/OZIIXwV00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kwk6j9fbG7ZKtPuqY0P8Jgh7jvNguIlIQsS/D7NwT0DeDTLt/YqQFYP16aMjvraj3u3JxLNweJ2y0jzn41Wb8EzjHssKjckOhTq7VDQS9/i6ISqkWc/S39bYxPNIsGsBw+kwvONgzSzhTf3eWVj4tQfKmDyFJW2NLISRYR/P544=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ETTYQeYi; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ETTYQeYi"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-33badfbbc48so1539838a91.2
        for <spacemit@lists.linux.dev>; Thu, 23 Oct 2025 10:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761242369; x=1761847169; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=On265SWIIsjj6cFhkQLuouFdBySNyVnfLyhJagcyMrU=;
        b=ETTYQeYi/gPIE3cmmqPji4nq0km3COV5Nrze1hl3tIX5lCI1hdwh31y/Kz4NXgE/j7
         xkjTrijwbbmPOVTA0h8JxMscNDLcwEAIiN7XyLauHEJ5uch3gzSJiKqcD8ZiRd4mHgeq
         5Zq9kE6xXjqcxcsIzWKlus2AF8vIbORqgn5mrzZ/Cwrp1RYblsgDTM2IuRZUth1Te0G1
         YxRnI0iFm9FRxhGHWfTU0mQg2U1gvaXDPD8aOZHTYuWL8RUUUpRU6wCVWWANMUZEprLc
         lJoUBNfq6fwY97sIieaGyFVG6o3g5h5u6LGwmXJWS0ypXdQQyysYYczbvosjDfwMzYSH
         VFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761242369; x=1761847169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=On265SWIIsjj6cFhkQLuouFdBySNyVnfLyhJagcyMrU=;
        b=V5VGOJ7zxu1E/i8CGDbe5koFDNHmrVMaV1TzEQgytb2K/YCnwbzZnMFsRvgyciecLz
         ENvItH52qczh3xesLxWycaXwRbcVnFQH/ikAMY6T9K8O6kNbRB3H+E7nPFAyi7WPigWe
         FU8uewoW/05R4RNg9taSsDMWgwYGuYHOefmcIR6gO87odX7kHQc0nJjtbiPAXobM1epO
         40v9WGTKRZ7jCXQoJjMXW9u1+QbMcA+c8UxfO+t29efFOUOeKlne5z/Dfa280CTEI3/0
         6VoIb1lZHHY0AlnKHQzin5k5JMyVJciqdPe2Ta8keIHdNtwnh5UdwzlHiFe3vwRxeRIy
         QWxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUg9kUBmsm1/pasag1kOCrbwriNFpM/ZwM7Oq1SCsyK1Yx9MmEMEG4oBh+X5d+3iczlieT/J+mCg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwfKGgV08qs5jDK3V863bOJvfdweK8vGRZdVZyhlhLgcwzvEs3X
	UXnQvtUryGAZie0xzfogHg1tk3Jjv3BQV5pLh4SUuzvLkkBPjGn6kzBp5aRagn4RHt4=
X-Gm-Gg: ASbGnctzSmv6fRqAAHmQzIif73s3MGgx0NVd93oYWlE5zFXN0SF/tJtPws3Y857mX/h
	YF3ZtA13MxOpS72O3PhW35BMiwJaPHzuFGpCsM3xPo40kWeU08CGWt8wuujJnyzPfd4qZKjdHN0
	8Ub7irn2K/mGMhRDYJPQVu7/pdyRQPB/cCMMnLU2drXKyX+BeTZ23PR8/BjZh46gIic+syMJrwg
	8sd/Y5KwqbabJtJBAIjS2o8Su4fjGSu/0V4iRVmadPwnefTkOs01tFV4vTvDCWhvq4TMrWa9szB
	C4iKGMOSAkBAKLVsaYOShJq5sEw9WKKqNj6On6zXoRlzsrvzbvq1yeUR3S3k2In0FKISzS90ogd
	HQFWGqsZNm3z3TIL9Yl4sZ7kBz3gcUgZp02RVikV0r4ZU4cXPoBdET9QUovNMkx5Y4Pg0Cg3F1t
	xK+4t1YbR1ejRUj/0Wy4J6dh0=
X-Google-Smtp-Source: AGHT+IHMRWTLOcYt9GF5JwdHPs17n3sdItQgiLvosy748nQ99rSr70fD9GfdnC6xjLJTc4YsYnnuZA==
X-Received: by 2002:a17:90b:248f:b0:33b:cfae:3621 with SMTP id 98e67ed59e1d1-33bcfae47d8mr20130607a91.32.1761242368668;
        Thu, 23 Oct 2025 10:59:28 -0700 (PDT)
Received: from zoltan.localdomain ([208.115.86.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223d1265sm6447431a91.3.2025.10.23.10.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 10:59:28 -0700 (PDT)
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
Subject: [PATCH v2 3/9] spi: fsl-qspi: add optional reset support
Date: Thu, 23 Oct 2025 12:59:15 -0500
Message-ID: <20251023175922.528868-4-elder@riscstar.com>
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

Add support for one or more optional exclusive resets.  These simply need
to be deasserted at probe time, and can remain that way for the life of the
device.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - Added Frank Li's Reviewed-by

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
2.43.0

