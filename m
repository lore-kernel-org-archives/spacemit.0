Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD88A2B9B7
	for <spacemit@lists.linux.dev>; Sat, 20 Jun 2026 05:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781932092; cv=none; b=MiO2aIcSRW7x7f7+i2SBCz5CDCI6eIlkLmwkcJ0ydszGT+P4PbV6AqTd6sARtdBJjCvA1F3GVXLiU1a3Kdk9jgPnu5byXnXjjusggpvwuAqYH+tIZzoKSVSQzoZfJy2nR69zguZb7u1K6HmP3a2TFYbssMTAN6T8jywaHSZFjcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781932092; c=relaxed/simple;
	bh=LepUJJTxmkYMO860gHHna5A2hsGG1CLcmny62OJUIqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=vBQoWIBaoG8J8dNX/hpHDe4lpDWshzJzoQCx0J6IRDRzjpkIuaVQVSqvCwl4rgrPVZ+AKg9PbMGJ8i91R7Fb6qZ1dArkRx5CqzgsLDgZ6SPhqP4cwmdpIi171ZOa+Gp9RVPp0JNEhg9qGzmovKgn5RFND4b/WeuWACcovLofZIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kwZPEsq0; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwZPEsq0"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2bf22d29dabso16855145ad.2
        for <spacemit@lists.linux.dev>; Fri, 19 Jun 2026 22:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781932089; x=1782536889; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wTkwWAeY0fntOQ2aGm5ZI6wJA7Nh3ySr51xxoVIYuRM=;
        b=kwZPEsq0sM5w1KOGzXCyEpjKrvT6Kv7ttqbfExueUoWSaPcBT0VNZgGyU2//aRshSL
         gJnQgO95LrplVO6NK0crQPc126LZXANhWIJ9NJUN44oODRZphPfqzIVTHOwKkAe7W+GL
         aYwkS3+8yM9eSbFl+KyQ+bvkSRBQdCKkJGm13s5IN9ZWU1THX9Vc40sIimWgS9sdT7pu
         7E3CQgS0Q0jtzGtKakqFu4W4RmfPdAYZrRZUG6wZUQLm+oCLJYOBp1VveVzyN7Wtmes9
         hjIW+91ybypOVP5L+UJ0n5EC0MPaz17TQxMISVYCU4/5DdT3x2ylxQFjE9rPxIMfHTrc
         2DYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781932089; x=1782536889;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTkwWAeY0fntOQ2aGm5ZI6wJA7Nh3ySr51xxoVIYuRM=;
        b=pDbOOWU3agSy0TRT//kzqMZpOdT1Jj9O+y2MYfZQfk4bMJtQl5HcoGr+FPZ5i6EmDN
         vT8GrmoL4LzePZllQsxwxycxLhsL7wWg9bTBXaDrZCysxajfWF3JZ7Ah6jg+FnXy9EsK
         cPqFi9UQBtBumO15/+lIRFcXMstTpv3/DQpGjJjZKZoFhiv3BT4014Qii6MGZwvzWtry
         X8ju7ZAr+6DLpO2FN4JE08xUnUCWl9maHbXF/Zb6uzPlfgmXUuRyoMk19UE6k4lrd3tb
         2RLf5U+ORztH/SZnKVFJwGW0ICjx2okiOg8tsBCF7Pv0K13BsoMx6Dkj9lvEyFeHMYrq
         /TQw==
X-Forwarded-Encrypted: i=1; AFNElJ+c4gLoBwtSCGzx8YSz/XBhKvVMYUm90ArTUtj5BPRN5NnMEUDiGxLr9yY9Jmz23vdcgpTDtRzaAw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVcjOX+Htedcw5L2kwFCs5v2ZXlItTOlfRjo1jNpD6y48FCXKM
	3P/9BJEUZJcW9enJjBmdYGx8/dnMfCt9nDfb/8egKt2CxB9MzD+zBkmoMLrHWkTO
X-Gm-Gg: AfdE7cn3+5hy/AHr7tpoFS0SYYiXbdUJBzxeWGFAsUg8Y0pMjofJei5uqyMQJ+u67uq
	wPcUymAuNDXQrdzRzB1pdN5qe0CSrxSU5eAQOIavRoBMLW41PXbM1D21VQGB1Mik/AgHNuY/hzv
	+RX/ahPArcoHIvQstyq21Zgo6B/bzAgngRBXJsXPAbFphdO1lBIv15XV23bLkeg2XfWfdu6p2Tt
	zv3WbfpFlqGSQcRxhMohqMg4qcxlX97kOqaCVWNFbc/QsUBrcH1zFQAY4IwS4drUCm0UVnuY3DO
	KG5X+dtKp2o5BOWdC63aM62vbYUjrHoF25fyRObklxp+neRLfuQeSUO59whdTcSW6Vh86Y6xQVa
	1O0c64sVE0kbvChT2INaglcWd6vn3t4nfum1Z0YhTl483xWCbrGv2JBiIimtWjdM=
X-Received: by 2002:a17:902:fc46:b0:2c6:b768:a7de with SMTP id d9443c01a7336-2c7422c36f0mr20594985ad.8.1781932089122;
        Fri, 19 Jun 2026 22:08:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7444aad99sm12129435ad.80.2026.06.19.22.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 22:08:08 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Sat, 20 Jun 2026 01:07:48 -0400
Subject: [PATCH v4] riscv: dts: spacemit: Use symbolic PDMA request numbers
 on K1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260620-b4-k1-pdma-req-macros-v4-1-3cf77d0bd0d6@gmail.com>
X-B4-Tracking: v=1; b=H4sIACMgNmoC/4XNTQ6CMBQE4KuYrn2mr9AWXHkP46J/YFVEWyQaw
 t2luCEmxuUkM98MJLrgXSTb1UCC63307XUK+XpFzFFdawfeTpkwygQVVILO4Yxws42C4O7QKBP
 aCIVlUliKTNiKTNtbcJV/zu7+8MnxoU/OdAlLjaOPXRte83GPqffvo0egwDVTWck5pdLs6kb5y
 8a0DUkfPVsq5S+FJcVyK3VZSs3zbyVbKIi/lAwQlCtyFJQzLnGpjOP4BkmQwFxYAQAA
X-Change-ID: 20260607-b4-k1-pdma-req-macros-8d276d0126df
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4256; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=LepUJJTxmkYMO860gHHna5A2hsGG1CLcmny62OJUIqQ=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiwzBe3D6clH19TUS7QZ6617bLAq/x530h2p6/JKE++55
 rhsFRDqKGVhEONikBVTZDl8tCV76yufaN/nnD9g5rAygQxh4OIUgIkIVDAy9Lz32CdTsoZBov/u
 2vvRyzcefjqV4V+CrIuhU+ezTNfrxxgZfpznzjtwQGH7tPeMLGG69y0rP3rPiPzfb3YzY4p2pec
 lLgA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

The PDMA request numbers (DRQ) are fixed values specific to the SoC from
a hardware perspective. The detailed definition can be found in K1 User
Manual [1], Chapter 9.4.3 DMA Connectivity & Assignments. Add a DTS
header file to define the symbolic names for the DRQs of non-secure DMA
peripherals.

Convert the K1 SPI3 node to these macros.

Link: https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k1/k1_docs/k1_usermanual/9.Top_System.md [1]
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
Changes in v4:
- Rework the commit message (Yixun Lan).
- Trim the k1-pdma.h file comment (Yixun Lan).
- Link to v3: https://patch.msgid.link/20260611-b4-k1-pdma-req-macros-v3-1-ae8416052571@gmail.com

Changes in v3:
- Move the request-number macros from include/dt-bindings/dma/ to a local
  DTS header arch/riscv/boot/dts/spacemit/k1-pdma.h (Conor).
- Squash the header and its user into a single patch.
- Link to v2: https://patch.msgid.link/20260609-b4-k1-pdma-req-macros-v2-0-5d5d7b997b54@gmail.com

Changes in v2:
- Drop the #dma-cells description change in spacemit,k1-pdma.yaml; the request
  numbers are hardware-fixed and unused by the driver (Conor)
- Link to v1: https://patch.msgid.link/20260607-b4-k1-pdma-req-macros-v1-0-5b2a3955007c@gmail.com
---
 arch/riscv/boot/dts/spacemit/k1-pdma.h | 56 ++++++++++++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi   |  4 ++-
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-pdma.h b/arch/riscv/boot/dts/spacemit/k1-pdma.h
new file mode 100644
index 0000000000000..7e5ad3d7111d4
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k1-pdma.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * DMA request number (DRQ) definitions for non-secure peripherals of
+ * the SpacemiT K1 PDMA.
+ *
+ * Copyright (c) 2026 Guodong Xu <docular.xu@gmail.com>
+ */
+
+#ifndef _DTS_SPACEMIT_K1_PDMA_H
+#define _DTS_SPACEMIT_K1_PDMA_H
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
+#endif /* _DTS_SPACEMIT_K1_PDMA_H */
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 08a0f28d011fe..7d414e15d2cc2 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -6,6 +6,8 @@
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
 #include <dt-bindings/phy/phy.h>
 
+#include "k1-pdma.h"
+
 /dts-v1/;
 / {
 	#address-cells = <2>;
@@ -1094,7 +1096,7 @@ spi3: spi@d401c000 {
 				clock-names = "core", "bus";
 				resets = <&syscon_apbc RESET_SSP3>;
 				interrupts = <55>;
-				dmas = <&pdma 20>, <&pdma 19>;
+				dmas = <&pdma K1_PDMA_SPI3_RX>, <&pdma K1_PDMA_SPI3_TX>;
 				dma-names = "rx", "tx";
 				status = "disabled";
 			};

---
base-commit: 793cc54475b49b5b558902b5c13e4bfe66530a50
change-id: 20260607-b4-k1-pdma-req-macros-8d276d0126df

Best regards,
--  
Guodong Xu <docular.xu@gmail.com>

