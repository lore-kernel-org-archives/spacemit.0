Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72CC26ED3F
	for <spacemit@lists.linux.dev>; Mon,  9 Mar 2026 03:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773025219; cv=none; b=KK2VcnOX+nj0O+bFbSEZ95a5sPK2gQRkZAwvTSYiv9Wr3JKXJPsAX5RNXdQ6TQIjCTKywLq84YPn0pRyheJ5cbA5Ky9Jw6/F2B6eXw49NIJMBBSWurNcFRLWtNR212JKXxWQ3g5d9d7wYlmH2p1bZta9gjyiDwwa5XNMM9tbXIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773025219; c=relaxed/simple;
	bh=wOByeN28U500aRlyt5TiYPPlyULkXcdC8HcZaurn6ik=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=erG47W6ARIhC48tgCZCXRcVd9CyvF6979JlpAYYPNvBp7GsDXpYaGC6byFZkqSVzP0tSOKkmJdEjgFyWZfTPDQImoIk+8SJe01GaRCvI4v15fBBU4FzXE5EZ8+ZB04YqJmoSlNow4Vc7NUWg+LwSJg4cimGRMd8yvZPIokI1deE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [58.61.141.9])
	by smtp.qiye.163.com (Hmail) with ESMTP id 362f93ee8;
	Mon, 9 Mar 2026 11:00:05 +0800 (GMT+08:00)
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
Subject: [PATCH v2 1/1] riscv: dts: spacemit: Add 'linux,pci-domain' to PCIe nodes for K1
Date: Mon,  9 Mar 2026 11:00:00 +0800
Message-Id: <20260309030000.1157040-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cd0899e1e03a2kunm4cb197698fbcdb
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSkMeVkJNHkofQhlMTB8YTlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VNSlVKT0pVQllXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0tVSkJLS1
	kG

The SpacemiT K1 SoC has 3 PCIe EP controller nodes. Add the
'linux,pci-domain' property to assign a PCI domain number to
each of the controllers instead of assigning it randomly.

This creates a stable sysfs path, allowing userspace scripts
to reliably target specific PCIe devices (such as PCIe NICs).

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
Changes in v2:
- Improve the commit messages
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

