Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62541283CB3
	for <spacemit@lists.linux.dev>; Wed, 11 Jun 2025 12:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646794; cv=none; b=Go42zXedhfhYg4QQo4wavIel/BR3XoC9fP0xhRTFbMNd/4Z2YaIgbDBadfPR/gejiL617nuyYIu3se9vbcazc13rDT+hVN2c07rLPAY8bt8K138UIV/dixwSbaxaBuXPFF1ocwFyiC7NY3bfsy+knXjb6vkv5gQ3K5WSnFg6rYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646794; c=relaxed/simple;
	bh=w3tQqbAHCuIlmTn7bB97ckFjqMR0odxo/xEDlJG2tEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nABX4v1sNvx9MOZZ0rSHeeBaknGhG27Sr79xcsFbuEMvRBntVdMZVsWQpUlZatJ7U/72nvIl0DNyWQpQ1xjYHAl5rftBmgdkFx6AZL7vTM8y4J6tgQwYMerKPyp7ayX59dkMkVSKxUDihyycslpAFyFv3mEJeiGOLApbYXYG1rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=weAMtlY8; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="weAMtlY8"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-23636167b30so20743885ad.1
        for <spacemit@lists.linux.dev>; Wed, 11 Jun 2025 05:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749646791; x=1750251591; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7o24DxeXgIvRNvf36TN4y++evYbOInZZuq385XvrXzk=;
        b=weAMtlY8sY43Mi87rns938Ryn4Z8JI/sYr0RBieg+iURj3gNsXm06WMviFgjyEQbB1
         J6IhaD5U/TCUYtKYNYOP9N1vqruo6N+R0jphXMIAhmKAkHOgChDUtFR6fvG4Zfex3EHt
         2jsM9n71K/pFkPkbla9nXjJ2UZFiv4EqmuwxdtiS/K8BBlIWq1vamP0Mh256E4AwNHza
         oNoAKWTAls1/MTZJOwbfJK3E3oMZFkT80UGs8GBW5O37zdd6NSNoL87u0MmBqRJr7ip0
         Y3JjN70VN+POyAJhXcgHWGkX4OLyL5gxVRuwbaLmRGrFt6NOS4ZN/MorbRp9IL4elJCp
         FGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646791; x=1750251591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7o24DxeXgIvRNvf36TN4y++evYbOInZZuq385XvrXzk=;
        b=icyjgVXIuczkPdWgoIJXGzjooRwYiSCV+I765OWakbc0YNJLUqvlqj8EmONoNG2NZG
         5OE1fiGq7/2sjReWyKjbEI9dixp5mYI6ka6zQz0z66jX0h1Ks82hQTPDn8ejOux54Vxv
         rRPhmGGYVPUUjEfcTJFPy8ZhDH4FTyv/w/DBcYZskHIC0Imup1Yg0ta+aJ7ZI/Ho6lZU
         J4opdIobemEQLw4qXtzc+RGbjTr+y5lVIN4WNYYoc/grTI98HtU9HeTr8GXiPosNtIu3
         b1MiMh1fDo+3UlDdYgOKBjlV0G+6e3ew43nJF9qYqKgxGaTJVC2ixqKOaHsQOGKIdFzw
         qvAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYytCAPX1w5Uiz/QjCVrgH2afJtVQWq+XKsSxqy3EtXa3ZhXCHKVimpszpHbodFASu76Hugc957w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1r4UYrjoYLTrrwfHPFrUJtjnfDOy/gAZi8MjV7DUc5RXKHDaE
	aSkE8ngRuYWAq4zd0TyD5NAlc+DNNN8kM3RImwaFQz9O9ZB9PL+NQOT8tIYyipZ0wVo=
X-Gm-Gg: ASbGnct59W00t1VlCjwK6cRnLE8BbaAK9PGNRnQTNK7TN1IiNArjrI/hGWnqAd3R8Nz
	ymkHs7UCLG0QnxgvcHka2eHC2K2m9f6NnhmDt/QeAdMyRxT6YfzqyjHkDQmSZ6NDQaNdSwFlig2
	JLyNy13MQ+8o1cIVQG7fa8OM1hHMEk1QNIwDu5qeUow86SktJZ7OeZnacnByHez6cJAat3uroD1
	ZLyMl8owVKw03dpGmqu7lVj5wFqBJWzo93Z/PlAA1L5/IOEcT01pWpBgaLSB0YGlGWmh9HgnhHr
	9D81u4Y8JNZxol3f8CQ2kEBWHWSfJZvL+TxILXn814Yz9fSnh/yCUkGV/nxT8ZKxF8MxxOCq4/8
	5Bhs8WTCIF57YVFWkOKh6FQxp3TvW9OM8
X-Google-Smtp-Source: AGHT+IH7USNXfR5sNsfQYnJhCwki/U4RwupJq6yD1CeMplQGSscMAoiL9MAMbLTMCcEmy+9woSzN4g==
X-Received: by 2002:a17:902:f70f:b0:234:a139:1203 with SMTP id d9443c01a7336-23642683ebfmr42207415ad.32.1749646791610;
        Wed, 11 Jun 2025 05:59:51 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a00:31a4:6520:3d67:ceb1:7c60:9098])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030925e3sm86984115ad.53.2025.06.11.05.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:59:51 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	emil.renner.berthing@canonical.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	joel@jms.id.au,
	duje.mihanovic@skole.hr
Cc: guodong@riscstar.com,
	elder@riscstar.com,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 3/8] dma: mmp_pdma: Add optional reset controller support
Date: Wed, 11 Jun 2025 20:57:18 +0800
Message-ID: <20250611125723.181711-4-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611125723.181711-1-guodong@riscstar.com>
References: <20250611125723.181711-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for hardware reset control in the MMP PDMA driver using the
devm_reset_control_get_optional_exclusive_deasserted() API.

The reset controller is retrieved without a specific reset name,
allowing platforms to define a single default reset line for the
PDMA controller.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 drivers/dma/mmp_pdma.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index 4a6dbf558237..fe627efeaff0 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -16,6 +16,7 @@
 #include <linux/platform_data/mmp_dma.h>
 #include <linux/dmapool.h>
 #include <linux/clk.h>
+#include <linux/reset.h>
 #include <linux/of_dma.h>
 #include <linux/of.h>
 
@@ -1021,6 +1022,7 @@ static int mmp_pdma_probe(struct platform_device *op)
 	struct mmp_pdma_device *pdev;
 	struct mmp_dma_platdata *pdata = dev_get_platdata(&op->dev);
 	struct clk *clk;
+	struct reset_control *rst;
 	int i, ret, irq = 0;
 	int dma_channels = 0, irq_num = 0;
 	const enum dma_slave_buswidth widths =
@@ -1043,6 +1045,11 @@ static int mmp_pdma_probe(struct platform_device *op)
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
+	rst = devm_reset_control_get_optional_exclusive_deasserted(pdev->dev,
+								   NULL);
+	if (IS_ERR(rst))
+		return PTR_ERR(rst);
+
 	if (pdev->dev->of_node) {
 		/* Parse new and deprecated dma-channels properties */
 		if (of_property_read_u32(pdev->dev->of_node, "dma-channels",
-- 
2.43.0

