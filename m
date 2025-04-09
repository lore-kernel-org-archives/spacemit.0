Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3E31E32D6
	for <spacemit@lists.linux.dev>; Wed,  9 Apr 2025 21:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744233471; cv=none; b=r3x2F3UNNdXE3qmIAn1EEUEoAArDU/WhjrFDrEJoE+aoPGSBwIv/Bn5QKAxPBgouFdwZLTba9g9wkcoEYllJ4TCE9c6QkV6X8va4qHViwvZU8B2RhSqPCrPzl/ZubSUxHo4lVUclwYzDY+Nf4/85V+5xUhGI55D3Dht0NDBdrJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744233471; c=relaxed/simple;
	bh=VMdYZrLAD8DMV1DpO50jqiz0vFY6aFjrLaJXiBM7mvI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=foHNYA5a+fbCTc+lfcsVczOM3uDa1i5gufn+0wV7fOxeOcl070cP8rHt+JFwqkp7Vjkqfr3TbgRly0H2K7nK/FN5ai0GIRgOI2rEPVMpLQ4pwmmHLYeZwSUR6TwX3W4HZwa47H7jah7XqoWoIM9a00qd0F4nAeLSsmYmFnLByP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=CgxyNBom; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="CgxyNBom"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-85da5a3667bso5297939f.1
        for <spacemit@lists.linux.dev>; Wed, 09 Apr 2025 14:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744233466; x=1744838266; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rrV5UlJLrK5aj5lTpRQRYMaHqlL0u3EBGUfh4HcWOG4=;
        b=CgxyNBomMp5WFtoVhLIwPrum4Ds6IJDt6pci6hjCeJsQWnp446idfEWzMe+hX5I0wR
         iXitwIMQ1GDnfIUnyNxEktwVpSV5ECOR7BXNeAPhYrTvDI/c5RxSrN89aARftWGd13t0
         h2LqZ3gt4UgPUCtkhFRbdmu8ybkuxtmLEqn8m7uzxEREsbZ54ai3JiyJe+fkYBC8xHBL
         w4InT96sxJHWuPcpauLpIXXMP9qpjX4dLsgDp8lf9amMkhVRP5A0h/bZ0Fw9fBaDqTyk
         YoS+1cyVs+CWtLDm/FtnLZ+OJ6SXAGwwMRCz3zs0XH2xnV+AJpO0wlqyb0vmW2rCfPIm
         ACFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744233466; x=1744838266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rrV5UlJLrK5aj5lTpRQRYMaHqlL0u3EBGUfh4HcWOG4=;
        b=q5yj2ZBuuhXOOLJ8zRbHEbGpZPOEITVO8m2/nrV4GJgOZx2XT6hUvS7fZ3ZPrx5GWn
         2ASGX3hHHmJoKLZb6XKR31fIdIAXjqd/pI57r8lYVFerdcX3hWVDBDMaHnwLsBFtU9y4
         EnjjJ4xQYC4rb/XP+VrlzuVGFShED4B3Cz7LoDUD9gfTwIF3U12WK371jY4gM623ESRd
         CUgKEZk9Z37qZfrdyDLNK9rd8EQKiI06jwldzyXuXnXv/UxkK3W8Y5BqlOUg3Pb8wlmC
         U8fR63nmqEi03MvVuctWsMcxgEI7ctFDFbfV4jneS4YsRSAOKS4LpCSqsrH3cfznvixf
         GalA==
X-Forwarded-Encrypted: i=1; AJvYcCUv3x92I2jSQp5nMVOP5Rg7Y7em8NUO8EFNyPHlcaSEmZTOfBcUyMHn6gknp4iZYn9WUQBLQvDjLw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7BkoWoraxpp49uJmzsVvWK2nKw76Mw9DUbp6QKqSbqIHtvKB2
	d26tLvWbw30PZsb8QdBcHVJmLWQegY1V2nz1GHY+LZCvfPC14jWi2p+u7BjvK3M=
X-Gm-Gg: ASbGncvaS7qPTgsD/wkFij+pmM71Yyf6qUO5bkB1WjweGGa1MVVo2/B9ShEWtR/XYki
	rTvxmfmLb7WSpsRzKtmdGFkoX2rX/Kf5p1bCs0hifzBTizvQQlHFDgUmYtHnhXLnoJrLamx63mu
	xFdcwf4chtHZtVsxhYE2Bz7zXNtInPPrAmN/lUJ6cWB7HTufh/6lldmFmlFTph7thBdKZpMeWLV
	Xci5Bc64hEMKsWEFxMIR8iHmLgm8KfxA3GCdrE8R7n0RZSkDLtDqbDnuigGVGzIRGnQqi53UE0Y
	Ul9HEnQsaWTwSIixogms5kNhsd0cD61Nj7Th8iohHYVryFayO572uHvN68YEqg9c/TajfP+MoSd
	Ig3P19Y2Qn3Vu2g==
X-Google-Smtp-Source: AGHT+IG6Fs0mDXRYU2o6Td0yWxwYb8N9uHgcDDzyd75KPdUxyiPuO9N5OH70dXQk1TVcz0gCoG5PKQ==
X-Received: by 2002:a05:6e02:1887:b0:3d2:6768:c4fa with SMTP id e9e14a558f8ab-3d7e4780824mr6626785ab.21.1744233465833;
        Wed, 09 Apr 2025 14:17:45 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf8e91sm420735173.6.2025.04.09.14.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 14:17:45 -0700 (PDT)
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
Subject: [PATCH v3 0/7] clk: spacemit: add K1 reset support
Date: Wed,  9 Apr 2025 16:17:33 -0500
Message-ID: <20250409211741.1171584-1-elder@riscstar.com>
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
Haylen Chu has out for review (currently at v6):
  https://lore.kernel.org/lkml/20250401172434.6774-1-heylenay@4d2.org/

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v3

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
 drivers/clk/spacemit/ccu-k1.c                 | 340 ++++++++++++++++--
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 128 +++++++
 4 files changed, 488 insertions(+), 27 deletions(-)

-- 
2.45.2

