Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777043B8959
	for <spacemit@lists.linux.dev>; Wed, 18 Mar 2026 10:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773828076; cv=none; b=nbEINPJnO681U27wAaEYq4bFggVJSySsfdATHy9fbM2CEB8fYBYSPC0/npF4uCTMPAPy/AQXU+CXWmAlAbxpLPen6WvZW10WzScgJwJ1oVSWiN6t4osucaVbSSdr3OGG56hV9ZpgvPFiDWyf4kLyaor8uUShA2RUIaaMYYFV8wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773828076; c=relaxed/simple;
	bh=+IuQFnatLOayxCjoLTohwxLI3YBsbG8XEWwfzcVFGgc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=r1kcLl0QrQAhS7+yqpK8v4wNN0dy7H9uVJyVY2BstHE1IRz4l6ODoxZV2fHy6JcJKpQBO1hFtggC5xSYyCxbHiV8jP5HVz7zyBCthOGhbmOgpr2rJI/HVoONqGIIz8QJ2maRspd07OMqH262qkc2Uz/XLLI4soX3PZWrSXMSvJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.94.199])
	by smtp.qiye.163.com (Hmail) with ESMTP id 376701b7b;
	Wed, 18 Mar 2026 18:01:02 +0800 (GMT+08:00)
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
Subject: [PATCH 1/1] riscv: dts: spacemit: reorder phy nodes for K1
Date: Wed, 18 Mar 2026 18:00:00 +0800
Message-Id: <20260318100000.3934516-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d00643e6f03a2kunma8eaf0e017a3ad
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGkJCVhpITx8aSR9PHkoeSVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSkJCWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+

Reorder the PHY nodes of USB and PCIe to the correct positions based on
the register address. This improves the readability and maintainability
of the DT. No functional change is introduced by this reordering.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 108 +++++++++++++--------------
 1 file changed, 54 insertions(+), 54 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index d2015201f8e5..f0bad6855c97 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -359,6 +359,60 @@ syscon_rcpu2: system-controller@c0888000 {
 			#reset-cells = <1>;
 		};
 
+		usbphy2: phy@c0a30000 {
+			compatible = "spacemit,k1-usb2-phy";
+			reg = <0x0 0xc0a30000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_USB30>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		combo_phy: phy@c0b10000 {
+			compatible = "spacemit,k1-combo-phy";
+			reg = <0x0 0xc0b10000 0x0 0x1000>;
+			clocks = <&vctcxo_24m>,
+				 <&syscon_apmu CLK_PCIE0_DBI>,
+				 <&syscon_apmu CLK_PCIE0_MASTER>,
+				 <&syscon_apmu CLK_PCIE0_SLAVE>;
+			clock-names = "refclk",
+				      "dbi",
+				      "mstr",
+				      "slv";
+			resets = <&syscon_apmu RESET_PCIE0_GLOBAL>,
+				 <&syscon_apmu RESET_PCIE0_DBI>,
+				 <&syscon_apmu RESET_PCIE0_MASTER>,
+				 <&syscon_apmu RESET_PCIE0_SLAVE>;
+			reset-names = "phy",
+				      "dbi",
+				      "mstr",
+				      "slv";
+			#phy-cells = <1>;
+			spacemit,apmu = <&syscon_apmu>;
+			status = "disabled";
+		};
+
+		pcie1_phy: phy@c0c10000 {
+			compatible = "spacemit,k1-pcie-phy";
+			reg = <0x0 0xc0c10000 0x0 0x1000>;
+			clocks = <&vctcxo_24m>;
+			clock-names = "refclk";
+			resets = <&syscon_apmu RESET_PCIE1_GLOBAL>;
+			reset-names = "phy";
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		pcie2_phy: phy@c0d10000 {
+			compatible = "spacemit,k1-pcie-phy";
+			reg = <0x0 0xc0d10000 0x0 0x1000>;
+			clocks = <&vctcxo_24m>;
+			clock-names = "refclk";
+			resets = <&syscon_apmu RESET_PCIE2_GLOBAL>;
+			reset-names = "phy";
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@d4010800 {
 			compatible = "spacemit,k1-i2c";
 			reg = <0x0 0xd4010800 0x0 0x38>;
@@ -429,60 +483,6 @@ i2c5: i2c@d4013800 {
 			status = "disabled";
 		};
 
-		usbphy2: phy@c0a30000 {
-			compatible = "spacemit,k1-usb2-phy";
-			reg = <0x0 0xc0a30000 0x0 0x200>;
-			clocks = <&syscon_apmu CLK_USB30>;
-			#phy-cells = <0>;
-			status = "disabled";
-		};
-
-		combo_phy: phy@c0b10000 {
-			compatible = "spacemit,k1-combo-phy";
-			reg = <0x0 0xc0b10000 0x0 0x1000>;
-			clocks = <&vctcxo_24m>,
-				 <&syscon_apmu CLK_PCIE0_DBI>,
-				 <&syscon_apmu CLK_PCIE0_MASTER>,
-				 <&syscon_apmu CLK_PCIE0_SLAVE>;
-			clock-names = "refclk",
-				      "dbi",
-				      "mstr",
-				      "slv";
-			resets = <&syscon_apmu RESET_PCIE0_GLOBAL>,
-				 <&syscon_apmu RESET_PCIE0_DBI>,
-				 <&syscon_apmu RESET_PCIE0_MASTER>,
-				 <&syscon_apmu RESET_PCIE0_SLAVE>;
-			reset-names = "phy",
-				      "dbi",
-				      "mstr",
-				      "slv";
-			#phy-cells = <1>;
-			spacemit,apmu = <&syscon_apmu>;
-			status = "disabled";
-		};
-
-		pcie1_phy: phy@c0c10000 {
-			compatible = "spacemit,k1-pcie-phy";
-			reg = <0x0 0xc0c10000 0x0 0x1000>;
-			clocks = <&vctcxo_24m>;
-			clock-names = "refclk";
-			resets = <&syscon_apmu RESET_PCIE1_GLOBAL>;
-			reset-names = "phy";
-			#phy-cells = <0>;
-			status = "disabled";
-		};
-
-		pcie2_phy: phy@c0d10000 {
-			compatible = "spacemit,k1-pcie-phy";
-			reg = <0x0 0xc0d10000 0x0 0x1000>;
-			clocks = <&vctcxo_24m>;
-			clock-names = "refclk";
-			resets = <&syscon_apmu RESET_PCIE2_GLOBAL>;
-			reset-names = "phy";
-			#phy-cells = <0>;
-			status = "disabled";
-		};
-
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
-- 
2.34.1

