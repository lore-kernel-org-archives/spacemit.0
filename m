Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFEC1E5B88
	for <spacemit@lists.linux.dev>; Mon,  2 Mar 2026 15:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772464431; cv=none; b=i0xI5+W2HWd7CIisSHfBir2G1RV7siSXVs0xvSISMAhXmzj+dAGCLbxjaqavJMKARir7xS0D96x374gV1aB2bJxGXxyuNZ+iKAFvDTGnBOdP6FLyyGDEAWip4+gtQqFnHPX9Rxb3LzjSfImuUI80d2NZiIHhx7SEdEm3EEFXddg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772464431; c=relaxed/simple;
	bh=xoKFcRodsjBoNZCfcW1z1LG/a1f1H2smS58YjpeC2eo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mkMAviDxh+dsQj8st0153FS7DwFU+kW88RSvLgweKw8XUOs4vXWYlYDziHF/xu1Zf6IfLTcZvAl0hw0OpYPCRgZrZN7mCkRXrTriofXWp09mO3kCf25420bFSqZfL9q5YlCHNLah091TO4DbBZS3y7l/JVMl6hCnqjnf10oCcYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXksrLm7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXksrLm7"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so51807795e9.1
        for <spacemit@lists.linux.dev>; Mon, 02 Mar 2026 07:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772464428; x=1773069228; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4bjNDBX+/PFOXtqF8zgz+Y2Tzpl7yAa/Q3C6j5YXCMg=;
        b=iXksrLm72lbcExyOd/aoVV5E1pATjGtJufgDsVMQ/hGPW3C2evAo0CKElmL7WyWNVp
         LBq6zmdfKiG/9CTm9x6cKzwcqCheLJbeMC3rHCDwqE/58etugCIU8yhTVXmIHyikSPiy
         J4PASra7v7O5PqE8xqdjcqsDB9z8DZhCNAbUGgnRlkgBhHHTgPfgd6gYvwd2zJvh8wiS
         SoW1b2v07id/TOjgNYpESMqqo9fZ2eBfTDiiZgwstbAY5toFEN3v6ulnXucHhgDz0ndo
         Au824viyc49tGdaKEbC7pSoMsGs0htQq2O6qAHybtRPce4cq8P/STBHOrBVguQiFRU97
         HhHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772464428; x=1773069228;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4bjNDBX+/PFOXtqF8zgz+Y2Tzpl7yAa/Q3C6j5YXCMg=;
        b=bWNxYFJdMhL6lyCiEONK3Q7W+39zyhx8iBZnz3yC0wzjPOxhHKTra0hKYHbGUFbr+v
         Mc3AfuHAolRmUTRzUVYLVcravcSNTII/smbdMcGLtV7gFJJ+P32dN15wvXGtKJzo+duO
         jKw0e8RsMYGcmYzdy6K+I6hhdJXxgkFpVmSn3niHNQTUBHn20UGuGGJyZ2t8hXtFuVXb
         qIw5kQw700nJdIABMkPHrBb2NgPeFjFuFM8iJt2ycu5px0t9Ze5bMIyO/aa4WKs9n0Zn
         9AE127NDKIpV1gYwMwOKzEOxqAV/kln1SYSCOJZ8Z2toGRlXOopN5wyzdBelUc7ZrgrD
         mc+A==
X-Forwarded-Encrypted: i=1; AJvYcCWls9tErRy4zpE4ZvNSL53C1MmvAhBeSL1qrAb/EGId6W7PBOr/p+alvfBzB2ztMj4PW64dfYXFxg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+Bgu5Q9TbGnZbhms7cYdv4OeRqW4R48ze7zr8bVR2LfclI64y
	CKHH1cSLbOks8GXJgsO51oq3ZFAZkhS+ISE+kxL07/oiH/1d8psShPM+
X-Gm-Gg: ATEYQzznwS4H6j3Wyqp/K+bm86kOK3my4Bubgy/NzeN3WlAIUS8QumHfPplpMoKtgpT
	2CnhOfAFRer3YkaPkmi/wf7ijDFRUs9Z4NzZlVOteu7ZPa6Ke8S2GGP9eYrV+bvNWDhbXVlLWwt
	uXUbw8n5Jm7R5QYutnSbQXsVGwlULjJ/iKFv3LQrNDzwBuUXfz8ggtONd9K9cz70F9BmB/Omd9P
	nULNKLdk6TiqhBjwdI1PpquanRWiOOtL1jgjg4la4/eDMZMwszSZ4M6AFsijxmCwPzr2hz4TmsC
	P+f2cwPvbCBSwtDnppj7zqjkuDddE28JvHAIiIukVnxn66VRD5zc+fN/p5tCjPm/XYMppfOq5nq
	DHrISfsE5Ww6PwaqywcL6sHOOxB8JZR4FxlJJlUIowaZ0ji7tYWZ0TDywyzSEZ3FeJXxcaTKI/T
	QhlZ7JMvfk1aLNF4hhHy70RxR4KqyNtJFd1gpiB+JEbECXkmuV7mElSAOsNKhLrRxlvQ==
X-Received: by 2002:a05:600c:3486:b0:480:20f1:7aa6 with SMTP id 5b1f17b1804b1-483c9bed9e2mr214730135e9.21.1772464428106;
        Mon, 02 Mar 2026 07:13:48 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e692sm437240265e9.7.2026.03.02.07.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:13:47 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Subject: [PATCH 00/10] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
Date: Mon, 02 Mar 2026 16:13:21 +0100
Message-Id: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQ5AQAwAvyI9a1IrBF8Rh7Vb9IK0IRLxd8txJ
 pm5wViFDbrsBuVTTLY1QZFnEBa/zowSE4MjV5NzNW762V3QIgavEY/FkDiMVDVlO1KAlO7Kk1z
 /th+e5wV2nN/1ZgAAAA==
X-Change-ID: 20260226-orangepi-sd-card-uhs-0ecb05839b0c
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2

This series enables complete SD card support for the Spacemit K1-based
OrangePi RV2 board, including UHS (Ultra High Speed) modes for
high-performance SD card operation.

Background

The Spacemit K1 SoC includes an SDHCI controller capable of supporting
SD cards up to UHS-I speeds (SDR104 at 208MHz). However, mainline
currently lacks basic SD controller configuration, SDHCI driver
enhancements for voltage switching and tuning, and power management
infrastructure.

Implementation

The series enables SD card support through coordinated layers:

- Hardware infrastructure (patches 1-2): Device tree bindings for voltage
switching hardware and essential clock infrastructure.
- SDHCI driver enhancements (patches 3-7): Regulator framework
integration, pinctrl state switching for voltage domains, AIB register
programming, and comprehensive SDR tuning support for reliable UHS
operation.
- SoC and board integration (patches 8-10): Complete K1 SoC controller
definitions, PMIC power infrastructure, and OrangePi RV2 board enablement
with full UHS support.

This transforms the OrangePi RV2 from having no SD card support to full
UHS-I capability, enabling high-performance storage up to 208MHz.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
Iker Pedrosa (10):
      dt-bindings: mmc: spacemit,sdhci: add AIB voltage switching registers
      mmc: sdhci-of-k1: enable essential clock infrastructure for SD operation
      mmc: sdhci-of-k1: add regulator framework support
      mmc: sdhci-of-k1: add pinctrl state switching for voltage changes
      mmc: sdhci-of-k1: add AIB register support for voltage switching
      mmc: sdhci-of-k1: add SDR tuning infrastructure
      mmc: sdhci-of-k1: add comprehensive SDR tuning support
      riscv: dts: spacemit: k1: add SD card controller and pinctrl support
      riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and power infrastructure
      riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes

 .../devicetree/bindings/mmc/spacemit,sdhci.yaml    |  15 +
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   |  69 +++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |  40 +++
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  13 +
 drivers/mmc/host/sdhci-of-k1.c                     | 320 +++++++++++++++++++++
 5 files changed, 457 insertions(+)
---
base-commit: 5f499bb7a07fcdcf8877acaa8f413a5dc1fcfacc
change-id: 20260226-orangepi-sd-card-uhs-0ecb05839b0c

Best regards,
-- 
Iker Pedrosa <ikerpedrosam@gmail.com>

