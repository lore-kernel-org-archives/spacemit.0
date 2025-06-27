Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1052E2663
	for <spacemit@lists.linux.dev>; Fri, 27 Jun 2025 14:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034195; cv=none; b=VonBZrksRuPU27ZE2wn4Yy8bZpA0EkigeTMZvhpNdKwMMpu/qsKGj4wRY55Ss57MCxqgbzSYzovT7FCYri9PzKhrfcB5gTGpc+k1GIUEHwPrIOGtI/kkf1/JDgfRLq2/PzvopmJXxepoEbmVBxK/FN9llum9ozw78UFpa4xU7T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034195; c=relaxed/simple;
	bh=9jXWU2dNETFNQehlpjPu6e0VDdTp9Tr5HNt485rVJMs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=km3/db1w3YcgXkr1kw1N34Izh7trc+TRh1BA3IA19Pl3dziYVvsaC1Ho8m4cv5Awl/ATEriqMNrWkEBFjHGhblsEHOSonooZnYKtk8wLoScsFja0+XvKE4if66hV4KCtr9sZJG5yULmCrg2mnB1SaKo+dS2X/rxd9weHpH1GQdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=TDma91Ip; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="TDma91Ip"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fadb9a0325so20083226d6.2
        for <spacemit@lists.linux.dev>; Fri, 27 Jun 2025 07:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751034192; x=1751638992; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xyZq4ZAe7ICNNo6naMBuUx3eFwikmrrS2wObQQXZubE=;
        b=TDma91IpBf3UqFp3z5G4gRzvj2yAs6ZnFNhL64ShwzKBBk21iQWu82/tmd2Jm/DClY
         tW2n0AMEVw7ADJNT9v4YoA4TMMsEG++4XaMZFrt5rJS15hkWXJL4Q/oO7UJOH/hIpGPh
         2i3bn2+LRrdHn/430SQdwAn3zI+DjqAj8/iOOhsJhXhKrm1TB+b9js1uTobKoZ8bE0LJ
         /e2QIFcmJVH5/e9F9oHeVbsxOT+kKFgALaT55DK5UiEFUHV+TJvjoOPtwXb3A3/EJ9mk
         CmbeUI0oyP90Dtg/OX/q7HtYbWyyz4BYRsBMi+U0RFwI6CJ9iac61/j4Pg5fne/LEEnN
         mlxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034192; x=1751638992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xyZq4ZAe7ICNNo6naMBuUx3eFwikmrrS2wObQQXZubE=;
        b=I4r3e7sW+2+25EW6BSGLtgJmqcOYegxEsid/oEY7WzmBR37Df+2DBwwdiZM8B5QLMF
         c5E1/hNfsT/umZBn+Z52RRxuaKHu+Kxau+PQ/wnFgbmRXwjo6C8xLf9K238naE5d4c4u
         UhmmYnM+brSdFmypG/NpesFRzg7Z5M6Ah4CwCGIjWNnnlg8LYyn1owyAwxMtCAuKVjr8
         Z0LHy/4iViCwzWNmJZJhwzYHBW/kSyUSvLrK+Cav3lq57BKrpIkQ6groe9aUBiUdOqlG
         gVDtB3NjL5EssBcjptb5wZlJIyo1+VTzuiEeJrffJuy7xEpD49NGV2GwRf0z9PBK0a7L
         MnSA==
X-Forwarded-Encrypted: i=1; AJvYcCVkqCDvBvy8luWOiFf2uteqpoftyQJ6zZ5GHgAI2f4XOUGYZVHDXe8GhlWTmoQQ+Ua3Xrazq58JRg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3DSGa/rqBas57fHfh9/DKqk0/MJFdo7SOIvJf+WhDLKP9J63N
	nMkiK0pejX/LW9RnzZrMuMO1qB/PAz0ZgOblmIzPLOG7GYAHQQuDIeHaZcTp48+hHxs=
X-Gm-Gg: ASbGncs4QRgW0y4/Gv8BoiUjNzgM2SscmE+xT+GJRfPKTLY1672UEQSC5ta+E3p5vFy
	KX7Z5CPq8yO9bmlmnjEhd8jf5loW9N8CRQtY6iVWneK/CRHGrEGgCXIhrZobzsZK8A40rdrbZ6N
	h10NS/GMh+zDDmdQzklvauDgsQ/s6VyXdrbTebb2ul20pyp/7oEwk8SI5xtb7jpxHjF+4T1CPXm
	qDFm0U2KVNFlJkl018vP4W+Bt1UaZmlMyX6/k5AFwzl7lJHJW6qQOucR0ihUEc4bj1bSppdrEsz
	SmU9CVCkIjgmR008emIUUrOfulwAq5l4XgZkU5hP8WEl9HLBwcjZ5dwdJMk5NyX03StCtL4alSc
	L8shax9Nxp8HUoSLKxn9armtfL4Vjbhuxj5w=
X-Google-Smtp-Source: AGHT+IHDtikB0oMUAvmWbAoxLBUqg4pB9xk/P6eVhjckLobTee+bJmH7aBt6iZAeNjzgw6e4ZS5Fcg==
X-Received: by 2002:a05:6214:2e43:b0:6fb:6114:1034 with SMTP id 6a1803df08f44-700131c4812mr68071916d6.39.1751034192321;
        Fri, 27 Jun 2025 07:23:12 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44323b4c4sm135708785a.106.2025.06.27.07.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:23:11 -0700 (PDT)
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
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/8] spacemit: introduce P1 PMIC support
Date: Fri, 27 Jun 2025 09:22:59 -0500
Message-ID: <20250627142309.1444135-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
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

This series introduces a multifunction driver for the P1 PMIC as well
as drivers for its regulators and RTC.

This version adds a new patch to change the simple MFD driver as
suggested by Lee Jones.  Rather than specifying a full regmap config
for each simple MFD, specify the max_register value desired in the
simple_mfd_data structure.  That supports all existing devices (which
don't use the regmap_config option), as well as the SpacemiT P1
(which specifies the max_register).

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v6

Between version 5 and version 6:
  - Added Rob Herring's reviewed-by to patch 1
  - Add the simple MFD functionality suggested by Lee Jones
  - Update patch 3 (previously 2) accordingly

Here is version 5 of this series:
  https://lore.kernel.org/lkml/20250625164119.1068842-1-elder@riscstar.com/

Between version 4 and version 5:
  - Only check the seconds register for change when looping on read
  - Return without re-enabling the RTC if writing registers fails
  - If the RTC is disabled when reading, return an error

Here is version 4 of this series:
  https://lore.kernel.org/lkml/20250625164119.1068842-1-elder@riscstar.com/

More complete history is available at that link.

Alex Elder (8):
  dt-bindings: mfd: add support the SpacemiT P1 PMIC
  mfd: simple-mfd-i2c: specify max_register
  mfd: simple-mfd-i2c: add SpacemiT P1 support
  regulator: spacemit: support SpacemiT P1 regulators
  rtc: spacemit: support the SpacemiT P1 RTC
  riscv: dts: spacemit: enable the i2c8 adapter
  riscv: dts: spacemit: define fixed regulators
  riscv: dts: spacemit: define regulator constraints

 .../devicetree/bindings/mfd/spacemit,p1.yaml  |  86 +++++++++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 138 +++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |   7 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  11 ++
 drivers/mfd/Kconfig                           |  11 ++
 drivers/mfd/simple-mfd-i2c.c                  |  30 ++--
 drivers/mfd/simple-mfd-i2c.h                  |   2 +-
 drivers/regulator/Kconfig                     |  12 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 157 ++++++++++++++++
 drivers/rtc/Kconfig                           |  10 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-spacemit-p1.c                 | 167 ++++++++++++++++++
 13 files changed, 620 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/regulator/spacemit-p1.c
 create mode 100644 drivers/rtc/rtc-spacemit-p1.c


base-commit: 2aeda9592360c200085898a258c4754bfe879921
-- 
2.45.2

