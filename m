Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D274840F8C3;
	Tue, 28 Jul 2026 21:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785273049; cv=none; b=VM8ILo29/Ocl6Q1I7A5v0kVOFBAF9L8knCwE2Pc5DUwbo+CDtImViw2l62lZhVxxAAAXi+m4OYK16UJrTas32OClqpVm/unbSN7qXerYaX0owWU69C1U24Sj08rj48qaOAe1ZhfGOHcuiHNnFaux9UZjNzGQyzOe4D8B6ju4Ox0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785273049; c=relaxed/simple;
	bh=RSV2b68EGyljSXTfN12jVAS7TATHEPTq7UVbiz7AQW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oW2q9PuVNER+CiFRen0wQFMmSyYPdP1C+x0L7/ZXK0VjWddfwn4HKAmMtp1Ki2EQKxOYuV42rnM0pC8e/B7jJOkj1sj14UdXjEhzAP2TXEQYsWTvZhEHw8zsWNNuQKnzMhT2QIvnpEfP/5rBHA28BV3zGAKNFVSRXAJFj8MGerE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=qbHXOkrA; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="qbHXOkrA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=j0vRLViK4h0va8JBpWdKGSCrSlCbJ1GdJq171+LEHdI=; b=qbHXOkrAZiFXClr3eXUUvO99po
	UB450cOZzHSh771gB3zyaba8gKZN0oLbkrNiCuRB5LVjCrqrJ96KCch0m8IsGk24/IisXvyOFDzvB
	5t2DxTeTswzaDGT1EMkOmCIbIFNWl9IFjcqXyv+8yvVDAEgQVRLLbxwjTeiYFNtBHv1T2KEYHjjsU
	SX8Vz/5wS1e0+/75DrqVO2a8IAX7CwANSVZwmbYdBgYYQNf2DckmzHHrQjuOAmhoUcfjEtsLywETH
	FbmcmT+OP7/jEd/sLMyJDqlVfqGUEOt7AQZN0rv4cvIuPyWT2jFesQZtu87x/HNVYckvRSl+7F7Gz
	Lrwt3ILw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wop4R-00000001a4d-0H2c;
	Tue, 28 Jul 2026 23:10:39 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 2/3] riscv: dts: spacemit: Add a common board dtsi for Milk-V Jupiter boards
Date: Tue, 28 Jul 2026 23:05:07 +0200
Message-ID: <20260728211020.1248676-3-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260728211020.1248676-1-aurelien@aurel32.net>
References: <20260728211020.1248676-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a common board dtsi for use by Milk V-Jupiter board variants. It
excludes the CPU operating-points-v2 tables, which should be included in
the board file.

It will be used for the Milk-V Jupiter M1 board.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 .../dts/spacemit/k1-milkv-jupiter-common.dtsi | 469 ++++++++++++++++++
 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 464 +----------------
 2 files changed, 471 insertions(+), 462 deletions(-)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter-common.dtsi

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter-common.dtsi b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter-common.dtsi
new file mode 100644
index 0000000000000..b13d9c5e360be
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter-common.dtsi
@@ -0,0 +1,469 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
+ * Copyright (C) 2025 Javier Martinez Canillas <javierm@redhat.com>
+ */
+
+#include "k1.dtsi"
+#include "k1-pinctrl.dtsi"
+
+/ {
+	compatible = "milkv,jupiter", "spacemit,k1";
+
+	aliases {
+		ethernet0 = &eth0;
+		ethernet1 = &eth1;
+		i2c2 = &i2c2;
+		i2c8 = &i2c8;
+		mmc0 = &emmc;
+		mmc1 = &sdhci0;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led1 {
+			label = "pwr-led";
+			gpios = <&gpio K1_GPIO(96) GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "default-on";
+			default-state = "on";
+		};
+
+		led2 {
+			label = "hdd-led";
+			gpios = <&gpio K1_GPIO(92) GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "disk-activity";
+		};
+	};
+
+	pcie_vcc_3v3: regulator-pcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "pcie_vcc3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
+
+	reg_dc_in: regulator-dc-in-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_12v";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_4v: regulator-vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
+
+	reg_vcc_5v: regulator-vcc-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
+
+	regulator-usb3-vbus-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "USB30_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		vin-supply = <&reg_vcc_5v>;
+		gpio = <&gpio K1_GPIO(97) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	usb3_hub_5v: regulator-usb3-hub-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "USB30_HUB";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&reg_vcc_5v>;
+		gpio = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&combo_phy {
+	status = "okay";
+};
+
+&cpu_0 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_1 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_2 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_3 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_4 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_5 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_6 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_7 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&emmc {
+	bus-width = <8>;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	non-removable;
+	no-sd;
+	no-sdio;
+	status = "okay";
+};
+
+&eth0 {
+	phy-handle = <&rgmii0>;
+	phy-mode = "rgmii-id";
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_cfg>, <&gmac0_clk_ref_cfg>;
+	rx-internal-delay-ps = <0>;
+	tx-internal-delay-ps = <0>;
+	status = "okay";
+
+	mdio-bus {
+		#address-cells = <0x1>;
+		#size-cells = <0x0>;
+
+		reset-gpios = <&gpio K1_GPIO(110) GPIO_ACTIVE_LOW>;
+		reset-delay-us = <10000>;
+		reset-post-delay-us = <100000>;
+
+		rgmii0: phy@1 {
+			reg = <0x1>;
+		};
+	};
+};
+
+&eth1 {
+	phy-handle = <&rgmii1>;
+	phy-mode = "rgmii-id";
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac1_cfg>, <&gmac1_clk_ref_cfg>;
+	rx-internal-delay-ps = <0>;
+	tx-internal-delay-ps = <250>;
+	status = "okay";
+
+	mdio-bus {
+		#address-cells = <0x1>;
+		#size-cells = <0x0>;
+
+		reset-gpios = <&gpio K1_GPIO(115) GPIO_ACTIVE_LOW>;
+		reset-delay-us = <10000>;
+		reset-post-delay-us = <100000>;
+
+		rgmii1: phy@1 {
+			reg = <0x1>;
+		};
+	};
+};
+
+&pdma {
+	status = "okay";
+};
+
+&i2c2 {
+	pinctrl-0 = <&i2c2_0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c04";
+		reg = <0x50>;
+		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC18 */
+		pagesize = <16>;
+		read-only;
+		size = <512>;
+
+		nvmem-layout {
+			compatible = "onie,tlv-layout";
+
+			product-name {
+			};
+		};
+	};
+};
+
+&i2c8 {
+	pinctrl-0 = <&i2c8_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
+		vin1-supply = <&reg_vcc_4v>;
+		vin2-supply = <&reg_vcc_4v>;
+		vin3-supply = <&reg_vcc_4v>;
+		vin4-supply = <&reg_vcc_4v>;
+		vin5-supply = <&reg_vcc_4v>;
+		vin6-supply = <&reg_vcc_4v>;
+		aldoin-supply = <&reg_vcc_4v>;
+		dldoin1-supply = <&buck5>;
+		dldoin2-supply = <&buck5>;
+
+		regulators {
+			buck1_0v9: buck1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck3_1v8: buck3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck4_3v3: buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck5: buck5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1: aldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			aldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			dldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo7 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+		};
+	};
+};
+
+&pcie1_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_3_cfg>;
+	status = "okay";
+};
+
+&pcie1_port {
+	phys = <&pcie1_phy>;
+	vpcie3v3-supply = <&pcie_vcc_3v3>;
+};
+
+&pcie1 {
+	vpcie3v3-supply = <&pcie_vcc_3v3>;
+	status = "okay";
+};
+
+&pcie2_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_4_cfg>;
+	status = "okay";
+};
+
+&pcie2_port {
+	phys = <&pcie2_phy>;
+	vpcie3v3-supply = <&pcie_vcc_3v3>;
+};
+
+&pcie2 {
+	vpcie3v3-supply = <&pcie_vcc_3v3>;
+	status = "okay";
+};
+
+&qspi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_cfg>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <26500000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		vcc-supply = <&buck4_3v3>; /* QSPI_VCC1833 */
+		m25p,fast-read;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bootinfo@0 {
+				reg = <0x0 0x10000>;
+			};
+			private@10000 {
+				reg = <0x10000 0x10000>;
+			};
+			fsbl@20000 {
+				reg = <0x20000 0x40000>;
+			};
+			env@60000 {
+				reg = <0x60000 0x10000>;
+			};
+			opensbi@70000 {
+				reg = <0x70000 0x30000>;
+			};
+			uboot@a0000 {
+				reg = <0xa0000 0x760000>;
+			};
+		};
+	};
+};
+
+&sdhci0 {
+	pinctrl-names = "default", "uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&buck4_3v3>;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_2_cfg>;
+	status = "okay";
+};
+
+&usbphy2 {
+	status = "okay";
+};
+
+&usb_dwc3 {
+	dr_mode = "host";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	hub_2_0: hub@1 {
+		compatible = "usb2109,2817";
+		reg = <0x1>;
+		vdd-supply = <&usb3_hub_5v>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb2109,817";
+		reg = <0x2>;
+		vdd-supply = <&usb3_hub_5v>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
+	};
+};
diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 3c16d0c20050e..9c4aa4f8a533c 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -1,471 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
- * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
- * Copyright (C) 2025 Javier Martinez Canillas <javierm@redhat.com>
+ * Copyright (C) 2026 Aurelien Jarno <aurelien@aurel32.net>
  */
 
-#include "k1.dtsi"
+#include "k1-milkv-jupiter-common.dtsi"
 #include "k1-opp.dtsi"
-#include "k1-pinctrl.dtsi"
 
 / {
 	model = "Milk-V Jupiter (K1)";
-	compatible = "milkv,jupiter", "spacemit,k1";
-
-	aliases {
-		ethernet0 = &eth0;
-		ethernet1 = &eth1;
-		i2c2 = &i2c2;
-		i2c8 = &i2c8;
-		mmc0 = &emmc;
-		mmc1 = &sdhci0;
-		serial0 = &uart0;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
-	leds {
-		compatible = "gpio-leds";
-
-		led1 {
-			label = "pwr-led";
-			gpios = <&gpio K1_GPIO(96) GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "default-on";
-			default-state = "on";
-		};
-
-		led2 {
-			label = "hdd-led";
-			gpios = <&gpio K1_GPIO(92) GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "disk-activity";
-		};
-	};
-
-	pcie_vcc_3v3: regulator-pcie-vcc3v3 {
-		compatible = "regulator-fixed";
-		regulator-name = "pcie_vcc3v3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-boot-on;
-		regulator-always-on;
-		vin-supply = <&reg_dc_in>;
-	};
-
-	reg_dc_in: regulator-dc-in-12v {
-		compatible = "regulator-fixed";
-		regulator-name = "dc_in_12v";
-		regulator-min-microvolt = <12000000>;
-		regulator-max-microvolt = <12000000>;
-		regulator-boot-on;
-		regulator-always-on;
-	};
-
-	reg_vcc_4v: regulator-vcc-4v {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc_4v";
-		regulator-min-microvolt = <4000000>;
-		regulator-max-microvolt = <4000000>;
-		regulator-boot-on;
-		regulator-always-on;
-		vin-supply = <&reg_dc_in>;
-	};
-
-	reg_vcc_5v: regulator-vcc-5v {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc_5v";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		regulator-boot-on;
-		regulator-always-on;
-		vin-supply = <&reg_dc_in>;
-	};
-
-	regulator-usb3-vbus-5v {
-		compatible = "regulator-fixed";
-		regulator-name = "USB30_VBUS";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		regulator-always-on;
-		vin-supply = <&reg_vcc_5v>;
-		gpio = <&gpio K1_GPIO(97) GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
-	usb3_hub_5v: regulator-usb3-hub-5v {
-		compatible = "regulator-fixed";
-		regulator-name = "USB30_HUB";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		vin-supply = <&reg_vcc_5v>;
-		gpio = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-};
-
-&combo_phy {
-	status = "okay";
-};
-
-&cpu_0 {
-	cpu-supply = <&buck1_0v9>;
-};
-
-&cpu_1 {
-	cpu-supply = <&buck1_0v9>;
-};
-
-&cpu_2 {
-	cpu-supply = <&buck1_0v9>;
-};
-
-&cpu_3 {
-	cpu-supply = <&buck1_0v9>;
-};
-
-&cpu_4 {
-	cpu-supply = <&buck1_0v9>;
-};
-
-&cpu_5 {
-	cpu-supply = <&buck1_0v9>;
-};
-
-&cpu_6 {
-	cpu-supply = <&buck1_0v9>;
-};
-
-&cpu_7 {
-	cpu-supply = <&buck1_0v9>;
-};
-
-&emmc {
-	bus-width = <8>;
-	mmc-hs400-1_8v;
-	mmc-hs400-enhanced-strobe;
-	non-removable;
-	no-sd;
-	no-sdio;
-	status = "okay";
-};
-
-&eth0 {
-	phy-handle = <&rgmii0>;
-	phy-mode = "rgmii-id";
-	pinctrl-names = "default";
-	pinctrl-0 = <&gmac0_cfg>, <&gmac0_clk_ref_cfg>;
-	rx-internal-delay-ps = <0>;
-	tx-internal-delay-ps = <0>;
-	status = "okay";
-
-	mdio-bus {
-		#address-cells = <0x1>;
-		#size-cells = <0x0>;
-
-		reset-gpios = <&gpio K1_GPIO(110) GPIO_ACTIVE_LOW>;
-		reset-delay-us = <10000>;
-		reset-post-delay-us = <100000>;
-
-		rgmii0: phy@1 {
-			reg = <0x1>;
-		};
-	};
-};
-
-&eth1 {
-	phy-handle = <&rgmii1>;
-	phy-mode = "rgmii-id";
-	pinctrl-names = "default";
-	pinctrl-0 = <&gmac1_cfg>, <&gmac1_clk_ref_cfg>;
-	rx-internal-delay-ps = <0>;
-	tx-internal-delay-ps = <250>;
-	status = "okay";
-
-	mdio-bus {
-		#address-cells = <0x1>;
-		#size-cells = <0x0>;
-
-		reset-gpios = <&gpio K1_GPIO(115) GPIO_ACTIVE_LOW>;
-		reset-delay-us = <10000>;
-		reset-post-delay-us = <100000>;
-
-		rgmii1: phy@1 {
-			reg = <0x1>;
-		};
-	};
-};
-
-&pdma {
-	status = "okay";
-};
-
-&i2c2 {
-	pinctrl-0 = <&i2c2_0_cfg>;
-	pinctrl-names = "default";
-	status = "okay";
-
-	eeprom@50 {
-		compatible = "atmel,24c04";
-		reg = <0x50>;
-		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC18 */
-		pagesize = <16>;
-		read-only;
-		size = <512>;
-
-		nvmem-layout {
-			compatible = "onie,tlv-layout";
-
-			product-name {
-			};
-		};
-	};
-};
-
-&i2c8 {
-	pinctrl-0 = <&i2c8_cfg>;
-	pinctrl-names = "default";
-	status = "okay";
-
-	pmic@41 {
-		compatible = "spacemit,p1";
-		reg = <0x41>;
-		interrupts = <64>;
-		vin1-supply = <&reg_vcc_4v>;
-		vin2-supply = <&reg_vcc_4v>;
-		vin3-supply = <&reg_vcc_4v>;
-		vin4-supply = <&reg_vcc_4v>;
-		vin5-supply = <&reg_vcc_4v>;
-		vin6-supply = <&reg_vcc_4v>;
-		aldoin-supply = <&reg_vcc_4v>;
-		dldoin1-supply = <&buck5>;
-		dldoin2-supply = <&buck5>;
-
-		regulators {
-			buck1_0v9: buck1 {
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <3450000>;
-				regulator-ramp-delay = <5000>;
-				regulator-always-on;
-			};
-
-			buck2 {
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <3450000>;
-				regulator-ramp-delay = <5000>;
-				regulator-always-on;
-			};
-
-			buck3_1v8: buck3 {
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-ramp-delay = <5000>;
-				regulator-always-on;
-			};
-
-			buck4_3v3: buck4 {
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-ramp-delay = <5000>;
-				regulator-always-on;
-			};
-
-			buck5: buck5 {
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <3450000>;
-				regulator-ramp-delay = <5000>;
-				regulator-always-on;
-			};
-
-			buck6 {
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <3450000>;
-				regulator-ramp-delay = <5000>;
-				regulator-always-on;
-			};
-
-			aldo1: aldo1 {
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <3400000>;
-				regulator-boot-on;
-			};
-
-			aldo2 {
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <3400000>;
-			};
-
-			aldo3 {
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <3400000>;
-			};
-
-			aldo4 {
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <3400000>;
-			};
-
-			dldo1 {
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <3400000>;
-				regulator-boot-on;
-			};
-
-			dldo2 {
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <3400000>;
-			};
-
-			dldo3 {
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <3400000>;
-			};
-
-			dldo4 {
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <3400000>;
-				regulator-always-on;
-			};
-
-			dldo5 {
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <3400000>;
-			};
-
-			dldo6 {
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <3400000>;
-				regulator-always-on;
-			};
-
-			dldo7 {
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <3400000>;
-			};
-		};
-	};
-};
-
-&pcie1_phy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pcie1_3_cfg>;
-	status = "okay";
-};
-
-&pcie1_port {
-	phys = <&pcie1_phy>;
-	vpcie3v3-supply = <&pcie_vcc_3v3>;
-};
-
-&pcie1 {
-	vpcie3v3-supply = <&pcie_vcc_3v3>;
-	status = "okay";
-};
-
-&pcie2_phy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pcie2_4_cfg>;
-	status = "okay";
-};
-
-&pcie2_port {
-	phys = <&pcie2_phy>;
-	vpcie3v3-supply = <&pcie_vcc_3v3>;
-};
-
-&pcie2 {
-	vpcie3v3-supply = <&pcie_vcc_3v3>;
-	status = "okay";
-};
-
-&qspi {
-	pinctrl-names = "default";
-	pinctrl-0 = <&qspi_cfg>;
-	status = "okay";
-
-	flash@0 {
-		compatible = "jedec,spi-nor";
-		reg = <0>;
-		spi-max-frequency = <26500000>;
-		spi-rx-bus-width = <4>;
-		spi-tx-bus-width = <4>;
-		vcc-supply = <&buck4_3v3>; /* QSPI_VCC1833 */
-		m25p,fast-read;
-
-		partitions {
-			compatible = "fixed-partitions";
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			bootinfo@0 {
-				reg = <0x0 0x10000>;
-			};
-			private@10000 {
-				reg = <0x10000 0x10000>;
-			};
-			fsbl@20000 {
-				reg = <0x20000 0x40000>;
-			};
-			env@60000 {
-				reg = <0x60000 0x10000>;
-			};
-			opensbi@70000 {
-				reg = <0x70000 0x30000>;
-			};
-			uboot@a0000 {
-				reg = <0xa0000 0x760000>;
-			};
-		};
-	};
-};
-
-&sdhci0 {
-	pinctrl-names = "default", "uhs";
-	pinctrl-0 = <&mmc1_cfg>;
-	pinctrl-1 = <&mmc1_uhs_cfg>;
-	bus-width = <4>;
-	cd-gpios = <&gpio K1_GPIO(80) (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
-	no-mmc;
-	no-sdio;
-	disable-wp;
-	cap-sd-highspeed;
-	vmmc-supply = <&buck4_3v3>;
-	vqmmc-supply = <&aldo1>;
-	sd-uhs-sdr25;
-	sd-uhs-sdr50;
-	sd-uhs-sdr104;
-	status = "okay";
-};
-
-&uart0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart0_2_cfg>;
-	status = "okay";
-};
-
-&usbphy2 {
-	status = "okay";
-};
-
-&usb_dwc3 {
-	dr_mode = "host";
-	#address-cells = <1>;
-	#size-cells = <0>;
-	status = "okay";
-
-	hub_2_0: hub@1 {
-		compatible = "usb2109,2817";
-		reg = <0x1>;
-		vdd-supply = <&usb3_hub_5v>;
-		peer-hub = <&hub_3_0>;
-		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
-	};
-
-	hub_3_0: hub@2 {
-		compatible = "usb2109,817";
-		reg = <0x2>;
-		vdd-supply = <&usb3_hub_5v>;
-		peer-hub = <&hub_2_0>;
-		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
-	};
 };
-- 
2.53.0

