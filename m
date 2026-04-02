Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC783DCD89
	for <spacemit@lists.linux.dev>; Thu,  2 Apr 2026 10:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775124035; cv=none; b=MPQQ5rCf4PoUB4CZZrq3PpAN69MsNyU2BVt26ppfujYmjVqrkEIu7MP+9RQ/zAyGVoxlF+1dLPmqVP+eVloq9+AySfhwxViCO5oQX9FBq6vSnD/clcHZsfugBEVEkemNQ6TCvgexZ+NUExXni0V2YbauVFoEtMHEiu6oR4dhVHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775124035; c=relaxed/simple;
	bh=rLQhkgL7/DpR2/eMAnDzHILrQUxyU0OkFaCS3uF1FwU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZwnbdT3Gp7x7ayfN5fh2Fkto/OhAH+foxlpI33YtXX8WYSiE44XIbyrffh1RvCMcU5P5wHjvkXflBTkofdwkFd9Nr5HS645e4srXJVVneOQMI1jNK1VLgMFL/bHi2DeIWsdBytz4WCtPiLEse2wNfSoB+m6phe0jeNZSHbDvIs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.95.185])
	by smtp.qiye.163.com (Hmail) with ESMTP id 394e0eb03;
	Thu, 2 Apr 2026 18:00:22 +0800 (GMT+08:00)
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
Subject: [PATCH v2 2/3] riscv: dts: spacemit: enable USB3 on OrangePi R2S
Date: Thu,  2 Apr 2026 18:00:06 +0800
Message-Id: <20260402100007.110201-3-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402100007.110201-1-amadeus@jmu.edu.cn>
References: <20260402100007.110201-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d4da3053103a2kunmcba6113b55c1a8
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTEJKVkJPTk0eQxhIHxlJSlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSkNOWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09LVUpLS1VLWQ
	Y+

Enable the DWC3 USB3.0 controller and its associated PHY on the
OrangePi R2S. The USB regulator provides VBUS for USB2 and USB3
ports, but the USB2 ports are handled by a separate controller.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
index 409a6db269ae..bc68721e6263 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
@@ -40,6 +40,20 @@ vcc4v0: regulator-vcc4v0 {
 		regulator-max-microvolt = <4000000>;
 		vin-supply = <&vcc_5v0>;
 	};
+
+	vcc5v0_usb: regulator-vcc5v0-usb {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio K1_GPIO(126) GPIO_ACTIVE_HIGH>;
+		regulator-name = "vcc5v0_usb";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc_5v0>;
+	};
+};
+
+&combo_phy {
+	status = "okay";
 };
 
 &emmc {
@@ -109,3 +123,13 @@ &uart0 {
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
+	vbus-supply = <&vcc5v0_usb>;
+	status = "okay";
+};
-- 
2.34.1

