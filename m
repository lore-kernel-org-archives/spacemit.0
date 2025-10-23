Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79ACA34BA45
	for <spacemit@lists.linux.dev>; Thu, 23 Oct 2025 17:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761242373; cv=none; b=IXsOmKmVMSaRlXGMvXwNAOAupfL6DTrK720yVwfn9RP6iwMaudJ/FvzQ06e6Apqa7fC7xyAqV9v+BpNSscrmfhK9Z3e7FM5Y9mnX1wAC3kg9/8BAHqeYVW1Ehpb3bTeVPgIqp440dwKKe1pTd01wq3V0H7ueHBlNQBmlYkwTGb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761242373; c=relaxed/simple;
	bh=EkU2Rug1mgYJi/cmODCWd1WGMqqUFjCxy//sYzWdjcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FqA8VRx4iS61w8ybCd8CpL2rw8HnLR4dMPW5pQovXQGjx1iyOANYwCQhZ1kmfE5hXd5r/hWPen6KiPmNPitwUIhT4fYJlDkeKj18kLEZB+W6QpW9kLGxh2Fc0+IGY+52Cpz1Imh+oVFf5yret2/sFxoIqTbqCQuMUI41+jEulqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=K3hzY70S; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="K3hzY70S"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7a27c67cdc4so671373b3a.3
        for <spacemit@lists.linux.dev>; Thu, 23 Oct 2025 10:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761242371; x=1761847171; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I05R5wxHah0tP+5XjRF9CvuJmtSK0+imsUvDjfvNbmE=;
        b=K3hzY70SWekUOqfpOkF72zeiVpvue88pH8in15XkMZXcKnRlDGaoPXSl8fONw1xSJs
         MQNH1ZlGS2giSc4ZzxOPXb3b0KdNDz6r8GJ1oRX8F8Y+ncA7hfXYOzPrWYcMDxUpUpjO
         KmbuQKtZuA4akhCBhl5wQTckmELe2UUGv1Wgzps+Ac6pj3H7A/irhS1Fx63hGLAN1BM6
         q838wYvW9LGiq3O5s/f2U/cJQ3GFDVABf1pr+cj7DzHE6SZxfXxrB1d45+syASJsn+Ff
         ndMS5DOgGEv91/mYrwls2E3TWCY5FhXX2WmO/PKDCH+yObmZdoUnpKDZJ81NA0muqZ7b
         mvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761242371; x=1761847171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I05R5wxHah0tP+5XjRF9CvuJmtSK0+imsUvDjfvNbmE=;
        b=XnXMEEdOE9+UAPzR4B8POB3Mu6fqEwxBcBCj5CJDq9B1lOtrVqBet9FSYRYqbOy+fY
         I84wcd0Z85oeUFIGkYshWXTupXMEf85A7AYTYvUxeYIp2rSLG104Q2Dj905qjXyVp5Mi
         2DUgw72RuAAZdZeGSxxYB3I70q6Hr5hqSU6ck3En50Zkp+fkgQhRZCNWM26zzZpJjVEf
         aIiaAgiZjZ1surGtp0QbxZs+jpkNgAH6tJjmtY5RYHykiebJRVAD4KIit2mL3T9mDuTJ
         p6vuyUVtpV41wcpvWLV4AlAiym4oRJbgpFnMZcsb1lRqFFRHd9Fxb7luIg5/It7AG3in
         41Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWDZKM8jriSObba51f5HmD8g5Cp8F1DiIOJINNDObjJlC4d357yB4rNGpsfFfCAMFHD+iJdwuNoBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwFozIb0a6t5C7v9Z1Uc/0jIS+p3UKdSinvRLsIQ8U4Qds5iNwo
	1qk+6aDO89Y+orZskG9kgQvwRdI1nwL/+1nbwQHhEjOKdgf64Mim5e52ZIbP0sTX4S8=
X-Gm-Gg: ASbGncs0CUXxsGuryZNBugeD9FwaYicES3p6IvBWlHcMsoOXRLGJO/j1bFLEYheV3zy
	Tw5v18M4GDk8bk58TN/hYEbQ3EWYEYTUBDx2V3ngufWZ3DVUucqr7I+5yJWRWaIHlf5kX/AJoII
	IfHFTE6aXg1MoBXf9qfnVSGybdxniHfhbqJhxH+jXcFPVJeUXS+5n3CmTpbYFtYPxi1h5nacmF7
	dSZSNHlOuk83F6lTUrjpc2WmNCQcLKwDCXYlPRY1DD/e5o1hmdCSMQ0AXE46KBMIV/A5EF4bZ7X
	O3TWnMKL1KtRbTFf9YK4FR05ufWluP0DeRna7jVD7uMkx6I7yfuB5AHktPil8caQp7QnN0sIb/i
	XSuDx2AqQYsMhj/50dGRaYVdwYZ1QBO1wiHcw88FmDetFhttzDcsp8SaicsBO9yM9obmBVVUJzZ
	62qIHqNDdm1DzQMbXbsU4XDY4=
X-Google-Smtp-Source: AGHT+IGoCA5eG9vMTRsnrdRnkF5/ZgcCIYMlzlQVHh845VGO6X+2euBU7KRA6snytjs6NQ8wnUF2RQ==
X-Received: by 2002:a05:6a21:3086:b0:334:a250:5774 with SMTP id adf61e73a8af0-334a852285emr29903456637.11.1761242370937;
        Thu, 23 Oct 2025 10:59:30 -0700 (PDT)
Received: from zoltan.localdomain ([208.115.86.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223d1265sm6447431a91.3.2025.10.23.10.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 10:59:30 -0700 (PDT)
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
Subject: [PATCH v2 5/9] spi: fsl-qspi: add a clock disable quirk
Date: Thu, 23 Oct 2025 12:59:17 -0500
Message-ID: <20251023175922.528868-6-elder@riscstar.com>
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

The SpacemiT K1 SoC QSPI implementation needs to avoid shutting off the
clock when changing its rate.  Add a new quirk to indicate that disabling
and enabling the clock should be skipped when changing its rate for
operations.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - The quirk flag is now named QUADSPI_QUIRK_SKIP_CLK_DISABLE
    - The predicate now returns bool and is not inline

 drivers/spi/spi-fsl-qspi.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index 1944e63169d36..c21e3804cb032 100644
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
 
+static inline bool needs_clk_disable(struct fsl_qspi *q)
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
2.43.0

