Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B181C21882B
	for <spacemit@lists.linux.dev>; Tue,  6 May 2025 21:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746565606; cv=none; b=h7lnGVyj2XfH2fsASCevkDDP6QEd+QQgGLMDuUjWYhDlsEJRGG2+PTRF4qvFz+1bnqrbNLsjzLYGyhhmN0K9FmgYzZfB703BgKwfld113qxg/OOUiiws71P6FMkPJtldgHSepd/uaaviCfw+t3Cgba9FHYVjN4J+lf/RfCh0Xp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746565606; c=relaxed/simple;
	bh=ERNUVozEOVt14+yZDFjTZpFiaXN84yn5w7dLaTHaL9I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FPX6u592F/L9vaQV/pBpfAqSBrqx5oFo0l5wyFrJe8l8xj8UWskX9r4VFdZqyKWlo7xDABSsAGq3Js1LtX+VhM6r9EgR1CBNj3yHYN32z29uwU9CMewc0ZeM2HTNj7qo0FBrif88Ou4keKUaDSi5WrQotZgv7pOzc0mio1U/NEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=s6abXq4T; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="s6abXq4T"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-85b41281b50so183278139f.3
        for <spacemit@lists.linux.dev>; Tue, 06 May 2025 14:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746565604; x=1747170404; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ctQSvVihHY5dWsU4MBBsIjj+H5evIdxG47g04dOZUkE=;
        b=s6abXq4Tq3x2mJoBNN1aOmX0TAxK4hfYL6iG5vXTyFHerf7IST329T7WMj63yhviS5
         IUG4EVVoWDjPliXWWAlvCwB0AIyL36Dq09VWqRSKqpATSBJlpazk9snn52LvoWk3q5So
         80g9NAZu88Lu2fpPYbNVDotePt+Cty5SpCaauB9mJSWp+gd2OGn4DeTC1mg/EWWE0kcO
         MZS250uc5z1ZCUy3ZS7kqGSxDMJ5VEFzlgLJOafbEN1zn0Ker+UrW1WD6snqD3ChfxJv
         mbRYOzl2BFLUx5OlhGVGTrsgjdg+KTGhhWmHFwM3+4Ip73AvVIzwIesho53huipdxAV5
         js2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746565604; x=1747170404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ctQSvVihHY5dWsU4MBBsIjj+H5evIdxG47g04dOZUkE=;
        b=Zv3wjkqjIAfnftMUC6rb9pm+lSoXmVgzginDeXqjWq1vtPladT5L3AiQKlNGYkcg0B
         1n2R+SgRonJ1XoDJyNsiV8m0N88j4CF6XZ6su7ayUXIJw8Mrb6zJHQklgJQcJ6hz/yZv
         temp0zl4hivXU8wOz9TWsmUFlo6YCwPAHpD3IvhpoS0d3KMxq2c12fJZYu09mnrbobnV
         39RseLaO661ltDD3A8domZHRhZYWmjss4xXpIyMnQrckFzsCSmJmfDg7OMjUNjFgZcIC
         hDiO9zgyu5xmGUnJ3muucP9ORTi6mmQE+AVCZhHfquBHHIWyYHBLSXuSpxWwgFgHBgNT
         a4/w==
X-Forwarded-Encrypted: i=1; AJvYcCVcreqf1AWXcex59p2R45M96P+5PVi6P4JbJH7z88M1yG+iACCpPd3w/8lKyeP4WnTi9jjqUwz3iw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzk6A/IsMCOai3tOmeCk+cNommZ3c4zSd054DT+hq731WePnbe1
	NKNYP5ihFAuTdXoUVGXlQ/fqWO8jkOYhcHoa15i4pjxZc09UPR5RCi0OnSd3zHs=
X-Gm-Gg: ASbGncv3f9T3GRctZ1wI+acVC3D6ovnT1lW6hMRtNurJU83/2zeTx6/IT2PmVsBst+m
	FqV1STvbvP9uxWPcms+EmN7jsv//h42BCvt7dqX5dIiwWI+BrzR5Dprl0JecjlbFQROU2qAoYLH
	J65rCzDJOeEDDZnP52sUBb9ownqnsWtFUU0NVo3mIJ7Aq3iSRxs/uDH9TKL2R6FbPP5azHIkuU9
	M1r2/0F/CzM9bWf4h+Tzv0KZu/OhbBz2JJv6cObVSzcsxFUmBUvtB022BGhUDKXMkrXB2n3D6sX
	YaV3wma8GfngRRx58BO47Gkouw57KUT7FVsbCjeElEP7OKsxTeqDa4NdQ7Ay4Vs6u+zACjkjqw4
	zB3gF+39wyPryTg==
X-Google-Smtp-Source: AGHT+IHmLwR/RdxY6gKxsVffp2BFaQw1Bk6UdfmCxeRt2RRt1uEhRJSBeWBP2YNWT9ppTywhStu3jQ==
X-Received: by 2002:a05:6602:6b07:b0:85b:41cc:f709 with SMTP id ca18e2360f4ac-86747413db3mr136372539f.14.1746565603723;
        Tue, 06 May 2025 14:06:43 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88aa588basm2419559173.79.2025.05.06.14.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 14:06:43 -0700 (PDT)
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
Subject: [PATCH v6 0/6] clk: spacemit: add K1 reset support
Date: Tue,  6 May 2025 16:06:31 -0500
Message-ID: <20250506210638.2800228-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds reset controller support for the SpacemiT K1 SoC.

This code builds upon the clock controller driver from Haylen Chu.
This version has been reworked to use the auxiliary device model,
as requested by Stephen Boyd.  As a result the reset code resides
under drivers/reset rather than drivers/clk.  A new header file
holds definitions used by the clock and reset drivers.  The first
patch is the same as before, so I preserved Krzysztof's Reviewed-by
tag.  I dropped the tags from Haylen and Philipp, given the new
location of the code.  (The actual reset code is largely the same.)

This series is based on the "for-next" branch in the SpacemiT
repository:
  https://github.com/spacemit-com/linux/tree/for-next

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v6

Between version 5 and version 6:
  - Reworked the code to use the auxiliary device framework.
  - Moved the code supporting reset under drivers/reset/spacemit.
  - Created a new header file shared by reset and clock.
  - Separated generic from SoC-specific code in the reset driver.
  - Dropped two Reviewed-by tags.

Between version 4 and version 5:
  - Added Haylen's Reviewed-by on the second patch.
  - Added Philipp's Reviewed-by on the third patch.
  - In patch 4, added a const qualifier to some structures, and removed
    parentheses surrounding integer constants, as suggested by Philipp
  - Now based on the SpacemiT for-next branch

Here is version 4 of this series.
  https://lore.kernel.org/lkml/20250414191715.2264758-1-elder@riscstar.com/

Between version 3 and version 4:
  - Now based on Haylen Chu's v7 clock code, built on v6.15-rc2.
  - Added Krzysztof's Reviewed-by on the first patch.

Here is version 3 of this series.
  https://lore.kernel.org/lkml/20250409211741.1171584-1-elder@riscstar.com/

Between version 2 and version 3 there was no feedback, however:
  - Haylen posted v6 of the clock series, and it included some changes
    that affected the logic in this reset code.
  - I was informed that defining CCU nodes without any clocks led to
    warnings about "clocks" being a required property when running
    "make dtbs_check".  For that reason, I made clock properties
    optional for reset-only CCU nodes.
  - This code is now based on v6.15-rc1, which includes a few commits
    that were listed as dependencies previously.

Here is version 2 of this series.
  https://lore.kernel.org/lkml/20250328210233.1077035-1-elder@riscstar.com/

Between version 1 and version 2:
  - Added Rob's Reviewed-by tag on the first patch
  - Renamed the of_match_data data type (and one or two other symbols) to
    use "spacemit" rather than "k1".
  - Replaced the abbreviated "rst" or "RST" in names of newly-defined
    sympols with "reset" or "RESET" respectively.
  - Eliminated rcdev_to_controller(), which was only used once.
  - Changed a function that unsafely did a read/modify/write of a register
    to use regmap_update_bits() instead as suggested by Haylen.
  - Eliminated a null check for a pointer known to be non-null.
  - Reordered the assignment of reset controller device fields.
  - Added a "sentinel" comment as requested by Yixun.
  - Updated to be based on Linux v6.14 final.

Here is the first version of this series.
  https://lore.kernel.org/lkml/20250321151831.623575-1-elder@riscstar.com/

					-Alex

Alex Elder (6):
  dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
  soc: spacemit: create a header for clock/reset registers
  clk: spacemit: set up reset auxiliary devices
  reset: spacemit: add support for SpacemiT CCU resets
  reset: spacemit: define three more CCUs
  riscv: dts: spacemit: add reset support for the K1 SoC

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 ++-
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 ++
 drivers/clk/spacemit/ccu-k1.c                 | 220 ++++++++---------
 drivers/reset/Kconfig                         |   1 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/spacemit/Kconfig                |  12 +
 drivers/reset/spacemit/Makefile               |   7 +
 drivers/reset/spacemit/core.c                 |  61 +++++
 drivers/reset/spacemit/core.h                 |  39 +++
 drivers/reset/spacemit/k1.c                   | 231 ++++++++++++++++++
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 128 ++++++++++
 include/soc/spacemit/ccu_k1.h                 | 155 ++++++++++++
 12 files changed, 777 insertions(+), 125 deletions(-)
 create mode 100644 drivers/reset/spacemit/Kconfig
 create mode 100644 drivers/reset/spacemit/Makefile
 create mode 100644 drivers/reset/spacemit/core.c
 create mode 100644 drivers/reset/spacemit/core.h
 create mode 100644 drivers/reset/spacemit/k1.c
 create mode 100644 include/soc/spacemit/ccu_k1.h

base-commit: cb9c3aeae509b36afbdf46942a7a0a0dfc856ce7
-- 
2.45.2
