Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4FC290BA3
	for <spacemit@lists.linux.dev>; Fri,  9 May 2025 11:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746789648; cv=none; b=dkNswHdMbGlIItlp8qRgozKSVT3Ap47+wSb8ADI6uer6i7M0wBQ5v7aYaAeejDi+myh64kuGQ7N+h20Mf79tp+UvGSV0rXJ6iGMwgI3V3Y28u1F+ft/KIPE6ATmdVFg9aySN86S6dKZ3Skrh0m+hEOmu4O1W3Xh+MgJv4xMZnR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746789648; c=relaxed/simple;
	bh=4Tfu7eRA9tB15PfqTMYDgMA8+kbtdVsDE7mPEFdrwJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bg0S+fHtXY5Dx43rAZJPvaB8ZoUYgNjxmWmFdes+MXZpt3ZjVtTOeMSdWMzqs0P782NLfkiKkz0PEM+J/UuCSF/2o8ZgFoj1zykfvEDKi/MnuP2D7CI+e+GpY+kl26EnXz5vEpix7SiXzT51CD2FfFzS0k5VoNy/7NExzAPn18o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=LqcRl9T+; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="LqcRl9T+"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3d8e9f26b96so17388125ab.1
        for <spacemit@lists.linux.dev>; Fri, 09 May 2025 04:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746789645; x=1747394445; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LypWPdgaVjchuyzEN8+eJ3ZeR9EetshiFPv+jfPk3YE=;
        b=LqcRl9T+Jt+AMJFY25dfdgZfurVXTQs47kJ7qRzTav0XPHDHa9vkqAJuQwOrJBbvaU
         pKnBMi+8cJk9mKCamrUxtnoFtIn19E1JHIitgojxEdXP42N7rFy4G3bdr9d1/vz1So0f
         fy5u3FuvRX/YjIPxmE6xLHMyxqoWaGN/PoyqZaP5CVfowLPbuqs3FWBZ3Oy4mLGSVltk
         rD/1uD1w9HsrpkMwJAiZag7I+9IZ03dBK2lcitnLxOKZu/kDilXl5vRalZbhVtr7xps9
         J36TZnNt7wAW1buRsm/djnhjZq3aPiOf3RGWpO9CwD4ejG9bCA/V+GJFQyipW9EVKzus
         0TGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746789645; x=1747394445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LypWPdgaVjchuyzEN8+eJ3ZeR9EetshiFPv+jfPk3YE=;
        b=ASCSNUJiXWL0FCksQisnN5C1LE3E9kal+2EBWigFTMKqGTmjFQPFWMNDvAjCtNielM
         dv3qmnNM4B6jqi/SUaKAgy62A94Hyv31agrpk6ak7VbSK/tz0W085ge+nbhC/FDcKUfg
         Jvmlg4ykdU3vOyrQqAfwbfpV+WKisTHJ88Krel5fyB2SGNjUs16UvBX7VAgeV8NXE7Qa
         PRPN3LK+uEtRY0Rr6XDjjk5eDEqPQ/0jbiVYIbL8VCzm1xhS6RY7izu3qhUFA0iwqS/e
         fXDha0zaj1515DkyfELHv5k0wPvg9YGcwYGbhafbhoLuV57K1Rf7to3algq3D9NBe1HD
         azrQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7o49vh3wQ0Rajt3oPxxtuL7toCKYvEVqkxnlKgMraJp/q9uKIIVvga9PMCLTk8dmFKCIyriGY0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxgTPjjUIL5aezu//4SRXrg7bxygkg7oGXitFgtuGSvyEsM3Gw/
	K4CMn/byT3nT7dKi/vdovIxJLJd3aztbYdR7SKsK32resC1D2Hj/xIEgDWXw5rc=
X-Gm-Gg: ASbGncvbVasJnre0TOn1UuoK8oX78u1Dm9Ezu6OqyMaTwA2vFQIJJ+aSPFEq84c7Oxt
	vHeC5dsLpWU9dj/bO2aGIYv4zAX6IUaTAwRagEKW2gNannlmqqGqenaXsAfz66Xqft2EuJ6Pmfq
	zRn00IVbUyiUFPm/25l39YmCTdTt/oZ2myOBXBeI6PUd12dpafUu7LpUYAOtDTOMmUBQwJpLbKE
	2MMP4agPbCmypt8QBw6cwamtdEMcognPYfbEjS1nsDo20aOXZwXonDAFo1tfg8Lbtyo50LM5Rou
	t/PrIXCfc8RhcmBeG3J4GTU+N20HuLUhnLR+J0YC5xyOl6vb/fk+TcOWiDLggbrIaGcLlW0i+as
	h6QfPb4KeoNYN1A==
X-Google-Smtp-Source: AGHT+IEwX5C7RFwHQhMzAQSgpNJvAZGgDS9jyrcBkOYqMAOvEfsJfi0NZkXxGG1Ik7wGvFzbALhLCw==
X-Received: by 2002:a05:6e02:218a:b0:3d3:d00c:3602 with SMTP id e9e14a558f8ab-3da7e1e71abmr33874005ab.10.1746789645531;
        Fri, 09 May 2025 04:20:45 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3da7e10549fsm5136325ab.23.2025.05.09.04.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:20:44 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 5/6] reset: spacemit: define three more CCUs
Date: Fri,  9 May 2025 06:20:30 -0500
Message-ID: <20250509112032.2980811-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250509112032.2980811-1-elder@riscstar.com>
References: <20250509112032.2980811-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three more CCUs on the SpacemiT K1 SoC implement only resets, not clocks.
Define these resets so they can be used.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c    | 24 +++++++++++++++
 drivers/reset/reset-spacemit.c   | 51 ++++++++++++++++++++++++++++++++
 include/soc/spacemit/k1-syscon.h | 30 +++++++++++++++++++
 3 files changed, 105 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 551df9d076859..5db7abbfeb9ea 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -940,6 +940,18 @@ static const struct spacemit_ccu_data k1_ccu_apmu_data = {
 	.num		= ARRAY_SIZE(k1_ccu_apmu_hws),
 };
 
+static const struct spacemit_ccu_data k1_ccu_rcpu_data = {
+	.reset_name	= "rcpu-reset",
+};
+
+static const struct spacemit_ccu_data k1_ccu_rcpu2_data = {
+	.reset_name	= "rcpu2-reset",
+};
+
+static const struct spacemit_ccu_data k1_ccu_apbc2_data = {
+	.reset_name	= "apbc2-reset",
+};
+
 static int spacemit_ccu_register(struct device *dev,
 				 struct regmap *regmap,
 				 struct regmap *lock_regmap,
@@ -1107,6 +1119,18 @@ static const struct of_device_id of_k1_ccu_match[] = {
 		.compatible	= "spacemit,k1-syscon-apmu",
 		.data		= &k1_ccu_apmu_data,
 	},
+	{
+		.compatible	= "spacemit,k1-syscon-rcpu",
+		.data		= &k1_ccu_rcpu_data,
+	},
+	{
+		.compatible	= "spacemit,k1-syscon-rcpu2",
+		.data		= &k1_ccu_rcpu2_data,
+	},
+	{
+		.compatible	= "spacemit,k1-syscon-apbc2",
+		.data		= &k1_ccu_apbc2_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, of_k1_ccu_match);
diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/reset-spacemit.c
index eff67bdc8adba..4137f4f8352d3 100644
--- a/drivers/reset/reset-spacemit.c
+++ b/drivers/reset/reset-spacemit.c
@@ -158,6 +158,54 @@ static const struct ccu_reset_controller_data k1_apmu_reset_data = {
 	.count		= ARRAY_SIZE(k1_apmu_resets),
 };
 
+static const struct ccu_reset_data k1_rcpu_resets[] = {
+	[RESET_RCPU_SSP0]	= RESET_DATA(RCPU_SSP0_CLK_RST,	0, BIT(0)),
+	[RESET_RCPU_I2C0]	= RESET_DATA(RCPU_I2C0_CLK_RST,	0, BIT(0)),
+	[RESET_RCPU_UART1]	= RESET_DATA(RCPU_UART1_CLK_RST, 0, BIT(0)),
+	[RESET_RCPU_IR]		= RESET_DATA(RCPU_CAN_CLK_RST,	0, BIT(0)),
+	[RESET_RCPU_CAN]	= RESET_DATA(RCPU_IR_CLK_RST,	0, BIT(0)),
+	[RESET_RCPU_UART0]	= RESET_DATA(RCPU_UART0_CLK_RST, 0, BIT(0)),
+	[RESET_RCPU_HDMI_AUDIO]	= RESET_DATA(AUDIO_HDMI_CLK_CTRL, 0, BIT(0)),
+};
+
+static const struct ccu_reset_controller_data k1_rcpu_reset_data = {
+	.reset_data	= k1_rcpu_resets,
+	.count		= ARRAY_SIZE(k1_rcpu_resets),
+};
+
+static const struct ccu_reset_data k1_rcpu2_resets[] = {
+	[RESET_RCPU2_PWM0]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM1]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM2]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM3]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM4]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM5]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM6]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM7]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM8]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM9]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+};
+
+static const struct ccu_reset_controller_data k1_rcpu2_reset_data = {
+	.reset_data	= k1_rcpu2_resets,
+	.count		= ARRAY_SIZE(k1_rcpu2_resets),
+};
+
+static const struct ccu_reset_data k1_apbc2_resets[] = {
+	[RESET_APBC2_UART1]	= RESET_DATA(APBC2_UART1_CLK_RST, BIT(2), 0),
+	[RESET_APBC2_SSP2]	= RESET_DATA(APBC2_SSP2_CLK_RST, BIT(2), 0),
+	[RESET_APBC2_TWSI3]	= RESET_DATA(APBC2_TWSI3_CLK_RST, BIT(2), 0),
+	[RESET_APBC2_RTC]	= RESET_DATA(APBC2_RTC_CLK_RST,	BIT(2), 0),
+	[RESET_APBC2_TIMERS0]	= RESET_DATA(APBC2_TIMERS0_CLK_RST, BIT(2), 0),
+	[RESET_APBC2_KPC]	= RESET_DATA(APBC2_KPC_CLK_RST,	BIT(2), 0),
+	[RESET_APBC2_GPIO]	= RESET_DATA(APBC2_GPIO_CLK_RST, BIT(2), 0),
+};
+
+static const struct ccu_reset_controller_data k1_apbc2_reset_data = {
+	.reset_data	= k1_apbc2_resets,
+	.count		= ARRAY_SIZE(k1_apbc2_resets),
+};
+
 static int spacemit_reset_update(struct reset_controller_dev *rcdev,
 				 unsigned long id, bool assert)
 {
@@ -231,6 +279,9 @@ static const struct auxiliary_device_id spacemit_reset_ids[] = {
 	K1_AUX_DEV_ID(mpmu),
 	K1_AUX_DEV_ID(apbc),
 	K1_AUX_DEV_ID(apmu),
+	K1_AUX_DEV_ID(rcpu),
+	K1_AUX_DEV_ID(rcpu2),
+	K1_AUX_DEV_ID(apbc2),
 	{ },
 };
 MODULE_DEVICE_TABLE(auxiliary, spacemit_reset_ids);
diff --git a/include/soc/spacemit/k1-syscon.h b/include/soc/spacemit/k1-syscon.h
index 53eff7691f33d..c59bd7a38e5b4 100644
--- a/include/soc/spacemit/k1-syscon.h
+++ b/include/soc/spacemit/k1-syscon.h
@@ -127,4 +127,34 @@ to_spacemit_ccu_adev(struct auxiliary_device *adev)
 #define APMU_EMAC0_CLK_RES_CTRL		0x3e4
 #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
 
+/* RCPU register offsets */
+#define RCPU_SSP0_CLK_RST		0x0028
+#define RCPU_I2C0_CLK_RST		0x0030
+#define RCPU_UART1_CLK_RST		0x003c
+#define RCPU_CAN_CLK_RST		0x0048
+#define RCPU_IR_CLK_RST			0x004c
+#define RCPU_UART0_CLK_RST		0x00d8
+#define AUDIO_HDMI_CLK_CTRL		0x2044
+
+/* RCPU2 register offsets */
+#define RCPU2_PWM0_CLK_RST		0x0000
+#define RCPU2_PWM1_CLK_RST		0x0004
+#define RCPU2_PWM2_CLK_RST		0x0008
+#define RCPU2_PWM3_CLK_RST		0x000c
+#define RCPU2_PWM4_CLK_RST		0x0010
+#define RCPU2_PWM5_CLK_RST		0x0014
+#define RCPU2_PWM6_CLK_RST		0x0018
+#define RCPU2_PWM7_CLK_RST		0x001c
+#define RCPU2_PWM8_CLK_RST		0x0020
+#define RCPU2_PWM9_CLK_RST		0x0024
+
+/* APBC2 register offsets */
+#define APBC2_UART1_CLK_RST		0x0000
+#define APBC2_SSP2_CLK_RST		0x0004
+#define APBC2_TWSI3_CLK_RST		0x0008
+#define APBC2_RTC_CLK_RST		0x000c
+#define APBC2_TIMERS0_CLK_RST		0x0010
+#define APBC2_KPC_CLK_RST		0x0014
+#define APBC2_GPIO_CLK_RST		0x001c
+
 #endif /* __SOC_K1_SYSCON_H__ */
-- 
2.45.2

