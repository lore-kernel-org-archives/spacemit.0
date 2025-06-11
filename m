Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E7528640D
	for <spacemit@lists.linux.dev>; Wed, 11 Jun 2025 12:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646747; cv=none; b=gJOvG3Egoi6uUnooUO98oAlbmzLA1pariUHZbEKPC75FxLx2Cqf/WGM910B7fh+Vb7dATBf8GGLs8b59WAEQQWOTvIA19f1q/wi/R62atYwyOWJjiSqjqqgg4fHanSUGpmb3uqwEyL6k1a50XiWi/TKatQgKg4aFvmmjGOV0bfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646747; c=relaxed/simple;
	bh=c4q9hKJ0GfSD4cmrQLce0PPykLtXw5caieViAR29pPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C0CQLIvZQv00xZ3pM8TfZ3z7vDOhh9kYA26Y2sjSv1kv5KS5qdbNVa5NfG2FslDHQoFNSVoYYX55b2ivF0ynQpvye9r+Bu3lI+u9S3T+Vbyg/a3+hVAHkBjsIGsCwb1g2t/rjbsEfHyeRpAXEWAvpU0xVKOqQNcMT0BbFVkdZbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=lwgX4Ig1; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="lwgX4Ig1"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-235e1d4cba0so55413255ad.2
        for <spacemit@lists.linux.dev>; Wed, 11 Jun 2025 05:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749646744; x=1750251544; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x4QOx+b/QncvHLv/sLMwOKnuymoyk68+Yx3qOBYw2f8=;
        b=lwgX4Ig1MW1wEfJaDoaPOxvVJCGRx/mBNekSbRhvwe8okG67CpixlJB0SZOAviFVfG
         2NtjoKiwS3LAjaCMMQoVdN5gha75nG4hpzKAgaXLMXD5U4cOd6DdyCEMbjiDXpO1xKSb
         Je9uMJ7vDNO+bOQHNwmkP3Y+MHf1QbPF7cI49fa/Qn3y4ESUh/IMrjvew2k+dDRKUsnU
         0R11RoKb2Gw3CBBcrnT6k7CjmLyY/6aVyZTFGNGy9MFKL5fUclJyYShz6t8euTpD+iyD
         E9bO1umGnhxs2RHiPThGM4xPL9svCApDdBqB66A27WX7vFiB5qo0B6D+VJFEX2yat0s5
         qFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646744; x=1750251544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x4QOx+b/QncvHLv/sLMwOKnuymoyk68+Yx3qOBYw2f8=;
        b=PKVu9G/hWr4JWKvpPG97oyNMCURG3dqwraeQzvXwack3UzlIaGP4pC/pOijB4UN0BE
         VSmJzQNJZYU60/ZW1pThvhpj+cTWmQzxzo4xopfgJzkbSpMt2izneaR/5Ta6KFLJxftO
         GJtlMxnhPMIjdlUkan+eIJ5sG4fnD1xGcbKqie+v794M5znvozV2SfNjv6I22ImgC/Hm
         4cl1dATlC3z4GnY8s0UnADBNxFFDKCBPe8B9nMBu08rOASTJaKIEf83gI8HKaAN6bF1L
         WETm8BPzRK0B0oWn8PjmAQj830wdkBp10/WLwRaQc2CukwpUpi0RTCveUCPCro5v6dtR
         GqUA==
X-Forwarded-Encrypted: i=1; AJvYcCU+7CURpnlLZ3Zzr9wJmXhl3HssaVMbEgvtDC1u8tEFuuVYN1CbVwWKyC9d86c3dnt/bDYKPr33XQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwAt7/z32Wl54/D7V5dusCeFAbKxWYkAtb1tGBNvhI2IXG0U8wI
	x5/ULizFOfAJoc5nN1K1GKxufSYQNy7Ui7jy14x1/IR6/ERQYioPVFFtisK02fDM6Yk=
X-Gm-Gg: ASbGnctDfjlj9rUv1l6+rs8UKHeTNBcqIUBadWnK4hkhA85VMMnCVvLVCo2bC2k7w+D
	OY5sK6xaDn8BjwKWrK1OeUxikWG/FQDhajLLVzuPl1ZGSzTAtNq6ePMo0vbadca0lLF0Hwbu3mp
	AwfbIp8pAn4Yld/KLeLGhQeghUEZ7Nw/hZ0oKicNZwxIEDchrcPimkBdfTbJ8qV+MH2UxAGxtwa
	G2VBZWqBqcoZlHyji74OXyJfW+W3B3ijfMrcNsCb/4+rgaem4gMCCJ7igYNBIKPW7VBwy1iQgXi
	KKq0JbumWyJ9Pdv/bUS69ZVZmgcCfZG3ewiOz6SY/FueBkqSKrNCVwQJz0psZIsmNPmF3x6mDsc
	RLIpoqBoDlYBMJoqOHqnFjA==
X-Google-Smtp-Source: AGHT+IHeeQKbfAGNGeX62nkTUoAIUb+/0YEOPG1s+np4s8lIc4gcrO2OCn3QlplFdVVleQo4sYhIgw==
X-Received: by 2002:a17:902:e74b:b0:234:f182:a759 with SMTP id d9443c01a7336-23641af07efmr51079475ad.28.1749646744203;
        Wed, 11 Jun 2025 05:59:04 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a00:31a4:6520:3d67:ceb1:7c60:9098])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030925e3sm86984115ad.53.2025.06.11.05.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:59:03 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	emil.renner.berthing@canonical.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	joel@jms.id.au,
	duje.mihanovic@skole.hr
Cc: guodong@riscstar.com,
	elder@riscstar.com,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 0/8] dma: mmp_pdma: Add SpacemiT K1 SoC support with 64-bit addressing
Date: Wed, 11 Jun 2025 20:57:15 +0800
Message-ID: <20250611125723.181711-1-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series extends the existing MMP PDMA driver to support SpacemiT PDMA
controllers with 64-bit addressing capabilities, as used in the K1 SoC.

The SpacemiT K1 SoC contains a PDMA controller that is largely compatible
with the existing Marvell MMP PDMA, but adds support for 64-bit physical
addressing through Long Physical Address Extension (LPAE) mode. This
requires programming additional high address registers (DDADRH, DSADRH,
DTADRH) and enabling the DCSR_LPAEEN control bit.

The implementation maintains full backward compatibility with existing
32-bit Marvell platforms while adding the necessary infrastructure for
64-bit address handling through a flexible configuration-based approach.

Key features added:
- 64-bit DMA address support via LPAE mode
- Platform-specific operation abstractions (mmp_pdma_ops)
- Optional clock and reset controller support for modern SoCs
- Device tree integration for SpacemiT K1 SoC and Banana Pi F3 board

Testing:
This patchset has been tested on SpacemiT K1-based Banana Pi F3 hardware
to ensure the PDMA controller operates correctly with 64-bit addressing.
Existing functionality on 32-bit platforms remains unchanged.

This patchset is based on [spacemit/for-next]
  base: https://github.com/spacemit-com/linux for-next
Plus the reset controller driver, posted by Alex Elder (v10):
https://lore.kernel.org/all/20250513215345.3631593-1-elder@riscstar.com/

Guodong Xu (8):
  dt-bindings: dma: marvell,mmp-dma: Add SpacemiT PDMA compatibility
  dma: mmp_pdma: Add optional clock support
  dma: mmp_pdma: Add optional reset controller support
  dma: mmp_pdma: Add SpacemiT PDMA support with 64-bit addressing
  riscv: dts: spacemit: Add dma bus and PDMA node for K1 SoC
  riscv: dts: spacemit: Enable PDMA0 controller on Banana Pi F3
  dma: Kconfig: MMP_PDMA: Add support for ARCH_SPACEMIT
  riscv: defconfig: Enable MMP_PDMA support for SpacemiT K1 SoC

 .../bindings/dma/marvell,mmp-dma.yaml         |  17 ++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |   4 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 234 ++++++++--------
 arch/riscv/configs/defconfig                  |   3 +-
 drivers/dma/Kconfig                           |   2 +-
 drivers/dma/mmp_pdma.c                        | 249 +++++++++++++++---
 6 files changed, 370 insertions(+), 139 deletions(-)

-- 
2.43.0

