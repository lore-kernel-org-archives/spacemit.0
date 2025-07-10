Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C252F5474
	for <spacemit@lists.linux.dev>; Thu, 10 Jul 2025 17:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169883; cv=none; b=kGgklXYetAcFEbw5C05/5PP7C+jgIWh9WQcj4vBABCbOEqV0G/4HfZLtKI2MkSEW/NyCsepgX/m+mst8bD+PPR/dI5m4PR4n1di5Z8K2TZyJ7giM9Zni031tFWBLQeYuYLlBPDtpTUMdArMM9RMH5PtbZLlnXJJV1Nkw4huYVqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169883; c=relaxed/simple;
	bh=s5NHHbNv/ujgrIV/Cb3Li36tJwcZ44x/4V/i0tucfqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WfbABEMUh+JeEygfsgBlPdOYONSoKTnS6auSwAhGm5O7RV24CgrRWvyo5k24nCyr7XI+5iAfArA6tK3ijFRHnJwQJT/SLSNMASadQlWk91jU8KZLtk0Zr/zdYWwPrrryCi0XA3KuXCDKpc1nxNtGAFpRM2oBZwaj5OxY32V8v2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=e5iY9F2L; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="e5iY9F2L"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4a7f61ea32aso22765651cf.3
        for <spacemit@lists.linux.dev>; Thu, 10 Jul 2025 10:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752169880; x=1752774680; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5l92a0u3aEn5H5uLHNniuYjNUr1Z2m83Q9b51ZTAqs=;
        b=e5iY9F2L71bnQfy8Lb9BNvttYB7GWjIe8bwYyaMR8dySoZHcN+AikT7Z2zs4SmAQMZ
         yU0KxbiPUSl9aKRevBBa5cKc7+QGxT4V10BR825iddVoqc4S/liMit1+0WxO38gvlU84
         D6HOrm2kYW8Ged56r2xZ+VfXGXVL4Dv858sWTdl/RMVQp5zRAo8dawPPpxMCxNpLLlHN
         49adRtSblQk0E5yXfMGTCsMIFcQ+c7UpfFfF9eoSYOlMn5/bPw7s2q+FbiERBL1qmJYE
         3eiPtvRe149jHrvr2i+NRDhUV/oYJ8r2ylhIJEVLe1D+5HPvJFBUblYHSkNI/9ezz8xT
         wlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169880; x=1752774680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5l92a0u3aEn5H5uLHNniuYjNUr1Z2m83Q9b51ZTAqs=;
        b=gf17byQFqhL9uBODyZ4nBuQ6Vr6UDvWYWVuIkhgKVGmPYzL7uwQsAfBnkQBl/GfqDI
         kEumebQkhJ+yV5NBSBHia8iFYPtTLId1BKyy6EKRG655eSksI9jB2hUu5BodN9o9qZ3K
         1w4XThB7wnTkgaNBow3EjeHHGdW9Ipli5nXoVofCpDfLtigAicNtr2xavBQQsp7yGTzc
         Ks9tsjSDHsGt3En2aZcsOtmmMGSEn6MSf/dhpeWG/luGOR8+D1uG6bxrxGYQNAJ0nPcI
         e/1V8tXhMdaRvrRQosPdkhQjVC5gUF0WwA9IN5/0lFtjeS20nJ92bZPxWABys1sEe9a4
         OWcg==
X-Forwarded-Encrypted: i=1; AJvYcCW4raNdFUGTnvh8GDzGmTpKiJ6rrGpP9bJDnYciyuWDb43kBb7YNBOFgTx7XvyRZBdbHxODvhqR0w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0sNakpIbjOSneF0fhvuBRdMC2ymw1YCgS77rNr3EEdvBqT9/B
	QjFaPEV+NvMDoIP9i/REG+XaVBcvpbvdbdzmN10xS9FCMSooInGQ/98befrEQxdFcxU=
X-Gm-Gg: ASbGncsSq5p5hbLbYmPluIjNv2mMgtuDV+CjnLfZL1qpx+GGQjlderALHOSwyyWudws
	2+zG/fY9PXIYsFfNLPzeLeuEs0dxqJ63CVEWTehrX9nNL4ZGb02aSqL4QFJ4WKp3FXMw22jvlFV
	QL1h2CNWwefksEzz2u+b0jfXPq1YCfJQJi5hQz4gNhN4c798F/c8yC0nMmpIh+DzwzN6PbTZFXC
	glVN0ybO/x6bZdG0f2LINbDGvkZjcTpPfWGOOELY6rEKnU9a7S4vyedPhq0krwQF5Cc/JtID1Nd
	F3IfMYVibpuOpoRyMgnIXbPRH5U66+8Y6jmfpqN1SLdpfClKtQKx+EZcPFKS2986NE/SmdT8h35
	sAFps0NBI0oCqgkJjmp9OWLJvprtg48c8FIM=
X-Google-Smtp-Source: AGHT+IG+gA6k2s44x2USnRDQuKJqGd3W7ZyAlmp/eZAKTxA53qYYitzNYMjkTmaqX9EZT28ElFOI6Q==
X-Received: by 2002:ac8:5d94:0:b0:4a4:3b41:916c with SMTP id d75a77b69052e-4a9fb88f9b7mr4651941cf.17.1752169879757;
        Thu, 10 Jul 2025 10:51:19 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee300sm11165941cf.73.2025.07.10.10.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:51:19 -0700 (PDT)
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
Subject: [PATCH v8 6/8] riscv: dts: spacemit: enable the i2c8 adapter
Date: Thu, 10 Jul 2025 12:51:04 -0500
Message-ID: <20250710175107.1280221-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250710175107.1280221-1-elder@riscstar.com>
References: <20250710175107.1280221-1-elder@riscstar.com>
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
2.45.2

