Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A024348C77;
	Wed, 29 Jul 2026 17:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785345901; cv=none; b=tHuLI2FetfjNn5ppEAsZa/xFgo0F+LCaAMpEAlWBktCGxnPgRNCC/8ciFSzwRZiTJ/8uNexJ4p5oCMn/1jEQI+PjGuNIVx7veQJh1RPRQ9tdKZR0ncasZmYA/WE8qIBgkIKa3vT9Tlfptyfd6Pp0r20SVWyR1QPNebII2RvVhB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785345901; c=relaxed/simple;
	bh=z+quJHI0QFancKr9QegedQDD9xm4ZDLWqhKm/toTz4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kKxZJSoi4qbLohx3Yp77EHiPLat82wLMig7g7ZMxlm3Og6RG9orfLSCJlTUotE8BgLK8kdD0ReCPzuWjGf9KUTd/H/Rr1y1RRmcdkzI/wRQRcEVAbDM3hXOvsrFneMTMy1u5c6wuv/xcFQsGnWn9w9RGsuQ9LZa8bd7ovQWMJoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=MSlzUotx; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="MSlzUotx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=tF3mwvXmfvRA76c1UuXD5sfztx3yHZH1mfSiaQf7M00=; b=MSlzUotxKfSi5JjmdUcoLNA6Gt
	GBuevHjJlEWxYh6sc/+WuDrt2WA1ZIxFfcuZXGEzkF8E17CaXEkRJIVPawWz07/GWgYfsVi0pd+n4
	YWKxxVOKxpXaCIaUYFfoV869dAL0H1fUnNLIwWu5GxO6FQr8WihEFbKAnwU4nbuSJK62TOOTMVsCi
	nhNB1605csBCzQTCq24toNQHkmmt/nj8Ejxzn7kNKR4Gmx1Wanw8tMHi81+roEvIJa47Em0soGEVB
	5sbNCKvokd9HEcrJuGvJmsS6R7Y9R59DZiK0w6aw8HUqd4KoxLggq4slrVKX8WceruQF3fhvJh47j
	imuNMvcw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wp81Z-00000002mWq-1O5S;
	Wed, 29 Jul 2026 19:24:57 +0200
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
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v2 3/4] riscv: dts: spacemit: k3: add USB3 B and C controllers for Pico-ITX board
Date: Wed, 29 Jul 2026 19:20:25 +0200
Message-ID: <20260729172450.1660418-4-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260729172450.1660418-1-aurelien@aurel32.net>
References: <20260729172450.1660418-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT K3 has 4 USB3 controllers labelled A to D.

On the K3 Pico-ITX board, the controllers B and C are used in USB 2 mode
only respectively for the M.2 B-Key slot and for the RTL8852BE Bluetooth
controller.

Add the two controller nodes, the two corresponding USB2 PHY nodes and
the two corresponding USB3 PHY nodes, and enable them on the K3 Pico-ITX
board.

Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 18 ++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 66 ++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index 6a60fae1f8b50..37d3422af32ac 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -330,6 +330,24 @@ &usb2_phy {
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
index 0eb24fac4733e..b786f119d4f95 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -441,6 +441,72 @@ soc: soc {
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
+			phys = <&usb3b_u2phy>,
+			       <&combophy 2 PHY_TYPE_USB3>;
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
+			phys = <&usb3c_u2phy>,
+			       <&combophy 3 PHY_TYPE_USB3>;
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

