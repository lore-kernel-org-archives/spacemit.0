Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9951239446D
	for <spacemit@lists.linux.dev>; Mon, 12 Oct 2026 23:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791849391; cv=none; b=NS1HKMfEEleXnqR3VPFQKUBP/PJ6iCpMJvzjZnVaJgoqTFpAulXaCiZtS47GT6XB+GCrfveuhV6EIQ/7Uph2hXZICmEGStidanRuy9AuKi9RrnLfxk0eROiAisuOpUvENVrLwPk5gAFjapQ8bPUC/VfR2+9BSBziEbHb4O6TtRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791849391; c=relaxed/simple;
	bh=07zRKt+iURfkbu1QFEt/0Wl2s591iOQMk67RKiSaS2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XKRZB6xOj8jY8BoKoT5RaNL4VDe4X/iI4dcc7lwwhN7CLr8TLhf0GVctnXSRFmMV71qGnguBJtvd4FCSdwP/aOmwC/3DVMKYahCeYnWnyTidRNmOQstLp3owxfcFwDblCsTxwA2mM3hbYivqHIOlXN2k8JtI6Wv0KiYK054rqhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBsWybpM; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBsWybpM"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so3727005eec.0
        for <spacemit@lists.linux.dev>; Mon, 12 Oct 2026 16:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791849390; x=1792454190; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1VeLk5FpKsQq/qjV/WEYAWBiUl9W5UJD8Aw3U9SBRbA=;
        b=fBsWybpMHwGJRkgD95Kfqcz9eKajqFPR0CF8KvvH6okk2pkT9JgzXGo+14YmlSh85W
         98LyjM2ozYiAaKjuGpFOT1rU3j4R/Pp2mM/r1eSGgkedFM1RTRxJKcdXAPiruELZYbeq
         7mXkDFUfcmh709ubia1pArbVcPvNbHSuAAr23WVgJmg0HkLMMGreWAW9rnxCbl5loCbK
         OaJ8N9ahZc+SKaprZopzytBZdjVeSAw+d5IAi+7tSdZ6pcLoE4vPWNlirLxZKvBKoNq4
         BZUT5Vpi0ug/KKKI2zKCcrXYfb7MUPwA3XSGf4Xcy0DWIqF1icXTWZlMi3464UUFAiHh
         lv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791849390; x=1792454190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1VeLk5FpKsQq/qjV/WEYAWBiUl9W5UJD8Aw3U9SBRbA=;
        b=cx+1Uwz6F4GG4xtK/Ysgvel9MzEebMAWX/yT+4dPGqKSHe1U8VJiiWrJrPZUmqAJpq
         /N0RtA/He6VRN0L5NGYCpg+d7r+Pcqk7GnwHZMS5Byz03M2uhI14uaBQ/927M4oUCVCf
         3WcogJI3JM2SrydeZOHsa6x7D2rLJ2s0fAeH+YmLdehr/36L/rMYxEOff7i1eN5BTt1K
         dcrdODPI++TmBWC/naT78uHQxlMNo6NSBJOaU/yUPlU02UEGGmq1bRohkJMsN5cgw7MP
         /EONG41M+v7ixrLVDsRDywRCcCYfUH6dJwVhANZEM9eE0FrphH/DWgBTj8WSOB2Sx6EG
         dMJg==
X-Forwarded-Encrypted: i=1; AKwUvBxnfhtKU2iqjI9PTwaJUu5wxYtX+RnZgQilv+jhC3ajljEcsCfTzIRuFHX/Qu6fXoA6+ynOWk0Xjg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJn0zrCP+NSvUe4CF20qVOYk2Co3lFpz0C8ylc769Ff3OQAUSjm
	wgid5luGXvGa0a+jEYY45wCzyVs4h4wVTPpgkpt5Li/Zw1aod6A5u8GT
X-Gm-Gg: AYBFou1GtD0fosJyNbp9Szl+EWNf3kNtWvxGu/GQzhu5bcmEMTUvI1LKSiaCMpVM5Pb
	DXUeQeC4/hwGultC0rNMOQ0JKZH23xac91MIwDWdnWM7rjmLn0QVcfmtTtD3j33CmQKb9PRHKBp
	LQyPG3ACYXRHs8kExg9OKu901b8hx37+GiDZZg8st9pgVKSS8GdtP0n1ewHgrl4GnVZcoY/7Hcl
	XQPxVMgWrWAfHOF6mNXFveBqMKHQ80G3fnNpQzm9VftnHXOG1fRIO/WCpwswyizFfOD8OVmEZJV
	jbWfZyuqJJIbFCQsIZvgtiZmkLLeZHslmxLMzJMUZsN3D4bxXbBuoDmrIHefix4hRjXGNvblT4Q
	+4ivpJgpLkrI/ujVAlfXer1ftZCkToWW4WYRUsO9rPOLMEJehNVXHZtJrgmljqSFMYxZjnkN4fc
	huFMuNsNbQNLuKH0ZPcVzQ7xjtXNzRQRJjtsO+G+6iA+cgBewoYj9B7Fmdio5KZoSmeJSd2nm/7
	BOYpuhm31TZBFZ1uRMQIEJMJGQSxMJrLVX4mRg/fzSojf1YoJfLSsvhilp0cg2r0AZqeqXcvSuA
	WnIF6qL4oIPFT/qAaA3d0HnEnydw2uaHezmF+lAjeEcyLmBN/aW/i5AfvTN00F0S
X-Received: by 2002:a05:7301:4e88:b0:35a:efce:6190 with SMTP id 5a478bee46e88-35aefce65c3mr6631069eec.28.1791849389564;
        Mon, 12 Oct 2026 16:56:29 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b690af3easm8686145eec.1.2026.10.12.16.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 16:56:29 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] riscv: dts: spacemit: mark K1 boot nodes bootph-pre-ram
Date: Tue, 13 Oct 2026 07:56:22 +0800
Message-ID: <20261012235624.77993-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A bootloader SPL on the SpacemiT K1 runs from SRAM and needs a handful
of nodes before DRAM is up: the root clocks and clock controllers, the
console UART, the boot media (SD, eMMC, QSPI NOR), the board EEPROM
used to identify the board, and the PMIC rails it programs before DRAM
training. Today mainline U-Boot carries the bootph-pre-ram tags for
these in per-board -u-boot.dtsi files.

When I sent a U-Boot patch adding another such file for the Milk-V
Jupiter, E Shattow asked for the tags to go upstream first, so every
K1 board gets them and the U-Boot overlays can shrink [1]. Earlier
there was no working mainline SPL for K1 to justify them; there is now.

Patch 1 tags the SoC nodes in k1.dtsi. Patch 2 tags the board-specific
EEPROM, PMIC rails and SPI NOR on the boards that have them. The set of
nodes matches what the mainline U-Boot SPL tags for the BPI-F3 and
MusePi Pro.

Testing: all K1 DTBs build, and dtbs_check is clean for them with and
without this series. I have not run an SPL built from these trees on
hardware. On a Milk-V Jupiter running Linux I checked that the EEPROM,
PMIC and SPI NOR answer at the addresses described.

[1] https://lore.kernel.org/u-boot/5d323a11-da4e-4071-bdeb-ab5c03e8f85e@freeshell.de/

Hung-Chun Tseng (2):
  riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
  riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram

 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts |  8 ++++++++
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    |  8 ++++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  |  5 +++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi              | 12 ++++++++++++
 7 files changed, 53 insertions(+)

-- 
2.43.0

