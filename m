Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2766D3BA233
	for <spacemit@lists.linux.dev>; Fri, 10 Apr 2026 15:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775833494; cv=none; b=h1o6NvfciGt2ljZJQMy83HNsiS+W1iR1PvI8RQE3xmcLJgOfOdhy7fDm7ZLQdqpL3Ev4r97OiksfysQnbpy/H0X+dBZcpgmSoQWU1R72IkXXkFYO1etm+u+EpJZNgqhtpGxHS+dFy/MhjF/R1n6nNtjEqO4TJuUvL8EGQK7G9e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775833494; c=relaxed/simple;
	bh=LOamkOoU4OVVI8X9g75MJ4lPXrvJuQtSV7WWo3C0igs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XbA86mVkRRlrUZDC5qGtzj0yJkSkYJBxwfHWpqd03rzGxlZwXYfcoP36U0NpMMMJpPct8e2l/oFzxIOo8AGMTMgodNo97LysEUBEH6rKl0IAFUX7teVv3OID5VaNgZZUdYbRYJZ7hTO9up3wOCqhc0T173G98Ntr0MVKPbYedek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=PAUKm8U5; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="PAUKm8U5"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82a655cfab5so2094709b3a.1
        for <spacemit@lists.linux.dev>; Fri, 10 Apr 2026 08:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1775833491; x=1776438291; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nyFmM55+8nwlvhnoFbA02HWarg4SN6Bckaku3Nj5Ch0=;
        b=PAUKm8U5ww1+MpRbeZWC9cduIUEYvGJqHkc/iJnwDKp9KWfvs/ALCB14A090VX9EDH
         29j/25C3Y5N5T85REOa1ZI96N2LpCLUx3BmBbJsuc/rVu4oqjtr92kRFRXVYSAfkun0x
         c76WNs0Da7ISAgGCO50dspIEW3sm7EHDM4Mu1/pgUArq0SYWVi8q2jQ/EmwaPp3nhnAT
         ESw+LniJm/FfzHNrD9NDE0ASLdMey8NGF2YNDEupu/Zt79mer2IXpnr0FpQNBKwO5vU8
         AIovMxOY8CKbKF5m2lZd1kVe7E7nGxEioNpY4gGg9D62DK2epQVn1rkbE9bvyzlJXtjO
         JJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775833491; x=1776438291;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyFmM55+8nwlvhnoFbA02HWarg4SN6Bckaku3Nj5Ch0=;
        b=bxPKN6cHu+ph3ndLNx1Xxf3tWc2rXWhpFqJfAUbLGYiDllDXnEjxh5nZlb70Jsc5ck
         DnkIP6UDr4GXcyFB3WpV4nhXk0JJBTsbx8fynzxZmGfjbbWNOuDGCwpKUcJMgeKiL2cA
         VqyhaWrmReXssHLpBcyruXuVjsc2rHSTCkdNBzT3c+DFN8snyGpTOURyIyje07JvdpJI
         3GjoPXkSPbJRUvbkRIUUKnmXSj9wh46U3JXCEKdCWw59q2rRdXTf6rHT3+Aly8uBhWV4
         YXtkdeaBckAxGW823zgohBX73kKRWesguSvRk5FI63Ne6F6I6VoIo3RacfaS+oHvKsCQ
         3tgw==
X-Forwarded-Encrypted: i=1; AJvYcCXGLBJfe+7EgAV6IDfFx1KMxcqqvoSMclk8pxSxADH+vy1dzyZ0nBC8PhXIYfoezaJddtdb7f4tVQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyfugdl5j4lslgI0bhCPDwsjfvbAcRdGndxJOYILgiW8WmwYWc3
	gh0lLu8vBMGqbBkFyxLwvHQ8q8qbCZO9XTuCMOtOvqMfdMuAK0WPbwZTpd82YEtRnxw=
X-Gm-Gg: AeBDievl1f630I3SsRQ6ibzTk3S7VLwr3L7X66ispwVz43QpMOSOgDx2vPmUYHj8Mzd
	sa14jB9OAaG2SQ/61aKnCDxo1z85hEsh6h9ocIeZCsIR4EYwUfd9SyHOChU0Zre1ENgED5YPkN1
	2qY830tm7QZzsxfte3ki1ZLXOlJUfR5eF+4D/JfuAo60hckl0uAddWzW4IoqPXxwBYt3uM/70h9
	henlYnnNJNmr7hzDMyXBYFBLLhK1G/58khfAouASPI5c6HjQBeHfBjI5uzvF6eLU6//R2wUimB+
	xaivJVIR7fGuW+WSPiXsQpuKOIlEYC53cVwXAHHSxAChFQvZHSjRV1BJrHUpGBXgzDePbbmrz+9
	CnfY+t6LzsgenTAtl2fdM/ACcJX2mHHb1lMe3LI7pKXrp4PLBLrwwC/TAhMj/Zfy7PF5W9+tTie
	MN2XuzdGMDnkLO+LHHgjLskmv14M/CHqGXJgQBt3mMgTzSGYy09OLV5xdHditI5OHj
X-Received: by 2002:a05:6a00:400b:b0:82c:6b46:271d with SMTP id d2e1a72fcca58-82f0c2efb17mr4220868b3a.48.1775833491374;
        Fri, 10 Apr 2026 08:04:51 -0700 (PDT)
Received: from [127.0.1.1] ([45.8.220.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4d5413sm2970532b3a.40.2026.04.10.08.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:04:50 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v8 0/3] spi: support the SpacemiT K1 SPI controller
Date: Fri, 10 Apr 2026 23:04:19 -0400
Message-Id: <20260410-spi-spacemit-k1-v8-0-53ebb48a4146@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADO62WkC/yXMyw5AMBCF4VeRWWvS1t2riAU1GOKSDiIR765Yn
 MW3OP8FjJaQIfcusHgQ0zI7pL4Hpq/mDgU1zqCljmUoE8EruVUGJ9rEqATKLEpMoJSKNLjXarG
 l8ysW5W/e6wHN9mbgvh/8TjubcwAAAA==
X-Change-ID: 20260407-spi-spacemit-k1-e0957c311152
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Alex Elder <elder@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Alex Elder <elder@riscstar.com>, Conor Dooley <conor.dooley@microchip.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.1

This series adds support for the SPI controller found in the SpacemiT
K1 SoC.  The driver currently supports only master mode.  The controller
has two 32-entry FIFOs and supports PIO and DMA for transfers.

Starting with v8, I am taking over from Alex Elder to shepherd this
series upstream.  Alex developed versions 1 through 7.

Version 8 reworks the driver based on Mark Brown's review of v7, making
much better use of the SPI core framework.

(Note, this is a distinct series from the QSPI driver, which was
merged recently.)

 -
 Guodong

Between version 7 and version 8:
  - Use // comments for the file header (Mark Brown)
  - Remove open-coded DMA mapping (k1_spi_map_dma_buffer(),
    k1_spi_unmap_dma_buffer(), k1_spi_map_dma_buffers(), the dummy
    buffer, k1_spi_io struct); use SPI core DMA mapping via
    transfer->tx_sg/rx_sg instead
  - Add can_dma() callback, replacing open-coded transfer length
    checks
  - Add set_cs() callback for chip select control via the
    TOP_HOLD_FRAME_LOW bit
  - Switch from transfer_one_message() to transfer_one()
  - DMA completion calls spi_finalize_current_transfer() directly
    instead of using a completion
  - Add SSP_STATUS_BCE (bit count error) to error detection
  - Return IRQ_NONE early if no transfer is active, before
    acknowledging interrupts
  - Simplify k1_spi_driver_data struct
  - ~160 fewer lines of code

Here is version 7 of this series:
  https://lore.kernel.org/lkml/20251114185745.2838358-1-elder@riscstar.com/

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

Here is version 1 of this series:
  https://lore.kernel.org/lkml/20250917220724.288127-1-elder@riscstar.com/

Alex Elder (3):
  dt-bindings: spi: add SpacemiT K1 SPI support
  spi: spacemit: introduce SpacemiT K1 SPI controller driver
  riscv: dts: spacemit: define a SPI controller node

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Alex Elder (3):
      dt-bindings: spi: add SpacemiT K1 SPI support
      spi: spacemit: introduce SpacemiT K1 SPI controller driver
      riscv: dts: spacemit: define a SPI controller node

 .../devicetree/bindings/spi/spacemit,k1-spi.yaml   |  84 +++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |   7 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |  20 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  15 +
 drivers/spi/Kconfig                                |   9 +
 drivers/spi/Makefile                               |   1 +
 drivers/spi/spi-spacemit-k1.c                      | 782 +++++++++++++++++++++
 7 files changed, 918 insertions(+)
---
base-commit: 7aaa8047eafd0bd628065b15757d9b48c5f9c07d
change-id: 20260407-spi-spacemit-k1-e0957c311152

Best regards,
--  
Guodong Xu <guodong@riscstar.com>

