Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356382F0C72
	for <spacemit@lists.linux.dev>; Thu, 10 Jul 2025 17:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169875; cv=none; b=cc9fXJ6R+zxvh2/AYWipZ11ekMs34dUNOANHd7an1oNyay22o6ax1kUDjng3ISJT6jLwjLwsKxmHZqB2HRL7egJ5hFnhd/0eIYVb6DMsCdG2Ea4Nc70FIVWteAV3J5jsuEOQ2S7uv15/SUSFHPTO3SimsV7vsJOCHqkyvoyboyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169875; c=relaxed/simple;
	bh=W2j6rcWF6RbIU1CU28XWFfVkhL/GZ6rbaJ6hA12lgXs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n2/lBRWyzAjuCpMVk7txktlkUzLzvXQiXkLxjKp2C9Xayy9uvJ2lmoJO12moPjnTEgAARvqBL4ynYyTv/yuWXhsprFfO1jZrW3ueJrNvmFnpVGHcBuX25aS4pRPT2EYKS+8vhwmDVc5qhLz55eiCVdt977CUq2p7Op66pZUK11E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=fv5oPGcZ; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="fv5oPGcZ"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4a9b09ba106so14216761cf.2
        for <spacemit@lists.linux.dev>; Thu, 10 Jul 2025 10:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752169871; x=1752774671; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JNMqoqzDLeOgTO7xvZUUvwlywxm/pgloUgJcLaLBW1w=;
        b=fv5oPGcZrjpM/hOuBOAYYMsmHAdQNEbAJR71QO6A506m/5loPZFfyPZwSEN6weTcNu
         TaWVKDu589RUvOwTxqrnUuLYC9YWRdIeMwTzvy982Fauahzk3X76Wcpb9wm0CBM0p5yU
         PTqRAMtdQuSKQqCazEeHRk9CzOkHWs05xBsS2Cl+3gf2UqdmMVlL5V4xayvu9mo25+c/
         xMdQ/Jo6DOPLT7BWb7DOQMXklm0kgeeTDMuM/sWh0YaXZDnmJrGUmkE3/hatA34Q1kSL
         vYWHj65fb5xkmOtbek+sIXMPq/XCN0mqtzm7Gg/GxP65E3uTfCLg7/gJFDdwB20LXDEg
         2zJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169871; x=1752774671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JNMqoqzDLeOgTO7xvZUUvwlywxm/pgloUgJcLaLBW1w=;
        b=DdHg8tah8Fbcs7Hnv+5u/ew71tj3BYSHsf0fCWzqkQwrrWdVaxUCH7r/xI3bq7QptG
         7Kyv/54DFlb/mHiPr6sLA5vbCdB/CDL/YH2feVCzEdKy8s6LHgOyOWtb3yGNyAUndl2C
         S04/qQEfxw0RdozU0MVATXLYpN6ktwsA0TJr7FADzl9r+BuXB5whLaDmOjcGxSG/uhij
         yuLb+X5OWy1CuXbML70y9PFS0NQqc6u9NHj6xb5gIqSBoivOVG2HppI4eCgtxdrQRNC1
         bocmneh2hA2Eozm7KPbACzzLIY8Limf3y73UVXPWDKDLNr4vpBT63mqZUJ4E4iPZFl7G
         kygw==
X-Forwarded-Encrypted: i=1; AJvYcCVtyA/MMA9QvLJzvC3gYQxNCvN7AwGaGQLa/+CzXr/1KQPi1Wz91AdcOzNVeK64xAji02k4kq1MCg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyLTtFAMv3x/++su6u4Vm0R9j+b04enzyBmL+gU++XQYTU7OHh5
	3syRuVrUBFpFdM74CVxe53+VnqAOQ1ffquo+M9cENH50QVCSaP/+CyTI4fPUTklf44o=
X-Gm-Gg: ASbGncvrBgc/hu5xoveD8qnA08QpT7F4Mfn2LG5CbSN8D0kp2vJx2TN7WIlGVqiXnnr
	Klwext00CuKlNNJFcQzkTLOtN3nS7MOWTM2sntz6r8DbU+jIV0IdGdTSPYjQ5JS7qsQNtqKqvUu
	Xon3bQzCWL/BdszkD82olhCKBvzI+/N4AQyxCarxmcs4X8VPuASBDAwTq4jcIf/+2I+BHAh+pQg
	UgAOrtFHtViLVQqq4msdkkMo3x8Ni3wXxP64aT4G4UbPwNAH5LNfSxdMoPbVIhuB5e+jctjIVn6
	lIktr5xenRbStGdjFjkS2Jh7rJceGJinMP6+KVT7W5a27TFsvmm7sf3HRQQNLCeaZun3+QXxCu6
	Hxvkt5CexukufZJ+O05EHWKAr9j3IX1pFPno=
X-Google-Smtp-Source: AGHT+IFI/jmo2fMFePpFAuOhqVGzgvVfNMFnzvNUuKjn8MCsLC2IQtc9MHCE70TXETEly/c6N52yZg==
X-Received: by 2002:a05:622a:28e:b0:477:c04:b512 with SMTP id d75a77b69052e-4a9fb89853amr5290841cf.16.1752169870948;
        Thu, 10 Jul 2025 10:51:10 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee300sm11165941cf.73.2025.07.10.10.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:51:10 -0700 (PDT)
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
Subject: [PATCH v8 0/8] spacemit: introduce P1 PMIC support
Date: Thu, 10 Jul 2025 12:50:58 -0500
Message-ID: <20250710175107.1280221-1-elder@riscstar.com>
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

Version 7 provided the ability in "simple-mfd-i2c.c" to specify the
max_register value for the regmap configuration as an alternative
to providing a "full" regmap structure.  The max_register value is
ignored if a regmap_config is also supplied in simple_mfd_data.

Lee Jones felt the logic in v7 was more complex than it needed to
be, and suggested removing the const qualifier from the global
regmap_config structure used by default.

This version does what Lee suggested, and the logic is indeed
simpler.  However in order to avoid compile warnings the const
qualifier was removed from other places as well.  (Checkpatch
even complains about this.)

Frankly I think my original solution--which simply used the
existing ability to provide a regmap_config structure--was the
best (version 5 of the series is done this way).  I don't think
adding simple_mfd_data->max_register provides real benefit.
  https://lore.kernel.org/lkml/20250625164119.1068842-1-elder@riscstar.com/

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v8

Between version 7 and version 8:
  - Change the global regmap_config to not be const in patch 2.

Here is version 7 of this series:
  https://lore.kernel.org/lkml/20250702213658.545163-1-elder@riscstar.com/
  
Between version 6 and version 7:
  - Revise patch 2 to preserve the option to provide a full regmap config

Here is version 6 of this series:
  https://lore.kernel.org/lkml/20250627142309.1444135-1-elder@riscstar.com/

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
 drivers/mfd/simple-mfd-i2c.c                  |  20 ++-
 drivers/mfd/simple-mfd-i2c.h                  |   3 +-
 drivers/regulator/Kconfig                     |  12 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 157 ++++++++++++++++
 drivers/rtc/Kconfig                           |  10 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-spacemit-p1.c                 | 167 ++++++++++++++++++
 13 files changed, 621 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/regulator/spacemit-p1.c
 create mode 100644 drivers/rtc/rtc-spacemit-p1.c


base-commit: b551c4e2a98a177a06148cf16505643cd2108386
-- 
2.45.2

