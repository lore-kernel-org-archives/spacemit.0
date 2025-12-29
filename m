Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1712E7F29
	for <spacemit@lists.linux.dev>; Mon, 29 Dec 2025 11:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767006274; cv=none; b=FcEyDNt3mHlxeVBZ43aUX/UMKbXqcgJy2juvZ2tAZGZw0W9ne894YNHZ9c3fFlDtoJ3c0cs5k3HfSFQIPlbwcCBVCWsbrzxAreVG4gkzJLc9AoNu9I+SlrnOyq3Zpwh7Mdt2OkV9TH/5M8NQ1MV+3Vf8rjb2r7Bi9CQwUYuv1bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767006274; c=relaxed/simple;
	bh=gTzrS/GJFNs3HUrW503aR1sUg0Y55rjRGuAjF7yl8AI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ltrAxI1gBc4Vx+xTcQn5S9+QxxgVnnk3zuLKJ5s+5lD/sfto+SMy1Ii0szFVU4SBPfjVgcYwOVik46o7iUOM6MEWssfpyCjb8QRkPhdgxRICu4bZbu/R/Bg+RogzB2oDDBuUkvsD+TnoN1RV3zMem5Ql9yJyqNHBLUGeXA7gueQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=aPVaGeJ0; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="aPVaGeJ0"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7baf61be569so9274823b3a.3
        for <spacemit@lists.linux.dev>; Mon, 29 Dec 2025 03:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767006271; x=1767611071; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FEchA6+yuO+kdA1fAAObKTJMPxKw1rQkSoXSh2GsmCc=;
        b=aPVaGeJ00TAneP5kFSFcou5OCd/a29Ti0tNlfwKLjKt6unldVo4UourcEyz9dI0UEH
         WqCuCBnaMRT7jRBDVIxpeb/FONyi/Dxy6cMZ2o9nmE+gOlzNakLSF0bAm/cbTyl6CNID
         4SI6KQPdXhOrBZ+G8G3jKfpck2aHuvCQiU2bG9eNp5GQiiF7YrNH1ATprMDRJKfzwIzJ
         FE5VCjzpe5xCags9I2B1Ul/FKOAfKt9PtS3rwrbroiqRCwuLY/7tmbq5JJtJGYahd2ys
         fjPcZ7tg2Qt6L8i5rm+6MHzDV6C/dTzFj1gB3cyYEdTsYaFZ547haa7OJrqk1pOvCHOy
         z8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767006271; x=1767611071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FEchA6+yuO+kdA1fAAObKTJMPxKw1rQkSoXSh2GsmCc=;
        b=Vx1jrUPrpWm0SFMH+nTpHwGVC7vjpd0bXZlVrWu/zKYa1c38S9REmL2P9etEAnyPxr
         0hFpOS5FFYkmztOJ5jvm6sDpI43xtieU1UfceFgmsKt3f+ntsWAy+5Wv+MZHP5QZi84j
         lEOvLiC9SMe5v5+4zoQc2t49bGBwLI0YnUdsRxIPr7TiYSYu8F8j8aUHmXx/l9xwmRNa
         aIOfTyhVpNxp69FP1jeHqY8CDAbZodyXjIosGg8Yz1Z86hNTPsivdKJKLFR+Nb1E2V3G
         +z0hjqF+PnPwaBFlrYUO7uwg8AKH0BgDKb5tHay6JG0lia0mMQTmvIASPknhY8+swnNu
         0MHg==
X-Forwarded-Encrypted: i=1; AJvYcCWoWDNikTEfe0NH/YHT2etXCsJQsA7j+Z9ykZHVKRZyAI20F567k66dJ/XlMf7j6Y494NaWh+c0WQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwXZuyIBrx8FPFKplRZ+ZOFTbNdMzFdxKDWjwN0rJNrHLrctMaB
	jQqaLxH+Adqvxak6fNiQGC85nDQ720H9IET/v6fmsQbpz/e7oybAQUQVH41+Rf32Vzo=
X-Gm-Gg: AY/fxX4U/bvs0FZDfttTfpoHFKo9mUwt/FKZ5ZggAUfprIyIZb8coUB6HcBXpDYBJC1
	QJEQCJuw0zaC4xhbLuzDvFZLYHSY6KxQR2iMwpiYm5lfK6ygigeTfnoZKCZHJzcY4I4GyVnhtdm
	Tn3y9cJ0Ar3iW3BqQSPArgmfqnb6AvwSBXN+BziSMCE8F+VJviVq3K6bSlSMLSMVnpzc14bajAv
	R/LHfnp5LjHTfggCBPfE+5WkLVoUpH3sOzt43/p9dHJNLaaqE8hPWFXDucK2nvvYwdBj8GJs1Sa
	ITzn9UkwyfrdZs5+Rtrt7QAW6fa236UwNas/a3GVVtmFJo00LCqqRStxdv64wzXPUrqGIjJcA74
	QXFFph21CmhDwBTB36S8mFx7smwvWkZLQMHH6WTi+qkNTOTUKN+e9UZjPEeHdwZpPzTU6fjsEsX
	0Ds0utObYeyHV/6VCOqQrcKP667OpsNYI=
X-Google-Smtp-Source: AGHT+IG+X7Jh45hMS45vuXV+LzF95YhwtkbWh7ogDoRvta1kMuklJmRbDKeKGBsUcHz79+uRYhu/Iw==
X-Received: by 2002:a05:6a00:1d19:b0:7e8:4471:ae6a with SMTP id d2e1a72fcca58-7ff679667e9mr27477515b3a.54.1767006271046;
        Mon, 29 Dec 2025 03:04:31 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40d7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7aa32916sm29338817b3a.8.2025.12.29.03.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 03:04:30 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 29 Dec 2025 19:04:04 +0800
Subject: [PATCH 1/4] dt-bindings: reset: spacemit: Add K3 reset IDs
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-k3-reset-v1-1-eda0747bded3@riscstar.com>
References: <20251229-k3-reset-v1-0-eda0747bded3@riscstar.com>
In-Reply-To: <20251229-k3-reset-v1-0-eda0747bded3@riscstar.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3

Add reset IDs for SpacemiT K3 SoC.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 include/dt-bindings/reset/spacemit,k3-resets.h | 171 +++++++++++++++++++++++++
 1 file changed, 171 insertions(+)

diff --git a/include/dt-bindings/reset/spacemit,k3-resets.h b/include/dt-bindings/reset/spacemit,k3-resets.h
new file mode 100644
index 000000000000..79ac1c22b7b5
--- /dev/null
+++ b/include/dt-bindings/reset/spacemit,k3-resets.h
@@ -0,0 +1,171 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2025 SpacemiT Technology Co. Ltd
+ */
+
+#ifndef _DT_BINDINGS_RESET_SPACEMIT_K3_RESETS_H_
+#define _DT_BINDINGS_RESET_SPACEMIT_K3_RESETS_H_
+
+/* MPMU resets */
+#define RESET_MPMU_WDT           0
+#define RESET_MPMU_RIPC          1
+
+/* APBC resets */
+#define RESET_APBC_UART0         0
+#define RESET_APBC_UART2         1
+#define RESET_APBC_UART3         2
+#define RESET_APBC_UART4         3
+#define RESET_APBC_UART5         4
+#define RESET_APBC_UART6         5
+#define RESET_APBC_UART7         6
+#define RESET_APBC_UART8         7
+#define RESET_APBC_UART9         8
+#define RESET_APBC_UART10        9
+#define RESET_APBC_GPIO          10
+#define RESET_APBC_PWM0          11
+#define RESET_APBC_PWM1          12
+#define RESET_APBC_PWM2          13
+#define RESET_APBC_PWM3          14
+#define RESET_APBC_PWM4          15
+#define RESET_APBC_PWM5          16
+#define RESET_APBC_PWM6          17
+#define RESET_APBC_PWM7          18
+#define RESET_APBC_PWM8          19
+#define RESET_APBC_PWM9          20
+#define RESET_APBC_PWM10         21
+#define RESET_APBC_PWM11         22
+#define RESET_APBC_PWM12         23
+#define RESET_APBC_PWM13         24
+#define RESET_APBC_PWM14         25
+#define RESET_APBC_PWM15         26
+#define RESET_APBC_PWM16         27
+#define RESET_APBC_PWM17         28
+#define RESET_APBC_PWM18         29
+#define RESET_APBC_PWM19         30
+#define RESET_APBC_SPI0          31
+#define RESET_APBC_SPI1          32
+#define RESET_APBC_SPI3          33
+#define RESET_APBC_RTC           34
+#define RESET_APBC_TWSI0         35
+#define RESET_APBC_TWSI1         36
+#define RESET_APBC_TWSI2         37
+#define RESET_APBC_TWSI4         38
+#define RESET_APBC_TWSI5         39
+#define RESET_APBC_TWSI6         40
+#define RESET_APBC_TWSI8         41
+#define RESET_APBC_TIMERS0       42
+#define RESET_APBC_TIMERS1       43
+#define RESET_APBC_TIMERS2       44
+#define RESET_APBC_TIMERS3       45
+#define RESET_APBC_TIMERS4       46
+#define RESET_APBC_TIMERS5       47
+#define RESET_APBC_TIMERS6       48
+#define RESET_APBC_TIMERS7       49
+#define RESET_APBC_AIB           50
+#define RESET_APBC_ONEWIRE       51
+#define RESET_APBC_I2S0          52
+#define RESET_APBC_I2S1          53
+#define RESET_APBC_I2S2          54
+#define RESET_APBC_I2S3          55
+#define RESET_APBC_I2S4          56
+#define RESET_APBC_I2S5          57
+#define RESET_APBC_DRO           58
+#define RESET_APBC_IR0           59
+#define RESET_APBC_IR1           60
+#define RESET_APBC_TSEN          61
+#define RESET_IPC_AP2AUD         62
+#define RESET_APBC_CAN0          63
+#define RESET_APBC_CAN1          64
+#define RESET_APBC_CAN2          65
+#define RESET_APBC_CAN3          66
+#define RESET_APBC_CAN4          67
+
+/* APMU resets */
+#define RESET_APMU_CSI           0
+#define RESET_APMU_CCIC2PHY      1
+#define RESET_APMU_CCIC3PHY      2
+#define RESET_APMU_ISP_CIBUS     3
+#define RESET_APMU_DSI_ESC       4
+#define RESET_APMU_LCD           5
+#define RESET_APMU_V2D           6
+#define RESET_APMU_LCD_MCLK      7
+#define RESET_APMU_LCD_DSCCLK    8
+#define RESET_APMU_SC2_HCLK      9
+#define RESET_APMU_CCIC_4X       10
+#define RESET_APMU_CCIC1_PHY     11
+#define RESET_APMU_SDH_AXI       12
+#define RESET_APMU_SDH0          13
+#define RESET_APMU_SDH1          14
+#define RESET_APMU_SDH2          15
+#define RESET_APMU_USB2          16
+#define RESET_APMU_USB3_PORTA    17
+#define RESET_APMU_USB3_PORTB    18
+#define RESET_APMU_USB3_PORTC    19
+#define RESET_APMU_USB3_PORTD    20
+#define RESET_APMU_QSPI          21
+#define RESET_APMU_QSPI_BUS      22
+#define RESET_APMU_DMA           23
+#define RESET_APMU_AES_WTM       24
+#define RESET_APMU_MCB_DCLK      25
+#define RESET_APMU_MCB_ACLK      26
+#define RESET_APMU_VPU           27
+#define RESET_APMU_DTC           28
+#define RESET_APMU_GPU           29
+#define RESET_APMU_ALZO          30
+#define RESET_APMU_MC            31
+#define RESET_APMU_CPU0_POP      32
+#define RESET_APMU_CPU0_SW       33
+#define RESET_APMU_CPU1_POP      34
+#define RESET_APMU_CPU1_SW       35
+#define RESET_APMU_CPU2_POP      36
+#define RESET_APMU_CPU2_SW       37
+#define RESET_APMU_CPU3_POP      38
+#define RESET_APMU_CPU3_SW       39
+#define RESET_APMU_C0_MPSUB_SW   40
+#define RESET_APMU_CPU4_POP      41
+#define RESET_APMU_CPU4_SW       42
+#define RESET_APMU_CPU5_POP      43
+#define RESET_APMU_CPU5_SW       44
+#define RESET_APMU_CPU6_POP      45
+#define RESET_APMU_CPU6_SW       46
+#define RESET_APMU_CPU7_POP      47
+#define RESET_APMU_CPU7_SW       48
+#define RESET_APMU_C1_MPSUB_SW   49
+#define RESET_APMU_MPSUB_DBG     50
+#define RESET_APMU_UCIE          51
+#define RESET_APMU_RCPU          52
+#define RESET_APMU_DSI4LN2_ESCCLK     53
+#define RESET_APMU_DSI4LN2_LCD_SW     54
+#define RESET_APMU_DSI4LN2_LCD_MCLK   55
+#define RESET_APMU_DSI4LN2_LCD_DSCCLK 56
+#define RESET_APMU_DSI4LN2_DPU_ACLK   57
+#define RESET_APMU_DPU_ACLK      58
+#define RESET_APMU_UFS_ACLK      59
+#define RESET_APMU_EDP0          60
+#define RESET_APMU_EDP1          61
+#define RESET_APMU_PCIE_PORTA    62
+#define RESET_APMU_PCIE_PORTB    63
+#define RESET_APMU_PCIE_PORTC    64
+#define RESET_APMU_PCIE_PORTD    65
+#define RESET_APMU_PCIE_PORTE    66
+#define RESET_APMU_EMAC0         67
+#define RESET_APMU_EMAC1         68
+#define RESET_APMU_EMAC2         69
+#define RESET_APMU_ESPI_MCLK     70
+#define RESET_APMU_ESPI_SCLK     71
+
+/* DCIU resets*/
+#define RESET_DCIU_HDMA          0
+#define RESET_DCIU_DMA350        1
+#define RESET_DCIU_DMA350_0      2
+#define RESET_DCIU_DMA350_1      3
+#define RESET_DCIU_AXIDMA0       4
+#define RESET_DCIU_AXIDMA1       5
+#define RESET_DCIU_AXIDMA2       6
+#define RESET_DCIU_AXIDMA3       7
+#define RESET_DCIU_AXIDMA4       8
+#define RESET_DCIU_AXIDMA5       9
+#define RESET_DCIU_AXIDMA6       10
+#define RESET_DCIU_AXIDMA7       11
+
+#endif /* _DT_BINDINGS_RESET_SPACEMIT_K3_H_ */

-- 
2.43.0

