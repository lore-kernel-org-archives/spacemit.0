Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379EB28B511
	for <spacemit@lists.linux.dev>; Thu,  8 May 2025 19:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746734061; cv=none; b=enmZe15y6VnDD7/Np2Fy8NIZ06vj56uKul2AT0OTSkU9D0otERFgjRtYPDOltUniChsDcyojx5c/DsEGodoeQSSLQK3oRpcVmclEOg7IKm5sn1ch/pkNL6yeEFh3sETlNoo0NV1aC3wmyqXiMsbeTNWX+zxF0eWlelKkc3NgWaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746734061; c=relaxed/simple;
	bh=JbvxIKNnm2l02MeokP48X8vc1GIBXzEECfh/a24p9gk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K/FxiUOW1WHzKn8kAD9Pzy4EYYJhpUUkhCdP3AUBV0l52LABjpR2Jj9gctII/Q1XIxCD3W0/4juvvjoNcwB/Tklaen2ZBap+C+q0fhpjbBxaY9ib8BpXyD4kptx3aLMVmofw8LHohbAazbdKiC7crwO8ouX638Dee/LATTGewos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=vGmDEROq; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="vGmDEROq"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3d81ca1d436so10548465ab.2
        for <spacemit@lists.linux.dev>; Thu, 08 May 2025 12:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746734055; x=1747338855; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81a1v+nMC7nJeIGTMZQ54emwTNg/YN8dMbbTK1LgyT8=;
        b=vGmDEROqViQcVxLCttXIyM/aLs8B4+sEIcmmEX/sXXRkyNujOgdH/OjCgbhhQael9A
         UJ/D1rjayRbULu7fhbKU8XO9Vh5XL4Ll7sTdWw9x5gF5yQNjwwFQbOSDPpvmYoL+y+Zi
         6lIFAdPh09NAwuFyqn0zpa5g30lxvIfrfl22c9QyfsQ8ISyWFXVquGrYuLFv4qgc5UFF
         BeeuIdcsLubLKsmfJJpCZMh7tf95VfRBC6vgqDf4PrlB798MksAVmfInHwictkOTQ5XB
         0cdyrxb0OJBpSiBK8FTgdjrD9h5qm26M9GXDEsqOPd5IjtqxX9I/U425bVEgTpfeDED0
         870g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746734055; x=1747338855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81a1v+nMC7nJeIGTMZQ54emwTNg/YN8dMbbTK1LgyT8=;
        b=iW88YMhPfp/EINAK01uDszHGrrKCTLEU/pbHvEF7IqDtp42YZsIvkL2SGwzZdLZaMT
         f4NFhO45Z47S9FxH/OIVsD/0Y5b8XBQ/YKZGJtqCgw7JekTcHykU3mjimqCimQg44w/r
         hZ//mklOZcIAKI7OkgstkM4+qCYlxYXnBDvZyU5EYn8c3/sZN06PM+wo+kjyz+N2C2wx
         2ODy1Q4sWtmmIVXyR7U4g+UPBc50BMzGxcVK1+U2qUMVt59QUKxguJBah60Kld9kzO9M
         vSjF5TtaOQPdldwJHy7Tr7hrmPEw3Il47YJaqkYeP7Q5/XSQc9R9PtQmWs0JKM7AAy2S
         Mj2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWOkLKyHU5AuKEt/xmsXRAm4P4BG5WdioQF+LMghhAwOA64hU82BmeOVRTzhpzOHTss/q0JHvazRw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzI695xfAF2xkoBT1DWnaLog/uOVtrouaPSIFZD7hhW0YNGFz+W
	KQWJV0SBI6gE1lyN6/kpef7i+4cXIwsl1bPGsyj67aMzc3Xbmooq78TxgbBzzrw=
X-Gm-Gg: ASbGncvP9Sh7SEsWJifCUzAlYzOPlnrowt0zpA2kEPe5CcVpGu/4b3gVtVhNpAjlOO3
	6CEipcqPMC67iATmQcW62iFHspv1UerFLd9/vxIMOABW3kUOCqOzmUo70ORuIBE61m6zLZqOmMZ
	8pH06VMp+JG5zsDvyaec7yrSPg1gUdbK9UeyQvna9ilJ2ticUMDC/R2olXG6/bwdjyCZeLzi+Uc
	STymCPW6gtpmHSVexYJDJ+xE6Kn6ohFbD3u5v7qlw07sFMxVqLT+2OL4d9JFREJkd/iTuqrePTN
	SAka8pqPM5OqSwWp3wIbqhLGeAusdsT0WJ32G1RAO20Yrcx5/uBFFZwNc6RsFs07NgBTwsCO8yt
	5ATZKetwjRELZYg==
X-Google-Smtp-Source: AGHT+IF8CcPkmjAlw6MTkmmdxTcsoXmdwilW9UDT/6qyTJy0KFGIHccSczN1HQMBgLC3/Mu1mNpyNA==
X-Received: by 2002:a05:6e02:1809:b0:3d8:19e8:e738 with SMTP id e9e14a558f8ab-3da7e20cfd3mr10930035ab.17.1746734055380;
        Thu, 08 May 2025 12:54:15 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa226850e1sm93983173.134.2025.05.08.12.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 12:54:14 -0700 (PDT)
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
Subject: [PATCH v7 1/6] dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
Date: Thu,  8 May 2025 14:54:03 -0500
Message-ID: <20250508195409.2962633-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250508195409.2962633-1-elder@riscstar.com>
References: <20250508195409.2962633-1-elder@riscstar.com>
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

