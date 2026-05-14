Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97178324B2C;
	Thu, 14 May 2026 16:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778774677; cv=none; b=Hn5mKvVanZIAZXw1Hs17o91IVJm0sC7rCsyZ4hs+wEmE5qqTY3naYP6dpQChRPm6U5WPSFBbEPcgwCWsqV9ae5e6s5FtoexHDsHRsUjuoXU0kX2zGr7kOLsyDN3wsV+a/j0eslU52q+EzmernYzo5Mgn8D7QEy57qKjOJFJfZGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778774677; c=relaxed/simple;
	bh=OgPBsHavjym0+x+rjSIurOxX5deKRNYa9aAUPWIZttk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AVG4zifrd9MWhrJ1EQOIO/CG01ZCMZpCXbZNwWNPYwe0E36a5rtt6DVll0Gi7BujKUXq8LlsNXl8KsbYbr1o6rtrk9opDXTjXbt6CmG6Tn0BF2Z1iqNDBZE/3Ero45KZpVGP3S1y1K5ZGWUkQb0H2uhfxIHfFAmuRp31nISXhvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=rBQRMD17; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="rBQRMD17"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=uCwQ6g58jzW8Lt/Ec4TlnL0981ISSt8S6/Z77+D9r7I=; b=rBQRMD17Kim5nM0CBalzqAXKvh
	rhZlAc0VlEg446v7ASPmyzWa//1Ok4PIBhP+e+aA9jG0PAtlDQBB/Et1MG+G8RK3oOEZio/PQJOtY
	lKwy83VvhjFTkftxxIEzP7szn2SIuivmkqrdzxJEBqRmM7PyNWQEWMFsUQeGWOvKOF3Vz8tf2XyEt
	70/wg5qy7OAbwOZhDni/B42c+w3EWkwGoLlooFw/UymYAueNOoprDb4e+KW0QREI/eemVHuvHmg1I
	ObqgnU8QWqVpiUV+pA/Criy1ZarVEXuHgLajW+mm/ZAAM05+4lqLEXagS8HpuTXSud9ZrVdHOKsm8
	8KmC1FOA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wNYY0-00000007W2z-2OsU;
	Thu, 14 May 2026 18:04:28 +0200
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
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 4/4] riscv: dts: spacemit: enable SD card support on Milk-V Jupiter
Date: Thu, 14 May 2026 17:56:24 +0200
Message-ID: <20260514160356.1642075-5-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260514160356.1642075-1-aurelien@aurel32.net>
References: <20260514160356.1642075-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add complete SD card controller support with UHS high-speed modes.

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with pull-up
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes
- Alias it as mmc1

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index b9b8ddc8e7fb0..7cf77437e0c2d 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -18,6 +18,7 @@ aliases {
 		i2c2 = &i2c2;
 		i2c8 = &i2c8;
 		mmc0 = &emmc;
+		mmc1 = &sdhci0;
 		serial0 = &uart0;
 	};
 
@@ -282,7 +283,7 @@ buck6 {
 				regulator-always-on;
 			};
 
-			aldo1 {
+			aldo1: aldo1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -417,6 +418,24 @@ uboot@a00000 {
 	};
 };
 
+&sdhci0 {
+	pinctrl-names = "default", "uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&buck4_3v3>;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
-- 
2.53.0

