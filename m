Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E5538B12A
	for <spacemit@lists.linux.dev>; Mon, 23 Mar 2026 10:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261172; cv=none; b=Y588Nkd57mYUZfgZn3mSSjq4WpozH7nvN+d13h0rj364zKnxL8n/laQH8bf0ge+AhltWybJy4HVbUMLdCw88tuYjkrN5OMvsXzk0Gus5OVit99yjKB7rC4+2+/NsYGvXK7yzYnpzjeZrRNnDmuEniiSCIIV5tnhXHBls9SWklJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261172; c=relaxed/simple;
	bh=BuXvsxX/mG7GgOqIVeReDJa3sf2TjR2wx24X7e5Ghzk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PqcohY784Yx4FBU0wV4B6y/CYIczDRHVgxX14G0RwwWGVkWylBUMTrAdw8ND7zbKa46Z0p66eoFz1nXb77XlVK3Et9IHARmLJDTt56QVEo0PYtwgi/fp+OJxKT7iYKrBEMjQDnlJUh8xTgLyowV+RreUVjjNhy7vSzDN2Y6DARg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YM/D0uh8; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YM/D0uh8"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso20593765e9.1
        for <spacemit@lists.linux.dev>; Mon, 23 Mar 2026 03:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261169; x=1774865969; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W4ERGMp8NacLG5ZvKAIiOC6A4GgV4+Yn8pLmhG8k+VE=;
        b=YM/D0uh8C9i2cjHKGvO2BQOWOjudximeK2ANdv8H2sKrcnhKqBjjXc5laKULblqzqK
         BkIvGfmHWiyT8zOza0YZM2GivmooOoFZjttq9YMM0ZeJ8N7iTGE61LA/0kN8MDWNzrdn
         W1QZsje+8Zxltopr23QAKFijGa8RqiqURWejJAVlHLsy9m7At+yOAiEK+mBd8K6A+NIr
         rNoq7yX1CExwylKXk4/u2byAGhk5h4slQT5tq8h35+Hou5ia28Rw1qoqbg5fd3/4lN6t
         IewHeujvzk7tLVyWqW+8qtd6UBMLHXDFvSUmA096XOcQeapu4rQUIOzMMLoE7TDGz+Lf
         6gMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261169; x=1774865969;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4ERGMp8NacLG5ZvKAIiOC6A4GgV4+Yn8pLmhG8k+VE=;
        b=fAqEOeW872vpNee6tteismIj3mca5DNZNAhGUO2pMl0WiuHLS5fLK1AfbVj3meqxlx
         OEtMqTWs/2H3skPH3JHhJRbsqQPNsbjf2Hz6ffxQpryINCIrN2RimigRcVzcfwGXyn1u
         9pBOOoaXYOL2lK6l2mB1pEYJK4L0Z4rb3SfxMMOasyi9j1kMpaX/ZMZ12WTTAK+WkXGM
         zdtImQgQ3Rka7iL8iTu+BwxU6uFrKMHpWUV58YPhr1pb0MIfuG0M172HWDVRei8r5DUN
         bWviIhLtxlYrbPKGDkiKsDWOb+05bJ+Atg186zrQrYiAU1xTIANJOgy5d1Jh6w2pSfTC
         vGBg==
X-Forwarded-Encrypted: i=1; AJvYcCWoEvpdBfBv+AweLT1TOHgheiI2Zy8mpOq6BCIbKAzs7baXdHRs/JcWQNpl8Ndd8mR6LjfS8rMHkA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7x/Ugd3xqUal9+HPEzCW+0tgX8FqoU4SdNMWI8iFprTaCTC20
	qiZGSLYRMQyXdIFKNjcm+NaBH8d6p+uqrGTcGyGdiag4WQWjJIMhtS+L
X-Gm-Gg: ATEYQzwB87If+hG0e3R/ZvcO+2zUbKc0/HmLDTPE5FYnnhEBvB6liCusIpu6V3Zyzv2
	Ls2HBv1jkbBiSJEsw3xW42n3fFwYDAFAO4L5VApJPMgant6amspKW7bY9DRj+HdQoadaXtD+jpt
	KBllh21fRSv1I3fpNMjy8/2jwM5+kKZRbzWj2R5JCEROQ/dSI+hZ+x6y6zwa6fNw8BiM5NnVb6E
	9s7cmLU4GEd0Nh6DjRheoKZGkOFpGWBBF9lKLY2DPYB9ecTxPXxbQGNNGn0Octw+7lyIrkKr0OT
	p1kZk1DkLEIYqDQHhHh2S4KPWMtivlE//Q7mggWl4aAraFT3L0tLVZR3Ng6zeSozgwBD0K0RV5r
	PFo1Wanhh/bGZM6K9+uXRSOCtus7fCS/1sIAh6LG156DV6GZnfEIBBrXXSlVluIEfXhZRP5Q/TK
	8HIi2YYamHDChxoE6goSrd6XV2yybVzLzvBFCPQnbv2GOwPQ+I/9qKKoFHaDa50NUi
X-Received: by 2002:a05:600c:1d15:b0:485:2ce2:4c75 with SMTP id 5b1f17b1804b1-486febbc648mr160002825e9.1.1774261168302;
        Mon, 23 Mar 2026 03:19:28 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe86acb0sm78755445e9.6.2026.03.23.03.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:19:27 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Subject: [PATCH v4 0/8] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
Date: Mon, 23 Mar 2026 11:19:03 +0100
Message-Id: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XPTQ6CMBAF4KuYrq1ppxSoK+9hXPQPaCKUtNpoC
 He34IYYWb6XzPcyE4o2OBvR+TChYJOLzg85FMcD0p0cWoudyRkBgZIAlNiHpR0djgZrGQx+dhE
 TqxXhNROKaJRPx2Ab91rZ6y3nzsWHD+91JdGl/YKMwH8wUUxwLTRQISqmib60vXT3k/Y9WsAEW
 0TsIJARrhQoXhWm4eYXYRuE7ryWWEakbQxTVc3ANFtknucPUgTqIUIBAAA=
X-Change-ID: 20260226-orangepi-sd-card-uhs-0ecb05839b0c
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
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
Changes in v4:
- Revert to start_signal_voltage_switch() approach for bidirectional
  voltage switching: replace voltage_switch() callback with 
  start_signal_voltage_switch() to properly handle both 3.3V and 1.8V
  signal voltage directions.   
- Fix DC input voltage specification: corrected the main power supply
  from 12V to 5V to match the OrangePi RV2 board specifications. The
  board uses a 5V USB-C input connector, not a 12V rail as previously
  specified in the device tree.
- k1-bananapi-f3.dts: add `broken-cd` property to work around card
  detection. Using `broken-cd` disables hotplug detection but keeps SD
  card functionality working without additional dependencies.
- Add SD card support for Muse Pi Pro board (contributed by Trevor
  Gamblin): enable SD card support with UHS-I capabilities following the
  same pattern as OrangePi RV2, including dual pinctrl states, PMIC
  power supplies, and card detection.
- Link to v3: https://lore.kernel.org/r/20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com

Changes in v3:
- Rebase on mmc.git/next to resolve conflicts with "mmc: sdhci-of-k1:
  add reset support" patch.
- Squash tuning infrastructure and implementation patches (3 and 4)      
  together to form complete functionality and avoid unused function      
  warnings.
- Reduce code nesting: implemented an early return sanity check in
  spacemit_sdhci_voltage_switch() to reduce indentation and improve
  logic flow.
- Refactor pinctrl initialization: moved pinctrl resource acquisition    
  and state lookup into a dedicated helper function,                     
  spacemit_sdhci_get_pins().
- Use generic regulator node names (buck4, aldo1) instead of             
  device-specific aliases (sd_vmmc, sd_vqmmc) to better reflect that     
  these PMIC outputs serve multiple devices.
- Remove dead code handling 3.3V voltage switching from
  spacemit_sdhci_voltage_switch().
- Optimize tuning algorithm to use single-pass window detection instead
  of storing results in array, reducing memory usage and complexity.
- Remove unnecessary card detect check in execute_tuning() - rely on MMC
  core.
- Clarify commit message to mention both SD (UHS-I) and eMMC (HS200)
  tuning support.
- Add SD card support for Banana Pi BPI-F3 board with UHS-I capabilities
  following the same pattern as OrangePi RV2.
- Link to v2: https://lore.kernel.org/r/20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com

Changes in v2:
- Removed custom AIB voltage switching code per maintainer feedback. The
  existing pinctrl driver already handles AIB voltage switching
  automatically via power-source property changes during UHS mode
  transitions. This eliminates code duplication.
- Squashed regulator and pinctrl commits into single voltage switching
  implementation.
- Moved voltage switching callback from dynamic probe assignment to
  static sdhci_ops declaration. Removed redundant SDHCI core call since
  the framework handles standard voltage switching automatically.
- Made clock override (SDHC_OVRRD_CLK_OEN | SDHC_FORCE_CLK_ON)
  conditional for SD/SDIO cards only. This follows vendor driver pattern
  of differentiating SD and eMMC card handling.
- Include no-mmc property for SD card.
- Link to v1: https://lore.kernel.org/r/20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com

---
Iker Pedrosa (7):
      mmc: sdhci-of-k1: enable essential clock infrastructure for SD operation
      mmc: sdhci-of-k1: add regulator and pinctrl voltage switching support
      mmc: sdhci-of-k1: add comprehensive SDR tuning support
      riscv: dts: spacemit: k1: add SD card controller and pinctrl support
      riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and power infrastructure
      riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes
      riscv: dts: spacemit: k1-bananapi-f3: add SD card support with UHS modes

Trevor Gamblin (1):
      riscv: dts: spacemit: k1-musepi-pro: add SD card support with UHS modes

 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts  |  24 ++-
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts   |  66 ++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts |  67 ++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi     |  40 ++++
 arch/riscv/boot/dts/spacemit/k1.dtsi             |  13 ++
 drivers/mmc/host/sdhci-of-k1.c                   | 257 +++++++++++++++++++++++
 6 files changed, 465 insertions(+), 2 deletions(-)
---
base-commit: ba0e286c944dea871f617bef1d733307b202de25
change-id: 20260226-orangepi-sd-card-uhs-0ecb05839b0c

Best regards,
-- 
Iker Pedrosa <ikerpedrosam@gmail.com>

