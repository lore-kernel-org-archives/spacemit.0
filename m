Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C271840B386
	for <spacemit@lists.linux.dev>; Thu, 11 Jun 2026 13:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781183867; cv=none; b=WnGQ84/XmDVoPjXNv5cW+OLMHG01Nn/F59eNc/5fjzZruahpIvIVP79N5ZBpTp8D0cmWGLZ+No5tzHabHGUFww4vd68SqjrmTrXwhIfiouS2bl9o4Km3WUSIS3JtrLlnMhzGzu8zUHTmScqz6F/JZCgoKbMdA/beSp1ReNsEj3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781183867; c=relaxed/simple;
	bh=ioxeCNvToivxf1SJbAe6EIhY0aEComaoX+8RNwBtunE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fzJjmb2PK9iPaMSK4l57rfAzNnbmOhPSYozmkzGX6qn+0c6/N33TtrzYwJ6WwYwYK0bqHcFSu9NdOTicY6KKp5jMRKBS6Kii06kcZeIhCtu+ufBbLurRBtWAJdFqFIaDLZ0HOi61uQ5/oSZoHvHIMNDA83Xxlio1cfDMhwYUjBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pN3BEvun; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pN3BEvun"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84232e83ca9so3395713b3a.2
        for <spacemit@lists.linux.dev>; Thu, 11 Jun 2026 06:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781183864; x=1781788664; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P/xQJbFkRRowzEJ+ZDzKMiiLUlhrEmEVF/BkBQLOp88=;
        b=pN3BEvunRlOQHt7yRxFv5cl7Yq7kq4MuoPZWtVphW1nNPiXYHrn1E9qvf0QRut6S7u
         0AqG7PlRSQ2rwLuY+mrxNZmr3RG8cZDgTZXUbfKbZG4f8k1cXAfjvQ0vp2nWK4r6HmwQ
         SB8uUSvRF22577dThc68KHdAuEmSqs/WKDzZCTMw1EOZ9nFIF9EDkbVlLeX04U5Vy31p
         5SC1NsRdb4FMuI/0nIokCn9vSWpkSZEsKrYTAKAXzNScHsR9T2zTIhsSTFGA8TD5hGd0
         y/R95Ys80+X32lZ8chJXuh/7ikHNIQp3PXLFP7wo/F7LGk3yMJYr3a3zK2pq3RcVJisu
         Bydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781183864; x=1781788664;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/xQJbFkRRowzEJ+ZDzKMiiLUlhrEmEVF/BkBQLOp88=;
        b=UfoZSGcTIA0zIYQUHJgQKyx9jIlWM32Lbh+1NJMZvqXZFZifqcz/GD+AMCy2lgp0rE
         CNPtxKnADFiixHGHMaokur0NVH4Qz5n38A2kPPj7bv275qcxhAcbiPWUXqUt7afIpB4C
         mdwPLr0mTo2IvcinqadnqKG1Cx0HrwPWMrQNt61udc+mf+4wPmamnIDIdsi0SO3XQatI
         w5QFD67RAOOwzsQabEvF8PbBXjt+++pFoqOliBSOok2h8sP41o8c+7/jTn/vzZ6U7wGN
         oR07CoCGUZTvRxGD4mCZ4IozXY+w9D5FuMEhVPmeCPpgq9yPqfCank51FyB02weHmszp
         MDDg==
X-Forwarded-Encrypted: i=1; AFNElJ/MkKeoeKnS5e1JudQfj9e/HpSKnj9s7L7uo/XYTk9foxCPtUNc/TCB4A5DPLuPNqPiDJOmXpGhDw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+Hm4FbYIqtr6SUC9MwbPP85a65UcL3jXB59mcLrkuM/J5KpU7
	00ioBJSDSi24Zniv9LxMyeE94IN4JORUmMNaQJOeDDgLvNitZpm+iCdK
X-Gm-Gg: Acq92OF3bSwODyhzJJrTPwCPFWvuxxsdgKoCTdKRKUBzCvBBOL9uWr3FLMzvQ0G9XqZ
	RkPwQ7CSgiwrQvZJJQHbiyspQ2hbshrYhUAQB7hHE7A3C4Hb5hevrflLXOHMOz0UPrYcrMSWgn1
	7xs0w1xN5jzVyRahmAjub9cnIqVrMWydTWpyfyitiBBMnz+EBzlIM93RURcq9pl0IKywE40HY02
	I1Gd7K1SVqMgTtZnMNTdkLy4mDPPvVJCWW2E2sfloZYdeCouJYCnWMRJuMrIMNaPQQVGeGRbonx
	alE0FpFI2KXxSdxF/bOeyN92q+ZTYGvkUQNJMHvEFwnB3hI7vaqM9gEahKbkpX/P5CM4k844aDP
	8HawXGyyKtXBK/zmijNtD2sff/wXQZY/ZfLE5RNnlvZqYWeBTrJgkmgyh+mB+fNQ7Z9j7vED6eN
	XSUpOM/GeS
X-Received: by 2002:a05:6a00:9517:b0:842:33f3:da68 with SMTP id d2e1a72fcca58-8433679e608mr3293724b3a.8.1781183863777;
        Thu, 11 Jun 2026 06:17:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-843382e5caesm1986491b3a.44.2026.06.11.06.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 06:17:43 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 11 Jun 2026 09:17:28 -0400
Subject: [PATCH v3] riscv: dts: spacemit: Use symbolic PDMA request numbers
 on K1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-b4-k1-pdma-req-macros-v3-1-ae8416052571@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGe1KmoC/4WNTQ6CMBgFr0K69jNtoa248h7GRf+AqgVskWgId
 5fiho1xOcl7MxOKNjgb0TGbULCji65rF8h3GdKNbGsLziyMKKYccyxAFXAj0BsvIdgHeKlDF+F
 gqOAGE8pNhZZvH2zlXqv3fPlyfKqr1UOSpUXj4tCF9xoeSdr9a4wEMDBFZV4yhrHQp9pLd9/rz
 qPUGOnWUv6y0GQxzAhVlkKxYmuZ5/kDFDYsGBIBAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4245; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=ioxeCNvToivxf1SJbAe6EIhY0aEComaoX+8RNwBtunE=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiytrbnvZJce2757oSbnnvVLs9gtdA5sj2HeuHBP9bul/
 NbcJsdmdpSyMIhxMciKKbIcPtqSvfWVT7Tvc84fMHNYmUCGMHBxCsBE6tIY/kfE/V+SIxx451+e
 5NKwM/kq3b3dLoKG8+eunnZRuPvuP32G/3lXSuROr9onNc390cECnuzV5S68Jt0vp72MnP1EQen
 wDQ4A
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

Add a local DTS header, k1-pdma.h, that gives symbolic names to the K1
PDMA request numbers. These request numbers are hardware-fixed; their
allocation can be found in K1 manual.

Replace the hard-coded numbers in the SPI3 "dmas" property with the
K1_PDMA_SPI3_RX/TX macros.

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
Add a local DTS header naming the K1 PDMA request lines and convert the
current user (the K1 SPI3 node) to the new K1_PDMA_* macros. The request
numbers come from the SpacemiT K1 User Manual [1], Chapter 9.4.3 DMA
Connectivity & Assignments.

[1]: https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k1/k1_docs/k1_usermanual/9.Top_System.md

Changes in v3:
- Move the request-number macros from include/dt-bindings/dma/ to a local
  DTS header arch/riscv/boot/dts/spacemit/k1-pdma.h (Conor).
- Squash the header and its user into a single patch.
- Link to v2: https://patch.msgid.link/20260609-b4-k1-pdma-req-macros-v2-0-5d5d7b997b54@gmail.com

Changes in v2:
- Drop the #dma-cells description change in spacemit,k1-pdma.yaml; the request
  numbers are hardware-fixed and unused by the driver (Conor)
- Link to v1: https://patch.msgid.link/20260607-b4-k1-pdma-req-macros-v1-0-5b2a3955007c@gmail.com

BR,
Guodong Xu
---
 arch/riscv/boot/dts/spacemit/k1-pdma.h | 56 ++++++++++++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi   |  4 ++-
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-pdma.h b/arch/riscv/boot/dts/spacemit/k1-pdma.h
new file mode 100644
index 0000000000000..65112d5847add
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k1-pdma.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * This header provides DMA request number for non-secure peripherals of
+ * SpacemiT K1 PDMA.
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

