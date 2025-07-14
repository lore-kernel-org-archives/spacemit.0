Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5999244669
	for <spacemit@lists.linux.dev>; Mon, 14 Jul 2025 09:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752486033; cv=none; b=AOP7USx3VoEV8wyqehtg9SymvFgBg1neuAspFAAtDgIaB40FOcvqsTC8wb/kG9NbAx2YeprtTiBFZf9o6EE0dN+4uYL4LIo4f0xNQbrQ7gmwqefaQfnGBn9/CsSuykb7VBdsmp95Q1TRRkeD+RdAmDjPFh4dUXLCuMlUSqy8bx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752486033; c=relaxed/simple;
	bh=Rnvq7ILXDlYn7NCyNrMKelcmx8kPHn08CJvMC7C4paI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Girg8KdNx5NxsrCghqoXGsy6wA5kCfQgQ+DFLtUCqpzRLFk6d9lDnByuzp0BnEjMyAzCryl4KDzEKXDud9OTXd/z4ulOMrKnczAPSthC8LY0Y6e6b9loLcE/Won0hSbPjcZOHF51IbPypKH4/r6CzLRfMU8f5c4oWwWiHn9Kpgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=XafZ8lPe; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="XafZ8lPe"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4560d176f97so15492825e9.0
        for <spacemit@lists.linux.dev>; Mon, 14 Jul 2025 02:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752486030; x=1753090830; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OERStMpxFd1oXz1mhimWCIXZsdyaGxN/N1YtYf02ffU=;
        b=XafZ8lPeF2a1y+P9z1H6st5PmDV8fNoaAXFxnqgkamB4+3pkZDxMoz2I4Jy4ZlvnV5
         y6nH1tzGRAhRcDnRhvIN6RKgqSql9T3gHBG94cL+dQyUSf1F44Pd8fqg/vDrKqMqZAdA
         FBR0WFMh8jER6abvU/bLObKeYcJ4iWM3okie8x/vdThmWGPGVVjyOCgabMmtfYejQYvX
         dKKh3Q+Ff7rYWQSFx4Rum4up4/8F55v2v0AIDB30QIuzWHKPupsmxlXdlxfSapGnVy8C
         NHEsWHQoHJcDn3bUNhaXsJY19F6wU8ip+XvhIkUKF1ZOgZy3ww3S3mflo/D0oZ+osBOv
         RLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752486030; x=1753090830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OERStMpxFd1oXz1mhimWCIXZsdyaGxN/N1YtYf02ffU=;
        b=pk6sgg2+H4NDzpokb92uFUvVh8EXJ5xtE8n1uGe9thiYIqDoKCBVwxEZgbRCNq8aIE
         2WaedBR1zaOlMPXgnGdxUfCPJ4AYoRn397iw7Vxdi+L3D7kPAI7vwYJffn+rfDfjUZrO
         E6UrBRRG35ZoD33NkoJe4FzyZIkLnZcwzPcxqw0jytIdin/UWZHezWzy5WZEO4xz+dQk
         JSN56I1BORtLILWQ8MsGfy6Ln5ZseRt46B5+0U9K1N35iel0KEySb0N6kIjte8WBmQHz
         r9QvN8xF9JVUqQa5SR7oCDOyRcwEtIXaXAfOFbFcyfP6FmhW+Vn+NXlK1fTfYvbuh64V
         FIyA==
X-Forwarded-Encrypted: i=1; AJvYcCVSwrBWonLmAcZdbQLwX1nGFz4VONX7yvDM7654GUvU4gWgGQ3Vxu7xLFjw+KLlgbgmxu69i6xjvg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHFGjIqHUiYI8A7/UH+XRkm1TDwZae6ZZK3kXAVXH9NH8vtwcy
	ABKS9WGQxtJlmmf0DWYvWGXDK4y83HLapXC5ZJW1ZL8cLbF4fP1GSYgWB4JvV/y2DVc=
X-Gm-Gg: ASbGncublKjhH11Fyy5SXXy62LlPUbV9+51f3dhMB1I3T2N6V/k0EMfMrNIXl4WxbDQ
	f15s7UP520Yq64ddT+V/kBFueq0AatB4CIwpPhIKUyLZhU8aKAYCvgoGL3KMWdeC5CKGjaVMgy8
	Sn39z62YzveWBrKCbDxXEPL0Xqw0tzXy4qYpExCf2lLD/sIrnrBiDmTMUkBLMDWsvYR1fbN2+fi
	mvNQ7ARIVRKdEGuiGi9/KyGFgb8gnvJODzQbl7rn+rf/XKFqHFF7Ejg3aSJp2lSNLdeYVPV5xkt
	1ymVe6kV8mW3DP0KkJ+0w3iWg15ct+QAsKfW55tQdv9RncgiWYWG8ACPrjFouOgir+qhugJ63w=
	=
X-Google-Smtp-Source: AGHT+IFjyUYE1dOQ8JxazLI7iDjsE8P/QTDlCi2i9qu5IYfCUbgHi3kKfOduLMWkN27Rdg061Q9fig==
X-Received: by 2002:a05:600c:a08e:b0:453:745:8534 with SMTP id 5b1f17b1804b1-454ec128c22mr110575145e9.12.1752486030219;
        Mon, 14 Jul 2025 02:40:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a09:0:1:2::3035])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4561b25a948sm24989035e9.35.2025.07.14.02.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 02:40:29 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 14 Jul 2025 17:39:30 +0800
Subject: [PATCH v3 3/8] dmaengine: mmp_pdma: Add optional reset controller
 support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-working_dma_0701_v2-v3-3-8b0f5cd71595@riscstar.com>
References: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
In-Reply-To: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

Add support to acquire and deassert an optional hardware reset controller
during mmp_pdma_probe().

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
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

