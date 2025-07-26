Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A49C243378
	for <spacemit@lists.linux.dev>; Sat, 26 Jul 2025 13:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753535411; cv=none; b=UzRU0i8gYQiVvQETHKJfTuJedxDXtzMNxO+qk6P2j6LhFoorEz+W2hirPsjcDtBXu9JBgz9jhRJFqXOIeMHWti68J99c0dLw/8vK8e9V3ED091UWVS418DY8Ab0FhIUh6lqdi8xpjHz84ykA5Mymc9Wqg/OvzUv2qPcr3fOQKts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753535411; c=relaxed/simple;
	bh=GinK2LgXnAvt94YlnbDGugt3giCGnbBrlxqZ8J1oEgo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=axrLtIE8VfMdY59bv9NK3yUlxsiwgiZ6SvPP59cgdYYHkTMngDTezy8NDmWHMuCm96vTtunDNx9vHnLlyFZ6ADUXZrk08FfDgx0c5xfi5t7IVGx7xmckM4zjUHJqHWa5Fkqg8u0GAM51rcW4ATLWZg7BPj7XsPsoxlS0nmw5sNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=xtQmb1cN; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="xtQmb1cN"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-86cdb330b48so175199139f.0
        for <spacemit@lists.linux.dev>; Sat, 26 Jul 2025 06:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753535408; x=1754140208; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MYc/mcd7ReJMM0Lef/+R1Ouv9sDF5M6QV2+DoYGQnmU=;
        b=xtQmb1cN7bIOvxlJ46dOhzciY0iSV2UYQA16aD+s+pJtyYp/xK+muYxbUvPyrewtRe
         ux0GBiD4YC227edv6hAxe093B3wLXiYChzHX3qCjxEW2Mt6yYxf0m5IeDB12m4r1bmyt
         qQID8TMZP1VcmQTrxVhKgWzGspbE5ry0BfKloyj5AqLscYZLflSbGbjm+zER6h7/sss4
         i44+87Wwuaz61kfeVi1wvgDY8/l9xaUowP9SNYI1H9UFcLUEjNbve68ncA9iWfnso/2L
         wqagLCj8ADY9lBRRGvJ/tz9MChcZ2in+dcy2WFVJ2QyKBRrj+IxvfzrFoBskP3QF8X8e
         zKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753535408; x=1754140208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYc/mcd7ReJMM0Lef/+R1Ouv9sDF5M6QV2+DoYGQnmU=;
        b=EWFyPu6Ne0uHCAUnS/FJEWSRyakwWTaDcZKZr9no2l5/hKLKbPlQZQ1EALV9CVqznh
         qTGzrSblkRf7Dq/JWYnPbsqvaZYUbl428/YnYOH6b2otgP8DhCu6t+gtoZGfXeAF7aw9
         KUUjmzVqf2Nb6UyKB0c2NzB47yZKBIxTCTI6fR1ZHUc3Yzjt+GJNv6hPxBCjN/ARLrf5
         UDpCT78yqJa6wiDqj6u4nwB7zU/KNvhkdB1ukUlZTx6Qm3WRlEd15aWUXKgEwIUPAGhG
         JXeBMWgMYsYYzyEFgKA1VN7NzS1jDBz5sWEz4Y/nv9fkp0umc2NjtSqbG6oj9nfvrruY
         /Jaw==
X-Forwarded-Encrypted: i=1; AJvYcCWGq0xYuf09c/sKQZvTrcA8XbN5Nnb7SAl2oSEc92cgP8W0DSj4oyaiLGn5xW/cCkgemg7noi72/w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYXJLxiGFxt3Klv6r3KPcbir8eEW1ErVz3S6WlSYBz1TG6IX51
	4Q9eFfp1b32gsLq8xd4wamhcBPgJsZDiSvn4DzSkG35BSv+LeiRlbWhBu82vf8hHs4g=
X-Gm-Gg: ASbGncsI8MXcdG4auFgbrWDZLGXbpf5aK2M5JF+dGaGoOaQnHydmwZ9MeoY1Wr/C7qt
	k+ugBVW0QLw58KVQiiugO7pd4zENyfuDTuOwWH4Unxj6seDe9M6rbqOQs7I0kK1skvPwkS5C0bE
	Zrut1mWY6VOenxav18gVmngF8YPZ/JoJS5I3Wx41Sl8OPGrkaq1SnBG27y72zdDdwLtC/1EbUCU
	bgm73ltGd2MiK5/scWTdIS2qktAUCBdsO/7OtC+K6AHfls2jHk1qgKq9k7Xi71oqRc8vMFJrPfV
	j4vLBfjWnUUTB8EoDxAwyft+29th+haS7pw3Am6Od7TTlgB1Mg9uvUHfciBiWAMjmVuRi7XgzoD
	HOavLn/ovKsERIsRf1Lkwe6ikEn4QCC19JSYH4C3RefyCzlk/UJ6czcl6KZI9kCEEiQ==
X-Google-Smtp-Source: AGHT+IEVMqsRYx/eZWJrDGuA6CkNio+e8WgeHMt6w0uQJD0Qdm/zWA6Cch8r5o09n+huHNyuFFJcMQ==
X-Received: by 2002:a05:6602:2c85:b0:87c:4609:d10a with SMTP id ca18e2360f4ac-88022aa5b32mr1018565339f.9.1753535408253;
        Sat, 26 Jul 2025 06:10:08 -0700 (PDT)
Received: from zippy.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-880f7a4ee9fsm49551439f.33.2025.07.26.06.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 06:10:07 -0700 (PDT)
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
Subject: [PATCH v10 0/8] spacemit: introduce P1 PMIC support
Date: Sat, 26 Jul 2025 08:09:54 -0500
Message-ID: <20250726131003.3137282-1-elder@riscstar.com>
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

This series introduces a multifunction driver for the P1 PMIC as well
as drivers for its regulators and RTC.

This version makes a few minor changes to DTS files suggested by
Yixun Lan.  It also reworks the function that determines the
regmap_config structure to use, and adds a function that frees
that structure when it's no longer needed (if it was dynamically
allocated).

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v10

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
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 135 ++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |   7 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  13 ++
 drivers/mfd/Kconfig                           |  11 ++
 drivers/mfd/simple-mfd-i2c.c                  |  57 +++++-
 drivers/mfd/simple-mfd-i2c.h                  |   5 +-
 drivers/regulator/Kconfig                     |  12 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 157 ++++++++++++++++
 drivers/rtc/Kconfig                           |  10 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-spacemit-p1.c                 | 167 ++++++++++++++++++
 13 files changed, 653 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/regulator/spacemit-p1.c
 create mode 100644 drivers/rtc/rtc-spacemit-p1.c


base-commit: d7af19298454ed155f5cf67201a70f5cf836c842
-- 
2.48.1

