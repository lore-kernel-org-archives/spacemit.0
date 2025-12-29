Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91B7298CDC
	for <spacemit@lists.linux.dev>; Mon, 29 Dec 2025 11:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767006278; cv=none; b=T4K913US8GtMrKUO6ERP0wZRBvWNV/8ETgRarxxj3JIlbDyQHG7KmZGV38nhKP1zP07dOmnveva8SejrprUiZeerTD8UMIXz9ZSk7Cir2Wv+POdHznZvZUInKnalaldJ1MKgUtzwNW2WhYVb8I8425TBGaLDsR8YmokJVwDfKRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767006278; c=relaxed/simple;
	bh=VGGGcRCIUVxzkWMETn6PNZUzkC3pAjQmUfW65HhgBts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iIUokKncUCRkeVlx6tcICD15Gk6x5Sak/wcc8c53lSszar9EZl+s6J9XdlklE7QC3dBClPNLbMoQ70rcIgX62sIYF5sJLBnuU7gvRqjSplxs/OX9vTNhR1/Ww/PBT8/kGPbEAB3eT7gAQRrMx0jRmoE01oREBrSy9gZq35bKCpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ubuSd5nO; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ubuSd5nO"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b852bb31d9so10511770b3a.0
        for <spacemit@lists.linux.dev>; Mon, 29 Dec 2025 03:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767006275; x=1767611075; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KAntNEpArzSlcAAGRMjvdDnMb9wpchgIKOFTgm4WfoE=;
        b=ubuSd5nO1Yay11XJm9speb3WuYZ4lSAWS/rKPU1BcR8WA0tZ9vCqDSjjlKKjgtaQtH
         kTHTEKrUBMKt62OMj4BSnF2Zj0e1WdUQtJIi88R1NNyyWRoAoKz/bvrcqfxi9tCnvNYY
         yQUcflYDHRW1cpt0Jl20mhyqL96cRiDncCYxDxGhHuN0e2cD4PTCJWftNA4qWF/ZTwS4
         FO2S3tgq5iWSfrj3/S14W0Cfl8WwXU5ZylW63y3CYPrhhj0YZjIrVUozay+SPV2ogT8w
         TNFCLZ0TYRuYQOV9BJvdnQ+OhmSNkrjGXGUt8ME8Bb3/j+0p7t7WAjZSdnSmWb/vBWTm
         OP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767006275; x=1767611075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KAntNEpArzSlcAAGRMjvdDnMb9wpchgIKOFTgm4WfoE=;
        b=sLd5Qd6ednErZ1F93Mb6Qk6woNpfrAg++sCb4Il1mxXEBdxYv12r99fyS7pdYAuqjz
         0SxpTd1b7PtDIpo9oMnoOIYkz+QTvKnhCFDluJOSy82mwcziG6439MrOVENEzDY/peM5
         1PKa0gMH0sgx6bNfXD/OddhLFrRdU90pLpOko0UGt3adNncSDXQW7RwGRx3HXWfMeZLw
         w6l9L5bZ9ppfXSRyZF6+b4ikbxcnoj0VAZSDU6ySZr3RHXITasSPJ2aUvgw+gQKrEXIQ
         Rvm7zXPqTwYMWxyVG9Y4a9Tx6LYKfxYkJxoR0oh4P2VoCyiZ/ouv7kGyitHVMYt1nxM0
         GNvg==
X-Forwarded-Encrypted: i=1; AJvYcCWP2RICURgJLO5QCI9I5aSBP73L47EmK6lJJgA1zBZH/2Gzcu8XGZwToXusiLtQ/ouebHv99KigBg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywtdoc+/YKIUlACy8lKzScaxN5qp7hzke0LUrgyMpfxTF0URT41
	XBHmEiFuLUb2DvO/VydSqPqHDZjg3apsmR7u4f0Fo2Xf52wCZ7kXFa1GXYxxMSFHlI7zupgEMvI
	7qWt+rNc=
X-Gm-Gg: AY/fxX7TV6rgSSTjRuu30tIrkTyRGtPey5bFChlKElHkXRQdw6J0U/fW2RicRVOxBpe
	4WFSEu9snNbE2WYvu63Ixy+xkgLaEO3NNcVzS03h8oQzknK2Vnw2798Yjscp+tt2YadcUbcvn2a
	OfkuwgU34onPCMrf7r8pROmKRiHX41P06tewQXSc6VrPHjjHpyrarD0DCPglVp72HSOJ/4oFVSK
	v8p9bTf5xXD5bd6wnjExx+AXeynqYBB3O4gZ3OgWW4HECA/V+k3+L5Umgmh74dZQ8BZn0+y7G95
	sBFxeHY3wJ4qXDjEBGfZLt8jUJhaBU/Zm5drlhJBb3ZdUZnwbw3sbbOd3hoDTh0wtFs3k0efEZV
	KR+n/MKsLSaMTKmcY67lDTT5Y+T8msShIkM7r7dEM/3pfl5x35GuG1WzX72AqOZoIPGFARTWZ58
	LIBEj1St5Zdal54GcISG6pXi97MkME5zih0suHVB4nRQ==
X-Google-Smtp-Source: AGHT+IGxV3R1g7dAVVcT92rBapwrsIWptN0T742A8OO1aZUzgYn9fWWWA5QnwUnP9SD8OJK+En90Hw==
X-Received: by 2002:a05:6a00:e17:b0:7a2:84f3:cefc with SMTP id d2e1a72fcca58-7ff61b8e615mr28076555b3a.0.1767006274915;
        Mon, 29 Dec 2025 03:04:34 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40d7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7aa32916sm29338817b3a.8.2025.12.29.03.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 03:04:34 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 29 Dec 2025 19:04:05 +0800
Subject: [PATCH 2/4] reset: Create subdirectory for SpacemiT drivers
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-k3-reset-v1-2-eda0747bded3@riscstar.com>
References: <20251229-k3-reset-v1-0-eda0747bded3@riscstar.com>
In-Reply-To: <20251229-k3-reset-v1-0-eda0747bded3@riscstar.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>
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

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 drivers/reset/Kconfig                                      | 12 ++----------
 drivers/reset/Makefile                                     |  2 +-
 drivers/reset/spacemit/Kconfig                             | 14 ++++++++++++++
 drivers/reset/spacemit/Makefile                            |  3 +++
 .../{reset-spacemit.c => spacemit/reset-spacemit-k1.c}     |  0
 5 files changed, 20 insertions(+), 11 deletions(-)

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
index 000000000000..de7e358c74fd
--- /dev/null
+++ b/drivers/reset/spacemit/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_RESET_SPACEMIT_K1)		+= reset-spacemit-k1.o
+
diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/spacemit/reset-spacemit-k1.c
similarity index 100%
rename from drivers/reset/reset-spacemit.c
rename to drivers/reset/spacemit/reset-spacemit-k1.c

-- 
2.43.0

