Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FC741C2E2
	for <spacemit@lists.linux.dev>; Tue, 20 Jan 2026 11:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768907481; cv=none; b=VJ3L8UhXp4QfpnOwLHpd8P2TyLhplVBDWfcIKBPQJvt8IekfTPpQnDGYvgDl5qVGsfv62I3VCsPjL+82IRMqmx4J6m6B6+PqgBjYacnhlEFspTcTuaj42mc+C+AblaNl7yaFqvzEfsx5eVgJqO9/qBKgkiT2OaUC+MDkyz3LDQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768907481; c=relaxed/simple;
	bh=dfwYfXDU7fRvePV7n6sSb6fLGHYkCvkdHHCR07GvgC4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rISLaH91NEjrjoqGB/Umis4rKDVwNW8mPsxWiBGz+qdhhWFNhfbqorN2kwOQKwR22Guk3pOdKI/j5aUgEyKpX/r7wmmSNI2rs1Xx4t7vEZ3VON0JKd6UbQVOp2SxDBgLA8zSyufPH/s/PW6DIF/ynL20V18+CIaA0fKGrydBXyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=xngB/YZC; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="xngB/YZC"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-81e9d0cd082so4078250b3a.0
        for <spacemit@lists.linux.dev>; Tue, 20 Jan 2026 03:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768907479; x=1769512279; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JaBSZVkVDpyEFk0K6mei2gWdyNIGdA1b2fG0c+mMO1c=;
        b=xngB/YZCipIiNWs2cv3uL0V/Amxq96R2S7c7qUu7gJQNMGrw6KLSljZA4FdJmig1we
         AgTrwU/oKdvhMRR9wJMh3TLRaLiechof/vsR6QQP7LRTBwEaLNtGekslCnTa4rkX6D0r
         RJVlWyf59fylJi983FJMs2xr7AjIOiq9endkb9Rj+Mv2qDByNg2Xp5ahUnfvsKWp8z+A
         SyyTaqnlzZJJW098jSJGI1vKGmXcgxL8julvN/VyCXdrfeAR38q+9QXV+/96UBwg3gJN
         uX5+q3nFePuNGHchNt5kRUEE4wygMlL8oz+3idJvx3O7sUHrlJZJTJLTMJmsN6yY0RdU
         DucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768907479; x=1769512279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JaBSZVkVDpyEFk0K6mei2gWdyNIGdA1b2fG0c+mMO1c=;
        b=Qf3A+WFsMXoFBLe7tmYK/7Gm79Kp+6vEQ9wOT32A5zoZAdEp0wmqhnlXsd/KPOKnaV
         htI9/GUJZ2i0awdfl4MmXSONqrMJLNMYndOf7wzcnq2TkLUB6HNCQWYiN+AJZzyT7mJT
         eU8GoCfyKIR4R7vsIrCHsUlsRQt/MjfWeCa4eBWHM4DXlDaLINqYjWAvSn8NhHsWg5SV
         TYSr3ry/Gi9A8Hx8LB6P6YL4E60WUn1ytCgTNCtUUUg9Mxu6TjUujDAQ4AIvDHl7T/t+
         Ycvw+RYQNo5eSqnaYt6mgUhM+3WQGVK/HeYHnOAd4qKEtZlIUqimxUh3UUFNTWGPIlSz
         oa6g==
X-Forwarded-Encrypted: i=1; AJvYcCVntHnZqoZgCxJHV4EWYpV/xYoVCzsfEcOxqrJrVctm3Yj3I77Lbvcc6on56mjy+Sjftq5dMCDBWA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxfCc4eGajfv3uRC1ShExqOaZV3c5O1XbelJN2/0VxzgP2zguri
	XnlINhHpD3Jyk6ABg3I+pZQIRP4BULDDsG7tRlSbANvgaAtmeE2Q/E4KkWiwtUTTXA0=
X-Gm-Gg: AY/fxX5Je+ohBvsC3XE86tRFIxg+sfK0f2gXnCtUCWR9wsjr1GxNFmGnAK4UyXpB1F/
	gJOl+Xp8numKMW2fjXQIyf1FMkZm7ubZ7/Ty/HO9Lnks0iQrQTktDUAii+bYt9HzbeEAFqUna1D
	78gGkjBVHUgWIUz/9Ki98f2oE67jmhcw1PooENljmUBldnVEt2TgEfPC3it8j0FVyAMTirTDUFO
	UMCQ63Bb/tSWKgwlnFplUwp0ciQHbLg8kX+RWpzhv74yaycYx2TpLY+slEtSAjBQLYNCUH0VzQ6
	IU0AobNhiz1ybzGSNipIOYe4aQP0wnzsgNhSQ5aUpscxipXaGgqUOESjoYL8E7hLiT6/tgf2rki
	+iIjiiiY7xU89Pi0NkpBnXC5Bmf6sZXRYzYQ7PDjB5dg3HEXMlVqlf/mCW+Tyr4zytLIgJVZ1/O
	ZkbIX8w2eqWlboorYKVK6OEonIuJXIpm7YZIAY2iXOOQ==
X-Received: by 2002:a05:6a00:3a25:b0:81f:4063:f1e4 with SMTP id d2e1a72fcca58-81fa184efc7mr11353743b3a.56.1768907479280;
        Tue, 20 Jan 2026 03:11:19 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4015])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa10efc6bsm11398349b3a.29.2026.01.20.03.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:11:18 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 20 Jan 2026 19:10:50 +0800
Subject: [PATCH v3 2/4] reset: Create subdirectory for SpacemiT drivers
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-k3-reset-v3-2-effe87f4bdbe@riscstar.com>
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

Create a dedicated subdirectory for SpacemiT reset drivers to allow
for better organization as support for more SoCs is added.

Move the existing K1 reset driver into this new directory and rename
it to reset-spacemit-k1.c.

Rename the Kconfig symbol to RESET_SPACEMIT_K1 and update its default
from ARCH_SPACEMIT to SPACEMIT_K1_CCU. The reset driver depends on the
clock driver to register reset devices as an auxiliary device, so the
default should reflect this dependency.

Also sort the drivers/reset/Kconfig entries alphabetically.

Reviewed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: Add Alex's reviewed-by.
    Remove the trailing empty newline in Makefile to keep constant style
     with others in the reset folder.
v2: No change.
---
 drivers/reset/Kconfig                                      | 12 ++----------
 drivers/reset/Makefile                                     |  2 +-
 drivers/reset/spacemit/Kconfig                             | 14 ++++++++++++++
 drivers/reset/spacemit/Makefile                            |  2 ++
 .../{reset-spacemit.c => spacemit/reset-spacemit-k1.c}     |  0
 5 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 6e5d6deffa7d..b110f0fa7bb1 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -299,15 +299,6 @@ config RESET_SOCFPGA
 	  This enables the reset driver for the SoCFPGA ARMv7 platforms. This
 	  driver gets initialized early during platform init calls.
 
-config RESET_SPACEMIT
-	tristate "SpacemiT reset driver"
-	depends on ARCH_SPACEMIT || COMPILE_TEST
-	select AUXILIARY_BUS
-	default ARCH_SPACEMIT
-	help
-	  This enables the reset controller driver for SpacemiT SoCs,
-	  including the K1.
-
 config RESET_SUNPLUS
 	bool "Sunplus SoCs Reset Driver" if COMPILE_TEST
 	default ARCH_SUNPLUS
@@ -406,9 +397,10 @@ config RESET_ZYNQMP
 	  This enables the reset controller driver for Xilinx ZynqMP SoCs.
 
 source "drivers/reset/amlogic/Kconfig"
+source "drivers/reset/hisilicon/Kconfig"
+source "drivers/reset/spacemit/Kconfig"
 source "drivers/reset/starfive/Kconfig"
 source "drivers/reset/sti/Kconfig"
-source "drivers/reset/hisilicon/Kconfig"
 source "drivers/reset/tegra/Kconfig"
 
 endif
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 9c3e484dfd81..fc0cc99f8514 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -2,6 +2,7 @@
 obj-y += core.o
 obj-y += amlogic/
 obj-y += hisilicon/
+obj-y += spacemit/
 obj-y += starfive/
 obj-y += sti/
 obj-y += tegra/
@@ -38,7 +39,6 @@ obj-$(CONFIG_RESET_RZV2H_USB2PHY) += reset-rzv2h-usb2phy.o
 obj-$(CONFIG_RESET_SCMI) += reset-scmi.o
 obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
 obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
-obj-$(CONFIG_RESET_SPACEMIT) += reset-spacemit.o
 obj-$(CONFIG_RESET_SUNPLUS) += reset-sunplus.o
 obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
 obj-$(CONFIG_RESET_TH1520) += reset-th1520.o
diff --git a/drivers/reset/spacemit/Kconfig b/drivers/reset/spacemit/Kconfig
new file mode 100644
index 000000000000..552884e8b72a
--- /dev/null
+++ b/drivers/reset/spacemit/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config RESET_SPACEMIT_K1
+	tristate "SpacemiT K1 reset driver"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	depends on SPACEMIT_K1_CCU
+	select AUXILIARY_BUS
+	default SPACEMIT_K1_CCU
+	help
+	  Support for reset controller in SpacemiT K1 SoC.
+	  This driver works with the SpacemiT K1 clock controller
+	  unit (CCU) driver to provide reset control functionality
+	  for various peripherals and subsystems in the SoC.
+
diff --git a/drivers/reset/spacemit/Makefile b/drivers/reset/spacemit/Makefile
new file mode 100644
index 000000000000..34e3350136bb
--- /dev/null
+++ b/drivers/reset/spacemit/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_RESET_SPACEMIT_K1)		+= reset-spacemit-k1.o
diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/spacemit/reset-spacemit-k1.c
similarity index 100%
rename from drivers/reset/reset-spacemit.c
rename to drivers/reset/spacemit/reset-spacemit-k1.c

-- 
2.43.0

