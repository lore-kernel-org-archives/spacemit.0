Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5CF1A9B24
	for <spacemit@lists.linux.dev>; Mon, 23 Feb 2026 06:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771828976; cv=none; b=pBH6dQ39PEL3j2LPLueV4ALBWsY7tfeNXNErvKwk+z24Td6mXK6ca6alrre0cG1qcGhuMhvG+yaCD0ETK4K+HMzHpUmIcHgt8QkxHhZNcdAp3F4Y+bETQO0ZQQX1EqOc1RNQlRAKfL42uK1WLKDtUL3qJZhzqT+5yPJ0xZ4a8Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771828976; c=relaxed/simple;
	bh=8gdOvcIbpSurhYkSmKuW57zxvLN42VVLT9xF2NcaQJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D9di2dJy+PSAaZVenRKyUuBCcYAtd90kgdxfFyoGrxrMjmYPwGmUL9F7CLZTxoMqKewP80gU0uIbno1yayP/+sov7+BtkWSQha8q+C5nRbYEuP95UgVn1+3nRQ1GiNZMG9rhfAmDtxWWD7OywxCh4MUr65zyhizOo/m4uveq2mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TI1xS5T9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TI1xS5T9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0029DC116C6;
	Mon, 23 Feb 2026 06:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771828976;
	bh=8gdOvcIbpSurhYkSmKuW57zxvLN42VVLT9xF2NcaQJ4=;
	h=From:To:Cc:Subject:Date:From;
	b=TI1xS5T9t7n0bBF6Vpe+xMIkf87Uk6AxnG5fhBG5UVrujlzbzZlTSY9ffz5tThJ26
	 9mXPXyuKE3Tj+a0DFrdt168bPT0W6t05a0rnpIGCjv+QTdYqYbQ6uvYpAaUcQ+ya/F
	 ZsZ1aE2lQiufC4crgccll5Jk1XoUupNItjS9yN1YxW9p39CNDSph+lquS3rCBcFtnv
	 scsL89DF797Jlbz57jB/jkGEZjljj9qfGHlRlJ46Mqxvkhkv6R6dHzJ1eZGmsTTR/Y
	 nXfEWxQA31bsrsjRdTKHu4gNoCoZjeTfeoaOjnYWU9VBcHOHGiUykFuOKG2QaMWe1d
	 7u+BnQr5rF51w==
From: Vinod Koul <vkoul@kernel.org>
To: linux-phy@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Alex Elder <elder@riscstar.com>,
	Ze Huang <huang.ze@linux.dev>,
	spacemit@lists.linux.dev
Subject: [PATCH] phy: move spacemit pcie driver to its subfolder
Date: Mon, 23 Feb 2026 12:12:39 +0530
Message-ID: <20260223064240.386617-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit fe4bc1a08638 ("phy: spacemit: support K1 USB2.0 PHY controller")
created spacemit subfolder with usb driver while commit 57e920b92724
("phy: spacemit: Introduce PCIe/combo PHY") added pcie driver in phy
folder. Move latter into spacemit subfolder and rename file to
phy-k1-pcie.c

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/phy/Kconfig                                  | 12 ------------
 drivers/phy/Makefile                                 |  1 -
 drivers/phy/spacemit/Kconfig                         | 12 ++++++++++++
 drivers/phy/spacemit/Makefile                        |  1 +
 .../phy-k1-pcie.c}                                   |  0
 5 files changed, 13 insertions(+), 13 deletions(-)
 rename drivers/phy/{phy-spacemit-k1-pcie.c => spacemit/phy-k1-pcie.c} (100%)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 02467dfd4fb0..c0574e44f0a3 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -134,18 +134,6 @@ config PHY_NXP_PTN3222
 	  schemes. It supports all three USB 2.0 data rates: Low Speed, Full
 	  Speed and High Speed.
 
-config PHY_SPACEMIT_K1_PCIE
-	tristate "PCIe and combo PHY driver for the SpacemiT K1 SoC"
-	depends on ARCH_SPACEMIT || COMPILE_TEST
-	depends on COMMON_CLK
-	depends on HAS_IOMEM
-	depends on OF
-	select GENERIC_PHY
-	default ARCH_SPACEMIT
-	help
-	  Enable support for the PCIe and USB 3 combo PHY and two
-	  PCIe-only PHYs used in the SpacemiT K1 SoC.
-
 source "drivers/phy/allwinner/Kconfig"
 source "drivers/phy/amlogic/Kconfig"
 source "drivers/phy/apple/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index a648c2e02a83..2773d596e543 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -16,7 +16,6 @@ obj-$(CONFIG_PHY_SNPS_EUSB2)		+= phy-snps-eusb2.o
 obj-$(CONFIG_USB_LGM_PHY)		+= phy-lgm-usb.o
 obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
 obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
-obj-$(CONFIG_PHY_SPACEMIT_K1_PCIE)	+= phy-spacemit-k1-pcie.o
 obj-$(CONFIG_GENERIC_PHY)		+= allwinner/	\
 					   amlogic/	\
 					   apple/	\
diff --git a/drivers/phy/spacemit/Kconfig b/drivers/phy/spacemit/Kconfig
index 0136aee2e8a2..50b0005acf66 100644
--- a/drivers/phy/spacemit/Kconfig
+++ b/drivers/phy/spacemit/Kconfig
@@ -2,6 +2,18 @@
 #
 # Phy drivers for SpacemiT platforms
 #
+config PHY_SPACEMIT_K1_PCIE
+	tristate "PCIe and combo PHY driver for the SpacemiT K1 SoC"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	depends on COMMON_CLK
+	depends on HAS_IOMEM
+	depends on OF
+	select GENERIC_PHY
+	default ARCH_SPACEMIT
+	help
+	  Enable support for the PCIe and USB 3 combo PHY and two
+	  PCIe-only PHYs used in the SpacemiT K1 SoC.
+
 config PHY_SPACEMIT_K1_USB2
 	tristate "SpacemiT K1 USB 2.0 PHY support"
 	depends on (ARCH_SPACEMIT || COMPILE_TEST) && OF
diff --git a/drivers/phy/spacemit/Makefile b/drivers/phy/spacemit/Makefile
index fec0b425a948..a821a21d6142 100644
--- a/drivers/phy/spacemit/Makefile
+++ b/drivers/phy/spacemit/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_PHY_SPACEMIT_K1_PCIE)		+= phy-k1-pcie.o
 obj-$(CONFIG_PHY_SPACEMIT_K1_USB2)		+= phy-k1-usb2.o
diff --git a/drivers/phy/phy-spacemit-k1-pcie.c b/drivers/phy/spacemit/phy-k1-pcie.c
similarity index 100%
rename from drivers/phy/phy-spacemit-k1-pcie.c
rename to drivers/phy/spacemit/phy-k1-pcie.c
-- 
2.43.0

