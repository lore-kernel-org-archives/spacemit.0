Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A3034C128
	for <spacemit@lists.linux.dev>; Fri, 30 Jan 2026 04:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769746296; cv=none; b=G1am027GZWdEO1q1//gUZ68yFJY1YoLXWrOYEe7ZTUJXDumEugVjwohSw4Nqk6B85RHr7RSpRFVMTwtZQF5sksW7TdnLH1PJrkEWf9qEB21cjRR2/V97ciPseNQzGNdxye2qHIRuqUzz8PLukbLhMeDCzmUoVWBg3aZeV3MYYQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769746296; c=relaxed/simple;
	bh=5fDv8+5ZR8gCYHv/hEvJzO7DtxAT7V2J7vrsSuP8zhk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bKq728uLSaTEzBVlg+MH+ktOjYiBEAkW8M2cXUByWLRKaSFbmG9CSbHMcxzzU81Swbx1dA8AEThCe4adC/j1PnBCpRFyi3etCVjSycW1TynyboMnrFbnQnUXhObCbj2c/dgABNzLn/m8T7bIgPUP2az+FLj7UfEofMKVdJH4ciY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HpkTiFvY; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HpkTiFvY"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5ec87b1f525so740564137.0
        for <spacemit@lists.linux.dev>; Thu, 29 Jan 2026 20:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769746294; x=1770351094; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aZc1WohjUyOxX27WIht/QOavnc3r+d/i0XwRkPc1NWc=;
        b=HpkTiFvYtIYvo0Nj8CYSIIg46pb8EuaysnzIAl8iYuh6k3TgQ+7BjZ9kjsF2M1i+3q
         VnpsscZsAttcTbLTbh72eDD60CqP+g9fCQS/eRIn1+eYpgfn4pkRnZpY3Vzz+ZBnPCQP
         LslGMl1+VNjFdrBINcSmarg1lqnrB+Ks4chJqlEegmQKpbVLfb7jKZ1QCRe2X0VqQm+T
         ceTeF8j85qKUK601UJKvXLq+gg1qyRMlsCl0E8eM4JGPJ1W+wJKZeLF28/pK3RrCwB7A
         egJyMpCVmUIyCdww6mJoyPJiyyynABakfQWSSk8VbgEL+aHSBdQ8eiSYzKKKMUghl1/H
         xp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769746294; x=1770351094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZc1WohjUyOxX27WIht/QOavnc3r+d/i0XwRkPc1NWc=;
        b=GVo0ghez3AeZowuAiPiit6g2rXkmXBo4uNdIb1bS9SZWrFBW0RsZtkqdI254L+rSPT
         wJWHWW30ZovX0WK54MDZsisFC9MpwOvEPLZxEy40yvg/wIM36XvLnjGDLpgOvyQ+fJl6
         A8IujnbjX6W26tCUaXnpq//o9t0WWRriAFdFq2F88hRduxgl0OeHyQxNzkeityvyW9TA
         tTl6LdbQSYIKLxvaF8Fus5hnjrwjR13lCMruAikYI7Ngfb8xmu8RahJKGOWTFgWCmDJd
         OZy50O3NwL3WtnnHfwjIinNCz9O5k8SNTzX4xtBZfPCGW4zADhEFQLJpnnEZymutO+HE
         0Cfw==
X-Forwarded-Encrypted: i=1; AJvYcCWbcc3sMwlHAYdJVbrhn6OS/uPSYUa2Z4rQjcTvBx0Ua0dJwneNzS9vLHQ4JNbNRTbkJoeVds1AtQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0FO0P0CLvRh74BsM8L0+FQQsOdYO7M7S6Wn2X9y5Zznwf94Z+
	O8lPOSLg49G7f5sqBQoZ9h6L6EP4FhKu5+SFUMAM8MNCF24NFF8PVDcwY99Dnvu/
X-Gm-Gg: AZuq6aICgn6Fyqbsmo/TOGe/UL1ZfiQ8TP3NGtvKN05TGvG5On6DkS+wifhj3HWAIIk
	xWYQkapZT92YMzQ49J2/U3aTGj8xpEogxhuyon9wzGtY5a9aRM32vXINiDbnrMVBRAAqE1dEyGV
	7AvaGIylOpL6o7HormnSQEvllYwd1d23Cd2MFs2HXo/fMZa1D26AB1ZM7NnZhGhKWZPbQVp966g
	dUJp1KmXlyp0USD3iIf9Zm4swFnBBC+lUX7mkOpB9kc3mlwqYCSi595yYMGzIpMFA2jUQjiKtBy
	tqDwgbQD+HJnmR0AaDWinpoRO490E5ugbgBS23ipQFQBwYe8VbFSl56bOlCawp/GOWXxe2JnvlC
	piU2JmdP8pC765E7KBnGXZiYYPqdRF6x7+1P89X/MUFq0JE/2NOzDc2h1QpgWueJ3e8wCMliDQp
	chVccDxOR6yw==
X-Received: by 2002:a05:693c:228a:b0:2b0:4ae1:b4ae with SMTP id 5a478bee46e88-2b7c88d6423mr747779eec.24.1769740046251;
        Thu, 29 Jan 2026 18:27:26 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1abe938sm9799883eec.16.2026.01.29.18.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 18:27:25 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Yao Zi <ziyao@disroot.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Zhi Li <lizhi2@eswincomputing.com>,
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
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v4 0/3] riscv: spacemit: Add ethernet support for K3
Date: Fri, 30 Jan 2026 10:27:01 +0800
Message-ID: <20260130022705.1059214-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
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
 .../bindings/net/spacemit,k3-dwmac.yaml       | 103 ++++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 194 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
 6 files changed, 313 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

--
2.52.0

