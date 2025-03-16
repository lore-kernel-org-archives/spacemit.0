Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2238618FDC9
	for <spacemit@lists.linux.dev>; Sun, 16 Mar 2025 07:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742111182; cv=none; b=GJeKe1lPV2grpTZZKf6heHUa6JIWiomRIBf2ixr72va5xpSKHoC6JJAgK+rYHVSSbBOUKhiskRRptrGrfHM3J0s6yHRxyDOZd68uDQve2/upyEvALuZvCfdVG0+gv8mXEViP8VrQeIEinY9LJcjT8C1uyGQYKIzV7oiAy9FuBf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742111182; c=relaxed/simple;
	bh=nscFd8ETmrMQ6nltkW9oUgEeDIPX3GLcq/ema8Oq3C8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U6C5voUtyruRw3JVjUlTaj/n8fq0EZXj7M3TA7AKl2DL2cVNeONfJXWlQ9l/xc+pmGbB4qhGZ9Rq2itHfnFBtbBuupYUVot6+tr/zBQ8QjQhodDKh5oy5YQMsxn0uc0i5CzT6YJaZB8XM2aTlvWqGF/nx5K+HJKb5lzPE28pFhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMbXufWx; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMbXufWx"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-2ff784dc055so1401471a91.1
        for <spacemit@lists.linux.dev>; Sun, 16 Mar 2025 00:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742111178; x=1742715978; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qDvzeQDzc7Oo2AC9MBd6CwzICCccQ6V1K6IBMBbYhKU=;
        b=HMbXufWxZFFN34oHwPV6pUwCr6H3393sYoOA6jbSX+b2T/IZ0sshrrNjORjkLitVE5
         vekgjiAyqQP4te4DmClNwBoDCvWKaWZ2dx3JDPrzt0h7snmdXjeCBbwvnc9DgbOYisi6
         3n+QZvOZB9O2amacu4ivmaIV6jZoIY4bv24dF4CLlk9SQlkne9gXari9yb7hIIVUfG3W
         6s3lF6Iocc9rQs6JShSviEfrROgqRhZvKVvhDQ3zzs4JBTMs6TKEVQQF9qZ5c2wNdBtt
         3TAakGTiWIp7BErEBA6RHohclwCePZGDrH2e8vpDeM5Vcc1PZK/ht8McF60w53DVdvaH
         FeAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742111178; x=1742715978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qDvzeQDzc7Oo2AC9MBd6CwzICCccQ6V1K6IBMBbYhKU=;
        b=Aq85sbFzEXS4SXkoZygzPAiQ4lB2XiLHbx0VTOLJNFDFlLTMEwthWrilQAEakKQEi5
         vzgbv1y+//fdAL1qHPgiWZUClonM62jmN5N3lja/W6cCElBciRUTaRJJ6SOH5L0jfeDy
         S95cPbhwewOlogOwJ4jrWTf3dRSqAgNjt0E3sdX8j92U41+769C1lr49n/5GOnhqY+rf
         +IHrXAUzNfHMFbNYA90kd6nnedE2gu1PQMavzHvLXZom/9p422PQWHaPf3Fz3tIebAvU
         Bjy8biQMr9iNZQcAeTOHeQAC/tTyKCq4P/QpUpppQWoRulVe/Y84JcbmDEbxESer6QFT
         z5ag==
X-Forwarded-Encrypted: i=1; AJvYcCXj1beqeuzooAmmbba4Rp8OijQcSU9qFDB1gua+2vxEnyn6h5swB1uhiPNO3Ett+EoSOrizfzlSMw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz99eFnpHwvnFD7onW9m5j/ZuUDB3k6q3HQuJAlN5AqsQSRnjUB
	81N6KX3F4ovXyPICyV+6zicOMJGdysd1RjrtqbbWF+hIDx8Y44Bq
X-Gm-Gg: ASbGnculvsgrggPB/V8WtasNTou8m3EHzl8uOMdT9b641RK5sUtP6BlhXXIXHMJ2AzZ
	oCw4c+t+Fu/Pvz8C7nUaGLSRAC/sSpmBhBWyfnL5YwcihYiPp9rJIrHY75WsgaXUurlb2eCSlH0
	Kg8apWdvfPAdRgp+R0tIBEtW4vQPdNq/8/ZfONVie+aX8SLDj24glm6TEhr3m2nD9mGDsF5AEwm
	LLf6vW3afktSDjFZN5IhzwO1EwHYka65ivBv61tywaWBo/wdL3rwSXH6qS3XgFLRNp0ShEKixko
	CPhyey+pOfqwk5TnCvTLj3DiX94Y
X-Google-Smtp-Source: AGHT+IE92rd5jnYY++dgZyDGfUBEAFQL4O026qajJQ6O4MhfsgmULzwTvNf6vx6l8Jlb6G0SlltXGQ==
X-Received: by 2002:a05:6a20:9f0a:b0:1ee:e46d:58a2 with SMTP id adf61e73a8af0-1f5c11242f4mr11626687637.3.1742111178211;
        Sun, 16 Mar 2025 00:46:18 -0700 (PDT)
Received: from [127.0.1.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711694e56sm5575907b3a.130.2025.03.16.00.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 00:46:17 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Sun, 16 Mar 2025 15:43:22 +0800
Subject: [PATCH v7 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250316-k1-i2c-master-v7-2-f2d5c43e2f40@gmail.com>
References: <20250316-k1-i2c-master-v7-0-f2d5c43e2f40@gmail.com>
In-Reply-To: <20250316-k1-i2c-master-v7-0-f2d5c43e2f40@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, Alex Elder <elder@riscstar.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742111004; l=20723;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=nscFd8ETmrMQ6nltkW9oUgEeDIPX3GLcq/ema8Oq3C8=;
 b=DgvV+VTArlJP8t0RsbsWOFtCumf5PEJfJtJ87URPQPdXm4hedtcvUW+r+ENRBGnFTftqXgH+8
 XEbeOffmhyPAv//iTNi/u/vgGieBNgCR0HlixAzx3T4tP/hr6wGmCLT
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

This patch introduces basic I2C support for the SpacemiT K1 SoC,
utilizing interrupts for transfers.

The driver has been tested using i2c-tools on a Bananapi-F3 board,
and basic I2C read/write operations have been confirmed to work.

Reviewed-by: Alex Elder <elder@riscstar.com>
Link: https://lore.kernel.org/all/20250128-k1-maintainer-1-v1-1-e5dec4f379eb@gentoo.org [1]
Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
 drivers/i2c/busses/Kconfig  |  17 ++
 drivers/i2c/busses/Makefile |   1 +
 drivers/i2c/busses/i2c-k1.c | 605 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 623 insertions(+)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index fc438f4457713d5559d163840a7b11e8cdbb8f58..41dd05644c43a8630a6d53f70ec7fbf899d297b5 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -783,6 +783,23 @@ config I2C_JZ4780
 
 	 If you don't know what to do here, say N.
 
+config I2C_K1
+	tristate "SpacemiT K1 I2C adapter"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	depends on OF
+	help
+	  This option enables support for the I2C interface on the SpacemiT K1
+	  platform.
+
+	  If you enable this configuration, the kernel will include support for
+	  the I2C adapter specific to the SpacemiT K1 platform. This driver can
+	  be used to manage I2C bus transactions, which are necessary for
+	  interfacing with I2C peripherals such as sensors, EEPROMs, and other
+	  devices.
+
+	  This driver can also be built as a module.  If so, the
+	  module will be called `i2c-k1`.
+
 config I2C_KEBA
 	tristate "KEBA I2C controller support"
 	depends on HAS_IOMEM
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 1c2a4510abe44a689dfe67d2d64cf0cf3434f510..c1252e2b779e2e47492d66179b442f2202ec0416 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -74,6 +74,7 @@ obj-$(CONFIG_I2C_IMX)		+= i2c-imx.o
 obj-$(CONFIG_I2C_IMX_LPI2C)	+= i2c-imx-lpi2c.o
 obj-$(CONFIG_I2C_IOP3XX)	+= i2c-iop3xx.o
 obj-$(CONFIG_I2C_JZ4780)	+= i2c-jz4780.o
+obj-$(CONFIG_I2C_K1)		+= i2c-k1.o
 obj-$(CONFIG_I2C_KEBA)		+= i2c-keba.o
 obj-$(CONFIG_I2C_KEMPLD)	+= i2c-kempld.o
 obj-$(CONFIG_I2C_LPC2K)		+= i2c-lpc2k.o
diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
new file mode 100644
index 0000000000000000000000000000000000000000..ae43dcd31e8aa480766b44be91656657c7aaaf4a
--- /dev/null
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -0,0 +1,605 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024-2025 Troy Mitchell <troymitchell988@gmail.com>
+ */
+
+ #include <linux/clk.h>
+ #include <linux/i2c.h>
+ #include <linux/iopoll.h>
+ #include <linux/module.h>
+ #include <linux/of_address.h>
+ #include <linux/platform_device.h>
+
+/* spacemit i2c registers */
+#define SPACEMIT_ICR		 0x0		/* Control register */
+#define SPACEMIT_ISR		 0x4		/* Status register */
+#define SPACEMIT_IDBR		 0xc		/* Data buffer register */
+#define SPACEMIT_IBMR		 0x1c		/* Bus monitor register */
+
+/* SPACEMIT_ICR register fields */
+#define SPACEMIT_CR_START        BIT(0)		/* start bit */
+#define SPACEMIT_CR_STOP         BIT(1)		/* stop bit */
+#define SPACEMIT_CR_ACKNAK       BIT(2)		/* send ACK(0) or NAK(1) */
+#define SPACEMIT_CR_TB           BIT(3)		/* transfer byte bit */
+/* Bits 4-7 are reserved */
+#define SPACEMIT_CR_MODE_FAST    BIT(8)		/* bus mode (master operation) */
+/* Bit 9 is reserved */
+#define SPACEMIT_CR_UR           BIT(10)	/* unit reset */
+/* Bits 11-12 are reserved */
+#define SPACEMIT_CR_SCLE         BIT(13)	/* master clock enable */
+#define SPACEMIT_CR_IUE          BIT(14)	/* unit enable */
+/* Bits 15-17 are reserved */
+#define SPACEMIT_CR_ALDIE        BIT(18)	/* enable arbitration interrupt */
+#define SPACEMIT_CR_DTEIE        BIT(19)	/* enable TX interrupts */
+#define SPACEMIT_CR_DRFIE        BIT(20)	/* enable RX interrupts */
+#define SPACEMIT_CR_GCD          BIT(21)	/* general call disable */
+#define SPACEMIT_CR_BEIE         BIT(22)	/* enable bus error ints */
+/* Bits 23-24 are reserved */
+#define SPACEMIT_CR_MSDIE        BIT(25)	/* master STOP detected int enable */
+#define SPACEMIT_CR_MSDE         BIT(26)	/* master STOP detected enable */
+#define SPACEMIT_CR_TXDONEIE     BIT(27)	/* transaction done int enable */
+#define SPACEMIT_CR_TXEIE        BIT(28)	/* transmit FIFO empty int enable */
+#define SPACEMIT_CR_RXHFIE       BIT(29)	/* receive FIFO half-full int enable */
+#define SPACEMIT_CR_RXFIE        BIT(30)	/* receive FIFO full int enable */
+#define SPACEMIT_CR_RXOVIE       BIT(31)	/* receive FIFO overrun int enable */
+
+#define SPACEMIT_I2C_INT_CTRL_MASK	(SPACEMIT_CR_ALDIE | SPACEMIT_CR_DTEIE | \
+					 SPACEMIT_CR_DRFIE | SPACEMIT_CR_BEIE | \
+					 SPACEMIT_CR_TXDONEIE | SPACEMIT_CR_TXEIE | \
+					 SPACEMIT_CR_RXHFIE | SPACEMIT_CR_RXFIE | \
+					 SPACEMIT_CR_RXOVIE | SPACEMIT_CR_MSDIE)
+
+/* SPACEMIT_ISR register fields */
+/* Bits 0-13 are reserved */
+#define SPACEMIT_SR_ACKNAK       BIT(14)	/* ACK/NACK status */
+#define SPACEMIT_SR_UB           BIT(15)	/* unit busy */
+#define SPACEMIT_SR_IBB          BIT(16)	/* i2c bus busy */
+#define SPACEMIT_SR_EBB          BIT(17)	/* early bus busy */
+#define SPACEMIT_SR_ALD          BIT(18)	/* arbitration loss detected */
+#define SPACEMIT_SR_ITE          BIT(19)	/* TX buffer empty */
+#define SPACEMIT_SR_IRF          BIT(20)	/* RX buffer full */
+#define SPACEMIT_SR_GCAD         BIT(21)	/* general call address detected */
+#define SPACEMIT_SR_BED          BIT(22)	/* bus error no ACK/NAK */
+#define SPACEMIT_SR_SAD          BIT(23)	/* slave address detected */
+#define SPACEMIT_SR_SSD          BIT(24)	/* slave stop detected */
+/* Bit 25 is reserved */
+#define SPACEMIT_SR_MSD          BIT(26)	/* master stop detected */
+#define SPACEMIT_SR_TXDONE       BIT(27)	/* transaction done */
+#define SPACEMIT_SR_TXE          BIT(28)	/* TX FIFO empty */
+#define SPACEMIT_SR_RXHF         BIT(29)	/* RX FIFO half-full */
+#define SPACEMIT_SR_RXF          BIT(30)	/* RX FIFO full */
+#define SPACEMIT_SR_RXOV         BIT(31)	/* RX FIFO overrun */
+
+#define SPACEMIT_I2C_INT_STATUS_MASK	(SPACEMIT_SR_RXOV | SPACEMIT_SR_RXF | SPACEMIT_SR_RXHF | \
+					SPACEMIT_SR_TXE | SPACEMIT_SR_TXDONE | SPACEMIT_SR_MSD | \
+					SPACEMIT_SR_SSD | SPACEMIT_SR_SAD | SPACEMIT_SR_BED | \
+					SPACEMIT_SR_GCAD | SPACEMIT_SR_IRF | SPACEMIT_SR_ITE | \
+					SPACEMIT_SR_ALD)
+
+/* SPACEMIT_IBMR register fields */
+#define SPACEMIT_BMR_SDA         BIT(0)		/* SDA line level */
+#define SPACEMIT_BMR_SCL         BIT(1)		/* SCL line level */
+
+/* i2c bus recover timeout: us */
+#define SPACEMIT_I2C_BUS_BUSY_TIMEOUT		100000
+
+#define SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ	100000	/* Hz */
+#define SPACEMIT_I2C_MAX_FAST_MODE_FREQ		400000	/* Hz */
+
+#define SPACEMIT_SR_ERR	(SPACEMIT_SR_BED | SPACEMIT_SR_RXOV | SPACEMIT_SR_ALD)
+
+enum spacemit_i2c_state {
+	STATE_IDLE,
+	STATE_START,
+	STATE_READ,
+	STATE_WRITE,
+};
+
+/* i2c-spacemit driver's main struct */
+struct spacemit_i2c_dev {
+	struct device *dev;
+	struct i2c_adapter adapt;
+
+	/* hardware resources */
+	void __iomem *base;
+	int irq;
+	u32 clock_freq;
+
+	struct i2c_msg *msgs;
+	u32 msg_num;
+
+	/* index of the current message being processed */
+	u32 msg_idx;
+	u8 *msg_buf;
+	/* the number of unprocessed bytes remaining in the current message  */
+	u32 unprocessed;
+
+	enum spacemit_i2c_state state;
+	bool read;
+	struct completion complete;
+	u32 status;
+};
+
+static void spacemit_i2c_enable(struct spacemit_i2c_dev *i2c)
+{
+	u32 val;
+
+	val = readl(i2c->base + SPACEMIT_ICR);
+	val |= SPACEMIT_CR_IUE;
+	writel(val, i2c->base + SPACEMIT_ICR);
+}
+
+static void spacemit_i2c_disable(struct spacemit_i2c_dev *i2c)
+{
+	u32 val;
+
+	val = readl(i2c->base + SPACEMIT_ICR);
+	val &= ~SPACEMIT_CR_IUE;
+	writel(val, i2c->base + SPACEMIT_ICR);
+}
+
+static void spacemit_i2c_reset(struct spacemit_i2c_dev *i2c)
+{
+	writel(SPACEMIT_CR_UR, i2c->base + SPACEMIT_ICR);
+	udelay(5);
+	writel(0, i2c->base + SPACEMIT_ICR);
+}
+
+static int spacemit_i2c_handle_err(struct spacemit_i2c_dev *i2c)
+{
+	dev_dbg(i2c->dev, "i2c error status: 0x%08x\n", i2c->status);
+
+	if (i2c->status & (SPACEMIT_SR_BED | SPACEMIT_SR_ALD)) {
+		spacemit_i2c_reset(i2c);
+		return -EAGAIN;
+	}
+
+	return i2c->status & SPACEMIT_SR_ACKNAK ? -ENXIO : -EIO;
+}
+
+static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
+{
+	u32 status;
+
+	/* if bus is locked, reset unit. 0: locked */
+	status = readl(i2c->base + SPACEMIT_IBMR);
+	if ((status & SPACEMIT_BMR_SDA) && (status & SPACEMIT_BMR_SCL))
+		return;
+
+	spacemit_i2c_reset(i2c);
+	usleep_range(10, 20);
+
+	/* check scl status again */
+	status = readl(i2c->base + SPACEMIT_IBMR);
+	if (!(status & SPACEMIT_BMR_SCL))
+		dev_warn_ratelimited(i2c->dev, "unit reset failed\n");
+}
+
+static int spacemit_i2c_wait_bus_idle(struct spacemit_i2c_dev *i2c)
+{
+	int ret;
+	u32 val;
+
+	val = readl(i2c->base + SPACEMIT_ISR);
+	if (!(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)))
+		return 0;
+
+	ret = readl_poll_timeout(i2c->base + SPACEMIT_ISR,
+				 val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
+				 1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);
+	if (ret)
+		spacemit_i2c_reset(i2c);
+
+	return ret;
+}
+
+static void spacemit_i2c_check_bus_release(struct spacemit_i2c_dev *i2c)
+{
+	/* in case bus is not released after transfer completes */
+	if (readl(i2c->base + SPACEMIT_ISR) & SPACEMIT_SR_EBB) {
+		spacemit_i2c_conditionally_reset_bus(i2c);
+		usleep_range(90, 150);
+	}
+}
+
+static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
+{
+	u32 val;
+
+	/*
+	 * Unmask interrupt bits for all xfer mode:
+	 * bus error, arbitration loss detected.
+	 * For transaction complete signal, we use master stop
+	 * interrupt, so we don't need to unmask SPACEMIT_CR_TXDONEIE.
+	 */
+	val = SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
+
+	/*
+	 * Unmask interrupt bits for interrupt xfer mode:
+	 * DBR RX full.
+	 * For tx empty interrupt SPACEMIT_CR_DTEIE, we only
+	 * need to enable when trigger byte transfer to start
+	 * data sending.
+	 */
+	val |= SPACEMIT_CR_DRFIE;
+
+	if (i2c->clock_freq == SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
+		val |= SPACEMIT_CR_MODE_FAST;
+
+	/* disable response to general call */
+	val |= SPACEMIT_CR_GCD;
+
+	/* enable SCL clock output */
+	val |= SPACEMIT_CR_SCLE;
+
+	/* enable master stop detected */
+	val |= SPACEMIT_CR_MSDE | SPACEMIT_CR_MSDIE;
+
+	writel(val, i2c->base + SPACEMIT_ICR);
+}
+
+static inline void
+spacemit_i2c_clear_int_status(struct spacemit_i2c_dev *i2c, u32 mask)
+{
+	writel(mask & SPACEMIT_I2C_INT_STATUS_MASK, i2c->base + SPACEMIT_ISR);
+}
+
+static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
+{
+	u32 slave_addr_rw, val;
+	struct i2c_msg *cur_msg = i2c->msgs + i2c->msg_idx;
+
+	i2c->read = !!(cur_msg->flags & I2C_M_RD);
+
+	i2c->state = STATE_START;
+
+	slave_addr_rw = (cur_msg->addr & 0x7f) << 1;
+	if (cur_msg->flags & I2C_M_RD)
+		slave_addr_rw |= 1;
+
+	writel(slave_addr_rw, i2c->base + SPACEMIT_IDBR);
+
+	/* send start pulse */
+	val = readl(i2c->base + SPACEMIT_ICR);
+	val &= ~SPACEMIT_CR_STOP;
+	val |= SPACEMIT_CR_START | SPACEMIT_CR_TB | SPACEMIT_CR_DTEIE;
+	writel(val, i2c->base + SPACEMIT_ICR);
+}
+
+static void spacemit_i2c_stop(struct spacemit_i2c_dev *i2c)
+{
+	u32 val;
+
+	val = readl(i2c->base + SPACEMIT_ICR);
+	val |= SPACEMIT_CR_STOP | SPACEMIT_CR_ALDIE | SPACEMIT_CR_TB;
+
+	if (i2c->read)
+		val |= SPACEMIT_CR_ACKNAK;
+
+	writel(val, i2c->base + SPACEMIT_ICR);
+}
+
+static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
+{
+	unsigned long time_left;
+
+	for (i2c->msg_idx = 0; i2c->msg_idx < i2c->msg_num; i2c->msg_idx++) {
+		struct i2c_msg *msg = &i2c->msgs[i2c->msg_idx];
+
+		i2c->msg_buf = msg->buf;
+		i2c->unprocessed = msg->len;
+		i2c->status = 0;
+
+		reinit_completion(&i2c->complete);
+
+		spacemit_i2c_start(i2c);
+
+		time_left = wait_for_completion_timeout(&i2c->complete,
+							i2c->adapt.timeout);
+		if (!time_left) {
+			dev_err(i2c->dev, "msg completion timeout\n");
+			spacemit_i2c_conditionally_reset_bus(i2c);
+			spacemit_i2c_reset(i2c);
+			return -ETIMEDOUT;
+		}
+
+		if (i2c->status & SPACEMIT_SR_ERR)
+			return spacemit_i2c_handle_err(i2c);
+	}
+
+	return 0;
+}
+
+static bool spacemit_i2c_is_last_msg(struct spacemit_i2c_dev *i2c)
+{
+	if (i2c->msg_idx != i2c->msg_num - 1)
+		return false;
+
+	if (i2c->read)
+		return i2c->unprocessed == 1;
+
+	return !i2c->unprocessed;
+}
+
+static void spacemit_i2c_handle_write(struct spacemit_i2c_dev *i2c)
+{
+	/* if transfer completes, SPACEMIT_ISR will handle it */
+	if (i2c->status & SPACEMIT_SR_MSD)
+		return;
+
+	if (i2c->unprocessed) {
+		writel(*i2c->msg_buf++, i2c->base + SPACEMIT_IDBR);
+		i2c->unprocessed--;
+		return;
+	}
+
+	/* STATE_IDLE avoids trigger next byte */
+	i2c->state = STATE_IDLE;
+	complete(&i2c->complete);
+}
+
+static void spacemit_i2c_handle_read(struct spacemit_i2c_dev *i2c)
+{
+	if (i2c->unprocessed) {
+		*i2c->msg_buf++ = readl(i2c->base + SPACEMIT_IDBR);
+		i2c->unprocessed--;
+	}
+
+	/* if transfer completes, SPACEMIT_ISR will handle it */
+	if (i2c->status & (SPACEMIT_SR_MSD | SPACEMIT_SR_ACKNAK))
+		return;
+
+	/* it has to append stop bit in icr that read last byte */
+	if (i2c->unprocessed)
+		return;
+
+	/* STATE_IDLE avoids trigger next byte */
+	i2c->state = STATE_IDLE;
+	complete(&i2c->complete);
+}
+
+static void spacemit_i2c_handle_start(struct spacemit_i2c_dev *i2c)
+{
+	i2c->state = i2c->read ? STATE_READ : STATE_WRITE;
+	if (i2c->state == STATE_WRITE)
+		spacemit_i2c_handle_write(i2c);
+}
+
+static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c)
+{
+	u32 val;
+
+	/*
+	 * send transaction complete signal:
+	 * error happens, detect master stop
+	 */
+	if (!(i2c->status & (SPACEMIT_SR_ERR | SPACEMIT_SR_MSD)))
+		return;
+
+	/*
+	 * Here the transaction is already done, we don't need any
+	 * other interrupt signals from now, in case any interrupt
+	 * happens before spacemit_i2c_xfer to disable irq and i2c unit,
+	 * we mask all the interrupt signals and clear the interrupt
+	 * status.
+	 */
+	val = readl(i2c->base + SPACEMIT_ICR);
+	val &= ~SPACEMIT_I2C_INT_CTRL_MASK;
+	writel(val, i2c->base + SPACEMIT_ICR);
+
+	spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
+
+	i2c->state = STATE_IDLE;
+	complete(&i2c->complete);
+}
+
+static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
+{
+	struct spacemit_i2c_dev *i2c = devid;
+	u32 status, val;
+
+	status = readl(i2c->base + SPACEMIT_ISR);
+	if (!status)
+		return IRQ_HANDLED;
+
+	i2c->status = status;
+
+	spacemit_i2c_clear_int_status(i2c, status);
+
+	if (i2c->status & SPACEMIT_SR_ERR)
+		goto err_out;
+
+	val = readl(i2c->base + SPACEMIT_ICR);
+	val &= ~(SPACEMIT_CR_TB | SPACEMIT_CR_ACKNAK | SPACEMIT_CR_STOP | SPACEMIT_CR_START);
+	writel(val, i2c->base + SPACEMIT_ICR);
+
+	switch (i2c->state) {
+	case STATE_START:
+		spacemit_i2c_handle_start(i2c);
+		break;
+	case STATE_READ:
+		spacemit_i2c_handle_read(i2c);
+		break;
+	case STATE_WRITE:
+		spacemit_i2c_handle_write(i2c);
+		break;
+	default:
+		break;
+	}
+
+	if (i2c->state != STATE_IDLE) {
+		if (spacemit_i2c_is_last_msg(i2c)) {
+			/* trigger next byte with stop */
+			spacemit_i2c_stop(i2c);
+		} else {
+			/* trigger next byte */
+			val |= SPACEMIT_CR_ALDIE | SPACEMIT_CR_TB;
+			writel(val, i2c->base + SPACEMIT_ICR);
+		}
+	}
+
+err_out:
+	spacemit_i2c_err_check(i2c);
+	return IRQ_HANDLED;
+}
+
+static void spacemit_i2c_calc_timeout(struct spacemit_i2c_dev *i2c)
+{
+	unsigned long timeout;
+	int idx = 0, cnt = 0;
+
+	while (idx < i2c->msg_num) {
+		cnt += (i2c->msgs + idx)->len + 1;
+		idx++;
+	}
+
+	/*
+	 * multiply by 9 because each byte in I2C transmission requires
+	 * 9 clock cycles: 8 bits of data plus 1 ACK/NACK bit.
+	 */
+	timeout = cnt * 9 * USEC_PER_SEC / i2c->clock_freq;
+
+	i2c->adapt.timeout = usecs_to_jiffies(timeout + USEC_PER_SEC / 10) / i2c->msg_num;
+}
+
+static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
+{
+	struct spacemit_i2c_dev *i2c = i2c_get_adapdata(adapt);
+	int ret;
+
+	i2c->msgs = msgs;
+	i2c->msg_num = num;
+
+	spacemit_i2c_calc_timeout(i2c);
+
+	spacemit_i2c_init(i2c);
+
+	spacemit_i2c_enable(i2c);
+
+	ret = spacemit_i2c_wait_bus_idle(i2c);
+	if (!ret)
+		spacemit_i2c_xfer_msg(i2c);
+
+	if (ret < 0)
+		dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
+	else if (ret)
+		spacemit_i2c_check_bus_release(i2c);
+
+	spacemit_i2c_disable(i2c);
+
+	if (ret == -ETIMEDOUT || ret == -EAGAIN)
+		dev_alert(i2c->dev, "i2c transfer failed, ret %d err 0x%lx\n",
+			  ret, i2c->status & SPACEMIT_SR_ERR);
+
+	return ret < 0 ? ret : num;
+}
+
+static u32 spacemit_i2c_func(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
+}
+
+static const struct i2c_algorithm spacemit_i2c_algo = {
+	.xfer = spacemit_i2c_xfer,
+	.functionality = spacemit_i2c_func,
+};
+
+static int spacemit_i2c_probe(struct platform_device *pdev)
+{
+	struct clk *clk;
+	struct device *dev = &pdev->dev;
+	struct device_node *of_node = pdev->dev.of_node;
+	struct spacemit_i2c_dev *i2c;
+	int ret;
+
+	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
+	if (!i2c)
+		return -ENOMEM;
+
+	ret = of_property_read_u32(of_node, "clock-frequency", &i2c->clock_freq);
+	if (ret)
+		dev_warn(dev, "failed to read clock-frequency property\n");
+
+	/* For now, this driver doesn't support high-speed. */
+	if (!i2c->clock_freq || i2c->clock_freq < 1 ||
+	    i2c->clock_freq > SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
+		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
+			 i2c->clock_freq, SPACEMIT_I2C_MAX_FAST_MODE_FREQ);
+		i2c->clock_freq = SPACEMIT_I2C_MAX_FAST_MODE_FREQ;
+	} else if (i2c->clock_freq < SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {
+		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
+			 i2c->clock_freq,  SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ);
+		i2c->clock_freq = SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ;
+	}
+
+	i2c->dev = &pdev->dev;
+
+	i2c->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(i2c->base))
+		return dev_err_probe(dev, PTR_ERR(i2c->base), "failed to do ioremap");
+
+	i2c->irq = platform_get_irq(pdev, 0);
+	if (i2c->irq < 0)
+		return dev_err_probe(dev, i2c->irq, "failed to get irq resource");
+
+	ret = devm_request_irq(i2c->dev, i2c->irq, spacemit_i2c_irq_handler,
+			       IRQF_NO_SUSPEND | IRQF_ONESHOT, dev_name(i2c->dev), i2c);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to request irq");
+
+	clk = devm_clk_get_enabled(dev, "func");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable func clock");
+
+	clk = devm_clk_get_enabled(dev, "bus");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock");
+
+	spacemit_i2c_reset(i2c);
+
+	i2c_set_adapdata(&i2c->adapt, i2c);
+	i2c->adapt.owner = THIS_MODULE;
+	i2c->adapt.algo = &spacemit_i2c_algo;
+	i2c->adapt.dev.parent = i2c->dev;
+	i2c->adapt.nr = pdev->id;
+
+	i2c->adapt.dev.of_node = of_node;
+
+	strscpy(i2c->adapt.name, "spacemit-i2c-adapter", sizeof(i2c->adapt.name));
+
+	init_completion(&i2c->complete);
+
+	platform_set_drvdata(pdev, i2c);
+
+	ret = i2c_add_numbered_adapter(&i2c->adapt);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to add i2c adapter");
+
+	return 0;
+}
+
+static void spacemit_i2c_remove(struct platform_device *pdev)
+{
+	struct spacemit_i2c_dev *i2c = platform_get_drvdata(pdev);
+
+	i2c_del_adapter(&i2c->adapt);
+}
+
+static const struct of_device_id spacemit_i2c_of_match[] = {
+	{ .compatible = "spacemit,k1-i2c", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, spacemit_i2c_of_match);
+
+static struct platform_driver spacemit_i2c_driver = {
+	.probe = spacemit_i2c_probe,
+	.remove = spacemit_i2c_remove,
+	.driver = {
+		.name = "i2c-k1",
+		.of_match_table = spacemit_i2c_of_match,
+	},
+};
+module_platform_driver(spacemit_i2c_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("I2C bus driver for SpacemiT K1 SoC");

-- 
2.34.1

