Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979FB1DCB09
	for <spacemit@lists.linux.dev>; Wed, 13 Aug 2025 02:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755053116; cv=none; b=K3epAci5PJGLadFgwAYbt0Yj8dQwlI9Q5bZvDfgaKe0ydKqDJWBDG0w8RAzAyMGUJ8R36y0ff+TM0OY46rnG9hNBsjrT81OxtG+k6PnmgDVPfodbhAmyuKch0VAPO3awISHTyGlqubz3mVjLjNQTIGVrVK7lqYrTluDkL5TR4TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755053116; c=relaxed/simple;
	bh=qigzO2DTvwyXcMLvudEMT153tkZ+VKdFAQ3TY4DaMas=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xt6elQyk8wV75aQ6ehntiaCrKoKSZE2N/c9w6oa7rXHdt1iRvcStuT2R0Xvpl+s5oZ5Gf5G5EBqpBxYF8NoSFT65HTzHYBFLB4zkdKH2HkYtWoDoZK84VfCaogYO/zvPIqvfVux/VtmYp2G+VL6daqb1Ubw6HdciT96E+ZsehQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=NOL8A/XW; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="NOL8A/XW"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3e5664c0271so1619105ab.1
        for <spacemit@lists.linux.dev>; Tue, 12 Aug 2025 19:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755053114; x=1755657914; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=niKBP2EZ19X+wqMs4ZG9wJKfN7oQpwL1MM9OL7zTge0=;
        b=NOL8A/XWUBYc9dGVuAFNMcKNib/HigOgoE7I+76UdU4ObPd/hMo19RjHbouW1EXWpf
         foiJ+zCTmZ08ijrKs9Lrf47wkmB49CzZ6HEwols2X4BXJGVwVS+WtMz8Ylmd1S9+4rUq
         9ooQjgtJeNzkj0huuqSKMCdeAao7rB/qvQWpoEVWg75nJtlgZTQqZBNTMPLJTT9ymRIZ
         dKdC+7AHV1K8j3J7fALVe1BAnl8MChvfgX5kEDjYYju7NP+1J6E1zvNW2Zf21Jnjg2hc
         8JmREHicEa6hqc3BSePTXh4b4qC2qo03XUZiz3jWb4PiTfgSSYss6R7eQtlJ1NnCkyzF
         qldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755053114; x=1755657914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=niKBP2EZ19X+wqMs4ZG9wJKfN7oQpwL1MM9OL7zTge0=;
        b=u+GAvfRd3rmDUKQLMgpc8FWKSHE2qsh/2U0SBEIqRjPqo5hZ06nTUqR1iBYeNGlysG
         yV5VkpELKPYLs94hFU1uFK18w4Cmj86wdBxrmFcGFjMloRWAxCOddltPWRm9kpnnhbGN
         FNG8iuLZvSh4suPmtBChFmdkXfV9X33B94fR7s4NKyDhWUfxqEP56DgEedUxqnnrUaFh
         gv0tbbR0T7GeOFuYyg/PwFWElpLP8bb+23kNsvaZKyKLvEABk3ey9ajcJmsCxsNHisTB
         BtVYNDgWPpumGNfeBNnObbDkj3TGPeq8J9PfosxLP/YXdsOBKZq0E88oiFza3kx20e+N
         vzGg==
X-Forwarded-Encrypted: i=1; AJvYcCV8/sGBPKX2TxiEscQ4XP5tTu0vbtM9SJSsb9+StnS0ff1Ieh2eB91OvqQS+mY1U6W+VdJfdnM7Ng==@lists.linux.dev
X-Gm-Message-State: AOJu0YyIjHkDe0DPtBm8DDaBpMsOCsnuOXaA74PO1ejcwLgeK5tKJ/iM
	56XqrdVjpCssPFZRibdT5v4cPCgnwYzuEz3jcwKHyNOJndLmCIcBtw3iUJc6TG4pVW0=
X-Gm-Gg: ASbGncsGd0aNSHA7oLZ022QKJSxqRfZ7nbmhyHj4CXNU67KzWymHohPNHbr89DZtq8F
	ZgwL+RZVDZwdDPFC3Z4aZzRBGmuaPNNzoJgE1hJUg/YhyzlF8+fV2phmE/go016feWw2L9wYkuK
	N6MShLPx9f5v+5vq7iVphiM3kn55O8PS1bv+jySzZ11dtGmZDo7RjZPNvVnx/7l3qore7pqP/fL
	AGP3sv/qQ0tpA01r3uekjr9NWe/oJdOIFQN20k3TmurF8MWHhT4g9nTfpBY2K9lmEvI2C1i6QEY
	5HZ54vFF08B3X6n/rcIA0PbcxUQgWUKavhlYfBAe+og+2HahfWvHKbcKMS23YMIi0Tamm/uLgd6
	vtjVIOReyA3vW8sFN8nTHgv2R3SE245QxH6NvZ4C6YwRCDKXN27l/GKde0y/4clmJWtDD8aSEM1
	GA
X-Google-Smtp-Source: AGHT+IEBZwyeOzbbOcVhNNK5J1cGS+53cBPTwwwfowqlesyNWISPovkwp31RGRTV3tyrIRkYbuJPkg==
X-Received: by 2002:a05:6e02:19cd:b0:3e3:b3d0:26cf with SMTP id e9e14a558f8ab-3e5685aa5bcmr15459295ab.10.1755053113531;
        Tue, 12 Aug 2025 19:45:13 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9bcfbf6sm3430829173.54.2025.08.12.19.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 19:45:13 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux.amoon@gmail.com,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 0/7] spacemit: introduce P1 PMIC support
Date: Tue, 12 Aug 2025 21:45:01 -0500
Message-ID: <20250813024509.2325988-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT P1 is an I2C-controlled PMIC that implements 6 buck
converters and 12 LDOs.  It contains a load switch, ADC channels,
GPIOs, a real-time clock, and a watchdog timer.

This series introduces a multifunction driver for the P1 PMIC as
well as drivers for its regulators and RTC.

The content of this version is identical to the previous one.
It has simply been rebased onto Linux v6.17-rc1.

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v12

Between version 11 and version 12:
  - Simple rebase

Here is version 11 of this series:
  https://lore.kernel.org/lkml/20250803025812.373029-1-elder@riscstar.com/

Between version 10 and version 11:
  - Abandon trying to implement a simple_mfd_data->max_register field
  - Fix a missing dependency pointed out by the kernel test robot

Here is version 10 of this series:
  https://lore.kernel.org/lkml/20250726131003.3137282-1-elder@riscstar.com/

Between version 9 and version 10:
  - The #address-cells and #size-cells for the i2c8 DTS node
    were moved into its primary definition in "k1.dtsi".
  - The interrupts property for the i2c8 DTS node was moved
    below its clock-related properties.
  - The status property in the pmic@41 DTS node was dropped.
  - The function that provides the regmap_config structure
    to use was reworked a bit.
  - A new function was added to free the regmap_config
    structure after it's no longer needed.

Here is version 9 of this series:
  https://lore.kernel.org/lkml/20250724202511.499288-1-elder@riscstar.com/

Between version 8 and version 9:
  - The max_config value is always used if it is provided with the
    simple_mfd_data structure.
  - The regmap_config structure used is allocated dynamically if
    necessary; otherwise regmap_config_8r_8v is used.
  - A small duplicated comment is removed

Here is version 8 of this series:
  https://lore.kernel.org/lkml/20250710175107.1280221-1-elder@riscstar.com/

More complete history is available at that link.


Alex Elder (7):
  dt-bindings: mfd: add support the SpacemiT P1 PMIC
  mfd: simple-mfd-i2c: add SpacemiT P1 support
  regulator: spacemit: support SpacemiT P1 regulators
  rtc: spacemit: support the SpacemiT P1 RTC
  riscv: dts: spacemit: enable the i2c8 adapter
  riscv: dts: spacemit: define fixed regulators
  riscv: dts: spacemit: define regulator constraints

 .../devicetree/bindings/mfd/spacemit,p1.yaml  |  86 +++++++++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 135 ++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |   7 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  13 ++
 drivers/mfd/Kconfig                           |  11 ++
 drivers/mfd/simple-mfd-i2c.c                  |  18 ++
 drivers/regulator/Kconfig                     |  13 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 157 ++++++++++++++++
 drivers/rtc/Kconfig                           |  10 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-spacemit-p1.c                 | 167 ++++++++++++++++++
 12 files changed, 619 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/regulator/spacemit-p1.c
 create mode 100644 drivers/rtc/rtc-spacemit-p1.c


base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.48.1

