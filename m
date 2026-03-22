Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908AD37F010;
	Sun, 22 Mar 2026 20:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774211655; cv=none; b=CqYqcX0dsoyNG0W8QS7nvT2YVBFk9L/LCaVIYreJiz32lrFtv8+BNYm81VRQR79eYr2JsRgu7S6jG+HRqB9Z71VM/UtCd8VzuBl566P4uUjjlbzwkPi9JaifuWJ7as4NMip1DJ0o8h7UqLqpH/euPEMc3fwOZ6TuF3Z+nqEYOLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774211655; c=relaxed/simple;
	bh=vIIRo5xwsBTbcJvZebY7emOeHg6k4AKKso78AhcKIG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CBAi+rHc6ptMMUJTmqL/NyQAXuhk0Of1vPUnvSytgkCtC7PLof/4GVcWiE0xph7+/11W2t7mBFOwREa3aKYlEjfDK5kR568YDC8ZuVGEYheFyw8JbRPnC/1X74IOTWpZx8i6QjuqZvfYb9oN9jmXpIDKUiSSduokeKC1+3buBck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=yODLePpr; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="yODLePpr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=x7LUD3o/+agONjZ/pcY7X7Tdpjecq2+mWUSgKTwTkp4=; b=yODLePprKPq0hrFJm0okKD/umr
	7AQLTfjfsQPx8EG7kqaARThoUZu01+yr5C8IUfIMuxHErT7vHRZwFWcCOPztPLz7iqtn1U4kc6QVj
	XQK6uUwmErDgLyW/cCIzn0kBmjqa9wypE5cV94y/3VUwdz3OV2xc4ANWUJ982IifITyi+NZw0A08f
	HiiGD4OOYk5pd6k20sQnfjx765ynPGyVDlszh8Qc35/KA27hbVc9qBbb1rlSqdrmcH0y54fgE4srl
	BpJE2Ku8xeo1BAYKW/2sS6msa2KXk/tqWrOF0JwCttJChPuZQhs4mQwF6Cl6AFSsrzjWD5vM+ykZa
	rcUEWxAA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1w4PUy-0000000Asf5-3pOd;
	Sun, 22 Mar 2026 21:34:12 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 5/6] riscv: dts: spacemit: enable USB 3 ports on Milk-V Jupiter
Date: Sun, 22 Mar 2026 21:28:36 +0100
Message-ID: <20260322203356.2206927-6-aurelien@aurel32.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260322203356.2206927-1-aurelien@aurel32.net>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the DWC3 USB 3.0 controller (USB#2 port in the K1 datasheet) and
its associated combo_phy (USB 3 PHY) and usbphy2 (USB 2 PHY) on the
Milk-V Jupiter board.

The board uses a VLI VL817 hub, providing four ports. Two are routed to
the 3.0 type-A connectors, and two to the F_USB3 front USB header. The
hub requires two separate 5V power supplies: one for the hub itself and
one for the USB connectors. Add an always-on regulator sourcing 5V from
the DC-IN input, along with two GPIO-controlled fixed regulators to
manage the hub and connectors power supplies.

Note that the board also provides four USB 2.0 ports (two via type-A
connectors and two via the F_USB2 front USB header), but these are
handled by a different controller (USB#1 port in the K1 datasheet).

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 05ab5df50be51..4432f8287eb5c 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -58,6 +58,41 @@ reg_vcc_4v: regulator-vcc-4v {
 		regulator-always-on;
 		vin-supply = <&reg_dc_in>;
 	};
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
 };
 
 &eth0 {
@@ -303,3 +338,30 @@ &uart0 {
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
-- 
2.51.0

