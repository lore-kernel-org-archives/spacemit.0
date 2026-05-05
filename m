Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C4B48AE01
	for <spacemit@lists.linux.dev>; Tue,  5 May 2026 16:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997190; cv=none; b=GhriHBGePfYS/65siCxf10cLD5YtUcIMkVDZUj1H9ep4aDy1z+LFXbKYWMIU5JTinoaHgtRSZsOjxjo7QN7b7l3a3n7/EY6vR/ozdfwO0f8/kTq/D20BZs8siX/wDGFeVCnqf8fKcrm/qRDmqNE3qphRt7fUWpYRLnbrPIne4Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997190; c=relaxed/simple;
	bh=soRJfSSxYuG5pC4OrEODuicTfvuph+agtktaOpjMSeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=riRtUWyivSfSMHhVYZWTdzKQC+OwI41fYdVXELPgOqIAXlYXKe9UxF9kNA9ecBUe3T5GafONOFiniPx3tBM4JBdCejPmX/j6QFUop3gMSe3ectST+5IWmE4Kq5RmqrJA/OA4PfgdPzWdjGpzAI/v5Hn5k0CLKTc+CKGY2M/XZWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gfh60IHm; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gfh60IHm"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-44a14580111so3465595f8f.0
        for <spacemit@lists.linux.dev>; Tue, 05 May 2026 09:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997187; x=1778601987; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=th+e+aR6DHOg780tOLy6m1AslF9E2KIAxcxgB18vgPY=;
        b=Gfh60IHm8ep6Invbw+s2xW2OKEZMndhlhEQDALzznwSUzY2CSGwGBEfVF9oDdC2Mu2
         O7wAAcPtRG/KjSZ+6WOmTGZVMHHyI+JkKhH02pBWrlDEywgFpvkyh2pDlJaWB1eCUy6U
         e1DaT5AU1CTVL+VZaLL+mQ95zeXXeJ1BKRkmADNVysIx+U9z6M2KhL88/Ue+us+3uUsU
         xibuqm1RcRubfOE9+3c30SAkVSyAHhTeFyOd5M/kJUo2OI6mMtL25KTPw0C/IuVl2Hvq
         DXd6k6S+r2l63/W3F/SCXCjkzwy4DnC2RKgcE+0tKUtqhMc3jbaUbZwHF6Q+PB4VExrw
         3pgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997187; x=1778601987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=th+e+aR6DHOg780tOLy6m1AslF9E2KIAxcxgB18vgPY=;
        b=tGS4wV3kwObHDkiwx9YkBZiAtuBUjplPDllbKUVjlXT4FkLLpJzrrUaYveWaqAhvuR
         hwMW6JiF54l9fBR29GYShN8nFlH9XAnYAmzjRGfuA7iM5kK+FDBHATdU4hQC7eOWqS9L
         Ji8Y3l4yR6dqGO3Z3DIia8UpdpsFoDbIvC5+N0w++gxQSvxTp2qzhRsIWLnUQjOrixSl
         dUpsMaNSmybJocr6G/pcT2dNgKBzZjJ7OHNuylZ0hgGPUFcQuHRybUA9ENqZUiss662G
         uTdTBddFRz3OMy1Fn2CE8tOSQQeaFa7ZN/dam6f60lznAf+7U5W65KpxkFfCGTltUYnn
         O3Gg==
X-Forwarded-Encrypted: i=1; AFNElJ+VGXpC+hRuxxF5+1ybbb3MD0+THi5G1c30Fwy0HmA9ZU9qvQ9JLGt1y6CpV5X//VpfEPhZFLfDbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzkRk6rU4S4mtKZ4ltoTVYDLsAkojP1rsn553tmbzHo/+uh8vaZ
	Lg2UE57efxWlRPqH6jtsO27r4lzcR3nca1B830XovSih2ST45+DdsWqhyz//lHb/
X-Gm-Gg: AeBDietGYDIzh/sIH25Nz0Kl6T27mPPecOjUsz4joatlOQS49O+BhpgmZriFHkzG2ft
	FbQANT1mRcmy3OXNCYCTQWhHx3cqcrRAlr36x2vZiTIEegRDx09gA3A8lzwgGu1lQcNbg1cdwwJ
	2HCpdE8BfCwe5Azo60OHDTZKOvX1DToMG/XlR/KLvsS4J1Jf5VonKFJgnxPCR6ngpavL/MP9Pyu
	y5bDIBU/Rlqg+IAWcLRI4Z5Dxa4J78dcXtBI4w4FSd7IL0ALMfRDFmTJd0i7LWqGnm+YKyDmqoB
	rTq6DWnqLItKF+7ipy2Ub5SfbU2YKSziWbyXa47U1iPL8SoRSDsyH17am3O1/XrrGHm4O2o3mU/
	OE5YisPo9dq8nSqe5XCLzygJtjgtUX46jHXY233QpUJLkzaA8IOc6Bx4o6elE+QLsTBjCRFJqAM
	Wx2w3Vg5zYABPtN2wWce0dxpUbVW5m7zNokIZG6GPjKYdqK/EYGm9OxYGVOnbC5+pCFzHnJx/Kf
	4xzYteBJz0fuFU+Ng==
X-Received: by 2002:a05:6000:40c7:b0:43b:5672:efe with SMTP id ffacd0b85a97d-44bb36d17efmr23828993f8f.9.1777997186712;
        Tue, 05 May 2026 09:06:26 -0700 (PDT)
Received: from mamamia.internal (a89-182-137-143.net-htp.de. [89.182.137.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055d36dacsm5398891f8f.32.2026.05.05.09.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:06:26 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] riscv: dts: spacemit: k1-musepi-pro: add PMIC and power infrastructure
Date: Tue,  5 May 2026 18:06:15 +0200
Message-ID: <20260505160623.1369347-2-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505160623.1369347-1-a.heider@gmail.com>
References: <20260505160623.1369347-1-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable i2c8 and add the connected SpacemiT P1 PMIC with its related regulators
for the board's power infrastructure and voltage regulation support.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 144 ++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 29e333b670cf0..07eef3274192c 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -17,6 +17,7 @@ / {
 	aliases {
 		ethernet0 = &eth0;
 		serial0 = &uart0;
+		i2c8 = &i2c8;
 	};
 
 	chosen {
@@ -33,6 +34,25 @@ led1 {
 			default-state = "on";
 		};
 	};
+
+	reg_usb_vbus: regulator-usb-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USBVBUS";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_5v0_sys: regulator-vcc5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC5V0_SYS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_usb_vbus>;
+	};
 };
 
 &emmc {
@@ -72,6 +92,130 @@ &pdma {
 	status = "okay";
 };
 
+&i2c8 {
+	pinctrl-0 = <&i2c8_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
+		vin1-supply = <&reg_vcc_5v0_sys>;
+		vin2-supply = <&reg_vcc_5v0_sys>;
+		vin3-supply = <&reg_vcc_5v0_sys>;
+		vin4-supply = <&reg_vcc_5v0_sys>;
+		vin5-supply = <&reg_vcc_5v0_sys>;
+		vin6-supply = <&reg_vcc_5v0_sys>;
+		aldoin-supply = <&reg_vcc_5v0_sys>;
+		dldoin1-supply = <&buck5>;
+		dldoin2-supply = <&buck5>;
+
+		regulators {
+			buck1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck5: buck5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			aldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			dldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo7 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+		};
+	};
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	pinctrl-names = "default";
-- 
2.53.0

