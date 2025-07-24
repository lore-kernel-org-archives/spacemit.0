Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E50262D0B
	for <spacemit@lists.linux.dev>; Thu, 24 Jul 2025 20:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753388729; cv=none; b=DYGI2U/dslGvt0ZVANbRfa+cSKAIFVkF5P1uF5dxF64IO97GlKMYJIoIzF2rf3lizj8f60IQxYxOPHN831hMKNo2Y1uWGFYSyvbusYxULyARVh8lqvycLZhJKZxfkNKP0fA0VOrwSPEii/qKay8Bty6uzFAe9dQeXpkM4cmF044=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753388729; c=relaxed/simple;
	bh=MXcjaXpjv7EjaAY7kMP4uQh7uHeIBr5NeRkMjZEmHFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qOvK3sIFsbzGj/XfIL41U5MSwBK0kjogRLNVbSK0dQUcrnKD9GooB6hbevz1+WYYo569nG/hugGRKXdID5PAzjW6MxJ6cBsFa2lE9ChJRiyU+gkNJTBADkmJwZ+hgc5zw5qulGsAQ1nfNw2lFQNLFa8DLHHSt24WQTyYcG3F4hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=NELigrQ1; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="NELigrQ1"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-87c11fd5364so59459439f.1
        for <spacemit@lists.linux.dev>; Thu, 24 Jul 2025 13:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753388727; x=1753993527; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZU8vkaDk2qb4Gs1NhAs//+b9ebi++Ho3LYwlzWZCXY=;
        b=NELigrQ1yO9SQ+6MDtjLje7YwZKxT2vY3jYIXSbiiz3uhzCqKvyUlCe/5Z65usKLQe
         1Oder4YlXY2ppvwA5CQxu3Jan7t7ZQV8vDygfe0Gjmxdds9w6/1uU7frKoWZz3q2RzhM
         xKPEzVvdBqAziVHGornMK/ndY070LLNQztkAKgHXNB7SaJnw2+EBb/anajqZOIdXDsok
         8E1ep7cVLTF/tery7KneKYdjbJCjZ6Wyl/f8wxHFlEshH697RIanhjMrXYxCupricWdZ
         eNxIDveYoycYdHPVjjisbwbdMUUnlw5skE+8FTSk7c8O9/2w2ZgumX11PZ/G8HK7E5IL
         VUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753388727; x=1753993527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZU8vkaDk2qb4Gs1NhAs//+b9ebi++Ho3LYwlzWZCXY=;
        b=jq5f1F/m+N45bZFzcGctRiJgn5G6U5ykXJRcrb3Rz9jrox+Bso8q2t8exh5oItk9Jt
         e2+0p5N9ADNZqBgnsfXaDeiPx2XHJomO80F6Gfyp6Omraf4CQQah/SD1EAF5F5rVIm+F
         M69QR1r1Qm0UA//1XIwlpMWBk/MnAPDsI5Z1L/Yak6BpZpkH17Rm8cPe844GtxiDTiIO
         NPnDq6eoqQj9uZ1dLYjC2WrYBQuphMfTmT+erlrtpitozWB/trmu1yiBDtLrnvz4VdwI
         FhcVw3d/s1iFKGmxWWfaHRWOAxYokN/6Bd91ISqUxZUwUTyp2WuleebwEdEiSzPRxplW
         02MA==
X-Forwarded-Encrypted: i=1; AJvYcCVMPEClm1mhHXmwRpzj8urE5ECeCEYZ5pEAMDdofeBvufEMembEmI+wXkXDOojt7gNCByIt/jKL9A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyiEPVi3Xm363lMi+wylHiACnaDje9mp0ffScmUBYX4twEU1iEk
	9eD/mDuo7NN2ZsxLEJecenPnOwrDWzK5dwtml9rw6T8QbsUlKze3j+DdAT3UpK9g+SU=
X-Gm-Gg: ASbGnctW9yEqw507nb8DQuda6jedYLQgSIIxP7FEv3baOCQHnVntjLNaWDHaj7+X0Ip
	KzxPxJeIg4kSqrMcNmiJx1j/XA3oqI6xpgopDNTHVGqccbXrY9FmI8t3P/poNw141YIhzXNgsqO
	u8o/NbYkHMg42ufXGqsOanynUZ3+KsEvUqi8qOHCJOvTM4792HwRqUnDEBHpPJCIF+5niV+lZUy
	71pxbBdz70fC7obZKvsli58B/Slktkl6NEwRtlSb2Qu1+GLVFX/yNs6rvk/KXZ5/4KsUyVpLPg7
	UpWgQKkrZOA3UshNAiV6C79CPYj0R94uCi2MGjn0Fe+fslqvfF97QJm7X6XzRQK428P1x4joaXj
	i7OuJXFnK+XtGsWO7N0NKCHG5fkdE2nhEQvO4TTGTJ/v/CpJVMXY=
X-Google-Smtp-Source: AGHT+IGsD3HwADo3Oj0KCwtP/jsKopOJoqzhN2wHyyLonxBBo4A1qnAS9cZXjozcGyBbHnw7RWwe/A==
X-Received: by 2002:a05:6602:358f:b0:87c:d3b:a358 with SMTP id ca18e2360f4ac-87c64fdc182mr1615756739f.8.1753388726816;
        Thu, 24 Jul 2025 13:25:26 -0700 (PDT)
Received: from zoltan.localdomain ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-87c74316a3bsm63080239f.23.2025.07.24.13.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 13:25:26 -0700 (PDT)
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
Subject: [PATCH v9 6/8] riscv: dts: spacemit: enable the i2c8 adapter
Date: Thu, 24 Jul 2025 15:25:07 -0500
Message-ID: <20250724202511.499288-7-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724202511.499288-1-elder@riscstar.com>
References: <20250724202511.499288-1-elder@riscstar.com>
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
index abde8bb07c95c..2a5a132d5a774 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -459,6 +459,17 @@ pwm7: pwm@d401bc00 {
 			status = "disabled";
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
2.43.0

