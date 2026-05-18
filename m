Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7315730E851
	for <spacemit@lists.linux.dev>; Mon, 18 May 2026 10:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779098761; cv=none; b=IwmJFOIFoiAkvZDVxuvPyj0Azf+DrRz0OuapsggkZB210bYvngzHQw+zMGjlZnI39XFiP/qb0fzHgaHRK97CCOhHJGxIITgBvsQZoHfTP+DO4cIa+oLa+VgD1u3TB8FdsUgxKOlxjbD0hhMN0IIAhImtTDYL62S1QHP3dPviIis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779098761; c=relaxed/simple;
	bh=0tfAzFMJ40E/JjfP6FdPvkJS1Us5o4hbVMYh7ny6N0g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RNGsrZRw+pj86wCCla+ZfB1mCGouign6aNapNmBwqcsPhpY2Ih0x3772PhopDo2YtRmOAx3EsjrVPTglCxU3+YAehOQ9+iIL5aT1CHQdv/d+NS3oRQf9W4cfFwnF12x9AlD8Y1xHc9gnt12Smrp6FXFZ04wIeDz+naQJ6pmY85Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [119.122.215.211])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3ed2313df;
	Mon, 18 May 2026 18:00:37 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v2 1/1] riscv: dts: spacemit: enable USB3 on OrangePi R2S
Date: Mon, 18 May 2026 18:00:30 +0800
Message-Id: <20260518100030.2354606-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e3a87c55103a2kunm8420fbff14e784
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTB1JVkxPGB9KSB5OSEIeTlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVJSkpZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0tVSktLVUtZBg++

Enable the DWC3 USB3.0 controller and its associated PHY on the
OrangePi R2S. The USB regulator provides VBUS for USB2 and USB3
ports, but the USB2 ports are handled by a separate controller.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
v2: Remove vin-supply for the vcc5v0_usb regulator.
---
 .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
index de75f6aac740..1ecc40749e5a 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
@@ -21,6 +21,19 @@ aliases {
 	chosen {
 		stdout-path = "serial0";
 	};
+
+	vcc5v0_usb: regulator-vcc5v0-usb {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio K1_GPIO(126) GPIO_ACTIVE_HIGH>;
+		regulator-name = "vcc5v0_usb";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+};
+
+&combo_phy {
+	status = "okay";
 };
 
 &emmc {
@@ -90,3 +103,13 @@ &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	status = "okay";
 };
+
+&usbphy2 {
+	status = "okay";
+};
+
+&usb_dwc3 {
+	dr_mode = "host";
+	vbus-supply = <&vcc5v0_usb>;
+	status = "okay";
+};
-- 
2.34.1

