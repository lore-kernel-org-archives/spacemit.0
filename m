Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD7E332901
	for <spacemit@lists.linux.dev>; Wed, 18 Mar 2026 03:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773806153; cv=none; b=WtOBAZl/eXCpyoMjfC9gxxh8o/9oRsNHrvatLgPeUWNUkMeMldcRodpDfeJj3qBJZFks6FtiHlbj2+YAq8KvoTVCDvsN2HMJbBFCJnLvyx2N0oQQN51BQ3IAPON5jZMaJ8sogDg5gkqfet1AnMLvQ14xz0fLB5qdJr+v+p8w4FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773806153; c=relaxed/simple;
	bh=mI0UTQTFyydL5AF3hfwBJNQ/hN19Ke0ueoSUzQPL7go=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gqkj1SdtyzWd/ezIfUVTHUNkAfg+sDA38FCabkm1c81ikQO+iBYwxQEPoygFc4vVBwP7soqtIVWpDT1yuf02n0amc7ibprwqdXo/6GFfK10hyvg0xqoeJupluHvpZFzVFCb+VTMBaQ81oJMH0CTd9RUg0sQHRA5P9dCh6qEm6xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1MnYne5; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1MnYne5"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c741db5d610so281982a12.3
        for <spacemit@lists.linux.dev>; Tue, 17 Mar 2026 20:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773806151; x=1774410951; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HGg8UMXiibHicTB4X6nMgZmWgmaItFkW8YY/rwE261o=;
        b=A1MnYne5tMhHZiVmosY3+JEE9W0sHjJL+Ob6eFAXWdqqkKv9Yw/WhRwB4c8mfr3H7n
         szsppW5k1wPdkhLI3Gf/9LRtm65/1NCIiLv3qEkqMRzsm4rTtbIGTbuoAiLNiqhKdlaX
         PlHNZubwWPw2h+2NVBY9nXPGz4UxTZNPt602UHek9Ggq7VPg+SoeKExzelHTBu2xP9PI
         uZLfMP2MelIeToPocU0XkxcHFmNVQyWkHhdGlTaVYxmi0tVfg4fefQl0V7IcnSy+/IxJ
         wN06/Bq7BH2y5fKdgN/wK4PBOtNGYANlmBkoeqtL7HqBl3OjTcsKfp0ZP8RE8E7FHxWl
         eHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773806151; x=1774410951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGg8UMXiibHicTB4X6nMgZmWgmaItFkW8YY/rwE261o=;
        b=aUVDy0N1BvnCRLuZ2lh08PIu6PctmHe9vV0DGzKGtyrgqxaO2mhQ3N0cWxv21AgbYh
         eoTNGoi/X7VObbk7LxPc1zbmCVkasehECR6uIv/qeFF8BPxPJBTepZOQb5hU62ZfOIgb
         596EuA7sdwHoCVV9yhGYqwfdNxx7P+3nfDKChr2mY47gY8sRX7xJ62Oy96nLnZ0ty/+6
         5XULtM/q1xogkREIwH8/ldZ7dTJariqTWL01hMlXxZUoUBygtYKsSq4UXizd7TVICooB
         frFB8hyNu0ivh1U+B5N1e0Q6WSTMJ4q6NKSJ1/6tlJOWeSpjMB0k5RXRGwHnQC5mcOt7
         8/ng==
X-Forwarded-Encrypted: i=1; AJvYcCUfVcXvIrNHkqfbTvxbElT+eQGf9PjYkjIAC81DqEcGR6oPpavZiHWbk9Ngr8OnSkA8muNCsUYxhA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxrlSiCkmXEXLHicZir6i6T09jrKdAplatiDDGp+4qFj9sbPeW6
	Dce82wwTTcBqnvrEm+4CSQas4O/4FaUyjtRpiDFgWFfYkwnDi1FL1jle
X-Gm-Gg: ATEYQzwUbMmrQBcGP1Yabr+qCBdCYjqfY8fAEWiYU+MRRE4APDfer4OZDSIRYuceHIW
	yI18Jk45p5mj7yuNxiAUiToYShj0W30ixmFvCEfgc5ec1r9WFkqdiPiPHaLF8e2z3s2poZGkF7L
	omRBtCofP7+dfL0GiSpOQBeQYqdXBaMBeCrZAvcPY0lginEff4nlM8qiOXgkmJVRZbHkuOFk42x
	ZrEB5NMpZgQZ78VO/GdEj15A+mFJdswv83msMjflMS2VhnsNnskOb5u0uzD2iyQP0GrFfnK+dCg
	BAbOqYa8cZuj/eG8voESGFGgJDgcN8gAYl1BBt225cncjAPeyeJJNkuxt8bgLPwCGqB5XIsNWe+
	ctU/p6L7XXdJsxgKYbe63H8adkTYyT1uF8slsZyxttxxjtyPdutojU9HOc5S9FzEnJg9QDPQqDz
	hBTiYLwbs7XmEsVB0UXG00aPM=
X-Received: by 2002:a05:6a20:2d2b:b0:398:9ae9:7112 with SMTP id adf61e73a8af0-39b99ca188cmr1709226637.1.1773806151105;
        Tue, 17 Mar 2026 20:55:51 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e587078sm928140a12.32.2026.03.17.20.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 20:55:50 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3] riscv: dts: spacemit: Add ethernet device for K3
Date: Wed, 18 Mar 2026 11:55:41 +0800
Message-ID: <20260318035542.517554-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add all ethernet device nodes for K3 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
Require the following patch series:
1. Basic DT device patch
https://lore.kernel.org/spacemit/20260304-01-dts-uart-full-v1-0-50a0aa53a245@kernel.org
2. Ethernet driver patch
https://lore.kernel.org/spacemit/20260316010041.164360-1-inochiama@gmail.com

Changed from v2:
1. keep aliases in alphabetical order.

Changed from v1:
1. remove interrupt-parents property
2. add aliases for ethernet node
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  25 +++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi |  48 +++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 104 +++++++++++++++++++
 3 files changed, 177 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b691304d4b74..28e86e8df4d3 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -4,13 +4,19 @@
  * Copyright (c) 2026 Guodong Xu <guodong@riscstar.com>
  */

+#include <dt-bindings/gpio/gpio.h>
+
 #include "k3.dtsi"
+#include "k3-pinctrl.dtsi"

 / {
 	model = "SpacemiT K3 Pico-ITX";
 	compatible = "spacemit,k3-pico-itx", "spacemit,k3";

 	aliases {
+		ethernet0 = &eth0;
+		ethernet1 = &eth1;
+		ethernet2 = &eth2;
 		serial0 = &uart0;
 	};

@@ -24,6 +30,25 @@ memory@100000000 {
 	};
 };

+&eth0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_cfg>;
+
+	phy-mode = "rgmii-id";
+	phy-handle = <&phy0>;
+	status = "okay";
+
+	mdio {
+		phy0: phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <1>;
+			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <10000>;
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
new file mode 100644
index 000000000000..414ee221d3d7
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2026 SpacemiT (Hangzhou) Technology Co. Ltd
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+#define K3_PADCONF(pin, func) (((pin) << 16) | (func))
+
+&pinctrl {
+	gmac0_cfg: gmac0-cfg {
+		gmac0_base_pins: gmac0-0-pins {
+			pinmux = <K3_PADCONF(0, 1)>,
+				 <K3_PADCONF(1, 1)>,
+				 <K3_PADCONF(2, 1)>,
+				 <K3_PADCONF(3, 1)>,
+				 <K3_PADCONF(6, 1)>,
+				 <K3_PADCONF(7, 1)>,
+				 <K3_PADCONF(11, 1)>,
+				 <K3_PADCONF(12, 1)>,
+				 <K3_PADCONF(13, 1)>;
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+
+		gmac0_rgmii_add_pins: gmac0-1-pins {
+			pinmux = <K3_PADCONF(4, 1)>,
+				 <K3_PADCONF(5, 1)>,
+				 <K3_PADCONF(8, 1)>,
+				 <K3_PADCONF(9, 1)>,
+				 <K3_PADCONF(10, 1)>;
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+
+		gmac0_int_pins: gmac0-3-pins {
+			pinmux = <K3_PADCONF(14, 1)>;
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+	};
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 6cc31e94c13a..4c0cc135dc09 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -5,6 +5,7 @@
  */

 #include <dt-bindings/clock/spacemit,k3-clocks.h>
+#include <dt-bindings/reset/spacemit,k3-resets.h>
 #include <dt-bindings/interrupt-controller/irq.h>

 /dts-v1/;
@@ -437,6 +438,109 @@ soc: soc {
 		dma-noncoherent;
 		ranges;

+		gmac_axi_setup: stmmac-axi-config {
+			snps,wr_osr_lmt = <0xf>;
+			snps,rd_osr_lmt = <0xf>;
+			/* max axi burst len is 256 */
+			snps,blen = <256 128 64 32 16 0 0>;
+		};
+
+		eth0: ethernet@cac80000 {
+			compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
+			reg = <0x0 0xcac80000 0x0 0x2000>;
+			clocks = <&syscon_apmu CLK_APMU_EMAC0_BUS>,
+				 <&syscon_apmu CLK_APMU_EMAC0_1588>,
+				 <&syscon_apmu CLK_APMU_EMAC0_RGMII_TX>;
+			clock-names = "stmmaceth", "ptp_ref", "tx";
+			interrupts = <131 IRQ_TYPE_LEVEL_HIGH>,
+				     <276 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_wake_irq";
+			resets = <&syscon_apmu RESET_APMU_EMAC0>;
+			reset-names = "stmmaceth";
+			rx-fifo-depth = <8192>;
+			tx-fifo-depth = <8192>;
+			snps,multicast-filter-bins = <64>;
+			snps,perfect-filter-entries = <32>;
+			snps,aal;
+			snps,tso;
+			snps,txpbl = <8>;
+			snps,rxpbl = <8>;
+			snps,force_sf_dma_mode;
+			snps,axi-config = <&gmac_axi_setup>;
+			spacemit,apmu = <&syscon_apmu 0x3e4 0x3e8>;
+			status = "disabled";
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		eth1: ethernet@cac82000 {
+			compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
+			reg = <0x0 0xcac82000 0x0 0x2000>;
+			clocks = <&syscon_apmu CLK_APMU_EMAC1_BUS>,
+				 <&syscon_apmu CLK_APMU_EMAC1_1588>,
+				 <&syscon_apmu CLK_APMU_EMAC1_RGMII_TX>;
+			clock-names = "stmmaceth", "ptp_ref", "tx";
+			interrupts = <133 IRQ_TYPE_LEVEL_HIGH>,
+				     <277 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_wake_irq";
+			resets = <&syscon_apmu RESET_APMU_EMAC1>;
+			reset-names = "stmmaceth";
+			rx-fifo-depth = <8192>;
+			tx-fifo-depth = <8192>;
+			snps,multicast-filter-bins = <64>;
+			snps,perfect-filter-entries = <32>;
+			snps,aal;
+			snps,tso;
+			snps,txpbl = <8>;
+			snps,rxpbl = <8>;
+			snps,force_sf_dma_mode;
+			snps,axi-config = <&gmac_axi_setup>;
+			spacemit,apmu = <&syscon_apmu 0x3ec 0x3f0>;
+			status = "disabled";
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		eth2: ethernet@cac8e000 {
+			compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
+			reg = <0x0 0xcac8e000 0x0 0x2000>;
+			clocks = <&syscon_apmu CLK_APMU_EMAC2_BUS>,
+				 <&syscon_apmu CLK_APMU_EMAC2_1588>,
+				 <&syscon_apmu CLK_APMU_EMAC2_RGMII_TX>;
+			clock-names = "stmmaceth", "ptp_ref", "tx";
+			interrupts = <130 IRQ_TYPE_LEVEL_HIGH>,
+				     <278 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_wake_irq";
+			resets = <&syscon_apmu RESET_APMU_EMAC2>;
+			reset-names = "stmmaceth";
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <4096>;
+			snps,multicast-filter-bins = <64>;
+			snps,perfect-filter-entries = <32>;
+			snps,aal;
+			snps,tso;
+			snps,txpbl = <8>;
+			snps,rxpbl = <8>;
+			snps,force_sf_dma_mode;
+			snps,axi-config = <&gmac_axi_setup>;
+			spacemit,apmu = <&syscon_apmu 0x248 0x24c>;
+			status = "disabled";
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k3-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
--
2.53.0

