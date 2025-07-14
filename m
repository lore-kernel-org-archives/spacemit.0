Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C024C2417C6
	for <spacemit@lists.linux.dev>; Mon, 14 Jul 2025 09:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752486028; cv=none; b=RDVfI+ONmHi2pnTDLsAWnbgYn3Q4OfrIywMk3aTZh7PUFSL1ZL216FO2IddVaMmDXRIN8VxXHtL9rtnNpkA++BfeF6whDg23X/U23y7nHAFTKiuvJAsTjBWPc064MQtJ75HZ0d96lRpSa83vTJ/PC98LbNrz7Spm4mbiij6DSKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752486028; c=relaxed/simple;
	bh=fAjYUeW+4LAGffwsSutY6W1lwq2EBQZzUiZY6gVtC8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PhTXBlaUa0UXCT/iT/QpeSi5rcwOpCvmJyHs6n4oIOyM8n/d/4NIAnu2nyd4ZzayFKGoO/P3f80qhee2dK1wkEM/UNVwFtKUMsgP3PUinenbW038lsU9qr3fLMFt+OlMEzbbi+TXXrd0v+TRTUtRubITIt1ZZYAUo/iqXExjl38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=HCcvDzkZ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="HCcvDzkZ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so2460500f8f.1
        for <spacemit@lists.linux.dev>; Mon, 14 Jul 2025 02:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752486025; x=1753090825; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qq1yIQl81CDUUjvpmEnXhN2Lz/OlMt3l5QjMkKHWpvM=;
        b=HCcvDzkZq/6RDt6hj88LnzJDw6iTgLut9FDFgdw9F0IoCrOaWy8gLmPE3LcMtziV1p
         isSXzN+/LsOtijkMGw7HjnF2G8gsfUur2k1RfB+SjqCKk1rzaDGHUUdyTn2T45GYW7kb
         /8RkaBoUlWyEhbOI9I3mpFniDGEuTnuj/3Jd+SS8TxaPb3Uh7KzZSquy9le38rD5J7+Y
         kfyhTXK+LfC6yrkOTMekY7zzq3P7NIAQy/S46a6CNUwRjfqzSLi79A5d3VmYb2TdBRls
         MLHzqxeKNPATpdmnwJxEnwOHY3BO/rOwbnqpjtSuWtrItJs7eY5y4E9Xhg1kUnrczroY
         1Zew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752486025; x=1753090825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qq1yIQl81CDUUjvpmEnXhN2Lz/OlMt3l5QjMkKHWpvM=;
        b=g4WV4Tox4b2UsJ9LbKTST9RZKn2B59fQWgfVxmC7KGaxshyn+nVPVcpUbtEXb8Fcxo
         13j6hB1LnNvloejOc1yWWJ8evh6eiKoGvVY7Ps96IadHh5zrNzbrX+uaTFToxIf1z1kI
         dJeRB1z4LacPDwS6MK0KI+jaIqKIecpBv5Lu6h/dr66fmy1A16thICoZ70bRxhiaS+SD
         oN8rySaDlI1ceMSNSiVoJKPY+Aze6ZktQH7izeu9Q6siJ5VXd85kBTdCLeRga59lhxWW
         SCvSNp4suJ07c6wmP9PkUYYQ8A6+xAtjy81lB3tM/R08Q227avsC2VFSF/OjScIx5qiY
         Jblw==
X-Forwarded-Encrypted: i=1; AJvYcCW3rY2DZUoz+a2NKgJRN7hIvEQEezK+/SSJZKAmGhZWHZxy720jzGquyxJ0hXGpzovaoF6JaQnk8A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyuoObiHyw8f3sLfyBZx6PgLd9JSU86IyhXN6DR8nglSO3AdY6T
	B8X503rOQVRJQhjoZJKeoLd2vgB06wxVWqE2Jy3itdwxw5cpi6jQL6UEZomfCZpK4jI=
X-Gm-Gg: ASbGnctvVIS3KG/tI/4ME0zrMJP4CV+387ugUfihp9Ki5CzCXJ20LzBV9i5e3OUtZic
	fYatNeGoa23PaKNlSACrD4kBtU9b5xyiNp8psaGKdPR0jXatem5Nt4iyAMVR9+LrQKcvVOIT3TH
	azr/6o/oyech8PgHD5JWT5Nf9EuaKTpbZUBX6SpFm3K7+H/d72hR+PFkqdgTB6AXyadmfRYmcpx
	pOu30amOUuGTng81bVN7uesRqFdGLs3GvYUw9PIYvYlCBS/BF3j98boIisPmrY0mV3fJBhghHRm
	PJn+L/i5ZGMabd1wkbTFJCt0jv2Mg1akW5z/QsO2pAFgQ6wZc2mW2ZVTfC6w5qIUtMSZK6b88w=
	=
X-Google-Smtp-Source: AGHT+IF6lJB/75RKuYglHguDkP/WuOKNpgun14Va/8fXDBRY/jjqffgn9QMUWocm8IuxU0KZ4gL2CA==
X-Received: by 2002:adf:cd8f:0:b0:3a4:f55a:4ae2 with SMTP id ffacd0b85a97d-3b5f18d9986mr7801135f8f.50.1752486025115;
        Mon, 14 Jul 2025 02:40:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a09:0:1:2::3035])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4561b25a948sm24989035e9.35.2025.07.14.02.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 02:40:24 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 14 Jul 2025 17:39:29 +0800
Subject: [PATCH v3 2/8] dmaengine: mmp_pdma: Add optional clock support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-working_dma_0701_v2-v3-2-8b0f5cd71595@riscstar.com>
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

Add support for retrieving and enabling an optional clock during
mmp_pdma_probe().

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
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

