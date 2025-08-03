Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1CA1D5CED
	for <spacemit@lists.linux.dev>; Sun,  3 Aug 2025 02:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754189908; cv=none; b=WNkpP9UEA13r08IPFBlb69nNMyWMuy1m/cAwa2zj2+dwAqVIxVjDNPh/PsbjMaZ6UoYahyFsJCxc4W2m8yjEtKi0wbm1AmEgDKbLcO4SZ35SvcBZ1owNQubdNtyxdi6tUaqxxePPdv5WsGU8TL4UU9NAZqAThOSD9cW5Z5/d/4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754189908; c=relaxed/simple;
	bh=ooFOOV2isYxwgZ2SmK13jgjsTx8sBuH2wENU5XY8MgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HE37krRf7PceKcffhXvNRiBzAgHW0mDMLzTMJfehg0VUPYv0T48koFx3ipZ+NcK7WFo8AA0Bq7Annqmyg+k3J2P4WTrd8NonkRg3II/a57e/K/TPCRaCCpciEUwqdWMT5wEVe007ZEBLBrmhhyYRsXGoOQcJFPCZ6fqPUGa6ffg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=CqoooeWq; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="CqoooeWq"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-87c3e35b3cbso186103839f.2
        for <spacemit@lists.linux.dev>; Sat, 02 Aug 2025 19:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1754189906; x=1754794706; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4wudv5OTn00PNZ8isBITe1KCx3hdy2uajB+8N6UIZI=;
        b=CqoooeWqCziCe0RPmGPo/jpii3Oz0idUySM8P94eosQZoAl8ri9/Pye20kZQIX6yUj
         PT1Eiv6+myf4DKNg9zWPLVrO6SNMpAkmTCYpL6ex5vNQ84m4n5rn0vaaKoQFchKfCCuY
         tktDgCMrE9n09bs2DxYPnj4riss04klkLk1tMZ/aFJxwHFYEEqm5YFdimiUzBM78ipxR
         EdTKNdITikQHFmsk23lHUKNm+LQavPJaOd5NkPKbHdXpbWsQzxYOllAmd6q3ceLJmULj
         CudNDxla8HZD2P65AT0/KEht/DzEgCU5BE4EraN02vrNvCQhwFmNHspWBV+uF5Lzk+MQ
         00fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754189906; x=1754794706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4wudv5OTn00PNZ8isBITe1KCx3hdy2uajB+8N6UIZI=;
        b=qGF/8xOuRF4QL+uuuf6lvs87ePqsg/HUbelHrF4x5OherQsCd96Ivpg3wmsJWVWg21
         sRnOVOibB9FmBWP5wNPCGf+P8uDSMk3qLsHGyq3qCq0RkVNLokiWp/MZOjLZcnGbeWVh
         uMw1O2MQsfMymeHaq8x/KVsNvmpv/cXEHGnaOCVFLUiX8zljn2pSInKQd9bIws0G13Td
         HDry+rFxZQC9oAAfTofHt6eIck6+Mpprkm0ilrdIrwFgl0Um13udoGvHYnCShfb/MMUX
         6YrFXDM8VPfNvfl4tAjeQoYe3CVzxKl5SQAzmq/lZQxFDZaVc2d7b5UDoya8Du9ta+h5
         QutA==
X-Forwarded-Encrypted: i=1; AJvYcCXSL2pUAvDXbN68ildPWaUAey/Y001fRE3W5QpiZ6fUIf5a+0io9KxeS2FrrspedKp5zUuPnHhR5w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzxgPsOXj7NIVsM+qIiB0mePiS/Xp2/rIdDaxZTOVy/ye0LnWd8
	cG9o/LTS8vL22qbBFfdiRwcHbzOeAZspq0xKx6FppWTle3o9EM1BZKhWEbw5ZLqEEMk=
X-Gm-Gg: ASbGncsXD0j1whm9HNETKPcgHYHmf1DlC3rvcGtO+bqs99sbVcn9xhKTrN2HRGi7OAk
	ECmcpRu6sttc6v496KRTbThrNPpai0CXZ9Lfquo7rTpWOXFhqbXqop/gJP2NCkiEdQQmK77ZMwM
	6D491Ebmm59k5zWpCtNSpK6yRhq7TYteCNUeGVHsg4idrgA0kY60Pn31npFr/7ph3Ka0gm0s4jb
	0OI8pfD0C4TKLUjZU+70xYQLNxFJlVXqSl4A0lW84Xs7OwXnmpWTjKc65xrpIYIBmDG85Zd4jOG
	O3xQSNWS7pHzxOJGQFYqUjEDAuaWATBaa7SX0HADcPyMmsE49eeuh8givD88DUzZ9r8gd2ejsAl
	Qwe0Cnl1RqRhg1fUojK22GSlbniOKnQZtEo8odZ9100hVVMl0LjT1avRKvBTsiLgxzw==
X-Google-Smtp-Source: AGHT+IG1jDuM19c32X7FZiZX2Nxo89FAdD6zwv+Hp+DkMIntJ+DFbyz02dTcR3RcFe7s1nLk4iRizg==
X-Received: by 2002:a05:6602:2292:b0:880:f66f:b896 with SMTP id ca18e2360f4ac-8816839db98mr738100639f.11.1754189906348;
        Sat, 02 Aug 2025 19:58:26 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50a55b1ac2esm2251906173.1.2025.08.02.19.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 19:58:25 -0700 (PDT)
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
Subject: [PATCH v11 5/7] riscv: dts: spacemit: enable the i2c8 adapter
Date: Sat,  2 Aug 2025 21:58:09 -0500
Message-ID: <20250803025812.373029-6-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250803025812.373029-1-elder@riscstar.com>
References: <20250803025812.373029-1-elder@riscstar.com>
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

