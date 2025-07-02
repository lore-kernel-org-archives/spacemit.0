Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D489523BF91
	for <spacemit@lists.linux.dev>; Wed,  2 Jul 2025 21:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751492228; cv=none; b=FGxlzsjv324CuuYh3G0TYerP2q1MrMwWzJmWAcgf1A/S4HenEWGl8DNroegCU7DxXhWmgKp7rnDaubvhZnCgeQCo0QR3t07XkCeT0KFwKLemG5sOebyrwlByd+qJKTEW9vVk4crffN9G3jv9CXc+ir2Mehteo+HhSKNOeklzhcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751492228; c=relaxed/simple;
	bh=9zyhz4ntHJdI/jrj1j/VNTF3enbDJI0+6GNjK+mitZw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RJ6GV1v9W3EIZceTkVrbpVmll7rgZ378nnAuQtmYsPuJtzv4aPC4YncxXYFEzFxqkuM99/wCqPqCrkJpUiDLpVhQvVp/W8bUQvvUwy7sNRCilG2UZCIjlGibDSqJZ1IDoC5SeRN3Fo4c7soIY1g3qprOsG28AnjxgDLS8lpFlG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=tqXIWN+1; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="tqXIWN+1"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6fb0eb0f0fbso4509706d6.1
        for <spacemit@lists.linux.dev>; Wed, 02 Jul 2025 14:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751492224; x=1752097024; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vCk4qTQ1xZrDDch6I+2pDpmgEt4recKLbuT/8JykNnk=;
        b=tqXIWN+1i57kcxBiJyX6x+cnocSApJSjTBFrcCaDfylVeDMjYvQrcKefyhvvcdXnsL
         7QwpZX3FVFn3ZrsQ50pCqWNt6BA1j2afTX/t2U/HsWyne5/YKJVYlOLnoabHIufHfxft
         lwTiSgY/UYejLo0b1TPtYMYCNxUkV/jwuV1/Gg88S0gUhOLW1g6lehxhjwXWvjhft7bc
         jsqnKp3ryIYUzcqpIMjQZmXJZQbEWmKjtcL1ne4sTyYcVW4+MXClfQLNpWzy3hJe1xyM
         udzVX+ULCxjJecpkuUU8nZIQgSqyZprHCKsbb+mFDNylNLl1vWk74VjMQEKQiG3KVDjB
         StIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751492224; x=1752097024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vCk4qTQ1xZrDDch6I+2pDpmgEt4recKLbuT/8JykNnk=;
        b=BWG7h2qB+4bEgDt4MZYnlrchST0zl10FVMcxza3y8MPGFvO0jN9aS56lOF659KOS0f
         zpdzL8wX06QyA9ovbv8nIWY/iKk2DPdCN9XL1w4V6fOjUsee+F/UwhXFTxR61bhJ82xh
         Zxg9I/s8iJdbQgUxWXDJ8fEiMjRh1JYnlUltmjOW41cJUfmEG//g13+nhJBUXXph/UQf
         R+mfRGQjTELfqdRPPV/A9u0ZYemB38FOoncHuqNYYdIjKI/dynxXBWQiVnlA6/s9c+jf
         SfzYDc4deDKdHUFODrKesB4UEsD28q8KWaE9txnFWRSzJE+qyRelJHxL8Qh0QM+wNweP
         ZwtA==
X-Forwarded-Encrypted: i=1; AJvYcCVUFNziZRyO0pfhVybOtbMgOCXy+Y8bH3OjuRl0ip/d+rD2Tr27urDJtbZbMpCiiz3OyCnvtcljpw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyesHWfNampK6KybC+5GIBl7TqxlheY4LDPOodyusWf7cuyfb7Q
	QYSc+qift/+enETThGavfKCmKxDw2jscjnTGnOvkqh5APO7z+/yZ6hvHP7TFuF8nzjE=
X-Gm-Gg: ASbGncv2eAYsMEJnKlh7szDCDt63VA6HOyUjbpLUrcGUGdJ8pAo7MTdKHaMdbN9cXcD
	rOcJ+bT3z/wYN0asG63PQwzCvQb6d3LfDt1WNx7pgqxzAyOj4PRZ+LKor+x6bf9MIPcRcx1HR4Q
	sa9W3snjwS7cpNxKZXGCAyvM1hZF8AuOBLgoN9qdgL4eSSHY6MU9Vqo+hLQQITPv9gASCTV1vzE
	rXToCbwt/xbr5Ngwozjrp37JbOw3NQqyd2r4aCaWioPYQqWKdF/fPHqsJAz3d4Qg7IAsroZZ22S
	b887qptRIaBYbTMsnHsbP2AeaT8GXMn1aZFcoBvzJ7hd6kyeQh04npjhorvyLe5U41P5niTe4FT
	FknelpEsdg7xRQ23iReSRm2xTjxmW0WmWLrQ=
X-Google-Smtp-Source: AGHT+IHErTJvMvE1TJ0g2EYv2CvrFgib6KyBFStvjCoRfS+zf5ffaS+AtP1I5+t4S6JkJyQfcGlk2A==
X-Received: by 2002:a05:6214:4107:b0:6fa:fc4b:8ea7 with SMTP id 6a1803df08f44-702bc4a73acmr16126856d6.21.1751492223736;
        Wed, 02 Jul 2025 14:37:03 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771bc01bsm105691746d6.40.2025.07.02.14.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 14:37:03 -0700 (PDT)
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
Subject: [PATCH v7 0/8] spacemit: introduce P1 PMIC support
Date: Wed,  2 Jul 2025 16:36:49 -0500
Message-ID: <20250702213658.545163-1-elder@riscstar.com>
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

In v6, a new patch was added to change the simple MFD driver to
allow the regmap max_register value in the simple MFD configuration.
However it also removed the option of specifying a "full" regmap
configuration, and that was not what Lee Jones actually wanted.

This version adds the max_register option, but also retains the
ability to supply a full regmap config.  (If both are specified,
the max_register value is ignored.)

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v7

Between version 5 and version 6:
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
 drivers/mfd/simple-mfd-i2c.c                  |  27 ++-
 drivers/mfd/simple-mfd-i2c.h                  |   1 +
 drivers/regulator/Kconfig                     |  12 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 157 ++++++++++++++++
 drivers/rtc/Kconfig                           |  10 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-spacemit-p1.c                 | 167 ++++++++++++++++++
 13 files changed, 626 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/regulator/spacemit-p1.c
 create mode 100644 drivers/rtc/rtc-spacemit-p1.c


base-commit: 50c8770a42faf8b1c7abe93e7c114337f580a97d
-- 
2.45.2

