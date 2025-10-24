Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CC136B98B
	for <spacemit@lists.linux.dev>; Fri, 24 Oct 2025 19:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761333365; cv=none; b=RecJUXfBGfo2mcE2+qnec5DXwT+RyRK+h6YxZ2Z3qOSMpMcspVXEgCWl6b8Qrj3nmg/7X7+XnHMajae0Hn9E0PTgLVAcFOYSXLLP6G4QTFLQfkGSlD/pfnHuwpFhIkKp9EojDyak2EKT0Y5hi7ml+Ztc+nC3Qj77s/LAYIsi428=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761333365; c=relaxed/simple;
	bh=GdKb+Uk6ps8nMgwL/qeWK8J0hHUVDxnEmafXGXdT8Uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z40HpUagrLmDkcXoUfDXjF89gudE0PfBO0MSEza44cuBAUY6vNRYG9TJiR8Y5rh7nzNWNjwk053orP6fKiqAz1cobSbFKn7C8P5Jnxk8AElARkChd+zFJaLHXK3mm8Nak6U8Qge55ogi9kSZDDxxZU5T8nqGb8PBXVPpNujgz80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=F6FEB+YT; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="F6FEB+YT"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-940d9772e28so98362339f.2
        for <spacemit@lists.linux.dev>; Fri, 24 Oct 2025 12:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761333360; x=1761938160; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bdm2X0Uh+6QoNIFH/yUFpeoxSayQYwUIia5PVqWIucY=;
        b=F6FEB+YT9MJ0CVf2SoNefdYTpJfDCP/LaFqBULYJcpr99YrVhuliGA1bMWHqPhfAmj
         6rARaMbQFKL8hfEr2YAG3zSPhWj9r2zhdickYVvEmVfzFwJ5R5+GKFRFWdmLzatMpM1K
         n9ZcO8St1LKHT2SzpQZGrxaRypjfINM8eL8mxt93pYKetm5vmVNm7IMm4HiNCxTzR9OK
         AKLj5oscu2e+zwLoVfqMtp9iqpblyo6uCmzI3PQqK9L3ABLmfKRSEM8rG1bIHWmcydSL
         cYMhCzhV07rT/7DMr7UQ6GXcJOL5vATD0Tj2UeNj7O4Tl1G+3Rm/qA1Nrl1f9MEu5pSa
         hGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761333360; x=1761938160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bdm2X0Uh+6QoNIFH/yUFpeoxSayQYwUIia5PVqWIucY=;
        b=IdvxeonObzj2egkfWTHJxzpGN+0kcer08fW8fWooHton0K8qb7JKaMg8wdwILdvops
         lP9E46/71ZQWyBjndQk526QWoUW8T1lRGMS11vABqCgKLvV81vm94gnaK0Dqfq5k5qqw
         MCaFQZXg92Wcd0r0WNeOy7yh2bUvWCfRYcImLwsUdM+b+dRR/lFKdmhtU/0eQQquFVIl
         cPqa2YC3wqEr57mBhxQivQKZQLxoh5o7t2qQ37kRb9wym7hBfAEhc1FXWeydwQbQx+sU
         g+vpZE/nXrArDNXnoy45eV6q9STYuZQAXeaaeO3scPXx9JtaJeyqbDKwpc8G4yFGlOqp
         /MFA==
X-Forwarded-Encrypted: i=1; AJvYcCW/4ZMftgoR0x1i9r+OONyQ9fNfxFJSJi0e+FzxuXGbIh6pZ8WWTJxJ/SXVIELEeYfP1tEl8vAilQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxYLmru2VArdIUZtSJnBhldaLqQIi+C1/GK9v4nFX/lP87XQLHg
	IB6pvC7n9I8K9cqilZuL0L2alNEeNTh3AxeC9/WOl/WfRoDwODu/BjnLM/Yy68TpWhiEYmQtxMn
	+66uyHOE=
X-Gm-Gg: ASbGncskX7e6tD99+RBidCLMNDqVKsmRvbL+8EhRS5XwXJ7o0X92qpduUKUItq0c/SC
	eGghM4bHoXe9tA91X0Ga+F/CPiNog0Z8l77V5JlHLmjj9ipF8LJh+pvs1HQX97dwVguYBqxmCGy
	VDPORIaWFG4EZquZTlwacI0katNOF00y5h3sICiWLSeC2uaheByV7WnKg7Y3VaAINm7mN6oYaGb
	1qjbmwD1hs+u4Pv5LNA5eoHdT3mOcu0yeRQaLR7WEK55H2exegB2H3vKf9g53bwyURrCaWo7ky5
	oT8VSEurKbE8h2176zjHrOXNq6qzt2prdcnvO7IC6UOYli88TzXfywkqjEtVsdcbCGV4fFsDLUm
	6v7AoDf+xp6hEJ++zvqTG3K/Cjg21yvYKuAoM9d+oVTbbQz5WmhP8CjcnpungoxjvyzbwA8G7lR
	AlYoIAd1W8F6O2JvDQCy6sJzn4UTx6aw3uKUJtIzItTXw=
X-Google-Smtp-Source: AGHT+IElepsQIkPTyqRqx2ZlqiV2TkOUrhFpvX3uGDnya5yADO7YFKd2LUmYcqJ1EtE3DJar2SatmQ==
X-Received: by 2002:a05:6e02:144e:b0:42f:9353:c7bc with SMTP id e9e14a558f8ab-430c5209537mr363720175ab.6.1761333360521;
        Fri, 24 Oct 2025 12:16:00 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5abb7fdb7c7sm2427824173.44.2025.10.24.12.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 12:16:00 -0700 (PDT)
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
Subject: [PATCH v3 5/9] spi: fsl-qspi: add a clock disable quirk
Date: Fri, 24 Oct 2025 14:15:45 -0500
Message-ID: <20251024191550.194946-6-elder@riscstar.com>
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

The SpacemiT K1 SoC QSPI implementation needs to avoid shutting off the
clock when changing its rate.  Add a new quirk to indicate that disabling
and enabling the clock should be skipped when changing its rate.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - needs_clk_disable() is no longer inline

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

