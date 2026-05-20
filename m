Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC158367B64;
	Wed, 20 May 2026 05:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779255636; cv=none; b=e/6fLOx0SNS5+mB9V807H589L6Fq8b4EeGJyNl++uD0x4Ul/BZGz7qBVSb6UOzwOAcPMpivXqu8i2NfKQ3SQiGFuvQeD0P5D3dpoyjtwclJNJgeFaiuzxenVMlpnjtYvvqwAmEofbmCA6oNR8cQchzMmV5HWPjhSocyJ7PJd2+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779255636; c=relaxed/simple;
	bh=VuooxCFR+YW8anJ4giZslVX0LMLOwsj+bJQuiWE6wPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cQ9AQfL7e3NmH+hhzDEl43XmseZHz9bdPJFN0TtF5t3oLX1cFtyDfHpizvcISLpUXEy2HK27eDXC5cSz3VaBj0+8aRO989jFeR/kCvPTiZ0XPax03fQ86h1/1kfCdG8Acphf8bcnuvY95/r4MjwmaHqv4rz1M37i40gvkpyEx64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LOojaKv3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LOojaKv3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2752B1F000E9;
	Wed, 20 May 2026 05:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779255634;
	bh=cBiAOBqWBPw6WJam/PhetWRcYOFQszAvib0dqlXq/Us=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LOojaKv3t2d+4qbiHKoBgp/pFQlQt1PDoNL3XD6WNbGqEeEqqY7UFjLXMdSNuLaNP
	 hy0HSDae0QpLAFg7yGDGoL93IXKP7+DPLcEYKn9FTrvDG1kCU9wl5l/ULK6WfVEk6t
	 DYIO6964beul5ORUCeVOdz+EJJxEq0fGlc1+FM10RLoSB0/9TfN77K0zmGLDDpppGd
	 aujnD/b5l6Ew9be3Pdoju62jIeTd4gQ1XLQTbfTXHEp49Mon51dyQ9gP3mP+QzXohs
	 8beQ870LMboCwIZIDLlZh1n5pA9vUOvNvRUW+vku0rG09akH4wKcvAy8WA63zqDtZk
	 ZXOW7+1c94Y9A==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 20 May 2026 05:40:10 +0000
Subject: [PATCH 2/2] riscv: dts: spacemit: k3: Initial support for
 CoM260-IFX board
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-02-k3-com260-ifx-v1-2-3e17055dd488@kernel.org>
References: <20260520-02-k3-com260-ifx-v1-0-3e17055dd488@kernel.org>
In-Reply-To: <20260520-02-k3-com260-ifx-v1-0-3e17055dd488@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8327; i=dlan@kernel.org;
 h=from:subject:message-id; bh=VuooxCFR+YW8anJ4giZslVX0LMLOwsj+bJQuiWE6wPI=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqDUlE3qXGrOsMwfv3OROe8uIc+ksaK8wLFqw9j
 S/gr1g4JKGJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCag1JRBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0cnA/9GIpv3Qa90oUS9kTiBQv2yfET2dkfCnt/hnS9PyiF1jAb4ybexTgFE
 Ge9SXMQQowxiOqgMAbEUbAGysK9fIRX/4vkfqqqbMRUaq4w3fi61hl08MHGumQiDYPo0WPwEFUs
 UMjM/JMl+alxe0uiH/oNGRNKS5ZXj2PeXP9pGz4Zx2QNFvo1SMT/F20TlbhGE509zkl9a+Omazj
 QFTeQrtMDhQ7Sw0RqBhwzFndyfTxUhu1dsoFiVIM1RiuyX4REf/0po4hFrEg9T9f9ky5TDldZOm
 9pnTB9GTyGGCeGWLxfUXBBm4npDVXillREXN0ICA6DNaIdAZQkZ2Fg7On4jKDLx+rWcBdcgqxPi
 VhqgYgZSYH9AOFSHRKHXN5IKv9hRhLPZHelFT42neTusPD7Nm3TE4wWemx0GH9tCg9vRJqngmcZ
 Cr9SHDp6MIwsK0wiIuUXqH4EdTnV5dL0C3SKj2Vmvm/+3Pq8FNVuG5rJBoFpZKoEc1EI3VIj08E
 TEE8i9WqHoMkiD4LazAhVWOeJTKcG/eTJV5L2huNMy0NyEf0q+lbAK8IXUq1IxLL9piX8uej9Lt
 rSXwmu7YPPSu51Lh8X5bI+2fRbL1F0+Aqxkk7xw4QUFudXWlAYh86O/qAENIQ1eR81JmMz188uw
 FKg6nEVGlxX5vIU4qep2J7joQs6jtY=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

The K3 CoM260-IFX board combine with one 260 pins "Gold Finger" computer
module with a carrier board. The module integrates the K3 SoC, LPDDR5,
UFS storage, Gigabit Ethernet, Micro SD card, PMIC Chip. The board offers
a comprehensive array of interfaces, including MIPI-DSI, MIPI-CSI,
DisplayPort, SDIO, SPI, I2S, I2C, CAN-FD, PWM, UART, USB, PCIe, and GMAC.

Add initial support for enabling Serial UART and ethernet.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 arch/riscv/boot/dts/spacemit/Makefile          |   1 +
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts |  21 +++
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi    | 190 +++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi   |  33 +++++
 4 files changed, 245 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
index acb993c452ba..28ec9e1e0a62 100644
--- a/arch/riscv/boot/dts/spacemit/Makefile
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -4,5 +4,6 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-r2s.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
+dtb-$(CONFIG_ARCH_SPACEMIT) += k3-com260-ifx.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-deepcomputing-fml13v05.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-pico-itx.dtb
diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
new file mode 100644
index 000000000000..238bb03d0e9e
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2026 SpacemiT (Hangzhou) Technology Co. Ltd
+ * Copyright (c) 2026 Yixun Lan <dlan@kernel.org>
+ */
+
+#include "k3-com260.dtsi"
+
+/ {
+	model = "SpacemiT K3 CoM260 IFX";
+	compatible = "spacemit,k3-com260-ifx", "spacemit,k3-com260", "spacemit,k3";
+
+	aliases {
+		serial0 = &uart0;
+		ethernet0 = &eth1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
new file mode 100644
index 000000000000..1801a44d4355
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -0,0 +1,190 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2026 SpacemiT (Hangzhou) Technology Co. Ltd
+ * Copyright (c) 2026 Yixun Lan <dlan@kernel.org>
+ */
+#include <dt-bindings/gpio/gpio.h>
+
+#include "k3.dtsi"
+#include "k3-pinctrl.dtsi"
+
+/ {
+	model = "SpacemiT K3 CoM260 Module";
+	compatible = "spacemit,k3-com260", "spacemit,k3";
+
+	memory@100000000 {
+		device_type = "memory";
+		reg = <0x1 0x00000000 0x4 0x00000000>;
+	};
+
+	reg_5v_sys: regulator-5v-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "P5V0_SYS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+};
+
+&i2c8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c8_cfg>;
+	status = "okay";
+
+	p1@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
+		vin1-supply = <&reg_5v_sys>;
+		vin2-supply = <&reg_5v_sys>;
+		vin3-supply = <&reg_5v_sys>;
+		vin4-supply = <&reg_5v_sys>;
+		vin5-supply = <&reg_5v_sys>;
+		vin6-supply = <&reg_5v_sys>;
+		aldoin-supply = <&reg_5v_sys>;
+		dldoin1-supply = <&buck4>;
+		dldoin2-supply = <&buck4>;
+
+		regulators {
+			buck1: buck1 {
+				regulator-min-microvolt = <1050000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck2: buck2 {
+				regulator-min-microvolt = <1050000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck3: buck3 {
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck4: buck4 {
+				regulator-min-microvolt = <2100000>;
+				regulator-max-microvolt = <2100000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck5: buck5 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck6: buck6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <500000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1: aldo1 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			aldo2: aldo2 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			aldo3: aldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo4: aldo4 {
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo1: dldo1 {
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo2: dldo2 {
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo3: dldo3 {
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo4: dldo4 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+			};
+
+			dldo5: dldo5 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo6: dldo6 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo7: dldo7 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+		};
+	};
+};
+
+&eth1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac1_rgmii_0_cfg>, <&gmac1_phy_0_cfg>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&phy1>;
+	status = "okay";
+
+	mdio {
+		phy1: phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <1>;
+			reset-gpios = <&gpio 1 5 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <10000>;
+		};
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_0_cfg>;
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 23899d3f308a..04efe64b8a3a 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -45,6 +45,39 @@ gmac0-phy-0-pins {
 		};
 	};
 
+	gmac1_rgmii_0_cfg: gmac1-rgmii-0-cfg {
+		gmac1_base_pins: gmac1-0-pins {
+			pinmux = <K3_PADCONF(21, 1)>,	/* gmac1_rxdv  */
+				 <K3_PADCONF(22, 1)>,	/* gmac1 rx d0 */
+				 <K3_PADCONF(23, 1)>,	/* gmac1 rx d1 */
+				 <K3_PADCONF(24, 1)>,	/* gmac1 rx_clk */
+				 <K3_PADCONF(25, 1)>,	/* gmac1 rx d2 */
+				 <K3_PADCONF(26, 1)>,	/* gmac1 rx d3 */
+				 <K3_PADCONF(27, 1)>,	/* gmac1 tx d0 */
+				 <K3_PADCONF(28, 1)>,	/* gmac1 tx d1 */
+				 <K3_PADCONF(29, 1)>,	/* gmac1 tx clk */
+				 <K3_PADCONF(30, 1)>,	/* gmac1 tx d2 */
+				 <K3_PADCONF(31, 1)>,	/* gmac1 tx d3 */
+				 <K3_PADCONF(32, 1)>,	/* gmac1 tx_en */
+				 <K3_PADCONF(33, 1)>,	/* gmac1 mdc */
+				 <K3_PADCONF(34, 1)>;	/* gmac1 mdio */
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+	};
+
+	gmac1_phy_0_cfg: gmac1-phy-0-cfg {
+		gmac1-phy-0-pins {
+			pinmux = <K3_PADCONF(35, 1)>;	/* gmac1 int */
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+	};
+
 	/omit-if-no-ref/
 	i2c8_cfg: i2c8-cfg {
 		i2c8-pins {

-- 
2.54.0

