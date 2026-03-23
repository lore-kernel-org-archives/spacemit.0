Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A658E248166
	for <spacemit@lists.linux.dev>; Mon, 23 Mar 2026 22:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774304169; cv=none; b=kUe1ADgEdd2N79bNeljjzD8s6qIug6pJ/ho7S8HJbS8ALXKUWQLsnqCjPXiC60AjmvGQb/fbZ1bVyPxm0vZaYATBrsgjx1YMz4n3DGPJI7YrHmf32uCKEg6fe/nfjdOWHDeslwcxBO5uDj8Jg2fp5Jl6shh8xSh1KdA7mH9GFY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774304169; c=relaxed/simple;
	bh=pCVjCBdGs4rhG9JmcFfyqvNqUUpVYeTeGY0ZLE09ku0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YDWxqDPnd3vlgiI7okWMO82ltgpGiT9EfRbjGsZ3nRQbJgfEHE+ZYvROVHWZZHwR4hFunCFV3eqm/QYgPGYI4hXcIX3Oos7bDXH7es3KdEhv5aKNPC6EOCj7nyv0zcE/YDBlpJ7yS9tYayRT7Oi8GEd/SAUDMFKcXtNFLSt9ZLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3sxPLJQ; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3sxPLJQ"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82c4b5dfe6cso677796b3a.2
        for <spacemit@lists.linux.dev>; Mon, 23 Mar 2026 15:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774304168; x=1774908968; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9m3F51Q6kwdNP6pHh7F00fvfJerf3+vjJK3BMKjsK5E=;
        b=F3sxPLJQDWbwbIW52yF/PPzVM4KE3SMGFyj0RNUTqLmgIwgMTXusfqz+S1iX+YPkpz
         3Hz0DznxlcwWD0A4SD/ru5n68tvembTZLaPAajjYvEMyZSeVOAWWW4Y2H72zMVOBZdbV
         uddNQCAzJI+T5L3ZXXZZ7mMl0zlkYweCUoGxY3iuBA+svSLGazbiNNp6aTseFsg18cf9
         EpIi0yFFNu5J+QGVuqix5k+ynaT+Pv6SC6wYQoiOaxlkMFlokjHqu6TogoHNVBXc/GJZ
         yboR4iybVD7Hvw/+QNwiMoWbu7e9mCaw29QM8UjWn0i9InNy/91Ec5lm7/XE+oq/E/zI
         vciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774304168; x=1774908968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9m3F51Q6kwdNP6pHh7F00fvfJerf3+vjJK3BMKjsK5E=;
        b=H9WHv7fE5gZ96iHc7VOt6CfUwuUIBeLotDvd4nhbU9jDw0aNpUZxOEO60YCA9HVtAC
         RbVzX9d0zjMrt5e/hBH1wgauPEIcwZ8g1/4O4mXDwXFPzT+EXSBg3smZFIiaG+woR21+
         YZJjzjxuHXVaUhPA/DqWAZLJmenjOJrlcv9CxYO2EF5E0flBXM9vKERXc9xuFsXNm6Jx
         cb5dbYgX3ItWIJ7j/4QEJeDt7L0o9Rxtl07h72bhbaHqc1eHjMtdi1q3OQBLPtgbz9TT
         dJph8LkWjBAqMThP6nEzTED9v2X6IBVhSJEKeQjJzVmPUnL3MMhQT6ZA/UzekSCEm2wE
         ODSw==
X-Forwarded-Encrypted: i=1; AJvYcCUMhFBW7sdq6ddKhUYgQrmuLIngg2d3HHacJO7TtiZlf/tISLE+n09P6ByVRMks8dwG9rRF8SPNHw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwHiGyDSXwmrq55DERVvCSaI8JXkbIjk/l3MwiOentIISu1P+cY
	8CswtAdspf5A/UFVgYNYkGTAQeUeblwUNgL8depgIMvPSds/Q/VvNRLO
X-Gm-Gg: ATEYQzwsfd/IytbXYD3HTqmJidag1dTuttY+aPHKC5zAFnmeOl2ukOU7JnMptp24UlD
	aCZ2rhQp784ty7Cd69mvPHXJOm+8fxt2aZntvevM7/h9SIAw/Wx7zHWhNuBZyJ/Gq8uRRkS4NE1
	3HGsrVf5C2xUD2vAF/WHfZUJSTX4SNA0/oh7+QayCtpmDQBIo6V1YZEAgn+qXEukslSfUS+2XXq
	ykkXiJxRaeKl+tX85X5bBtXC4guWhU9Ke7XlhmZlrfHWWnmGlHANV7FTCpx3BxBFqX9BsJdtiVJ
	RGZO0JrW72Et1wmcX7X79bci4OIqa8cQ7kBehJ25g3fSnHuWV5VT3wpcCY+G4FPpwzkfZu4n9J1
	3qfW+filemeOLcb9mgJKFO29gmXvQjEOacREqQF/3ROKRJuWdC340TWYutkJhxD3/k0bVpAe6xT
	Ae3dUGWQ65a0Fq1aZsb7gXv+U=
X-Received: by 2002:a05:6a00:f88:b0:81f:852b:a91e with SMTP id d2e1a72fcca58-82a8c39ec60mr10913536b3a.59.1774304167832;
        Mon, 23 Mar 2026 15:16:07 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0410a3d7sm10814295b3a.55.2026.03.23.15.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:16:06 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4] riscv: dts: spacemit: Add ethernet device for K3
Date: Tue, 24 Mar 2026 06:15:51 +0800
Message-ID: <20260323221552.79937-1-inochiama@gmail.com>
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
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  24 +++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi |  44 ++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 104 +++++++++++++++++++
 3 files changed, 172 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b691304d4b74..b63d86b72be6 100644
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

@@ -24,6 +30,24 @@ memory@100000000 {
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
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
new file mode 100644
index 000000000000..e02254961764
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -0,0 +1,44 @@
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
+	gmac0_rgmii_0_cfg: gmac0-rgmii-0-cfg {
+		gmac-rgmii-0-pins {
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
+		gmac0-3-pins {
+			pinmux = <K3_PADCONF(14, 1)>;   /* gmac0_int */
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

