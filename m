Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09C618C907
	for <spacemit@lists.linux.dev>; Fri, 28 Mar 2025 21:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743195764; cv=none; b=K/1avnY14qhBxzUoc9goqUWE1cvt0S9HYHfSc3Jpa7KJ4AN/KJj8MGseqgISC3PYALSPWTwrLhskHQDTT2SMIil89HKgUxL2+PZ3gntfTtWtA/fGQsYciuBHqfWvgS21Q71CdG2oYTx9/W1dZ6L0XIldH07PMrpnTGi0yP/lCa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743195764; c=relaxed/simple;
	bh=GyqZ2MNwSjTkp/lvZiB/I3umjs94/62JYLwvXmqjf04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YOFkMH/vcwNRMx5LhAHLqwrIJvGIwHejrfNbQMUUlWBTjBU9QYUSuDNw+5+VKsLSoPN6qvUBpOuPTT6OIKEWuSL5uOaD2uPC61z1tkPRJJXFJ71iy7zqfCudEEs+iIL1mH0pDmWiR2MpUp5obN1UmMurs6OjzQ2us2peulRxun0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=mhcf9uYJ; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="mhcf9uYJ"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3d45503af24so22955875ab.2
        for <spacemit@lists.linux.dev>; Fri, 28 Mar 2025 14:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1743195759; x=1743800559; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+I4R8hFY8nbTjxThMP1fCn2I0A92HjRa+9lI35yvdA=;
        b=mhcf9uYJGk+Mb+TbnhQVUc8UMW3abrGGjAnwf0UcWL0ycKgDMHCb+fqQ21v2yAeUHo
         zd3hsTL6taBD3YitGqjiz9vMOhBSZRC/7LKULPBzx/0D8U7tCwL6Ot4vgUllwV3iMhfv
         dPQeybd3mx/OWIGrzeSUAmlNlcvjMpySWUjEQMH54ncZpPjA02G8c0Xo59sUY0h7CNen
         1rwa1WIMfW+RNjxBEAjlBCryJSQN+goFfPrc8XXBx8tjhE3sKCFNl2MvD398JlYy3fBP
         WBifB8z3vEI3bmULe96jR7y9IWHgWtdQyPB1L2SLJl4Qz7KLtjYkbslMZFoesa+NpThf
         4gfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743195759; x=1743800559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D+I4R8hFY8nbTjxThMP1fCn2I0A92HjRa+9lI35yvdA=;
        b=GEGVrnCUnlJrTdscC71yzrGblwLqcejt0xi9RxVU5bSYHF8mGSiO7k8RE8E5SG7C1S
         Ew9i2NXEGmqC+toenRIDA7jSj/sWLIZ/Ua2G2Oyzbe6aokIDwlcG4cOeAPHaPpzlCfos
         JKguckEU/Nn9Xm+YZ6uJv/yQCioJCTvqlUMlUny334QjxXK212hxeOVz1NWVnbyI3xyC
         s6XaiWNIu5sQ4q96vDUjq7yTdjvEg2EEFBcmftIXmkMlg45SfZ28nNggqN/HR9EY21Vn
         0jarFei26ywh/OWjzoFLawgW9D1r5uImqdwo2mxnCg1vC6Bjt9fiKPOqwZ0vFnkPOhjd
         t+fg==
X-Forwarded-Encrypted: i=1; AJvYcCUTNWExSC9TlmTuhBmeysO6jaK3uD5SQMWNXE43yJ77iGkdUhCtOvD3pJa6v/2Y8iMauTttifejxA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzcoWuK9DlUYws/7se4s4waVDng1E6eQnyQBHtufkJELT65M7G6
	3rUL/LXY1JWu7GbncLTHw19ZTO7vAUanQlnaXedT8k5fKpdzGQEjIe0w3twhB3I=
X-Gm-Gg: ASbGnctj0O21bwF9OzcCLlMD3CdUawNkvhpp1EeT07plDcgzQE5EOG4R62n095xQMb0
	cxUZ21zM43YefLUXAFQicDxj7kMmNSpBECBFPQB5uwHRwnfn8HHp0GeXT0JKYdKBvFRarxp25Fc
	yobqiHp4fVAaq5oPxoQL3zS+rTj+TIHwye1RckxNy9dgceFShehymvRvlSjnJmWQtuqMSF0LCHo
	TcOIQt12INI6LXm7WKmjtCj7fOZkTcJSl2esTAFMSNa6L59K37VPXellNp+98pNPF+1Z7iERCjM
	PG7d2t0mqoIel/x2C9Vj2KBX9wA2bI//+G1B9rkpcHGlXFEQjHvhvY4pRbkgVLsgWeTFg3tk9sk
	a7g56StDgibGJmHJMVIp3enW1dHlS
X-Google-Smtp-Source: AGHT+IGrCkE4ALBvVvYXuJ5uIYIbMnM60Ht0P6jdptpmfqvQjmweZFQXjhwRhsQczTG2B1yYskoZYw==
X-Received: by 2002:a05:6e02:3c85:b0:3d3:f7ed:c907 with SMTP id e9e14a558f8ab-3d5e09e4ad6mr11092245ab.15.1743195758716;
        Fri, 28 Mar 2025 14:02:38 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d5d5a74286sm6769405ab.39.2025.03.28.14.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 14:02:38 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
Date: Fri, 28 Mar 2025 16:02:26 -0500
Message-ID: <20250328210233.1077035-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328210233.1077035-1-elder@riscstar.com>
References: <20250328210233.1077035-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are additional SpacemiT syscon CCUs whose registers control both
clocks and resets:  RCPU, RCPU2, and APBC2. Unlike those defined
previously, these will initially support only resets.  They do not
incorporate power domain functionality.

Define the index values for resets associated with all SpacemiT K1
syscon nodes, including those with clocks already defined, as well as
the new ones (without clocks).

Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v2: - Names are now RESET_* rather than RST_*
    - Added Rob's Reviewed-by tag

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  13 +-
 include/dt-bindings/clock/spacemit,k1-ccu.h   | 128 ++++++++++++++++++
 2 files changed, 137 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
index 07a6728e6f864..333c28e075b6c 100644
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
@@ -57,13 +60,15 @@ allOf:
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
 
 additionalProperties: false
 
diff --git a/include/dt-bindings/clock/spacemit,k1-ccu.h b/include/dt-bindings/clock/spacemit,k1-ccu.h
index 4a0c7163257e3..a4f68cba44d1b 100644
--- a/include/dt-bindings/clock/spacemit,k1-ccu.h
+++ b/include/dt-bindings/clock/spacemit,k1-ccu.h
@@ -78,6 +78,9 @@
 #define CLK_APB			31
 #define CLK_WDT_BUS		32
 
+/*	MPMU resets	*/
+#define RESET_WDT		0
+
 /*	APBC clocks	*/
 #define CLK_UART0		0
 #define CLK_UART2		1
@@ -180,6 +183,59 @@
 #define CLK_TSEN_BUS		98
 #define CLK_IPC_AP2AUD_BUS	99
 
+/*	APBC resets	*/
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
 /*	APMU clocks	*/
 #define CLK_CCI550		0
 #define CLK_CPU_C0_HI		1
@@ -244,4 +300,76 @@
 #define CLK_V2D			60
 #define CLK_EMMC_BUS		61
 
+/*	APMU resets	*/
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

