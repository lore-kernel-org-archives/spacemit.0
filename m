Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A8D2036E9
	for <spacemit@lists.linux.dev>; Wed, 13 Aug 2025 02:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755053125; cv=none; b=Vqbe1WYAnEbHfmr0YKOxV00ItvJKgI/lZiMKpdslRXodS/eX6IUH32UyhsaCJfURCa5LXo7YevisF7OM9qQ8KTlH4k3qJuTDOIZAzyZVNQjyHTNX1aK62g9xGdkniFmS0bUCieAo8AkH6xyXF89HnEkS4Nm1Qntwa9/t6dCXnKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755053125; c=relaxed/simple;
	bh=ooFOOV2isYxwgZ2SmK13jgjsTx8sBuH2wENU5XY8MgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HPtzb8iV+FjL5Wt9iI64jSjM/e8YMYZGykx4SDn5adIRCv4X9SKVw6MypGoM5VB47KiLgTW8buE4YV9Qzak14pl/iU2QhLCHOaAYHVCTCD6XkdgkATEtqrLBa+388g3/WWzGAVjmrWMbazESvueqmellzFNNMT91OabQOyoYh64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=y13wBa0n; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="y13wBa0n"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3e547e3f36eso12262745ab.3
        for <spacemit@lists.linux.dev>; Tue, 12 Aug 2025 19:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755053123; x=1755657923; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4wudv5OTn00PNZ8isBITe1KCx3hdy2uajB+8N6UIZI=;
        b=y13wBa0n4phCfKG5nVlJoLR2HiRSjwVtzPhQMrSD2UFqsuNQbgb0t3vntcDCXIpqNf
         vFSeslTIV/ttAiHw/Xha0HJFRHIjUwnOM1BV7sKVMUWJ92uvIAiBoKmOIfoypbfnsOar
         CGmAzMEpO67T3ggU8U9fkCBzEgwM1tuohNjgFEy34bqtVFvoX/J6zd3adRvEPaPPgULX
         Z0JDQi0W73nYj86xR8mzI68xQqlP8a64omilBwDKnDgeuTsY8TBhQHF24V43pSbSuxML
         T+2+LcHtW3CXDipKkNUMnQsSSfFvThBOCJlDUNSYKsuk7BpcBE/cHagRZCAiWCKCN7XO
         0hRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755053123; x=1755657923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4wudv5OTn00PNZ8isBITe1KCx3hdy2uajB+8N6UIZI=;
        b=u//ehvHxa4/HSQqJ1qCu73/8vky9Jk/Xc0JJf6sfKoOEzQW++mucPV4mRLia/kjiro
         UKHMRfNbL6naZ+B6e6oQ4kjoOuc5jKR1Go946W1tD3ZIcQKWr5Co8iLBJn2VTSfWBH59
         h1xRxLnX4nEN0a//qcsPVmf5/cn0ehi70QNmmontcKopRIsGcCz9WQC1Ckfd2HyG2y6W
         QhZJR8+pVsE67PGJ+bA4Yp/NeJW2FOkvD1MH5uH3aZWnBaTeuYVx6AIE2wtt3PskgGDo
         pYYNFCYA80o/HUXG53NJv/ITm6ufJVRtditXYGXq+xPhI9idYk0CRw8zKsVGwpl7Agy9
         I/5A==
X-Forwarded-Encrypted: i=1; AJvYcCV1ajAjoA3R96IJEKwmORwUmRa+uzLoDDhaglpqyPhxGSUPPe3c/nixO0/sV2KAGo11f552kG6aIw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2HIqPKKR/IwJ23AEx20D5X688PG813/l5gFFq3bfBgJgbPcPK
	V7IMme3xy9kafMbPdayeXJcqRH04tQa+WARYr3z/EyIeMsWk9ycOfI8C5evEC55Q9ys=
X-Gm-Gg: ASbGncsNa49B2ZxYgICATQwUQkRGCG3gwDJMN9D45+xxz7Sw8i2lA16rcHpzIVmFSXo
	f+CdViy9s+2n8D2UpHViOIQuIU1h7Y7/K7RqEd1BqWDewowzIrvEJEY4YGXCXYAWK08HhTCj2cO
	Kvw8EagdR/KL+hC+dKRK2WJ3GikX0/f35//2abVWgsiNwdcDFP6LxgRc7c2jhpO1SkXtGxXdhM5
	xXAru9yr6Q3aICOtZyhCLCK8f6zo8i0YUjogWZ4u1hYuy82BTBzPRVdmC0C/lWdU8K78UG4f0fx
	KTqNtGNvXWqSO4ihFX0bExbFo1bYXbsYzJnoQ9oOIi7NG+HnnxtGcU7exvLa6NL6SfDLhDlBe0d
	c63bXz4qZyFD8+ahlK054fi8pzRnF0+9KSrwlyaDAkY6UMzVhVgImpEPLxMuN+Wmh+A==
X-Google-Smtp-Source: AGHT+IHNbGkypv04NReHT7LS3KpLc44/pbzlP8yxnO8gc+9CBy6bawzkc+ztCNL8hpgqnMvaPSvV6A==
X-Received: by 2002:a05:6e02:154d:b0:3e5:5357:6df3 with SMTP id e9e14a558f8ab-3e56738b0e7mr29089105ab.8.1755053123016;
        Tue, 12 Aug 2025 19:45:23 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9bcfbf6sm3430829173.54.2025.08.12.19.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 19:45:22 -0700 (PDT)
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
Subject: [PATCH v12 5/7] riscv: dts: spacemit: enable the i2c8 adapter
Date: Tue, 12 Aug 2025 21:45:06 -0500
Message-ID: <20250813024509.2325988-6-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250813024509.2325988-1-elder@riscstar.com>
References: <20250813024509.2325988-1-elder@riscstar.com>
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

