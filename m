Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5198B1DA62E
	for <spacemit@lists.linux.dev>; Fri, 21 Mar 2025 15:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742570318; cv=none; b=QUh/4+5bE/cKwkpO5Ji5yUzuf8mUR0/IJGybCr7DfYzx5V+CW5OCVBiDjDXQ+cTEfOhJt6Ot86QvedQoWx6BN1ppicYhvLJ3EGKtPkUDPqzgxCaOsm66PeoqX5+Yn2ogs6xh0FMQVRqoCQw8sE4oUOOvZTzeyyVn4bW4xftpA40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742570318; c=relaxed/simple;
	bh=zhaML4Pm1m+KgXGzKB1u6T1c5KY484O/gyZwJl4YL/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ckveQNHeeiph5mZSsRgMSWR2Q6uBs7w49YvQ14WFB1Iw7R4jMD8J60chEligRtLwCn8251x/NsYOe3hq+pIKfk3Dwx/fpv/hK6WbxQ9OHRgUzNGswDMnV4IZYLtJGMPWXyzXqDCHUgFrwV2ete75BUqDX8M8irleTrPlqsQt6mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=uRk73/ZH; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="uRk73/ZH"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-85b44094782so63000739f.3
        for <spacemit@lists.linux.dev>; Fri, 21 Mar 2025 08:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742570315; x=1743175115; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UTantLRj2g1pI/nv2rQCu8piWojTNSsUaDvPh+ZcZxc=;
        b=uRk73/ZHX2A0KS/VmT57UQoQDDPcjJMkON4hjynJrDZSzrYtjumQRLAHtbqKgWbKcq
         ObA1zU8a4s4jK3VshpFzTDptOMv+czp7RhZhVu6icMwUgKiREZz0IlamY+3CTz3viPsG
         Q5PCzwDtlD72LqxVHSEHkIm/qJ8amXy37Uz2M36ig8/gSnLPqHT/irx+KSbRUEwfssar
         QFxIM5qpRzKt5APDsMVNNi73EEzIwnNOpwdc0jR3ZiGjIfwf7RejAG50fQr6O4ouGsRR
         95XIJyW87muT/sxrdM9zC2av0nPheH8MYinhpsUIWodDUy9XrzAF5fyHdHQ6Mzw19t2G
         xWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742570315; x=1743175115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UTantLRj2g1pI/nv2rQCu8piWojTNSsUaDvPh+ZcZxc=;
        b=NZM1ZZLMd13LpTNyxCSl7OWutZ1wUS9Rj5cJSDJHhn7wOqjuy+wwKhU59BOxL34sFv
         nGxd/EO6JQULdnMcG9rF31l5oof0J98TUSi1xqQi6sAt90SyGXkmIMJrvzD9KjT2Pbwl
         JEKqaiqPWf+X9dFtsXN8+ufDjzePQQpw2PXhZfVlIogce7J3GNXNeBOjBm6h1tPvZHXN
         /YHoUucpUBmN3ZNx3Kw/P06/sCTpGM2XNJCKgDKgApzsPAW8V95FI0OkkmfBHSG+IW8m
         WwWGoud7iWzNbj/BicjB5A40n+xWBJl1eKqaEF+sG5OyVtkVwuEmOl33upqFG7W6y5vu
         RHVg==
X-Forwarded-Encrypted: i=1; AJvYcCXbl0b0o1ITC5w3Wq6eUlOaoG4Il9ZAxuXJYktgyj0MzOWW5D8rwoy614jR7PUkFojFYjxeXYhDmA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9SyX5mHS3BduWiE8lhevSUDZsX4Fs+NB6JPBpT0G+7VuQr6av
	K6LJ1FbrcNxKJ4fZU/L5QeUfijCVSYeEK2YFb3TMdWdif5EY/XSp3aMCmbN4Uxo=
X-Gm-Gg: ASbGncsUoLH4936x5CMee8jDguywGoSj7Zzf8pP9+zVd9iXZKkEnp39jyFc7GIg0ciL
	D0GWtAU+Y6vQYTBXg64jERNSR9CqLKwB6i8YR5ibcRcFUkKlMQDg6ddRRaczetG7VZrp0/iMnB2
	sOddGk4WRHjyXTs0BTrUVFe/7aD1vyrmUqc1QRaaEk4cMEtRvbVq+V2J/XyFHKXYt7Idfj3LFf8
	JTzfwS5UbR8Gixg8znprbqoa1GhtCDid4UYVS0VesGJlOCrAIT/KnyK1Kc0wPtugdygW5Fey0W0
	uQhFUgXbqoQjJ3GDI0U1f9zuUk3u3F4A3MgSW7wAvFCDgHATskoGMQxRoz7WH/CM+epI7iScvJy
	ATV1utm0VdzDtyrtP9B0avC64hrh06i/Mjto=
X-Google-Smtp-Source: AGHT+IGSab75MXOOp0j710KIm4LrkQU9r7YtJUQHaFEL9MotB5UuhKhBeVLzh5RSsEP9NerpL6ljFQ==
X-Received: by 2002:a05:6602:3998:b0:85b:46d7:1892 with SMTP id ca18e2360f4ac-85e2ca1895amr415643939f.2.1742570315183;
        Fri, 21 Mar 2025 08:18:35 -0700 (PDT)
Received: from zoltan.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f2cbdd0a21sm475553173.41.2025.03.21.08.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:18:34 -0700 (PDT)
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
Subject: [PATCH RESEND 0/7] clk: spacemit: add K1 reset support
Date: Fri, 21 Mar 2025 10:18:23 -0500
Message-ID: <20250321151831.623575-1-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

(Resending as requested by Yixun, this timing adding the SpacemiT
mailing list to the CC list.)

This series adds reset controller support for the SpacemiT K1 SoC.
It is based on Linux v6.14-rc1.

It is built upon the clock controller driver that Haylen Chu
currently has out for review (currently at v5):
  https://lore.kernel.org/lkml/20250306175750.22480-2-heylenay@4d2.org/

It also depends on two commits that will land in v6.15: 5728c92ae1123
("mfd: syscon: Restore device_node_to_regmap() for non-syscon nodes")
and 7ff4faba63571 ("pinctrl: spacemit: enable config option").

The first patch adds three more system controller CCU nodes to those
implemented by the SpacemiT K1.  The second updates the existing clock
driver with a structure used for OF match data, allowing both clocks
and resets to be specified.  The third provides code that implements
reset functionality.  The fourth defines groups of reset controls
implemented by the CCUs that have alraady been defined.  The fifth
makes it possible for a CCU to be defined with resets but no clocks.
The sixth defines three new CCUs which define only resets.  And the
last patch defines these additional syscon nodes in "k1.dtsi".

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v1

					-Alex

Alex Elder (7):
  dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
  clk: spacemit: define struct k1_ccu_data
  clk: spacemit: add reset controller support
  clk: spacemit: define existing syscon resets
  clk: spacemit: make clocks optional
  clk: spacemit: define new syscons with only resets
  riscv: dts: spacemit: add reset support for the K1 SoC

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  13 +-
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 +
 drivers/clk/spacemit/ccu-k1.c                 | 393 +++++++++++++++++-
 include/dt-bindings/clock/spacemit,k1-ccu.h   | 134 ++++++
 4 files changed, 539 insertions(+), 19 deletions(-)

-- 
2.43.0

