Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB851C69D
	for <spacemit@lists.linux.dev>; Mon, 25 Aug 2025 17:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756142466; cv=none; b=VXkZ5NCjUMf7NnJrGJiJJZHTJwHA93Nv7g/EgC6K9ZJPknxbzB/GIqK8CgSIO86JIwKIlTP2ye6+YzqcnFLIN5G0G5oWTCmpj3YayDl8iIn+YE2a3X0l9+ueRWkEwhIw7MGWcL7Lgqxdh1KXb3dPwB4ugTElkM1xrq+pcEIwqcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756142466; c=relaxed/simple;
	bh=8IHNa3wGOkuku/yrDfSD79eMMOR/6n7gdQo3uiC1fi4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B4o1rafPzf8xwqUzkRrtyaPeMF69cm4wsALQmr3rZ8XsWW6S0MqdyWhDuUXDLAY4bvg6lf5I+fQPznMOngn0KlLmg4sALOkK2TsVbdjch5l+ac3dRHp+ijApqQMQguigkzcY1aGmTQSMOspBbtxwZliZipcPKhc4URUlY7L5fHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=zjLRt1In; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="zjLRt1In"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-8844ee2cb61so124348139f.2
        for <spacemit@lists.linux.dev>; Mon, 25 Aug 2025 10:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1756142463; x=1756747263; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CDRNDuzfDsv2nazycUSggd95+r+QXZLBa3yNf0OnFtg=;
        b=zjLRt1InWfJsmrfLE4Dy67aN1z0GusGj3eTknMMlcx50bcmLT8PG9iiaxfzq38d7ot
         zReJT/PQEOQcDq3yGzIy6cidYLnXslQBm7hsexTfgWXD/jzvBwSbDLQheOkXbA7JLCao
         qFKfjk5yomZDeu2FfsJCz8rIgWYwhf8Ls1hDWwgArZK00GJRziBlgoRrPFq/qOQGYLO+
         rpM37V9panX4tZQLY5rP3oX6LFL6ilb9JR18AurzG27TPfbkTRS/Z8cs6ZU5wCk+d4Fs
         iBSF1ZjZTOLFB/Hp90ve66rus/aS35U9PGXckB0s3U+xnMZoKdbAo0zErsPYdHp9yVJx
         rroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756142463; x=1756747263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CDRNDuzfDsv2nazycUSggd95+r+QXZLBa3yNf0OnFtg=;
        b=IN3GSsHGysp+/aDDMKRFkhHArGW2c18z7QQCeM+ltn4cjPN5TgAPyvyDl75iRR/wzJ
         9bnqxFHu8qz9umq0HegSV3fBxy51X8qEx0mbOk2ngqi+6LbrUVG6Do3VcmqoUmnoBEOf
         fRv7kitEvuQdNKDbgRxIo63oBE1NEt8OvGa4/a3fip92nOhts2DLPvgyAoC3W3PqBLPM
         eZt/ZHV6FQCJXSrS5pifTL2it734sa4KJz30AlYsdheO4icUzSvV83sFNqtXB7jtRGSa
         tR1S/hOrbx11xStl3Hxl0Seof5cgCENf0qYuDqeH78TrC1VSZ5BmkKDnpcCs+TlfRAFi
         9p1g==
X-Forwarded-Encrypted: i=1; AJvYcCX6p1M0FswkvkDeHgzvb44+v4kC0bjuNW1RV+J6TyR9YdOW5DLhflNtg87XJvLskuX/1pOFUJpQUg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzsywghb5MmEJ6JM3dW/t3y2gXC414yEY9YlUmxCrI8wpPaJPdF
	x2uFuu1l/8KoccIkJcFGhNKg6cu5X4cNaR7GbJX2qrBwSmDliM815w9jTEfhnqRnl14=
X-Gm-Gg: ASbGnctIcjeTv0Wp2Oz1TV2JZvMK8Qhxr9X/qKzS657MQg7v6aD6V3FP5Qy8MfCQXX9
	hZuvr5WpsOcA7lofltfQlcGpXmr0j1TYBq6H9rA4r6gHEKJW0DRprNR3uzqLikeHT7vG5HgkIJk
	HwcFZegjtnb+o+eACBjIPnnUrD/6njCPXowW1m+KCjC/PaS7+4Ay0VTOxQCl5PyrupspiDIp7IU
	nK5oNColItI7AqXAIL9OSh1ZXV2JtnLEulj+VllnHYqjpcgmDIdc4ZOeE/sA/ZLATT1LwnAJhxC
	7hbxMyxkzJKq75gmcN+H4hTDm375zlLkrmbIdg924X6wvJE4RvN2ASCozkt6LnEAgi1lJ9KCdV5
	4kCHDbDgWMCbOTGLlUQ6p1e+TtxsQKhQ4AR+I4P37vf6z7ACuq7PMDRRlAE+CLEPjwg==
X-Google-Smtp-Source: AGHT+IGEzPSBz+bPlXOat9c0EsPU9K3GuEWngl1Fa2CoYcKOTcciz21i7xthvFdDRasSvDgUl27o7w==
X-Received: by 2002:a05:6602:6d1b:b0:881:659f:cd59 with SMTP id ca18e2360f4ac-886bd1313a9mr2196495139f.5.1756142462660;
        Mon, 25 Aug 2025 10:21:02 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-886e60c4737sm76275439f.26.2025.08.25.10.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:21:02 -0700 (PDT)
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
Subject: [PATCH v13 0/7] spacemit: introduce P1 PMIC support
Date: Mon, 25 Aug 2025 12:20:49 -0500
Message-ID: <20250825172057.163883-1-elder@riscstar.com>
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

In this version I updated Troy Mitchell's e-mail address, and
modified the definition of the MFD_SPACEMIT_P1 config option so
it enables I2C_K1, to allow it to be usable.  The series is now
based on net-next rather than linux-v6.17-rc1.

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v13

Between version 12 and version 13:
  - Rebased onto August 25 linux-next
  - Updated Troy Mitchell's e-mail address in patch 1
  - Add Troy Mitchell's Acked-by in patch 1
  - In patch 2, have MFD_SPACEMIT_P1 select I2C_K1 and depend on
    ARCH_SPACEMIT as suggested (privately) by Yixun Lan

Here is version 12 of this series:
  https://lore.kernel.org/lkml/20250813024509.2325988-1-elder@riscstar.com/

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
 drivers/mfd/Kconfig                           |  13 ++
 drivers/mfd/simple-mfd-i2c.c                  |  17 ++
 drivers/regulator/Kconfig                     |  13 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 157 ++++++++++++++++
 drivers/rtc/Kconfig                           |  10 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-spacemit-p1.c                 | 167 ++++++++++++++++++
 12 files changed, 620 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/regulator/spacemit-p1.c
 create mode 100644 drivers/rtc/rtc-spacemit-p1.c


base-commit: 6c68f4c0a147c025ae0b25fab688c7c47964a02f
-- 
2.48.1

