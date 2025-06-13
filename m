Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287241DACA7
	for <spacemit@lists.linux.dev>; Fri, 13 Jun 2025 01:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749777111; cv=none; b=ACPS/85qG48n5wu/cSu/wdFPsdn2+yN+pWvnn+QhMFVyghic2TO0jkqtFD3AGwU80GT8moFQsaxGY3+Ys/oFzzjJJnO8VVm39PnRlNuFkTdkvegICm8akzUe8tP+da5LN49nmLr7W2QzAV0fK9GhgAvTZCymuIouH/Bay5Lz/Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749777111; c=relaxed/simple;
	bh=EyJalHu7AkVtbvuCmvKRErn0E8ZxTM787Cwkb6tY49w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SZ6GgnCVluYL1vC8YavEOmMdWLDgAjO6rxz3AtmzJRa8/D8x0ZUooS4mQk5sIj91KRv8ucFFh4TZLDQ1jHu5U52h0pwaYzEa76JkdEZhKmu6kpDcLvvyjF+1HzfRkCY6QCh1Nyo5vsXxsLiW6Ebs15gKAutHaGTTsn9cmTkc6N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=hhHMxYig; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="hhHMxYig"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2e95ab2704fso983487fac.3
        for <spacemit@lists.linux.dev>; Thu, 12 Jun 2025 18:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749777108; x=1750381908; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c92oi6wzBpfVhe8UTxXqXdvpyX/nmNAc/4aVrJYivQM=;
        b=hhHMxYigebr87FKS/359NPru9qeOIW9VO5+FOPkDA6LA+HyrXaK2btP5twTBJMYaxq
         Xl/ntZOGn0ce30AOV3iRa07IdmDq6N5H1ggv4xb3ZyM8H+8R4DvUwuMkKjI46dBhMrum
         BN8R65QjDdus/U53zEw75wuXp+YitPuJhLYmAHhfejdhehY9R/2cZizlmtvap2jdePp5
         mKCrGVs57dHJLlFs5H82Hs0yM1c7jlIw3jXvbOF1fB4xHd+u84rNnYXtgbdkdcG1M7Mb
         koJ0xUZjHj2t3ZS+dqEQZ9bQBcFVu8RFELH3umbxc4HlWBkAempLofHvq/Bz6KYY6OlP
         NTkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749777108; x=1750381908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c92oi6wzBpfVhe8UTxXqXdvpyX/nmNAc/4aVrJYivQM=;
        b=YUoRe02CuDIrdP0kcXqZbASxKgtV5Cwp4DtcYw0HZTBz83+A32afwEtOU+pBO2HCGC
         wW9/iyGR6oyyvWfXPsB9d3tR4KfBcaOzJeHLOdiLS1dConYmzzM40C7ch/GVkAMYgz43
         8UnS8gYVK83SCApYSxz08GkOvM1mI+jqVRJbm556fmkLyZYQJzGHvkPHSuXagknAdHOz
         RfWQyQXoOUK1jH2N5RV4wC8hZFq4pGcvZ6MDQQS575gywwvUqqXSOgUu8KM54hpaY6Al
         lKVrf05wRef8lXrsSrqB6KvdT07PYW0t7JqerF8yC0C3MIb5UgGkf0FRopmjqax8PxCM
         ydLA==
X-Forwarded-Encrypted: i=1; AJvYcCVaoR2EaCFacftY729ow7fBYlfpCLM0j0obKpKDHqJlo/kn994TKDNEw+GZcnooH5bIKz/p0FyslA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxDr+kDL1sROfgzJeHmPBOQgQB//9IRaV4B/Yxw9pbxy9GH8o2x
	sglQcpenq1S4NVRePzt76gOYexP1uiQoFDiy2EgQf6/M1XILFgNhdhhCNX9AKTiwKnw=
X-Gm-Gg: ASbGncvBJ4k1ha7PLUtSgNh3e+Kilq7BqfziIcETsX5NGgyu7hbZWQrLQOr0rkRgz6I
	HvML+AGVMxmCTTtAK6TD0zWrymZcgAXMx56I/OKr7vQlPeh62FfEyu78YmllIaDK7Bz+60v8pKH
	ElP2UlRnjoyi9kIuSTWdW6/m4zDX0/1PNJdBOigE9Xn3xe47Zyt/fSS2GkiD7sjvYwJLlVJlSp2
	+WAVBKbkESZK+mXWx0d/4IrX5KBh2sVjRRd4iPK4UHH4ONbCCE22dLfv6ho3XAVZ16S8lOl/B6G
	Umv3WJ/iAhZy4RdOU5E6B/cgYHQIeotDmwjyDdBA5i0RqKidKevFT1tiWeMIlL8Hpyq4ViXNDpq
	AOH0s5R/ObCpOzmyCWOeWbzF2itbPH18=
X-Google-Smtp-Source: AGHT+IFOJhcfiWDcoITS5COfz8xHZNMK14V6FcA0k83kipkTAme/09XoKYxmA6ZLDbjI+rd5E6o3Og==
X-Received: by 2002:a05:6871:4103:b0:2e9:7e3:933f with SMTP id 586e51a60fabf-2ead4f2b3d2mr748207fac.3.1749777108388;
        Thu, 12 Jun 2025 18:11:48 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eac0c17211sm407685fac.18.2025.06.12.18.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 18:11:47 -0700 (PDT)
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
Subject: [PATCH v11 2/6] soc: spacemit: create a header for clock/reset registers
Date: Thu, 12 Jun 2025 20:11:34 -0500
Message-ID: <20250613011139.1201702-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250613011139.1201702-1-elder@riscstar.com>
References: <20250613011139.1201702-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the definitions of register offsets and fields used by the SpacemiT
K1 SoC CCUs into a separate header file, so that they can be shared by
the reset driver that will be found under drivers/reset.

Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Haylen Chu <heylenay@4d2.org>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/clk/spacemit/ccu-k1.c    | 111 +----------------------------
 include/soc/spacemit/k1-syscon.h | 118 +++++++++++++++++++++++++++++++
 2 files changed, 119 insertions(+), 110 deletions(-)
 create mode 100644 include/soc/spacemit/k1-syscon.h

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index cdde37a052353..801150f4ff0f5 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -11,6 +11,7 @@
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <soc/spacemit/k1-syscon.h>
 
 #include "ccu_common.h"
 #include "ccu_pll.h"
@@ -19,116 +20,6 @@
 
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
 
-/* APBS register offset */
-#define APBS_PLL1_SWCR1			0x100
-#define APBS_PLL1_SWCR2			0x104
-#define APBS_PLL1_SWCR3			0x108
-#define APBS_PLL2_SWCR1			0x118
-#define APBS_PLL2_SWCR2			0x11c
-#define APBS_PLL2_SWCR3			0x120
-#define APBS_PLL3_SWCR1			0x124
-#define APBS_PLL3_SWCR2			0x128
-#define APBS_PLL3_SWCR3			0x12c
-
-/* MPMU register offset */
-#define MPMU_POSR			0x0010
-#define  POSR_PLL1_LOCK			BIT(27)
-#define  POSR_PLL2_LOCK			BIT(28)
-#define  POSR_PLL3_LOCK			BIT(29)
-#define MPMU_SUCCR			0x0014
-#define MPMU_ISCCR			0x0044
-#define MPMU_WDTPCR			0x0200
-#define MPMU_RIPCCR			0x0210
-#define MPMU_ACGR			0x1024
-#define MPMU_APBCSCR			0x1050
-#define MPMU_SUCCR_1			0x10b0
-
-/* APBC register offset */
-#define APBC_UART1_CLK_RST		0x00
-#define APBC_UART2_CLK_RST		0x04
-#define APBC_GPIO_CLK_RST		0x08
-#define APBC_PWM0_CLK_RST		0x0c
-#define APBC_PWM1_CLK_RST		0x10
-#define APBC_PWM2_CLK_RST		0x14
-#define APBC_PWM3_CLK_RST		0x18
-#define APBC_TWSI8_CLK_RST		0x20
-#define APBC_UART3_CLK_RST		0x24
-#define APBC_RTC_CLK_RST		0x28
-#define APBC_TWSI0_CLK_RST		0x2c
-#define APBC_TWSI1_CLK_RST		0x30
-#define APBC_TIMERS1_CLK_RST		0x34
-#define APBC_TWSI2_CLK_RST		0x38
-#define APBC_AIB_CLK_RST		0x3c
-#define APBC_TWSI4_CLK_RST		0x40
-#define APBC_TIMERS2_CLK_RST		0x44
-#define APBC_ONEWIRE_CLK_RST		0x48
-#define APBC_TWSI5_CLK_RST		0x4c
-#define APBC_DRO_CLK_RST		0x58
-#define APBC_IR_CLK_RST			0x5c
-#define APBC_TWSI6_CLK_RST		0x60
-#define APBC_COUNTER_CLK_SEL		0x64
-#define APBC_TWSI7_CLK_RST		0x68
-#define APBC_TSEN_CLK_RST		0x6c
-#define APBC_UART4_CLK_RST		0x70
-#define APBC_UART5_CLK_RST		0x74
-#define APBC_UART6_CLK_RST		0x78
-#define APBC_SSP3_CLK_RST		0x7c
-#define APBC_SSPA0_CLK_RST		0x80
-#define APBC_SSPA1_CLK_RST		0x84
-#define APBC_IPC_AP2AUD_CLK_RST		0x90
-#define APBC_UART7_CLK_RST		0x94
-#define APBC_UART8_CLK_RST		0x98
-#define APBC_UART9_CLK_RST		0x9c
-#define APBC_CAN0_CLK_RST		0xa0
-#define APBC_PWM4_CLK_RST		0xa8
-#define APBC_PWM5_CLK_RST		0xac
-#define APBC_PWM6_CLK_RST		0xb0
-#define APBC_PWM7_CLK_RST		0xb4
-#define APBC_PWM8_CLK_RST		0xb8
-#define APBC_PWM9_CLK_RST		0xbc
-#define APBC_PWM10_CLK_RST		0xc0
-#define APBC_PWM11_CLK_RST		0xc4
-#define APBC_PWM12_CLK_RST		0xc8
-#define APBC_PWM13_CLK_RST		0xcc
-#define APBC_PWM14_CLK_RST		0xd0
-#define APBC_PWM15_CLK_RST		0xd4
-#define APBC_PWM16_CLK_RST		0xd8
-#define APBC_PWM17_CLK_RST		0xdc
-#define APBC_PWM18_CLK_RST		0xe0
-#define APBC_PWM19_CLK_RST		0xe4
-
-/* APMU register offset */
-#define APMU_JPG_CLK_RES_CTRL		0x020
-#define APMU_CSI_CCIC2_CLK_RES_CTRL	0x024
-#define APMU_ISP_CLK_RES_CTRL		0x038
-#define APMU_LCD_CLK_RES_CTRL1		0x044
-#define APMU_LCD_SPI_CLK_RES_CTRL	0x048
-#define APMU_LCD_CLK_RES_CTRL2		0x04c
-#define APMU_CCIC_CLK_RES_CTRL		0x050
-#define APMU_SDH0_CLK_RES_CTRL		0x054
-#define APMU_SDH1_CLK_RES_CTRL		0x058
-#define APMU_USB_CLK_RES_CTRL		0x05c
-#define APMU_QSPI_CLK_RES_CTRL		0x060
-#define APMU_DMA_CLK_RES_CTRL		0x064
-#define APMU_AES_CLK_RES_CTRL		0x068
-#define APMU_VPU_CLK_RES_CTRL		0x0a4
-#define APMU_GPU_CLK_RES_CTRL		0x0cc
-#define APMU_SDH2_CLK_RES_CTRL		0x0e0
-#define APMU_PMUA_MC_CTRL		0x0e8
-#define APMU_PMU_CC2_AP			0x100
-#define APMU_PMUA_EM_CLK_RES_CTRL	0x104
-#define APMU_AUDIO_CLK_RES_CTRL		0x14c
-#define APMU_HDMI_CLK_RES_CTRL		0x1b8
-#define APMU_CCI550_CLK_CTRL		0x300
-#define APMU_ACLK_CLK_CTRL		0x388
-#define APMU_CPU_C0_CLK_CTRL		0x38C
-#define APMU_CPU_C1_CLK_CTRL		0x390
-#define APMU_PCIE_CLK_RES_CTRL_0	0x3cc
-#define APMU_PCIE_CLK_RES_CTRL_1	0x3d4
-#define APMU_PCIE_CLK_RES_CTRL_2	0x3dc
-#define APMU_EMAC0_CLK_RES_CTRL		0x3e4
-#define APMU_EMAC1_CLK_RES_CTRL		0x3ec
-
 struct spacemit_ccu_data {
 	struct clk_hw **hws;
 	size_t num;
diff --git a/include/soc/spacemit/k1-syscon.h b/include/soc/spacemit/k1-syscon.h
new file mode 100644
index 0000000000000..039a448c51a07
--- /dev/null
+++ b/include/soc/spacemit/k1-syscon.h
@@ -0,0 +1,118 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/* SpacemiT clock and reset driver definitions for the K1 SoC */
+
+#ifndef __SOC_K1_SYSCON_H__
+#define __SOC_K1_SYSCON_H__
+
+/* APBS register offset */
+#define APBS_PLL1_SWCR1			0x100
+#define APBS_PLL1_SWCR2			0x104
+#define APBS_PLL1_SWCR3			0x108
+#define APBS_PLL2_SWCR1			0x118
+#define APBS_PLL2_SWCR2			0x11c
+#define APBS_PLL2_SWCR3			0x120
+#define APBS_PLL3_SWCR1			0x124
+#define APBS_PLL3_SWCR2			0x128
+#define APBS_PLL3_SWCR3			0x12c
+
+/* MPMU register offset */
+#define MPMU_POSR			0x0010
+#define  POSR_PLL1_LOCK			BIT(27)
+#define  POSR_PLL2_LOCK			BIT(28)
+#define  POSR_PLL3_LOCK			BIT(29)
+#define MPMU_SUCCR			0x0014
+#define MPMU_ISCCR			0x0044
+#define MPMU_WDTPCR			0x0200
+#define MPMU_RIPCCR			0x0210
+#define MPMU_ACGR			0x1024
+#define MPMU_APBCSCR			0x1050
+#define MPMU_SUCCR_1			0x10b0
+
+/* APBC register offset */
+#define APBC_UART1_CLK_RST		0x00
+#define APBC_UART2_CLK_RST		0x04
+#define APBC_GPIO_CLK_RST		0x08
+#define APBC_PWM0_CLK_RST		0x0c
+#define APBC_PWM1_CLK_RST		0x10
+#define APBC_PWM2_CLK_RST		0x14
+#define APBC_PWM3_CLK_RST		0x18
+#define APBC_TWSI8_CLK_RST		0x20
+#define APBC_UART3_CLK_RST		0x24
+#define APBC_RTC_CLK_RST		0x28
+#define APBC_TWSI0_CLK_RST		0x2c
+#define APBC_TWSI1_CLK_RST		0x30
+#define APBC_TIMERS1_CLK_RST		0x34
+#define APBC_TWSI2_CLK_RST		0x38
+#define APBC_AIB_CLK_RST		0x3c
+#define APBC_TWSI4_CLK_RST		0x40
+#define APBC_TIMERS2_CLK_RST		0x44
+#define APBC_ONEWIRE_CLK_RST		0x48
+#define APBC_TWSI5_CLK_RST		0x4c
+#define APBC_DRO_CLK_RST		0x58
+#define APBC_IR_CLK_RST			0x5c
+#define APBC_TWSI6_CLK_RST		0x60
+#define APBC_COUNTER_CLK_SEL		0x64
+#define APBC_TWSI7_CLK_RST		0x68
+#define APBC_TSEN_CLK_RST		0x6c
+#define APBC_UART4_CLK_RST		0x70
+#define APBC_UART5_CLK_RST		0x74
+#define APBC_UART6_CLK_RST		0x78
+#define APBC_SSP3_CLK_RST		0x7c
+#define APBC_SSPA0_CLK_RST		0x80
+#define APBC_SSPA1_CLK_RST		0x84
+#define APBC_IPC_AP2AUD_CLK_RST		0x90
+#define APBC_UART7_CLK_RST		0x94
+#define APBC_UART8_CLK_RST		0x98
+#define APBC_UART9_CLK_RST		0x9c
+#define APBC_CAN0_CLK_RST		0xa0
+#define APBC_PWM4_CLK_RST		0xa8
+#define APBC_PWM5_CLK_RST		0xac
+#define APBC_PWM6_CLK_RST		0xb0
+#define APBC_PWM7_CLK_RST		0xb4
+#define APBC_PWM8_CLK_RST		0xb8
+#define APBC_PWM9_CLK_RST		0xbc
+#define APBC_PWM10_CLK_RST		0xc0
+#define APBC_PWM11_CLK_RST		0xc4
+#define APBC_PWM12_CLK_RST		0xc8
+#define APBC_PWM13_CLK_RST		0xcc
+#define APBC_PWM14_CLK_RST		0xd0
+#define APBC_PWM15_CLK_RST		0xd4
+#define APBC_PWM16_CLK_RST		0xd8
+#define APBC_PWM17_CLK_RST		0xdc
+#define APBC_PWM18_CLK_RST		0xe0
+#define APBC_PWM19_CLK_RST		0xe4
+
+/* APMU register offset */
+#define APMU_JPG_CLK_RES_CTRL		0x020
+#define APMU_CSI_CCIC2_CLK_RES_CTRL	0x024
+#define APMU_ISP_CLK_RES_CTRL		0x038
+#define APMU_LCD_CLK_RES_CTRL1		0x044
+#define APMU_LCD_SPI_CLK_RES_CTRL	0x048
+#define APMU_LCD_CLK_RES_CTRL2		0x04c
+#define APMU_CCIC_CLK_RES_CTRL		0x050
+#define APMU_SDH0_CLK_RES_CTRL		0x054
+#define APMU_SDH1_CLK_RES_CTRL		0x058
+#define APMU_USB_CLK_RES_CTRL		0x05c
+#define APMU_QSPI_CLK_RES_CTRL		0x060
+#define APMU_DMA_CLK_RES_CTRL		0x064
+#define APMU_AES_CLK_RES_CTRL		0x068
+#define APMU_VPU_CLK_RES_CTRL		0x0a4
+#define APMU_GPU_CLK_RES_CTRL		0x0cc
+#define APMU_SDH2_CLK_RES_CTRL		0x0e0
+#define APMU_PMUA_MC_CTRL		0x0e8
+#define APMU_PMU_CC2_AP			0x100
+#define APMU_PMUA_EM_CLK_RES_CTRL	0x104
+#define APMU_AUDIO_CLK_RES_CTRL		0x14c
+#define APMU_HDMI_CLK_RES_CTRL		0x1b8
+#define APMU_CCI550_CLK_CTRL		0x300
+#define APMU_ACLK_CLK_CTRL		0x388
+#define APMU_CPU_C0_CLK_CTRL		0x38C
+#define APMU_CPU_C1_CLK_CTRL		0x390
+#define APMU_PCIE_CLK_RES_CTRL_0	0x3cc
+#define APMU_PCIE_CLK_RES_CTRL_1	0x3d4
+#define APMU_PCIE_CLK_RES_CTRL_2	0x3dc
+#define APMU_EMAC0_CLK_RES_CTRL		0x3e4
+#define APMU_EMAC1_CLK_RES_CTRL		0x3ec
+
+#endif /* __SOC_K1_SYSCON_H__ */
-- 
2.45.2

