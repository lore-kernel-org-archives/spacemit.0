Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C811535836E
	for <spacemit@lists.linux.dev>; Thu, 26 Mar 2026 01:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489597; cv=none; b=PtfY2qWB9kPjviYR2qw4XdLMZIuACy1800uAogKKtceCr4Ril0IxpZNnlnt80SHSz1JYHqhIOxQPS53dieVsXLAvkhJYbTisZIjJbZ0mTPpDd621adGTxk3L3LifTVrBgiIUq7ud//WmO7gR+tKOupiYTDy3ArNdcA7Py3bRVvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489597; c=relaxed/simple;
	bh=2JdWtj8jHoziLokeQl/cJ1LmihyFXi4ry53iPjdK6Ak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uigXgdpqI48mYvqZoDeBuRrQ+yqumgdWHRvU0cDSXJ+hzkv3oWBcj7aHqLJr376ATmuKGk9+F5FYFIXxEg6r/vOUnYkD0m2pd3ndWIQZVGnnaAYwHei9oVjBcXYDv0Fz+6lCkeKabJNdwOSlMflL0QxpeatFGCI4rgfEzLurh4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IvkwBqK7; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IvkwBqK7"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35c206f0481so73183a91.0
        for <spacemit@lists.linux.dev>; Wed, 25 Mar 2026 18:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774489595; x=1775094395; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FvrpaPMv4wQW9rLV6Y/lNvOSwC23X2i4bR0ncVYXo34=;
        b=IvkwBqK7pgs2hF0q4QcuqwQxZWW3lG3BFvJKupp26guVcc1wm/UBcunEiTBU2VGu/p
         AGDHxrNTIFwrjOtx/SnDp0NHWC18psiqWxvAN6jMns31XeQuKlG1ndDzURo8K48oSU8H
         91GcXGUtoCtEfAuLk54WbKGa8JBHSTdcuT5mfiKbxltA8083SlMnf0Q4vInx8Kiy21mn
         T6fcPixyN+v7LGL2UA+XnQzX0dtRhdvOrZIhWbh/JTpOP1gspCZwiTObQwaRQA0pVgZo
         94l03mcDrgZsa2icxNJNWY9al4+F7OImigHtgcKZQRIy0x6vbFhP0EavsgL4VinfNK+F
         GfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774489595; x=1775094395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvrpaPMv4wQW9rLV6Y/lNvOSwC23X2i4bR0ncVYXo34=;
        b=fIGe0vlJ2lG1fd7Z8/qyA7eEaBSm7OeNKjrYIGw0DvULLW2btGs6SMtkb/GAu8nzzl
         E1WdXEG0B4MF1Z57BfytV6UA79xPHLV9Mlju8giJvc0x13M3XTG37zMSIWFZ8JPdE8gl
         mgIQgXWxQ6oGocy8a73A5hulpAku2RGJYsYNu9zTW3zAmeQuO4t4td6/ZV73wBi6n2Se
         MWSF25HcSzAIeif5vxARN1eR6cnMhQw7dFyxSbZunkrEeKN+TELVU+Xgn6rrhdWaxGQ8
         TeCkVr6judurDIv/ryay/m6yReaqpX5lKmQ7uIYqkzTQOTQFaqF+v6B0gmODTPYAMZBf
         orHA==
X-Forwarded-Encrypted: i=1; AJvYcCWKVYa+eISf9vkTdSh75VqeAjA4tLnlqCLD9XleJADp653IDjXvZFKjBPWrAeX0b99D/dyTEoGHUg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2Nl/V5ifUypwWHgBL0mn843pgtHN+6/8T1dJNkK7SS/Uyvq4S
	YKr1anhzOcqaZStc3qbqqOGn4jKkHhW4U5ofxjp5pWSdEVhgOz921IMDGZy1hQ==
X-Gm-Gg: ATEYQzxVODkYYdrCRyMw46Ra8xqpoDWARiotKev1H86avvyKurUPiT1qbzpjiq6S4WY
	ymUIogxPqna2mzBWx9h17Kdgfr/T9B5Vc9rhTohlaF9x4i3yd96ZhbUwifLYWPa7YJbXuH2wVtk
	4ZyF6OPSkmRUGoYqA921Ys2EPqKK+MimB/kmTgWTpLRKlVTWF6cTozsoln0s63m+H76oSgcPeCv
	i1GKx+t1bPiP7LncI+NiJCBdqjgun5JJSAEBx3ShPw1GuF9W9Xx3MptRIldX5n4w1vWH2wGYmnu
	1vGdtIPb+6CY9u+kB5wcLh63gh0qGP/eXrIaF37ygs0ru8mkpaA9APwGElFzdyXeapWBdi5Corl
	8tG96CCv78zFrPo0imvXvLy9xwhjwKej+czW0a60o+Zvo7iPd9QYpStkU9dWcmCT308WAaixvzF
	ywHl6ObS8MKGDZvsLzQjWboNI=
X-Received: by 2002:a17:90b:518e:b0:35b:e56e:a17e with SMTP id 98e67ed59e1d1-35c0dd7ac8amr5444206a91.17.1774489595082;
        Wed, 25 Mar 2026 18:46:35 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c1dd3800bsm569329a91.1.2026.03.25.18.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 18:46:34 -0700 (PDT)
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
Subject: [PATCH v6] riscv: dts: spacemit: Add ethernet device for K3
Date: Thu, 26 Mar 2026 09:46:17 +0800
Message-ID: <20260326014617.1011732-1-inochiama@gmail.com>
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

Changed from v5:
1. Fix DT warning cause by stmmac-axi-config.

Changed from v4:
1. Fix pinctrl pin name
2. Remove alias for disabled node

Changed from v3:
1. Separate the pin as RGMII pin and INT pin.
2. Add comment for pin usage.
3. Rename the ethernet pinctrl node to address it is RGMII node.

Changed from v2:
1. keep aliases in alphabetical order.

Changed from v1:
1. remove interrupt-parents property
2. add aliases for ethernet node
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  20 ++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi |  34 ++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 117 +++++++++++++++++++
 3 files changed, 171 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b098dbd0e7a1..504fe6bd46b2 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -3,6 +3,7 @@
  * Copyright (c) 2026 SpacemiT (Hangzhou) Technology Co. Ltd
  * Copyright (c) 2026 Guodong Xu <guodong@riscstar.com>
  */
+#include <dt-bindings/gpio/gpio.h>

 #include "k3.dtsi"
 #include "k3-pinctrl.dtsi"
@@ -12,6 +13,7 @@ / {
 	compatible = "spacemit,k3-pico-itx", "spacemit,k3";

 	aliases {
+		ethernet0 = &eth0;
 		serial0 = &uart0;
 	};

@@ -25,6 +27,24 @@ memory@100000000 {
 	};
 };

+&eth0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_rgmii_0_cfg>, <&gmac0_phy_0_cfg>;
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
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_0_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index efb0f1572188..a7b5d10c332e 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -11,6 +11,40 @@
 #define K3_GPIO(x)	(x / 32) (x % 32)

 &pinctrl {
+	gmac0_rgmii_0_cfg: gmac0-rgmii-0-cfg {
+		gmac0-rgmii-0-pins {
+			pinmux = <K3_PADCONF(0, 1)>,	/* gmac0_rxdv */
+				 <K3_PADCONF(1, 1)>,	/* gmac0_rx_d0 */
+				 <K3_PADCONF(2, 1)>,	/* gmac0_rx_d1 */
+				 <K3_PADCONF(3, 1)>,	/* gmac0_rx_clk */
+				 <K3_PADCONF(4, 1)>,	/* gmac0_rx_d2 */
+				 <K3_PADCONF(5, 1)>,	/* gmac0_rx_d3 */
+				 <K3_PADCONF(6, 1)>,	/* gmac0_tx_d0 */
+				 <K3_PADCONF(7, 1)>,	/* gmac0_tx_d1 */
+				 <K3_PADCONF(8, 1)>,	/* gmac0_tx_clk */
+				 <K3_PADCONF(9, 1)>,	/* gmac0_tx_d2 */
+				 <K3_PADCONF(10, 1)>,	/* gmac0_tx_d3 */
+				 <K3_PADCONF(11, 1)>,	/* gmac0_tx_en */
+				 <K3_PADCONF(12, 1)>,	/* gmac0_mdc */
+				 <K3_PADCONF(13, 1)>;	/* gmac0_mdio */
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+
+	};
+
+	gmac0_phy_0_cfg: gmac0-phy-0-cfg {
+		gmac0-phy-0-pins {
+			pinmux = <K3_PADCONF(14, 1)>;   /* gmac0_int */
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+	};
+
 	/omit-if-no-ref/
 	uart0_0_cfg: uart0-0-cfg {
 		uart0-0-pins {
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index a3a8ceddabec..5f4818cd5d6d 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -438,6 +438,123 @@ soc: soc {
 		dma-noncoherent;
 		ranges;

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
+			snps,axi-config = <&gmac0_axi_setup>;
+			spacemit,apmu = <&syscon_apmu 0x3e4 0x3e8>;
+			status = "disabled";
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			gmac0_axi_setup: stmmac-axi-config {
+				snps,wr_osr_lmt = <0xf>;
+				snps,rd_osr_lmt = <0xf>;
+				/* max axi burst len is 256 */
+				snps,blen = <256 128 64 32 16 0 0>;
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
+			snps,axi-config = <&gmac1_axi_setup>;
+			spacemit,apmu = <&syscon_apmu 0x3ec 0x3f0>;
+			status = "disabled";
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			gmac1_axi_setup: stmmac-axi-config {
+				snps,wr_osr_lmt = <0xf>;
+				snps,rd_osr_lmt = <0xf>;
+				/* max axi burst len is 256 */
+				snps,blen = <256 128 64 32 16 0 0>;
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
+			snps,axi-config = <&gmac2_axi_setup>;
+			spacemit,apmu = <&syscon_apmu 0x248 0x24c>;
+			status = "disabled";
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			gmac2_axi_setup: stmmac-axi-config {
+				snps,wr_osr_lmt = <0xf>;
+				snps,rd_osr_lmt = <0xf>;
+				/* max axi burst len is 256 */
+				snps,blen = <256 128 64 32 16 0 0>;
+			};
+		};
+
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k3-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
--
2.53.0

