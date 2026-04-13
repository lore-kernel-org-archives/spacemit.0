Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A739D3A5459
	for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 08:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067370; cv=none; b=KU1+OiSzWMi0pwqsxSxHvtfrcem5d+rH7nHNECm2gmag/9CfGzLO3D5UN3nqlS5uvlAQqsN0Ds3wUANxCkDcuXN/wxwyn7Pesnzlsb8f9RPQZZ9eWxL4HahiWcS2w8OU7ZGIqVla9HE1KuN68PZ8/8F6Gl1aTufjkA544Mj5LB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067370; c=relaxed/simple;
	bh=jzMsWwDIkxOKSax6gl1IICe0yAnfuQo2yxPv0AT8qsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pS0VeAupXq9HTRoyDoQCzIVNdqi0Stzf3qANVjhNf+PYbIzAV1hOQ9g8mctnPH8kVjgXi3uMyMrXOI+dVv1Ilid4TbuGW7eKQdhstsPjwdx1wO/FRzUE/W8p5AKs2mjONfrdI4SbqxFnqkV0EIDHAP5x34AwMkgpgQnXiqpLrI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gba7JFvl; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gba7JFvl"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43cf8d550bdso3983129f8f.0
        for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 01:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067367; x=1776672167; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Bt7k0zpH6EPz3nKG6vw5G/jzVLlNuWcFiRyZwuaAKY=;
        b=gba7JFvlRePXoCvNV6zqx39HiI5nXYEG/OXGffICeXeT3YIR0XYB+rqeo6SHgGftuh
         pJr1WpaV5gGlmRJPt5IK8zbAb+NF+3LiYJLIGngJy+PD8bEkhGr6IIEmpu5+sr/CQg4W
         9a0/7yO2bfgir8kOXSWUdCuN3AHQuX2H6oNVbcFFKalWwgq/Ssn78pWzFXdnyHIX/7rH
         vJ+xrVFEXFZFw/Xg6F4/BXg2MFBXnAF7rEW1+qRs6oXURRBoBN0LairE6epQmwP7JIk7
         TYCI1wM7nNCSu/aym02ZuXr04O6HkEWVwAxzxihSygTTsZJSOPhEUa7TjJAe4FFn0Nos
         tSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067367; x=1776672167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1Bt7k0zpH6EPz3nKG6vw5G/jzVLlNuWcFiRyZwuaAKY=;
        b=OlolN8LAeqqqwQiTKWHf7k8hve9PvijxN2mNwmydWo5/qbPWTL88Yk+qHZ7hfqccxC
         Dq/rOWLepB78I+N1j/F5M4ssC6zYLJVLewRAKddhit+eODQC1fybXMLuc8Arg8Q1tZ2B
         BrpA3IGW//Zgxr+Juh+ixhYG3XygUzVoFVBpOuPf2gDz02IiWK9PspI50D0gB0Kvim7v
         UsS+971N/O5bmD/x0ft4KteXPnDOuuxpfdqOgmsvl9k7++oBUzCgIoH+sbp6lD1Mfjts
         xpCAj7qVAeWyOSRPaTAAvBNVb2G9QyBmrmEClLSJ2/B61q8StyJD2HUK+WL1l60O635r
         dH8g==
X-Forwarded-Encrypted: i=1; AFNElJ+Z3mIROQrZLea+tjuS03/4vdoTS1fBkEjFXYOpDIzqld/INbmxSJH6qP/QGTSpDIHZ+xaT/7uLSQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzuS+u2llI3xxfoWm2VBmG+DnOalyd7BJUP9QK6mQsI2/F9SKFT
	hILoggEY718AI0l3r8O2lUT1vXGULmj1CQI/QVNVRoPBCMVtvb0AX+k8
X-Gm-Gg: AeBDietvnZFjRt0IhzY/xL4nNQ2tr7bwuCEVYyP6EvpTBD4XTpxPhdLkODhXlOHMGkQ
	BbZHG8lbY1tH5X+oNWc8BXZ3wR83igsgMEe73+5+4769uNgpyQSEgZM0uLoMBcZY31D0EobQB3b
	8c4jj6IRT3CSs1z8lzx6wEbjPKbns24Y+Ag871wF4ma0/qy9ff1duYi4DfyhGjO1GWR0zwVrltI
	sv/ORV8RSvue2g8TTPPE7vkvMh4mX0nRuyAXzvES7v6Ios2wsPLExgrLo7ETXBmVrcU6FT3+roq
	VFQjb5VwDcjZ9a6sV5/ETBOyvLWpZJqBbP2K4FW5Cv7seEQ9OOhmB7x2owDiItsHppxnjltByjd
	07Zk8fU4YC2dsRCR5BvcpeMkMJNVYO9RzJHqyEF6JDaUAbs5VfOWlFCbf2AdAcxrnxqwCvrlgYY
	Pezb4l03kKBB5rwZa9q7FPhDM2UaUP0nvYQFoc9hX/gcddZsvgJeW+MJbzmT1SfBVx
X-Received: by 2002:a05:6000:4021:b0:43d:7854:32ec with SMTP id ffacd0b85a97d-43d785433bcmr4066398f8f.17.1776067366337;
        Mon, 13 Apr 2026 01:02:46 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm32155932f8f.33.2026.04.13.01.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:02:45 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 13 Apr 2026 10:02:15 +0200
Subject: [PATCH v8 6/9] riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and
 power infrastructure
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-orangepi-sd-card-uhs-v8-6-c21c40ec16d0@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
In-Reply-To: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>, Vincent Legoll <legoll@online.fr>
X-Mailer: b4 0.14.3

Add Spacemit P1 PMIC configuration and board power infrastructure for
voltage regulation support.

- Add board power regulators (5V input, 4V rail)
- Enable I2C8 for PMIC communication
- Configure PMIC with buck4 (vmmc) and aldo1 (vqmmc) regulators
- Set up regulator constraints for SD card operation

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Tested-by: Vincent Legoll <legoll@online.fr>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 48 ++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 7b7331cb3c72..9c417a483f6b 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -19,6 +19,25 @@ aliases {
 		ethernet1 = &eth1;
 	};
 
+	reg_dc_in: dc-in-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_4v: vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
+
 	chosen {
 		stdout-path = "serial0";
 	};
@@ -92,3 +111,32 @@ &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	status = "okay";
 };
+
+&i2c8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c8_cfg>;
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
+		vin-supply = <&reg_vcc_4v>;
+
+		regulators {
+			buck4: buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1: aldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};

-- 
2.53.0

