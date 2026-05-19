Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1142F7F0F;
	Tue, 19 May 2026 04:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779164120; cv=none; b=oJfjDQ/Zc6ZY7XsziH2AsBqzB/BBcRN4L8zj2MyWEbjMJlaPF6UkyqMjGlCoSMdyO4APAO/UgBiPWSy9NBKreRkXb+h/wYfXPGg8w7voumoleKLF1eCn25ybcKYKMwKc4Ccmwd/b+TvJ1QBJVq9ej2EVMjCUxbt9p+KYMf8cY1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779164120; c=relaxed/simple;
	bh=1a4dLbevmVwGj8dZNzUymQK8YF1/rV8MzeI3w56WwbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gD+JQxTbLukEQJ4UtQP8ftwCdCHGazScoISf4A3VJwFcXqHAgSj/hS1YDZbn0gfiN1SR7fcfP+i616sSANQPvsu9zWlnR4eAkh+eciCfsbtfpoJItZMHx2Yz26aHAXFRAEu6VhZhXkguyJeU2rk11KtP7BDfI7hiWuTJsstaLgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=kvY5nKqv; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="kvY5nKqv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=bTJWV9aWXtI4yET6N93LcOw34KuwznQcw/HXe4c80CI=; b=kvY5nKqv0iwfbdDmsmWdZGV8cL
	bRo9ltIvgfnxdy6Xlsa2DN8D9ELHVBj33lQ78dStL1Qsf8nlgXyJjzwoSSITksFZSNomeKerD1hxJ
	6NrrZYuiY81H+oIfjYLuQ71SMCerEqHZpHpKx0Qhyq1XhOdBI1v/eCG6MEVk9vkdugwngtxRFAjzQ
	iEVkO97MYP2kbbhK/X3aGQBaQdwt/FufY18C2eq6GxNi0r+OsSfq2P/56TsoD5Q8obHqH0o8+fOC4
	Zr3pvY1sS7hJfnXfprwGuAEw1BeJpaUltNGSSwg4a+DJ0dwhb0hg1aXbCEaCksyM+jZRWfa/G3SCu
	5DeCBolw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wPBrI-000000032ln-1GvH;
	Tue, 19 May 2026 06:15:08 +0200
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
Subject: [PATCH v2 4/5] riscv: dts: spacemit: enable SD card support on Milk-V Jupiter
Date: Tue, 19 May 2026 06:12:38 +0200
Message-ID: <20260519041458.3287843-5-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519041458.3287843-1-aurelien@aurel32.net>
References: <20260519041458.3287843-1-aurelien@aurel32.net>
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

v2: no changes

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index eb53198b95061..0c13b7a401c3f 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -18,6 +18,7 @@ aliases {
 		i2c2 = &i2c2;
 		i2c8 = &i2c8;
 		mmc0 = &emmc;
+		mmc1 = &sdhci0;
 		serial0 = &uart0;
 	};
 
@@ -283,7 +284,7 @@ buck6 {
 				regulator-always-on;
 			};
 
-			aldo1 {
+			aldo1: aldo1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -418,6 +419,24 @@ uboot@a00000 {
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

