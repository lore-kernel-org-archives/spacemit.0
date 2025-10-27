Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B20425DB12
	for <spacemit@lists.linux.dev>; Mon, 27 Oct 2025 12:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761569713; cv=none; b=rCxsuQgBO9iRjgkuHIG6zkmCwmno3gUkF2cCrcg1FRqwEamyE5xrFfMF6R9ebEbdw2HAOybR3VWXSRUYGdvQyg3h33ZAh+1eI27p8MITpAJTiJeP7TX5tONgr49qiTXallv9ahLtW3JuiY1fWZv3DghJe0nmhBUku03/YwTnWEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761569713; c=relaxed/simple;
	bh=Y1P+Ko6EypVqbiO04L0KXvr1REByV8AEUux9zAD3i0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SbL3KR6lEymgM+CWkP11pjPoRwP6pYwZQQIGvQDvzkncLo/9gaol52/DG46t4ujvZpyE7bP1sYfS0V9PRP85RMAu9HsziLHRlYVxPoISOfF78p1xvt18rqK0OTRlctSSVwQXDMu4h5BXeLHOo+i9ypdrMWkYkSjT8fuTEaXyJZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=v6vQU909; arc=none smtp.client-ip=209.85.166.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="v6vQU909"
Received: by mail-io1-f65.google.com with SMTP id ca18e2360f4ac-93e9b5bafa5so168842939f.3
        for <spacemit@lists.linux.dev>; Mon, 27 Oct 2025 05:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761569709; x=1762174509; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4nAF82uQdqoZ+b3y8tjZiPVkCVKQg6rD1LcHeZvN9hk=;
        b=v6vQU909xAY3XBS70MMKuDFMycJIw1iV+xMNCy2wYR5zdVTIQD0+vdh5kuEtwKukll
         x52dEJlg2jJc/hRw9s6KKJZ65ASsZZnOMmjQLVl0iXWbleUaynioLa0q360pvcV1rZ/3
         DXnxqp1p+O2a8euZUamKxQIN3JENdTKsCV+GEcUeMDVobmsd9SaSaVQSQeUc6phsk7zP
         NIG7a/zNJVcvLR950sW9j9d2t9TBpeFazxRrVZoPorDhXhzVy4gOr0mNnor1EIY9fh1B
         ydB2dghqS6pQosj6qL7xoJludaJNNwSSN0WYS0tTwdka6CiAFfhugXc2HmPrMMYxDYOh
         4pcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761569709; x=1762174509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4nAF82uQdqoZ+b3y8tjZiPVkCVKQg6rD1LcHeZvN9hk=;
        b=GSreo0UNwn6DVCDxZHg9+EDeSk6Au7VY42tK4K8rtUVTGNt+G3Hq6eqr2mkbY+3DLx
         b8ImcbtRutcg0LM8ZpJzc9daBA6Sj8rwmpP3rLCXJlwaakfIckb07+40jiLdqbWSZuuU
         z2WoTrtYWiVtynfq8T7QGejL3GMBlNEgTq52xx3RebYdyktrHsC4uumuPLymsnewmmsR
         GihA8+21pbkvdbStrIb4v+2tPiKzD0sYxXFN1Ac0lNRR67BV7M2hIp82g6AeYZFd1KxX
         d30Gpiq6rRYP9EYPhLrHVBwP4sX2xCVKW7Vi5n75YWTTBtO8R3OJTBzgWa+gllricbrn
         QhGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVge/BGbuYJZLD5B3m/5r+bx9CtiujUVFMVcyQ8HmUyDd4RSrTmfWZINk//4/QCjYx1GzRM8pCG5g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5er94F1ocVh/QtoYDAeX4uyaaBoLtrMSBTXvxO9TYWZQdzAMO
	lOPnxoTLpTpvPMfoGSEQXhowh2rgRweEFLocnQ5IeYp0+IiU2NAtq+EJfgqzugiDwJw=
X-Gm-Gg: ASbGncujjMbJQAEVFcdhc8mXSI6YNsokepPAoIRvx19hYCY7kdtMQmLqW2QGo2Xgi+Z
	Bqcex7on0KEITDZuc8y99IN0B8JmGtZnVY113LMtiasE5HhiWqCutIIIwnLtsH4aa59cIzOm8dL
	hoCKpQa6Ps83JqOq5QCja1fqoRvCqe+9+CuVirIm/sr6zVO0GYsgEJzOXGAPor+yZJtMy7RCnWk
	Og+7aXTuGo+Eg+j89xvuurc03Xx2EdisfOWa5S9VnGU1ou0esxksqOQKGVHgH3AOhdeO+4pDOcC
	YGepxZVod17lwwb+lNAHpdHvDJWGP9aWQUHT02j1a8tQPn+MUb+bh+xYbf/lDKW3H4yogQltWHW
	mPbPLMW1Wy5RDk2uk7BuHM5FmiCI+K1WQmKZLiUF+EOFSm8cIC7Fut9YYpClf20RTBUqWcqQ28i
	emn75M82nCokOsaiWpItvz/GmuiBSVWZPTlLyI0xDVISGFZsTP+hhAvw==
X-Google-Smtp-Source: AGHT+IF9dogLPfu3KKBrg4aJADxwDW+rw89Jp80NmbsD4vytQNTH3nxBh7Ne+iAACQ+ZbrAmLBB0QQ==
X-Received: by 2002:a05:6602:29d2:b0:93e:871f:b060 with SMTP id ca18e2360f4ac-93e871fb6b2mr5001344339f.15.1761569709430;
        Mon, 27 Oct 2025 05:55:09 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-94359e742efsm249121639f.7.2025.10.27.05.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 05:55:08 -0700 (PDT)
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
Subject: [PATCH v6 0/3] spi: support the SpacemiT K1 SPI controller
Date: Mon, 27 Oct 2025 07:55:00 -0500
Message-ID: <20251027125504.297033-1-elder@riscstar.com>
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

Version 6 is identical to version 5, other than being rebased onto
a current linux-next/master.

                                        -Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/spi-v6

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
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  15 +-
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  20 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  15 +
 drivers/spi/Kconfig                           |   9 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-spacemit-k1.c                 | 965 ++++++++++++++++++
 7 files changed, 1105 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
 create mode 100644 drivers/spi/spi-spacemit-k1.c


base-commit: 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
-- 
2.48.1

