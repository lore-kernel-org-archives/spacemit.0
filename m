Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300613115B0
	for <spacemit@lists.linux.dev>; Mon, 22 Sep 2025 16:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758557845; cv=none; b=IkCR6UmVE5it/9w1Pgnp0gO+MVprTmna8Zem5LVdLvYZVOxbDfUWaWQR93HcG++r2YnEv91MqHhHC8kNsxZDPMeh9sezw23XMf5DIa+l4K8/Ij8/4MYbNbmpdev2KjXXVO7QbYoM8vbd+nZrG6ikLZ49vSQhSNN7SMf0yqMzs3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758557845; c=relaxed/simple;
	bh=7vVewiqA0e2iwP/eAxuh7WA4OQg2jToWd9kLbbhtNC4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Artqcw6LCC8RgIL2uq4T0UGQPOiSo0RkwEhWytfs2lnD1Fo2F8zt3VwXUaZqVGEk1v6wYmOuPh7YaJo09ZIgQskcX4D4FPpfL01IHAwJqFoPorIZ+s2kCpbSEqcUccmcGNZqwBcLMM9Hsfxb9tzDt54tTCbzKCpNlaih35NvSBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=XcMlOoQX; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="XcMlOoQX"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-4248a13fbe9so16593445ab.1
        for <spacemit@lists.linux.dev>; Mon, 22 Sep 2025 09:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758557842; x=1759162642; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VY+UeuZTbe4DuOfkxt1V9gHqp7+wtqNRHgcn1ay/Mt0=;
        b=XcMlOoQXzkdpJTwBxwyuPrSrLW7Y+T4x9GXKk3vMu3m52zzGrzBSnywZuxPsvS2lCM
         Jn5DCDY7irgcHL/JDWVPSBirvhrm8nrwGTsUmXZ9iqnQlsVbTVukaqv2fsu3j/FmHDkQ
         PgS/MBlj2nvunDwDHHJ5MbVEmTqG2LbkkSqSsRspluALEjRlIYIF1jU96L+EESgLgrMu
         ryBPleUX+ywQPFwhGAVbRZRpwaQAosQAqWWxWvOCLD6hTCwfIrE+9Ql8q9rjwDj3buVu
         PzRnQGWCSjr/7pL2lqvKr3AGXFqWmHgMyNmJ97LdKgFRdXGgtgfZX6JFalfw89nbaoOt
         elQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758557842; x=1759162642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VY+UeuZTbe4DuOfkxt1V9gHqp7+wtqNRHgcn1ay/Mt0=;
        b=c4VQ8CoglWXqGF0ZiC03t9HlDuIWVtvDkk9ujez08XmBC2xGFeHujb+pHvoUSnjHqS
         ORxTxNZswvFDsy/Ce2m0h5iB0EcPnJCXpNRrvkRVWZQmMwtc0uMYhBAh4GY1fJ/wT+Rz
         dTQiTlcf2HYrB4dGyuEzwwP2ZXUpsUZsIdO/lH2smWSIQfWDZypCndvVKpjaEQyTI3Ii
         k5nb8/TJg2wxlmIYaVO3P1+WWX4xWbHzGVRNky115xNaPcsuLvdv5UwgB1PnezyThUi9
         hAFawX+aBDcbkSO0ajxBNeHNjki6aDDzpLqxgayUTSO61qFprVKvFNAsu8xpKBFpuLMJ
         aFpg==
X-Forwarded-Encrypted: i=1; AJvYcCV+4ZCgph2hsHS4t76WiQOU48BH8BHuXVEJfj5Lm3jtU9JYMS3Te7qTN+f3F94ONnPyy73XwdySTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9mz4BQY3+VAg0Gq52Tk2AolA2+6gCnI9bVCJaqtid+ObQs4bZ
	AX5eEzoWnrs4Z84GavZhrKZZCKByyfxZ0mUxsozetntQrS5hMO+clV8Jj0lRfqQ3CX4=
X-Gm-Gg: ASbGncseitfvreyG6efh3HtssoSyTZqioR8RCcRyf2GmlLrgmP2a7T5H2qxWJPC3feQ
	qEMWfZ/MvRnPNzC5iXM90rk36WKxa43bXX61Bw5OQzkCmaao55dw5BoTic+0obHS/j9n9AsJbNG
	/JyoNn8eD1mqsseyBsr1L1mn0vvOEE0hUpCqpLogzDkBUmxvqoVAQ2yTscpgtffXxPwnNC3p7WC
	6IkaqSsINt0oWrHP4zoQy96dmhlVnUshVKLG+o2aYsXgLudMmlZSQ4iHaojuQFmChRN9Z+pLxpj
	q6si2laEO3T6/ZIF6XuCFdx6XXPnOJ+yI1wwNZQ16P+LaOMCR6NlJQH7n2M4107yYGxmX3AeLaj
	Mh4GGyLaeqYnqTg0kvqcyKWOgGkmdmcEFRKN+mAJfZBAWey/oJacPTXQbLsAfWzE11A==
X-Google-Smtp-Source: AGHT+IGacLGMErLcsONCaQ7tVN/QLr7qDvYuMf/IioCcbyv5ZtFG8CwlnJVAkhCLzpWTG1DzdwCTxg==
X-Received: by 2002:a05:6e02:1a8d:b0:3f2:a7ef:bd88 with SMTP id e9e14a558f8ab-42481911aadmr188245465ab.5.1758557842154;
        Mon, 22 Sep 2025 09:17:22 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425711d9aa0sm25207185ab.48.2025.09.22.09.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 09:17:21 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	ziyao@disroot.org,
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
Subject: [PATCH v3 0/3] spi: support the SpacemiT K1 SPI controller
Date: Mon, 22 Sep 2025 11:17:13 -0500
Message-ID: <20250922161717.1590690-1-elder@riscstar.com>
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

Version 3 incorporates changes suggested during review of v2.

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/spi-v3

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

 .../bindings/spi/spacemit,k1-spi.yaml         |  87 ++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |   7 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  20 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  16 +
 drivers/spi/Kconfig                           |   8 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-spacemit-k1.c                 | 968 ++++++++++++++++++
 7 files changed, 1107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
 create mode 100644 drivers/spi/spi-spacemit-k1.c


base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
-- 
2.48.1


Alex Elder (3):
  dt-bindings: spi: add SpacemiT K1 SPI support
  spi: spacemit: introduce SpacemiT K1 SPI controller driver
  riscv: dts: spacemit: define a SPI controller node

 .../bindings/spi/spacemit,k1-spi.yaml         |  87 ++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |   7 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  20 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  16 +
 drivers/spi/Kconfig                           |   9 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-spacemit-k1.c                 | 965 ++++++++++++++++++
 7 files changed, 1105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
 create mode 100644 drivers/spi/spi-spacemit-k1.c


base-commit: bf2602a3cb2381fb1a04bf1c39a290518d2538d1
-- 
2.48.1

