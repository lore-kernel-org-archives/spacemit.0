Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025D527AC2A
	for <spacemit@lists.linux.dev>; Fri, 22 Aug 2025 03:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755832021; cv=none; b=p7AlW9RzehX6iPLEDeD08P5AMCgts1lvJ/3QePsKYN5totJMnDZtJ3sQ4f0FXc737JoDj+Q2lwCNhcU02HmvhTlmZvdSrFxunNUeYEMX6HZqO8y9qPe+F1X2KbYJquSaCB2FYOXnxYCezJCBYEe0dTABRgY5wsm1nAodD5c+al4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755832021; c=relaxed/simple;
	bh=JP0Sw65EOT4NHCK35qrtENIdh4sdphX+d8qoRvIjZfM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GGygoGovClCvog198C4HW4W8nHhyrn1ZT96o4WK3bteTuO7D4P7ogdGX4ojhM7/Y3gvIlX4RF57CnHqIUhLIOpYMw6lIK2atrLcC6NQ29MyWjpHt44mNACu7XsEGVb9bzkV7ZMe96gmaagqwdKdWQjK+8M8XfrYZoX84uIw2ILE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=qlOibul1; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="qlOibul1"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-76e2eb6d07bso1459459b3a.3
        for <spacemit@lists.linux.dev>; Thu, 21 Aug 2025 20:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755832019; x=1756436819; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XtQvt8lm8/UHHNz+8CMXd5C/9rKefGZFh5EhUafS5gg=;
        b=qlOibul1KKjDX+sa7fXdxvDvxXkB/+wtJt+w7CzOUArellYkHB9cZwf0C0ZCzKeu/A
         hwQOkYBzAUwR2OPWbgVaoKJ/aIl1KT4S6R5EK4mvQEhMxo9K3N9P6HfA5ULE/+BkruxC
         rgfOSvElfAV9a5zIxHtbnmcg8DBJZ/e6kqRXbXnw9nAHH3yRo5LrZ7mpkzDniPeDeBEx
         Es2L3zjUU8WAszM51GNoPyUdijh6OANuUFLOLVudzrrRBmWiKEfMjM9tGVt3pUHgTVNy
         ZPE+DBa7CZ1TjW1Zrc8k5GQdmYYaFCfo0a9FsBwzGcL5y4ovZhqHrcQFUevWMVo5/U99
         F2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755832019; x=1756436819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XtQvt8lm8/UHHNz+8CMXd5C/9rKefGZFh5EhUafS5gg=;
        b=sgAvp7SE0f0PeEQY2ZCJHYIOQfuTSuvNno9T4D48v3NdaNr8AOCDmTlTcCNRG6nobp
         50vzTCk8JPXDHPgXs6rxhd+aknlGQcRdNr7LEPKszxLf2T50XsiEa8QQzED7O0pZNccW
         Y0k5eOrvDiMicPOwemq6wYZE9oEr0KlwVP1Y6C4iVggY0z5RX2UkMUNYXn96lMoCCT+3
         REIoDeCcIL5MjOXtkBfsk+Rt6ZDFoWK5DergzM02dTquwM71nwi5K26yG2GxiYhsJWrz
         Wxkk0Fx+fW9xfog3ZMBi3Tp91hWTBiqxYyTOnkIRCOIVdGhZF6TrI5g7VRg6xc50KsfQ
         EnBA==
X-Forwarded-Encrypted: i=1; AJvYcCVfELSsbJdBqy+7rxF8YBlDTC2Ypc/j8Wf3PJKsKCbKH+T9VLd5cUozTDhz7XiuioH28ewzaJMdKA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzNfXqt/umiiX3JwOnBC5AkF6PuEmJohvtCQvgFFBf/EfxFHvJ5
	NZvt1Ub2yUniU26jeWYgaBsoI0mnfRNRtInzL8rneiOKLTZjGLAh2I4eV9hSjs5cYX0=
X-Gm-Gg: ASbGnctVw25DpKncvPtoxK2XKmiIkaWWi0MYnhEJ+6aQNiLlkRGCyFSaQ+EXSepsH9I
	VUbYQv97ddLmfblkgJO3ztJ2WiS2nYCVudKalIhTU7ccZZXlLRDt01a9XpW35C2PTNFh0Yet94w
	XBwt5zR8BAKs+uMl+KgPFWys7WP+IE7GfxTroz78rlwKUtcSCWO318UYzexpck7nkzgYGYLn1Gb
	ULY8/KV5kY7ENf99ju8w/uD43ceCaGxe2LpKveOr/i0tPhJLmXWW4iSIeeJVoME6l3VmOzkiqyM
	d/Pr1wkWoo04riVgH9bobclWvJ713UDqJLig4TRrfEs2ey3JrujQ9hD2WAurRJ2j5AkdcdDH/QX
	Mjcd5wkOlJQtSjklsKwmIZAv99+4AKrbmuA==
X-Google-Smtp-Source: AGHT+IFy0F1It4YMiy66wNzMrVWGW3rtyeZwnA2Mto2V1Iiq0zsuEd/8gIg4XCp3DGmUoishTl063A==
X-Received: by 2002:a05:6a20:1585:b0:232:7c7b:1c7b with SMTP id adf61e73a8af0-24340c429e2mr2292745637.14.1755832019211;
        Thu, 21 Aug 2025 20:06:59 -0700 (PDT)
Received: from [127.0.1.1] ([222.71.237.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47769afc1bsm2756777a12.19.2025.08.21.20.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:06:58 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 22 Aug 2025 11:06:31 +0800
Subject: [PATCH v5 5/8] dmaengine: mmp_pdma: Add SpacemiT K1 PDMA support
 with 64-bit addressing
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-working_dma_0701_v2-v5-5-f5c0eda734cc@riscstar.com>
References: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
In-Reply-To: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, duje@dujemihanovic.xyz
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2

Add support for SpacemiT K1 PDMA controller which features 64-bit
addressing capabilities.

The SpacemiT K1 PDMA extends the descriptor format with additional
32-bit words for high address bits, enabling access to memory beyond
4GB boundaries. The new spacemit_k1_pdma_ops provides necessary 64-bit
address handling functions and k1 specific controller configurations.

Key changes:
- Add ARCH_SPACEMIT dependency to Kconfig
- Define new high 32-bit address registers (DDADRH, DSADRH, DTADRH)
- Add DCSR_LPAEEN bit for Long Physical Address Extension Enable
- Implement 64-bit operations for SpacemiT K1 PDMA

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v5: No change.
v4: No change.
v3: No change.
v2: New patch.
  - Implement 64-bit addrssing support to mmp_pdma
  - Add support for SpacemiT K1 PDMA
  - Extend the MMP_PDMA entry in Kconfig to depend on ARCH_SPACEMIT
---
 drivers/dma/Kconfig    |  2 +-
 drivers/dma/mmp_pdma.c | 81 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 05c7c7d9e5a4e52a8ad7ada8c8b9b1a6f9d875f6..b8a74b1798ba1d44b26553990428c065de6fc535 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -450,7 +450,7 @@ config MILBEAUT_XDMAC
 
 config MMP_PDMA
 	tristate "MMP PDMA support"
-	depends on ARCH_MMP || ARCH_PXA || COMPILE_TEST
+	depends on ARCH_MMP || ARCH_PXA || ARCH_SPACEMIT || COMPILE_TEST
 	select DMA_ENGINE
 	help
 	  Support the MMP PDMA engine for PXA and MMP platform.
diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index 38d1a4cdfd0e92e53c77b61caa1133559ef40dbd..d07229a748868b8115892c63c54c16130d88e326 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -28,6 +28,9 @@
 #define DDADR(n)	(0x0200 + ((n) << 4))
 #define DSADR(n)	(0x0204 + ((n) << 4))
 #define DTADR(n)	(0x0208 + ((n) << 4))
+#define DDADRH(n)	(0x0300 + ((n) << 4))
+#define DSADRH(n)	(0x0304 + ((n) << 4))
+#define DTADRH(n)	(0x0308 + ((n) << 4))
 #define DCMD		0x020c
 
 #define DCSR_RUN	BIT(31)	/* Run Bit (read / write) */
@@ -44,6 +47,7 @@
 #define DCSR_EORSTOPEN	BIT(26)	/* STOP on an EOR */
 #define DCSR_SETCMPST	BIT(25)	/* Set Descriptor Compare Status */
 #define DCSR_CLRCMPST	BIT(24)	/* Clear Descriptor Compare Status */
+#define DCSR_LPAEEN	BIT(21)	/* Long Physical Address Extension Enable */
 #define DCSR_CMPST	BIT(10)	/* The Descriptor Compare Status */
 #define DCSR_EORINTR	BIT(9)	/* The end of Receive */
 
@@ -76,6 +80,16 @@ struct mmp_pdma_desc_hw {
 	u32 dsadr;	/* DSADR value for the current transfer */
 	u32 dtadr;	/* DTADR value for the current transfer */
 	u32 dcmd;	/* DCMD value for the current transfer */
+	/*
+	 * The following 32-bit words are only used in the 64-bit, ie.
+	 * LPAE (Long Physical Address Extension) mode.
+	 * They are used to specify the high 32 bits of the descriptor's
+	 * addresses.
+	 */
+	u32 ddadrh;	/* High 32-bit of DDADR */
+	u32 dsadrh;	/* High 32-bit of DSADR */
+	u32 dtadrh;	/* High 32-bit of DTADR */
+	u32 rsvd;	/* reserved */
 } __aligned(32);
 
 struct mmp_pdma_desc_sw {
@@ -222,6 +236,57 @@ static u64 get_desc_dst_addr_32(const struct mmp_pdma_desc_hw *desc)
 	return desc->dtadr;
 }
 
+/* For 64-bit PDMA */
+static void write_next_addr_64(struct mmp_pdma_phy *phy, dma_addr_t addr)
+{
+	writel(lower_32_bits(addr), phy->base + DDADR(phy->idx));
+	writel(upper_32_bits(addr), phy->base + DDADRH(phy->idx));
+}
+
+static u64 read_src_addr_64(struct mmp_pdma_phy *phy)
+{
+	u32 low = readl(phy->base + DSADR(phy->idx));
+	u32 high = readl(phy->base + DSADRH(phy->idx));
+
+	return ((u64)high << 32) | low;
+}
+
+static u64 read_dst_addr_64(struct mmp_pdma_phy *phy)
+{
+	u32 low = readl(phy->base + DTADR(phy->idx));
+	u32 high = readl(phy->base + DTADRH(phy->idx));
+
+	return ((u64)high << 32) | low;
+}
+
+static void set_desc_next_addr_64(struct mmp_pdma_desc_hw *desc, dma_addr_t addr)
+{
+	desc->ddadr = lower_32_bits(addr);
+	desc->ddadrh = upper_32_bits(addr);
+}
+
+static void set_desc_src_addr_64(struct mmp_pdma_desc_hw *desc, dma_addr_t addr)
+{
+	desc->dsadr = lower_32_bits(addr);
+	desc->dsadrh = upper_32_bits(addr);
+}
+
+static void set_desc_dst_addr_64(struct mmp_pdma_desc_hw *desc, dma_addr_t addr)
+{
+	desc->dtadr = lower_32_bits(addr);
+	desc->dtadrh = upper_32_bits(addr);
+}
+
+static u64 get_desc_src_addr_64(const struct mmp_pdma_desc_hw *desc)
+{
+	return ((u64)desc->dsadrh << 32) | desc->dsadr;
+}
+
+static u64 get_desc_dst_addr_64(const struct mmp_pdma_desc_hw *desc)
+{
+	return ((u64)desc->dtadrh << 32) | desc->dtadr;
+}
+
 static int mmp_pdma_config_write(struct dma_chan *dchan,
 				 struct dma_slave_config *cfg,
 				 enum dma_transfer_direction direction);
@@ -1110,10 +1175,26 @@ static const struct mmp_pdma_ops marvell_pdma_v1_ops = {
 	.dma_mask = 0,			/* let OF/platform set DMA mask */
 };
 
+static const struct mmp_pdma_ops spacemit_k1_pdma_ops = {
+	.write_next_addr = write_next_addr_64,
+	.read_src_addr = read_src_addr_64,
+	.read_dst_addr = read_dst_addr_64,
+	.set_desc_next_addr = set_desc_next_addr_64,
+	.set_desc_src_addr = set_desc_src_addr_64,
+	.set_desc_dst_addr = set_desc_dst_addr_64,
+	.get_desc_src_addr = get_desc_src_addr_64,
+	.get_desc_dst_addr = get_desc_dst_addr_64,
+	.run_bits = (DCSR_RUN | DCSR_LPAEEN),
+	.dma_mask = DMA_BIT_MASK(64),	/* force 64-bit DMA addr capability */
+};
+
 static const struct of_device_id mmp_pdma_dt_ids[] = {
 	{
 		.compatible = "marvell,pdma-1.0",
 		.data = &marvell_pdma_v1_ops
+	}, {
+		.compatible = "spacemit,k1-pdma",
+		.data = &spacemit_k1_pdma_ops
 	}, {
 		/* sentinel */
 	}

-- 
2.43.0

