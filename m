Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38513A7F57
	for <spacemit@lists.linux.dev>; Mon,  9 Mar 2026 11:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773056442; cv=none; b=Ce9JsI2zp8FIrPcPf3pW4ToWK04fJ4LDX66tauzrcWa7q56AAzmli5zdWgGedf2+A3F0gRbV/Brl0JsU75wc/jtX/nCdT43UWWQs1ZEx3t5vbCnXlQKdw7uO54S38iI81vIrRS+2zNbwoa6ZStvpba0MwcXu9eFctVndSI+uLz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773056442; c=relaxed/simple;
	bh=70rfTlR2IAWuKF6gWYOHTAy0yzzcBoXO6BwKFGm1+do=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o8vejVF16i6DQOWCTYJ4AUpDTXcteVG5uwPLqlb9ceM5udHupLILn26KwNRXiMgS7RnPtG+mt6JbiysOvIK0CG2n9Vu3Z6d1BGOGQVX9J1Ah0XNLVBRnVLrOxhNdP2JMcADWb6sJZRBZaeiEOj5b281fY2nEJdZ4pa5qwH++0js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UrxmyjD7; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UrxmyjD7"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so3457711f8f.3
        for <spacemit@lists.linux.dev>; Mon, 09 Mar 2026 04:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773056439; x=1773661239; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fiI3b1wOWntFX27ERmDlj5qmTKTz44jgUTrCNSLGaQE=;
        b=UrxmyjD7OWaGxCm+mpm7EIPDZhtO2JK5kWOFaxXfaE+U5nAP4OW0pW65LV75RKmB+W
         McF+mIpj1+MUZSv87U9P2jV308J0IgXfc8DZbGwaXdieiSDVxiyNR0ZEQUhb3WaM7KyB
         dqro7WYiXeoL8GiFLuv3MO+VoRg1n11Hn6SHY+n/joCUZc1H8PO2lzmnwHMmq2pw4VMC
         TTFO0QqKGLtoCehvNVaMcxKHLLcfEvdaC2nhkmr36fNvOUO49a+u7LpEHXGFD3/UoEsX
         5+ZRcgpWVWjriNpYF+oravFK1QBx/6+ziiSzOrnA9SQ0GlyVRjEm75kyefwEb7S+w+wV
         P3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773056439; x=1773661239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fiI3b1wOWntFX27ERmDlj5qmTKTz44jgUTrCNSLGaQE=;
        b=j0EZ8woMcn63W0oIGgkdoFL43/LfqtKFOUcW2cnfgHuzf1pn6KzHPcHqcr1fh0MF1l
         GoovzgQxruHqOX4ALy7xoTsQ85ydEBymBZGIKn43EQiN1d7HQFIjdHTzkTLLhqjja9gW
         5/dywVVbM3cm55D500bMbPaEtrpL+SIs/fk/veTbvdd9uUlZC0EkaNfACUYW1614itjs
         pKgeWbHMUlBSE/82JQ4ugekLrQDDbaLv7wFAfho6s+efkUBpaBUfnnKQuFrWJH2P1Elu
         5AUUFFJWvpup7O3heFmJoqdiU6NytxoGX5P9qtPPoPuuXAfaA5Ax5Qqkr+NoRAb7uElC
         89/w==
X-Forwarded-Encrypted: i=1; AJvYcCXMkkoL/ziuyzpgauoL3lUiehna53I7ojbYBJuGoqAAaWGGXMrxlHS4pD7oLKQStgU35VNly6MwUw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxc6kR4dU7eGpovQH1z0r8NIN6+YJRaQCJKcrP2kTfi3NV30Tds
	KarJoPqxTU45W2KBmd4vFN9uEC4EH0pohJgCv19Fs21njOOx1UQmulmG
X-Gm-Gg: ATEYQzyDoGqJ7voKEC1DIjUekjK/rlhLA/FIEnnpYL/yq74Y4xs4u0W6ET2q/wgsBiV
	/l4o5cBlqKk2mPbBdNDnMByP3xD9FHSoSKc5eMm0uATxUNe/8K/Xv4TpY+aifv1heBc7MvKNHex
	raI4Ggh97N0vAx9W/faS/994liVt1U85kJAM5e9DuYxzCfdb3X7BoWiVKyUnBeuxbjU2gNHsBvS
	j7lULToATaDdpDMZq3gVutYlN9qVv+RyDvZYv1vv62AWub/sLbIVnqt8VXyEVbESLXKWkCsiF6v
	vg8JSi5yAkAx49QY7/CMIxEwW/dJTM3rokXmUgp7ra3LHFh/48gHJyTC4suExPCyJUc7ofvanmS
	pEftPhH2W3JmHkNksUYzoG5xvTLctOZSV9U/Msju//doEhz5mBGkzdIZXhUHCRaFSOcwd52s37j
	qGi5wfjQ9qVAuL8sAGIFqOutZrjGXgxjLx+a/bzDjUnsNxjnDFEjXgcIgh9x+Wm4Bc
X-Received: by 2002:a5d:5d84:0:b0:439:bc0a:4164 with SMTP id ffacd0b85a97d-439da330b92mr19644526f8f.19.1773056439050;
        Mon, 09 Mar 2026 04:40:39 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.236.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8ec97sm28471699f8f.5.2026.03.09.04.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:40:38 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 09 Mar 2026 12:40:16 +0100
Subject: [PATCH v2 6/7] riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and
 power infrastructure
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-orangepi-sd-card-uhs-v2-6-5bb2b574df5d@gmail.com>
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
In-Reply-To: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
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
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2

Add Spacemit P1 PMIC configuration and board power infrastructure for
voltage regulation support.

- Add board power regulators (12V input, 4V rail)
- Enable I2C8 for PMIC communication
- Configure PMIC with buck4 (vmmc) and aldo1 (vqmmc) regulators
- Set up regulator constraints for SD card operation

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 48 ++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 7b7331cb3c726f11d597f81917f3a3f5fc21e1b9..414b03f5e6480f05f5d7eeaaa0afb4e86425ae36 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -19,6 +19,25 @@ aliases {
 		ethernet1 = &eth1;
 	};
 
+	reg_dc_in: dc-in-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_12v";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
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
+			sd_vmmc: buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			sd_vqmmc: aldo1 {
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

