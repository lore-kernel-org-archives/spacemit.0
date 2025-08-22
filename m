Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026AB2749E9
	for <spacemit@lists.linux.dev>; Fri, 22 Aug 2025 03:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755832007; cv=none; b=ZE1HpbGgWErF1Pcwh39/9zKCR7Q+q10SZZfwBqq/0DF4R3hYkGy2c9PjjvUss2INREvzYw8TWZRslpvdYSdmjuGhr1Wk3uDOuIOOl5xhV9AvOFafdd67vuC5H7cHNhi41c/J5BErahm34g7NokSigDGj2wD/CJLmxi9v0+CVt5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755832007; c=relaxed/simple;
	bh=6B1EWWWNBC0BcU5DjOwniaBZ2haD4jvXMC5b4w6KDZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TnyyjcgZC/z6vYea49HjGZ7ClBODlEsR3eNddKTJoxPKvm10kIxbukdn35p70yIUzrNjIWradTz/96/MsNCfaK/61DKEH2+/bX2jDdOJDUsK+X1ZHtbzdYotl62qxg4EJ40k9jSY+D/XDR3FMhQ87OsVdGY/iSjUtksHnRoqhXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=SuU0FnWg; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="SuU0FnWg"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-32326e202e0so1583984a91.2
        for <spacemit@lists.linux.dev>; Thu, 21 Aug 2025 20:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755832005; x=1756436805; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNSJ2mPLuZ8B3CyF3qAdwHZOD3xnp4hT+na7SYM4Trs=;
        b=SuU0FnWgLiZK3+yiA8sR7fRJdSeJndijV1FQ9uYdsAyiubdyU2uz0WPB0xM4Vs3dtb
         KbreufikWX+qqjTulnMLCL9A64j5ooBiiD/xn/JCN8NYWkcUBke8xPiVUmmrl9Ikfqoh
         ETKGDf174i0fnAWqGRZ/tzEpuSloGqmpYMe98GeSsFc45sssmgPGbz95vPOyXrXsOQdv
         vHdoFQIvkBzAEDdRdSOrkgja44gF2cSDRJ4jaSDeHKDgiE9ryClcY93lPIW5JULG3js7
         06gDYVQLwYPjhKUoj8VMc431oodDYC1UTXtbqPld3UT6PDlymwFSWRJzMxa5Fr48MlMA
         MqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755832005; x=1756436805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNSJ2mPLuZ8B3CyF3qAdwHZOD3xnp4hT+na7SYM4Trs=;
        b=oHTi5yqQSK7GGhDntboJ9ZRcTreZezBd/tUwDBeNq697CH6eOxEvFcDdXhens24+w8
         KFwIHszbg6yfVHPyvcWketxipatbPyVU6ET0HCqXU9guMGMHqOu9282VnP1MLd41QAH1
         WZm4Qtd5VYoeaWQad5GFwvy2gAWdyGThl2TzZH3vNIr6Wi7X6ta+/9kcsQuTSIB3XNe0
         WnRD37ifuZHBOlmdS1dnptdVUTvXOVGYoKwcrmUIpr96eYjCHHDWUOfyjG77ghLF8P2w
         b3pZeuoZDIF5My5m0HrpdtjCRoL46ax37HMIEMnUxSonebNiW/52GqWXuqeKqNfJ9GCE
         NHVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbUbZm2cEKJSXI4z4gOr/J9N7iONKYbR5ZHwinXSbV6iqKwyNAfZYewJwFHBArMQVME+9jTzxqEg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4C/9lbbzKxe3AA+24kgXEYN4Oy4tra2suSlMgSd+t6skYDBMX
	/j7XJkjrLUyv42yPrWT996+3ZLiwiUj4pUeZd4JCQb8h5uaw9AxsODusaND5mogwGGE=
X-Gm-Gg: ASbGncsoQD8PSHLl8lEwbyIa5YSeSUhVJJG2XsigwO4zHKITrQQqtHDRexkYw/ZpKKQ
	PnPb8K0ddHb+SJ332WMgiJVhtqMOInrUNCN+fQLB6WV25qXFdtf2ueQCLPvIlbGOY4jnPm6I2Xl
	YLtLMZfdUjKrkFTAJzc6tJfDsW5ipy+iMSAC5QtcCn33yYZTk9P0MZRs6ztPcM5ekoAd0ByK1JB
	pmQIpeK4/foLBlzbvkhq/lHRFCk7gBHuWlx15SO8xJJrngBNbIFpv7tuqXGEFqDz/CYu5PNPeny
	K4DyjikXkSdv4NspyR6rMxa/O4J1fKRUoazRL86tE1U0w+e3XplNtnQbDuwvUAzzWnlzxFC7Mm+
	qwBm818be+xpcsVNyd+z23BpztO6rHzHslA==
X-Google-Smtp-Source: AGHT+IFm4R14mG8VZTD2qtlcugXo9bV6lRrUZXdMxf/jLK5A59pmBdn675N88wWnNFsP+MW07XoLbQ==
X-Received: by 2002:a17:90a:e703:b0:31f:6d95:8f76 with SMTP id 98e67ed59e1d1-325177456famr2245633a91.29.1755832005018;
        Thu, 21 Aug 2025 20:06:45 -0700 (PDT)
Received: from [127.0.1.1] ([222.71.237.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47769afc1bsm2756777a12.19.2025.08.21.20.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:06:44 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 22 Aug 2025 11:06:28 +0800
Subject: [PATCH v5 2/8] dmaengine: mmp_pdma: Add clock support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-working_dma_0701_v2-v5-2-f5c0eda734cc@riscstar.com>
References: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
In-Reply-To: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
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

Add support for retrieving and enabling an optional clock during
mmp_pdma_probe(). It is optional because in Marvell devices
such as "marvell,pdma-1.0" the clocks property is not a required
property. But in SpacemiT K1 PDMA, "spacemit,k1-pdma" as the dt
binding schema file stated, clocks is required.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v5: No change.
v4: Update the commit message, no source code change.
v3: No change.
v2: No change.
---
 drivers/dma/mmp_pdma.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index a95d31103d3063a1d11177a1a37b89ac2fd213e9..4a6dbf55823722d26cc69379d22aaa88fbe19313 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -15,6 +15,7 @@
 #include <linux/device.h>
 #include <linux/platform_data/mmp_dma.h>
 #include <linux/dmapool.h>
+#include <linux/clk.h>
 #include <linux/of_dma.h>
 #include <linux/of.h>
 
@@ -1019,6 +1020,7 @@ static int mmp_pdma_probe(struct platform_device *op)
 {
 	struct mmp_pdma_device *pdev;
 	struct mmp_dma_platdata *pdata = dev_get_platdata(&op->dev);
+	struct clk *clk;
 	int i, ret, irq = 0;
 	int dma_channels = 0, irq_num = 0;
 	const enum dma_slave_buswidth widths =
@@ -1037,6 +1039,10 @@ static int mmp_pdma_probe(struct platform_device *op)
 	if (IS_ERR(pdev->base))
 		return PTR_ERR(pdev->base);
 
+	clk = devm_clk_get_optional_enabled(pdev->dev, NULL);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
 	if (pdev->dev->of_node) {
 		/* Parse new and deprecated dma-channels properties */
 		if (of_property_read_u32(pdev->dev->of_node, "dma-channels",

-- 
2.43.0

