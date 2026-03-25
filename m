Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FEE3A1D0A;
	Wed, 25 Mar 2026 09:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774432638; cv=none; b=FqUdM1To6s8JWTSRgBpbHWe/Gb6T0eG1nv4z3svdE/1W8NsownLh4niArM84to58btYHFiIcntLd1w2rYohZtO1aMbaEGXuXGkqeOjwJprzS8qLO2Fd8ncXGBmM4Q8sQAsdv+txq5EsWsrIpC3uQC2OI+Hzw1DLM/hDLB/Wnsw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774432638; c=relaxed/simple;
	bh=UaK4kp/jgRet12pBpUQgnuyYitr4HafAGvSJFjFI8VE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hD/JIOo926i000vAg+lOlCc/VZ18CjmpXSztgTZQSEKoHT8ep1/Z12LTC7Ro6gMQukWY8Mqs7rP2HYdi8yCGqgt0D2GsmTjhLFu0WnMQFJQfrN8W4SrDX4I7kNeBfNE8RkqYYtqp33n/1Wt3whQOKKErRYrkJKZqed2ly8RbIG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b1ovKzqJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b1ovKzqJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1BE5C2BC9E;
	Wed, 25 Mar 2026 09:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774432638;
	bh=UaK4kp/jgRet12pBpUQgnuyYitr4HafAGvSJFjFI8VE=;
	h=From:Date:Subject:To:Cc:From;
	b=b1ovKzqJwTtySah2BE1iUQjVaeYlN/iOJjf4FsppaiTAcA0zr8TlXq/vRBDU4oaTi
	 Ny9PAXXshwfYjMdm9/RYuEXlldmjfl3AxnWx8u/aFOU1DXR0boXJXzia7bVszrqu6J
	 yU3Ai0TJVwe6et5M/q7kyXEUOhjWWfwoiiL4a8DwubzKfbDBzGFp4KsObJUeIk/TAl
	 dzyEt+v1hLpuv9miteXTB1Zn+ZFadE5YwA5iev/zixlEjtVcoNMKh/D9sN5f7V2pyx
	 W7mDzcZjm4d4qDS34D0gTub+n7FRTIK3xt7ptFaPR+1PUMzOj1eu7SCFkSRY49p0ho
	 lDqKRinb9sipw==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 25 Mar 2026 09:56:56 +0000
Subject: [PATCH] dts: riscv: spacemit: k3: add P1 PMIC regulator tree
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-02-k3-i2c-v1-1-a793776b88bc@kernel.org>
X-B4-Tracking: v=1; b=H4sIAGexw2kC/4XMSwqEMBBF0a2EGluQVDBgtiIOglZ3Fw1+EhVB3
 LtBBw4d3sfj7JA4CifwaofIqyQZ+hymUND+Qv9llC43kCanrTGoCf8WhVp0oSupdC5UwUL+j5E
 /sl1W3dwdeVoyOd/jI3r14vnVQHMcJ7YFbZGfAAAA
X-Change-ID: 20260311-02-k3-i2c-6ad52566a9a3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6607; i=dlan@kernel.org;
 h=from:subject:message-id; bh=UaK4kp/jgRet12pBpUQgnuyYitr4HafAGvSJFjFI8VE=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpw7F4wS77Ol1nOYAlCRaSkJzcfa69PgpifZaSQ
 Enu18kaoRaJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCacOxeBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0nihAAhj+307J1gNjwTMZLlNsIaXeVz1SE4OwLgtz+r4NC4pRjzBxs3apfy
 ogR++J52q7PCEtk14Cg+IVwLfi5G3/PVf6gh0ta+2XP/s2AeX+QNlzKRNWniTHKIWBzTNCa+QVo
 +gI2etrdhrNSFY4Kmv4xm5l8vPAVh+RzNlHNBDsqJNtYMSc4WQQUuCTEnRd/LOe9beaENHPiaeI
 LPsIe3d4e2lv6h1jTabKRyqrWu8FjQ5DNWJwJzR+YVgErPNK8nImck3zGCT2OO5GHF3IWi8wPTC
 Tmx6f6HWyWr/nOrZjesugDWJGzP+LRZUNS+TkzOJPuIq3DwZEZlJN2DWldq9Blelf+mxluX/1Mx
 6HXMMFFJL+SZfrZmjxlTzFdUzXwSHF8AUv7DcCxSO4wI1Q+mmvkZ4YkFZGicrZtseIsV1vUVp6I
 W765YZX5SLfRWZyXLhdEm01/Git+jzWrtSalW+ypN5XS3hbAA2Kx3CtpSi7SuuiPlWD/mrzllCN
 dom2ZRzD6B/fPmtBtd9d5ZdxKKHs53P1OdozA/OkQm2FQWIk6/G2KJuP4jHB9bCDY06sqdgvYXJ
 LZiqtlAl1QjYZ8vfUYd8mjAOqL/37djlUgow25AobbZnE9r1SoJ1D+HcIZud1OYZ1QucU+BnuCT
 SLGmVgxtUPuoszi6Ke5x1V8f1BRZQY=
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
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 185 +++++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi |  11 ++
 2 files changed, 196 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b098dbd0e7a1..5b59c569dbde 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -23,6 +23,191 @@ memory@100000000 {
 		device_type = "memory";
 		reg = <0x1 0x00000000 0x4 0x00000000>;
 	};
+
+	reg_dc_in: regulator-dc-in-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_12v";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_aux_vcc3v3: regulator-aux-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "AUX_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
+
+	reg_aux_vcc5v: regulator-aux-vcc5v {
+		compatible = "regulator-fixed";
+		regulator-name = "AUX_VCC5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
+
+	reg_main_vcc1v8: regulator-main-vcc1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "MAIN_VCC1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
+
+	reg_main_vcc3v3: regulator-main-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "MAIN_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
+
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
 
 &uart0 {
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index efb0f1572188..dd99909e9044 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -11,6 +11,17 @@
 #define K3_GPIO(x)	(x / 32) (x % 32)
 
 &pinctrl {
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
base-commit: 43a2ce590c0364ddb28377218b3268f9cd722bde
change-id: 20260311-02-k3-i2c-6ad52566a9a3
prerequisite-change-id: 20260311-02-k3-i2c-6ad52566a9a3:v1
prerequisite-patch-id: 9a6b8f6968935c8ed5c9acd8ecb778be2d1a3faa
prerequisite-patch-id: d43e077460cb3ea4e391fb7c528b6ffa80f35574

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

