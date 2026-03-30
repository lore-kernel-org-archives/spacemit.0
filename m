Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED723AB273
	for <spacemit@lists.linux.dev>; Mon, 30 Mar 2026 08:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859906; cv=none; b=CPVVmNrLd2BYiZPu6pmfx4gyf9n8ypuvoXVY133EJJUrrjmxqnD3Gu3xVOt1skqhWLGWAsPr4gBI7K5IfTNSFWCy1+7TPNMDmHu8yl81uFQKDqwGcHLSLFNCtUprr+/PtGOTCUdlRDvVOuUBxrJPW7zKiVDwsiU81SrD0nM84xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859906; c=relaxed/simple;
	bh=v3MHoqccUPxA0tq5iVjY+T8EHsrduJSx1zg7Gva9WWI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=C/a0vnck9UQF4+ODVdixzI+hfnV5WsxABceso1JZCHgU59P9LFhevGhSFeBs7fW13OmU+XpPXir+MzHU6Dgne8pjd6Jxi6GbtX09qSWDBiY1/TfvLvRTGO02luacdt6ZYkGEtZfies8dKNY+HZ0exUZCvwK0RsK5sXpGaF4KzJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jK7K2z/0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jK7K2z/0"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48374014a77so50203675e9.3
        for <spacemit@lists.linux.dev>; Mon, 30 Mar 2026 01:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859903; x=1775464703; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I6nIVyOeWcmomMrY3iGXmWdAUi6cHEvqetomNgyztdQ=;
        b=jK7K2z/0Miv229hfUEJdBiFbQOM/e2mMP0KfegIfukGtttahbuQ326zx80IOABcKXB
         juQiUhnXnjWyB4Rt5T0ZIitmo/nu/tqvV4th3GcaTCC6HrltexxC9aUUDQTNw7TS5tSN
         7xsnFqM2KJ4n+geCSS80ICdUFLowCgdpGQTnkLhuOVllFRsA+AUVDBojTm7mjqx5XfRr
         REAew6EReSQfqsyL6YFbY/ia/0OP3K9QptSyBrwXM40o/BxTAxsDETXqEdieY0BarQH4
         A2MxsBr8RIRgCaK2Bp5dhkwEgjKjrApnvwoNP5gWkRKCOybUA6r8hdTZ5UPvn/bvpC6V
         x9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859903; x=1775464703;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6nIVyOeWcmomMrY3iGXmWdAUi6cHEvqetomNgyztdQ=;
        b=kRK5R56ndyAgs+MJudmA8Rvwc509EfJQIuthPY5+RO7sahkrvyLKPMMfP/dpmWqEIk
         ofyi3nsM/VCbqPwlY4q/CPUwoDtomYeAkiaulJyv0QHMNLxjdc9bsieZC8a06HKSm5zl
         lLw1YKw0XggZJSsYSfDOQUoK9xrO6NPZfIzNtGsYdCBCX+GJegrnngu8JkD5CR01OHGV
         VXr304TNUjiPJraQ0eKHmdELyK+NEnXDlbInTUa+un/Nln92U+DLb1QfCB7iifFPudfd
         76e3r5MUxWqkt11iLYjorhqJ7nul9uGu/DUi5LHCZfq0S0jGSkkC3Ckd3EFqB+PaEJJI
         HqLA==
X-Forwarded-Encrypted: i=1; AJvYcCVPBkultiDdnh8X9i7brsv+r1KXu4dRYAb0hPgASN82FU9iRb668TqM3+Ah2am2VgRhwXDJ3LytmQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwX80xrrGuPWTmLwVdtbOO5PQPd6c3ABqLh1DIVpVriuwTmuWaa
	KMcnAvRnuRc98nfNmlPUoJyTqwCL8JjybV3zAaH02zttGMruF0TZauKv
X-Gm-Gg: ATEYQzxmm5HE7UsdfsXN52/SlgzPInt3tOEnBTW/xPrqr4qyt1uWLhg6jbddhqCLNo0
	l59lYmqaebAUdJdF7T9EnQLH1k+s+LqyKvjqg3nxPTS3Dabjxul2JU8tuuQFFL+WD8JFSpV4A1b
	z927Bo4Rr9Su8sJJu6eFtL6xe8gL7qdMQMQG3MgQmd283bTRNp43+8uyb3iyhGZ0M1yc8Vu3jka
	ORXA0S4HnckdrRZfgSbKpceYnxcBCkSQX3SScSQAIdzKWi/lGZaDQ4i2KwHFwRctGOo8WWkCqie
	o2gZnoHwu83i+9r/0zrHIKs2YTlASQas9WVYBXsh1HtwujQbj7Aju5rlTMKVl1345YtnQSutGE+
	QtiM0oVEEVQC5PWLckEFU92wNQRhDA5QMb8aGlZMS8uT3nhRCPiwl2c3rExlr/7SckT0yxkzcia
	gQjOxzyXTeMnJtQuX/YriLk99KJnSmCnqzAUXtoKwX9NCrGUwQ5pV4/mSf2QM4blCrIh7O8iBT9
	fE=
X-Received: by 2002:a05:600c:1d0e:b0:485:33ad:3c9f with SMTP id 5b1f17b1804b1-48727ef5634mr197591655e9.25.1774859902957;
        Mon, 30 Mar 2026 01:38:22 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872712c236sm74063315e9.14.2026.03.30.01.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:38:22 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Subject: [PATCH v5 0/9] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
Date: Mon, 30 Mar 2026 10:38:01 +0200
Message-Id: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XPwQ7CIAwG4FcxnMV0ZYzhyfcwHkYBR6LOgBKN2
 bvL9LIYd/z/pF/bF0suBpfYdvVi0eWQwnApQa5XjPrucnQ82JIZAjaA2PAhTu018GQ5ddHye58
 4ODIgW6ENECuj1+h8eHzY/aHkPqTbEJ+fLbma2i8oAP+DueLAW01Yaa0EAe2O5y6cNjSc2QRmn
 CN6AcGCSGPQSFVbL+0vImZItfBaFgXpnLfCqFag9b9IPUNQLCD1dEmjSCslvQU3R8ZxfAOABIR
 ghwEAAA==
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
Changes in v5:
- Document optional pinctrl-names property supporting "default" and
  "state_uhs" pinctrl states for coordinating pin configuration changes
  during UHS-I voltage switching.
- Link to v4: https://lore.kernel.org/r/20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com

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
Iker Pedrosa (8):
      dt-bindings: mmc: spacemit,sdhci: add pinctrl support for voltage switching
      mmc: sdhci-of-k1: enable essential clock infrastructure for SD operation
      mmc: sdhci-of-k1: add regulator and pinctrl voltage switching support
      mmc: sdhci-of-k1: add comprehensive SDR tuning support
      riscv: dts: spacemit: k1: add SD card controller and pinctrl support
      riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and power infrastructure
      riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes
      riscv: dts: spacemit: k1-bananapi-f3: add SD card support with UHS modes

Trevor Gamblin (1):
      riscv: dts: spacemit: k1-musepi-pro: add SD card support with UHS modes

 .../devicetree/bindings/mmc/spacemit,sdhci.yaml    |  17 ++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  24 +-
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts     |  66 ++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   |  67 ++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |  40 ++++
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  13 ++
 drivers/mmc/host/sdhci-of-k1.c                     | 257 +++++++++++++++++++++
 7 files changed, 482 insertions(+), 2 deletions(-)
---
base-commit: 4c3b07bf68391122266dfb01126484daf352cf70
change-id: 20260226-orangepi-sd-card-uhs-0ecb05839b0c

Best regards,
-- 
Iker Pedrosa <ikerpedrosam@gmail.com>

