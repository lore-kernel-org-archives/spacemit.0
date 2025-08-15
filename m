Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81C812F5A5
	for <spacemit@lists.linux.dev>; Fri, 15 Aug 2025 05:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755235057; cv=none; b=ZAoV9+fBJIyzel8RA9FeeATdBjDE073qfmKGE5JdjInu6KmnZy+HFIYQhTma1nQIUfti7h8pYfx5kijjhVSoRRF/qu7Ub1dBSKaLyBHFgNawE6DRPjtFh014vQWmrlaWyFquZyv29Meyg/8/aI5Uy6FXkvJlm+t4CAD8wQxRHbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755235057; c=relaxed/simple;
	bh=mWaMCUEcTS6Om9m2D3XYdgmXRgQSLad01mUMJB1Us3g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fxNz6Bg3dQwp2x9GwH0AN1WrdkGWV+PEz4G0Kf8zpwdvQ/4cASHK3wiQu+3W7p1SB+e4u5gLMFSCi+5CrKv3gJ3Dx6BZ31VsIEGWvF8itgBTvA+YYKFUlym5rB5iQAcGHj0rst1ZA/831u/HKlCr/MVuBoOqpwi4xYVRtTD0hvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=r5vSg5gY; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="r5vSg5gY"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-32326e66dbaso1318704a91.3
        for <spacemit@lists.linux.dev>; Thu, 14 Aug 2025 22:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755235055; x=1755839855; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t/YR0q010G47bb6uvqaqSOeiGHOWu114jtbq9qGbwyI=;
        b=r5vSg5gYRXmKKZ/MaVo6DxVknePpiyUQth1jrR62F4Da1gKWDDo0xCqHLKrAt2W7zM
         kGqYQQjUOU695coMNKOUE2uC+M+Do/B7DBV/OwPVhTinm1Vw1A+53LR3L0pR8TcchqpA
         Y0s1NFvV15u0eWDnfCVTJztN4LfJ1gFZ/pEf85ZJ8I0+7DUMsRJqHkEi6SEDh6TTXl/P
         We1u9xHSrpC8JxaIZ348MT5+7rkCLzv1jiIYIuO6b9vjjpfJ+myrjX5lg0bJssYgCcdh
         eigZ7b9e3oYUoMpdrwGbfSaMnnyecAYHghZ9redNuAmQK/Lc5QXYOuDCw6mSEZQu4Pqa
         ObPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755235055; x=1755839855;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t/YR0q010G47bb6uvqaqSOeiGHOWu114jtbq9qGbwyI=;
        b=fR81jgGkUlyEI5nq3ZDAxQw0o0PIpJo13Sv/F6jCU+u9kvzAW6K3vvgU+apUrC/Zov
         q4B6KAmYPqHOP2/YXCPYoW/GwPc/c+m8z4QsYBiqxZIZBsyI3GWkrilg/1u56uhcUri1
         rfbvQNyQA0GIKQEsR+NFWw+1KDf6pYjIj9ltFGF3JCOzD+n/EXKPjl2XbSk27kn8K9X0
         GE9AHqkaUZMYxCkyhxtN2eNy+zf+xyvg+rUoIGpYww/Y+JBEiXY+e3OZE5jw0H02MXCI
         GXvj3mjjllMp7ws1hmtAUGHd7jSSm+3fTkCVRP3qb3qWYQPkOD2sFwaVtpZL1W8JT00X
         7+uQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrshNbM10Z2PdkPMz74lzbZicWeokquXM2adlvt7SihA6MPQ+EmRjXKyY8iieTlxNJYIEBI297Tw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzuMfsK26ejP+8V/33YXLoEPKgAfC2noy6G8XX9WLUMAagMuFtb
	r7i8dheHFMxUZDblE+9YYRO5ZIR23eyhls1OOdnn2oFWs5Kr7aZUHDa39iRtyTS91M4=
X-Gm-Gg: ASbGncsGf7YZHmPxnSDQnj1+sLjNtZs5pFIpu25b+/Y1SUAZbjCKc1rQYLlcIpXWgVC
	YUE5GdRG64TkKslPrz3Kxm5Jp4K5Y9MmLjjJwyajNWh+kL7X0gMfGKm0Rz9YLB1IlmLir4JiQge
	XVG+qov+xXlKUcTReDOIfMs5bciWuUhWbugBSvZe3805QxOLL2wMDxH+1e8it6G93KoLl/GwZgr
	YazEYuu1DpFjCWwqxb/6482GJXrgaDjq1TiCGpA9lO0NWAZQGlduC3D1L8SHWYYFEqwTWUpwGPk
	+B9v0d4aMB0AjpbwOz4n0nBxnDxW0aVdITVxapf96Kma2hUbbUp1Dqi4JjRNCrFKGD8N0YAip3e
	riZBSXmdbI4JD+7pz4tNpBg==
X-Google-Smtp-Source: AGHT+IFT5uLaaFT7Gpf84nOg/qxTAgmBlTxCOXGoRCU2+Aj7ez4/ag54Q2dJu2pQHnJcOaMlqw+hJw==
X-Received: by 2002:a17:90b:4fcb:b0:312:1c83:58e9 with SMTP id 98e67ed59e1d1-32341e12ccamr1329199a91.5.1755235054555;
        Thu, 14 Aug 2025 22:17:34 -0700 (PDT)
Received: from [127.0.1.1] ([103.88.46.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-323439978a4sm373212a91.10.2025.08.14.22.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 22:17:34 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v4 0/8] dmaengine: mmp_pdma: Add SpacemiT K1 SoC support
 with 64-bit addressing
Date: Fri, 15 Aug 2025 13:16:22 +0800
Message-Id: <20250815-working_dma_0701_v2-v4-0-62145ab6ea30@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKbCnmgC/32PQW7DIBBFr2KxLhHgALFXvUcVWRgGZ1TZpOCSV
 pHvXkw2UVVVms3/0rw3cycJIkIifXMnETImDEsJx5eG2ItZJqDoSiaCCck04/QW4jsu0+BmM+z
 FkAXVTlgvmTLGaVI2rxE8flXq2/mRI3x8Fvj6KMloElAb5hnXvsnqwDWNlpNna99Up+KcFm3EZ
 DN14G1YPE5U+4553Tpxal2fOdk1F0xriN/1lyyq59+zyzBqRgXQcc2dUK+7Ja0mHsppFZnbJww
 //o1pC+Y0Mi+t01x28hdm27Yf4nxvgmcBAAA=
X-Change-ID: 20250701-working_dma_0701_v2-7d2cf506aad7
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, duje@dujemihanovic.xyz
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2

This patchset adds support for SpacemiT K1 PDMA controller to the existing
mmp_pdma driver. The K1 PDMA controller is compatible with Marvell MMP PDMA
but extends it with 64-bit addressing capabilities through LPAE (Long
Physical Address Extension) bit and higher 32-bit address registers (DDADRH,
DSADRH and DTADRH).

In v4, the entire series were rebased to v6.17-rc1. Added reviewed-by from
Rob Herring to patch 1/8 which created the yaml binding schema for SpacemiT
k1 PDMA. Troy Mitchell tested the whole series with i2s and dmatest.

Commit messages in patch 2/8 and 3/8 were modified but no source code
changes.

Renamed the node from pdma0 to pdma, and reordered properties inside it
to make them consistent with other nodes, per suggestion from Yixun Lan.

The patchset has been tested on BananaPi F3 board.

This patchset is based on v6.17-rc1, with patch 8 (defconfig) depending on:
 - riscv: defconfig: run savedefconfig to reorder it
 Link: https://lore.kernel.org/all/20250611-01-riscv-defconfig-v1-1-b48fc3517498@gentoo.org/

All of these patches are available here:
https://github.com/docularxu/linux/tree/working_dma_0815

Changes in v4:
- Rebased to v6.17-rc1.
- Updated commit messages in patch 2 and 3.
- Renamed the node from pdma0 to pdma.
- Put "interrupts" after "clocks" and "resets"

Link to v3:
https://lore.kernel.org/r/20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com

Changes in v3:
- Created separated yaml binding for Spacemit K1 PDMA controller
- Updated pdma0 node properties according to the new yaml binding
- Put pdma0 node in k1.dtsi according to its device address
- Put pdma0 node in board dts files according to alphabetic order

Link to v2:
https://lore.kernel.org/r/20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com

Changes in v2:
- Tag the series as "damengine".
- Used more specific compatible string "spacemit,k1-pdma"
- Enhanced DT bindings with conditional constraints:
   - clocks/resets properties only required for SpacemiT K1
   - #dma-cells set to 2 for marvell,pdma-1.0 and spacemit,k1-pdma
   - #dma-cells set to 1 for other variants
- Split mmp_pdma driver changes per maintainer feedback:
   - First patch (4/8) adds ops abstraction layer and 32-bit support
   - Second patch (5/8) adds K1-specific 64-bit support
- Merged Kconfig changes into the dmaengine: mmp_pdma driver patch (5/8)
- Enabled pdma0 on both BPI-F3 and Milk-V Jupiter

Link to v1:
https://lore.kernel.org/all/20250611125723.181711-1-guodong@riscstar.com/

Signed-off-by: Guodong Xu <guodong@riscstar.com>
Tested-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Guodong Xu (8):
      dt-bindings: dma: Add SpacemiT K1 PDMA controller
      dmaengine: mmp_pdma: Add clock support
      dmaengine: mmp_pdma: Add reset controller support
      dmaengine: mmp_pdma: Add operations structure for controller abstraction
      dmaengine: mmp_pdma: Add SpacemiT K1 PDMA support with 64-bit addressing
      riscv: dts: spacemit: Add PDMA node for K1 SoC
      riscv: dts: spacemit: Enable PDMA on Banana Pi F3 and Milkv Jupiter
      riscv: defconfig: Enable MMP_PDMA support for SpacemiT K1 SoC

 .../devicetree/bindings/dma/spacemit,k1-pdma.yaml  |  68 +++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |   4 +
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts  |   4 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  11 +
 arch/riscv/configs/defconfig                       |   1 +
 drivers/dma/Kconfig                                |   2 +-
 drivers/dma/mmp_pdma.c                             | 281 ++++++++++++++++++---
 7 files changed, 339 insertions(+), 32 deletions(-)
---
base-commit: 062b3e4a1f880f104a8d4b90b767788786aa7b78
change-id: 20250701-working_dma_0701_v2-7d2cf506aad7
prerequisite-change-id: 20250611-01-riscv-defconfig-7f90f73d283d:v1
prerequisite-patch-id: 53bda77e089023a09152a7d5403e1a738355c5d3

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>

