Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3E32D5C68
	for <spacemit@lists.linux.dev>; Sun,  2 Aug 2026 10:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785664902; cv=none; b=DAglYGLYT0MWkMe3p8G2zQa249Ac6yvwOtUcexr1zr6iR0ZoyjljS5J6EJwxi72Utux/XDJWQYCX0GR1ba35dcNWUEyOX2bR0Qp5Azj3pcEBlj+JEI06Gdc0sOJlf10fcymzmFSRp++4xRB4+DDPtbTLBztuZGZUqumbNMQNDUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785664902; c=relaxed/simple;
	bh=bfIIAMBucrJuZ2si+9iIGcYeM7NwvmIprxtyA2Nv9jU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DKiDFnI72jn4P3WOid1W84iljyaeKG7DiaCls8ty9oz/AYkqpl1ZEh+9cImWZa6Bqbzp6w8HU4UrqOOQ7VCWsR7UAuAoJCOqfgwaRJ7ldvLWd9V28BoV5f9mWehx+BBSOvSXLjlcZWYJK0z6gMNDxoMP1mxD8X9qRygK/lR5c8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.116])
	by smtp.qiye.163.com (Hmail) with ESMTP id 48732cd5a;
	Sun, 2 Aug 2026 18:01:29 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 1/1] riscv: dts: spacemit: sort nodes on OrangePi RV2
Date: Sun,  2 Aug 2026 18:01:01 +0800
Message-Id: <20260802100101.327815-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fc1ebe08703a2kunmb239287e2450e3
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGkwaVk0YTEwdGUMdQx4aHlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpKTVlXWRYaDxIVHRRZQVlPS0hVSktIS0
	pMS1VKS0tVS1kG

Sort the nodes for DT. Also reorder the properties of the sdhci0 node.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 66 +++++++++----------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index b907a1396b21..9b970a963199 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -25,6 +25,17 @@ chosen {
 		stdout-path = "serial0";
 	};
 
+	leds {
+		compatible = "gpio-leds";
+
+		led-1 {
+			label = "sys-led";
+			gpios = <&gpio K1_GPIO(96) GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+			default-state = "on";
+		};
+	};
+
 	pcie_vcc3v3: regulator-pcie-vcc3v3 {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -63,17 +74,6 @@ vcc5v0_usb30: regulator-vcc5v0-usb30 {
 		regulator-max-microvolt = <5000000>;
 		vin-supply = <&vcc_5v0>;
 	};
-
-	leds {
-		compatible = "gpio-leds";
-
-		led1 {
-			label = "sys-led";
-			gpios = <&gpio K1_GPIO(96) GPIO_ACTIVE_LOW>;
-			linux,default-trigger = "heartbeat";
-			default-state = "on";
-		};
-	};
 };
 
 &combo_phy {
@@ -138,10 +138,6 @@ rgmii1: phy@1 {
 	};
 };
 
-&pdma {
-	status = "okay";
-};
-
 &i2c8 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c8_cfg>;
@@ -290,6 +286,10 @@ &pcie2 {
 	status = "okay";
 };
 
+&pdma {
+	status = "okay";
+};
+
 &qspi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&qspi_cfg>;
@@ -335,6 +335,24 @@ uboot@a0000 {
 	};
 };
 
+&sdhci0 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_LOW>;
+	disable-wp;
+	no-mmc;
+	no-sdio;
+	pinctrl-names = "default", "uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	vmmc-supply = <&buck4_3v3>;
+	vqmmc-supply = <&aldo1>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
@@ -366,21 +384,3 @@ hub_3_0: hub@2 {
 		vdd-supply = <&vcc_5v0>;
 	};
 };
-
-&sdhci0 {
-	pinctrl-names = "default", "uhs";
-	pinctrl-0 = <&mmc1_cfg>;
-	pinctrl-1 = <&mmc1_uhs_cfg>;
-	bus-width = <4>;
-	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_LOW>;
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
-- 
2.34.1

