Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541493A4F58
	for <spacemit@lists.linux.dev>; Mon,  9 Mar 2026 11:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773056432; cv=none; b=Lq4XJs+4h9+A4TTEymoH1bKIQtGtRzaeMwnav2H6ECpaSy/PQgGtP5i4SsD8WMhIdOR06dytewbQqfZ6DRKQqbehuV0Cn3bhTdwIwV0HL+/ANYaFHWOuVze4JkK9X8yDFPHoU9lvjGuVffP9ZiMbG0eRzhypnvoPn+xN5rWW0Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773056432; c=relaxed/simple;
	bh=sw+Cc+5HCSi0Q2cmwdwnnqsNb62gjuQjguM1odYVI24=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MXTlcVXv04HxrFBKrsgMSD9Uy9SSJjHVrlb4YzxizeERi5y1/eLaUgpYt8KyYTX+3/a6rtwfK8dBpc++gS3+fOh/hL8U/pUm/0Nn1xYrhNNoy4xFJFHyWdvAyOiKuq0p7ycYvWkrWRx/PreMw/KDcYSKa6ObZ86hRsSgcHeyECc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JSILjXAf; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JSILjXAf"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439bcec8613so5920175f8f.3
        for <spacemit@lists.linux.dev>; Mon, 09 Mar 2026 04:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773056428; x=1773661228; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S7AMv4ruvD0WDb3IJGhR9swDRb827tGwwDotiEuQEfU=;
        b=JSILjXAfGhyu8nfFIVVEiB1JKKRKjnLgvaz1LVk4ics5N09oT16pF4li9CkP7dRjxY
         TKv4T4Ozfb1ToeONuk8ZtyM3O/46T6w7WfOQe5zIxffDpAwBTCEqJXFOkXztH35fKu2t
         L0mxMvwk2jedMJWyDRrLlRBwul1Kcapac7k2mkVZW3bDX8ONJCRqVxwxwP3VVo4N8/OF
         yXzOoVq+caTvZQON1z0rsa0Jh7hbLDpl/abKUW2LUXw/pHmy/nseKix2iG66EYcaRvuM
         Tlnek9MQ43cu1IFe1cFuHJoyMqwMdfDErti2ZO3+EKthaZg9h6XJ2dEnxfU8hj1DQem7
         Lz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773056428; x=1773661228;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7AMv4ruvD0WDb3IJGhR9swDRb827tGwwDotiEuQEfU=;
        b=CPnXlIvazs5hA04qF3FNqVNNF0TofcpdBPOiJgT+PovbSZQBZ8r9udL8DWMb2eszkv
         ykAgBQd5xV5DHrRa38iEyGcKcmRJmRjlGhffuasVvBgGS/1aqVSddwPtpU9mpz5JShRt
         OGKQNRKwV/vB3zcyOJyP4eI2TAYLzBhBOLyE+foBiM4VH3W6P7FxVt5TYqRaSfSYnvm8
         6dFrhVzP0NUaMRMyFlhz8Ld47RDG27HZxyz1gkyo5CBmfBw5L61TVPC2M+GfAgUrvOXl
         MBFF/SQ5ERGx7T0eRaRk+PZB6cU/XmLey5JGPW4Fhmb+9Weh+bexgcpp6jhuA7/hV4uS
         mrCw==
X-Forwarded-Encrypted: i=1; AJvYcCU7rLpd3fAuH+8/8855868tm379O3Cn2qI8oVDnc+5eifNXrvpWCsck+Gvs8A40FI5Tcvy9sq5UGQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxgJvQJHH+2N36DpP2xV5ter9epLllqsFtzai7/mmgifrfWqVYz
	MiwD/DZWT5WWc45jOVYllmNpt0ZVz1FNRchxc4lgWqk6KHiUT5yzyAUd
X-Gm-Gg: ATEYQzyZtow3QwxBc4xQ3KqL4UK6ZpDHP93P9NOjW6SsHbTFSdSfB6cm3m0QFsakY0B
	XhwKgPczsvER66hAFh1Iq6jVI+PZ7XjpvR4DV1zt+HBnFqN4ipyylcy40SmUOTGO+VinQEdVV8P
	ZobfgL5ggjGmLok5D5LiMqzI2/JgD+2JBgLt28wf5BZh9j7Yb0PEYE744AO1gOhMyx68Bwc05qK
	5AXtMvViRY4tRID7hZweZBMhePoa/Y636aieotbxeWIyRNAkjLz1JTfjO7m2MiKea9jjf9m+cUk
	U5jQfBrZimVBT3GS+UmaKydu+m88+IegGu6Cxz0xMb3f+HnB+ykYqxoiHKY0wzgyTVxYnd65gFS
	d7nUVZiK2CFMltYA8m2qicEa0oUZEvzjCwmCURNlELYzS6rZzvTutQxeRGH+aQKT7yfxgmyqnwu
	ZBDi9HNWU3hPWcyrJ1314jNyueYnCNcbFwTlKrb10waGtPFml7cDs6rnKOoi1AUNx3f7dHHpPBC
	g0=
X-Received: by 2002:a05:6000:1845:b0:439:c5cf:fc68 with SMTP id ffacd0b85a97d-439da3483b0mr18304868f8f.1.1773056427412;
        Mon, 09 Mar 2026 04:40:27 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.236.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8ec97sm28471699f8f.5.2026.03.09.04.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:40:26 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Subject: [PATCH v2 0/7] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
Date: Mon, 09 Mar 2026 12:40:10 +0100
Message-Id: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0Jm7ZhhiEhdeQ/DAoYKkwglrRIN6
 d0tuHX5XvLfXyFYrzbAJVvB20WDuikBHzKQoZl6i9olBiYuiblE5zc7K4YOpfEdvoaAZKWlU1W
 YlgTSdPb2ru89e6sTDxqezn/2lyXf7C9YEP8PLjkSVkY4N+ZcCMm1Hxt9HMWNUMcYv7DDdL64A
 AAA
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
      mmc: sdhci-of-k1: add SDR tuning infrastructure
      mmc: sdhci-of-k1: add comprehensive SDR tuning support
      riscv: dts: spacemit: k1: add SD card controller and pinctrl support
      riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and power infrastructure
      riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes

 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts |  67 ++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi     |  40 ++++
 arch/riscv/boot/dts/spacemit/k1.dtsi             |  13 ++
 drivers/mmc/host/sdhci-of-k1.c                   | 252 +++++++++++++++++++++++
 4 files changed, 372 insertions(+)
---
base-commit: ec1fb4e55df47ed043ab2ccc6787e39b9d67e49b
change-id: 20260226-orangepi-sd-card-uhs-0ecb05839b0c

Best regards,
-- 
Iker Pedrosa <ikerpedrosam@gmail.com>

