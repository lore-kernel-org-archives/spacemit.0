Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA7237F8A2
	for <spacemit@lists.linux.dev>; Sun, 29 Mar 2026 17:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774803932; cv=none; b=Rt0XTDgQWcpQHdPikx1jb05LhmDHS/vKLwMp+keILZ/vvWDmjG//EyzxGwZu/Xy6d4e177N5lwSJnDJiLn6dJGDEC6Xa40s/orBBjosBY6P10A+ort9MskjunpvVCUgSXdPxTIZYK0Ss09mwYo3soc5ho3Q8LVq/7GqKs4yqCQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774803932; c=relaxed/simple;
	bh=wxvRwtn8VQr3u19wAWeRtJ30cDrZI5ec6rb60dN7vHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CHd+WrtSYkssKUrDOt/FVt2dL1wWGAN/Fq0E0f6M/MAV5J3R3vUeAuoeW9XUl2hINidPwylvXWFxci8GKNSIl0UZJT9rXMJm7gZEL9as1O5TuC/upjzHEqIPXYsAfUBWboHX7KUP4ioRCezBF36NUabuLkev12VbdbYN7N534AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [223.166.95.230])
	by APP-01 (Coremail) with SMTP id qwCowADXfmrNW8lphN+LCw--.7316S5;
	Mon, 30 Mar 2026 01:05:20 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>
Subject: [PATCH v3 3/3] riscv: dts: spacemit: Enable USB3.0/PCIe on OrangePi RV2
Date: Mon, 30 Mar 2026 01:05:15 +0800
Message-ID: <84f8e713ef1ee46f9be852f400f52d6c055725f8.1774803532.git.gaohan@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774803532.git.gaohan@iscas.ac.cn>
References: <cover.1774803532.git.gaohan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADXfmrNW8lphN+LCw--.7316S5
X-Coremail-Antispam: 1UD129KBjvJXoWxWF4xJr4rGF4xGF1UWw1UGFg_yoW5Xw4xpF
	17Wrsa9a4fAryfKw43Wa4Iga13W3Wvk395Awn5Zr48JF40ga4q9rs3Ar15AF95Wr48X34a
	yFyjyFy8KFnrKw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm214x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
	M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
	v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
	IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVF
	xhVjvjDU0xZFpf9x0JUHWlkUUUUU=
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiBwoBDGnJP94irgABsM

Enable the DWC3 USB 3.0 controller and its associated usbphy2 on the
OrangePi RV2 board.

The board utilizes a Genesys Logic GL3523 hub, which requires one
separate power supplies for hub itself.

Define a 3.3v fixed voltage regulator to be used by PCIe on OPi RV2.

Define PCIe and PHY-related Device Tree nodes for the OPi RV2.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 1b1b27bc95d8..a53cd2e037ef 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -23,6 +23,15 @@ chosen {
 		stdout-path = "serial0";
 	};
 
+	pcie_vcc_3v3: regulator-pcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "PCIE_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio K1_GPIO(116) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reg_dc_in: regulator-vcc-in-5v {
 		compatible = "regulator-fixed";
 		regulator-name = "dc_in_5v";
@@ -42,6 +51,15 @@ reg_vcc_4v: regulator-vcc-4v {
 		vin-supply = <&reg_dc_in>;
 	};
 
+	usb3_hub_5v: regulator-usb3-hub-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "USB_HUB_EN";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -54,6 +72,10 @@ led1 {
 	};
 };
 
+&combo_phy {
+	status = "okay";
+};
+
 &eth0 {
 	phy-handle = <&rgmii0>;
 	phy-mode = "rgmii-id";
@@ -230,8 +252,65 @@ dldo7 {
 	};
 };
 
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
 &uart0 {
 	pinctrl-names = "default";
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
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	hub_2_0: hub@1 {
+		compatible = "usb5e3,610";
+		reg = <0x1>;
+		vdd-supply = <&usb3_hub_5v>;
+		peer-hub = <&hub_3_0>;
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb5e3,620";
+		reg = <0x2>;
+		vdd-supply = <&usb3_hub_5v>;
+		peer-hub = <&hub_2_0>;
+	};
+};
-- 
2.47.3

