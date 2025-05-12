Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6483255235
	for <spacemit@lists.linux.dev>; Mon, 12 May 2025 18:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747074740; cv=none; b=tsP/U8/MO3hsEC0d7OZ9aGu/T3BPr55KQqkyA46kUogBBaJMDijyc6Iqtow0O7NG6Q6qrHoPANq114Ng62mNg9yVnva8cVsTUfG8rAEgvdCbtZxdqSr4pKINB71T0ChoZlr0l3wvM0ofAEmktInvvbJuarSTKh8WiRvEYVU6t70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747074740; c=relaxed/simple;
	bh=JbvxIKNnm2l02MeokP48X8vc1GIBXzEECfh/a24p9gk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nc8Fqu9mkChRnDwQPMl0M/b3bwTFuukZ3jbAB45zsoy3gjbUfQ8OeLpjYTMifwmQUshE4BzlrOSMTvnL2HuBhqjt4CIu16syiSHYeE1X91TEIjfaFa/5geaB1aG36EahYGUER20tRRnB1zBv2AHDaaB+oOWzYSqrQH3TDLfyiS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Jdz4eaXY; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Jdz4eaXY"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-861d7a09c88so79017839f.2
        for <spacemit@lists.linux.dev>; Mon, 12 May 2025 11:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747074738; x=1747679538; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81a1v+nMC7nJeIGTMZQ54emwTNg/YN8dMbbTK1LgyT8=;
        b=Jdz4eaXYwybj33e/1o0p6ZmVQDVvFbNRUnv9D7Frc3Y8g2zA5wJVEpW3jna1Xf1Hz+
         q5MCkMupacpAJ+8+TvoeYU7h74x8/6f3mbMoQlxWRSSlOac+yEjOgNq+sxjZ703yIS6i
         FiUyJBZwc9WTFOqGprjj2WVMy1uLav7Tvx4ziKVx46v+ooDemsbnYN5EpMSv7xFNllMU
         Ss+S5PJf7n7kBdpA4auurZpCHUeIFHKqSmpduoCQ7xD0++gwQQxv01RQJvT7DKk49xlQ
         luDP2ffhpjtmWQrDbWxWXYbmZaCP2g4CnBUTQTikoiiddQTuyLywpsyFQog1+h/FZmDA
         h1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747074738; x=1747679538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81a1v+nMC7nJeIGTMZQ54emwTNg/YN8dMbbTK1LgyT8=;
        b=ZErYKjbW1jUhzU0iaW4ruOPpTcRWipzMkl6cAGicCxjh3Jt9S9KGC6MtcGLTNe41VS
         p6jZZmFCoxtoHJqrd9N7ueIIXBBzm5hTzM818bWaqjZIIhJIrin2Q61IHRDVGLUqgp1d
         mV594Wi9YFLsjKle7CeFROq9OagfFvL1W1eubSIEHzXbKdwP2tmpPZ0zHWB/UY9iAwfq
         rnGVRiDtbw7ht/+nNriT0eCvjpYAv84p8rXcX3O0I1tN+f4Je3j/sHw81D8Jk54A10Uk
         zqWxiApCMSph1RTkzJIG/cAGYjB010RJu9N3QZnpVwosigUSzDriy7aQYgMR5IAXkcFm
         W1tA==
X-Forwarded-Encrypted: i=1; AJvYcCWy0QybIzNHTFJQGUMq3zBQ4DytV8aiF/nH7zMf5ZlcVLV0ftonv42FwNnWB1qwJ+6NJN3bDhsqWw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7hHn4KsyksFClmYdUG/dTCVSq2Oqp7QUvXCtwkm/Uk6NNB0h3
	YxVCoope6gWXSn9L4oMZxNuW+Uwj9B24Dxntvu4ldWTsBBL0QK0HHDZpQVAmois=
X-Gm-Gg: ASbGncsYWVSiocMByrUVXebVms/qskXBB68qt4jm6L+D+rJs7NkirX4bp4rnmh0iRsb
	JRN/pAKwAb+SRo5y/2iLrcioC6cDHozXbtcO7LJUTXz5uQ3x0iGObQzmWyZsRcls/b7zOVkWLtV
	+7lDl0hL4tL6W/787oSB2jyyteRAqwfv/G/wSl23UKdK/haa3WyBoInVlLQz8/cCu9UONx0gCG2
	zYGF+c7z79S12v2SKnQVhyErYfeN3poJhVsYLVrZJezCd0P9p1ZX/kTwXDFWJBllX9diAHRGE0F
	ct6+/EqeqfC87SICAdyIDe3kdysBNWDP5K8tsqUKIAMot8kQ7HIMRX9oWKj/ADu9t9pOa60WaFE
	U5g1TirS+lTxqyAAHFgI9ys1u
X-Google-Smtp-Source: AGHT+IHLBc46s/8w3VzN167Tg4Yt0RbtevuFNIqx3Ypi3S5QvXRt1r/AuSD1ctpzGzbcc3mBdprKFA==
X-Received: by 2002:a05:6e02:3813:b0:3d4:276:9a1b with SMTP id e9e14a558f8ab-3da7e20da7amr141836045ab.16.1747074737904;
        Mon, 12 May 2025 11:32:17 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa22496e9fsm1740333173.11.2025.05.12.11.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:32:17 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v9 1/6] dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
Date: Mon, 12 May 2025 13:32:06 -0500
Message-ID: <20250512183212.3465963-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250512183212.3465963-1-elder@riscstar.com>
References: <20250512183212.3465963-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are additional SpacemiT syscon CCUs whose registers control both
clocks and resets:  RCPU, RCPU2, and APBC2. Unlike those defined
previously, these will (initially) support only resets.  They do not
incorporate power domain functionality.

Previously the clock properties were required for all compatible nodes.
Make that requirement only apply to the three existing CCUs (APBC, APMU,
and MPMU), so that the new reset-only CCUs can go without specifying them.

Define the index values for resets associated with all SpacemiT K1
syscon nodes, including those with clocks already defined, as well as
the new ones (without clocks).

Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 +++-
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 128 ++++++++++++++++++
 2 files changed, 150 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
index 30aaf49da03d3..133a391ee68cd 100644
--- a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
+++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
@@ -19,6 +19,9 @@ properties:
       - spacemit,k1-syscon-apbc
       - spacemit,k1-syscon-apmu
       - spacemit,k1-syscon-mpmu
+      - spacemit,k1-syscon-rcpu
+      - spacemit,k1-syscon-rcpu2
+      - spacemit,k1-syscon-apbc2
 
   reg:
     maxItems: 1
@@ -47,9 +50,6 @@ properties:
 required:
   - compatible
   - reg
-  - clocks
-  - clock-names
-  - "#clock-cells"
   - "#reset-cells"
 
 allOf:
@@ -57,13 +57,28 @@ allOf:
       properties:
         compatible:
           contains:
-            const: spacemit,k1-syscon-apbc
+            enum:
+              - spacemit,k1-syscon-apmu
+              - spacemit,k1-syscon-mpmu
     then:
-      properties:
-        "#power-domain-cells": false
-    else:
       required:
         - "#power-domain-cells"
+    else:
+      properties:
+        "#power-domain-cells": false
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - spacemit,k1-syscon-apbc
+              - spacemit,k1-syscon-apmu
+              - spacemit,k1-syscon-mpmu
+    then:
+      required:
+        - clocks
+        - clock-names
+        - "#clock-cells"
 
 additionalProperties: false
 
diff --git a/include/dt-bindings/clock/spacemit,k1-syscon.h b/include/dt-bindings/clock/spacemit,k1-syscon.h
index 35968ae982466..f5965dda3b905 100644
--- a/include/dt-bindings/clock/spacemit,k1-syscon.h
+++ b/include/dt-bindings/clock/spacemit,k1-syscon.h
@@ -78,6 +78,9 @@
 #define CLK_APB			31
 #define CLK_WDT_BUS		32
 
+/* MPMU resets */
+#define RESET_WDT		0
+
 /* APBC clocks */
 #define CLK_UART0		0
 #define CLK_UART2		1
@@ -180,6 +183,59 @@
 #define CLK_TSEN_BUS		98
 #define CLK_IPC_AP2AUD_BUS	99
 
+/* APBC resets */
+#define RESET_UART0		0
+#define RESET_UART2		1
+#define RESET_UART3		2
+#define RESET_UART4		3
+#define RESET_UART5		4
+#define RESET_UART6		5
+#define RESET_UART7		6
+#define RESET_UART8		7
+#define RESET_UART9		8
+#define RESET_GPIO		9
+#define RESET_PWM0		10
+#define RESET_PWM1		11
+#define RESET_PWM2		12
+#define RESET_PWM3		13
+#define RESET_PWM4		14
+#define RESET_PWM5		15
+#define RESET_PWM6		16
+#define RESET_PWM7		17
+#define RESET_PWM8		18
+#define RESET_PWM9		19
+#define RESET_PWM10		20
+#define RESET_PWM11		21
+#define RESET_PWM12		22
+#define RESET_PWM13		23
+#define RESET_PWM14		24
+#define RESET_PWM15		25
+#define RESET_PWM16		26
+#define RESET_PWM17		27
+#define RESET_PWM18		28
+#define RESET_PWM19		29
+#define RESET_SSP3		30
+#define RESET_RTC		31
+#define RESET_TWSI0		32
+#define RESET_TWSI1		33
+#define RESET_TWSI2		34
+#define RESET_TWSI4		35
+#define RESET_TWSI5		36
+#define RESET_TWSI6		37
+#define RESET_TWSI7		38
+#define RESET_TWSI8		39
+#define RESET_TIMERS1		40
+#define RESET_TIMERS2		41
+#define RESET_AIB		42
+#define RESET_ONEWIRE		43
+#define RESET_SSPA0		44
+#define RESET_SSPA1		45
+#define RESET_DRO		46
+#define RESET_IR		47
+#define RESET_TSEN		48
+#define RESET_IPC_AP2AUD	49
+#define RESET_CAN0		50
+
 /* APMU clocks */
 #define CLK_CCI550		0
 #define CLK_CPU_C0_HI		1
@@ -244,4 +300,76 @@
 #define CLK_V2D			60
 #define CLK_EMMC_BUS		61
 
+/* APMU resets */
+#define RESET_CCIC_4X		0
+#define RESET_CCIC1_PHY		1
+#define RESET_SDH_AXI		2
+#define RESET_SDH0		3
+#define RESET_SDH1		4
+#define RESET_SDH2		5
+#define RESET_USBP1_AXI		6
+#define RESET_USB_AXI		7
+#define RESET_USB3_0		8
+#define RESET_QSPI		9
+#define RESET_QSPI_BUS		10
+#define RESET_DMA		11
+#define RESET_AES		12
+#define RESET_VPU		13
+#define RESET_GPU		14
+#define RESET_EMMC		15
+#define RESET_EMMC_X		16
+#define RESET_AUDIO		17
+#define RESET_HDMI		18
+#define RESET_PCIE0		19
+#define RESET_PCIE1		20
+#define RESET_PCIE2		21
+#define RESET_EMAC0		22
+#define RESET_EMAC1		23
+#define RESET_JPG		24
+#define RESET_CCIC2PHY		25
+#define RESET_CCIC3PHY		26
+#define RESET_CSI		27
+#define RESET_ISP_CPP		28
+#define RESET_ISP_BUS		29
+#define RESET_ISP		30
+#define RESET_ISP_CI		31
+#define RESET_DPU_MCLK		32
+#define RESET_DPU_ESC		33
+#define RESET_DPU_HCLK		34
+#define RESET_DPU_SPIBUS	35
+#define RESET_DPU_SPI_HBUS	36
+#define RESET_V2D		37
+#define RESET_MIPI		38
+#define RESET_MC		39
+
+/*	RCPU resets	*/
+#define RESET_RCPU_SSP0		0
+#define RESET_RCPU_I2C0		1
+#define RESET_RCPU_UART1		2
+#define RESET_RCPU_IR		3
+#define RESET_RCPU_CAN		4
+#define RESET_RCPU_UART0		5
+#define RESET_RCPU_HDMI_AUDIO	6
+
+/*	RCPU2 resets	*/
+#define RESET_RCPU2_PWM0		0
+#define RESET_RCPU2_PWM1		1
+#define RESET_RCPU2_PWM2		2
+#define RESET_RCPU2_PWM3		3
+#define RESET_RCPU2_PWM4		4
+#define RESET_RCPU2_PWM5		5
+#define RESET_RCPU2_PWM6		6
+#define RESET_RCPU2_PWM7		7
+#define RESET_RCPU2_PWM8		8
+#define RESET_RCPU2_PWM9		9
+
+/*	APBC2 resets	*/
+#define RESET_APBC2_UART1	0
+#define RESET_APBC2_SSP2	1
+#define RESET_APBC2_TWSI3	2
+#define RESET_APBC2_RTC		3
+#define RESET_APBC2_TIMERS0	4
+#define RESET_APBC2_KPC		5
+#define RESET_APBC2_GPIO	6
+
 #endif /* _DT_BINDINGS_SPACEMIT_CCU_H_ */
-- 
2.45.2

