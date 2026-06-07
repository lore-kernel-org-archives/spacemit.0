Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6BB3009E1
	for <spacemit@lists.linux.dev>; Sun,  7 Jun 2026 17:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780854234; cv=none; b=YuUpdM96DLfSR7a9HHGaO/D8nO/zazyutj6iFToUlJbl4kTLyom95QKJt8+J5lCTxn9lfqYDDV/sQcHNPqmkF9EMR1jvmUA9wKxfidWjf7iJKHsZao0DLe5mVsD5XbrzOsXrFsn8WFlyRd5yTMbRAQd+ML2tfOsZzVR8Av8e7BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780854234; c=relaxed/simple;
	bh=8mqihYrCWS2UpbQrM26fudrazKOvNiE04KKmAJLxu3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tgqfvk4BjGVJ31lx4WfawjEFYrarO7darELPqtITwwHvSaTtGuJ0uHJQr7lBSwJ/IJ82G5ognNTvHlyJck/2iwcvUYneFGOCd/R3Mkz1POCVDa03AO9qwes0TuZRIlyUsmZrEn0tP7olgUXd293em1PGpthYkb2/B+bkqnJDQH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQ7Fi9uT; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQ7Fi9uT"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c0c2a68d01so23692425ad.1
        for <spacemit@lists.linux.dev>; Sun, 07 Jun 2026 10:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780854231; x=1781459031; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GzT+dLha/Dk9hG0MT19SMdgwaEdfoohDSe4reE53O0w=;
        b=HQ7Fi9uTx5IHeReV/SZzwTpFft/qr1V2ZQNbiQluZQKBQgbxMUBT7n7EWDgPxevqKA
         fkTX3Kmtgdey6+26krb+reTCsSg31N5oxpwaJsDiRtzCuvyr1EYdC3w1mxmFR/Scxn0C
         +BvP1HE7WYcECtGanTjdd/AK7HrTLW/Fwc/lUiUC4s9VPMvsVO1MOCG3pnpM48DCKBi3
         pzZGy+EmrXxeSdur8olcHRQzvFgbrsGLEP5YMXOFlabwzmN7T/2m/Jo2bCXllMulCjfo
         wRKhfe+r/0beTsLYvl1AQK2skJemFsLYq15SEmTND+qbD8K+KRmVs+2AegxyT9nAS2H7
         P1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780854231; x=1781459031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GzT+dLha/Dk9hG0MT19SMdgwaEdfoohDSe4reE53O0w=;
        b=gf0mwWYzQ+KPLp2JLI6H3t2tDCscp/hGQZUVvDMpY6fgyhHZWNrQp41OuJoue15I2H
         Y35aXN0aB/fY/7Vi5D45jVtbtF/Nm27yXtU7KikavRw1h/dP8EZfeOC5VxMHnd/ZiVhy
         FjmyukryzM8s/dch0rYqSiH68Z7sN5K7NipJCjnsPvXh5YX+wh1eTd2LD/1PdY8VxrKs
         ei/jBt/RoRlNo/WjZrlRAQJzUzvKMfRydRs8Xbfp4gml052GmopM59qBTM+r+xXA/1vw
         8MtgyAiE42uqu1plfqaZ3i81itLQQgK6n/dyBiwBj22e7TdeiwX9JBMZD9J5HuBuzSak
         JUrg==
X-Forwarded-Encrypted: i=1; AFNElJ9fgBR6v0Vo9A8Eki1aduEWOpMFSRiVi55OHDzAZaoi0lYVoyY4Y8fhT6Pnv6Z4SdaJz3Hjxr9/7w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6+z2TADT7Dk2no5smeJC8K4JqiMTXSj0W12ZBqtI789nnkwJ5
	n6baCdsMgbo5z/he+1Xfsbn/SsA9IOwcdtiEYEvn7s4UQ1IlbQEPsS2y
X-Gm-Gg: Acq92OEr/1UEagHN9H3lolOmSZUW+rfm0GxhAAbqHtBVGonYlyZc+UVYmJcIoLxtY09
	zIef9hsjHiM2KFaSzT8+f530J/ojkLdoUwoNszcBqu8/taRSRSvLpjbXM2wOA+bI6oXxCMHUpYO
	RGKtJUr2PCJ81QV5YOXL7Foe/HbqHgX7lVeyCsy3pU9NDfvx+rmz8ozdPuuXhWVze86M82p8kHy
	/iVQtrwk2YxgHgb1kP2MxdC1ohgVhkfewkPxqjdOj5AEJnmOanZQldDqocbr1byImc7wHOVat5u
	MCS4dIqdeUj0fBMZTcwiO7PUyqGoFVqXX4K8ZeXC3ebLGFD5jjLeanq33SOUUcVcQA43B71tDnR
	p6XjVWtYoI8ntDLqAITtHf1vP9wJRs8WOV64KytPEeD9xXiGV5stZiLCuik7Z73jmIPeyFAzrjf
	5878wtSqq0
X-Received: by 2002:a17:902:ccc3:b0:2b4:59bf:5728 with SMTP id d9443c01a7336-2c1e80ec2abmr129153755ad.25.1780854231461;
        Sun, 07 Jun 2026 10:43:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::305d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649ab01sm149171185ad.71.2026.06.07.10.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 10:43:51 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Sun, 07 Jun 2026 13:41:30 -0400
Subject: [PATCH 1/2] dt-bindings: dmaengine: Add SpacemiT K1 PDMA request
 numbers
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260607-b4-k1-pdma-req-macros-v1-1-5b2a3955007c@gmail.com>
References: <20260607-b4-k1-pdma-req-macros-v1-0-5b2a3955007c@gmail.com>
In-Reply-To: <20260607-b4-k1-pdma-req-macros-v1-0-5b2a3955007c@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3119; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=8mqihYrCWS2UpbQrM26fudrazKOvNiE04KKmAJLxu3k=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhizVtWdTW1yfxFrzbTj8v+HD9/re5c4dm+YL1VWyM394v
 235/rN7O0pZGMS4GGTFFFkOH23J3vrKJ9r3OecPmDmsTCBDGLg4BWAiyVcZ/gr9LH/KsD5SIzhR
 VSN76qnbE0/9m/dQ/f025eVb/X+LzPrI8L/ycJbu80Rdq+M7bh+ub7z7zSd+91yToFnvJ+3or/H
 3s+IAAA==
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

Add a dt-bindings header that gives symbolic names to the SpacemiT K1
PDMA request lines of the non-secure peripherals. Device trees can use
these K1_PDMA_* macros instead of magic numbers.

Point the spacemit,k1-pdma binding's #dma-cells description at the new
header.

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
 .../devicetree/bindings/dma/spacemit,k1-pdma.yaml  |  4 +-
 include/dt-bindings/dma/spacemit,k1-pdma.h         | 56 ++++++++++++++++++++++
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
index ec06235baf5ca..0d4ac9849e27b 100644
--- a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
+++ b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
@@ -35,7 +35,9 @@ properties:
   '#dma-cells':
     const: 1
     description:
-      The DMA request number for the peripheral device.
+      The single cell is the DMA request number for the peripheral device.
+      See <dt-bindings/dma/spacemit,k1-pdma.h> for the list of valid request
+      numbers.
 
 required:
   - compatible
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

