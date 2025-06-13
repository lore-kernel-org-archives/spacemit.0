Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78941D619F
	for <spacemit@lists.linux.dev>; Fri, 13 Jun 2025 01:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749777109; cv=none; b=aOZrjD3ExjSbbfEsmOSmvSB/Yl1U6kTaeK5alYuYGbP3UvERsjageP4msM1N3GHt7WX9L+r/ecFoAZyqqAfkdzwjmTjYwkqumjg7clYFy8eI5hsPZW1XKiqr4Ohfy25y8uixdTFFiHNfwaDD6aseui7I6HfhlKKpQ6GcKs3CaR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749777109; c=relaxed/simple;
	bh=G2LJ8qdRmwkw39n+FaDEDWwgq7C6rp78wyzHDLz5i94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XiQgtmWrTUt+6YLFOOgxCUxVxsMISgRquS93h/fqjQvLCRw4taegX6ZdPLF2gZT23EHDC5OI3bhAixE3UWIPFEjzZRq9rQOsGRYXYp9D9c7f/JUu15jdZ2nEcHU2T0aO1U+qdouDQPQ8Rb0cZBGocPyQQk/KzQ0818tQKv0ytOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=od4JRqYe; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="od4JRqYe"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-72c27166ab3so1171527a34.1
        for <spacemit@lists.linux.dev>; Thu, 12 Jun 2025 18:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749777106; x=1750381906; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIMzta2AftTuOCZk7on/aypnLuIwPcK53zSW3MHSvpg=;
        b=od4JRqYewfQYO6TEA4X/OgCnXdWnO2qTRKgtu5O0BDXUM/iVhO5T60lB5jtN6oCDbj
         nYxlaPZCPU3XPNRXLjqaHQAHYDPPFqYFREJrsK1NXR4drytkReFMwflVJc8hMSgcnCaJ
         2Z9WFgcZUhVPW+LMRexzVS/Y/+707qlwKwcPt7v00JLk+iK3lvb+PCU87Lb1c1YYCh23
         0NOxKSKYchzHBEa+65kzjSldnjrOT5n4Ty8GyDLTSp334wNefmWwwhk6SkP5yc7DFN0T
         ysVg9GcvNYct8Rq3NHeqxIjid/iE6RgWifZagxmQJucBXXn4UNrftrAGXze/lbz6DqUU
         myUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749777106; x=1750381906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIMzta2AftTuOCZk7on/aypnLuIwPcK53zSW3MHSvpg=;
        b=kPp/pQ2wsr2RgqKaexJgDBsuoGOzEKpQRg5Kyl1AqZR5eEET30miQGjpCn68DzclBa
         k3//q08KxLYs2gRY39m/0GLxIDWPzemOXMMBgl9qqhquas85TdvjFh6ohIYYMobhcEiL
         hFXS2IGOigw+etWiHTFDoo4iLv4Zq4Kuzl2cFgSxwBMJuQcktT5vSiFU+ei6ohESGGoS
         kZP9eeXRkKWNiA/DctQGVJplCGy0fibVsgPah5gQVTSHU+6QibofI+jdxXigkr9/bYFD
         iFyoWKSiqab53n50mfYilhOEd1/+oADskKEiFYU3UsX+wRTJmj2v/cA5M5HHCXiOGyXL
         F7UQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIHjA46EETJ8N5qgU70/oduXFGwoSNEGD3dd/zXR0Hf5r8KM0iyXQdq9GSE2a0C9gCA5A2AEJcBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwbVxO4ZWxFAkZi9+GIvcx608g904lfKxObpBkD1DQPmXBZWN4Y
	QadZTHMYvudS7b+t3g0s5oyZDsk8rt86F7bmyyw9yjDQMub9jTF+YUsh/hgJB9N96fQ=
X-Gm-Gg: ASbGnct6UPmRAfzJEPLimgan1mfGZAE3vDTW1ff3olVW1Drype+Bawh1zssMrkm8AXk
	BvNuUk9zwZKuFAwKZJSXjq5TDSweL/M1un8TmNCoGbQ6gg27ad6kfU80rBMap//ovNvC/Auoypm
	VOlfdZnGhXLi9enmZAjzQmWFvuLBzr6jcGYe2HR7tOOQZtQoI+sf23YOy2gGgrsUJgjXxUrU7rs
	/juMUCtFeKdGDV/2bhE4bf5BNbwvrUXBCWZoV4E0BkJxiP1JXGMi61QI0g0VtUGxEncJBFG6h56
	JgsHJrmf0RNO8zIc6789zzmk5Su1jrlrcwU7m1g1G7osBxsMAPC0Lan/t4JwduvsXds/KQ8Z8d2
	aRgAk1ECL6Dtt1DsW0MO5uUIPU3dwvq8=
X-Google-Smtp-Source: AGHT+IHGyKqIzZMGUS+0mLJ+XXdHKM3DYFea7kD1MLQTICc0wh8Dsy0iZHSyESayB407m7TuPOsAmw==
X-Received: by 2002:a05:6871:8011:b0:29e:65ed:5c70 with SMTP id 586e51a60fabf-2ead517c850mr729455fac.30.1749777106478;
        Thu, 12 Jun 2025 18:11:46 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eac0c17211sm407685fac.18.2025.06.12.18.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 18:11:46 -0700 (PDT)
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
Subject: [PATCH v11 1/6] dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
Date: Thu, 12 Jun 2025 20:11:33 -0500
Message-ID: <20250613011139.1201702-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250613011139.1201702-1-elder@riscstar.com>
References: <20250613011139.1201702-1-elder@riscstar.com>
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
Reviewed-by: Yixun Lan <dlan@gentoo.org>
---
v11: Expanded combined reset index values into individual ones,
     e.g. AUDIO (3 bits) is now AUDIO_SYS, AUDIO_MCU, AUDIO_APMU

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 +++-
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 141 ++++++++++++++++++
 2 files changed, 163 insertions(+), 7 deletions(-)

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
index 35968ae982466..8142b1b4c5d7a 100644
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
@@ -244,4 +300,89 @@
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
+#define RESET_USB30_AHB		8
+#define RESET_USB30_VCC		9
+#define RESET_USB30_PHY		10
+#define RESET_QSPI		11
+#define RESET_QSPI_BUS		12
+#define RESET_DMA		13
+#define RESET_AES		14
+#define RESET_VPU		15
+#define RESET_GPU		16
+#define RESET_EMMC		17
+#define RESET_EMMC_X		18
+#define RESET_AUDIO_SYS		19
+#define RESET_AUDIO_MCU		20
+#define RESET_AUDIO_APMU	21
+#define RESET_HDMI		22
+#define RESET_PCIE0_DBI		23
+#define RESET_PCIE0_SLV		24
+#define RESET_PCIE0_MSTR	25
+#define RESET_PCIE0_GLB		26
+#define RESET_PCIE1_DBI		27
+#define RESET_PCIE1_SLV		28
+#define RESET_PCIE1_MSTR	29
+#define RESET_PCIE1_GLB		30
+#define RESET_PCIE2_DBI		31
+#define RESET_PCIE2_SLV		32
+#define RESET_PCIE2_MSTR	33
+#define RESET_PCIE2_GLB		34
+#define RESET_EMAC0		35
+#define RESET_EMAC1		36
+#define RESET_JPG		37
+#define RESET_CCIC2PHY		38
+#define RESET_CCIC3PHY		39
+#define RESET_CSI		40
+#define RESET_ISP_CPP		41
+#define RESET_ISP_BUS		42
+#define RESET_ISP		43
+#define RESET_ISP_CI		44
+#define RESET_DPU_MCLK		45
+#define RESET_DPU_ESC		46
+#define RESET_DPU_HCLK		47
+#define RESET_DPU_SPIBUS	48
+#define RESET_DPU_SPI_HBUS	49
+#define RESET_V2D		50
+#define RESET_MIPI		51
+#define RESET_MC		52
+
+/*	RCPU resets	*/
+#define RESET_RCPU_SSP0		0
+#define RESET_RCPU_I2C0		1
+#define RESET_RCPU_UART1	2
+#define RESET_RCPU_IR		3
+#define RESET_RCPU_CAN		4
+#define RESET_RCPU_UART0	5
+#define RESET_RCPU_HDMI_AUDIO	6
+
+/*	RCPU2 resets	*/
+#define RESET_RCPU2_PWM0	0
+#define RESET_RCPU2_PWM1	1
+#define RESET_RCPU2_PWM2	2
+#define RESET_RCPU2_PWM3	3
+#define RESET_RCPU2_PWM4	4
+#define RESET_RCPU2_PWM5	5
+#define RESET_RCPU2_PWM6	6
+#define RESET_RCPU2_PWM7	7
+#define RESET_RCPU2_PWM8	8
+#define RESET_RCPU2_PWM9	9
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

