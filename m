Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CA53B2FC2
	for <spacemit@lists.linux.dev>; Mon, 30 Mar 2026 08:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859916; cv=none; b=mmRV3Fj0WlSZ5eXJsIKEIQR/jq7BEwuTxgUaSmynx48/DcKhyhmb/bDtnD2GnO1Wn1IfDqOx+179j+XVjyo2TTrtyXrEVD+m+Ad8LQow/aFH/rbVfPCwwUMfwU3xrWamz29WEPCXvGCHNkNh5/Z3JgQyjhsOWtLW8jNgrWDnvJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859916; c=relaxed/simple;
	bh=mH1spPeTCHz8roINYMnma7FI82vi0r8vKKTb06yrJYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RKZVOtkIBEsZsU9i/LUlMYHiJZARplH8cpgNLE6FSOdfS6E9xK/Ru2/RG/fIdlfDzXE8FECiWLUQdMRhJA3UlFG+72U4WsbMb0ynd/prEY6QQDP/ksE8+LEnMyusH5yZymxrBLnUazBdnR/SCgnxLlOys4o9RgrRzSPNb2k5EM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpqyAlzq; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpqyAlzq"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so31990385e9.0
        for <spacemit@lists.linux.dev>; Mon, 30 Mar 2026 01:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859914; x=1775464714; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MilkKS52ju+/z2QrTRIvbE7nHZSA0fcfW7w+lU+2hFc=;
        b=FpqyAlzqAZRdpV0EfLFDK6nYzSUH7LFh7lD75SMIFv+Crk1M1LQxq1uXM+2LJ7Nd2j
         V/ZqVR6IxT++mKrpOUvG2g1+XPFR+a54sjRZ/9rM6LUqkaT9VcB7GlB20JJRzws43CfX
         a9G32v1K0tA6tCpkR5Brs4OzqiL7omtQr60WlxZKQDXt0r9VCIiZvB/ZF/lepH+Mi0YE
         VvO/PxyI1vbdHllSAmhq0OJjOXJi9+F3+4KF6/TVZBr8W3pPaD0ywa4VUflMdtUQNw9V
         AOv1uMv5zDRf8+1v/g54pllrtkeC5RULS6frMFnBcte0Lez1SMaeWynpIyEZq3oNn/H2
         gOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859914; x=1775464714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MilkKS52ju+/z2QrTRIvbE7nHZSA0fcfW7w+lU+2hFc=;
        b=Co2zccoaH7X4w2NSaIe0b9c6YQf1lvhjFfPBfO4xIgT2Jm1RgCmZAx9AfCim08YCdt
         FicfnnltUHnaH3NzyY5a8gQDOitPIVL8OapLKgv/Mb4gskwfDPQde84klANmyOA/7kkn
         4xYLe0BOPG3gppBWvlQSTCg8SUobKgG01T3OLHIp7pPAz6t2F7We+q0o5dbjnGSktgHu
         Wjd+u4sU89fwM8Z1E6dPBK72bmBJ9dDUNBTWuHiWm3USjyOMi/8HksBrPSgf4ukSWtqS
         nTlolgc/lrbgbc0EacNty3q7pi0wONLcQuHLgKGBMW61f9fzkI/dy8saPJ1j4gI0jOXW
         xBfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJkkVSUhRHLBOialZQQ/m6gNLn0YuFoZhEyFfpz63its6w1hJom8J9H2SbgwzOnekXpaq86pZVjQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzbuBjU31Oua7nTRzqjG5aUGg6ea9E2fLVztOIkqNlAdEZglZE8
	/Ow93HhQ37dbLjZ7N6Y4/k4RFM+kekr3wk6jRKc3xnOG0hMY3MqgwiX9
X-Gm-Gg: ATEYQzyHgfOzMxFigKulkOwb2xjtRWupp4OLX3C/QD8WTImLy/sROB45UEi80qNvXAl
	mhCVkHaFDioMmd9xPBHZqrSQ+4wNNE/m9SOp9kl8geydDIsZFXcuCJWW9ybwC3KQC7XjR5hnk0Y
	qwb7/MfMv1OQrkv/sshGiP5T0kziMMEQVc3NADcsiY2rEvIPD5gT+ktX19n4ZHzx4kTRbBQw5dT
	UOAUq+CU+ALH4TmkjoYj+JUJmeLLw7bVCDjX8ftNvG9dvJsIDrKnll8wV5Mn3eNtsolRurdyUIH
	RWaIhBNX1LAWtlHhwoc1dGj5zy41oUAUgIP5cWAq9EiiQIPZ2A7BqVis3Rx7MlnmVeTIOCllyKg
	wraHGYR+w4mE818s61sVqWPo34VvfhSJw9dDlQAk/ABc83b2faNRsHq/FPGTIo0x0EjNEBaogtW
	d3SvGy1JRugxMFQTZqO3WNPQAHJhCgud2ISfCHkchBrNQP1aKdSQAtYr9e+7zGMwne
X-Received: by 2002:a05:600c:c109:b0:486:f9d0:aac8 with SMTP id 5b1f17b1804b1-48727ec776bmr146972035e9.18.1774859913716;
        Mon, 30 Mar 2026 01:38:33 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872712c236sm74063315e9.14.2026.03.30.01.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:38:33 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 30 Mar 2026 10:38:07 +0200
Subject: [PATCH v5 6/9] riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and
 power infrastructure
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-orangepi-sd-card-uhs-v5-6-bd853604322d@gmail.com>
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
In-Reply-To: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2

Add Spacemit P1 PMIC configuration and board power infrastructure for
voltage regulation support.

- Add board power regulators (5V input, 4V rail)
- Enable I2C8 for PMIC communication
- Configure PMIC with buck4 (vmmc) and aldo1 (vqmmc) regulators
- Set up regulator constraints for SD card operation

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 48 ++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 7b7331cb3c726f11d597f81917f3a3f5fc21e1b9..9c417a483f6bad6e60617cf8d5400ca079588726 100644
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

