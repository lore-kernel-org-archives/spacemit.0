Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A4F3E5A32
	for <spacemit@lists.linux.dev>; Mon, 12 Oct 2026 23:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791849398; cv=none; b=GE3D49j+PGkGvpjT1OgkoA4fUU4GtXs7XXyhAXESnF601t1aVTBhxkJn7FQjFkBG3aCYCLrUo8S6jdcLxYhSVuwdyX0jOr33X+JX8IuCY20L3m+En5cb/FyEMTNEDT/gayjXOxzcpNLsCSUCuOgq67gPwGu5JZ/4erMFPDCArlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791849398; c=relaxed/simple;
	bh=lGsGKkyy9d4NARIdZRFLBjgm8D1dG3invfof4OQu4rs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RzrMZsHP+0Brr06dLM4OjpCS9AXhsrYGLBKTSLNjBajvPQNSDblporM16pCzn9wckGjNQFNB2AxDcRhzLeR3kHvkVje88ghQtY3lsM+XX1BzRWcR4WQCvDObVfWwn3WzBgfS+/FCQirnbP0aPYl3qbpP4XDshUP8zOtQ2YJ7pjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qj6zL6F4; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qj6zL6F4"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3514e7cbbbaso6007222eec.1
        for <spacemit@lists.linux.dev>; Mon, 12 Oct 2026 16:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791849396; x=1792454196; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GIe3e2jypmCgxdV2fa+T8K7iVPWqEf6EkwCnIkIhFj0=;
        b=qj6zL6F4rBrY0vsjSxGhx+d4rlbf7RCjfOvBivE3C4niGZi7BVfsZARJf/R+xTxAlt
         sbGOAZW9/r6L/gE0PjsoKYH8LJsjSN+3V6bmBYiG/nUAsqkXqsiQ+VwRvuqjF9ekhJvy
         9i8VqK71lpbG6iWBTp9C9mmXVsg/Te6uIgYpledpDEjjw5h8kFxeN8Rx/X9FddvPjggS
         28ZO+oV2g6bsYovejrbTQMPCmxruh/aHN8K8QtTxVH+hznilmuQiiVy9a0rSdon9SnYh
         XAHZOE7frCm24meyFjeFhWgdGHE5SAItH6AfTcFUKz62LqDvmiGh/7m9nMWJe4TDyPVs
         i89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791849396; x=1792454196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GIe3e2jypmCgxdV2fa+T8K7iVPWqEf6EkwCnIkIhFj0=;
        b=uoVwmwr2Axc/PEZYIPfYWZI3WPUd93T6Bks9bUAhCWklxILKEu1OlqAWCI/hTV2thM
         CCw40XQ2NzGEHOp3O8uH7HWLxVx6xLq0vSfsD+nVr+b1lM7c6uIhFFzJJS4roV7Qe1MX
         y5DvZmCerIGI6XlgcT8O3xanPTLVX6+GpajMHcyUCUs20UCbfwH2xt1nvZ1zt4oYkEQj
         f7BCL0EXTkK2fPAkUCeBDgyIQ/KTMY/JL0wPjxzlD1vnDwcFg7zngEnC+o22CwGS2Xj8
         dJio7PdIet8Kky2EhwhE+JTmMd0mjoVQDBaNDfTUvHTlAC855Byr7a8fBf9lfDiYJjIu
         S61w==
X-Forwarded-Encrypted: i=1; AKwUvBxWP6UILEwlHwC0TEoa5C4C7iAm6KZDwB/L4NUMNU234WavDQP8ZQvNGbiw6iz+xP3c6OHF3y2i7Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ9lJdOt16fyqW9b6LBGfUcT/uvzod3kCulfS8xJ1SONEBtkKXB
	vdbQNB31IhnKKBMzvlhXgcbOB9wJ0obMVJ+MCbwSY/0Dc+dWY64K8w8v
X-Gm-Gg: AYBFou1URCFsXS12zNjDd9TGeCx0SuvpJfAyQvt1AJyEKmvBwKL4zzOnIPRkWmuaVNw
	vUmBC0HDoUhOynvi+Cgl9TFh7YT/t6TBbBtalmAGFGHckQiRqZlT6E7rjKrY+P9eKoE7TcuacaJ
	KeEbk3ScwiIL6ZCmU1cUOVsF7YJbHBodhw0vUQjNe+bigP+z8KWNQJuvvENgF/F6hx2TyTJD28z
	9JHiFAiZxbgurd0czZ3vZSGwINVEQaoDs5lpuPqfbT+AF+RoYFBo8Ml7H/Bj3fmtNn8chtwsbEa
	7RYlPieKDXpDvXI0cABwxkVrZvgPODze9dsyo2ITqi8oBbM2Gx7KDdekn2WQU/YnNacD8ALfixS
	weMmfl/MtITx/sYb+Nd05qOcBxxXRbban7u8ltxcZH9+9hWr7KpYyWntm4Sb0amYSJ5cpFtnRrn
	ngBFPiz55J1zNYnCN8JkmKts9sGblu9/QaNca5SdhMAQlhdsIP4tWj20s2cTObhVxY8vK1+ZVKY
	ClFVFKlsjd95Urn3pHO5K/dtspwwvCbTi3VyJ5biqtMNpX0NXGuKb6gY4dlRukwb2Hs8RZRxDKc
	p9m1hPgGFGToswlYgjKZhjmEWID0KQOUBDhcD2CnResGAJsS7nWlCw==
X-Received: by 2002:a05:693c:26c1:b0:351:7e5d:2de9 with SMTP id 5a478bee46e88-3537ddd6142mr13773283eec.1.1791849395693;
        Mon, 12 Oct 2026 16:56:35 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b690af3easm8686145eec.1.2026.10.12.16.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 16:56:35 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram
Date: Tue, 13 Oct 2026 07:56:24 +0800
Message-ID: <20261012235624.77993-3-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012235624.77993-1-alan.tseng.cs@gmail.com>
References: <20261012235624.77993-1-alan.tseng.cs@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On K1 boards an SPL reads the board EEPROM (0x50 on i2c2) to identify
the board, and before DRAM training it programs the P1 PMIC (0x41 on
i2c8) rails buck1, buck3 and aldo1. Boards that boot from SPI NOR also
need the flash on QSPI.

Mark these board peripherals, and the I2C buses they sit on,
bootph-pre-ram on the boards that have them.

Assisted-by: claude-opus-5-5 dtbs_check
Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi | 7 +++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 7 +++++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 8 ++++++++
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    | 8 ++++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  | 5 +++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  | 6 ++++++
 6 files changed, 41 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
index 81c40df2a..6269d2ba7 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
@@ -64,6 +64,7 @@ &pdma {
 };
 
 &i2c2 {
+	bootph-pre-ram;
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c2_0_cfg>;
 	status = "okay";
@@ -71,6 +72,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
+		bootph-pre-ram;
 		vcc-supply = <&buck3_1v8>;
 		pagesize = <16>;
 		read-only;
@@ -93,6 +95,7 @@ serial-number {
 };
 
 &i2c8 {
+	bootph-pre-ram;
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c8_cfg>;
 	status = "okay";
@@ -100,6 +103,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&reg_vcc_4v>;
 		vin2-supply = <&reg_vcc_4v>;
@@ -113,6 +117,7 @@ pmic@41 {
 
 		regulators {
 			buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -127,6 +132,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -155,6 +161,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 58035d886..e74505984 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -187,6 +187,7 @@ &qspi {
 };
 
 &i2c2 {
+	bootph-pre-ram;
 	pinctrl-0 = <&i2c2_0_cfg>;
 	pinctrl-names = "default";
 	status = "okay";
@@ -194,6 +195,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
+		bootph-pre-ram;
 		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC1V8 */
 		pagesize = <16>;
 		read-only;
@@ -216,6 +218,7 @@ serial-number {
 };
 
 &i2c8 {
+	bootph-pre-ram;
 	pinctrl-0 = <&i2c8_cfg>;
 	pinctrl-names = "default";
 	status = "okay";
@@ -223,6 +226,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&reg_vcc_4v>;
 		vin2-supply = <&reg_vcc_4v>;
@@ -236,6 +240,7 @@ pmic@41 {
 
 		regulators {
 			buck1_0v9: buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -250,6 +255,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -278,6 +284,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 635e95aad..406b7ca16 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -201,6 +201,7 @@ &pdma {
 };
 
 &i2c2 {
+	bootph-pre-ram;
 	pinctrl-0 = <&i2c2_0_cfg>;
 	pinctrl-names = "default";
 	status = "okay";
@@ -208,6 +209,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c04";
 		reg = <0x50>;
+		bootph-pre-ram;
 		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC18 */
 		pagesize = <16>;
 		read-only;
@@ -223,6 +225,7 @@ product-name {
 };
 
 &i2c8 {
+	bootph-pre-ram;
 	pinctrl-0 = <&i2c8_cfg>;
 	pinctrl-names = "default";
 	status = "okay";
@@ -230,6 +233,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&reg_vcc_4v>;
 		vin2-supply = <&reg_vcc_4v>;
@@ -243,6 +247,7 @@ pmic@41 {
 
 		regulators {
 			buck1_0v9: buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -257,6 +262,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -285,6 +291,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -386,6 +393,7 @@ &qspi {
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
+		bootph-pre-ram;
 		spi-max-frequency = <26500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 246f8f2ab..0531bd003 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -127,6 +127,7 @@ &pdma {
 };
 
 &i2c2 {
+	bootph-pre-ram;
 	pinctrl-0 = <&i2c2_0_cfg>;
 	pinctrl-names = "default";
 	status = "okay";
@@ -134,6 +135,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
+		bootph-pre-ram;
 		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC1V8 */
 		pagesize = <8>;
 		read-only;
@@ -159,6 +161,7 @@ num-macs {
 };
 
 &i2c8 {
+	bootph-pre-ram;
 	pinctrl-0 = <&i2c8_cfg>;
 	pinctrl-names = "default";
 	status = "okay";
@@ -166,6 +169,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&reg_vcc_4v>;
 		vin2-supply = <&reg_vcc_4v>;
@@ -179,6 +183,7 @@ pmic@41 {
 
 		regulators {
 			buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -193,6 +198,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -221,6 +227,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -320,6 +327,7 @@ &qspi {
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
+		bootph-pre-ram;
 		spi-max-frequency = <26500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
index 2d1ba34cb..8e9bbbeb1 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
@@ -113,6 +113,7 @@ rgmii1: phy@1 {
 };
 
 &i2c8 {
+	bootph-pre-ram;
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c8_cfg>;
 	status = "okay";
@@ -120,6 +121,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&vcc4v0>;
 		vin2-supply = <&vcc4v0>;
@@ -133,6 +135,7 @@ pmic@41 {
 
 		regulators {
 			buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -147,6 +150,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -175,6 +179,7 @@ buck6 {
 			};
 
 			aldo1_3v3: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index b907a1396..857b4ebe3 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -143,6 +143,7 @@ &pdma {
 };
 
 &i2c8 {
+	bootph-pre-ram;
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c8_cfg>;
 	status = "okay";
@@ -150,6 +151,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&vcc4v0>;
 		vin2-supply = <&vcc4v0>;
@@ -163,6 +165,7 @@ pmic@41 {
 
 		regulators {
 			buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -177,6 +180,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -205,6 +209,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -298,6 +303,7 @@ &qspi {
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
+		bootph-pre-ram;
 		spi-max-frequency = <26500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
-- 
2.43.0

