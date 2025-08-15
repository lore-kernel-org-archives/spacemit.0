Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E65202C3A
	for <spacemit@lists.linux.dev>; Fri, 15 Aug 2025 05:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755235077; cv=none; b=CxWipG0DYlaYoCf9+Pd86z7M0vKeKqaoRBbA2IrFmlUs5txCPQ3ws8VMmkdDLK7NyNOIDnK1knvShU+e8l+OJD4SDB7fvMpG/3iMEL6oijSRrYHsUtSwXT7/rKXlv4FIIwRWkvehVcZbNVQdYocHbP4M667UyVBjxlQn93UvtOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755235077; c=relaxed/simple;
	bh=hpNlMeUziKF1YQw/oeCyeHBB4A2F1o7M2fzwISWlPn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bv33U79OBS5AgFnWru0Qer/beVStfKTc+Um1KOfAFmYzNv4ZgTxa8Y3ZaFmJWjp7KRvnQANWi5HbH4RJyRVn6l4Omo8piGuGfU6/F6VWNC/DlWDmIIDaboxqRr9RLq/Y+6bQkrkvqGeYq5fCzFuRWpnehc8ROsI/LOJOozbzFCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=yIX+ir78; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="yIX+ir78"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-323266d74b0so1472516a91.0
        for <spacemit@lists.linux.dev>; Thu, 14 Aug 2025 22:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755235074; x=1755839874; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sAR7LvrtEvYXVvXsm/WrP4bERAT0LEz+OoLyN7irYo0=;
        b=yIX+ir78U8GKkJXztzRlZbRNXl+ljlG0Bgj3fPMAyO8fBvO0xpTWfJE5Hi6kOSHPmp
         nLpUNY1dZk34cl80qSEjWpmadUubwwZYYNJQD8h48iGAPZl5uOFlCfR/DB677PX/yhnQ
         6futf885AsglO1qRvBLkQHn8Ni5IbzBFBKzIU5j5CT/gb8CJb11TYHm6cbrnelVZ+M08
         4EIgNAT5uqQaf82J0GNWXp2PoDwtgP6Qx2x8ADvt6HA4XDmmdR+CPQbCD1syCR03bAcm
         vyRWLIwEmOJlYCybvnZfIiES8swI6dpr5ov9pP3U4E3gLTDTGkiLq71iuy4V5F4GADVS
         bojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755235074; x=1755839874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sAR7LvrtEvYXVvXsm/WrP4bERAT0LEz+OoLyN7irYo0=;
        b=MgoTNvPRGWts/9xpkBFkVeuxIXVhARzdEqIUGi4WG6ISgNWwoZNYhBNKc8Bm1+ckcr
         t1mxVBZvY3VevnE0wKUeQnBILXH/0XyKtko+zwrF8S5lrqTM+HkCCOPIJX6yf2J7oFAb
         VFeXT8uqeXu3umNEsz5y7lQJPSdlVKCOlvALJnqCCCksbtKnaOWdP2N4AACHeQei+/eM
         0QA1wr6jX4HZ90hwOxDrxEDPBf9sKGArBV0mxg3FOFDh27ZGEeri+72kzreNJaKswyRa
         LtftwJxHxsN3MfuDzVKZOWXJH1wslnlXfR6nrXAmkAjiiIjpuHBuFZH48QYPMmgxgYQU
         Ovow==
X-Forwarded-Encrypted: i=1; AJvYcCWijCOfSJxS++GNOPLzPCtOcn006Gb9m0kkiquQXlVdzjSIwh2a37RmwtRAPKeNzf+2JV+a/DHY/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YykWYwkXy1PX7A4YgxKI2dtvIHZ31Bo8eF7/Vhu1teCpbB7zlzV
	bQOdeqvXPOoKvB1AoU6bepKgb4FvZTZgCKcG3BXnWGfNxb2J4E+GqitYByqxkg9QLqY=
X-Gm-Gg: ASbGncsFcpFVB9+ddeRSx3QGbn7RZP7Uk3/WAGmtMqQrQqmMmE5lDpdlPJ0NE2QuF2R
	M4TROfztZ9ZKYswCanQalrZ0Q4FpLH/sFKk5TgHSOok8ei3vCtTdBivhiL00zOJY7/y0mowzLF/
	INIGE4uNdBTN05tYNakk0nQukt96ICMU5trsHITv75IqG/7vgVu30MQQGurgB9TClInktsf6E3x
	rqCvjfUuKT5tIdsWITQ20cd/UY3XR7Drzu351VpBKWBzaq0iQvh6ExDgf3b1wH4P5zb85GjEe+S
	c6S+5Xk8oH8rv4FVyHXywT85A828BWPBHBJUd403+sYjsH3jPslnrLKJd4FM7G2qdKup0a+zG9F
	fGsIzl5vZLmONOK9JK9wubg==
X-Google-Smtp-Source: AGHT+IGPjF60DU2opRQQ2ZRiuLuntu3rKr9lba7AQVneRYMhgy2+Kz3SAcjcb/1v+om4sP4fBS+qiw==
X-Received: by 2002:a17:90b:1b41:b0:321:1df6:97d3 with SMTP id 98e67ed59e1d1-32341ea79f5mr1298891a91.4.1755235074382;
        Thu, 14 Aug 2025 22:17:54 -0700 (PDT)
Received: from [127.0.1.1] ([103.88.46.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-323439978a4sm373212a91.10.2025.08.14.22.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 22:17:54 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 15 Aug 2025 13:16:25 +0800
Subject: [PATCH v4 3/8] dmaengine: mmp_pdma: Add reset controller support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-working_dma_0701_v2-v4-3-62145ab6ea30@riscstar.com>
References: <20250815-working_dma_0701_v2-v4-0-62145ab6ea30@riscstar.com>
In-Reply-To: <20250815-working_dma_0701_v2-v4-0-62145ab6ea30@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, duje@dujemihanovic.xyz
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2

Add support to acquire and deassert an optional hardware reset controller
during mmp_pdma_probe(). It is optional because in Marvell devices
such as "marvell,pdma-1.0" the resets property is not a required
property. But in SpacemiT K1 PDMA, "spacemit,k1-pdma" as the dt
binding schema file stated, resets is required.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v4: Updated the commit message, no source code change.
v3: No change.
v2: No change.
---
 drivers/dma/mmp_pdma.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index 4a6dbf55823722d26cc69379d22aaa88fbe19313..fe627efeaff07436647f86ab5ec5333144a3c92d 100644
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

