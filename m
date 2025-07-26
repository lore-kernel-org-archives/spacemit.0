Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8410F24DD01
	for <spacemit@lists.linux.dev>; Sat, 26 Jul 2025 13:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753535423; cv=none; b=V0YWE1zEjxKB7lj9E2vE6EDufnswNSLjn9w6u4LAPmEvQ1Tmm2lWsAFVVKWHPjqh7TRAljDLKkpRWgunGKsq4tD2yiGMrOFJRolC9v06X4h+ijXALjFd5A75QiOOqVA7ZOy2GHzB9yZW3KmJ2/E8UYpZfgsz5Z2mX4yGMmim0Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753535423; c=relaxed/simple;
	bh=QGEqlYXIwxO55BW2Qob9nSxq1Am14CofBss2UkP4kt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kLcy9f0iJ3wu1Y94SszNouGtLfGp5RA7bBAtoXNyzgVMba/mb3XMj2xebEs5bZ0TpYxcvA8tcFLDFgMTtygqXhEA8mKyPKcz8uc27vrIh6BSv5TerF5LzzGdQ2ryI5bWP0qqcKPTi2aRY9j25NnOFwwHwkq0/YA/RqiotJpOxaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Okh0e7P1; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Okh0e7P1"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-87c070b2dfbso114513939f.3
        for <spacemit@lists.linux.dev>; Sat, 26 Jul 2025 06:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753535420; x=1754140220; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XO2Fy/81E/WhCOJwM6NoWD+/CZxHHhnDjYEWoZW3i/Q=;
        b=Okh0e7P1GiJiO+FuJZ8Jc3/SuJ4BhWS6YUOkxWz8A7/dIpwa0RBYLqUAn1cSMm4Ww0
         Uuqc4yvtmMiD26Ms4mwSFG4bVccHdA2kKKoFZAfbmNA0172ynRgperXSB/v8zRfCMHkH
         DwMEN8cXAImSAlwgcg+/ZfHvkBtJpY1orTT7iFLqZvCCZgAuOiIKMtB+fMJLNUkvpdON
         XrrOp8S79ahfGI7jUGDZpNcn5T8p3RtF7e15WW2yqcfOfHkhCQE5MFBXOAPB7G7Pm7zT
         y47V4rOb7ZHVu0BnpZF2V6fMEmJtjGwVJ4SulZbf+LYwMB+U+X5Yo96EIaCwGtjy0xbH
         yu1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753535420; x=1754140220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XO2Fy/81E/WhCOJwM6NoWD+/CZxHHhnDjYEWoZW3i/Q=;
        b=xTJsVUflZj6Kyl7NyViQgLrxkrmWPHvb0qx17Aq9sAQsxtl5tehyujiZfbcFrm34A1
         Kn3jGI/boOyoXQCo1GkQCCygChZ/Ddgk9g7KLNhn03qBv6O6VJ762YkIk4J1IHBCcm2J
         sTKAeu2+BjSrPjhj7bEkNgQvk+3GL8F7v5aMgQGLd+usWO7nqwtsLZznjzK7E79N962Q
         sQ4J/ojkT9iFC48MUTTncrTbRK7VoL29IY1QFYHj7Scf6fur2h4lSBhj4SuwcVYw71xh
         k4J/RVLAARKS9VEUg9lQofev/9czARvJUGjxaZZso6AJpTcpC8SbFpUNpFIguSKHpUFK
         5zYA==
X-Forwarded-Encrypted: i=1; AJvYcCV/uTsRzG27cEE0J0nCbt7Cinz3fdTVcGvS6WvKxllLZsZILp5FVj1doLL1YCLYH2/MWtnrcpS0Ww==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx31z7ldiQw/rGqkW+769l0+9Ux4dWUwtNfial0PM3f1OlrYF+U
	fRoBuWfAihKSr/RirViZELBucIxWFUOnoWUlSu2Dp82pgs/fHVbnuF7qEmTy1fKFMsw=
X-Gm-Gg: ASbGncsoh8gZeAE77nzUftNRpoysNMnF67C1OjsUDt1ltklHZz1ZGjYEXySfXCeNxgf
	TO2SyPE99P+X7DfL0vt2jKBaS6O6KArOWnIzOTWOfH9scE97WGM1LTa1q8bEc0anwnCg4eQjXqC
	3Qk66Au9HCf1T5SwuaCE3Sw2Ak4m/5z23bJUho96OogqULe8f2g6jJQYyWXv2q5Hw9WBQU4yXnP
	dqNXcDq6FW0Bo5G2xhWTUqRcFbNMWKBjTiXMJ6Wfm9Z1gPFFHd9aKbiaLqSClzCMbLnZ4z3voP1
	rL0alO0h199qdKeMRz8vJq1VfNagEjEJAV+wNahDO4nqL+U3a4GKR0RNo53v+fTTYLwjQ5Pt6Kw
	c9gCQkW11mVYnhuZfiyKLFY34FJKjym3TvE2z/WR6Dfpi4DVaFMt2izIGilS4w2TjAQ==
X-Google-Smtp-Source: AGHT+IFowWZBk8AVURVAXWPSaWfOPiE/GFgKH2Cki+djIREns99xE2XqEQbxbnTzUozYyQveuIR00w==
X-Received: by 2002:a05:6602:2dd0:b0:86d:60:702f with SMTP id ca18e2360f4ac-87fff9442fcmr893288639f.0.1753535420282;
        Sat, 26 Jul 2025 06:10:20 -0700 (PDT)
Received: from zippy.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-880f7a4ee9fsm49551439f.33.2025.07.26.06.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 06:10:19 -0700 (PDT)
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
	linux.amoon@gmail.com,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 6/8] riscv: dts: spacemit: enable the i2c8 adapter
Date: Sat, 26 Jul 2025 08:10:00 -0500
Message-ID: <20250726131003.3137282-7-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250726131003.3137282-1-elder@riscstar.com>
References: <20250726131003.3137282-1-elder@riscstar.com>
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
v10: - Move a few things around as suggested by Yixun Lan

 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 12 ++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi    |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi            | 13 +++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index fe22c747c5012..ae9409fe398b2 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -40,6 +40,18 @@ &emmc {
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
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 3810557374228..96d7a46d4bf77 100644
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
index abde8bb07c95c..580f77b5e838a 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -459,6 +459,19 @@ pwm7: pwm@d401bc00 {
 			status = "disabled";
 		};
 
+		i2c8: i2c@d401d800 {
+			compatible = "spacemit,k1-i2c";
+			reg = <0x0 0xd401d800 0x0 0x38>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&syscon_apbc CLK_TWSI8>,
+				 <&syscon_apbc CLK_TWSI8_BUS>;
+			clock-names = "func", "bus";
+			clock-frequency = <400000>;
+			interrupts = <19>;
+			status = "disabled";
+		};
+
 		pinctrl: pinctrl@d401e000 {
 			compatible = "spacemit,k1-pinctrl";
 			reg = <0x0 0xd401e000 0x0 0x400>;
-- 
2.48.1

