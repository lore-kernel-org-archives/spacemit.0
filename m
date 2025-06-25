Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41122D4B67
	for <spacemit@lists.linux.dev>; Wed, 25 Jun 2025 16:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869686; cv=none; b=qhbl+aBakSBSJJF4A1IZRPSi52OKKkh0wK6DOnJb6QASW8ezu/U1mStPDLkvRzr1X6oL0woy3V+tu5mI/+p16RVWZBPxCjcaPuGB7AV/H8c83RQfjUQMLe1MsFszI7P+8hXqNLxCXf05FGyyOITiAcyUOuGU0zgHbV21fs1Tv8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869686; c=relaxed/simple;
	bh=J1G4wA185/RC88pABxfSgtgPkiCmT4wLJ8Skkm4M8e4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tGo8N7w5Njj8nr26pJ+NGkN11Z9RblUgaOEIu19GHdG5ihbAqiBoleZlipYfJ0+1aBccuB7RKE2Wggnbd/++ZNrHngbAgmXqW0sizncPLoycaXY+Ubpxdhx7HtIcLm+vH7T67yTMaMGiTyxNk+APkFvP+WUPxzpZQ6ZE3CHCTwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=3fgUkyTu; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="3fgUkyTu"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7d09a17d2f7so4232185a.1
        for <spacemit@lists.linux.dev>; Wed, 25 Jun 2025 09:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750869683; x=1751474483; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tDCKEZvvy/u8mP8K+Ymdr+bMEt+s7GIZAgO/5a0i/oc=;
        b=3fgUkyTuUobTa20i5Q6ZCkhrXMY4+Yeu+PfV7PZclCS47StYfdxGBZiKmSjHuyMDRa
         8wFRFJam96snLAg8qNgMHeT7p4fYGZZe7jqRstt5xrqRbaHmq5GM98vn2s6sphQOsSJw
         z3bwIjqeaQdNHgp6e/msIFB7vraaNi/OIgl3zb7yfcA8sZKTniEQ0V4wyooZUOc2UxDq
         eCaLfOAgcSpGnhVKsloGfxZc5FEW8I3o068YGUgH5oMkaHher2YIAxEXtvkGkDcjEr/F
         iDKOvqyTplVXtRDyb9JOsk1H37BO/b0gmdgdMZuvq0Wzw/wD6+7ovUCRI4RU80cjQ54l
         CLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750869683; x=1751474483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDCKEZvvy/u8mP8K+Ymdr+bMEt+s7GIZAgO/5a0i/oc=;
        b=mvTFzYbDZmZvVIUkGRPdDOsTs58j73MrqhzRiAfpK9rXckoiS/J3M2oe+or+x4jK1g
         whfRQG9SrYGxXMJhN5auyaFzbnRbG+IL5UIt5rk2LWZUwuuuDOn/t0zZECfsQQpTNHdW
         i4Ztqywjo5sZdWolsUx6O3cEEjISy2qdG8IJLZyZyl3/mYE9PijI/wv16b8LrFi/K5e/
         zjblVgNqu6V8fm2qjRIIwrjiTg/584HoQNb/hMqKTWecqkJqFaCufLNLJhjl18GqVZ5+
         LWAHWJj8r5vH0OYa6Mgp3L1WJuJM/dcCg9aihSKb2XrKYABwY7xM37bYl6kR1JE1bx53
         3KSg==
X-Forwarded-Encrypted: i=1; AJvYcCVZh+vXvvcM1QyIWpC3PQ9b94x6nAgPOvoXuwFE3inPWnJoLDubH4Qgxb1ChvaRlVFOK0+j/Bv3XQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxt2jmVDYwIWe965oIluC/wK5fz2HHtWrLgYa7Q/U+RwAnCbArQ
	4l5y8uy2jW9ElgWUYaGKZMyvp8SpDsumuk8c1aMzR/FxsykgNGjnx4G8JwbQWhEgriE=
X-Gm-Gg: ASbGnctWVvC9iRYATlPvSOgGXLb87z+YQwbBLMoQrIIKYAK4daENpkPFbVX3F7e4uJR
	0UKk2/2aCgzEOueAcyeZqZ+uZcRWX54rHgPCu8N/dn9i+SUIq081esQfZqq2m4oNfvDX86O2+ng
	fNtfk2YhGPtqYtEQMKdI4hMwm66iZHez3YPHxecuD/w7HYJnIKo5UoocXdj5SOcBBm3pH0lLVFy
	siBsAJvlJvzgILJTvY0upeaGsbwEDTp16016UkYam1jivaXj7BSEoFbMaJS3f/CbxgLEBg6AXmG
	wN5eF7fjKiEEas4BlLEdDObsERyyZ33e/euQJnxQPFH9QKVfOmRJpXTqcj+QymVyVSrqDQE+01S
	P+q7ALQ8q+ypbH00RtmTSkpTZJQ4qye1u6KVjXetYyd4ksA==
X-Google-Smtp-Source: AGHT+IF0qAzBR+5ebXXveqzmLr/2w4QQCNXjecbTJ4SgCA/yOFBNe+rVWxWjr5FO7bLbStXLn3XERQ==
X-Received: by 2002:a05:620a:40cb:b0:7d3:f1ff:5bac with SMTP id af79cd13be357-7d42972ce65mr495536885a.27.1750869683376;
        Wed, 25 Jun 2025 09:41:23 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3ffdb190esm576783085a.86.2025.06.25.09.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:41:23 -0700 (PDT)
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
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/7] spacemit: introduce P1 PMIC support
Date: Wed, 25 Jun 2025 11:41:11 -0500
Message-ID: <20250625164119.1068842-1-elder@riscstar.com>
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

This version primarily updates the RTC code (in patch 4) based on
review feedback.  It also adds adds a dependency in patch 2, to
ensure the MFD_SIMPLE_MFD_I2C dependencies are met when selected.

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v4

					-Alex
Between version 3 and version 4:
  - I got confirmation from SpacemiT that the RTC hardware does not
    implement the "latch" of registers as documented, and updated the
    RTC code accordingly (looping on read)
  - The RTC set_time() callback now returns an error value if one is
    reported when a regmap write re-enables the RTC
  - Renamed the RTC Kconfig option to be RTC_DRV_SPACEMIT_P1
  - Renamed the RTC source file be "rtc-spacemit-p1.c"
  - Replaced an RTC enumerated type with simple numeric indices
  - A message is no longer reported when devm_rtc_register_device()
    returns an error in the RTC driver
  - CONFIG_MFD_SPACEMIT_P1 now depends on I2C, to avoid a build error
        
Here is version 3 of this series:
  https://lore.kernel.org/linux-rtc/20250622032941.3768912-2-elder@riscstar.com/

Between version 2 and version 3:
  - Removed "spacemit-pmic.c" and updated "simple-mfd-i2c.c" instead
  - Added an RTC driver, so that the MFD has more than one sub-device
  - Other suggestions were directed at "spacemit-pmic.c"

Here is version 2 of this series:
  https://lore.kernel.org/lkml/20250613210150.1468845-1-elder@riscstar.com/

Between version 1 and version 2:
  - Added Reviewed-by tag from Mark Brown to patch 3
  - Implemented suggestions from Vivian Wang:
      - Fixed a typo in the subject line in patch 1
      - Now use module_i2c_driver() for the PMIC driver in patch 2
      - Added MODULE_ALIAS() for both drivers (patches 2 and 3)
      - Defined and used DRV_NAME in both drivers
      - Added additional Kconfig module help text for both drivers

Here is version 1 of this series:
  https://lore.kernel.org/lkml/20250613210150.1468845-1-elder@riscstar.com/

Alex Elder (7):
  dt-bindings: mfd: add support the SpacemiT P1 PMIC
  mfd: simple-mfd-i2c: add SpacemiT P1 support
  regulator: spacemit: support SpacemiT P1 regulators
  rtc: spacemit: support the SpacemiT P1 RTC
  riscv: dts: spacemit: enable the i2c8 adapter
  riscv: dts: spacemit: define fixed regulators
  riscv: dts: spacemit: define regulator constraints

 .../devicetree/bindings/mfd/spacemit,p1.yaml  |  86 +++++++++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 138 ++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |   7 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  11 ++
 drivers/mfd/Kconfig                           |  11 ++
 drivers/mfd/simple-mfd-i2c.c                  |  18 ++
 drivers/regulator/Kconfig                     |  12 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 157 ++++++++++++++++
 drivers/rtc/Kconfig                           |  10 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-spacemit-p1.c                 | 169 ++++++++++++++++++
 12 files changed, 621 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/regulator/spacemit-p1.c
 create mode 100644 drivers/rtc/rtc-spacemit-p1.c


base-commit: 1b152eeca84a02bdb648f16b82ef3394007a9dcf
-- 
2.45.2

