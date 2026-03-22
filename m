Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C5837E2E2;
	Sun, 22 Mar 2026 20:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774211655; cv=none; b=u41FERGW1z0Z9VziOqLtHL0ryCM2no7ZbU8yyUtgwPzd6g8jVQ1QexY6+dsi8e2P9omKcaodyRkEWgTr1MIdUPDVSh21S07ghWshqY4H/D/nQQkcyLGI9bq/yACjHtPcYXzh2iFJ1BvJNwAimTDcbbFeyJcqS5ZKGiYRLU3zPAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774211655; c=relaxed/simple;
	bh=40bDsfLBfIMAkeSyiFV0WzYzeWf0ubUhF4jk7BdStds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VLRtCJ4gT79DXo4/NJaVs/DRJB4wGKxoyggoEK2xC8cNIp4RxPUpXPK9vh1OCbO20mPGM1zouJJ7TGw5vtVQi5T/WyOaKUy2TY1AcPQq7feC/zqqth77v4CgVGo1mLAnjf0HblYRrU2ntpKLAJHnO7195/RAt2kTbRCHFZ0A4V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=dFcm5q/5; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="dFcm5q/5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=Q9zYMQ/+P5ZH+YqXhnTOnd4b/fagZS5108Ie9UShcTA=; b=dFcm5q/5A9pxnqsWTkpjpaDRmO
	oCbtuXQVCbxCSyU/oPISkI2KMBzZiqjXbXQPIHxNsYBxH1x8Qp4eyji/3P5+nugVPuYQsFr8FvlON
	YvZ5l0UYoRLIoIXGPrOirDP/2OsQ2+WsDoRTeQfPi2QdCkuR5kqYcHFw9VQ3mxAR69PsrODO1F1Mr
	FNc1Jm82EQZSc3JB7fB0zuwM9MkmkATebRYSfQIObVyV5QjFaDKufv/L3gBZS3e1l5GoUEhVK9Z3H
	GFHFS31YCj6QO9CBh5DaaSZgDmTm3gdzwTU1/3vu4ZhvE4h5PabvKxHvaUoFjLeZxARnmwWy0k1Ll
	dYEo1Wog==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1w4PUy-0000000Aseo-0wcf;
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
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 4/6] riscv: dts: spacemit: enable QSPI and add SPI NOR on Milk-V Jupiter
Date: Sun, 22 Mar 2026 21:28:35 +0100
Message-ID: <20260322203356.2206927-5-aurelien@aurel32.net>
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

Add the QSPI controller node for the Milk-V Jupiter board and describe
the attached SPI NOR flash (GD25Q64E).

The flash supports a frequency up to 133MHz (80 MHz for reads), and the
SoC supports a frequency up to 104 MHz. However tests have shown that
the flash is not reliably detected above 26.5 MHz, consistent with
frequency used in the vendor kernel. Therefore, use this frequency.

The m25p,fast-read properties is taken from the vendor kernel.

Add a corresponding flash partition layout, matching the layout and the
names used in the vendor U-Boot.

Also add the bootph-pre-ram property to make the device tree usable by
early firmware/bootloaders without modification, as U-Boot is stored on
this NOR flash.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 44 ++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 836311c3f035c..05ab5df50be51 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -173,7 +173,7 @@ buck3_1v8: buck3 {
 				regulator-always-on;
 			};
 
-			buck4 {
+			buck4_3v3: buck4 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-ramp-delay = <5000>;
@@ -256,6 +256,48 @@ dldo7 {
 	};
 };
 
+&qspi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_cfg>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <26500000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		vcc-supply = <&buck4_3v3>; /* QSPI_VCC1833 */
+		m25p,fast-read;
+		bootph-pre-ram;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bootinfo@0 {
+				reg = <0x0 0x10000>;
+			};
+			private@10000 {
+				reg = <0x10000 0x10000>;
+			};
+			fsbl@20000 {
+				reg = <0x20000 0x40000>;
+			};
+			env@60000 {
+				reg = <0x60000 0x10000>;
+			};
+			opensbi@70000 {
+				reg = <0x70000 0x30000>;
+			};
+			uboot@a00000 {
+				reg = <0xa0000 0x760000>;
+			};
+		};
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
-- 
2.51.0

