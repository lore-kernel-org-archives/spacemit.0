Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.243.244.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793773335;
	b=JBAiWexcD53p50NHMExK6z69r9YAcLMFjCdINFwdgNx5le8wtu7jod47RsZ57MqhARYi
	 sh+rzGNfnKl5nzsw3ya44U/zWYzZ/gr+LdZtniv1+rdQSWdi/3xV41fOzjJuTtw+M8hHI
	 fP/jRKHw3xl+gqCYoC9Fsst7YupWDsyQmSd2qWS9Yw0NONgIcHRPgV0hIPgLu/vg6VGNa
	 XWRnfZe2Aw281LXVhDeFrHl4GEDJDL4OvDgQdVy9vxrJMVqsEPG9azJ2bWbL+Loijhf4g
	 NN0N6rLilSYWEeMWQVeOfHA8aVxtzJ3+3yMgKXPUusHn+t9vo4Wvhi9Q8GBC7Wm5pEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793773335;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=9PKHtdpFEFOH9mE7ZMeSyTP1BlMEKj3lvBaNGnj2fkc=;
	b=3blmmal4BWiXOBezEwj8O0X5PTkEz1XQ4nFpJjxgS60GQN+GdMsaqdSUYhoq+IQx0oCc
	 cgNtVuCXP/n8Qw1xdCYyYBJoayVM6ArAe/GzitSy1JZNzo6NXBPE7Nw4hcT8Mq7dyJ3n/
	 CR3KYyEs8BKHedKWPFDbHQL+KJFm/Q6EeOn9vz9oj347VTUKOUBe0JL+6eSd9Lb/qIcrb
	 w6rnPVV8isYgqz9HYkz9Q+Phhk2Lz6JJMlOCU6/Ncuyi06/IWtcuP8IAyjSvj9SkEBPeV
	 PEIJ3R346RkTVrmRKfYglAd/FEJ0Pu3j+3dQYBS8gBEMopxIcctMzER2c+HbDzWObbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Qxwxw7ua;
	arc=none smtp.remote-ip=54.243.244.52
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32E0606A326
	for <spacemit@lists.linux.dev>; Wed,  4 Nov 2026 06:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D32E0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Qxwxw7ua
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793773329;
	bh=9PKHtdpFEFOH9mE7ZMeSyTP1BlMEKj3lvBaNGnj2fkc=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Qxwxw7uaBiKsCVnHeh7+lAfJzKSVMPA9c6REXnvPeUQlh/l7T3OUwrFtavVl7AGgk
	 wAYJYNoure1YGWoa6Vsx/EwAwGKOUbrHESFPkEswHJ/Jr5g9TlEk2vgdLdXZzAd1KT
	 TcQNwHp++HTZXeH5cIkX9CN1n4CZUCHvkg8a16ys=
X-QQ-mid: zesmtpsz5t1793773328t132ddf6f
X-QQ-Originating-IP: 8CaA/fdFjmQn/Wma+2pUZUIypAHN9+lMxI7DmPHCLJw=
Received: from = ( [183.48.245.66])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Nov 2026 14:22:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16598904818912466911
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 04 Nov 2026 06:21:51 +0000
Subject: [PATCH 2/2] riscv: dts: spacemit: Add K3 BS01DCMA support
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-k3-bs01dcma-v1-2-794025247e4a@linux.spacemit.com>
References: <20261104-k3-bs01dcma-v1-0-794025247e4a@linux.spacemit.com>
In-Reply-To: <20261104-k3-bs01dcma-v1-0-794025247e4a@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6940;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=4JHu1HEc/BfR9PcAoEAwhMMbAz5mXB+iuDd66YkyMQU=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmvzrOcefbOe0dfw9o/SsEmjwwjRN1SI5O1fJ9z+EesP
 Kfw4YViRykLgxgXg6yYIkv3A55tBT5RtgUChb4wc1iZQIYwcHEKwETK9zP8d3rFbRbvW3ZQOWpN
 ru57h5L02VtmhNgmqq4/6Xjvj6mLF8NPxuiCpZzLu48vKbgQvds0YztDM+ey4+W/M9rTd/MFe7j
 zAwA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NikuFQrTsu3BRSYAov1/McXdKxb8EIzkR7h8vGrsi83BuV5LP5zfllpQ
	896NraERGA74lenNX5wIfNtzbB+M35Ka4S0RVUDlhe/7je8YH19FTMFEcA3zEZL4pKIO4o1
	PiRvX17uMDxvLexVSErfcyKvCGSX47qEnNYUmCImJZs/EPlzWATtaC8vol7MBr1Vn6A1X0F
	G/BPANeDqyJ7Smh4sl4BotOVtVLL/3xzYaFJnM0AQe4XazfVC5WbzjRfHCelXSu2z1woh0+
	zkKE77gg5KqjYiRZY9v6ro8RP32I0Xo5lglv3e0kXpiEy29HKRUiJKZoHH8RwmgGijjOhFC
	6N93/al2725rVJTG8DGl03Nh9F2C9NXEAXuOUBIbLYMFHHnK9uAuuo++vVNcJERGtTh4W2E
	5L8Js5T6n4vs7K7jaNW2iTYTxhQ2ftkA+MRqdQAxEdkn/RstyjOGGiy64VCzVT7oyp6OyhX
	a9OuEGCMlfywDQvUTmSN5ZZkNhbxYCqSVCXRLWGQIflpBaq40nG9SfZtlq27WBdSIGmjRg4
	MIu5sCJOLw6pK0fRIPBlv3xrul7v/BkD9s4+GM39IZwOGhHixOkciCd4YuM+81DD61A01/n
	ZBygGDJW9LN7+LLhWTJ+m3eVWMROqYRLJuAC+up4smC7Ge2CHFJDsglYrS+ACFLHQSokjiz
	MZqY+DACA2l+GGIh7l5s/Mov3RPUke+gIhqLzs40S8L4nA1Eljsvuk6iGbOISKHOKuqg/I7
	G8bBJ9URrLPefieCKOvsC2LnT/A3pmyvLKVSv8kVTh4JXvNlVEdYvGEIrdFm3ze9bWk5+Oo
	YcGyf2JVpIiNY0ifeHkbMDmfERog1AN/sHBI4abhQAHui9r05QapC7ooLD6n+7DFA6CkUFP
	gK7bqddXDlwJ/FtZ+JTzYEhS8G3Qg/MVwfU7HbknvW5zK4HeO4zU7R2b8eYl4XFaCPXbhUn
	ifto7xX6+tsYWh/R7JX5YSR1smszbm6z+B5T7CbPw7jeQQCleCqUwXka8ftlLzUS37b24Wd
	8YhXpZkXZOgli3VrNxJvIrTDlghmk+Omn7tVHW/wGyKQ2D1C4NspGwIzIJ0Ihys37RY/slq
	9VcqdHNWjt34KqJ/okrf0JMn/0d4etqIp6zqqS2QwIIosqjWrUb6GHbRN9+YFfv64s1Zqhe
	h7CPeoOTwM+IHjEKa1d5Rj0mxA==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

K3 BS01DCMA is a board equipped with a SpacemiT K3 SoC, 16 GiB of LPDDR5
memory, a P1 PMIC, an EEPROM and QSPI NOR flash.

Add initial support for the serial console, EEPROM, PMIC and QSPI NOR
flash.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/Makefile        |   1 +
 arch/riscv/boot/dts/spacemit/k3-bs01dcma.dts | 266 +++++++++++++++++++++++++++
 2 files changed, 267 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
index 851b701e5da4..09d17fef995d 100644
--- a/arch/riscv/boot/dts/spacemit/Makefile
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-r2s.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
+dtb-$(CONFIG_ARCH_SPACEMIT) += k3-bs01dcma.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-com260-ifx.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-deepcomputing-fml13v05.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-pico-itx.dtb
diff --git a/arch/riscv/boot/dts/spacemit/k3-bs01dcma.dts b/arch/riscv/boot/dts/spacemit/k3-bs01dcma.dts
new file mode 100644
index 000000000000..0c3b4ccd105c
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-bs01dcma.dts
@@ -0,0 +1,266 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2026 SpacemiT (Hangzhou) Technology Co. Ltd
+ */
+
+#include "k3.dtsi"
+#include "k3-pinctrl.dtsi"
+
+/ {
+	model = "SpacemiT K3 BS01DCMA";
+	compatible = "spacemit,k3-bs01dcma", "spacemit,k3";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@100000000 {
+		device_type = "memory";
+		reg = <0x1 0x00000000 0x4 0x00000000>;
+	};
+
+	reg_5v_sys: regulator-5v-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "P5V0_SYS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+};
+
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_1_cfg>;
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+		pagesize = <8>;
+		read-only;
+		size = <256>;
+		status = "okay";
+
+		nvmem-layout {
+			compatible = "onie,tlv-layout";
+
+			mac-address {
+				#nvmem-cell-cells = <1>;
+			};
+
+			num-macs {
+			};
+
+			product-name {
+			};
+
+			serial-number {
+			};
+		};
+	};
+};
+
+&i2c8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c8_cfg>;
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
+		vin1-supply = <&reg_5v_sys>;
+		vin2-supply = <&reg_5v_sys>;
+		vin3-supply = <&reg_5v_sys>;
+		vin4-supply = <&reg_5v_sys>;
+		vin5-supply = <&reg_5v_sys>;
+		vin6-supply = <&reg_5v_sys>;
+		aldoin-supply = <&reg_5v_sys>;
+		dldoin1-supply = <&buck4>;
+		dldoin2-supply = <&buck4>;
+
+		regulators {
+			buck1: buck1 {
+				regulator-min-microvolt = <1050000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck2: buck2 {
+				regulator-min-microvolt = <1050000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck3: buck3 {
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck4: buck4 {
+				regulator-min-microvolt = <2100000>;
+				regulator-max-microvolt = <2100000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck5: buck5 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck6: buck6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <500000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1: aldo1 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			aldo2: aldo2 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			aldo3: aldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo4: aldo4 {
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo1: dldo1 {
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo2: dldo2 {
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo3: dldo3 {
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo4: dldo4 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo5: dldo5 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo6: dldo6 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo7: dldo7 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+		};
+	};
+};
+
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
+		m25p,fast-read;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bootinfo@0 {
+				reg = <0x0 0x20000>;
+			};
+
+			fsbl@20000 {
+				reg = <0x20000 0x80000>;
+			};
+
+			env@a0000 {
+				reg = <0xa0000 0x10000>;
+			};
+
+			esos@b0000 {
+				reg = <0xb0000 0x100000>;
+			};
+
+			opensbi@1b0000 {
+				reg = <0x1b0000 0x60000>;
+			};
+
+			uboot@210000 {
+				reg = <0x210000 0x5f0000>;
+			};
+		};
+	};
+};
+
+&qspi_cfg {
+	qspi-pins {
+		power-source = <1800>;
+	};
+
+	qspi-cs0-pins {
+		power-source = <1800>;
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_0_cfg>;
+	status = "okay";
+};

-- 
2.56.0

