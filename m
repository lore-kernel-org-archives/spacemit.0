Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CF81EEA47
	for <spacemit@lists.linux.dev>; Fri, 13 Jun 2025 01:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749777107; cv=none; b=AN0KimpgBihYphReHm6tqwXFsaCHECUN5FemQBkausbITsapNR4etH1e8fJeNlaNmiBlH1A9E/2V4fYT8nmJxX4llvS9tWx6D0TyXsdq/kqse2scLDnokKL2BPB6H7KP9xlHoVdMO3MnZIBvEEPFeNE1YDoK/RVC7LGOlSwHNUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749777107; c=relaxed/simple;
	bh=8u736JUylRMKJQJC8tFKjjHmAF3VB42qomu/hTIe6UM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I/CGMbq+dr3Pleo4lcvVWSULRPdTyJXiBshUXxjTf3YSNSILf4aVqGfNsnFNZ6IM3904su5IMt1L7ciAnvHIbMsMoYobQIu3YUJ+spnU0wRqnHPuYOE5nz0ol+WLoQiVqa3/5oEDfItjODPlEVFABikwHUq3e+aqL7Y+bzEEyPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=a5H1B9JM; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="a5H1B9JM"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2d09d495c6cso425414fac.3
        for <spacemit@lists.linux.dev>; Thu, 12 Jun 2025 18:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749777104; x=1750381904; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qLjk8AtIe7EkG0gXs3iZYCpvTmGpW65yPt2cGZeyPVs=;
        b=a5H1B9JMlCm2On31YCoM1YxUA5JWWaNEugvKUGX/0WOQ3rccK8Glu3FiJZmENjYWc6
         GvMdNR5jd96YHhC6b40zBCrQSHdhTZw3EL9Ei7u9jtdyJge34GaLNlp1ykOWA95Lvgcw
         i0M1fDBMVeBBy5SLEkmTl4qZHNDZH8ZgXBwyrxoTiokF9C40YNMii6K2n4wpiI60Iem5
         J3j2TwSm0sr6NQdAGE0o/hCQAAcCVOvKYpEoea6ctAstSZUQio7hALvWVlSnlqPlMQtg
         bGqssCVokWeUn9KTRi3qxtjUpnK9O2AgvC9wywooYCCUWR5+DvzsMIls9jvKIEbhQZ5D
         bGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749777104; x=1750381904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLjk8AtIe7EkG0gXs3iZYCpvTmGpW65yPt2cGZeyPVs=;
        b=mSyk8zUmUt8FbI04wLtrApaWYGB04ebYQXE3j0m6qxrEXc0Vb88D9xzLXn3OzeyNGk
         djDayCilrdd4gZZD/dPvfqcrHUl3t0UNXFdNZqO9JpO1GuLSbQT5+4OvG6Dssacy9HB6
         ENyuLuqHQhh1Fu5kxx/u+fhTubHsk9zvZ0bbO8t8ufQaHEQ76HUm07LeXmBJt1sd1Wr/
         NJ38quAy3MapUA3dDghQy8TqNiLxaXwokvWSPavDTXMNtfDxqwXlrTX6+QDkWEFpBH+6
         ySd+01ZXGpQM2X+YODpJm59e+2weyYNmE3mtlTR6qofMC6Om3oa/3+DkT+iVdLT2MbEH
         IlpA==
X-Forwarded-Encrypted: i=1; AJvYcCXEqprD4DZlzfxVo8knYLGPQ5Lhq84xRN7Aa6hJx84mXZ7rsCbqb3V7odSzYvVbduFsHs/D4fqSSg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxSwSBYGqMt4d7xelUGlMaV2ZBruRZOsdlYmxUmNAguNmX/5ez4
	ZWGeQe9lKaESJW9vq0VawZYNlRQiZ9KXhytO4dYXoFJg/wz192jOjIEUP6NCv992XD0=
X-Gm-Gg: ASbGncs96vlyN0pYYuMmoPoV2RKw+1xtgOFXKO4BGlC6RDkHqw6AYyVv/09K56JoAi3
	l4AljgxVvAPWWkCpuw6To1KhFMljJkm9a36sUXlc+GBDvAcIzExZ53co42sq3g+0az/uMmZmNnw
	D9d4hvBBEYq9oMnlHdKgYcuGE0esjrkiVwyn2wis0iPtLJyKy4R55KwF2irvJ2jHx82z/dYJCrJ
	EELACQbfhU0tQJnJKrptuyEtzC5XSykeE7/iwERZy9fIyxutReI1DcIG9bdnyhERZbLAasXieZ+
	17R/iPjvrSLVGXABMSI5gw/A0fLusz7ZvoiU1+u3Dij69wwJvqiyJy5VAeZdLHIgvHJboU69bJQ
	QxZel9kOdHzcFatcYlMx5K7sHuEG0uSsJIrI4Sc/pfg==
X-Google-Smtp-Source: AGHT+IGuYA1UmF+qyhDFUECuEGO+2TaO/UuS30QC1CnU/pGEOag7zhyk90q5MH8bH5ojGbCRLTOPgQ==
X-Received: by 2002:a05:6870:ab09:b0:2e8:7505:638e with SMTP id 586e51a60fabf-2ead51cc4c8mr724652fac.39.1749777104481;
        Thu, 12 Jun 2025 18:11:44 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eac0c17211sm407685fac.18.2025.06.12.18.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 18:11:43 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 0/6] reset: spacemit: add K1 reset support
Date: Thu, 12 Jun 2025 20:11:32 -0500
Message-ID: <20250613011139.1201702-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds reset controller support for the SpacemiT K1 SoC.
A SpacemiT reset controller is implemented as an auxiliary device
associated with a clock controller (CCU).  A new header file
holds definitions used by both the clock and reset drivers.

In this version several "multi-bit" resets have been redefined as
individual ones.  For example, RESET_AUDIO had a mask that included
3 bits.  Now there are 3 separate resets (one for each bit):
RESET_AUDIO_SYS; RESET_AUDIO_MCU_CORE; and RESET_AUDIO_APMU.

The reset symbols affected (their previous names) are:
    RESET_USB3_0 ->
      RESET_USB30_AHB,  RESET_USB30_VCC, RESET_USB30_PHY 
    RESET_AUDIO ->
      RESET_AUDIO_SYS, RESET_AUDIO_MCU, RESET_AUDIO_APMU
    RESET_PCIE0 ->
      RESET_PCI0_DBI, RESET_PCI0_SLV, RESET_PCI0_MSTR, RESET_PCI0_GLB
    RESET_PCIE1 ->
      RESET_PCI1_DBI, RESET_PCI1_SLV, RESET_PCI1_MSTR, RESET_PCI1_GLB
    RESET_PCIE2 ->
      RESET_PCI2_DBI, RESET_PCI2_SLV, RESET_PCI2_MSTR, RESET_PCI2_GLB

No other code has changed since v10.

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v11

					-Alex

Between version 10 and version 11:
  - Rebased onto Linux v6.16-rc1
  - Redefined several "multi-bit" resets as individual ones.

Here is version 10 of this series.
  https://lore.kernel.org/lkml/20250513215345.3631593-1-elder@riscstar.com/

All other history is available via that link, so I won't reproduce
it again here.

Alex Elder (6):
  dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
  soc: spacemit: create a header for clock/reset registers
  clk: spacemit: set up reset auxiliary devices
  clk: spacemit: define three reset-only CCUs
  reset: spacemit: add support for SpacemiT CCU resets
  riscv: dts: spacemit: add reset support for the K1 SoC

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 +-
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 ++
 drivers/clk/spacemit/Kconfig                  |   1 +
 drivers/clk/spacemit/ccu-k1.c                 | 239 +++++++-------
 drivers/reset/Kconfig                         |   9 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-spacemit.c                | 304 ++++++++++++++++++
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 141 ++++++++
 include/soc/spacemit/k1-syscon.h              | 160 +++++++++
 9 files changed, 775 insertions(+), 127 deletions(-)
 create mode 100644 drivers/reset/reset-spacemit.c
 create mode 100644 include/soc/spacemit/k1-syscon.h


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.45.2

