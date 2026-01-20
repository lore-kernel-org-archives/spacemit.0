Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3BC41C314
	for <spacemit@lists.linux.dev>; Tue, 20 Jan 2026 11:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768907491; cv=none; b=iJ+A8v1DC04pzD1SqZJcQT2z1aKH1pbeUxdmIiQ5hkmn4PG6ECOBOZc+7x6q7X+irIlVWrJ51kbptMdrgCSv1zoAz5e0FwXz7SN71oMFqyBqcd4KfTecwksApK22yOpWVYHn+2mpc/FcyDciLT28w9Hz6+te5nM9SospGnskQhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768907491; c=relaxed/simple;
	bh=pNu+x3NIuxpCazkM/jyb976i0VdLsBHxeuYeSvf6FSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=okkZaiaUJ3N8c4NyN+RkmDV9Z6fkxsWsmSAwlFGzILVJiaRiTbmha4Qs9RHReB4zGNYlH7LNikcMIJbPGQ9aP7YQcW4tLjvKgPzaOgnC0yhKfvxs3g94LMmtcGZjACSxJ9+IJhvydEV4NYMbsR/s6gCk15v4wVLwQtb1aQjwy20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=0As9rSFw; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="0As9rSFw"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7b75e366866so1501656b3a.2
        for <spacemit@lists.linux.dev>; Tue, 20 Jan 2026 03:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768907489; x=1769512289; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H2u7+C+5TaYVz1w348LPvXASPFq8VdnXxg3pINuaxYA=;
        b=0As9rSFwEKLzLXrzvYf16nqN9dhnRh1sRF6A6ZTGDTBxju5b4ipXLlkCCU9rb9RGEx
         Xi2VTRItn5QMdG8cuQGVklo86S19orrffTbuSMegKrhFpaqqkrBww4UrjA0xV40YqjbO
         UhnPcPZ3O73LgV6Cz9ac1uIIJQlhPOHroCZ9DIZ68Cdza+ZmkmH+xE8U8UNLxpxR7W2F
         i1PumCZ4yuhFKS5crWHeAeP1dnMaeW3h915ZKBd52mtYtBjqRVKF/sNXToCWSK808Bf0
         szmlpZDXNrhDMf1qjz5acBuV3zEKUXNvdb9C4hHyxjYFxDgkYKc4+PThSKT3MwXCTMBj
         /1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768907489; x=1769512289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H2u7+C+5TaYVz1w348LPvXASPFq8VdnXxg3pINuaxYA=;
        b=hB41pTZNx0aRL1tvsNWrHaMNzW59BXxAKMvl8kx7oh/bYSsbb7K9ON3eCItWyvV2Ze
         tD1/I64PESlk2uv6dVAXiR9wK2Nc0JbszsZ9xucwnSvKorDWiwKZ+NqkVW489FaPDLGu
         Dy0B8EcxRTGqiKP1GFvuR1xIlEOmRTCKpOmoXPULl0sQcvRNvGJBuUuGxXrJgCvpkZAM
         ZxmjNaGWMgce1qOcA5eJlIZG3EiJ2tJ+nrpF+9lxQjzfSZmkeg3pj9oCySHUkiRfx8Hx
         VxRZ3VPJ/8HLRZohd8uWvHq4Ziqs9ODuzjX/BDXRYAKHEZp94h8Q5YW2Zk6M/yjTwy5F
         jcHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXagv9XG+Jr8MkrYF92eF7e6EkMX+DwtwoOSQJlAbVusseuyvul3L+eev+UUOP8AyJi51GC469mXg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxnRktSYh6h9kxXlHNDVsLWq7PoGjIO9XYwZn48C5xp/KlN3ZZo
	bel1F5pHhoCbD1BA0gHObxEuSz47vvbFKP7/KdCPHvvlc0rqpvipOGPATkMjg5QmMcfmGA7aw0O
	Deszmcbnatg==
X-Gm-Gg: AZuq6aJR4mwR91it1pkI/ARXmkRA2M/FziPUD2N2Sy82BDMYVb1dt8WE/8pzsgF+cZy
	38fUEvEexV7iPQCIWzpFvoRHTWH/ibWWGIg+Kp0BStUy8bEPa+B3T2k3Gshh3NyGbXHiVAU17LC
	VfBTVHaBsQRf2KeDm0iqOrLfO8/Q2Lxt9rLxFHiqsHVmllQen0xz2Gb0a8JrZ+HcyI388Erb8hb
	/qnkrQny5/onwUYR3nc6rSQKDMIMu3VKTjX4WYwnn2gjWJ8OODr4D5ItUd+TE5mE0LckAROO8Eu
	5AUy/k+WOGsg2bdSJ+fs2WTXtVx6YVBtQEiQEv/Y4F81681iPFO76n9UX9AStEdGKZmlz2lCiYL
	t9HJM1u7metOSnbfkTTGJsEqijvQf+r01baS+BjXIRincZtqZQ2Mfwd2s5gnQX50mv5PSxl/srn
	66XwmglQQBzZJpMu/xYfC3wODPP9hIOvQ=
X-Received: by 2002:a05:6a00:3a16:b0:81f:852b:a93a with SMTP id d2e1a72fcca58-81fe87c82f4mr1329644b3a.2.1768907489246;
        Tue, 20 Jan 2026 03:11:29 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4015])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa10efc6bsm11398349b3a.29.2026.01.20.03.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:11:28 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 20 Jan 2026 19:10:52 +0800
Subject: [PATCH v3 4/4] reset: spacemit: Add SpacemiT K3 reset driver
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-k3-reset-v3-4-effe87f4bdbe@riscstar.com>
References: <20260120-k3-reset-v3-0-effe87f4bdbe@riscstar.com>
In-Reply-To: <20260120-k3-reset-v3-0-effe87f4bdbe@riscstar.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Haylen Chu <heylenay@4d2.org>
Cc: Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3

Add support for the SpacemiT K3 SoC reset controller. The K3 reset
driver reuses the common reset controller code and provides K3-specific
reset data for devices managed by the following units:

 - MPMU (Main Power Management Unit)
 - APBC (APB clock unit)
 - APMU (Application Subsystem Power Management Unit)
 - DCIU (DMA Control and Interface Unit)

Acked-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: Add acked-by from Alex.
v2: No change.
---
 drivers/reset/spacemit/Kconfig             |  11 ++
 drivers/reset/spacemit/Makefile            |   1 +
 drivers/reset/spacemit/reset-spacemit-k3.c | 233 +++++++++++++++++++++++++++++
 3 files changed, 245 insertions(+)

diff --git a/drivers/reset/spacemit/Kconfig b/drivers/reset/spacemit/Kconfig
index 56a4858b30e1..545d6b41c6ca 100644
--- a/drivers/reset/spacemit/Kconfig
+++ b/drivers/reset/spacemit/Kconfig
@@ -22,4 +22,15 @@ config RESET_SPACEMIT_K1
 	  unit (CCU) driver to provide reset control functionality
 	  for various peripherals and subsystems in the SoC.
 
+config RESET_SPACEMIT_K3
+	tristate "Support for SpacemiT K3 SoC"
+	depends on SPACEMIT_K3_CCU
+	select RESET_SPACEMIT_COMMON
+	default SPACEMIT_K3_CCU
+	help
+	  Support for reset controller in SpacemiT K3 SoC.
+	  This driver works with the SpacemiT K3 clock controller
+	  unit (CCU) driver to provide reset control functionality
+	  for various peripherals and subsystems in the SoC.
+
 endmenu
diff --git a/drivers/reset/spacemit/Makefile b/drivers/reset/spacemit/Makefile
index 0b056e8661ec..00669132c6ac 100644
--- a/drivers/reset/spacemit/Makefile
+++ b/drivers/reset/spacemit/Makefile
@@ -2,3 +2,4 @@
 obj-$(CONFIG_RESET_SPACEMIT_COMMON)	+= reset-spacemit-common.o
 
 obj-$(CONFIG_RESET_SPACEMIT_K1)		+= reset-spacemit-k1.o
+obj-$(CONFIG_RESET_SPACEMIT_K3)		+= reset-spacemit-k3.o
diff --git a/drivers/reset/spacemit/reset-spacemit-k3.c b/drivers/reset/spacemit/reset-spacemit-k3.c
new file mode 100644
index 000000000000..e9e32e4c1ba5
--- /dev/null
+++ b/drivers/reset/spacemit/reset-spacemit-k3.c
@@ -0,0 +1,233 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/* SpacemiT K3 reset controller driver */
+
+#include <linux/module.h>
+
+#include <dt-bindings/reset/spacemit,k3-resets.h>
+#include <soc/spacemit/k3-syscon.h>
+
+#include "reset-spacemit-common.h"
+
+static const struct ccu_reset_data k3_mpmu_resets[] = {
+	[RESET_MPMU_WDT]	= RESET_DATA(MPMU_WDTPCR,	BIT(2), 0),
+	[RESET_MPMU_RIPC]	= RESET_DATA(MPMU_RIPCCR,	BIT(2), 0),
+};
+
+static const struct ccu_reset_controller_data k3_mpmu_reset_data = {
+	.reset_data	= k3_mpmu_resets,
+	.count		= ARRAY_SIZE(k3_mpmu_resets),
+};
+
+static const struct ccu_reset_data k3_apbc_resets[] = {
+	[RESET_APBC_UART0]	= RESET_DATA(APBC_UART0_CLK_RST,	BIT(2),	0),
+	[RESET_APBC_UART2]	= RESET_DATA(APBC_UART2_CLK_RST,	BIT(2),	0),
+	[RESET_APBC_UART3]	= RESET_DATA(APBC_UART3_CLK_RST,	BIT(2),	0),
+	[RESET_APBC_UART4]	= RESET_DATA(APBC_UART4_CLK_RST,	BIT(2),	0),
+	[RESET_APBC_UART5]	= RESET_DATA(APBC_UART5_CLK_RST,	BIT(2),	0),
+	[RESET_APBC_UART6]	= RESET_DATA(APBC_UART6_CLK_RST,	BIT(2),	0),
+	[RESET_APBC_UART7]	= RESET_DATA(APBC_UART7_CLK_RST,	BIT(2),	0),
+	[RESET_APBC_UART8]	= RESET_DATA(APBC_UART8_CLK_RST,	BIT(2),	0),
+	[RESET_APBC_UART9]	= RESET_DATA(APBC_UART9_CLK_RST,	BIT(2),	0),
+	[RESET_APBC_UART10]	= RESET_DATA(APBC_UART10_CLK_RST,	BIT(2),	0),
+	[RESET_APBC_GPIO]	= RESET_DATA(APBC_GPIO_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_PWM0]	= RESET_DATA(APBC_PWM0_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_PWM1]	= RESET_DATA(APBC_PWM1_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_PWM2]	= RESET_DATA(APBC_PWM2_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_PWM3]	= RESET_DATA(APBC_PWM3_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_PWM4]	= RESET_DATA(APBC_PWM4_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_PWM5]	= RESET_DATA(APBC_PWM5_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_PWM6]	= RESET_DATA(APBC_PWM6_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_PWM7]	= RESET_DATA(APBC_PWM7_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_PWM8]	= RESET_DATA(APBC_PWM8_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_PWM9]	= RESET_DATA(APBC_PWM9_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_PWM10]	= RESET_DATA(APBC_PWM10_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_PWM11]	= RESET_DATA(APBC_PWM11_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_PWM12]	= RESET_DATA(APBC_PWM12_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_PWM13]	= RESET_DATA(APBC_PWM13_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_PWM14]	= RESET_DATA(APBC_PWM14_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_PWM15]	= RESET_DATA(APBC_PWM15_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_PWM16]	= RESET_DATA(APBC_PWM16_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_PWM17]	= RESET_DATA(APBC_PWM17_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_PWM18]	= RESET_DATA(APBC_PWM18_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_PWM19]	= RESET_DATA(APBC_PWM19_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_SPI0]	= RESET_DATA(APBC_SSP0_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_SPI1]	= RESET_DATA(APBC_SSP1_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_SPI3]	= RESET_DATA(APBC_SSP3_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_RTC]	= RESET_DATA(APBC_RTC_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_TWSI0]	= RESET_DATA(APBC_TWSI0_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_TWSI1]	= RESET_DATA(APBC_TWSI1_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_TWSI2]	= RESET_DATA(APBC_TWSI2_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_TWSI4]	= RESET_DATA(APBC_TWSI4_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_TWSI5]	= RESET_DATA(APBC_TWSI5_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_TWSI6]	= RESET_DATA(APBC_TWSI6_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_TWSI8]	= RESET_DATA(APBC_TWSI8_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_TIMERS0]	= RESET_DATA(APBC_TIMERS0_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_TIMERS1]	= RESET_DATA(APBC_TIMERS1_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_TIMERS2]	= RESET_DATA(APBC_TIMERS2_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_TIMERS3]	= RESET_DATA(APBC_TIMERS3_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_TIMERS4]	= RESET_DATA(APBC_TIMERS4_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_TIMERS5]	= RESET_DATA(APBC_TIMERS5_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_TIMERS6]	= RESET_DATA(APBC_TIMERS6_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_TIMERS7]	= RESET_DATA(APBC_TIMERS7_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_AIB]	= RESET_DATA(APBC_AIB_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_ONEWIRE]	= RESET_DATA(APBC_ONEWIRE_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_I2S0]	= RESET_DATA(APBC_SSPA0_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_I2S1]	= RESET_DATA(APBC_SSPA1_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_I2S2]	= RESET_DATA(APBC_SSPA2_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_I2S3]	= RESET_DATA(APBC_SSPA3_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_I2S4]	= RESET_DATA(APBC_SSPA4_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_I2S5]	= RESET_DATA(APBC_SSPA5_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_DRO]	= RESET_DATA(APBC_DRO_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_IR0]	= RESET_DATA(APBC_IR0_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_IR1]	= RESET_DATA(APBC_IR1_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_TSEN]	= RESET_DATA(APBC_TSEN_CLK_RST,		BIT(2), 0),
+	[RESET_IPC_AP2AUD]	= RESET_DATA(APBC_IPC_AP2AUD_CLK_RST,	BIT(2), 0),
+	[RESET_APBC_CAN0]	= RESET_DATA(APBC_CAN0_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_CAN1]	= RESET_DATA(APBC_CAN1_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_CAN2]	= RESET_DATA(APBC_CAN2_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_CAN3]	= RESET_DATA(APBC_CAN3_CLK_RST,		BIT(2), 0),
+	[RESET_APBC_CAN4]	= RESET_DATA(APBC_CAN4_CLK_RST,		BIT(2), 0),
+};
+
+static const struct ccu_reset_controller_data k3_apbc_reset_data = {
+	.reset_data	= k3_apbc_resets,
+	.count		= ARRAY_SIZE(k3_apbc_resets),
+};
+
+static const struct ccu_reset_data k3_apmu_resets[] = {
+	[RESET_APMU_CSI]	= RESET_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_APMU_CCIC2PHY]	= RESET_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL,	0, BIT(2)),
+	[RESET_APMU_CCIC3PHY]	= RESET_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL,	0, BIT(29)),
+	[RESET_APMU_ISP_CIBUS]	= RESET_DATA(APMU_ISP_CLK_RES_CTRL,		0, BIT(16)),
+	[RESET_APMU_DSI_ESC]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(3)),
+	[RESET_APMU_LCD]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(4)),
+	[RESET_APMU_V2D]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(27)),
+	[RESET_APMU_LCD_MCLK]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL2,	0, BIT(9)),
+	[RESET_APMU_LCD_DSCCLK]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL2,	0, BIT(15)),
+	[RESET_APMU_SC2_HCLK]	= RESET_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_APMU_CCIC_4X]	= RESET_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_APMU_CCIC1_PHY]	= RESET_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(2)),
+	[RESET_APMU_SDH_AXI]	= RESET_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_APMU_SDH0]	= RESET_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_APMU_SDH1]	= RESET_DATA(APMU_SDH1_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_APMU_SDH2]	= RESET_DATA(APMU_SDH2_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_APMU_USB2]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
+				BIT(1)|BIT(2)|BIT(3)),
+	[RESET_APMU_USB3_PORTA]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
+				BIT(5)|BIT(6)|BIT(7)),
+	[RESET_APMU_USB3_PORTB]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
+				BIT(9)|BIT(10)|BIT(11)),
+	[RESET_APMU_USB3_PORTC]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
+				BIT(13)|BIT(14)|BIT(15)),
+	[RESET_APMU_USB3_PORTD]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
+				BIT(17)|BIT(18)|BIT(19)),
+	[RESET_APMU_QSPI]	= RESET_DATA(APMU_QSPI_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_APMU_QSPI_BUS]	= RESET_DATA(APMU_QSPI_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_APMU_DMA]	= RESET_DATA(APMU_DMA_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_APMU_AES_WTM]	= RESET_DATA(APMU_AES_CLK_RES_CTRL,	0, BIT(4)),
+	[RESET_APMU_MCB_DCLK]	= RESET_DATA(APMU_MCB_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_APMU_MCB_ACLK]	= RESET_DATA(APMU_MCB_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_APMU_VPU]	= RESET_DATA(APMU_VPU_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_APMU_DTC]	= RESET_DATA(APMU_DTC_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_APMU_GPU]	= RESET_DATA(APMU_GPU_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_APMU_MC]		= RESET_DATA(APMU_PMUA_MC_CTRL,		0, BIT(0)),
+	[RESET_APMU_CPU0_POP]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(0), 0),
+	[RESET_APMU_CPU0_SW]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(1), 0),
+	[RESET_APMU_CPU1_POP]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(3), 0),
+	[RESET_APMU_CPU1_SW]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(4), 0),
+	[RESET_APMU_CPU2_POP]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(6), 0),
+	[RESET_APMU_CPU2_SW]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(7), 0),
+	[RESET_APMU_CPU3_POP]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(9), 0),
+	[RESET_APMU_CPU3_SW]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(10), 0),
+	[RESET_APMU_C0_MPSUB_SW]	= RESET_DATA(APMU_PMU_CC2_AP,	BIT(12), 0),
+	[RESET_APMU_CPU4_POP]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(16), 0),
+	[RESET_APMU_CPU4_SW]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(17), 0),
+	[RESET_APMU_CPU5_POP]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(19), 0),
+	[RESET_APMU_CPU5_SW]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(20), 0),
+	[RESET_APMU_CPU6_POP]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(22), 0),
+	[RESET_APMU_CPU6_SW]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(23), 0),
+	[RESET_APMU_CPU7_POP]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(25), 0),
+	[RESET_APMU_CPU7_SW]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(26), 0),
+	[RESET_APMU_C1_MPSUB_SW]	= RESET_DATA(APMU_PMU_CC2_AP,	BIT(28), 0),
+	[RESET_APMU_MPSUB_DBG]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(29), 0),
+	[RESET_APMU_UCIE]	= RESET_DATA(APMU_UCIE_CTRL,
+				BIT(1) | BIT(2) | BIT(3), 0),
+	[RESET_APMU_RCPU]	= RESET_DATA(APMU_RCPU_CLK_RES_CTRL,	0,
+				BIT(3) | BIT(2) | BIT(0)),
+	[RESET_APMU_DSI4LN2_ESCCLK]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL3,	0, BIT(3)),
+	[RESET_APMU_DSI4LN2_LCD_SW]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL3,	0, BIT(4)),
+	[RESET_APMU_DSI4LN2_LCD_MCLK]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL4,	0, BIT(9)),
+	[RESET_APMU_DSI4LN2_LCD_DSCCLK]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL4,	0, BIT(15)),
+	[RESET_APMU_DSI4LN2_DPU_ACLK]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL5,	0, BIT(0)),
+	[RESET_APMU_DPU_ACLK]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL5,	0, BIT(15)),
+	[RESET_APMU_UFS_ACLK]	= RESET_DATA(APMU_UFS_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_APMU_EDP0]	= RESET_DATA(APMU_LCD_EDP_CTRL,		0, BIT(0)),
+	[RESET_APMU_EDP1]	= RESET_DATA(APMU_LCD_EDP_CTRL,		0, BIT(16)),
+	[RESET_APMU_PCIE_PORTA]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_A,	0,
+				BIT(5) | BIT(4) | BIT(3)),
+	[RESET_APMU_PCIE_PORTB]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_B,	0,
+				BIT(5) | BIT(4) | BIT(3)),
+	[RESET_APMU_PCIE_PORTC]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_C,	0,
+				BIT(5) | BIT(4) | BIT(3)),
+	[RESET_APMU_PCIE_PORTD]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_D,	0,
+				BIT(5) | BIT(4) | BIT(3)),
+	[RESET_APMU_PCIE_PORTE]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_E,	0,
+				BIT(5) | BIT(4) | BIT(3)),
+	[RESET_APMU_EMAC0]	= RESET_DATA(APMU_EMAC0_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_APMU_EMAC1]	= RESET_DATA(APMU_EMAC1_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_APMU_EMAC2]	= RESET_DATA(APMU_EMAC2_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_APMU_ESPI_MCLK]	= RESET_DATA(APMU_ESPI_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_APMU_ESPI_SCLK]	= RESET_DATA(APMU_ESPI_CLK_RES_CTRL,	0, BIT(2)),
+};
+
+static const struct ccu_reset_controller_data k3_apmu_reset_data = {
+	.reset_data	= k3_apmu_resets,
+	.count		= ARRAY_SIZE(k3_apmu_resets),
+};
+
+static const struct ccu_reset_data k3_dciu_resets[] = {
+	[RESET_DCIU_HDMA]	= RESET_DATA(DCIU_DMASYS_RSTN,		0, BIT(0)),
+	[RESET_DCIU_DMA350]	= RESET_DATA(DCIU_DMASYS_SDMA_RSTN,	0, BIT(0)),
+	[RESET_DCIU_DMA350_0]	= RESET_DATA(DCIU_DMASYS_S0_RSTN,	0, BIT(0)),
+	[RESET_DCIU_DMA350_1]	= RESET_DATA(DCIU_DMASYS_S1_RSTN,	0, BIT(0)),
+	[RESET_DCIU_AXIDMA0]	= RESET_DATA(DCIU_DMASYS_A0_RSTN,	0, BIT(0)),
+	[RESET_DCIU_AXIDMA1]	= RESET_DATA(DCIU_DMASYS_A1_RSTN,	0, BIT(0)),
+	[RESET_DCIU_AXIDMA2]	= RESET_DATA(DCIU_DMASYS_A2_RSTN,	0, BIT(0)),
+	[RESET_DCIU_AXIDMA3]	= RESET_DATA(DCIU_DMASYS_A3_RSTN,	0, BIT(0)),
+	[RESET_DCIU_AXIDMA4]	= RESET_DATA(DCIU_DMASYS_A4_RSTN,	0, BIT(0)),
+	[RESET_DCIU_AXIDMA5]	= RESET_DATA(DCIU_DMASYS_A5_RSTN,	0, BIT(0)),
+	[RESET_DCIU_AXIDMA6]	= RESET_DATA(DCIU_DMASYS_A6_RSTN,	0, BIT(0)),
+	[RESET_DCIU_AXIDMA7]	= RESET_DATA(DCIU_DMASYS_A7_RSTN,	0, BIT(0)),
+};
+
+static const struct ccu_reset_controller_data k3_dciu_reset_data = {
+	.reset_data	= k3_dciu_resets,
+	.count		= ARRAY_SIZE(k3_dciu_resets),
+};
+
+#define K3_AUX_DEV_ID(_unit) \
+	{ \
+		.name = "spacemit_ccu.k3-" #_unit "-reset", \
+		.driver_data = (kernel_ulong_t)&k3_ ## _unit ## _reset_data, \
+	}
+
+static const struct auxiliary_device_id spacemit_k3_reset_ids[] = {
+	K3_AUX_DEV_ID(mpmu),
+	K3_AUX_DEV_ID(apbc),
+	K3_AUX_DEV_ID(apmu),
+	K3_AUX_DEV_ID(dciu),
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, spacemit_k3_reset_ids);
+
+static struct auxiliary_driver spacemit_k3_reset_driver = {
+	.probe          = spacemit_reset_probe,
+	.id_table       = spacemit_k3_reset_ids,
+};
+module_auxiliary_driver(spacemit_k3_reset_driver);
+
+MODULE_IMPORT_NS("RESET_SPACEMIT");
+MODULE_AUTHOR("Guodong Xu <guodong@riscstar.com>");
+MODULE_DESCRIPTION("SpacemiT K3 reset controller driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0

