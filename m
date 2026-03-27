Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2E43537C2;
	Fri, 27 Mar 2026 11:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774612293; cv=none; b=GXqKVkCyDxSkzNO2qLNFjfQPYXxNG4NSbI1EXmcU0RSy2KxJBFVlkJ6Ia1EoX322cWitWjaNgpZDE9K4uBYtODG+tBg5R92G0yTBLzqzQa6Eye1QkxJ/fYXkVRoQp83+lSr6MsmJGaZl7XzNKKYgoww2hEzgZFSA4ODgPFIxolA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774612293; c=relaxed/simple;
	bh=5yWGAJAeIc3MOgyU7+oWgMBWFC+T9al/49ayYmUDDw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VNEYa+0C69LxKYTWApm3G+nN/zwpiLYfRUeSQOxQdo25y+7VEHqX394xozo6mJ0ACjfmEZEaxdQADb6dLCSYUdSa44kCYUqan4IQXETNcRVWlZo2z8mjW5k1UiyqKSJY3JOD0HhCO8y66RfxhphbT8P0aIHfronG/4HcblKMWDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CghMV87g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CghMV87g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9462FC19423;
	Fri, 27 Mar 2026 11:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774612293;
	bh=5yWGAJAeIc3MOgyU7+oWgMBWFC+T9al/49ayYmUDDw8=;
	h=From:Date:Subject:To:Cc:From;
	b=CghMV87gJOX2yTxVIwzgdQ0whUGTqcBVOectVNkrDhnRQ2p3n328NOi0bhgDadUxc
	 SQn7JdrI3pABN8GfJWCbqWJBE8qPmN8vjX6WjXrKdeDkV9OICRHZFr4BB2yOUhO5B4
	 Ith7MG1UaXKoopClWmBT3baUjnc88nXqWzBrp+5T/GsdK5vX/+KB6wmZCdYGSv2MOO
	 V/n1YQbsJp2YNnfvlXDAr89+nWrtG65JzZtIEL38rw+TM00p142aONXZEmmWFc1RPe
	 Cb0JdeXqsb01ZJNRONO7FZkH13nR/jvMB7gqFgB1UUDMPPCZ5Xmifc7IkNLEitEBrK
	 MqDAOxjgfJc7w==
From: Yixun Lan <dlan@kernel.org>
Date: Fri, 27 Mar 2026 11:51:18 +0000
Subject: [PATCH v2] dts: riscv: spacemit: k3: add P1 PMIC regulator tree
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-02-k3-i2c-v2-1-9c6b374470c6@kernel.org>
X-B4-Tracking: v=1; b=H4sIADVvxmkC/32Oyw6CQAxFf8V0bQ3TCcNj5X8YFgNUmGBAO0g0h
 H93gIWuXJ6b3nM7g2dx7CE/zCA8Oe+GPgAdD1C1tm8YXR0YKCITaaUwIuw0OqrQ2Dqm2BibWQ3
 h/i58da/NdSl2Fn48g3Lcw68xDPz35ZOC1dE6Pw7y3t4L0SrZmxT/NCeFCm2S6SQxZZqW1blj6
 fl2GqSBYlmWDxMessbnAAAA
X-Change-ID: 20260311-02-k3-i2c-6ad52566a9a3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5726; i=dlan@kernel.org;
 h=from:subject:message-id; bh=5yWGAJAeIc3MOgyU7+oWgMBWFC+T9al/49ayYmUDDw8=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpxm88mslfk5fagqFT8z+fF7TxZGyPz0mEGNlSr
 hKQ1OCWWruJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCacZvPBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1rpBAAkJtudVD5t0mD7vxJ/ftjtaPHX7/z0HcTk/xqka27KPcl3mlWEjh2z
 oMJblxlJUBTZFEwnPJH8mTVur2LWK8ueX7GN/xbJTQAjZI2TjZbzgf/G2p8ua761lPhbwFl+sPs
 TWwEfRxEJqly+HhbYSDe7u6n7F/H3NKFT1Q1+Mhh9aSnlW5s6dM7Aak8fandI1dCxKZ+4ai35cA
 JNZyBKDbmLK6k1pClZVZeVxPBfqMYYJfmp4SzbZAu2ScT+7DkcRjgEQSdpue1PkBGv5wEwQgK94
 eMeAB+mikK+Y/f5s5btYaC6mTi5lBFEX7TJ0FcZu4YeUq4lr/NF2tDXW7yu8LOw+wlUSOyOIsex
 IRvm5/gUGuqaQnH/VmLZ/RMCscjA0jOv1Fc1Id6jSNUGMir67wRUr4D3AflQNR/vDmHxYDqSw+a
 zzSjpVObJjsLnShFC3W9jAU2CVFW5RWWYj8Lvz3x/m51L0l8EYU8tzVxPFhvoZ3Qn//cjqbOMSx
 D5TfVypnEaRVRHpraMJShe0vrw9N319drDmapjtjVpEugybcaOMTJh0/0k2qs17ZHXQawMxQeI7
 jV4KLE43HqjEdqjVuFnAJ6cNayYy15m/jQvjSFxe8cD98xGfzyOgR9tWLsaEBEnU3R7c2/4DSuC
 9CgKl1T8sSWqU2yaFZUZAVHATuaJP0=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Add the P1 PMIC's regulator topology tree for pico-itx board.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
This series try to add a regulator power tree from P1 PMIC,
the PMIC is controlled via an I2C interface.

To test this patch, it will need the I2C patch series [1]

Link: https://lore.kernel.org/all/20260325-02-k3-i2c-v1-0-78f29c83d9ac@kernel.org [1]
---
Changes in v2:
- drop regulator (dc 12v) which serves no devices
- drop regulators which current has no users
- Link to v1: https://lore.kernel.org/r/20260325-02-k3-i2c-v1-1-a793776b88bc@kernel.org
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 147 +++++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi |  11 ++
 2 files changed, 158 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index 504fe6bd46b2..4486dc1fe114 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -25,6 +25,153 @@ memory@100000000 {
 		device_type = "memory";
 		reg = <0x1 0x00000000 0x4 0x00000000>;
 	};
+
+	reg_aux_vcc5v: regulator-aux-vcc5v {
+		compatible = "regulator-fixed";
+		regulator-name = "AUX_VCC5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+};
+
+&i2c8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c8_cfg>;
+	status = "okay";
+
+	p1@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
+		vin1-supply = <&reg_aux_vcc5v>;
+		vin2-supply = <&reg_aux_vcc5v>;
+		vin3-supply = <&reg_aux_vcc5v>;
+		vin4-supply = <&reg_aux_vcc5v>;
+		vin5-supply = <&reg_aux_vcc5v>;
+		vin6-supply = <&reg_aux_vcc5v>;
+		aldoin-supply = <&reg_aux_vcc5v>;
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
 };
 
 &eth0 {
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index a7b5d10c332e..23899d3f308a 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -45,6 +45,17 @@ gmac0-phy-0-pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	i2c8_cfg: i2c8-cfg {
+		i2c8-pins {
+			pinmux = <K3_PADCONF(128, 0)>,	/* i2c8 scl */
+				 <K3_PADCONF(129, 0)>;	/* i2c8 sda */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
 	/omit-if-no-ref/
 	uart0_0_cfg: uart0-0-cfg {
 		uart0-0-pins {

---
base-commit: c9bc6f02e3252c20dd967811de7bf7739812259f
change-id: 20260311-02-k3-i2c-6ad52566a9a3
prerequisite-change-id: 20260311-02-k3-i2c-6ad52566a9a3:v1
prerequisite-patch-id: 9a6b8f6968935c8ed5c9acd8ecb778be2d1a3faa
prerequisite-patch-id: d43e077460cb3ea4e391fb7c528b6ffa80f35574

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

