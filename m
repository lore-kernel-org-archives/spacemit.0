Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F2B239E6A
	for <spacemit@lists.linux.dev>; Tue,  1 Jul 2025 05:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751348288; cv=none; b=DQUgq3yswphUbrhhw6+6vDPYKZ6iqK3WeS8ZJFrGcynAu8OR6gRBCmcGSk6NuBq9s1l8pPGtGWZc24oH5KRWDncBpowYnmg3tQ5Q2UDiQDuPfBU2zTGBHlCPGxz1/skLBF2dJ0b1D8Qk5b4NWOmJjI5dzMWvCTNeN+ig10IuFpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751348288; c=relaxed/simple;
	bh=PVPZP+CgMQOSQFDrWY9YLaa+sOJ+Qf3rIysRroeBU2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gmShqfERs086B/O1abstuFl90TUbT1V8oqOSVnWJcyO6xpzkZ0EVFXmxE2xJWMmEf2k5A3hR+fho+SS67stDcIvk3v8k4dUIUuNuCC6TimGREuvoEPyNHcmJhuSUgbBs1kPE+aeQARDRDDJY7M+14yN4JQ/qXYxXBQtPPYrP0sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Tmrbg2DJ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Tmrbg2DJ"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso2632860b3a.2
        for <spacemit@lists.linux.dev>; Mon, 30 Jun 2025 22:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751348286; x=1751953086; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wP+bs12WPQGGhABQZ+X8E9Vcd5L9CBDvEsXIkM7mq9I=;
        b=Tmrbg2DJUvLoT0TkAE4rz6cAVZOnHZdoRSxkkiqtsli5Syr9IVPF4pG4jttY1IVmo+
         sMIE6JZ7/K0rz5yYyRHoMpzRVfzMek9+Ucn8Fwn4btoOmFRg3OM3hBPc7mX3BK/AMfwJ
         xJ6WqgoPsQhbq+let8AwfhukSdTrL8rnpODG+YR4DiPyIcLFdqN6rqeYJFh/gaEWvfSb
         7dwK+5kC4NSgUnov+WVlzbQ7d+Td9JZrjs6EA8nqHUG//xlxIyG6sGohkJMOQuo/PWYQ
         NakepXCPUeGmOf+WvDSbhI8KcEijqRKbjcJdk+4plvYQW6mWHdxfYtW3eeIxWkDHpNZ1
         eXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751348286; x=1751953086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wP+bs12WPQGGhABQZ+X8E9Vcd5L9CBDvEsXIkM7mq9I=;
        b=Y0YDIlAaU33YiPFaiUYYTGYkRqjGz1ZbjhJaUYn/9YlCtKmLgvuVSspgSMlCFVs5Xk
         2EqmY7WVJARTu9ti3U5uGoiTJV65xii1TcnHzrKznftT1H2u9IDNW3wABths1KSAaf/N
         d06MtqIk8ksIHC6X0hpLvnasX4f1bFd2AgxrJ7c8s509I7irqnzNtnK4ZPEw2ldGtkgM
         KXtQDbfgjeG3vPNc7dUDLkhkwR4/TGLZxwIZxC75Wj0uVEblJtiVVRViogFCdyoXG6ro
         JkejISNBStnYfRHOzFOrkyF7dUQSthd+rD2em/GLIPuIjF5ri/D/ksD7mw6Yk3/1Lqsj
         NPwQ==
X-Forwarded-Encrypted: i=1; AJvYcCX29+yLPjCkWTXUjn7OF321SdVb7dXcti0NgFRKKEMc5J4ARKnC5t1KKBHSoFUP1KN6AciSrbU0dA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOijB4EnN0qioiI1LVM++jY3QaLEo9H4QH4c+Jy1G95JJwx1kv
	mku54pl4JnoCuGa519upUPFhdg9IHKgvhgwtgeVTgCtJbRIIi6B0+NhC7WAqW6DW8zL1KVU6B3J
	3MfMIoiFB85wD
X-Gm-Gg: ASbGncvA1yh4wk7F+gOzcd2ezc9tstmuVE+P34KsBFuEq2I2gGhWVm5sz3x3xHcPTJI
	dBnbjciBFy+trQ5DcrS2fQDPgWErmwg2oKPzIrzqC8NXTyfRFt+8EDZiX+8fsqNHbVkBjOyyzxq
	IvoiQqAJ3WphEmgtPK2NTyKWojks0P2QPgnmt64KJR0V2oJZJp6LiVQBUDcP7QRF7ZXcVLc5+nT
	CYK70z4lBeaJSAZV+xForKjftuZATsp+i0nKosNmRuesH9uMECXrRl9Po8RLQ7jP1OC5GZSa7+b
	fsKBWD0IujRzpmnHeE0la3FD4qSMs/ADurOHzrI=
X-Google-Smtp-Source: AGHT+IFe39WxG7MjcagikZuLoLSdffzZtEZTBFHBReoxkncYLGlt+gZhfeTycrw62ngjpKipmHBK+Q==
X-Received: by 2002:a17:902:da84:b0:234:e0c3:8406 with SMTP id d9443c01a7336-23ac3dec308mr244800885ad.1.1751348286102;
        Mon, 30 Jun 2025 22:38:06 -0700 (PDT)
Received: from [127.0.1.1] ([2403:2c80:6::3092])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bf5fsm101729865ad.115.2025.06.30.22.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 22:38:05 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 01 Jul 2025 13:36:59 +0800
Subject: [PATCH v2 5/8] dmaengine: mmp_pdma: Add SpacemiT K1 PDMA support
 with 64-bit addressing
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-working_dma_0701_v2-v2-5-ab6ee9171d26@riscstar.com>
References: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
In-Reply-To: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
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
v2: New patch.
  - Implement 64-bit addrssing support to mmp_pdma
  - Add support for SpacemiT K1 PDMA
  - Extend the MMP_PDMA entry in Kconfig to depend on ARCH_SPACEMIT
---
 drivers/dma/Kconfig    |  2 +-
 drivers/dma/mmp_pdma.c | 81 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index db87dd2a07f7606e40dc26ea41d26fcdd1fad979..fff70f66c773934efb2fcafdc3628ba06c734640 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -451,7 +451,7 @@ config MILBEAUT_XDMAC
 
 config MMP_PDMA
 	tristate "MMP PDMA support"
-	depends on ARCH_MMP || ARCH_PXA || COMPILE_TEST
+	depends on ARCH_MMP || ARCH_PXA || ARCH_SPACEMIT || COMPILE_TEST
 	select DMA_ENGINE
 	help
 	  Support the MMP PDMA engine for PXA and MMP platform.
diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index 610df28f429783779c1c143a13b3a829e42cf003..28c03d05e0b2708fcb8faffeeb97b97ed6fcbdc5 100644
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

