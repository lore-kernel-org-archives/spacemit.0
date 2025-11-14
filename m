Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9C62DCF65
	for <spacemit@lists.linux.dev>; Fri, 14 Nov 2025 18:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763146671; cv=none; b=K3orjVQB+lcSNPx9tXTm+tieIdsPpnz30skAVBAODQfTKti8lKHNISNyZc3dFf20pgJlSX3KPEEm5hWacq2QN0jQgQrBOcdSpZ0QDwIArMew0bMg29sOenoeDTBS/8nODmp4qXrPxi/5Z41Uy4YgeV+Y+Gj+7veeiiKpEdButXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763146671; c=relaxed/simple;
	bh=SPekITSXao5JzRpeAqm6OT/Blg0mEMpoUV8q31/6/wM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lfDG1iHmktEqTN12uorGLwFpK1EfldqfOrMbdxDu/U8koSVgKY3D6PuW0e0oEm1M8FwjcH3HjWCQsMjR7dqRQw7tK1nnmwAyyH/bUEuNRxFQywwJBSDSq18WuHVFZ8ZFYcro4jgP0QgQn4r3lJEBwWCddu7rXEqXAvCcoj+OZ3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Hp489Fre; arc=none smtp.client-ip=209.85.166.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Hp489Fre"
Received: by mail-io1-f67.google.com with SMTP id ca18e2360f4ac-948a3979af4so120797939f.0
        for <spacemit@lists.linux.dev>; Fri, 14 Nov 2025 10:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763146669; x=1763751469; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/qXJqiPsnANUtpsR8sAeXZ7h/dCQytG5r8pVCD3h57A=;
        b=Hp489Fre1L3GaXx6+OzFbVCe+D+Xex/BfNaxza0x+3qATDgq2R/3M2DF84WdsVqIbt
         4E0CSDjfuy76DtF/sGA7WC01UHX91O/9qqa7dlDpoYcUFE9D0AbJC7OC/0yPDbc00VC2
         YHZ/FVZNBCo/ZXFEc3ZN8zU+byto5HcKUhOuQm3D5kQGyByPAex7XpuvVBbhWAw4ojdi
         bl46p4n1dN9sE/fmbPv7YgWJaaKnQc8bTnF60vbuZlFUkX1wGs1xlIqyCyqBd0p7h7W8
         M0lOUsO9UzRaApFyu3bngtmSIqOms7SYCD7sSkNaGU78HjwBngoIWwP9wB7yyZsWFf1a
         cwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763146669; x=1763751469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qXJqiPsnANUtpsR8sAeXZ7h/dCQytG5r8pVCD3h57A=;
        b=C3pEAvTNnsVFkcW8MvWf+r5u1Q+sgpi099GRF1f7ZT+MQGEZu//MjL8ezbANaDzKce
         ZnSy8ab5qv1Yg1QhmwJaUQfkd7aFranynltwXAMznVkkYncoJ/8BgtHyo9bdf1O0FOQx
         f03sEpkiEUYcpp1KJ6P7eqAOrXafLI8O1R6oL1K+e8HvfCn+nhbSySYBDyrpdM9H7Wrx
         yZu9acZ98IH+ZnlT6XNQU7uBax9UP97ZlWqHCoLx/Pn6Kkk1EoZZ4zhsMBWsa+y64yqh
         DPa9eF5gFr9YdRz9us+5+Jk9QcVyyc3Wq0l96bqZ80LsZPdrlAZJkZa5/glZEPg0qdji
         zTMg==
X-Forwarded-Encrypted: i=1; AJvYcCX4+zChgdxViNieCbnXG55oLvufBAb12XcvE6ENsEVn4yKChPnAJ7r4BsJBXMTjofEvZ2IVmaB18g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2BV+T2b9hm3iaUzpVAHNcvcsA3zpV4UdykFRvXNeyoWk7/86C
	kaV7FkszJdu4tR3D7AMb5H5Pyo02+2qsNDjPLZ5IwGgiYGd0SNOI/Rap06TKYZutHcA=
X-Gm-Gg: ASbGncvoP/wgutd0jX8uLaJ0+cuzf7F7D2uZoGiZTyhoXbdQeRFSOOGx6CABuElLpR7
	vj/II2WmoGtSkNFOzR9eEnswGhy91Jl70G8MSLZvVY21QgyR9ZUO+JSA2Bt6idIQaehTuL2xYtO
	GDRV/Pjoboy2xXdtYMmVzzccao5YOOCNJ0/UTTNY9QcrylDQslfCBMQ6L6aDaNmpdJXveulwm0u
	YrzuQdN9w2MuToJaGMnoXoF8Tnz2q7rM0ZmwOcv4FOQ2t1vgMLMLsO0aKo3FFNwUvx86XbxKVnv
	+JZ1q5H1hE20vesBNKi2uwvxVi3C3H6NRIu4p7drpVnavig33RUytmTf31ulWrjZg754z+sAuKQ
	fGwc/RA4ub6mmcjmtDjRDA6gMGtoACixZj3/wTDIuGelUbGX7sw84zJWFLLY8sbudoWHjw+Egph
	BmB5x4rufCLbSWCuV9jOWrRfW4Qb7QsyiN8fnOHlEVTplWm8xHokiTzzBGpvCfVxOi
X-Google-Smtp-Source: AGHT+IF4Nu5xfllgas5VBV6/o7VY3ZLAK+xfSIPCiHas33IRbeDvWn8RhVK1Tut1/N9t2FgYtTTWTw==
X-Received: by 2002:a05:6602:3429:b0:945:a834:5951 with SMTP id ca18e2360f4ac-948e0689de5mr706912439f.6.1763146668632;
        Fri, 14 Nov 2025 10:57:48 -0800 (PST)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-948d2ba690bsm278679339f.8.2025.11.14.10.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 10:57:48 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	dlan@gentoo.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/3] spi: support the SpacemiT K1 SPI controller
Date: Fri, 14 Nov 2025 12:57:41 -0600
Message-ID: <20251114185745.2838358-1-elder@riscstar.com>
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

Version 7 fixes two bugs, and now builds the driver as a kernel module
by default.

(Note, this is a distinct series from the QSPI driver, which was
merged recently.)

                                        -Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/spi-v7

Between version 6 and version 7:
  - DIV_ROUND_UP_ULL() is now used when setting the speed, to address
    two errors reported by the Intel kernel test robot on 32-bit builds
  - Fixed a bug interpreting the resource pointer in k1_spi_dma_cleanup()
  - The driver is now built as a module by default, if ARCH_SPACEMIT
    is defined

Here is version 6 of this series:
  https://lore.kernel.org/lkml/20251027125504.297033-1-elder@riscstar.com/

Between version 5 and version 6:
  - Rebase only

Here is version 5 of this series:
  https://lore.kernel.org/lkml/20251013123309.2252042-1-elder@riscstar.com/

Between version 4 and version 5:
  - Added Yixun's Reviewed-by tag on patch 3

Here is version 4 of this series:
  https://lore.kernel.org/lkml/20250925121714.2514932-1-elder@riscstar.com/

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
 drivers/spi/spi-spacemit-k1.c                 | 966 ++++++++++++++++++
 7 files changed, 1102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
 create mode 100644 drivers/spi/spi-spacemit-k1.c


base-commit: 0f2995693867bfb26197b117cd55624ddc57582f
-- 
2.48.1

