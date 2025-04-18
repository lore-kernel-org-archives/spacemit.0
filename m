Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9044F1D54E9
	for <spacemit@lists.linux.dev>; Fri, 18 Apr 2025 14:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744988050; cv=none; b=ihSRPx6vr1fHaGxuuPWRaoqKKF31iQvhsQ2RzoHhaed/QduZjp54DMrWdVm2MqtesIzcsV2JCn+kOkWrAlCWOGFfKp3EDAjyHt9bb/vI+c6OT69A/LHo3EIbMCtxGLNYNFqlGdU+Id937Hno7PPsydRxtMSuoiKsZSrwL5C0EvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744988050; c=relaxed/simple;
	bh=dlNXHuUORBV8qyM4a+/YpF7hE5uuPIDHKUaPv4eKnS4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QVSdzOVMPMPoFld8EkNqGWGtW3G3s4pSQhjE00L1QB0iqzy1qtT+Ptf2tML5trGU1A9PV9375Nrvu1aYEvDIPsVEFJuEpAksuYDCdMYrnLPtHbnYnBXpwCAFVECg7uNxUJmqTvGjtJvPQ0BVNGJHcUyVrpNvBRqg6p1jSH+dHYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=NFV+Mdoj; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="NFV+Mdoj"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-477296dce8dso18122421cf.3
        for <spacemit@lists.linux.dev>; Fri, 18 Apr 2025 07:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744988046; x=1745592846; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HpNDOPRCFGOfXdIE71HVXdbzEYefPrTNzqdoa96DBP0=;
        b=NFV+Mdojo90QJy3gy86FeDtyUL4/rPyiDjUUm/upAoYVi1xyIslX1vhjw7LItYFcKZ
         7WY5Q1IvV13kOwaS5HC3d0+bZS5TpLFTZeJ0jYaAY8bwzG/1ISEzP8Zr6+LrteARaLE0
         xJ79TheINWD/cCBnsqTTftrKEO95RbEYAPZxQ4s15hainr1kGixFfcbUurGFt7xO+9ns
         HRwEJdjmtAgQ50W3M6tYY7zS1/XT1kZ6gdwG4BBYz5df7cVXP4c+lpyPQaWpZCRuL4l6
         U40eMkzg5d+RZNActeKxqC6FWcrZIpJIKVL+QXRS+ZXuV9jLXSShfL50qrQMd9ghjNjC
         OxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744988046; x=1745592846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HpNDOPRCFGOfXdIE71HVXdbzEYefPrTNzqdoa96DBP0=;
        b=BkX5aGoR+dUs86pJu0SUy+nD2SKF21RQHJqO2NqTz/r5ga6vsLlQoeRIIyFuP7L3og
         qB8zO6iE4NGE+LVePtHTbX9WEBu9ee0XNXJ9UMEipfjnLDAGf7o1eZuOYi7HdhYLTJOD
         WVMOWyFunA5WqX71jRQd2IyJNOlouMOZnUFvyQLfeAhj6KV/5mjLeEmOyBzIvcYByI7D
         LreQbcC5C42fKHuY3+xS3Q9yP8kH9a2564UCxYQiVRUbcD12uYGv4zllO5OgK9XNfxiG
         sFGK5/bo43w4tqFnzAk0CZ8yCTDSM+ukzrvxsMzSx5tKpEVOAbzkRXJuop2Mn63Td7GY
         P6rA==
X-Forwarded-Encrypted: i=1; AJvYcCXmdXusSbhvOsBao7d8FUv7Q93jXwt1qDPUaFZPxhI9Qer4YedwqhjUZJHDD/tzq8HYgWCdyAEZAw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxL3Mq9nznWxCJmNnZqEk9brLjPTUyCN1mzdfSQjsmmTqMb1FaM
	pML6zpADFsJkfFK+FvkCu+AwfZhKsX4I1VYy0Jp5Y1fNsOrkFLPFNExpnXDSNnI=
X-Gm-Gg: ASbGncsS7a7E3K7XAjIy3jsTrVclQncQdbXezW6hq/oTwEZCJdqtSG2CCfHyo7pLyR8
	/EfdGM4dl2NBnkiNG8dOSnC2j8rshgyg9kRRqmoLVDkTeiMA+WdrvkSKVwMaDiV1UAOAepp3++K
	2VuaAr5/5ptnijMIqyQ4cNXB6CZvXA4YHXPuJpi4RXm7fb3xowaxVw6NLSXiuCfoqc554t/In0v
	BL/NfZPBn4jNTHAayOdEdGgLHh6CbLUdZXz3eaFYwPh1wX468XHQhvO9wVPtVEvPFn0y5xlxNlj
	nk8JQj7XFmBMuawcHRe4y5yn9t6n4mtkSUXULqZ1ceXRBmCIUL2C1wc0nGFfVoF9mBxCIy6TKQ8
	92mb+YtRkgBoV7+mBmOhtWZyc
X-Google-Smtp-Source: AGHT+IHiEG1eSrMtmu7ABawgdFJIO6lV2wB6Q3AXU/kHDB1pdQpbBxefqDVD369wLGK+b6k5u7CG9g==
X-Received: by 2002:ac8:5a92:0:b0:476:7327:382b with SMTP id d75a77b69052e-47aec396ac0mr52829231cf.16.1744988046352;
        Fri, 18 Apr 2025 07:54:06 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c16ddesm11329201cf.3.2025.04.18.07.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:54:05 -0700 (PDT)
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
Subject: [PATCH v5 0/7] clk: spacemit: add K1 reset support
Date: Fri, 18 Apr 2025 09:53:52 -0500
Message-ID: <20250418145401.2603648-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds reset controller support for the SpacemiT K1 SoC.

Most of the the clock controller driver that Haylen Chu had out for
review has been accepted (at v8).  So this time this series is
based on the "for-next" branch in the SpacemiT repository:
  https://github.com/spacemit-com/linux/tree/for-next

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v5

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
*** BLURB HERE ***

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


base-commit: 279d51ad9f6dc0c667f6f141a669b2c921277d1a
-- 
2.45.2

