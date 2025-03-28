Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5651E0DE2
	for <spacemit@lists.linux.dev>; Fri, 28 Mar 2025 21:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743195760; cv=none; b=H4ZFaao/zlY/DXG59o+zy9N2+kmjAefox6w0oxudVAZTlQNJBhlaV4As/1kLP+Or/faoSRMVDzA5m6Bd3QO87Q24N7pi6uzpHL1dLsGzUqROjqDrcrZ7nMtlgcVRu+PfrFtxhUu0euFgrg4STKcC1mveJuqwJdvpwXCOLm4gw1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743195760; c=relaxed/simple;
	bh=b1a8moIudFYGQBBhZ0ZFwpnDk+15x8Wgx+ZUtGp0Kxw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VNa82B/rnCvEWnTprx0ITJtzqlwqX5IGRcQNRg1ZPyTpEp6LcYvlbWicu1KW0s13EDRbzBB1Wa8u3OkbRuuNojhxT3KdqjNQgHOvJoey70AhllHJQlJmc9R3qokKDOYL5w3rboxZwrXxYWTb0/pJMIHz5TZh1ITHVDTWrWaq3Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=e3V8lMD7; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="e3V8lMD7"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3d43bb5727fso7427975ab.1
        for <spacemit@lists.linux.dev>; Fri, 28 Mar 2025 14:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1743195757; x=1743800557; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VHJYMx5Ny8sSHNURLwOrkk6ILyuNYFJwUzbCpGHWiDs=;
        b=e3V8lMD7YBk43Zn2Rg43Vnk2Dd7jLUigebJ7nazFozBkisIPFjn6IDihA2KiYjrkgo
         EJbnHxQWSG7O5g5BDb+waH8pWZK4zSuffWdvmINUT0zEiXzh3TNmxHUU2frNLxcqm2ZZ
         9ckQ3ncnbODyiH49gK9Jx1PdSNcEzRfKANE7fRIKpQr+whuqXJRNe5IPAhVA171G6mm6
         ELxzmoScfmqfB8zqYyrHUwTauBVKbVitr/TJGDv3J4R8prLtUYs33puGnFFoLbSGKx6u
         Ri/slRp804xe7ViUOgzI/fggzR78J3lO0jZOyblULAnj0n0YGJN9id0YtqSdqpjYj/yW
         WK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743195757; x=1743800557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VHJYMx5Ny8sSHNURLwOrkk6ILyuNYFJwUzbCpGHWiDs=;
        b=mOtxFWfy6Po3XxsVGt87dE6rFImp0FWMhKEOpE46KArb7WTRafVzsVd29JzPwiR2m7
         RVId5ulGTIwgeIC7QnwGWB8+OG4X2Ikd6wIP1KcCTir65u8LIFgxWm0d2lh4pnXVty6A
         I8m+OTG+JpkRuZaZF2VyrzcH4Txs24HVncqDXcnUAYgOwNB6I+jBUXK9RrRydw7THkIz
         rWCjNdOLLjnWYJnFmxmUfJRD6/AuLGo4vF7+OyTnqQ2VFEl1W6Sr8Nddlqn7Elp+HHno
         c6opBMhM6lL0Jk95XfAfxFpctGWRnaKNb94f2ao882XeDdR2zbM0HiI2lVo8DAPwmq9F
         Ky2A==
X-Forwarded-Encrypted: i=1; AJvYcCW507ofZc8EYc+usrfL4XZXV9tR1bQUUGw0xxQZ8MBdk5UIdrJFdeeNDJEJi2ck6FTG3TvH3IKmTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6CMG3z8UzqXk41pQp8QofoWN4e5Ueh3drK07xJAgbAZu7XWAF
	ms5EbiAKikCyIN+Sh8niQy/zkL0vel3ApUAAcYpdQEiJpPysKUHjQ+AgPkcdG74=
X-Gm-Gg: ASbGncsr+73Fi0Jjm/gjQ43KvTe9s9hg1pi/0OkjdEKvRm80T56Z8gsWq+w6m4pkicw
	4p1JjJPBsAo+7GO18RUuoaNkXB0ZOW6xQiraFhg0fsfA4jc2BEBSqpSdc7rH6Oysm7WCzg/NnHz
	HyVFNxqbDGsf61+go6niIvtcwA+sJUPwPFF4YZoNjpsDeZZdmrW79+ISIQGnb//6PKeOehFggp+
	/Xd6N2uh37kC7FZR60Z0jPudrluMSVMIviRErG9RK/F45PwPsJ3VH3NydhJtN5lRIYBUvW0PYil
	/+5ffSflJRXVAmV3Im95JAz513wWqkidHIp7VWESsYXxY+LCZ8VQnUB2gyn47zTPYQpIb+kAcJP
	nxrNbR/eOHBcIS16CmQ==
X-Google-Smtp-Source: AGHT+IHk48TQj5LU1BljWFGSUTe9vm5Iy8BdohARUm7BRbpRyYRCt5Yc1AT2nUjsk81V+iVQCDA4Kw==
X-Received: by 2002:a05:6e02:260a:b0:3d5:d743:8089 with SMTP id e9e14a558f8ab-3d5e091344amr12125865ab.7.1743195757226;
        Fri, 28 Mar 2025 14:02:37 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d5d5a74286sm6769405ab.39.2025.03.28.14.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 14:02:36 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] clk: spacemit: add K1 reset support
Date: Fri, 28 Mar 2025 16:02:25 -0500
Message-ID: <20250328210233.1077035-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds reset controller support for the SpacemiT K1 SoC.
It is based on Linux v6.14.  This version of the series is updated
in reponse to review feedback from the initial version:
  https://lore.kernel.org/lkml/20250321151831.623575-1-elder@riscstar.com/

As before, this version is built upon the clock controller driver that
Haylen Chu currently has out for review (currently at v5):
  https://lore.kernel.org/lkml/20250306175750.22480-2-heylenay@4d2.org/

It also depends on two commits that will land in v6.15: 5728c92ae1123
("mfd: syscon: Restore device_node_to_regmap() for non-syscon nodes")
and 7ff4faba63571 ("pinctrl: spacemit: enable config option").

The basic content of the patches has not changed since last time, so
I won't repeat the explantion of each here.

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v2

Since last time:
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

Note that I did *not* change anything related to the "remote CPU" (RCPU
and RCPU2) resets (and clocks).

					-Alex

Alex Elder (7):
  dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
  clk: spacemit: define struct spacemit_ccu_data
  clk: spacemit: add reset controller support
  clk: spacemit: define existing syscon resets
  clk: spacemit: make clocks optional
  clk: spacemit: define new syscons with only resets
  riscv: dts: spacemit: add reset support for the K1 SoC

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  13 +-
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 +
 drivers/clk/spacemit/ccu-k1.c                 | 380 +++++++++++++++++-
 include/dt-bindings/clock/spacemit,k1-ccu.h   | 128 ++++++
 4 files changed, 521 insertions(+), 18 deletions(-)

-- 
2.45.2

