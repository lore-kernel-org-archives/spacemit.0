Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE4B253951
	for <spacemit@lists.linux.dev>; Mon, 13 Oct 2025 12:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760358797; cv=none; b=eEfdN43e48gwihaeJ3VnoGFeC2WXtrvxQsAPYrYuibE8KNnnvcWpWduAo8CxjC78nMWKxTbGKCJZoZ+Xx9QWBcLbwh0oa1KaHs2midhKsl8OUcbW7Bu0o4YtJ+lvF8yQiuTn6DUoxhvI9QxhZ35LU6j8iNVsnpZw9vqOA1QwVkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760358797; c=relaxed/simple;
	bh=h8CFdd79v4VO3bij5qSEzeUJyA91RQMRi53bza5wKho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lYv1lWI2hwp4D8PIVlHVoD6P062qhBX99oIANXMmTv0kvSCXkR/q1LdTBui7ieP0rAuQwHBWX8RimQlJMmRduAi//toyYO3dAGHIzoJmRKZyh+ZcUmB7lB7w8JrQSEfbWLdv/u0Elnuw0NhlRX+VOfm1mI7YmfvalhSklVsHFdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Fd6mMnqJ; arc=none smtp.client-ip=209.85.166.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Fd6mMnqJ"
Received: by mail-il1-f194.google.com with SMTP id e9e14a558f8ab-42f8b7cd7e5so16707515ab.0
        for <spacemit@lists.linux.dev>; Mon, 13 Oct 2025 05:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760358794; x=1760963594; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tLrx3aJ85cahSgBHalujwwLYoL+tJ6ZOd2UYi1030U0=;
        b=Fd6mMnqJFfuxYZXp3kw+71IP4qXwN6MAPGVoxhMXxdv1QVQVcVpUwCuktUKAjhQmGN
         2wMe1dLTqQ79kBwbqY/m08C57HOoxQHdLX12kEO8l9ZRkAlmWD76v9flRX89xPzCTjnt
         wDszkwl0u0bnZDXztIfgvvTi0RHyff1UPv1sRXeUOtYEinzAA1wlB+fTM8lkcznlM4D4
         z6u9Tc1ae8oA1aS0aagTIYIHP64P+H2WQr1KsPe0+l5by169HG1iMui2ohX0TbnvkoJH
         Qut5qSnVBlc3SCmAfbbL2jH/eA4nJqmVkU8LUrFCEuutrkVnnoiPODT1RGCZu9vzGYPG
         pCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760358794; x=1760963594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tLrx3aJ85cahSgBHalujwwLYoL+tJ6ZOd2UYi1030U0=;
        b=rSk6X5Od3/qBoDcSq4pW2yfOGLP8Rdf+b4lmSX8dc9l2esuz3JBi/svHS84MVyK8Us
         6Z55lJyv8daFir49whf5Ck4L4p7FWvKiGfHyvXCl7Ipsqzgo+fij44nROkbwQKk8Lm/Y
         hLZLfQp+7adP5St77B9RQZW7edc1svLC0hEZuanQy9Rg6fhw2M9osknnpH+GgtQt6WiA
         4xOdgwDOBhLxTOwdnNQEUcnIsXYSURiikgL82OdNZN/E48ntxhi6S8lJmHZK0sSIVxMR
         s59M5zPpIZS969uHEQnqTxU+wuyI80/zgn5keFw7hzOELZPj2Lx13vGouMYgXl9D4qV5
         BtCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtBy/4QW+0UGFAVGoemUytfXPVzF0MlpG5FnsKfryM/GfKM8fQu0qRvpDwxjPnbMF6uyYGuWj6zQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4CxEdjCJJFciGjs6+8glocO81CyKuDuyEg5HIEEZRHSPlaIFU
	0j2rl2chYrR9E8UaX30fyH2+NmPwRXtcZZipZFVYw8S2O+pUF9P1/tmEWMlbGXxfh4U=
X-Gm-Gg: ASbGncukqnEF83M4MENXCJsr7hfSblASFKcii+9MsIRtvKrL9yTiTtz3Y/wuXXONXhJ
	pJwMhAyD+Ne4piFvM7oVzt6vOXzNooBH3n6mUTO611NkOMKuZfygh6enqUwu406lbO/wCcpwAGG
	DRHx6FjugrXZXmZyg8pbNwfdRQIxvLcuUDu2HFPJGPUO96m/nyHNNRIbqG9Hk4KqrNmwKctEw7y
	NiFO+Mtyx05fd52jak0qaIvXnzPeEkGTfKETgNG3Guv0I3tVf8ki929eopsNH1OjoJMpJJvKKSY
	RPs6RMzwh8quMeqancA+/5Jeaq9/x2ihVoaR57ncfn5MdoaWxCB301SWafMelB6OPL0+nixdkLC
	M5hQlOJxeJHF7LhwPKWwFqO6qpWIGmYXpt2CqkM7F1P+rs5ZZBrOHFpCajSl0FABD2mUhG0NfYC
	Nl/Acm6AaJEv9HYirrFKo=
X-Google-Smtp-Source: AGHT+IFg0DwI3pqrI0r0Isbt8WNPInul2Q08ViVQNFGip0noHZxRDTL9hoja3a4mal6MKLFRgicfyg==
X-Received: by 2002:a05:6e02:4713:b0:42f:8eeb:49a1 with SMTP id e9e14a558f8ab-42f8eeb4a2fmr172406555ab.13.1760358793820;
        Mon, 13 Oct 2025 05:33:13 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-42f9037e344sm51529815ab.34.2025.10.13.05.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 05:33:13 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	guodong@riscstar.com,
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
Subject: [PATCH v5 0/3] spi: support the SpacemiT K1 SPI controller
Date: Mon, 13 Oct 2025 07:33:05 -0500
Message-ID: <20251013123309.2252042-1-elder@riscstar.com>
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

Version 5 adds Yixun's Reviewed-by tag on patch 3, and is based on
Linux v6.18-rc1.

                                        -Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/spi-v5

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
 drivers/spi/spi-spacemit-k1.c                 | 965 ++++++++++++++++++
 7 files changed, 1101 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
 create mode 100644 drivers/spi/spi-spacemit-k1.c


base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
-- 
2.48.1

