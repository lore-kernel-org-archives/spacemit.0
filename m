Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A90123183B
	for <spacemit@lists.linux.dev>; Fri, 16 Jan 2026 10:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768557630; cv=none; b=PwyUQ5QyE3g7ewubgYhoGL2qGMPltkQsDHEavnWdL9iyQiCiod3454wtfJzD8JIcsdFwyKyJpW+4oWIIHDWZNy9KoKgSP1I+61/EnqLQmdZu0yesGVi9coXRCU70vl8zvRBVHE7J9Z1ZJMBiGdcHOxi/1JCTV4Gny4C2uq8xrz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768557630; c=relaxed/simple;
	bh=c6WjbWLqWOyFIOy6LOLmlSxYFS0VcL/LfnKQWB3sSeA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AgDyEr3k3MpQlrWGgE3fXlyP+XVNiGDo6M7s3M/y+OUj9Rw/Ffe4n1yOA3OYIeDy4LWWSRBbRQwPd+MU2HQe1Nc388P6qua8yVibL/w65jIkXzjukgk8kjzI7WKXqQiRmNlp7B84YXGtp5aAz7m3PWYIUo4rZzDOVuNKw+PCMz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.94.194])
	by smtp.qiye.163.com (Hmail) with ESMTP id 30e8ca646;
	Fri, 16 Jan 2026 18:00:17 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 1/2] riscv: dts: spacemit: add common board dtsi for OrangePi
Date: Fri, 16 Jan 2026 18:00:00 +0800
Message-Id: <20260116100001.208334-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9bc63fa1e003a2kunm651e977725ca48
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDH0NMVkkYHR8fGR1CHUtISFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSkJPWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+

The OrangePi R2S and OrangePi RV2 boards share many similarities, the
difference being that the RV2 board has more peripherals, such as HDMI
and Wi-Fi. Create a dtsi for shared parts to reduce duplication.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 69 +----------------
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 69 +----------------
 arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi | 76 +++++++++++++++++++
 3 files changed, 78 insertions(+), 136 deletions(-)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
index 58098c4a2aab..393270641b04 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
@@ -5,22 +5,11 @@
 
 /dts-v1/;
 
-#include "k1.dtsi"
-#include "k1-pinctrl.dtsi"
+#include "k1-orangepi.dtsi"
 
 / {
 	model = "OrangePi R2S";
 	compatible = "xunlong,orangepi-r2s", "spacemit,k1";
-
-	aliases {
-		serial0 = &uart0;
-		ethernet0 = &eth0;
-		ethernet1 = &eth1;
-	};
-
-	chosen {
-		stdout-path = "serial0";
-	};
 };
 
 &emmc {
@@ -32,59 +21,3 @@ &emmc {
 	no-sdio;
 	status = "okay";
 };
-
-&eth0 {
-	phy-handle = <&rgmii0>;
-	phy-mode = "rgmii-id";
-	pinctrl-names = "default";
-	pinctrl-0 = <&gmac0_cfg>;
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
-	pinctrl-0 = <&gmac1_cfg>;
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
-&uart0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart0_2_cfg>;
-	status = "okay";
-};
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 41dc8e35e6eb..e53f52e27477 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -6,23 +6,12 @@
 
 /dts-v1/;
 
-#include "k1.dtsi"
-#include "k1-pinctrl.dtsi"
+#include "k1-orangepi.dtsi"
 
 / {
 	model = "OrangePi RV2";
 	compatible = "xunlong,orangepi-rv2", "spacemit,k1";
 
-	aliases {
-		serial0 = &uart0;
-		ethernet0 = &eth0;
-		ethernet1 = &eth1;
-	};
-
-	chosen {
-		stdout-path = "serial0";
-	};
-
 	leds {
 		compatible = "gpio-leds";
 
@@ -34,59 +23,3 @@ led1 {
 		};
 	};
 };
-
-&eth0 {
-	phy-handle = <&rgmii0>;
-	phy-mode = "rgmii-id";
-	pinctrl-names = "default";
-	pinctrl-0 = <&gmac0_cfg>;
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
-	pinctrl-0 = <&gmac1_cfg>;
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
-&uart0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart0_2_cfg>;
-	status = "okay";
-};
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi b/arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi
new file mode 100644
index 000000000000..b4808f258adf
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
+ * Copyright (C) 2025 Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
+ */
+
+#include "k1.dtsi"
+#include "k1-pinctrl.dtsi"
+
+/ {
+	aliases {
+		ethernet0 = &eth0;
+		ethernet1 = &eth1;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+};
+
+&eth0 {
+	phy-handle = <&rgmii0>;
+	phy-mode = "rgmii-id";
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_cfg>;
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
+	pinctrl-0 = <&gmac1_cfg>;
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
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_2_cfg>;
+	status = "okay";
+};
-- 
2.25.1

