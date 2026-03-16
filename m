Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8D739B950
	for <spacemit@lists.linux.dev>; Mon, 16 Mar 2026 14:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773669866; cv=none; b=GdVbGSkB3H7IaRwobVDIFZ9S8fcahx6LRec6Io1N0h0jeRmyJn3I0i4Yo2Zpz0j0ADMkeT4esShedyZEBpluCh/8PrwRzZNYYK/msCKnoFrAZRfgn7YM77ka/ol10oG936RRh88Vs2lsI9Y+7u/wJORyfl68DiIB96l1MyTnCVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773669866; c=relaxed/simple;
	bh=bBmnapbFZhNl1hExaX6Y6v+emhhgEDggwTauM/OowSQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dS2TfRBuZsvCau2/8GbSfFF2kSbDAjqFfYrZo/ckp3ciLaGmG3D+thvJAdc7t8aFoqFtOf564N/iq+09kGidR7uiInbfdZcWo3bUE4Rq0QIWuxn1ruAjkZkePU5gaIbdOWlrUbTwrCT/h1Qj/WSJffb4U0aGKNZ5X0ySkOfpe28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWocvEjQ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWocvEjQ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so40811055e9.0
        for <spacemit@lists.linux.dev>; Mon, 16 Mar 2026 07:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773669863; x=1774274663; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OdoEqGGjgbvJGV3XvDqNqAu8aItRm8RFqY326SKUvHs=;
        b=gWocvEjQiX1k1SEerBEUTCMS70C9JE9Kfrdli4p/JIfOfhsf92Xp8ekKeZsr+T/k11
         cWFvVsmi8FAq85i4CkFWtY1yN1NFgoxKR/xAaVqhvkI9XnDSoxLT5CNCNet3FkN5vpVo
         PU7LXDiX/QMm6EthIl0Y5xljA8ieq/gM1XDT+8zSzCV+cTvnV0f9pOYMlXrfOKM6njna
         L3pvv1v3UAHFugqGC3Lb3ypb/N1BKNkQCfq8Prr/iifnmkOsWxwh2q2aoFQy0hPL6T6O
         I89iSKCWhjNCb00QucGWGdVkGURg3wCbdQYK+d+MKyI3oggsVUsEI6Oa4yLNaL9wLrWB
         3cew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773669863; x=1774274663;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OdoEqGGjgbvJGV3XvDqNqAu8aItRm8RFqY326SKUvHs=;
        b=Nm+E6aMCHRm26wSmO6IU+VRo51qQaVrcxXa60YhWdU8KTSjzZcfVXwuV/e1arkI7in
         BJoNERiA0oopgFt3Ur8OlrthteikL6miydFF/L4LIMEEs0zcaUrsud3YhDdDeqqovF2A
         B0Jz7VOd1gPoIQV8sd/yVak1SOHv2E7eWQS5BQ3H0Ywtmh/L3sRX18iuEY5p1NmI47SG
         s1SXeAcu8sM//yOsaFRWzn2JBqqf8bRxO+bHEESrAzg/f50/L4xxqTHj2+xbYT+L9zAn
         6fl9ztxgvAvdA9MNKhzvZy+z4XILfCsjxnh5MECwINBbHf9nDpqrIJGBG6tw/BkAxYGd
         BTHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbMY77ZeoOyNz4Z2c1XSL7LzR0Dr0mIl3BmMCpXU5HobPQEEX5Bnw1fC5xYjDoThCdw5VU2+UupA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzCwE40LifzPPr7yzF5z8xGyOCmKjJqpcSNpEvvzvNHGi7sf3kl
	fgIVV+ETFezoOTYGO8V2sIyrtXpc0g46hFSsaRvRNcJJV5kYD7BiXqP2
X-Gm-Gg: ATEYQzxTq/Nqmmn066knop6j6XZzChAIkdRWQx6OI1KGqlCyTwSDrIY6U7NIF/YGnOT
	k6hwo8VWGzETIDerzYCo+GxXZZ6gB3XfkakMaUs5uL/oL2z1r24HehskP3R/4kt+j4LCK+byofg
	LGBFmzch8COK5wS7u3z8emhOKEAF9P5L0//MeoDBaR61FynjqhIEh+9epLsl3UAMTTFPWgv/XOg
	GksE2YztaqPsz7m/CxklNeFXKTFbFes119oZw4hhR3j2unxjJnPzEBbC/VxDit8JVPwvdoFENQX
	VxHEfexpyPHkHRrkr323/WD5uAaeuNGV6CKl9o5teP0RH2GQ4YvZSiUsI80bKZ3qpSoUgqJhO5l
	+0xEeqPzxcy+lgPvNAyOgP3t8GJr0T1c73W6csTOIctlHG1XaIME27sjrSZ75xXZ93x2SHlAra6
	NJ67aa/zwtSXSrl7OYO9VSwrE+7UobDao7La6MpnQvfrkDMMG1SV5M/Ck5GZRV04sI
X-Received: by 2002:a05:600c:1988:b0:485:3f58:d84 with SMTP id 5b1f17b1804b1-4855a8d6fd7mr204197625e9.32.1773669863067;
        Mon, 16 Mar 2026 07:04:23 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.234.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b3a09e453sm20698725f8f.0.2026.03.16.07.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 07:04:21 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Subject: [PATCH v3 0/7] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
Date: Mon, 16 Mar 2026 15:03:28 +0100
Message-Id: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNyw6CMBCF4VchXVszTOVSV76HcUEvwCRCSauNh
 vDuFtyw0OV/kvlmZsF6soGds5l5GymQG1OIQ8Z034yd5WRSMwQsAbHkzq/rRDwYrhtv+LMPHKx
 WUNRCKtAsnU7etvTa2OstdU/h4fx7+xLzdf2CAvA3GHMOvJYacykroUFfuqGh+1G7ga1gxD0i/
 yCYkEIpVEV1Mm1h9siyLB/zujKG/QAAAA==
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

 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts  |  23 ++-
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts |  67 +++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi     |  40 ++++
 arch/riscv/boot/dts/spacemit/k1.dtsi             |  13 ++
 drivers/mmc/host/sdhci-of-k1.c                   | 243 +++++++++++++++++++++++
 5 files changed, 384 insertions(+), 2 deletions(-)
---
base-commit: f38f518dda1f1decc7a39556fe3231b0d1b84e1e
change-id: 20260226-orangepi-sd-card-uhs-0ecb05839b0c

Best regards,
-- 
Iker Pedrosa <ikerpedrosam@gmail.com>

