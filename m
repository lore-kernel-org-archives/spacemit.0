Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C4C23183B
	for <spacemit@lists.linux.dev>; Fri, 16 Jan 2026 10:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768557638; cv=none; b=jVA9XrzIJW124ODw3ewPjBntliKuMigG4ol6gwhEOEnFwO62bVqqHRGUa6qVdpElSk7W0K6KZlDa+REK+yX3JgfFSA4P8t9/B9L8eB+LJ4Yy6InZagmBOQ8CbWdb5iXFvNDvKsPZq7sB1pRDfsltWbfNOG9a4wdFV4XyGEugyrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768557638; c=relaxed/simple;
	bh=1c3UgWwL0qetueHy+EKL+AbG3Qff4kKIvUuLdxFjtmk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cGw3D4h3ZGpV4W0XWy4gFeoaXZxfm2Uoznhgmlxl/h7B/ZgJCY6wCB9cevak3K2yi2lJwjUQ5kkpacjf/vat5733lhFEG+LrxC/ZgpPuHyFYYaIY1OdfPfsgVRaMLXvTAEuuWjZwrqSzFXfp6Tw7kl5sf0ev7uGl6K+UTdaqToQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.94.194])
	by smtp.qiye.163.com (Hmail) with ESMTP id 30e8ca650;
	Fri, 16 Jan 2026 18:00:33 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 2/2] riscv: dts: spacemit: add fixed regulators for OrangePi
Date: Fri, 16 Jan 2026 18:00:01 +0800
Message-Id: <20260116100001.208334-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260116100001.208334-1-amadeus@jmu.edu.cn>
References: <20260116100001.208334-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9bc63fde9403a2kunm651e977725ca95
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaQxpDVhkYGU0dTkJDHk1LGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSkJPWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg++

Define the power input and the 4V / 3.3V power as fixed regulator
supplies for the PMIC, PCIe and Wi-Fi.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi b/arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi
index b4808f258adf..c71c5bc1d341 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi
@@ -17,6 +17,34 @@ aliases {
 	chosen {
 		stdout-path = "serial0";
 	};
+
+	pcie_vcc3v3: regulator-pcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "pcie_vcc3v3";
+		regulator-always-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_5v0>;
+	};
+
+	vcc_5v0: regulator-vcc-5v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_5v0";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	vcc4v0: regulator-vcc4v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc4v0";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		vin-supply = <&vcc_5v0>;
+	};
 };
 
 &eth0 {
-- 
2.25.1

