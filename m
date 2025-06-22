Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0B716D9BF
	for <spacemit@lists.linux.dev>; Sun, 22 Jun 2025 03:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750562995; cv=none; b=TL4Ga4Fgn/R4wbz78sXav7+DEdxTVLH9l2fCUXUTHDgdd2rrro+QdXZYO+FIrajCwHBCt6ey0+DWjLFpGuGvGcqFyk1zPP9pbtRbZDTXyHa0ESfxDuMIGqWyTC9sNpZQrbzPbNh8JuPbkiZofE3bM5tUIP/oZJ2BbKygJQ2BVKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750562995; c=relaxed/simple;
	bh=PfwZzjjqJBdpG245rW9fZ43Yt8RFpe6Kf9hR0M/wvXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=auF/1JfAEBCo1rMhVWJn4cmIozOvuLXKsg4CjbS5huIT3l9i+gMLXe4/WKYghPurAJ+ACOMM/7+NxMpXGdqF7XffAceu+8ppdyqOJnyWlcizP6jnh9qscSohhwVg/U3RzM8T2iyH4BlHWg9VeHh4qG4YWysYxJXfIXKkX33d/QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=GHIshq5A; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="GHIshq5A"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6fadd3ad18eso34578556d6.2
        for <spacemit@lists.linux.dev>; Sat, 21 Jun 2025 20:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750562993; x=1751167793; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=GHIshq5AeasLQ4Bqvw/qqCIjVpvLr2G0DCMJ+ruddGV8CNnfacZN70IOj8PF7pzleb
         +r7D3N46qXBQo69rzb0T25Q9Mu5sUusiBBOMI/nxQdmcugYKGTUT5X6VS68m3z1cOha4
         4qShC8PKVk5rrS3vYzrfpKlGeK56B4ckN4D4bNOVJqtamp0GyF14C0Cpb1j7Q6F7ZYoK
         5X4BYUFcUJEONG+ftMa0BR5aCxsRO9tf+tSMTygEj+WnN9mu4nhqgzOe+kwKB8IoH8XF
         JeMpbke5t17XxHJiP+0X4LB+RltPoVD8kKq5Fbs+cA87UQpJGkuvyRcQSYuM4hZNwkNh
         2WBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750562993; x=1751167793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=C0RTTNZFPtDtmX7QdCoqDPjL8qClFba4fVVhw+jm4gwgeNSTvKniGGYTNOXkLFV2oA
         8yVhnXdEePyvmT7HIV5IV7878+BFwfe/9mUiZNyneFjFo552C/gUYy5aCMeewXjjGPvB
         nNpOyQiDvACYywpT+r8cN/ploDLxh2gaqvw0BIjF8mT+jr5+pb753Rl5eoethTCQPuRg
         1uODnb94qSg9qXQ91olFV2hlaK8B+p4ozRhRPz+L0DyXgRRL94Xw52xJzk8E5knNZzIS
         dXM6uYqGsSixtp1ioz3/UU4VKLsbY7OfQ1T1M2IgSimkq0Lw3UoNtWQfg5j5iHqkuCVe
         m13Q==
X-Forwarded-Encrypted: i=1; AJvYcCXf6tEGmXObzsfbH7B30CCzs0e7zc8wU4cXuKLp9S1UNPHWNjh5nTd10e7pNBHrlHcHAowH0zH8Sg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwpQgcmlQLm4Ouqxia8SBpaRHPPTqFZtupYKj+2Na06GHJzimcY
	Pc1o8RphWk7yL502gdKUCXvYRiuZEgFMuvJnhf9/oyMUrhJxEtnAZde5ms9FLQMYSqo=
X-Gm-Gg: ASbGnctFO36pYhboY2kZBq3bTBR+VUL/YWq4uIDLXn/HO78MYtfCAWxvqgVkXX0lTjw
	G5kGhNwZzC3ANjvZ0BooDwfylK3HPZrKbkSQP8msyAAHanWx9LtknBqlRaKUHmZTZWQVoaCWhTb
	G5LWMuk7dXQKBM7QD5+hjubou6QJOn+lp3Cz1nfTfrvdSzVV/lSFEX3zXbvxrOw+fz6yk7/jfGA
	sWZuFBzNavuw0MGpQiq0vKhdblDTvv4jyj9pb+PcnqIjDm9qzCgl/l1hEgeHuCuxzZxhu9u01Wf
	iRs8KYRtst6TZOaEqeZ7QXEEzFIFnSRHKW++kgf16Ad4k4rDLK3EFn7hR1ELMNj0yBhtTOi9qlA
	cyikjndJpZamKUEqqebrwcuu7/tNHwQd+FMuhd62TF/nD6Q==
X-Google-Smtp-Source: AGHT+IEZ9RQ3qooYvQegxhYJwv4FcXekxCuxqEkQ4IfzYRI0IXuLRFYbafB1Ip22u1/MKqba1/A0aQ==
X-Received: by 2002:a05:6214:5413:b0:6fb:4c6d:d4d9 with SMTP id 6a1803df08f44-6fd0a46841emr132548106d6.13.1750562992722;
        Sat, 21 Jun 2025 20:29:52 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd0945183dsm30014526d6.44.2025.06.21.20.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 20:29:52 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	alexandre.belloni@bootlin.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	wangruikang@iscas.ac.cn,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-rtc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 5/7] riscv: dts: spacemit: enable the i2c8 adapter
Date: Sat, 21 Jun 2025 22:29:37 -0500
Message-ID: <20250622032941.3768912-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250622032941.3768912-1-elder@riscstar.com>
References: <20250622032941.3768912-1-elder@riscstar.com>
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

