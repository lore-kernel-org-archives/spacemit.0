Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814FE3CE4A2;
	Wed, 20 May 2026 23:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779320764; cv=none; b=WwI+sMNwLszx5fpoGXchOEmneCcKRnI3osTHPmGZ+hf7xX7htCpcMIod/5/DcQXdcMCTSsivfUydWSH+qPLsM9OcccKw9THViztXmTZLpqdv+PFh9w3A15VLj4gqr1dFRZ1im+V1SQC6kWMwhKNJjG25XB/9+BSIoqGCxeI7lAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779320764; c=relaxed/simple;
	bh=pCoM421K8kgqKzsXzQD0fy74WvtHahuTLCXv0h16ijE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Am1RFwtM8oI0FtF3e2AhkhZp0Zr7huA7smS6tyKwqCPjhZqWDKwq/NsTK45ugZzeIw7031cu+dyHofdHMzR1/gcASApKWpBicpm97aPB2jULa5VrsFwWf5+MWhq0PnDfbXGsVrbrmJet7E6B9qwepy1q6eIZRJlrhpvtaL4Uoiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QtsUeWxZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QtsUeWxZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3B7D1F00A3A;
	Wed, 20 May 2026 23:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779320754;
	bh=szDZdNAgveKUHUTIebhoFRjDlb6oPtf/oFq+3CG0hf8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QtsUeWxZzY5IdiJWjJfUqYIrY/YjPGXGQ9GCfeQj5Js5m7J462Arufe4P6KDHc4mh
	 VYLBuCAiMZWN2sEdozGsEW+Fq6dhiby/shmoCAUx6fE5ngw2m1Wb+qQnz6KXJyRmGD
	 EqySHSHAwvmvzDGtn2YfCLam5XVhJyUkHV2dRZA1PlF+iigZokwtms7+z6VLXulIBl
	 JdaVtMzIfLuZ0q7af6ffv51cOsHLkOtNXxEJlgcOtFXi1mugS+c+vtfiuwmSqHsE7w
	 uCM+IB9wcrfrBzaxYWatXSL2d1eZH5mogryUvJ7mWywafx/gj9ygYEr2sW7XmTOiG3
	 YATfc/ULfYsWA==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 20 May 2026 23:45:28 +0000
Subject: [PATCH v2 2/2] riscv: dts: spacemit: k3: Initial support for
 CoM260-IFX board
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-02-k3-com260-ifx-v2-2-d55095457cf0@kernel.org>
References: <20260520-02-k3-com260-ifx-v2-0-d55095457cf0@kernel.org>
In-Reply-To: <20260520-02-k3-com260-ifx-v2-0-d55095457cf0@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8318; i=dlan@kernel.org;
 h=from:subject:message-id; bh=pCoM421K8kgqKzsXzQD0fy74WvtHahuTLCXv0h16ijE=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqDken/05dOPbfuzd1fFBzNWddhAqh795YKXLVd
 k3uLtfsEbyJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCag5HpxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0E4A/9FWqJ0lrXy1OXxvLgwARuJnZC9GJbYfml+YnsteaqLGa2oWo937tdi
 GGZRv52dcp0luyGQ+SmI4xlzzbN41W/Qdkpwi3nwicTPFsADWYTlneZLDwwCLM4KepyVRPFP/p+
 9qhV0t9qln9cdn6koLp42sYwuc2xmOV32vVvI8r7pHq1h9+o26pCmyCcqOytAkFap05GAD6ix85
 2rXiuBqz0WLPTkm8nFHn/KcBuCp324najU0NB2vTRl+u/Is8wndYCzOT3tKBIm6aMKoXnBvhiRs
 lvTzWcQSP0LxJtKutisGY+J9ryXtQjtau2lEMAl3VEzu/AJr9R5vO5xECKoK4/0ItvhMKAb0OCJ
 9Q3ik1SsSO9QEuWOIa7Y4Ji7EV3qoqQwcGQ4i5nqoCu/6Xi3dDefD18TCv5Y1NoiSnr+PBzDMxt
 EOD9uFPANOj8dDZ8VTYV3iJDdfMVDV4gfYieUtosha/D699VNHQ6rEOdWA6uEpsP2fjZqg7KIsE
 nR3wXDtb4nGEynnK7tr5TCf55iggWYPJE+Zuhu23ulq7aZaMtULxN+BkGfGBPv5JEs5WZVbu1up
 l4jPn4ep6DQOW76nRrjyNtf5Xfi6VhS4d86L07ir0RJNW18aPuOgBHWnMhSKASS7LyH58DB11Rc
 vmJmeLMHxScfoaznBTM3KqjbdQYGpQ=
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
index 000000000000..a38d7b738258
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
+	pmic@41 {
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
index 23899d3f308a..fbaf71fd7e96 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -45,6 +45,39 @@ gmac0-phy-0-pins {
 		};
 	};
 
+	gmac1_rgmii_0_cfg: gmac1-rgmii-0-cfg {
+		gmac1-rgmii-0-pins {
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

