Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946F43074A1
	for <spacemit@lists.linux.dev>; Thu, 25 Sep 2025 12:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758802642; cv=none; b=qChVjPRZYQZErnF2g3KBbgDzrFOhfmtJSBZLcHU8b15w+DwVITjKTh6KxDQgOfhG5YvkrOJKXt2/cwh+HULOMLjdFiSLX543nyBLR9G2IRlXBuZylM9LkSYPGy9QXS0kbZBwinrHy6WXF1cYlNh3m8iU4Rq3JTTgLfrKFUbRm+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758802642; c=relaxed/simple;
	bh=xL1Z2r5mm+gHNer5hMSCPiJPMqVtkr/dKj1QXGEcpMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=chutLhHC5E6bYjeV+spqnW8dGpavI5ziGbPoTCQbO78JNTSHwhM/kgW4EuhYnzTbL24EFj0+AZgTNW48lfYh1fLwpTWU62qFNvd4i2He7pOjUbsYOlVLIB1XwtM/5dM2aR1IvxfKBc3jkX3zPGFKYZJRtDARVZ/AXTGkiypyc6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=3gWbeRSi; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="3gWbeRSi"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-8d593793af1so37748139f.0
        for <spacemit@lists.linux.dev>; Thu, 25 Sep 2025 05:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758802640; x=1759407440; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HHsvn6JN9lNBPv+vuOCqB081gUg4QWTUGs8Fvt4xcvY=;
        b=3gWbeRSitgS1QB7OmgBJZWzffQR1z8NF6CqSH0pisFKtLorf7HS76FS1KLvP92LJ0Z
         lP6GisIMmgcY6CYLksAUKU/77wl642Fl92wDnaNRTQ8wXrDJwbFhVzf/S5drP5Wps+K/
         nOFCtS6YOJzl6mdYAn553/OpVyiHTJkG+kHAYTeSA7ClKMvdYSVtJS/JEdeuqQlgXhPA
         P/fMiwfSuAUnfFQ84u+UweA9KtXtfwJ8uHnpN0ijJFPr8yauu+Xw+b7I2cLOJlAcd2ew
         PtQIbqbwGv3hJVTLxdWnxyVh+TGACjhiohcDU13YNjk3T4p2wxUDejBo9mizwpqRot1j
         eETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758802640; x=1759407440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HHsvn6JN9lNBPv+vuOCqB081gUg4QWTUGs8Fvt4xcvY=;
        b=k/E3qt4csr/Tpt+ftbDGPYicwE4VS9eOUB2vgmmWKfuLFG2XLDInBc1km4nDe0NnY7
         i9ZhF+c3kMppqeuayr2RybFFi8Wz8gwfiJbWrsQDnJmcDhYG9sCewtuo2IRODWVgrvF5
         mdAF0yyCXgFn+8CN2uFCsJJnp1fnA1uxBY0xBg509UzedEHs9M8WE89Ibgjy0V7Wb9KV
         KYRCGX3guMKMbqiLUv/Ryp5+7Rvd6UsczXwRnuuzJbe7mDiZHbSaVEmzWOkbziSJnb8T
         JF6AgVXoraD3w+uQ8OZ6Y15ZOHHmjA7GyyIUEdpMijWnJs0ezaVWHlymk9eoqQK+R+XT
         yyqg==
X-Forwarded-Encrypted: i=1; AJvYcCVmaoohQtuy9WrOgjba1v5OY3ej0LUV/VaJIjAZiDJrt2q2rhfJmXIl1pxmUHpW/CxI/U/ymHlGnQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxrN8s7nsUY7ZBBlxx6ou36lWrAmsJBmBflQmzW5gfJbybGLqMh
	QVJJcJlJr59lJb8vm51A9o+YX1YurCDeVEqabH6ILF2oY6L8CWTQ77Udu7YIaQaTHR8=
X-Gm-Gg: ASbGncu5M4ve42cNM8mF1lMr2okkjsutpHNhqRQQSjIDXnyXxk9SXFjsxfIxQrYPB+e
	ZbgypkOhwz/fFqI3+66KfphjrP3Cc6nMkAGcX2V36yWc5YrN17XSfILRzSWe/d8ivDdHh86mOqQ
	yGVnDbLSe0Jr/nAkL2t5Gea95ZBe2iBG4HD829loLsmAVWEDVrONrfhKd1fZ8LfjC5Df6tvWbu0
	4XbZtsRvQNQgx5oGOPqq72OKTpmQ0u81JevaqeAk9AGR8wpz4UVmkvzxMLjsjV05YrcgxYs794f
	lAC1xP02FwD06OgQZrd7Lyk7v7d08aS8X5oh+yVZSVJ8dpaCyRbCepI9i9oH5lwhhQvFL8JujcH
	zoeLOEssmTgTt7z7lidWn/fU2E9f6FOF+f+Fb9nxsvhV8YBtE407JXlPbPvo/JVTSrQ==
X-Google-Smtp-Source: AGHT+IFItDx0CgAF9/fDAUUs6ylh3g4EswI9rpEOCYIuQ62NnMT5cMivYNjp0gufj/IrIj6FyCAjzQ==
X-Received: by 2002:a05:6602:6d01:b0:887:690b:2594 with SMTP id ca18e2360f4ac-90375bc2ccamr342646339f.5.1758802639509;
        Thu, 25 Sep 2025 05:17:19 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-9040c57fa59sm66918439f.16.2025.09.25.05.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:17:18 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	ziyao@disroot.org,
	junhui.liu@pigmoral.tech,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] spi: support the SpacemiT K1 SPI controller
Date: Thu, 25 Sep 2025 07:17:10 -0500
Message-ID: <20250925121714.2514932-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the SPI controller found in the SpacemiT
K1 SoC.  The driver currently supports only master mode.  The controller
has two 32-entry FIFOs and supports PIO and DMA for transfers.

Version 4 incorporates changes suggested during review of v3.

                                        -Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/spi-v4

Between version 3 and version 4 (all suggested by Yixun):
  - Fixed an underrun/overrun comment error
  - Renamed a pinctrl node
  - Formatted dmas and dma-names properties on one line

Here is version 3 of this series:
  https://lore.kernel.org/lkml/20250922161717.1590690-1-elder@riscstar.com/

Between version 2 and version 3:
  - Add Conor's Acked-by to patch 1
  - Add Rob's Reviewed-by to patch 1
  - Added imply_PDMA to the SPI_SPACEMIT_K1 Kconfig option
  - Fixed a bug pointed out by Vivian (and Troy) in word-sized reads
  - Added a comment stating we use 1, 2, or 4 bytes per word
  - Cleaned up DMA channels properly in case of failure setting up
  - No longer use devm_*() for allocating DMA channels or buffer
  - Moved the SPI controller into the dma-bus memory region

Here is version 2 of this series:
  https://lore.kernel.org/lkml/20250919155914.935608-1-elder@riscstar.com/

Between version 1 and version 2:
  - Use enum rather than const for the binding compatible string
  - Omit the label and status property in the binding example
  - The spi-spacemit-k1.o make target is now added in sorted order
  - The SPI_SPACEMIT_K1 config option is added in sorted order
  - The SPI_SPACEMIT_K1 config does *not* depend on MMP_PDMA,
    however MMP_PDMA is checked at runtime, and if not enabled,
    DMA will not be used
  - Read/modify/writes of registers no longer use an additional
    "virt" variable to hold the address accessed
  - The k1_spi_driver_data->ioaddr field has been renamed base
  - The DMA address for the base address is maintained, rather than
    saving the DMA address of the data register
  - The spi-max-frequency property value is now bounds checked
  - A local variable is now initialized to 0 in k1_spi_write_word()
  - The driver name is now "k1-spi"
  - DT aliases are used rather than spacemit,k1-ssp-id for bus number
  - The order of two pin control properties was changed as requested
  - Clock names and DMA names are now on one line in the "k1.dtsi"
  - The interrupts property is used rather than interrupts-extended
  - The order of two pin control properties was changed as requested
  - Clock names and DMA names are now on one line in the "k1.dtsi"
  - The interrupts property is used rather than interrupts-extended

Here is version 1 of this series:
  https://lore.kernel.org/lkml/20250917220724.288127-1-elder@riscstar.com/

Alex Elder (3):
  dt-bindings: spi: add SpacemiT K1 SPI support
  spi: spacemit: introduce SpacemiT K1 SPI controller driver
  riscv: dts: spacemit: define a SPI controller node

 .../bindings/spi/spacemit,k1-spi.yaml         |  84 ++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |   7 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  20 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  15 +
 drivers/spi/Kconfig                           |   9 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-spacemit-k1.c                 | 965 ++++++++++++++++++
 7 files changed, 1101 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
 create mode 100644 drivers/spi/spi-spacemit-k1.c


base-commit: b5a4da2c459f79a2c87c867398f1c0c315779781
-- 
2.48.1

