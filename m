Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E181B4223
	for <spacemit@lists.linux.dev>; Fri,  3 Apr 2026 12:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775220722; cv=none; b=u26ySzfqJ9gfjgikXHAIfBNBcE1mADnqXotWwhB3Lob1fvnoW9sKk/htJd/kG39KJGfrj0pmBS7WsULua52CJmv9tiC3pviVZ6BQi2pRNJIcO7f4Jj/G2bHzpS/spvoe/Kfm7ZTsF3fnE645NSCZW8djbikO+M2Op6tubYWuDx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775220722; c=relaxed/simple;
	bh=z0+zAu+5+RTvBz4XyLDZsIPh6L6jsKUP3GRgVN1J3Zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PXadGkt9KHpTPHyLy8MgdaNlekuNcR5iweKtrvRn4dgOEWS/4pBGQ6+GKrGT7xcy8clZTpzfl1JVX2um92iOr4Y2yAMf8xwroTbIkmqKLUJdSfG6GZlbWL9wWyvD7OxsuFRtSamuu3rPM6azFrbUZCADYO9tPOm+qKtIQYGkb2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [223.166.95.230])
	by APP-01 (Coremail) with SMTP id qwCowABnDWnlt89pEvwRDA--.20275S5;
	Fri, 03 Apr 2026 20:51:52 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>
Subject: [PATCH v8 3/3] riscv: dts: spacemit: Enable USB3.0/PCIe on OrangePi RV2
Date: Fri,  3 Apr 2026 20:51:48 +0800
Message-ID: <73ff287b98b182cdefbbc16fe73da4641cbd0d92.1775220547.git.gaohan@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775220547.git.gaohan@iscas.ac.cn>
References: <cover.1775220547.git.gaohan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABnDWnlt89pEvwRDA--.20275S5
X-Coremail-Antispam: 1UD129KBjvJXoWxXFyDCF45tF45CF4DXw45Awb_yoW5WFyxpF
	47ursI9as3Ar1rKw43Wa4IgF43Wa1kGFZ3CwnY9F48Jr4vgas09rZayr1rAFn5Jw4kX34a
	yFyUAFyxGrnFgw7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm214x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVF
	xhVjvjDU0xZFpf9x0JUUl1kUUUUU=
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiDAUGDGnPqxAcFQAAsX

Enable the DWC3 USB 3.0 controller and its associated usbphy2 on the
OrangePi RV2 board.

The board utilizes a Genesys Logic GL3523 USB3.0 hub.

Define a 3.3v fixed voltage regulator for PCIe and enable PCIe and
PHY-related Device Tree nodes for the OrangePi RV2.

Co-developed-by: Chukun Pan <amadeus@jmu.edu.cn>
Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index f7a1dadaa95f..5b331bf987db 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -23,6 +23,15 @@ chosen {
 		stdout-path = "serial0";
 	};
 
+	pcie_vcc3v3: regulator-pcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio K1_GPIO(116) GPIO_ACTIVE_HIGH>;
+		regulator-name = "pcie_vcc3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
 	vcc_5v0: regulator-vcc-5v0 {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_5v0";
@@ -42,6 +51,16 @@ vcc4v0: regulator-vcc4v0 {
 		vin-supply = <&vcc_5v0>;
 	};
 
+	vcc5v0_usb30: regulator-vcc5v0-usb30 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_usb30";
+		enable-active-high;
+		gpios = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc_5v0>;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -54,6 +73,10 @@ led1 {
 	};
 };
 
+&combo_phy {
+	status = "okay";
+};
+
 &eth0 {
 	phy-handle = <&rgmii0>;
 	phy-mode = "rgmii-id";
@@ -224,8 +247,66 @@ dldo7 {
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
+	vpcie3v3-supply = <&pcie_vcc3v3>;
+};
+
+&pcie1 {
+	vpcie3v3-supply = <&pcie_vcc3v3>;
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
+	vpcie3v3-supply = <&pcie_vcc3v3>;
+};
+
+&pcie2 {
+	vpcie3v3-supply = <&pcie_vcc3v3>;
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
+	vbus-supply = <&vcc5v0_usb30>;
+	status = "okay";
+
+	hub_2_0: hub@1 {
+		compatible = "usb5e3,610";
+		reg = <0x1>;
+		peer-hub = <&hub_3_0>;
+		vdd-supply = <&vcc_5v0>;
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb5e3,620";
+		reg = <0x2>;
+		peer-hub = <&hub_2_0>;
+		vdd-supply = <&vcc_5v0>;
+	};
+};
-- 
2.47.3

