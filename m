Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1858C41C0D7
	for <spacemit@lists.linux.dev>; Mon,  2 Mar 2026 15:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772464452; cv=none; b=ij98Pdk8NKrUeEsaMHIQLaynlslB+ZdzZEzMKDD2PUmOVqKG92Q9Vo9K+N94Ejm3JeiIvnJJbcTc7O7+d+Ka9FuaOfejZEFvN9cUeS/XBOtCOu3IHx9eCQhEM2OFd7WUPM8FUeXfrTECLdSlbBJzMZxA9kwOWrk+A4khRGYRNoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772464452; c=relaxed/simple;
	bh=70rfTlR2IAWuKF6gWYOHTAy0yzzcBoXO6BwKFGm1+do=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hhu7l9w5ABcBYyCF54cmsAU/ygoJB3Dwv4GAwUJ5nnjjXDlDP36NUbCrZNOTcKLnUxPKYCszD5Nz6y/cUE6YEQfDF1DyyL+fbNr79T7dUI0rRzxBefo0vy2X4xKBYlMaA3upOyXAlj+UzvDr1hNtYJc2AP+nVxtScze+9HDIJjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IcOZRT4I; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IcOZRT4I"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439b2965d4bso1380994f8f.2
        for <spacemit@lists.linux.dev>; Mon, 02 Mar 2026 07:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772464445; x=1773069245; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fiI3b1wOWntFX27ERmDlj5qmTKTz44jgUTrCNSLGaQE=;
        b=IcOZRT4IrPkdwOLVx4VmKc7LcRQ7IrohddA0BSqQq+L8D9OhaemDUIJ1+O35J52dyn
         laxmfA57L5Quvf7i9UBQ2iN+IhVfLuSY/u38g8xGvorabA1VlK3hNUQkBq6Tu0zrBFeU
         E3A0dLzHgPntQCdz/L0hQ4qWqS7jR5rkmRNSfRp5cMue6WTtc4QrByLkLU4dQhel6A1T
         5G7jGeU2z0Or/FfkrPzjBVj47LesOjY/MOrnkWRDbESOyXY2KYIyoDWH+Y+HsKiA6MpE
         GoZ7mjQ36CynShcHMcn9Vr2WEZQQuGb7cKotdAsqPzSj/1yZiEOD0jzGJBlQYt+cD26o
         9/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772464445; x=1773069245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fiI3b1wOWntFX27ERmDlj5qmTKTz44jgUTrCNSLGaQE=;
        b=FTyL70iV0a4wK77Dz/wzEsefL7suZyKMdRayecntM9RzH0fubzUiHoF+AnXKNAGd8e
         itSG87ldYNyu4wOCoMdRr9WJmDCB4M4y6wdDdqgSMa7zA7sSvIQlc6l83/ElFffhJ90t
         90QqIE2ae1thTYSJZiK8oEZOnU90MFAFcMpaQ3Jz63Fx9lbGujoM8eBK4scO6UvzLgl6
         dSAssCnV4O1xunDOEF8UFizzlH6htR5R7ExokmSsRqO+EeZn+S8pOcpzlmfzzgzLD0CU
         jsWmf6IvkExWRTmJKvpYJVdqYX/kzIYQDj+T/fOkGjlyco/GjzVr4+WyzCUq/BeQmbrL
         zYmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWA1nUgtqgKrxo2qtPfD2seNKVadl6OfO+fB4joRC9Ss9cTpGaBgzQbBy0DiHJIXVqFE6oZSCjeA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw88vQl6sefqiYWDFNgOeArj5OyN9HDUb9eVikht2B1Altq2Uvj
	F7emBsujezD3BFx8QeugB0rO5vuGLCBcMtOWWkShvOheflGzdjpqu2BU
X-Gm-Gg: ATEYQzymbVkUFi76UrPQmS293x5xAOjjDPpMA7PMY085qzrkTWAcOJ3UyYL7CCCbQqB
	uBB3Wx3KA53GxsH62fpkzu7uDVfWjDdEsrYAzCWhJWv837mR7t/gxm9wKtI4ZWbWX8uWPBAWuCn
	a3AQkI6nZardaStdcFebVygr1l9t4a/XEfsdCS5Lfxi3D0/+FgdR1liNarJfrpRmN1tBmZUuy8j
	WgNRr85rJgn7UTqPXBiAe7vRQoIdfTI15d7rHVj3lkyAqNeJyVdDL92KEbQaAHRz3kaDEybL2U2
	WAn48krC9Ri+b8GHTv6l4z1xGub5EM9yLfll3NJPHduS9KhgVb5fmmGYah3sIG7V6umxrsLwmiV
	QVvdQoPPwJ4pm2hut34QbfaT9tVIwngoFNx3aHvA/zpStp3Nw8DFYvrLjnZ25CJK3lqmpMN4Tr4
	QNreO+Lb/qpNiOxPhX0rAAKHKzWMXRDTyJS/quCmbujj4b6eWb7gDdJkgmP2c+oxkayg==
X-Received: by 2002:a05:600c:a085:b0:483:badb:618f with SMTP id 5b1f17b1804b1-483c9bc5b7dmr211763895e9.25.1772464444896;
        Mon, 02 Mar 2026 07:14:04 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e692sm437240265e9.7.2026.03.02.07.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:14:04 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 02 Mar 2026 16:13:30 +0100
Subject: [PATCH 09/10] riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and
 power infrastructure
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-orangepi-sd-card-uhs-v1-9-89c219973c0c@gmail.com>
References: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
In-Reply-To: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
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

