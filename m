Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792833972;
	b=W7eh/qk9izpwvLwH6O/6UiGBdzhaqGpkn6m1VI4LBczKEO90it/fVhEemu9BgJpBbCCe
	 pw2YYmHvmzjpg5Hino8NNllMNhJhc4UNBTL62+g9rxcruqlF4McoiK7rkNlgNsHPNm69H
	 Mdge+a/yBHALcP6l7Z9wcOkTqoZAbtHMwgMXcxEfOdradtNleouXUwBowzkmVbpKDnT7D
	 XXSr2m5eWwJTKDx8sdR9Sj11cKIt6iKbEhUNKHoappNgwmgA9tzHJLI6DN7KE2E8Zd064
	 Og3ZbcstC0doVIPBwB48k9WCxrnG3JYdyJaj//h4Czv/gWwMPWVeWztqC9InzMYRAAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792833972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=thIlTFdBb0qcp3PAkfPcVWyFY4ERXyIUZczud0xoE2o=;
	b=LnD4L9XzWgboTszEHc0s515y8hJll+snHWVzTbuE6CAYqQsZTZ5jqag3rKnxNQQrIgfq
	 6OTzi4hPQZVNyvqpoaYa5VxF6jhSF8b6O2jZPxJ3r7vMDnuaCQM020rUzt7g8GhNzphvh
	 oYb1SOOv24dWkgIElj+Msv7X62bw5nB346mcvoEUM1+36UbiMV6MZnbcDZJu1nLIZc+HP
	 RudFce8958mHOc7aA4LET99BALH8v+To+ss0zNTbq2VuEks6ZnP5NaZX24zCqPAYYaMM8
	 +gAKLNJT8LKUzKaUO6KvO++sfwFxfWjXvKhtyIutcgJu8lBFsGAvWqL+Rka0UAi/wxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TTphWyCR;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6888C606A322
	for <spacemit@lists.linux.dev>; Sat, 24 Oct 2026 09:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6888C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TTphWyCR
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3adf5f6833cso136971a91.0
        for <spacemit@lists.linux.dev>; Sat, 24 Oct 2026 02:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792833971; x=1793438771; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thIlTFdBb0qcp3PAkfPcVWyFY4ERXyIUZczud0xoE2o=;
        b=TTphWyCR6K7cpC0JXQh0PD4UgSsY9EXYXbZFcHgl72vmybep9tpdlmiIO7vOmbR/uJ
         5bPpHuwf0XpUEO4TJcpt2059dhLTsMB85DycXOv7yu2HgRRyAeijzIF3Y2yO6Iwy5+ha
         PtFu9VgKWuCVD7V4HHJKy35nspV7BB4usgh+sJY3kknuI0leMGrSFyjAiX6MJ3Slq+Ix
         5Gvdnkb6pro5AeBhDEO7nohxVbOKilS/HpeRz5fsokJRTiPhzEP/M8GLmbdDwOVm0qeg
         IFC0lyMLnRijzgSUy0xlY+Vgp0Nm8bAf1fsphyotx6ZpOxTqXA6ScQEnsGeETsSqUSlk
         J4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792833971; x=1793438771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=thIlTFdBb0qcp3PAkfPcVWyFY4ERXyIUZczud0xoE2o=;
        b=hYKvkiUjcM84OEv6bgCqXppyAzzvC7+JWOCEJScTSPU4nbDJzpZX/9W1ntTKM4YaMR
         uahFivuxRq4CnZFjgEH689RfNRnV35vP2WN8mzGPgDoDHZ4U8tWn0qCfA/NJptFMhltY
         0drJLO+7lIB8gDcIX/tmXbu9nVJh9BeVq17/Xadg6U/AroMKgDVpZ57Ba5t2QadUZa8g
         5rK0+OU/OQr0Bf1y9DW92u7USqGg3cQKsN7c0wuuXXXFaq+Ltk0bjvuSO2ieLPzpSH1a
         r5RJjmZGheQCXnYCv22qNum8Vt40jZnVw2sBseaBGKYR0EPB/HtDJRCDqJNvDITRM8cP
         W7VQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnD39GeC1DUWlZMExX8u81UA0+kwLeBUGPYewQLIuFunxexJRckv7lDSyNT2P7cxmvTOArgntV+Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ3qHZ33I2WMLZP06ttOH2HZw+ut4OVKnypcjT0fpqwW1Bea/l4
	vt6DdmweaDs+We/9rbVMt5YmPZURhn9PepLMMmr1TD9ZNce4j6GmlZID
X-Gm-Gg: AYBFou1aE//7poVqFTcVTxGULkgkbPpKmAZKn+gixhqBo4C2iA6ohcYgRF1fkwAF+Oq
	xB61nzp0yO4fJ31DTuNiqzhtf2iifAb2bcX650dqX2G2YON89RC/84+YA7oWSSbXcguAyPcLgBX
	cI/nfjXDuhU2h6o8Y2XvoRF6BYYpT9bBs/9karCuSR8zBe6pcG0mLjTIBkuu7XDetiCJ0Ikv8BH
	4zGUoTmhouDvpWapDNV1vwsSCYnFPlVcuD9oBxu0q3YAUbWVlyAyg76X4NxfagbS9vSabS3HTGZ
	hgYoA+ILNn5s5QRRWk8M0CVNWyk4v2yJw7tMIVV3ec+kxmIZRyd8xQ3k66Hly/aGfMgIk/25YCQ
	OpLgk7nXxIRIsJJ7XX84mo2H00P5AcEqrWMHCHOQZn6RtQ4aFk/3dZ7wQhb7DcoAbLz/D5OQyz7
	3ZgS9Mfy2/qU/DLiByNkOPLrKUkt1Ub0ummMEnEZPcESmiK++3bIBghtFPhwpvJYjpql8Q0VHyW
	XEA+Je/vLPRJjnwhiFqHu2OFbeSre+BmpIcUKR6DRZhufdoizwl8vhEyKwI2YbdrnFMiDSX1RHJ
	7sT4L50/TgeRzXqa8D+0kdXJeH1CJ/Kbmhem/jPhRvEqid2N7AoElbZlLSy08Fvpim/RKRv6sst
	j0QV0wyUuOUtq/ZB9Pa0n75IW3PF4ImebSx8=
X-Received: by 2002:a17:90b:35c6:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3adeae64f23mr1257289a91.40.1792833970704;
        Sat, 24 Oct 2026 02:26:10 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba38910sm1392312a91.1.2026.10.24.02.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 02:26:10 -0700 (PDT)
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
Subject: [PATCH v3 2/2] riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram
Date: Sat, 24 Oct 2026 17:25:58 +0800
Message-ID: <20261024092558.143621-3-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024092558.143621-1-alan.tseng.cs@gmail.com>
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The board EEPROM at 0x50 holds the DRAM configuration (number of chip
selects, data rate and type), which has to be read before DRAM can be
trained. The P1 PMIC at 0x41 supplies the CPU core (buck1), the 1.8 V
rail of the EEPROM (buck3) and the SD card I/O (aldo1), which have to
be set up before that. Boards that boot from SPI NOR also need the
flash.

Mark these board devices bootph-pre-ram on the boards that have them.

Reviewed-by: E Shattow <e@freeshell.de>
Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi | 5 +++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 5 +++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 6 ++++++
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    | 6 ++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  | 5 +++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  | 6 ++++++
 6 files changed, 33 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
index 81c40df2a3..5d1132f5a9 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
@@ -71,6 +71,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
+		bootph-pre-ram;
 		vcc-supply = <&buck3_1v8>;
 		pagesize = <16>;
 		read-only;
@@ -100,6 +101,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&reg_vcc_4v>;
 		vin2-supply = <&reg_vcc_4v>;
@@ -113,6 +115,7 @@ pmic@41 {
 
 		regulators {
 			buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -127,6 +130,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -155,6 +159,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 58035d886b..90c4585d94 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -194,6 +194,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
+		bootph-pre-ram;
 		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC1V8 */
 		pagesize = <16>;
 		read-only;
@@ -223,6 +224,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&reg_vcc_4v>;
 		vin2-supply = <&reg_vcc_4v>;
@@ -236,6 +238,7 @@ pmic@41 {
 
 		regulators {
 			buck1_0v9: buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -250,6 +253,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -278,6 +282,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 635e95aad1..93f486ba60 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -208,6 +208,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c04";
 		reg = <0x50>;
+		bootph-pre-ram;
 		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC18 */
 		pagesize = <16>;
 		read-only;
@@ -230,6 +231,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&reg_vcc_4v>;
 		vin2-supply = <&reg_vcc_4v>;
@@ -243,6 +245,7 @@ pmic@41 {
 
 		regulators {
 			buck1_0v9: buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -257,6 +260,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -285,6 +289,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -386,6 +391,7 @@ &qspi {
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
+		bootph-pre-ram;
 		spi-max-frequency = <26500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 23f32a8a3d..ce7342ed82 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -167,6 +167,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
+		bootph-pre-ram;
 		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC1V8 */
 		pagesize = <8>;
 		read-only;
@@ -199,6 +200,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&reg_vcc_4v>;
 		vin2-supply = <&reg_vcc_4v>;
@@ -212,6 +214,7 @@ pmic@41 {
 
 		regulators {
 			buck1_0v9: buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -226,6 +229,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -254,6 +258,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -353,6 +358,7 @@ &qspi {
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
+		bootph-pre-ram;
 		spi-max-frequency = <26500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
index eb77aae9d6..83ad1cc06d 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
@@ -158,6 +158,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
+		bootph-pre-ram;
 		pagesize = <16>;
 		size = <256>;
 		read-only;
@@ -187,6 +188,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&vcc4v0>;
 		vin2-supply = <&vcc4v0>;
@@ -200,6 +202,7 @@ pmic@41 {
 
 		regulators {
 			buck1_0v9: buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -214,6 +217,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -242,6 +246,7 @@ buck6 {
 			};
 
 			aldo1_3v3: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 790234f355..dba5f8a021 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -185,6 +185,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
+		bootph-pre-ram;
 		pagesize = <16>;
 		size = <256>;
 		read-only;
@@ -214,6 +215,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&vcc4v0>;
 		vin2-supply = <&vcc4v0>;
@@ -227,6 +229,7 @@ pmic@41 {
 
 		regulators {
 			buck1_0v9: buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -241,6 +244,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -269,6 +273,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -366,6 +371,7 @@ &qspi {
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
+		bootph-pre-ram;
 		spi-max-frequency = <26500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
-- 
2.43.0

