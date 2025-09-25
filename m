Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23682FB629
	for <spacemit@lists.linux.dev>; Thu, 25 Sep 2025 12:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758802157; cv=none; b=CwirsmEkyTDB0H+hunPcHgKrpcMNLrTy0yUCG1AOpYwCWcHuUVr38Gr6wZB1EhvZweFw4df55brLL5why/IqpgjmH8kVYgkOfh8FN3BsnubaOecJrhcWMerb//7XM4OsIidAnlEZVGuln26uOuBwI4KC7ODRI2588wrzk4xPmxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758802157; c=relaxed/simple;
	bh=xL1Z2r5mm+gHNer5hMSCPiJPMqVtkr/dKj1QXGEcpMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N9fJVi5/g6lamPAx/wiuvnFEwlptkHa2TYyWE/kapRoXQyBhDCp9s/To7o7FW6PUj1Q8gpmrgvSDjf5oETwjKgQFslfw4COmYnaRLiZJrr9ubDR/q4QkNCaP/Cbruhq3JwZitMyuyxuEFyTbf94cQxtIA8nvtudTcqHS0D+sm2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=m5mN9VMb; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="m5mN9VMb"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-890e5bb3100so32187639f.0
        for <spacemit@lists.linux.dev>; Thu, 25 Sep 2025 05:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758802155; x=1759406955; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HHsvn6JN9lNBPv+vuOCqB081gUg4QWTUGs8Fvt4xcvY=;
        b=m5mN9VMbWDiRWwmtnLOtT9kh28JAel9NSpvGJv65aQy8ltcAxvz/K0MKs72HZjAEHA
         ycV0PaGl7tGFUkfBt+ARw5rLGXU2Y1PLd4/c9z5W3AJ6qS2p2g2vRSPK9jTiR2pHnTKq
         61FnouP9BJcIOJDEohEtzlIYNVttccw9UJrWSHDRbrcTS5tNI7wIkiBm+6ch1rLEXIJf
         W9FO57YCigQZH2tICPZrRIcDfpWX5hmwOUlT05Tr3+UXlqJI7E4PeVJgZ3ppl1mkC8Px
         fQS+jKj47oxlyti6KzkBl7iUeiE7n40iC+uXvnyNy0xLST3nowlAx52UYbv83WN42Jlb
         eWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758802155; x=1759406955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HHsvn6JN9lNBPv+vuOCqB081gUg4QWTUGs8Fvt4xcvY=;
        b=gDmtwLbAEsR8XjBJQTg+F8p1K1fiORVklBgdp3jfcu4KOc/8SuC2H+xouf6rhH8K+H
         /abDq25LDgTMiIC/K/vTgoUgtxPAoJ2DQgrwL2rwmLyMMWGUkPFyEAhx4KAkbvqx0M1L
         b8CejFEEUhpsW2/EaZNXzjiYribBg94L68dv/AapALVNGKWQ0fleYskSVB00EEtfbPrq
         SxovfFYkO2VhvsHzx6aPiwqQc4ug1xog1rBYTdeDROXNmAAXShZqQ089WehOTMqgo+I3
         6m6UQBbkUjaxaCFbnYKA6V+H5SVmQPzTyLlsgnevi/9lkJlQfZiUdlLAI0wSUGKhCN8N
         d2ow==
X-Forwarded-Encrypted: i=1; AJvYcCUI/940TDOyaMxWkd0zlJxEXdPB8Y7uFQNhsx8ynXKLn23CM7TK6755CEwy9vMknNmyn3fU+H8deA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+iwQHqQqUpCQtDLy4rYVl5vh2v93okoB8T0Ski2dzR4a7EaYm
	KQV8Q3BUTmM9UW0DLCeFb2vxkFQRjXyzQ5eRc3j9/gEbXsX+bYT2IylJxyQABniLKmA=
X-Gm-Gg: ASbGncsXra8uwxSl5VVBUe45AtW7uScxd+Sdtb3P1o9QjuD/af2Wdetul+HRK6HabTx
	e8EKyApZmBPMJD+Xpeh7nkSXeJEnVoK4RDgfE+6nSmlDOqUiJUQDhqu1BfBxFL/H01i4neK/5+/
	5PtIBBiU1IxO6ZyRN1OzfolpIwR49JUw9OFoSJW+bZSwNBIeiyygueary8v17FcJUsqSPKv3Ms4
	zhFUWrPFh1dbqlF7wi7ofv7fviOjNzy4RPjRfulIao8dGNOnZGEzDdMxoDnK3eNpBW+DkZa0f54
	WgjmVvpLIQ0SJX6NIzBr0MI4q8smXZD6+pON/9ZmCA6n/YxmzNQTzd5uYNnTxKqeY3B3zBDFdtY
	PB6wL/7jl4VV6r1/1abYvgS12lhCpH4YlGp08KFyn9V1KdHS/KMovvWRve9cmbF5Ibg==
X-Google-Smtp-Source: AGHT+IEBJ+drkM79LMDTsVqVSkGDzcPRYyPT9NtjqS/rk0F605YLf1DTbe9+DpHbYdMz9/5APp0ejw==
X-Received: by 2002:a92:2802:0:b0:3f2:b471:e617 with SMTP id e9e14a558f8ab-4259563e04fmr37344175ab.25.1758802154131;
        Thu, 25 Sep 2025 05:09:14 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-56a6a5b29c1sm742821173.62.2025.09.25.05.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:09:13 -0700 (PDT)
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
Date: Thu, 25 Sep 2025 07:09:05 -0500
Message-ID: <20250925120909.2514847-1-elder@riscstar.com>
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

