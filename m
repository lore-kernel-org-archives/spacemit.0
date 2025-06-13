Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D628253B71
	for <spacemit@lists.linux.dev>; Fri, 13 Jun 2025 21:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848523; cv=none; b=fvwecJplCoSPtX93vbJamFLDrQgZdTEQxKjSe7BrDG20Fycj5gsi11yts9vrodJ+Wkin9gcC+ryrs4rhdcBrriCmuVyBlErmUWu9nvB0Hwdx1yHbKZh/KIRsco8adZPzqoMrZGqWrh62ThdQwxzXBEA+0ELPvn4U9N6StmYC9VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848523; c=relaxed/simple;
	bh=OjjfW5o4vw/nHQvb2Y1n2INOdZ4wgN/cSmHtl0YQR4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o5pUUvuAaTbBLwNC2TUtGmJZAwh9lBF+54QjfJNHStpC4s+heis1Ry4/B3D2kGjYSC2Fa428+CJbQZdSEly5U/do/1ZGKvD6oAC/WUY9rDl4bYjOT5WG88FrU8X2md0uPxKPOWAsLlUQbV2LQcufuFhTPQjqJEKPhkdVXlVoA9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=fXuJT7Pj; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="fXuJT7Pj"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3ddd2710d14so20586065ab.2
        for <spacemit@lists.linux.dev>; Fri, 13 Jun 2025 14:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749848520; x=1750453320; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2mgtiYfhNYD39L2Q37c064MNMF3bvcCZcMAWhqDZfw=;
        b=fXuJT7PjRCL3WKZJWbSaC+7HYLNdwKrh3qS2YgMio3FCV0qxIVyEMZO9/cFNQUYUDL
         Rzugv1vv6R4U6H5oFvySgNzVOoKlg8dYpyJAN0ebLAcImv7CPHLOss9ExwxxZz2Inids
         F9ZvTBiCr7aU+1diCu27LS06tdXTzKjG7SFx7HyG6LHn+EdLZd0Uat3oYo2jnglo48Z0
         m5dobirpAH28NHyhJBzNG/NFNdeNYEDdTzc0hWAjLIH3o/18hWuMNg4IYMSO+yCeoebK
         du0F+1qRxXkvjmtuXra8mS219noSLqbjqN3UTCnUMBRG+PekFMSdNSHiu9sEcIi0DZSe
         VmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749848520; x=1750453320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2mgtiYfhNYD39L2Q37c064MNMF3bvcCZcMAWhqDZfw=;
        b=jQiX1DeXYrt5JefNlic53CxYrFKfphWa93QIB+X/f2qDMUKStkNrvfd1KVXN+TExuT
         UBkjYXOD0/3qSzZRP+RmbXJ5ui1ADKxXh5ucYwZ84I8Kx/TRyvTLhD41VSfYKGGZLgUx
         ZoL8YQ1kYJJ+QhecUrlRSaGYZYWCpJiO3NB/Au7XjwmH293+d16fCb3V/7WMox45oZho
         UHU0r9IwoK5IZKPP5IF+loG5fNgPxSsSUs/dua/c5QqL6kpyO2e1+ds9LkQ8Htl5UT2X
         KQtNbjwthceSBDYpokJNj6+8q3r/fpTQUZ8JVjbG1CvFuLBf9xYoPOcD9f/XlNNtMuPj
         8iYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWSU8YFP5/bnr16UjoTFM/mB0oEmwrIw5tRfXs7JP2azEYLkUdQ3JtS6QbnZDSlJIzsyFqcfJajQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3K/nWLSkrZPiBjWjbiDqDqHMvKWxZSJygAS5641/Lu0Q+e0JU
	uA1qPKWS4J/cyIP2/HmmWCPruBftB27NKwDZ/xCWgy9brYZpu/mudVJJ0T3WB6clpro=
X-Gm-Gg: ASbGncvVj2TU7TcHcG+px/j8EHNnMrFnvQY7dW/QbMTVSRUfEf24sTn9HYZWCsvMdxv
	5WWLRLIOTTL6l7SZ9MlutcwpIZSZZVyMJDb8UKoIR7haHOq1uNrVdzevEh8DWUtJceA3W/gTU/k
	9msM9U0uqLgLNXncwiLIDP03mPC67mpt7XddJwTXUTi6+M0WmXlNdCkRluLvxG3DAjMM/yM1FbI
	Fe/8txUyvdQmD0N/L5EyKY/FnyAysaqkGAO7Ky1WLa3nBsg+jrIjeOI6xk1JzROezIi+fw4SF28
	faKMS828lBZfa09QMwXtQy8W/sO7k73KlY51jLob4meLzz5gAfa/vnP3TZ4/PBpD0D3z8BYSgiz
	r7FsJEGk1BzReTLqARb2VUA0GmZPEv+M=
X-Google-Smtp-Source: AGHT+IFJnN+44P/6kI3Vi3znat08kUjPZnFLip3bdnFcT5akCn5z9CQ3kkgTwKRZIufa7kf1G/Q2CA==
X-Received: by 2002:a05:6e02:3601:b0:3dd:b523:7abe with SMTP id e9e14a558f8ab-3de07cee497mr18084105ab.18.1749848520290;
        Fri, 13 Jun 2025 14:02:00 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019b44b3sm4996315ab.10.2025.06.13.14.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 14:01:59 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] riscv: dts: spacemit: enable the i2c8 adapter
Date: Fri, 13 Jun 2025 16:01:47 -0500
Message-ID: <20250613210150.1468845-5-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250613210150.1468845-1-elder@riscstar.com>
References: <20250613210150.1468845-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define properties for the I2C adapter that provides access to the
SpacemiT P1 PMIC.  Enable this adapter on the Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 15 +++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi    |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi            | 11 +++++++++++
 3 files changed, 33 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 816ef1bc358ec..f5d454937d300 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -30,6 +30,21 @@ led1 {
 	};
 };
 
+&i2c8 {
+	pinctrl-0 = <&i2c8_cfg>;
+	pinctrl-names = "default";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
+		status = "okay";
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 283663647a86f..9d6d4503fe751 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -11,6 +11,13 @@
 #define K1_GPIO(x)	(x / 32) (x % 32)
 
 &pinctrl {
+	i2c8_cfg: i2c8-cfg {
+		i2c8-0-pins {
+			pinmux = <K1_PADCONF(93, 0)>,	/* PWR_SCL */
+				 <K1_PADCONF(94, 0)>;	/* PWR_SDA */
+		};
+	};
+
 	uart0_2_cfg: uart0-2-cfg {
 		uart0-2-pins {
 			pinmux = <K1_PADCONF(68, 2)>,
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index c0f8c5fca975d..34e843bd275fa 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -483,6 +483,17 @@ gpio: gpio@d4019000 {
 				      <&pinctrl 3 0 96 32>;
 		};
 
+		i2c8: i2c@d401d800 {
+			compatible = "spacemit,k1-i2c";
+			reg = <0x0 0xd401d800 0x0 0x38>;
+			interrupts = <19>;
+			clocks = <&syscon_apbc CLK_TWSI8>,
+				 <&syscon_apbc CLK_TWSI8_BUS>;
+			clock-names = "func", "bus";
+			clock-frequency = <400000>;
+			status = "disabled";
+		};
+
 		pinctrl: pinctrl@d401e000 {
 			compatible = "spacemit,k1-pinctrl";
 			reg = <0x0 0xd401e000 0x0 0x400>;
-- 
2.45.2

