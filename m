Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB01253939
	for <spacemit@lists.linux.dev>; Thu, 19 Jun 2025 13:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750341118; cv=none; b=mIKGiYXao/LIns4NTgzf0ou7cmJSPrurnbDm2oJW5Tk89OETOFtYdkl9LEo4fhL0Kuych+bGQRhDH7ZUOlFXV3zrPf5ttP7iK8FOHAyJcfPQ/E7cYODx90iLaqL/uKO/TNMmW6RpEyVlijvdhGXua0l0ixDMPuPql1G2aYtvAKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750341118; c=relaxed/simple;
	bh=pz9rugOFzrRuRoXAnRvW6ba1xJ5wAStNuPyS+4gVoGo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ap2h5mVRrHZj4ymJFs4t0lB23Ax6pV0P7o2gXT5FsYEtp0enlCnmV0RVotWytTLFLsBPxQDie/VULWsyG7O4N4hw1yHVyIDlcgMKkCHA5TNsBaCp4G/dmFaBbWiypkVaO8SeqmevYd7s0WG8KE0aFkEbzNI6AGqCQGBi4So+wxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ePAwQXHp; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ePAwQXHp"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3ddd6f2d911so2851465ab.2
        for <spacemit@lists.linux.dev>; Thu, 19 Jun 2025 06:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750341115; x=1750945915; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E4/kRfI7GtIIigr3/HBRf4Is34RYmI+DLhB76yDRywQ=;
        b=ePAwQXHpCAhcmPojVwEMsmY1iyMAHAAXHCtmjuBb5dWOhDtkOv4pz57siiaIsu30yp
         iBSTwt50qZLXiJqViaPyhvjNKccJ9YQlQz+BUDIMVu8GmjKHNq4F2cF8p/9NSiGmhCdq
         2kPLYfA/yw0lBiY0cHGdHgK3WhE9H4cd+B4svGUMuo3WSo/w52YbRas33qvdP8a+NtGO
         Bcs5ShAkJOlnerGRHCbnlTiyuUJT0B2aOGKmPA5LY9Vp35deB/cR+TyC18eFo8WM8rRe
         PjHaQVkhQyIXaSTTudL81ZqBRpyb2Dc1S1ioArubAKBUcygTLreFE5SV+ggVxr1Q4W4n
         pj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750341115; x=1750945915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E4/kRfI7GtIIigr3/HBRf4Is34RYmI+DLhB76yDRywQ=;
        b=YJWvHCHnAEXedgQovbiQN5H1h4qpnwJ7TK/eM3Tl4/JyAN1ILasLZsQpOP37JBpdsJ
         sYTTUpj+ZnbuFlT5gEjr2vkY0NYXssg1ZJMeQ5UIFsqLhm17UrH98Ol9WpwCRRDwM4e1
         pNhsbsYdYMTn8o1JIYzlySJdP7CkqEYIK1jlSOnKn9k81DnVHt97Xt8z1j/SvAp2WtTj
         uT8w/jgCPZs/xMD+DLOHa7TfKiSmQtpd36KhGKrfpIbS+6vEjyi0ja3JvedrtE8H6bSt
         n7GKMxgVgQetlXg0ttaSRjrTuF8oN9eEa8knze6vylqu94Vc7kGiw9pr2HrIsPRWoDNZ
         OnzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeu0rrVMYuU7zySa5MfQKLuRsTc0CJUaVoXWrfD12U7SBWiu3srBxV481QiIiJf65qIZ+bKtxMmw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwoNpfTFu2woHVE7NA38hj+1S0KdWK3oUQXJEa5PYk3vc8mosNo
	EU8iRiygcIDUqtpMtPbmPdPABXNvMIOwskPlUkvTURQuk7abWzDGNScrWz6QvyKhQcU=
X-Gm-Gg: ASbGncvBM/phWdmE2hVVmLEqBNPs8GicA4Llksk46az7EZjRbuqduSsu50oi7EoCgLi
	KlnT+/P5p5MxiWbUuutJM2yTYWfAwN+Yz2QDjfLnymVHdu5QWzpveUXaIsFzAhhU0VzQCn43Yhm
	XGdVwUBsKg/ddxn79pC8nl+uaoiCRLAcnO2a5D8sq6RKuOD8d+M9Z/QlnVwZ/1bG0pRSEjIJKI2
	LNgVxNELTlRsSEKGttqvNvdW8N813JyedRLBbJjo0Pz8sj6q3MFAnZtiZGP96m+am+OY2YRUizJ
	4/x4n+LDeh6vEU8+4f87jhjKoHxMCRiqjZcLhgBAinRN/LBrgydXlJEwaR3tno9QJ8IjpNfblx4
	UDamDIP6xdNcXACHnKuufppFvUhRWKoo=
X-Google-Smtp-Source: AGHT+IFrbensFAkg/HByCyIpWD6NGm/n/XxGHWXyYgLJ12Gm8oYiEV2EbCqtiQI2rbB+Z4f+NfDTKw==
X-Received: by 2002:a05:6e02:17cb:b0:3dd:8663:d182 with SMTP id e9e14a558f8ab-3de07d6875emr211780235ab.13.1750341115180;
        Thu, 19 Jun 2025 06:51:55 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de01a453b4sm38246015ab.47.2025.06.19.06.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 06:51:54 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com
Cc: wangruikang@iscas.ac.cn,
	dlan@gentoo.org,
	troymitchell988@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] spacemit: introduce P1 PMIC and regulator support
Date: Thu, 19 Jun 2025 08:51:44 -0500
Message-ID: <20250619135151.3206258-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT P1 is an I2C-controlled PMIC that implements six buck
converters and twelve LDOs.  It contains a load switch, ADC channels,
GPIOs, a real-time clock, and a watchdog timer.

This series introduces a multifunction driver for the P1 PMIC as well
as a driver for its regulators.

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v2

					-Alex

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

Alex Elder (6):
  dt-bindings: mfd: add support the SpacemiT P1 PMIC
  mfd: spacemit: add support for SpacemiT PMICs
  regulator: spacemit: support SpacemiT P1 regulators
  riscv: dts: spacemit: enable the i2c8 adapter
  riscv: dts: spacemit: define fixed regulators
  riscv: dts: spacemit: define regulator constraints

 .../devicetree/bindings/mfd/spacemit,p1.yaml  |  86 ++++++++++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 138 +++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |   7 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  11 ++
 drivers/mfd/Kconfig                           |  13 ++
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/spacemit-pmic.c                   |  83 +++++++++
 drivers/regulator/Kconfig                     |  11 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 157 ++++++++++++++++++
 10 files changed, 508 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/mfd/spacemit-pmic.c
 create mode 100644 drivers/regulator/spacemit-p1.c

base-commit: 2c923c845768a0f0e34b8161d70bc96525385782
-- 
2.45.2

