Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4E13B1ED7
	for <spacemit@lists.linux.dev>; Tue,  2 Jun 2026 10:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780394753; cv=none; b=riIIuAawZqix+Q9ETIX2iFRJDnMHT8eD2vS/pz0jG2xAsW7fF8zID2ufW+aOjH8FIgPuQxI6xdncNqFIQNqoTRXB0UoPxzBlODHg+I5DSFOB/lXREq0I8Zk5psay4Ovm0Id9/PAp6YF+Ng/zWmv7un2dpYxTXQQF7RNMdZPBfiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780394753; c=relaxed/simple;
	bh=lrCsqlvXc2Wsoz95pzJ5h+L/VSx0Ak+qrznkdAdP7jo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RjdbweWI3WGmwMKEeDaRsNC+DfSPBRHlr8UsuVAvW7qRSpeyP9aGVaadH9WEuK4ff2P/e1S5XBCbMYGoc4vyVPirJKdM1SG47rSUuLpb3jmHjptWC/9SEuaPTG2Y9wFtWTD7J790r67qZDjfnzAZng18J5DwrjdlCqR5MTBXCbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [113.80.141.91])
	by smtp.qiye.163.com (Hmail) with ESMTP id 40bec0aa9;
	Tue, 2 Jun 2026 18:00:26 +0800 (GMT+08:00)
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
Subject: [PATCH 1/1] riscv: dts: spacemit: enable PCIe on OrangePi R2S
Date: Tue,  2 Jun 2026 18:00:00 +0800
Message-Id: <20260602100000.2402784-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e87c6fe4f03a2kunm243339981b09f4
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSExIVklJTBpCTUNJTkofTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkhVQ0tVSk9KVUJKWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+

Enable the two RTL8125 network controllers and corresponding
PHYs connected via the PCIe controllers on the OrangePi R2S.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
Current PCIe drivers can only negotiate down to Gen.1,
so the RTL8125 cannot reach speeds above 2Gbps.
---
 .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
index b13a8d6a2670..919e5b451109 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
@@ -23,6 +23,14 @@ chosen {
 		stdout-path = "serial0";
 	};
 
+	pcie_vcc3v3: regulator-pcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "pcie_vcc3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
 	vcc4v0: regulator-vcc4v0 {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc4v0";
@@ -228,6 +236,36 @@ dldo7 {
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
+	status = "okay";
+};
+
 &pdma {
 	status = "okay";
 };
-- 
2.34.1

