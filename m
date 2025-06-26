Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE382E92C4
	for <spacemit@lists.linux.dev>; Thu, 26 Jun 2025 14:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947523; cv=none; b=Zuqxm3dN7ewwkHCHZ3sN693bPZHPiCBtJz/Mnye/hzSDuL81ltCNf38ouurahjvirlCaQ3g6Xbhm8mGzst6IPoLHzFZkHE3g+2q2r12K//XMeAOYeTt/f7/ue6kQSWrEbz04uid2y4u3U/CPMobMoyGbrJwxggDWX2zml6vFmSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947523; c=relaxed/simple;
	bh=PfwZzjjqJBdpG245rW9fZ43Yt8RFpe6Kf9hR0M/wvXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=neo5gpFT+tT/A1HpMDB/UQHQa1huRlPeMCchhtkI0+E2iLNOfFRvlf8h/rOsDC6bug0D88yINUAMCemg4P49f08neUVATEbhYCRidy8yNPRrGkPxSjcBIUSdN9NFXczVlsSnRgICapC5LmyDYapFZ0MOkMn6Fwanxru2InirHoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=VHINg4Jn; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="VHINg4Jn"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4a440a72584so12529811cf.2
        for <spacemit@lists.linux.dev>; Thu, 26 Jun 2025 07:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750947520; x=1751552320; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=VHINg4Jng0NpkYSwgtTf0TYpGef+NFxYQq82eX69UXgAWcnAt416E2Fvsp/j6kIIgS
         Goif0/1wTxjz7LUDAkMuBZ/GJM5HEaJuBusrOUzA/3K0JzTVh9msbDED6GRsalUWIxKa
         ofxi/FNzzBkL0Kbe/zRXwUMMYCuc56OKOXViZrF32AAetWK/Nse8rKRCkCvU4t+6ivSy
         p4NlbSp/yNLHbvJUsVrorbOYOF2mFaEbE8fh6NaUc+Ab/+o1plnnv7DXeK5AAEmN2WAe
         S8vwJbDDUMVOvSO0ynAunnyNZUYSzbgrQPEvCTsD4Vlp55bK6Fr+/7jn0i2oviO2wSwo
         jZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947520; x=1751552320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=Yy9Nj0eUcY3tVd3Y4i2uwRg14341/Cu2P6XGm6UlkkIN0I+sGsPZjz0DChzHEHbJkS
         FOnJw4QK2/s7CCtz3zTBPazgPQJk8KDDJcPlK2gDL4wLZTM7sSP3+Hun2ZDk+QLR49+t
         40GNbigpPTtDy4TYe09nH9Ga+p94NEcb3i1AaPyL8bMLrGoG+0wcIzhLYy97iO0shNDx
         yfZQpnvvUdxusrTQO9yIoNimgfGpAGn2zH1FZYzl6595n01Tu6xdORqelgqNF09P1O4o
         SifRpkjTzsuOSDwfsjHohFz+7sZcwoMVDnnzwqsXLTR6H301J1RB/23ifYnIhfuWhez5
         9AXw==
X-Forwarded-Encrypted: i=1; AJvYcCVG1+0TmRn4QZn1Z2u1f7EW1m1qQg+GvVrz3zX/KyIBplX2Hyb6vA9jKnJRhbYAk/5IL2tVIa/zxw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzGMSW15UCAPOrWuKgNSaCHxtiK3Fjw4XaL0YNM94DFL4Wb23Ml
	+DLPoB1SjGo0uGJn6Oc/ncbfTkwPolBESargr6DkpUR9cwcRQEqCIkRWJcCws0NCBiA=
X-Gm-Gg: ASbGncv1ClPJ0HgG3jjPVjj1OW8OJMqmL29l4OaAxvXYYvtCpuTCePSm0vzNpA3P7aG
	ux/Nl3R5rtmSWWRCUyOWyUSLB5RmPmcRc1+pgI7EBXvOq1qj+YWJRofTWvdIwNNxWuRC43hXMqA
	xRuscvulv3uf1oIRSiWZRWP9Kw/V4a5RgjobrApSO/6zMhE1GgP8CjiDBuzvVLri+VeUGzix9At
	gQBm8P+c+3GkV4QGm1hIvA7qxA10AdQWR/ld6kFCX2dHOpBKTe1AfTe0moxN2cZpn0+fmMYunwn
	W36LWjJaH9E4F7Lg3p4J1GH8lZx3Fm7ym3XoN+XIlb81h2+Si9+sWXPvzr+Kcw6l9ZZUy723ZOa
	CR8QU/o5iPn6baQmApOHvxu2Jk5mW5eMhCUc=
X-Google-Smtp-Source: AGHT+IEI1vvxdVVtw24k3xjXm86y1FoYzkQAxQf+2Rv/Yd19jGEMG9C5oqEg531N9y5/GIYuWd0Wqg==
X-Received: by 2002:ac8:5ad4:0:b0:4a7:234b:222 with SMTP id d75a77b69052e-4a7f3e88976mr49122961cf.22.1750947519837;
        Thu, 26 Jun 2025 07:18:39 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779d6df17sm70266101cf.30.2025.06.26.07.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:18:39 -0700 (PDT)
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
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/7] riscv: dts: spacemit: enable the i2c8 adapter
Date: Thu, 26 Jun 2025 09:18:24 -0500
Message-ID: <20250626141827.1140403-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250626141827.1140403-1-elder@riscstar.com>
References: <20250626141827.1140403-1-elder@riscstar.com>
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

