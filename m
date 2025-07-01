Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C10124503E
	for <spacemit@lists.linux.dev>; Tue,  1 Jul 2025 05:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751348271; cv=none; b=Mt3lnOjfD0Rzt0jc2+GWZQcgYq0cdWX18r/OJS4HkTiy6QyrZ/gE/I3b+e5/HVdfwxgDwunkWop9qyzmjOUOU1WoUpqxuss40rVrJPVvJdqDsHBOmAZkmsLKxxUuqCdUYiPWY1tGYKR4MuD3SUBTsq6+2v1e9VqP3Cn0sQrupJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751348271; c=relaxed/simple;
	bh=cvJMbBhCxqZy7PEHIdbrxOx/t31kggur4xA0D6K3PIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pDA7RiAOHy/HFPcQ2TD10YH5MdowN0UeMo2PYBi6tud6rV0mSjPlX4nEQgjFSOZMgUJow1tgNjyKH2fDn6A/s1hpDjGWBtBh+CBeTYlowxdwZ1EVerhNKRn09esduPTqo4msE0WssanTtUOvsmwnyouQ/1sllqOoS6VzdUt62a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=qRNswHA8; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="qRNswHA8"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2352400344aso48825135ad.2
        for <spacemit@lists.linux.dev>; Mon, 30 Jun 2025 22:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751348269; x=1751953069; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SIPMZwIjwsVXUr19w5dAJ2kyFpb+jn5E1yMbGJ484tE=;
        b=qRNswHA81Sm1P5AQS2zt3Eg9FsMSeO5i51BwLSB84oGG7W9TPhymqn0B5j85dfFI6i
         vUo3fYc9oiyPodA5BvstFjr+deR2RM4mMaKFNgQT+xIcQVGWh6YvHx8NcmWrlkwj6+B+
         OyQcM+pU0kMoOUrRlx6ZwFwGnUckT3XMhcxopWpZcuqS4OECSe2dHpoV7eYadOp+ORlh
         4kvjHJXkNDRhafML0P2i5nYwFRsbpKucDnnCIVetPWCCIl8iAPVmfI7zhXTI1PYa5YtK
         KjjTqvFygr63upYejp0vuNz8tPSZzZnGVTMHbd+r3DjceKOLiNgLyUgtwGsNeQUH3sjB
         W0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751348269; x=1751953069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SIPMZwIjwsVXUr19w5dAJ2kyFpb+jn5E1yMbGJ484tE=;
        b=eLCfziMMGsYnzr07/NOjg8FLUeLJ/4D9dEUaQM0yNfhRaXeMtRETUvn0EoPXTpWayo
         kaflbO2NemcIl498D4QS9VcLfbVojcO1xedOAba6desU9bL4zX3UTk2AXYJ14TN8VXtk
         3fQnfGusZmgU11lfzfN0FmISxkQsJ/zk1PJH0Fpegeb1Mtw4BBBpqZ7BWDFW4PI9RZaU
         iwzfedqElaXvUWf+NtJLH0iMiZ4SvZo6X/db8hmtwCzPglWJYjTGDzgvpiZpt3/yQqVA
         J3bkGGxcfWd2GOzWAJ9VplzJNf8m9TmFY0WLaBFBuEvMVrs/F1oNieC2M+2P9TcASES+
         W2yw==
X-Forwarded-Encrypted: i=1; AJvYcCXFQiFqbEJc0fRNz41iRRcqTNLUKyItqkgCbONzy0X4vsFICYC1U0Pgz4wXquAhTPYma9k3A9B9XA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzCy2FjJ1PvUiRxKN5uede0P1wDMqt5qWi+iitzEMqyHIYAAM8h
	UP2xxtu3S5S2BdhzzAV6PaqWOI0qFo3PU/2mtFCVi4mVibGF5bkIKZfFsS05Gqcci+E=
X-Gm-Gg: ASbGncu9c0WQEiClu3jKSC80XUOLxSJjo2HoXd/as+HClCr+SKb4vjZrNGaenCW7c4l
	v/VaOTx++qrGBBNVzAKSky6SbqPqTEOUYT6ERRKIJhmEAFlug5x8ZmcuIgfjMsQEOehS25rxjgV
	kovfJ3CA6mDyUWaaEh3i6pTYiOA8qOvUpQbdWrKCERfvdCsuSzywmfUAx7EUQ8QQMXxHjrj+c7L
	d4Hvu598cZ4dVwh3NT5yrfrpz14/2rIhSGeX/n3qQuFCRPlL7YzRaFg6Qkxkode7+jgv5V6E5NN
	d2Fjn1QUmumvb/PITc6M+YWGWLq1FTOxz6UIqZg=
X-Google-Smtp-Source: AGHT+IE16tX1sCq4DSpvKgkQxnN+PHXsI78p3M94DOvhTbzRw8dgntEK2GQnFLXWQ+awumOj/AFs5g==
X-Received: by 2002:a17:903:244c:b0:224:910:23f6 with SMTP id d9443c01a7336-23ac463e8d8mr248581755ad.45.1751348269319;
        Mon, 30 Jun 2025 22:37:49 -0700 (PDT)
Received: from [127.0.1.1] ([2403:2c80:6::3092])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bf5fsm101729865ad.115.2025.06.30.22.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 22:37:49 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 01 Jul 2025 13:36:56 +0800
Subject: [PATCH v2 2/8] dmaengine: mmp_pdma: Add optional clock support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-working_dma_0701_v2-v2-2-ab6ee9171d26@riscstar.com>
References: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
In-Reply-To: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
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

