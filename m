Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E572DC792
	for <spacemit@lists.linux.dev>; Wed, 30 Apr 2025 01:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745976593; cv=none; b=T1aM0HKYzwtjnR2M4j2eKPShGcePHexj92q2hDbZw7A6az6nNGVdNEcxY3ed+EtWqjD2vgBw9pNJMXELujDKCTF39+pbAXlfqKke8Pvh8LzRgclSWBxINTa0Ootfk5T4CN9fhD6LqG3MnfVqQXgSUKlEYsfoSusFRDF8x2xE3jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745976593; c=relaxed/simple;
	bh=UKVayq6dmnr8jrMqKRkAzarMnkoTzDLNG5yvZ7UCGAE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bN7zMq0pczVeOcl5WzH/RKN1pw22FzdDFMNlk0eA953Ys0Ci0OcWdcoeGFDnBVWUCJk3pqpa2YV5geXUSk91hiDW+Ysy1oGWAZZjAaD65UyhMGjpawa0DQqtxudKrq4Hp92/o89khqs4X93UifoZYs4CPVfOczVj7jeN9uW5uDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.147.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id CAD4D340C40;
	Wed, 30 Apr 2025 01:29:50 +0000 (UTC)
Date: Wed, 30 Apr 2025 01:29:41 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: spacemit@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, Haylen Chu <heylenay@4d2.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alex Elder <elder@riscstar.com>
Subject: [GIT PULL] clk: spacemit: Add K1 SoC clk driver for v6.16
Message-ID: <20250430012941-GYA288294@gentoo>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen, Mike

  Here is clock driver added for SpacemiT K1 SoC, please pull for v6.16

Yixun Lan (dlan)

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://github.com/spacemit-com/linux tags/spacemit-clk-for-6.16-1

for you to fetch changes up to 49625c6e4d90a9221127c49a11eb8c95732bb690:

  clk: spacemit: k1: Add TWSI8 bus and function clocks (2025-04-17 03:22:56 +0800)

----------------------------------------------------------------
RISC-V SpacemiT clock changes for 6.16

- Add clock driver for K1 SoC
- Add TWSI8 clock, workaround the read quirk

----------------------------------------------------------------
Haylen Chu (4):
      dt-bindings: soc: spacemit: Add spacemit,k1-syscon
      dt-bindings: clock: spacemit: Add spacemit,k1-pll
      clk: spacemit: Add clock support for SpacemiT K1 SoC
      clk: spacemit: k1: Add TWSI8 bus and function clocks

 .../devicetree/bindings/clock/spacemit,k1-pll.yaml |   50 +
 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |   80 ++
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/spacemit/Kconfig                       |   18 +
 drivers/clk/spacemit/Makefile                      |    5 +
 drivers/clk/spacemit/ccu-k1.c                      | 1164 ++++++++++++++++++++
 drivers/clk/spacemit/ccu_common.h                  |   48 +
 drivers/clk/spacemit/ccu_ddn.c                     |   83 ++
 drivers/clk/spacemit/ccu_ddn.h                     |   48 +
 drivers/clk/spacemit/ccu_mix.c                     |  268 +++++
 drivers/clk/spacemit/ccu_mix.h                     |  218 ++++
 drivers/clk/spacemit/ccu_pll.c                     |  157 +++
 drivers/clk/spacemit/ccu_pll.h                     |   86 ++
 include/dt-bindings/clock/spacemit,k1-syscon.h     |  247 +++++
 15 files changed, 2474 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
 create mode 100644 drivers/clk/spacemit/Kconfig
 create mode 100644 drivers/clk/spacemit/Makefile
 create mode 100644 drivers/clk/spacemit/ccu-k1.c
 create mode 100644 drivers/clk/spacemit/ccu_common.h
 create mode 100644 drivers/clk/spacemit/ccu_ddn.c
 create mode 100644 drivers/clk/spacemit/ccu_ddn.h
 create mode 100644 drivers/clk/spacemit/ccu_mix.c
 create mode 100644 drivers/clk/spacemit/ccu_mix.h
 create mode 100644 drivers/clk/spacemit/ccu_pll.c
 create mode 100644 drivers/clk/spacemit/ccu_pll.h
 create mode 100644 include/dt-bindings/clock/spacemit,k1-syscon.h
