Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952CF3C13E2;
	Wed, 19 Aug 2026 17:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787158904; cv=none; b=sAX9d2SnNbLgNiwnUnijkOhwyl4/UvPSnaa3E3jfBdewvdOP/2sLdEXbuyzAC2VV/atSGmrd3EA5ln8SkLp3bCspiNkETTgbFlzAIjkF9H2SOJ2mQtKNj3WZWZH5EIW1wAC0JQM30vafMlLZP7te4QAUg/sbt4KLc/78LqHMjco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787158904; c=relaxed/simple;
	bh=s9Nmu3mlDb/iXg6RVxezniVrImHntu3PU2fLC6nVL48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QsV62oREAROeQ9igiRbKViQuKLfbmjEtfoDMPbpV1w9KxhpUv5FL0hXUqzvPbiNdxbdXzbv2zBZ2k4O7Vv4u4SX62YGBc1tr3snpN5h5NUMvsAT3bQZaUx9ILValqh+JVbkQKvyL1GneH/Qe9vzZSXwNFvYmOHnpvg3sO/z2q3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=qvSF710Z; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="qvSF710Z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=QJLmJKXlE0uHAoUkROK+QmZzPN8vgfWXVTQRcLqVJeE=; b=qvSF710ZuZB6YQM6qKC1AGm68Z
	y7QRxDzqUxBL4GW669WZ4+sTsCRuRdF+qBkKw8zonGifhp7FgrNwLMnpuP8maO33FUQ6L2hnUzPdy
	K3xk5mE6vS+sMqOh+FUOnr9ZjvwCIngiAl6UHlJtGaRCuhpkYqRNUbITQE7oCvHnxCu5iv8Tp4Bme
	RRFlTXajm5q1HYnvYSWmt8cGWvG9ooLwXuhBtiSfGyH+lS55RZCcWbo3pErGDND+Oo4vQZEOp22YL
	MkK7BFGhGpLHzcmaDZQCnRL8jllMOe6IOlXDCaDEWiTurDRr6cx5fmV2ctwZg4Ikh80U8rwmtig1+
	HfCtx1kA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wwj2c-0000000D4km-3jeK;
	Wed, 19 Aug 2026 18:21:26 +0200
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
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v3 2/5] riscv: dts: spacemit: k3: add USB3 B and C controllers for Pico-ITX board
Date: Wed, 19 Aug 2026 18:15:43 +0200
Message-ID: <20260819162115.2252812-3-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260819162115.2252812-1-aurelien@aurel32.net>
References: <20260819162115.2252812-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT K3 has 4 USB3 controllers labelled A to D.

On the K3 Pico-ITX board, the controllers B and C are used in USB2 mode
only respectively for the M.2 B-Key slot and for the RTL8852BE Bluetooth
controller.

Add the two controller nodes, the two corresponding USB2 PHY nodes, and
enable them on the K3 Pico-ITX board.

Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 18 ++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 64 ++++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index 171bd2f40aa6..e932e464e645 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -323,6 +323,24 @@ &usb2_phy {
 	status = "okay";
 };
 
+&usb3b {
+	maximum-speed = "high-speed";
+	status = "okay";
+};
+
+&usb3b_u2phy {
+	status = "okay";
+};
+
+&usb3c {
+	maximum-speed = "high-speed";
+	status = "okay";
+};
+
+&usb3c_u2phy {
+	status = "okay";
+};
+
 &usb3d_u2phy {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 3e24054d2084..f885e2b4207b 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -441,6 +441,70 @@ soc: soc {
 		dma-noncoherent;
 		ranges;
 
+		usb3b: usb@81400000 {
+			compatible = "spacemit,k3-dwc3";
+			reg = <0x0 0x81400000 0x0 0x10000>;
+			interrupts = <125 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&saplic>;
+			clocks = <&syscon_apmu CLK_APMU_USB3_PORTB_BUS>;
+			clock-names = "usbdrd30";
+			resets = <&syscon_apmu RESET_APMU_USB3_B_AHB>,
+				 <&syscon_apmu RESET_APMU_USB3_B_VCC>,
+				 <&syscon_apmu RESET_APMU_USB3_B_PHY>;
+			reset-names = "ahb", "vcc", "phy";
+			phys = <&usb3b_u2phy>;
+			phy-names = "usb2-phy";
+			phy_type = "utmi";
+			snps,dis_enblslpm_quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis-del-phy-power-chg-quirk;
+			snps,dis-tx-ipgap-linecheck-quirk;
+			snps,parkmode-disable-ss-quirk;
+			dr_mode = "host";
+			status = "disabled";
+		};
+
+		usb3b_u2phy: phy@81500000 {
+			compatible = "spacemit,k3-usb2-phy";
+			reg = <0x0 0x81500000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_APMU_USB3_PORTB_BUS>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		usb3c: usb@81700000 {
+			compatible = "spacemit,k3-dwc3";
+			reg = <0x0 0x81700000 0x0 0x10000>;
+			interrupts = <148 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&saplic>;
+			clocks = <&syscon_apmu CLK_APMU_USB3_PORTC_BUS>;
+			clock-names = "usbdrd30";
+			resets = <&syscon_apmu RESET_APMU_USB3_C_AHB>,
+				 <&syscon_apmu RESET_APMU_USB3_C_VCC>,
+				 <&syscon_apmu RESET_APMU_USB3_C_PHY>;
+			reset-names = "ahb", "vcc", "phy";
+			phys = <&usb3c_u2phy>;
+			phy-names = "usb2-phy";
+			phy_type = "utmi";
+			snps,dis_enblslpm_quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis-del-phy-power-chg-quirk;
+			snps,dis-tx-ipgap-linecheck-quirk;
+			snps,parkmode-disable-ss-quirk;
+			dr_mode = "host";
+			status = "disabled";
+		};
+
+		usb3c_u2phy: phy@81800000 {
+			compatible = "spacemit,k3-usb2-phy";
+			reg = <0x0 0x81800000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_APMU_USB3_PORTC_BUS>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		usb3d: usb@81a00000 {
 			compatible = "spacemit,k3-dwc3";
 			reg = <0x0 0x81a00000 0x0 0x10000>;
-- 
2.53.0

