Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF002727F3
	for <spacemit@lists.linux.dev>; Mon,  2 Feb 2026 10:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026534; cv=none; b=uk79IINDXlXCZRkLLSDULWXI0yH0svzCub/GY2ibcrbnshlCo1Ke96SyBI/5KpsiANczv2mubUCiSQuvH25f+WnmvXs2qCd+XPHnGAG1mzwF3Q4Y3kbsyNFAkxg9JSAjFg1zAB+8UuIxdwXN7OvhT7L8U42iPLj43OrL0Gr6NiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026534; c=relaxed/simple;
	bh=EkERK/YvJZVeEAaxQXtMPwfz12Ghm/oBYLVlx31ZR+o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lMWkk+kYk9O6a+dReWpyZPM2LPqLBiGfCqC9+lIM0Y0T1UmHocRiam6Q5Zc1Lk4EOzyDPl9oE+fyqGKjJaY6JtpV1TxUgBYJmHQwAmpOFcbnD466rNUlD2THu8+CvY99qCtU97t4TIfR14RKEArC8+QbF1IR7re1ZCmfq1/0ihk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [58.61.141.99])
	by smtp.qiye.163.com (Hmail) with ESMTP id 32ccae3d3;
	Mon, 2 Feb 2026 18:02:04 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 1/1] riscv: dts: spacemit: Add 'linux,pci-domain' to PCIe nodes for K1
Date: Mon,  2 Feb 2026 18:00:00 +0800
Message-Id: <20260202100000.19176-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c1dcd5e8403a2kunm5c5f4d8f1ec8af
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZH0gaVkgfHR9CH0pKGk8aGFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VNSlVKT0pVQkJZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVUpCS0
	tZBg++

The SpacemiT K1 SoC has 3 PCIe EP controller nodes. Add the
'linux,pci-domain' property to assign a PCI domain number to
each of the controllers instead of assigning it randomly.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 529ec68e9c23..d2015201f8e5 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -1033,6 +1033,7 @@ pcie-bus {
 			#size-cells = <2>;
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
 				     <0x0 0xb8000000 0x1 0x38000000 0x3 0x48000000>;
+
 			pcie0: pcie@ca000000 {
 				device_type = "pci";
 				compatible = "spacemit,k1-pcie";
@@ -1044,6 +1045,7 @@ pcie0: pcie@ca000000 {
 					    "atu",
 					    "config",
 					    "link";
+				linux,pci-domain = <0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges = <0x01000000 0x0 0x00000000 0x0 0x8f002000 0x0 0x00100000>,
@@ -1087,6 +1089,7 @@ pcie1: pcie@ca400000 {
 					    "atu",
 					    "config",
 					    "link";
+				linux,pci-domain = <1>;
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges = <0x01000000 0x0 0x00000000 0x0 0x9f002000 0x0 0x00100000>,
@@ -1130,6 +1133,7 @@ pcie2: pcie@ca800000 {
 					    "atu",
 					    "config",
 					    "link";
+				linux,pci-domain = <2>;
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges = <0x01000000 0x0 0x00000000 0x0 0xb7002000 0x0 0x00100000>,
-- 
2.25.1

