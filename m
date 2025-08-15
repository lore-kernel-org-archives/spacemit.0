Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8732472AB
	for <spacemit@lists.linux.dev>; Fri, 15 Aug 2025 05:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755235070; cv=none; b=Ik4gRgmLkI1PbI4mZleaLLtbWT/oksA4+U9bGtI1Fy0wpVyys8pl7wfjlJw0RWou8rJJMbHhVCJtc8gMOHKWilmqxKE+GZkIoHRRWWUcvOwIP8h2BDNAqaUx8kNGcvK1FhWpVeAW5q8ZocafHsWTTUp8FVMvIL3kt6PXAWylAq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755235070; c=relaxed/simple;
	bh=b06tSPkNPOsymxZcIQh4cvJ5PfLzXSKhYEO4BFFGJ1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P2ksmr0hQY2NLE1d3hd9kNX8y/fuMezP6c/RMK5gumjcMlZsq2RAfrnwf5Rxk80nWGcPIPJSQEwK8wdsNzgwj/gA72tWsbv8eODhdCssdaRDFH/FiM3G1EAo9WOjyiRMUHJLbtiGkqvBG8m6wdChy7O1plk3cOP1ayqX+H57RPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ZVjYi2Y6; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ZVjYi2Y6"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-32326e66dbaso1318747a91.3
        for <spacemit@lists.linux.dev>; Thu, 14 Aug 2025 22:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755235068; x=1755839868; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UzJqrcT6Sr4Domw6gSg6TRk14H0do5SxSGJ7BY074bk=;
        b=ZVjYi2Y6femTfK6PXxWFuRfJ1imVdvqEWZ3UX0WH569FHojyCRVAZo6EPoVqXwtDJ7
         Zj3Wn4+Mc8q8gemKxeiO3KLUfAunDc+V3G2ony6MRwJ1VWUjJH1BF5L+mRQlpt1jt7B0
         8fKHH+CKWltCZmuD19p9HA525WrztfYoHgX5n7M2DMlelemIRJUY76ur38/8oLzWcuih
         LezcMq/xEmVWDX3Z1HTc042G4L02Mt7XaoNslYocx26dQbdTojObiEEC7y/SOwV5KQ/s
         zlFZ/6ousPKI6w7pcQvIH+NIBpyicEKNsiAWOPCrBa9SdqdD7lhynSU2GE2WLW+7O2Pw
         hGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755235068; x=1755839868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzJqrcT6Sr4Domw6gSg6TRk14H0do5SxSGJ7BY074bk=;
        b=siPqNg4oieTjmE/efuuQYFOkfe2gx4C+f8Ec0SYmSadBzJq4g4bbwWklpv6ek0fDUI
         ubQDprdF0YdY5e6lIXogCftpXW7hf482J0ZqEAgSUs17xW2L7E9IDwwDfrtrQN29he7X
         QfSgY574KHYaxWWsbAIjPd9ObpE8z78lmTkIZq30koTxcOEBY0PCRykCo90tcGroKcTh
         mdHmmAbd6+IQ0A9QPGJbgsz9JYP4bRW6VGh608rQgdjfam8m7QcZfqE/6Go/BtUFvQxA
         Gqb7y5jFvDuHJDv4rgPGGeueGKCSfEl9OcDTNGvBBRtNWxpDsqQiwRADFp2Bihz72R29
         MBUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdZbcQNECoel6KmLD2EU2Z+AgHawZY8nswHAv+DPU1/0jXC2H5gbHuEEhN92WzGqsHYpBC3VGAoA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwRxHJoN+XT117AzESGlhgAnrN3b1gF3KQ0lhFhYY+wGJ5WDrGX
	m3vDxVecB69wc9pDOV8FoNmE8CpH6UZW5zAPelREOQHQvfQoJFseO7I5FkosR0fq+Yw=
X-Gm-Gg: ASbGnctDRo5Y/etcW8UwXfJwoizK/ycNmAnc/jHdFDDrsm2n9nEGEt6dOvisBiCVCOW
	gUYiVoHgE9jCe49ZLFHa4ckBYWGUhs6n1bPC4EZVu7jR272hrrVZKJN98Xl5dxAV7a41jpjKnja
	9fQat1GZoQfQ5Rr8gyoQTQcidWDObab8fDoB/iqD+L8P2uoAiDTRgY0nKl4wJP8JxpEV8SzZfPO
	SMmdsUXbmfLPW981z18C3PHb9+w8EKbKz0F08AgDk59SyBMse6O8HArvp+bk2XQNp+ADIIJu79H
	rHDW9hjKVQBJ3Pt436vlwmBbdmj0MhA6RXzmwGsC5uB6raCwc6riSyIRYr0bOs8Th1MUkEzEVNL
	pH6XfXeTIc1xAnncRTSUmTQ==
X-Google-Smtp-Source: AGHT+IGEpJzSAAi5oYh5J4I/dYuHH3xIHOFcQzFYpHxGCez4ecdeF62QFwuHOYZn933LvQXIM7H3KA==
X-Received: by 2002:a17:90b:224f:b0:321:9366:5865 with SMTP id 98e67ed59e1d1-323421217cbmr1522970a91.33.1755235068158;
        Thu, 14 Aug 2025 22:17:48 -0700 (PDT)
Received: from [127.0.1.1] ([103.88.46.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-323439978a4sm373212a91.10.2025.08.14.22.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 22:17:47 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 15 Aug 2025 13:16:24 +0800
Subject: [PATCH v4 2/8] dmaengine: mmp_pdma: Add clock support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-working_dma_0701_v2-v4-2-62145ab6ea30@riscstar.com>
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

Add support for retrieving and enabling an optional clock during
mmp_pdma_probe(). It is optional because in Marvell devices
such as "marvell,pdma-1.0" the clocks property is not a required
property. But in SpacemiT K1 PDMA, "spacemit,k1-pdma" as the dt
binding schema file stated, clocks is required.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
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

