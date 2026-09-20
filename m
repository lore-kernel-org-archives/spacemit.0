Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8284C3F104E
	for <spacemit@lists.linux.dev>; Sun, 20 Sep 2026 10:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789898441; cv=none; b=KHjEXtOeNFkRmTbJu77qigBIMq0ab81klsLyenPdkRjOlEcsPppiQrVCmtNfM8+rCPxDJRtsW7NoWiUOz1DYt3AXTG52C3LYUkIHZldIo1J5yqPj/q9FqtItxI6XRk7+CdoD14nQ/MXm5LcyhcbyGsEd5JRCtMUNko44MXpIRG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789898441; c=relaxed/simple;
	bh=Pa/kThhCijMFi8BDye7+rFM1nK7NtTDPDRSHSp6ffQs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hEJTMp6U1KZfTSZjtxQjeIAkDNaPi/ci/SaHbfYI1PWrfnmk32KGBmBNwoHC+txujnuiy1sKI0XRl/kYCGKzP64NPrxKMf2LWTdWx+i60Xjajm3Pxe/6o5NMofFTXYCA901ruJA1yIxvrUuMNGRWYxo7Nbip9cTgEtgQK9YBayo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4e715e30a;
	Sun, 20 Sep 2026 18:00:28 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 1/1] riscv: dts: spacemit: set ETH MAC from eeprom for OrangePi
Date: Sun, 20 Sep 2026 18:00:00 +0800
Message-Id: <20260920100000.3888256-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0be42903c03a2kunm0b30d86444d90c
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZThhCVkMeSkJPSh4ZTEpLTFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlPS0hVSktISk
	5MTlVKS0tVSkJLS1kG

The EEPROM on the OrangePi R2S and OrangePi RV2 stores the MAC address.
Assign it to Ethernet, with eth1 having a MAC offset of 1. Remove the
Ethernet alias to avoid U-Boot patching incorrect MAC addresses.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts | 8 +++++---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 8 +++++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
index 7125f2882ce8..073cc975135f 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
@@ -16,8 +16,6 @@ aliases {
 		i2c2 = &i2c2;
 		i2c8 = &i2c8;
 		serial0 = &uart0;
-		ethernet0 = &eth0;
-		ethernet1 = &eth1;
 	};
 
 	chosen {
@@ -66,6 +64,8 @@ &emmc {
 };
 
 &eth0 {
+	nvmem-cells = <&mac_address 0>;
+	nvmem-cell-names = "mac-address";
 	phy-handle = <&rgmii0>;
 	phy-mode = "rgmii-id";
 	pinctrl-names = "default";
@@ -90,6 +90,8 @@ rgmii0: phy@1 {
 };
 
 &eth1 {
+	nvmem-cells = <&mac_address 1>;
+	nvmem-cell-names = "mac-address";
 	phy-handle = <&rgmii1>;
 	phy-mode = "rgmii-id";
 	pinctrl-names = "default";
@@ -129,7 +131,7 @@ eeprom@50 {
 		nvmem-layout {
 			compatible = "onie,tlv-layout";
 
-			mac-address {
+			mac_address: mac-address {
 				#nvmem-cell-cells = <1>;
 			};
 
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 837616255464..609c4755775d 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -15,8 +15,6 @@ / {
 
 	aliases {
 		serial0 = &uart0;
-		ethernet0 = &eth0;
-		ethernet1 = &eth1;
 		i2c2 = &i2c2;
 		i2c8 = &i2c8;
 		mmc0 = &emmc;
@@ -93,6 +91,8 @@ &emmc {
 };
 
 &eth0 {
+	nvmem-cells = <&mac_address 0>;
+	nvmem-cell-names = "mac-address";
 	phy-handle = <&rgmii0>;
 	phy-mode = "rgmii-id";
 	pinctrl-names = "default";
@@ -117,6 +117,8 @@ rgmii0: phy@1 {
 };
 
 &eth1 {
+	nvmem-cells = <&mac_address 1>;
+	nvmem-cell-names = "mac-address";
 	phy-handle = <&rgmii1>;
 	phy-mode = "rgmii-id";
 	pinctrl-names = "default";
@@ -156,7 +158,7 @@ eeprom@50 {
 		nvmem-layout {
 			compatible = "onie,tlv-layout";
 
-			mac-address {
+			mac_address: mac-address {
 				#nvmem-cell-cells = <1>;
 			};
 
-- 
2.34.1

