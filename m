Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA4C20298A
	for <spacemit@lists.linux.dev>; Mon, 14 Apr 2025 19:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744658244; cv=none; b=fMzj+lh2olxyzybSmqO21TzfCsZaOIseH7FwRicKoWY2ENOWq9GxKYryIjLMS0ro4IjUmEbZktqaNNFHIhreaXIw4Js/1IzZBzOxX/R0hrBgiCoguJRXLhckfT/DIiRw5HjlviwmIUB9vK50s3yFCsWjF7E/07d5QyitaVve3vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744658244; c=relaxed/simple;
	bh=oZwsWyN19YQuLxvi70G/U0IIHVAnZHz9qoqnnkeShL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WYTyUCktOlvi5xIoADtzYPIfucEMkrCCJfMa+vbM+2yZ3L8Lp8zrN5KQ71SzsR5Toxg8PxbFzB/enBcNXVOgWTwXZrpxwF/tDnm2eqMhOp4pVcYqkPD12mb9JTOFCl3661V9hUxsv/hvlhtt4N4f4/UWNGnSOfDBm+anoiPW1uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=qYd1T6/C; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="qYd1T6/C"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3cfce97a3d9so14862465ab.2
        for <spacemit@lists.linux.dev>; Mon, 14 Apr 2025 12:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744658241; x=1745263041; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NOnX2shAz2EreIKfS+XNRjetpp9PVDTaCPEwF/lvRS8=;
        b=qYd1T6/CYK4fJrk7H8RbCh1wlTnrvJniWASR8Ge2goK8GP4JIqMYg8p6eiUNvFv52W
         BJThIFFAjkCT2TlScXJvmxHm0HcVTWnzFLN5R64KASNd5C9Gps74FwzBSvgzjcn5fifs
         /ZMcf201MgFH0lP+wfnmUHiGiQy7DyGXHLFGBiE7RzL+lqgzdgQpXtgRgRmAIMCwH8Zt
         z0o64HhVDaWtuu4w6CBb/jZkI9z+QWYe/JF2XvSpJgT9QLv2hmPw8+d+R0sZB+xwnUtT
         p8ha4biwWCJVbvdJpD6MURxSF+cLQ134eLTV8jiFOuwE40EZNODyFRINPOsaF3bQt2Zo
         v7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744658241; x=1745263041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NOnX2shAz2EreIKfS+XNRjetpp9PVDTaCPEwF/lvRS8=;
        b=g51S+mZAZJes6zdfdhZ5eajW5E8DPmBAzEZRsaboybIpvZgaMYFdH0KIK41lxIgv4f
         sQvzdqhwVG/No7aiAxDVXdsf7WBv7VzLy+gTDlebidS3ly+Fy4WqphWSPEBaY8rhchu2
         Jzhym+6iSyFRzXTCN6lWOTSl0Kc/WZl57DXtnCvoUf440SIPcZjTOOjRFp68V4yi8F/i
         oEtDuTR7i1hgQdwO2yddA9SgCrKGNEb3mw5nurIKZ3AY5H6n0dussctgcpVErQn7YH5m
         r6xXGtblqPfPBX7I/eRoJdkFQCmCHwGC824SqKRlIJXvI+mXJW6tH9LL2DXzAexu6W8u
         ERUw==
X-Forwarded-Encrypted: i=1; AJvYcCX+iugXTgei5YXtFpNmYJ7PWYsLKdMhjT950joCKAsnD07wtABy7JCbEmxmKcaDLP3PR3AUYHpLfw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQw2iPQc2xO9Uy1XiLSdFAH6ohTYeOBMRpfVECbPECbu7R0O7n
	mYTushVFf8oibycb+2pCzqv0kWTri72aRfNSS5dr4Aq+cKykscqaAl4/qWucuQ4=
X-Gm-Gg: ASbGncuYAq6bHf8k1X1Q65jJO9fZgM0dQF37Ln68b0YxnqWaJZlPQBAYxrnwKkHMKnc
	jvUcg0MwrWbvH/Sru1URThysUbE4nwDfHvJ/JMyinUblyX/B9GXZ37tlLnp0BILmZRnx/XTvjvp
	h7kAiO8f0Th52ab7bPwQTP5QZw5G+TEIWCW9YP22jf/r0hh34vEGCeum+W9+PO/sxd7vdu6KATt
	PI5I9CF0Gy+WTRtFXdwxAr81bqW91m9BbTXsSgIGMZldeP7VK8GQ8fBONAZY1pTKXdWRlN8knGa
	dHM3YeayRhBtZYfHxscnTp7KNddtYYLldygBRoqC+FwZFeru03vdrRCaccX8Xlq5UzUAvMvXw9w
	7Dcxz1XZzt6Ji3g==
X-Google-Smtp-Source: AGHT+IF+wewcSr2YJ4blAeH5OccXBibu/mClWnQWAdm112vnTse7zLtH44BvxSZA8DZrAtcKFRUvag==
X-Received: by 2002:a05:6e02:2145:b0:3d5:890b:d9df with SMTP id e9e14a558f8ab-3d7ec266fd2mr117489655ab.15.1744658241457;
        Mon, 14 Apr 2025 12:17:21 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e026d1sm2715662173.94.2025.04.14.12.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 12:17:21 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/7] clk: spacemit: add K1 reset support
Date: Mon, 14 Apr 2025 14:17:07 -0500
Message-ID: <20250414191715.2264758-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds reset controller support for the SpacemiT K1 SoC.

As before, this version is built upon the clock controller driver that
Haylen Chu has out for review (currently at v7):
  https://lore.kernel.org/lkml/20250412074423.38517-2-heylenay@4d2.org/

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v4

Between version 3 and version 4:
  - Now based on Haylen Chu's v7 clock code, built on v6.15-rc2.
  - Added Krzysztof's Reviewed-by on the first patch.

Here is version 2 of this series.
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

Alex Elder (7):
  dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
  clk: spacemit: rename spacemit_ccu_data fields
  clk: spacemit: add reset controller support
  clk: spacemit: define existing syscon resets
  clk: spacemit: make clocks optional
  clk: spacemit: define new syscons with only resets
  riscv: dts: spacemit: add reset support for the K1 SoC

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 +-
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 +
 drivers/clk/spacemit/ccu-k1.c                 | 330 +++++++++++++++++-
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 128 +++++++
 4 files changed, 482 insertions(+), 23 deletions(-)


base-commit: 846ce0a9d3e86830a3c6253c3b62104b369d6a95
-- 
2.45.2

