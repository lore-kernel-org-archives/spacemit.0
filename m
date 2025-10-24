Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA09736A5F6
	for <spacemit@lists.linux.dev>; Fri, 24 Oct 2025 19:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761333357; cv=none; b=j3htkBUGaLNe9J4FDdqnmtNp42i4Spc81Mdfrau47pqu5Tw+8I5kyH2WAiT/6WDhiC5MsS6KkEUa8Rj1xlNwEBbiVZ3Iovno+kTfO0dJrjp2iGczS8sSUloSXCDmDuU9OYhwpjRS0FkXUajk+AfyekA00m9LQChajhLT+psPMZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761333357; c=relaxed/simple;
	bh=pYEC/hTDDpoyfVbfoYHFpH0exPsJY0khjjaveQnHtzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=krXu0XGCeulyW1Cjqn3zTZFSnr/uWhoikgqJKDAmOGCk1m56Dg0LavdRAL9Af42p08CsGytwiBAr4iMlv3s+iIOTtBxX15vM9ZoDVEc2xX0GRUtX4H9D1XK0bJaJAj/mbaCTurRduUdm0tA+A6mAp/UTzhMJnoNoJYf+DaYEWxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=CVN5FVEC; arc=none smtp.client-ip=209.85.166.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="CVN5FVEC"
Received: by mail-il1-f193.google.com with SMTP id e9e14a558f8ab-430da72d67bso17959345ab.1
        for <spacemit@lists.linux.dev>; Fri, 24 Oct 2025 12:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761333355; x=1761938155; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5hqIIxYoJfbzcFUkevnIvDyYXIbJhiiIxZ4aEshcKOg=;
        b=CVN5FVECtHHbQg+5rwl10M2IZoGh0OHaZ0E4KnZQPI4FpLNqdVprDQGQHR+63UKvXc
         mfySv7ZDlgNdBwTf2OoU+UAniUEnbIIzQ9nw0bNLBbbT1Z4sNBm6hJkBqp2e219rVwM0
         PTkRuzbPdRePGyc7eFMnbhgu8mcJMHUSjYsUAStkkHwudjKJK5ooV3cKu6RiEtxHWaX7
         IHqetZK+dwLVbx0sfABiOBn6kScT8GLQCEF5SFHS8AlEayMktsGbjZ24sYS++wPAW9ne
         m6flCPMWJggvgN2J0eZ7qStezaJPOfgSg6ZjOFD205SuaPdEgIgxbbKdEKt8tnAVXFYE
         C8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761333355; x=1761938155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5hqIIxYoJfbzcFUkevnIvDyYXIbJhiiIxZ4aEshcKOg=;
        b=k7oQUCDl7kGXJrMybrxx9H6H8QhBktwJYfhCxyJ5EdAdWbkl/SuW6CpoK3om0SXDeN
         bUjhDDhG6IqeRJkauhpMKKE1ADUeM2SaRJ90YBuXPDhTVu+p0Qtgeb5xFBTW3kJoKRqG
         50bMAnf1W5Mp/493Rz7+XVpzRc6ADljK/4cWItT+s2ObT1SGUtuHWEGru82W7/hjShQq
         tAudMAITAiO+hzbgPM1BofeSDcEZElx2/2KcOAgUyXVX2zPa67fHLC4MP6paehbnHoUp
         WjApmlBghJgyiEUVi7kWkW+XrhYtCx/j4dMjMVeFjOs5s5lzvHN4OfM64nwWcbmeHWOI
         YvtA==
X-Forwarded-Encrypted: i=1; AJvYcCVc3S2J1T9it2032aGya5FqMXtIzsmBAOn5ILoMbL8KQ9rXebkiGIlkgD9IrUygU0TTdt2kqzMAkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzUnwCcwTBnoI++TSqr4HLYPu69huASz5R6sXqGezCGAGkUNEt2
	wFGtf+C/C185O/J5YLWVDE8OPvKzH+xaUQ5aAIapNfJ/KVDCgB14rBXJ8JzVDkfymmk=
X-Gm-Gg: ASbGncsTpaGcCcIPqqNc5l2CFxcqrH0wWmtvhDgndF+hG59kKXksyqLM3Zl54S+Gvx4
	iQ7ZyMoBnRl3vFWvUYML7OKjawKfBa1u9c8uIm/dMCDJHIL7rqqbr0yBQfPc8QwmoKk71EdxDFi
	8cMmk9UGr/GM18abJVtpWq61aIIAH2yx1O/2hQNZKmeG6OJiUwOLT7ZNuH4lIOSrL9NXKA7Eqy4
	7wF/ogBJz6N8Snh1O18VQygBqfgrcqpTe9MJtMqpzkwBFMMEd418Upw+bVao4AeXst186jCfo4r
	ODINepidKRac6FMlHCpTeGh47vRnCY7L1ioIqiIET44hfWNCFX56Zi/A4sjsHDZz1JeyhtKZsfh
	I9EVP+e5qxPH9GIe01P25HhRr2xBeIJVwFvvaTyF+g1poYHElBVn5RiBFsnMaRhk9ipMAZg6mJf
	8VzSlnQcPnManby8iCvpOXIa1TSGviu424Ner6FCfbbMFDD7pj4xg+zQ==
X-Google-Smtp-Source: AGHT+IFf6y19COM4VMTPijjo8N/XwohbmjTEdQxUdhW3R9LdR2ndKIPLgXKS2XAlzSenv51Gg++n7g==
X-Received: by 2002:a05:6e02:2502:b0:431:d678:fcb with SMTP id e9e14a558f8ab-431eb668375mr53003245ab.9.1761333354916;
        Fri, 24 Oct 2025 12:15:54 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5abb7fdb7c7sm2427824173.44.2025.10.24.12.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 12:15:54 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	han.xu@nxp.com,
	broonie@kernel.org,
	dlan@gentoo.org,
	pjw@kernel.org
Cc: Frank.li@nxp.com,
	p.zabel@pengutronix.de,
	guodong@riscstar.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	apatel@ventanamicro.com,
	joel@jms.id.au,
	geert+renesas@glider.be,
	cyy@cyyself.name,
	heylenay@4d2.org,
	conor.dooley@microchip.com,
	fustini@kernel.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/9] spi: enable the SpacemiT K1 SoC QSPI
Date: Fri, 24 Oct 2025 14:15:40 -0500
Message-ID: <20251024191550.194946-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the SpacemiT K1 SoC QSPI.  This IP is
generally compatible with the Freescale QSPI driver, requiring three
minor changes to enable it to be supported.  The changes are:
  - Adding support for optional resets
  - Having the clock *not* be disabled when changing its rate
  - Allowing the size of storage blocks written to flash chips
    to be set to something different from the AHB buffer size

This version of the series addresses comments received in review of
version 2.

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/qspi-v3
  
Version 3 addresses comments recieved during review of v2:
  - This version fully tested and confirmed to work on BPI-F3
  - Added Acked-by from Conor on patches 1 and 2
  - Added Reviewed-by from Frank on patches 1 and 6
  - Moved the reset property conditional under allOf in the binding
  - In patch 5, needs_clk_disable() is no longer inline
  - Tweaked the description in patch 5
  - Renamed a local variable to be "sfa_size" in patch 6
  - Changed the subject line in patch 6
  - The sfa_size field was not being assigned in spacemit_k1_data;
    now it is set to SZ_1K

Here is version 2:
  https://lore.kernel.org/lkml/20251023175922.528868-1-elder@riscstar.com/

Version 2 addresses comments recieved during review of v1:
  - The "reset" property now only applies to spacemit,k1-qspi compatible.
  - Patch 1 (previously patch 2) now points out that this is the first
    non-Freescale device using the binding.
  - Added Frank Li's Reviewed-by on patch 3.
  - A quirk flag has been renamed to be QUADSPI_QUIRK_SKIP_CLK_DISABLE.
  - The predicate for that quirk now returns bool type.
  - All other similar predicates now return bool type; this is done in a
    new patch (patch 4).
  - If non-zero, new field fsl_qspi_devtype_data->sfa_size defines the
    size of the serial flash regions, rather than ahb_buf_size.
  - A continued line in the Kconfig is now aligned.
  - Patch descriptions are wrapped at 75 columns.

Here is version 1:
  https://lore.kernel.org/lkml/20251020165152.666221-1-elder@riscstar.com/


Alex Elder (9):
  dt-bindings: spi: fsl-qspi: support SpacemiT K1
  dt-bindings: spi: fsl-qspi: add optional resets
  spi: fsl-qspi: add optional reset support
  spi: fsl-qspi: switch predicates to bool
  spi: fsl-qspi: add a clock disable quirk
  spi: fsl-qspi: introduce sfa_size devtype data
  spi: fsl-qspi: support the SpacemiT K1 SoC
  riscv: dts: spacemit: enable K1 SoC QSPI on BPI-F3
  riscv: defconfig: enable SPI_FSL_QUADSPI as a module

 .../bindings/spi/fsl,spi-fsl-qspi.yaml        | 15 ++++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  6 ++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 21 +++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 16 ++++
 arch/riscv/configs/defconfig                  |  1 +
 drivers/spi/Kconfig                           |  3 +-
 drivers/spi/spi-fsl-qspi.c                    | 88 +++++++++++++------
 7 files changed, 124 insertions(+), 26 deletions(-)


base-commit: 72fb0170ef1f45addf726319c52a0562b6913707
-- 
2.48.1

