Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3311231E0FB
	for <spacemit@lists.linux.dev>; Fri, 19 Sep 2025 15:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758297561; cv=none; b=f5jkML8l2p5VJ6ZC2uNIxC6s65SIvXyxDUab1jr90CG3WIxjv758PzW+I2aP1lnRjQeGaBWWsjf8vSM0Xo/6p2gjH+SgIkzusIBn2UGQu/MlwVflUmCMBVrcBG70+Qje0aXruUrqOIcSzPM0Fa9PiQjQwkU3vk7QIUZJRIVCECc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758297561; c=relaxed/simple;
	bh=e6z+FuB07lTrzgCpwwNvKm6kawfyWQVO1KrgqPQyPRo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bkY2Q1c41v0qQFb2vPX0K9WbxatDwlcOpJAyqP6PWD99VRFeC96/WZWpWE8h0NbgXQOindm0xss0I+LD3EwYmkSOLx+RXApnt4HMjrnC8oIoV+AZe+iMny/rPc8mWdVRaIacMbY8m9ONi9zwX5PcxOTrEZcwY4TcB2H0rOVTwm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=YXR5Qcxc; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="YXR5Qcxc"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3fe48646d40so15446475ab.0
        for <spacemit@lists.linux.dev>; Fri, 19 Sep 2025 08:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758297558; x=1758902358; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PieohXBDde9aJoeZPffJCOlv0SEwDrquFxpLVqeOn8w=;
        b=YXR5QcxclPWeoRs6BqVyHQUbGnbj188EELdszeJGNOGq8qmpE2tDdhP+CBJkBwwHus
         0CDAtQ8P3Kczf7klM1CGeYKCQxGicIiUas1fM1AzF8f715w9QEqlKFhecBsYO+Pq2EQs
         pF5JyATdUpV8r1VTYi9PPKmlMrGCruoh3EvlRPEPvZlQjkuJOClVDWZou98YLh0Fthmq
         yNFP0CoUNyVKcXCErInE5yCUhlz8c08LGFbbxJNxPoWHADJNy+BFpAErunI73RAWsP9h
         i8dpU8H2is0gZO6FdrhwORBT0WYRSYDj8OneFyJoxk6bvzB1KRli9wGdW1XYorh6Xhci
         AW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758297558; x=1758902358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PieohXBDde9aJoeZPffJCOlv0SEwDrquFxpLVqeOn8w=;
        b=ftNYeMJLs1MicUZVcG33dd2+u0QQDfaei4f6k9SPYow/4lW2rfvE7jYPgxvAmXTpE2
         t5rzEhO+PqbQwDLA9NV0atQioyK2/T8tjcl7kqhXwhvTOrZXa/Q8xrG/CuNnm7DMgFQv
         92UNl6HXExVnxbIyQGmUN6FIE+ZPqd+ImupR4R0UuFhec6yASVGunWJ69eDIaBbM0gEz
         VbAz3KBuJP8RJOiyI12jeEF+vrhY3bxYU94KAwr8bjutcaFfGujKub31iSOMiJzvAYAU
         1htptJRVsfAI9UOZdw0tlvtYthbOoQU98vkTNFzXmXzf5CKBakzhL/C2Kn8Hh89myXpw
         NoJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS3o0IjikN7TGy3UVyI0PlxMVjMAhtC3kLSfUPEZlvseXMl26shCqu3jkh7Kz+HRT9H/Hvet/HqQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/PrsFiCmv2c8vIrKY2jDBcgBJPGpJn4wSRRpHw7Rl7+4YD0z/
	73TzA6JsbR1mAPVRv8QpLAyviDqoytHlYxgOvWndd25MhnYla/66juIEU5Q04ZywDtQ=
X-Gm-Gg: ASbGncvogSgNKAnlxKjAeWPiJoWPkPRYt4ZPbYadisyZNCOmBgxZCW3nrGg9+W5EEWU
	ICodFfym/HsfkMujQKMV2D5dPnbClUcb0Fsl8nKNB0UMuzuX+1i4MtJ7w0ta7G6WkvvIpnPaVqg
	8s0Ss8M5Rsx9ikiLP3JDdKdr4m6cMGF2WGcZZNqeH+9QWT5ZfWIEE84RBrb0csJ+XE01I0IP5hL
	3KtQSxJt9kcC0gBThXnUgJtp8oB4svNCchW32hXMEi5RsgbcYoCHMqfpIr9B3ZDk7reXhtSOhVG
	7lCUiB0WMe35CXxo73IwJKvM3JppZ3mwediY+islztz9Jub7/NRPx45eLwAtQ/7+nJBfkKCm7IU
	GlHwIfFodEUu64LvuXzKBwKolhNqoys/J1YmKW+gklEdPQtlM3ttx3neEwXEQxIYBRA==
X-Google-Smtp-Source: AGHT+IEjqrlSFIoeKxmjUweDtrCLwaQpAtyQ3arbMa+ZmRjzpi9BoH5PVFn/nUo5LPbXaE/8/YT8KA==
X-Received: by 2002:a92:c5b2:0:b0:411:6759:bfad with SMTP id e9e14a558f8ab-42441af5df5mr105138315ab.10.1758297558106;
        Fri, 19 Sep 2025 08:59:18 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d50aa460bsm2250898173.52.2025.09.19.08.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 08:59:17 -0700 (PDT)
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
Subject: [PATCH v2 0/3] spi: support the SpacemiT K1 SPI controller
Date: Fri, 19 Sep 2025 10:59:10 -0500
Message-ID: <20250919155914.935608-1-elder@riscstar.com>
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

Version 2 incorporates changes suggested during review of v1.

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/spi-v2

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

