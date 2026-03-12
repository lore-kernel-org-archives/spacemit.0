Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287603537D7
	for <spacemit@lists.linux.dev>; Thu, 12 Mar 2026 01:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773278601; cv=none; b=kr+PNCi6isSTNe6u6F/E3NBpFn5gFHmUCDuY7KEO/BMvm4V0LZcGJkQFyMxp2Q9HM7JzNs5TI/jw7kYFMYbrIip39X2cugyYcw+ZuzSYC5vcvnDQ8P1mc1P/MDklvqrx8RQ+4hhNNQyW1yWziS7xDrYy8cB0ApIVwUTEycZZXQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773278601; c=relaxed/simple;
	bh=c3aTRdUp37Kejp938i9RImTaH1pjZM1PMvFcrSIsF4k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EqfrlzCfBl4WWtZ60G4+o6abgy/cl7SwAylCNIIeMkaKpm6NPkyluYy9kwnjbEkWkCtuLaAo74sVCzWrc1g8tcseqP6CVnF/aRON8j7wYqFVaCiWYFLNKP+hyf7jjGVZAuLdRijk0N7xlpd2A1Gb4xZcp0SfxALFzz571q1n1Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FwiBRYZl; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FwiBRYZl"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8cd80bea5f3so26831385a.3
        for <spacemit@lists.linux.dev>; Wed, 11 Mar 2026 18:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773278597; x=1773883397; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VyB5pKnWn9O1wtjxVZxKBeu/DBXMCZY1EfBDXvBRKnY=;
        b=FwiBRYZlr9NBbY9FPtXRwOs1DkjK/WlHmACp0Xg+VYwQRiAODl7MMq0kOf42DumIi6
         vThTV/l5q9yeIKXoLoOKqLy0kIDIGeXJoT0HKrJGWf4Y5RDJjcCOpN729Wdb/8GnRLWf
         zGhJ96d8WayExjyPrc2404sqLfOQTfrHzLR3jhe1F14R1bwMTSjhDEpE6xDShu6UCB43
         8spzU7jNtxEZ+xEwU0mtuOMjxC18uiHgl1Cc92dbHBEAkGKP5AzcoV0vCTFoa2B4D3jv
         y9mtUy2hCanOCyfkjJzH6FxVFo16P6LpEvCZFmZbJ4ts9UGqncUr4jHAS5nT6uvmfU90
         RK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773278597; x=1773883397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyB5pKnWn9O1wtjxVZxKBeu/DBXMCZY1EfBDXvBRKnY=;
        b=LKaopu+I+5Jd+k5tz9hmGas2LC2OgzfangAUTgv6ptpY87FS05oJsbIPvBwbkeDZfa
         8fvbpuEVIVkYVZsAXwfZuVm/kcJF0c9jZKViI+ntVV1+hRtQXUZpbNGuP5bb5nt7cISy
         5cUEFEi/YAdvGC8vOdbv8w7auvL4izih3d9dAUF8DlmvXuE0/0Z2M9ritXc+zHAfr5Gw
         fY0vjhGNM66vPfDRUwyXK890/nYO/ymokY5vmpdgYyn4d3+9s5hCBsyTyY6WdEAukdkR
         sQ3T6HrYtWEwoW8xMRN0NDLa7Spyvd2YfwU8wB3U5F+qVKhkxHm3oZ3v011+ePWs+bbb
         DfrQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0XBeXRoeMsu125Qr1XTouYbGz0DyfEO0ibZmId8WedJUQkjx0oars4DhyJfTm++LtsmPNXtS/pA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqfVix3FSH/uo4Ko7wIiTH5otUYmoJaSVdfhBQt0SXVAYgS32Z
	9os4clVGGBhMuM4VujUbzeAyRAarDj4Yf5xgpI3ZXwp+hilnzUH7t9X1
X-Gm-Gg: ATEYQzzDoOwdSI7PrOHglL59N/bnJmKTGOGXsd4bVACmnMRRP3f2OvfaQeg1qIUSGc3
	bASOmjnNC6t2ma3ghZAMj2qaHdR62bOirz8izF6T83Xcxm4vHSqRzSS0f1s8EsWQOqlm0uobNds
	Yr1whDE5T1GQpYz64wn2jTwz9t0Kgw0DnrHwjLaYfUgNLCyXy5FYo33IJJ5ri4bqU9DE1AUuplp
	apUe1Z2U8CL30b47xOWOfkPHsGF9E1f9fg++t0AnDHSwskriBGO74ZW5JUSzdVP2gIP+o5J9+t1
	wx+FPYbIT1/fi8XlZmxwCTzvyStw2/IQAYmrA3RfFmEWgN7zp2GXWs/FK9w2C9Gx4xMtfzVNdc6
	VghewZpgTwrqSEfcSUlsgrmA7MIyEgEEN1v+ZHsolR8lUWiLsvvVTShYM6Sjka9kiLWuxyumMFu
	F28Mrb6gzg8W68ZtCxgS7VTUc=
X-Received: by 2002:a05:620a:2a08:b0:8cd:95b4:c521 with SMTP id af79cd13be357-8cda1a311e0mr596901285a.45.1773278596866;
        Wed, 11 Mar 2026 18:23:16 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda1ff7642sm266671585a.21.2026.03.11.18.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 18:23:16 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <me@ziyao.cc>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v9 0/4] riscv: spacemit: Add ethernet support for K3
Date: Thu, 12 Mar 2026 09:22:22 +0800
Message-ID: <20260312012232.373713-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial support for ethernet controller of the Spacemit K3 SoC.
This ethernet controller is almost a standard Synopsys DesignWare
MAC (version 5.40a). This controller require a syscon device to
configure some basic features, like interface type and internal delay.

Change from v8:
- https://lore.kernel.org/netdev/20260309004305.315018-1-inochiama@gmail.com
patch 2:
1. Apply Russell's tag.
patch 3:
1. reverse the order of the local variable to make it "reverse christmas
   tree" for function spacemit_dwmac_update_irq_config() and function
   spacemit_set_phy_intf_sel()
2. Apply Russell's tag
patch 4:
1. Add MAINTAINERS entry

Change from v7:
- https://lore.kernel.org/netdev/20260304080721.1658224-1-inochiama@gmail.com
patch 3:
1. Remove unused parameter in spacemit_dwmac_fix_delay().

Change from v6:
- https://lore.kernel.org/netdev/20260303010630.567674-1-inochiama@gmail.com
patch 1:
1. Drop the extra blank line at the last

Change from v5:
- https://lore.kernel.org/netdev/20260227075718.2243818-1-inochiama@gmail.com
patch 3:
1. fix error from checkpatch

Change from v4:
- https://lore.kernel.org/netdev/20260130022705.1059214-1-inochiama@gmail.com
patch 1:
1 Apply Rob's tag.
2 Adjust clock description according to Russell's suggestion.
patch 3:
1. Add set_phy_intf_sel() and get_interfaces() hook, suggested by Russell.

Change from v3:
- https://lore.kernel.org/netdev/20260128072931.875041-1-inochiama@gmail.com
patch 1:
1. fix the uncorrect compatible string postion
patch 3:
1. add "CTRL_" prefix to all ctrl register definition
2. only use delay config 0 to calculate delay code.
3. fix typo in the comment

Change from v2:
- https://lore.kernel.org/netdev/20260121071315.940130-1-inochiama@gmail.com
patch 1:
1. remove not needed compatible for select
2. drop empty line in "spacemit,apmu" properties
3. add spacemit,apmu properties to required.
patch 3:
1. remove misused phy_fix_phy_mode_for_mac_delays.
2. use local tx clock instead of the clk_tx_i in the dwmac.

Change from v1:
- https://lore.kernel.org/netdev/20260120043609.910302-1-inochiama@gmail.com
patch 1:
1. remove phy clock
patch 3:
1. improve comment and include something special about Spacmit K3 dwmac
2. reorder the included file
3. fix wrong delay macro used in spacemit_dwmac_set_delay.
4. add check for maximum supported delay.
5. use DIV_ROUND_CLOSEST to calculate best delay configuration.
6. use assign for the ctrl register initial value.
7. fix input when calling of_property_read_u32().

Inochi Amaoto (4):
  dt-bindings: net: Add support for Spacemit K3 dwmac
  net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
  net: stmmac: Add glue layer for Spacemit K3 SoC
  MAINTAINERS: add entry for SpacemiT DWMAC glue layer

 .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 102 ++++++++
 MAINTAINERS                                   |   6 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 227 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
 7 files changed, 351 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

--
2.53.0

