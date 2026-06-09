Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DA836D51D
	for <spacemit@lists.linux.dev>; Tue,  9 Jun 2026 19:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781034454; cv=none; b=XmP8ITYzNq0hos7EDVIeb2YOpbQXvTTO9GViod1kp70Row0eFZAhFwIVUunEg6R1rlIjuLeuNVVmtwc4JLN22ccbYhLpau1rnDrhi24L8XH0N4KjofMXbplulb21rbLEXL/PtmBgL4giKGhOlxg8m+UNtT23nSOeHCTwXKnZXJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781034454; c=relaxed/simple;
	bh=EzzIUT5MAy1lGbLLNCNBDiXKEEHYTWLc2oHrRYIeMQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zc56HUu6UzVh3uRWTMFRF4Rwto8sXqSjRb/qzpChPG3dSEVPPigtXB9CFyVqCgB+BzTjccV46mh5F7gnnj/WWUc9oT7y0855TmJ4PoV7iDRlq0EV94a68UNcoTAUKTYxEUkRrgdYbcNpVsdsoCtEz8tq+fkVlsI4hS9NByh1/R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SAGgIwFC; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SAGgIwFC"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c85a297d2d2so3522146a12.0
        for <spacemit@lists.linux.dev>; Tue, 09 Jun 2026 12:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781034448; x=1781639248; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ai+yr6kaqjO1MjNvHgFNGMTR2U+5LiRo2MrcPACWJdo=;
        b=SAGgIwFCNNvqbVUwhybXrCTKoNnN33rydsVWRQ+cLNk1fr0YMG5JhPmADz76uWI+f5
         2KU5buTtwymcYTFXWka18OFf6MGpEM3WTlySFKjQ/NlBTrZ2XmMVPFNPlpWnfG4iQtZ1
         QItRaL7o99rkjyVziSRZLdTft+yjFiFSz44FxlEleNh8krR/fEISD9YzW4/wgG6c21gE
         Fm96m6DtIbx1p/DMPiYfRwCidXTuDGFZEcAJKRmsTzmnYfsK9Jauwf03zyqRCE02wKRt
         pHHxBjla1sJy3c4cIgYOfFmbwNnsukDAUJEwNKoyfux4ycXqHDhinCelqqQaZNA5vqyT
         WEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781034448; x=1781639248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ai+yr6kaqjO1MjNvHgFNGMTR2U+5LiRo2MrcPACWJdo=;
        b=lBrfDYDC6qd2sUhPIF7T+xAH73uzJD3AHDwDe+wcu9NQdcBNgE9oYLpCYNC1iEQ162
         dZHPiw1eusihzCftLxq6r80dvwgbLd+vonDtHC2Nm3XZ998PHx0/FPbKqs0c9d00/kD4
         J56pgkaXRcn9EdQKYA4k+lwt6Jh9GDKG0A2vuPSWpWWSfxQm1bD2eVE6N8jh/0rr5d7I
         Vr6O3wWVLaFASCQeVAwT37ss5X2OI0KzolIbVBuRL1Ann9UZ+D7tyrVSFjzqon6DV9RF
         S5sbfBNX329FosYeiT17SAQLrFAPtUxMRnGl346RSDnOLqcoEXQHHugD28mILMOj/jd4
         5ONw==
X-Forwarded-Encrypted: i=1; AFNElJ8teTJxBoinS0FyFVV1mLNcF9J9GheRxM30Qfa+w+LZzcRJx/t3+EdGQwV2bVeIkCR+SMwI6erw1Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxkJ1HOe7OlM1cTPe7h2+v/6XUomDQmMbIBy5kF3wMPa3NS3t6B
	AQNVrnmwQKCmqZay5sU8vSYdzRj84Z47+Mso3JYR8eAjkBBecBp7u3p8
X-Gm-Gg: Acq92OFEk+JIkQDyuU8AWJQenU6meIHspladMH/GGIJDnyisUvaQ0psZQOP5xmVlKMZ
	JiWoaaVaofUabe1LCXjUW+72qxiHii2eOFksKdH0p7sbaUVfGYizfUgd5cRT+tKibAyAVWlyNi9
	e93yxaHfdf5JjVoZRCUTkDXlJq2mNr7bYfBntlCNWTgg6dxSfjAJUfP17kkhmfWHh7hOmeYiE+U
	EF4/6NBL5nH7XP0lc30Juo7nPEP8CvqxcNaZELBoTg3DBMsri8SEMgvx0keUtLHtmcYvbwEbbC9
	5P+EYatTHYAOT6VlAfIaUOtW192lAA24zLPM6yGysnNnmDye53KwbmA4e39fzH5oSA+JcFdVOgF
	OGOnjPk9hcVDDmsVxxX3TdgbDgMMVLj30Dtii41+WES0EI6EU+3tUVm63JdATBoB7lt9+g1uC9X
	Egh3jLRkLD
X-Received: by 2002:a05:6a21:1b81:b0:3b4:84de:aa79 with SMTP id adf61e73a8af0-3b4cd09b4f5mr26397065637.44.1781034447703;
        Tue, 09 Jun 2026 12:47:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::3060])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04ff24sm19517121a12.14.2026.06.09.12.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 12:47:27 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Tue, 09 Jun 2026 15:46:38 -0400
Subject: [PATCH v2 1/2] dt-bindings: dmaengine: Add SpacemiT K1 PDMA
 request numbers
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-b4-k1-pdma-req-macros-v2-1-5d5d7b997b54@gmail.com>
References: <20260609-b4-k1-pdma-req-macros-v2-0-5d5d7b997b54@gmail.com>
In-Reply-To: <20260609-b4-k1-pdma-req-macros-v2-0-5d5d7b997b54@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2445; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=EzzIUT5MAy1lGbLLNCNBDiXKEEHYTWLc2oHrRYIeMQA=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiyN3KO6peH6ogFrT3w3CXzGLPg+vUyi5MExqZDtnurBm
 vzsfG87SlkYxLgYZMUUWQ4fbcne+son2vc55w+YOaxMIEMYuDgFYCK/VBkZvhxyetYgV7N7tez3
 I6qzLtu/sNNOjX8qquLUcUbj4P3D3owMi9eUpqentj1kePg61cHpZbJ18vWTvPtSTles5jmtHu3
 NBgA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

Add a dt-bindings header that gives symbolic names to the SpacemiT K1
PDMA request lines of the non-secure peripherals. Device trees can use
these K1_PDMA_* macros instead of magic numbers.

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
V2: Drop the #dma-cells description change in spacemit,k1-pdma.yaml; the
    request numbers are hardware-fixed and unused by the driver.
---
 include/dt-bindings/dma/spacemit,k1-pdma.h | 56 ++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/include/dt-bindings/dma/spacemit,k1-pdma.h b/include/dt-bindings/dma/spacemit,k1-pdma.h
new file mode 100644
index 0000000000000..491976516550a
--- /dev/null
+++ b/include/dt-bindings/dma/spacemit,k1-pdma.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * This header provides DMA request number for non-secure peripherals of
+ * SpacemiT K1 PDMA.
+ *
+ * Copyright (c) 2026 Guodong Xu <docular.xu@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_DMA_SPACEMIT_K1_PDMA_H_
+#define _DT_BINDINGS_DMA_SPACEMIT_K1_PDMA_H_
+
+#define K1_PDMA_UART0_TX	3
+#define K1_PDMA_UART0_RX	4
+#define K1_PDMA_UART2_TX	5
+#define K1_PDMA_UART2_RX	6
+#define K1_PDMA_UART3_TX	7
+#define K1_PDMA_UART3_RX	8
+#define K1_PDMA_UART4_TX	9
+#define K1_PDMA_UART4_RX	10
+#define K1_PDMA_I2C0_TX		11
+#define K1_PDMA_I2C0_RX		12
+#define K1_PDMA_I2C1_TX		13
+#define K1_PDMA_I2C1_RX		14
+#define K1_PDMA_I2C2_TX		15
+#define K1_PDMA_I2C2_RX		16
+#define K1_PDMA_I2C4_TX		17
+#define K1_PDMA_I2C4_RX		18
+#define K1_PDMA_SPI3_TX		19
+#define K1_PDMA_SPI3_RX		20
+#define K1_PDMA_I2S0_TX		21
+#define K1_PDMA_I2S0_RX		22
+#define K1_PDMA_I2S1_TX		23
+#define K1_PDMA_I2S1_RX		24
+#define K1_PDMA_UART5_TX	25
+#define K1_PDMA_UART5_RX	26
+#define K1_PDMA_UART6_TX	27
+#define K1_PDMA_UART6_RX	28
+#define K1_PDMA_UART7_TX	29
+#define K1_PDMA_UART7_RX	30
+#define K1_PDMA_UART8_TX	31
+#define K1_PDMA_UART8_RX	32
+#define K1_PDMA_UART9_TX	33
+#define K1_PDMA_UART9_RX	34
+#define K1_PDMA_I2C5_TX		35
+#define K1_PDMA_I2C5_RX		36
+#define K1_PDMA_I2C6_TX		37
+#define K1_PDMA_I2C6_RX		38
+#define K1_PDMA_I2C7_TX		39
+#define K1_PDMA_I2C7_RX		40
+#define K1_PDMA_I2C8_TX		41
+#define K1_PDMA_I2C8_RX		42
+#define K1_PDMA_CAN0_RX		43
+#define K1_PDMA_QSPI_RX		44
+#define K1_PDMA_QSPI_TX		45
+
+#endif /* _DT_BINDINGS_DMA_SPACEMIT_K1_PDMA_H_ */

-- 
2.43.0

