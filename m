Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A35545C0B
	for <spacemit@lists.linux.dev>; Sun,  3 Aug 2025 02:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754189899; cv=none; b=F2a2X9u4AkJJ/yIOdqfgnskaUM8+cyCLU5LHsDy0kB1NC6NfabUb0kP/fCqGf/eVlDuDUjbznloLfaPWBU+EcEKga3wFumB8v6XjvslqxGyhFgDg8edFgHq4udlrHk2WIY0i5QzU6VO6Lv6A07jB1+J6LEWsMNZbIZSHdmXwRc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754189899; c=relaxed/simple;
	bh=xS0fwRHul3rDPIx1/b4zCW5Tgi8i7mAJOBcb7BgmG2U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VeOSLExOaYSpHuFfduWI3OxIn8iLVLtiMfTL6/E30pEVKQGdFZI1WedpmjcYyShw6PjIhm/OmBmeRlS/G+6oKv0hE0IcNoYYd5CN+AULIVhbaa6RX+0i1nYGlF2uk1Xt9XIUhNwmnwPmMOxLPs0nxJaAD9XZwGWRur00JC35qRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=053ooUAi; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="053ooUAi"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-8811ab2b559so240817339f.3
        for <spacemit@lists.linux.dev>; Sat, 02 Aug 2025 19:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1754189896; x=1754794696; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oY3Z8dtNrrf7QjfOHcFhMrLBNHKYAu0syOln9u3nSKA=;
        b=053ooUAiYYkI96vcXO4i31b4bkogwIRYyhPKSFUC1Amqk3pnToqcDkUfOelOx/QLfg
         vQ5z2hjCvAo7cDp5qksfCFIG3RpQay/HX9dH4Obtpd5jYrlY/DpbnjIUXiHHmgAIVeDo
         wRAR2hKCKAUzUg6G42TrwWBVLr2ON0pdHmTU3e1LzelN4cELIsF80IlXJpvIkVbvw0iu
         j3bHoplH3nVMLGKyuk+duBH3G8h99H516qYRXo9RQRxKqs6G/aBkDMbNITDw7tRIJ/ub
         6PGnh3idQfugJ4pijKNmnTUhN2Ho/ZYHMFKhz4Kn9prs25/wTWxASEfNImS/tQQqDNFS
         6w4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754189896; x=1754794696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oY3Z8dtNrrf7QjfOHcFhMrLBNHKYAu0syOln9u3nSKA=;
        b=W5wSVXw0uvGAA0Njj35CA2t/sgpC9gFaLxIInyA4GhwNbqFTt5TPDHO3nOWeTtTxZs
         gSKufSTOYBX8SuCFTQlKHpg5VuXgbZnnVbZCvFnKBa+ERb0Yb0Us997aJnfGKPOxNnfO
         ezzCAmk6AjyLN1Ks2vTab7+4VEVAuwl3CAShieo5BK5Y5OGQAk86lg/EYfomblXfDNsH
         R/SkQDn9g9Tpm2GwNGTGSUFHNqbIDpxBFbL9uz/3cC7xbPF/HNMsLePwP3Hk79Hd9O+n
         2J1Xh7IWBdBHiKzux0/dlIxMkqJwInzJzj+0Q180QWjQDPB8XVebJGfPmmvZ1d+rNXzB
         hmiw==
X-Forwarded-Encrypted: i=1; AJvYcCWfsZvyN/pj5jz4/bP5JyJCwskKuAEyDovKYBu3gTSYes/i0vlNwgVui18qofS3nQGxvsEBT5cr2w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGa+Q0uik8bbMwhRHa2kgCKJ7bp8d1PU050Vf3EUeGJqHZY1Tc
	qZg99K1phdJTL6vyWmVIH5hoyaIusnBKO1sSFxAYBRJiowas6tZgKl8k4g1IQgZKwOM=
X-Gm-Gg: ASbGncuD0xEHTy15wmUM7oafpqosZknvHTu+smhGZa0zlDZ97NqyDUByJSce7Fcn2B6
	3Nst7/rSLrvz1hjgugZAnDt3odyAV0+EvYYE6KZjfJMRWJm2kgLdRjbnKgDzLTX7AEsszd6raN1
	Con8StIDMem91moZ0yJeN9djGn+uZpio2TpyBuZQ+Eou6WtfFk5JlNqY4WP0XuPYaiktDdYeZz8
	ERaQTYhhCQt8YlWEBawbpwRQD3j/evKTDxycbCc2LelRrUMcf2rITR6lw/EevCI2E1my/+uzEz0
	zmasq7w+DaB9/fwBceddyZI23e4v3QMJCh7mU5IrpdXp0+W5yxjSVRUzbodQxTrvhlAaTIOa3nJ
	A6aejLDlVZNuDiEkj+6XgJfcjdzT2sDviru4cZxWsIJnAyzZEh36tUl5EJFFUkRVgZA==
X-Google-Smtp-Source: AGHT+IHt2PgWb9LhAIhITIOQeAiyN5sN4fCPbyKx7y0/fVbofgmpYs/9kxt/4dYcvv4SBxyTO04ktA==
X-Received: by 2002:a05:6602:3f87:b0:87c:3d8:17aa with SMTP id ca18e2360f4ac-88168253fc7mr836026839f.0.1754189896369;
        Sat, 02 Aug 2025 19:58:16 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50a55b1ac2esm2251906173.1.2025.08.02.19.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 19:58:15 -0700 (PDT)
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
Subject: [PATCH v11 0/7] spacemit: introduce P1 PMIC support
Date: Sat,  2 Aug 2025 21:58:04 -0500
Message-ID: <20250803025812.373029-1-elder@riscstar.com>
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

After a sequence of attempts to add a new "max_register" value
to the simple_mfd_data structure in a way that would hopefully
be useful, we have reverted to the solution that was originally
proposed, which simply defines a regmap_config containing that
value along with reg_bits and val_bits (both 8).

This version removes the second patch, which contained the added
code to support the simple_mfd_data->max_register field.  It
also addresses a dependency issue in patch 4 (now 3) that was
pointed out by the Intel kernel test robot.

Note:  Yixun Lan suggested privately that I ensure the I2C_K1
config option gets enabled, but I'm going to do that as a
follow-on patch.

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v11

Between version 9 and version 10:
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


base-commit: b9ddaa95fd283bce7041550ddbbe7e764c477110
-- 
2.48.1

