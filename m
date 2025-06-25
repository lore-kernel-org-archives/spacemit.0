Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDEA2D8DBE
	for <spacemit@lists.linux.dev>; Wed, 25 Jun 2025 16:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869693; cv=none; b=ixeYUY5jogMwk5DbY54yCJwpXW+woaeqJP/GqehkBeZxCjJqN/35O06v201ZsE8KMX32IRT+AnGdbWsjshBT72KQvsRsaUzjmuIv4wvMMDRn/ipQ89jZ023gtrzJpyuJv/HnNCVZbQj5MoybvWeMNGo5UFXHtA7ui1xrxsS7LrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869693; c=relaxed/simple;
	bh=PfwZzjjqJBdpG245rW9fZ43Yt8RFpe6Kf9hR0M/wvXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JacHDAGLbARLkzkLAPk8JFyENN8ECrgQgEv/9owmnumjsiXmsk2eWv+lklr0ArNhj341N6SH6lnlgZlnA7jqN6///jK0SJPZ/iMkI8Q+I36MZ+fPIJDAVj6vPUv99DhskKZgZhm5suxqSckgGvKnWDC+3bXUEJbPO67JO2qZZZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=VPDowtl4; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="VPDowtl4"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7d098f7bd77so19194785a.0
        for <spacemit@lists.linux.dev>; Wed, 25 Jun 2025 09:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750869691; x=1751474491; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=VPDowtl4sn47gr7uRdMst85TEjqp2LXW++FzsR3SudkhCCqqLTjCPKTe7L3VzA4IZM
         uMd1OYfhxp9z6qV3gwR350c86ZLCbucWP6fEE1BdjOJGZNV5EyaM8jJ/QiyNG1HPTuRl
         1u/23EGPUxehXhJls7qvq9REkJFGQKuFawxf1wvQGpKJPAbdHU6jxPQwrNlc1AeiLbWi
         RFZE0sXnNV3QePH8MeBKvJPptvhwiHeVxhPj76QpK54ZX2fQ4SGzT+4jGpivs6gnMfVQ
         9EcibZDAr8kXCcngx+cAOutnqHfIEJbVW33B5l78d1TPIkvpun9bMggnqjySfOEcHwrJ
         Frbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750869691; x=1751474491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=fTkNhn1RWCRi6T2v/IzO4ON2mY4Um8ICr+nkpB1Psvh4xsnTSL/fXZ0tr+It8wywJe
         h2SlXJ87xQSBxXS/A4AdKZRxAPQ645vPCSq2dfJ90MTOgXYOdwzkhpmUkWE/aBy9eNWj
         pSkP9EdaYYLT8rz7xI8/i4V/C/H+xgUcat/K9smjW2/Om6CZrjYuFCxYjFb8+qwMgLwV
         UuQzCUD3vGJOsJnHvj00NU70oa93RavwoqDl+U+v9MW3S+/SA1KTNgMw0GFgHtIuoSmG
         3XXjLH5Nbqz4eEJ+82Mgb50KMgEssFt5da6DvEEqrCyom8qo69iDR0Q4PYQJbjvkGef6
         t4vA==
X-Forwarded-Encrypted: i=1; AJvYcCVqqzmzua3edbPT9SVTLbasuOdacv5PvaUxfmiax/Zq0Pj89cbH/PRbbkYYr384xPRLW9WFmURQWw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxRoJ9sU7DM6MGFGgHoqsFDNIyBxrBufiVQMoyOh75SlGSVUuy+
	mMrqi+8MlgY+i5huf21eCfsKdfuTtFdg2XQxAer2d6Ziq8QZBGMMrsH3ApmuZCvLS7c=
X-Gm-Gg: ASbGncvuSpl442SFJLEk3AZo1OPKtSfzAG4KVdRpy/KYHaxBoVj6SDevtfJ9BXlI0U/
	Zk+CBPTkIsxZhoovyJQQmcfE1p4GHgWMyGjy1ifA/BSyfz0hzVL29z0xDAV2T8oYW2chfa0hx7I
	+lWOQbrYWcdukfBgxz9YgUr1OdO5E/57I7C2VEC88IBxzw3wSFF1x35p9SzUBCkrQS0RdW5g9fg
	p0mi43elMssXwE42I5QTCoLlVsef+SlHpAhE87GQxGmzLh2Nss3Nx0QdteYk5n9bqCPxPbQ1+3Z
	n0jF8zRjjo8U94qT2RzWhTc2C8FiNPCMi1T0dABpDs+p2erUa8puTH/Cqh027L/60AG9+f5yj+z
	FEFsq88zqvwGn41eHozmPO7Xw1MnuGkfsaIwlQxohuNFTqA==
X-Google-Smtp-Source: AGHT+IH4WBO33AQEU4daDUfdQCrNAmkqlpvMPDGNy9OxOBKPBp4zs4BCFmH0xBJiPH3X1thxaYnaIA==
X-Received: by 2002:a05:620a:40c3:b0:7d0:9a99:1bb1 with SMTP id af79cd13be357-7d43bbdd560mr26509885a.25.1750869690791;
        Wed, 25 Jun 2025 09:41:30 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3ffdb190esm576783085a.86.2025.06.25.09.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:41:30 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/7] riscv: dts: spacemit: enable the i2c8 adapter
Date: Wed, 25 Jun 2025 11:41:16 -0500
Message-ID: <20250625164119.1068842-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250625164119.1068842-1-elder@riscstar.com>
References: <20250625164119.1068842-1-elder@riscstar.com>
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
index fe22c747c5012..7c9f91c88e01a 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -40,6 +40,21 @@ &emmc {
 	status = "okay";
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
index 14097f1f6f447..a85239e8e430b 100644
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

