Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C412336EC2
	for <spacemit@lists.linux.dev>; Fri, 27 Feb 2026 07:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772179066; cv=none; b=LfbFmyRNRQiVAocCxabgzK9BVf9w7J92TX94RPfqC1sKXAZxsQ8rAMxdp5ZbDTq6AXnhu41ej8EuVdleWzwO4IMftxROUqIYkttw9DtPUygT8IfQi85U5PvU59ZIeYMSLDHIObF5Yqm96Clt45/1V++/ERR5MflS9xttfzPtuX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772179066; c=relaxed/simple;
	bh=9VnXD3q/1y0ffqPsUhIGxefsynZ71Ka+JpVBrhahLCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ps9H60mD9W2e7xjjMmGi5PUEhuh8ybEfuEKqu6tudIwE/REiF4sUDePLDbkFZmthQgKurDS3X0na5LNEUs+hthZ6pJfP5ME+DaUKNw8o7DfdqPa3I2IjTV0O6GytOhCrXv7T8kHb1SOKloqF0UJGttCO/lG3N5Vd4ZBcS6fnapE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6jQNhvn; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6jQNhvn"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c6e248aa446so688227a12.1
        for <spacemit@lists.linux.dev>; Thu, 26 Feb 2026 23:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772179065; x=1772783865; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dClJOFMkUNppxkXbFtmk3M5XyyWUhWhukdTkp6L74rE=;
        b=h6jQNhvnnzhXSfkFP7Pl2JdNIBhfJsBNaQWEZUGlb2uyBKJNLTlIMV2V3o9X8unZHb
         r8TEn116/QDpGi/GutU5WLRBd/h7ej7HcqgNpknP5EzQ2+Q24aHtyxpU2DiLUJ/DRO7Z
         W+LMZdVY8xrtH1mzNFbizt7mcoIgTodFVeXzAW0WOJ5o8kful/7fr/FIMzpVRJl3lzuO
         ed69yA3JYhyPyboXWaLKP4QDqLmlrYWGr4MecxEyhrB7OTVP0KCOdcm6mRhnfuGtzKCr
         2EBOXPG2BhgYdmu47qqtkcX8sl7DIO2JHhFCInDMVnmujeoPJRnDe9RbkAFEP8h15eSh
         GdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772179065; x=1772783865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dClJOFMkUNppxkXbFtmk3M5XyyWUhWhukdTkp6L74rE=;
        b=q2SGOs/mRyWnYkkbeno8nxP1mqVYs+uKV/ExT3zd5XeOHVRXWFOUzObKjqZauGdwM8
         Fs2lsdhrbCuAdVFKiLuJBCP4VYdUABohzkJ9aTQ3ZczuVEzbU41CvmLHjnqYwK3jUwiZ
         selKesXrN2YgVTiYML048B0DRdDOeOVQslXhF6CV50/kUnWsDq3RNJciBwgE7gA2t9E7
         dj1WeJCJjL4jotLBqP64im7zJ4fOaENbHnU/ddz9X+uxEZpTl3MPVHp7H9ZPyfabSiPs
         +kuzAAAOMvCuysSpYR+FRxmJdElEJbUChbSRujbbmciyKU+1N1B9B7yjGFjHbyYfj2Sz
         0M8w==
X-Forwarded-Encrypted: i=1; AJvYcCX6SPUFJ2D4yT2eFT8DeJCEltubO0aEfwl7uJTGW0y5AQSnH1G5hrTun1hRhziAWMBQy1yTsb0Y0w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzjQnu6Qc/FhHS7xOmrrYJlbdDTvAavwWRLl5QQxB5Zby+npG44
	wF9DezUFGH5nrhBaFixhdbk7vsB06sRvU7DwXzCEUBVFRcmQer8+33an
X-Gm-Gg: ATEYQzzhWwqy4689umsSrcUR27GJ6Ykjm9xYYYHMYyxZVsYxFUoL6L1Mtar2ETQf0Pg
	Q8KInUguHPm5haFBdz4xbNdgInGjwY/mla+NzL3hbksqQnsSELKwC+0X85FKx3zYT5mZbiq++RP
	9RYIwNEDT/ODwHnLhcHfmo88WshE91vvtFqiO2BovhHc19PhoqkSMHw6DWVPRrn7NGaou4GFJgD
	UURm3GxO5oTUFsKPvxAI+SMW+J16B2qO9fxlDplbgYcCTszBTHmOLcpSAmBp/wzdMCrpsQU/HpQ
	p2pzva772X2CmJLtu3f29C67ZDj5Q3pZvM+o7bEF6eq8ybqBsXwUrbwKTq24h9E51TZANHRtv5X
	17btzv2pjUiBWhJCLNuwEKszS3B8w1fNYaQRFo4zWHQaFSJ3SDfIHuEHa8fwshVdtEV9MYxnTiG
	UNS9D0X/O6czsCQB3rTQqy3w==
X-Received: by 2002:a17:902:c950:b0:2ae:1ce5:61a9 with SMTP id d9443c01a7336-2ae2e02ac6fmr18274345ad.0.1772179064707;
        Thu, 26 Feb 2026 23:57:44 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69fb4dsm72024035ad.42.2026.02.26.23.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 23:57:44 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
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
Subject: [PATCH net-next v5 0/3] riscv: spacemit: Add ethernet support for K3
Date: Fri, 27 Feb 2026 15:57:14 +0800
Message-ID: <20260227075718.2243818-1-inochiama@gmail.com>
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

Inochi Amaoto (3):
  dt-bindings: net: Add support for Spacemit K3 dwmac
  net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
  net: stmmac: Add glue layer for Spacemit K3 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 103 ++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 226 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
 6 files changed, 345 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

--
2.53.0

