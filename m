Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B0C625
	for <spacemit@lists.linux.dev>; Mon, 16 Mar 2026 01:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773622863; cv=none; b=n0Xs3hpZL0S87wRpAY7jc5862FZezO2zeQ0/N07j7pvAGDjyxQyPaqX+fP4X50JH2UQ9Wzi9v3QP5tPiF/C4sifLnjd5duB4dU+bRX4tbZ0+d0+w7GIzeoi+qFkzD3YGSCRzEyg9Ne11XXNByHf8smSL0FDCLYeMVewT0R4OnBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773622863; c=relaxed/simple;
	bh=E3TzQu1pHfPmyontnXm+hHLzoEHDGGZg0FGg2U5AhaE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gSKot41/0yqScoqlX06ZDozk062xvBHdb2FGN00ZjrpfiEe/eP8EgSaNo5b69q9Ik6R9Hb5uStnjBw6OBc7KfULcdklfqDKx5/tO8SCGWE7JjD4bsvCtuTbfH3Uc9tqwBo7gBJAL2BFQdqFiVq749cW4eUxUfRrYLJN2Zp5FkR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nfy1tQTl; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfy1tQTl"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-829a27414a3so2293203b3a.3
        for <spacemit@lists.linux.dev>; Sun, 15 Mar 2026 18:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773622862; x=1774227662; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SIPI/q2re4TeHZpgDpGUyFzrkzN62EoFr65JPUJDx7o=;
        b=nfy1tQTlbFXRKeWJ2re9Qpf4Oib9iTmbnXr3XwlbEERz2SWfGujUU+X4XR3QPOO0TM
         hYxiYTod8G3alotmkhMkWSH4SGogeXAZHISQcJYyiVtFyGLZTJxOPmZZi8drtfve3H5P
         yN6lImPmoITgx7NntSqFzCV9DsrP1CWuA4TjqbtrgfT7KVSVtnWdTtBr0DAG9fMdEIe4
         ORl9iMCPFMe+cgaOfHTbCMW6wiK7d/2K0PuscIrYEZUGTLP4eaZwelVKQCejYhY7NEJX
         E+x0KBbjlZDZVsKRRlOhA7INcuRyVUXsKmtip7AAXKr46H5qtY+m/cOIXCBToRUWMKqZ
         cCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773622862; x=1774227662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SIPI/q2re4TeHZpgDpGUyFzrkzN62EoFr65JPUJDx7o=;
        b=Gx7CTcRxYo1EIbUyZeCcJd1ORK8agfMrQj0EaMg4uel62c7834/61QIEEVFimVkNMu
         ckijutyJ0FkF59bkx/IKybxzUZU1gYpyjQqyx1HkoTubf8N2Lfnoys3bFHDvkqUVh+cU
         hjUaYSRB+8p8Zr89BLxNTx2mfZfWAoSoJ5vueDdlHnwIvy14BMLh8clpM1seSETqodzf
         bV8I5IZLjSCwPJzfaBRwM9PQtUSarIHeHzCq1Rt8vhNcmh53Sm1BTkGQRPMS7Xhtp/MG
         2H8ue2K4OktnhrJ5IlChCETxgN5THY4tPlyLUItsK2QTheODCaLGjcoNdim8VoFRKsGh
         +7Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUVfyXUq5QIUVE9lvZcmjyt/wy58vSXPbLO/jGKygzE28GvBQuAXZh4ckkXQ++JvJNFYY0HpQFDYw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8EQPN++cVMjMiLkiqHzB+q3kLFP4la5UKmx6aaX8B1vkcQ2aD
	520g9dypzQWha4MLZsKHB572ssuj2qbZU7AiBF4wXCIkQbgR3GCwsQZO
X-Gm-Gg: ATEYQzybhdEGj2+L+gNg02TsAmRYDpsXOTSOzMyUiet3gt2cDi7hFyZgY1icc8Kb3lj
	2zq/nVZF7Xs61ZECd9uIiDSma3qq+TWKLQj+6d30hwCrhKf3rugzc3y0DtllfNUwLdPZkIr67qC
	DFmpDzjbUsetVe8LUFD5AFs23YEKj5Q+SkdPIPJ1/VAK8m0mXJNXZu9CC++oEBLy+/5HHLiWSoP
	QZWhy/Nd3uScTC2pfyfVAL5osqMQdxExhCLdelrKDXkeudtELp1hiLi4BUiHy7tuBmSQTukAURM
	N8RxHkz7W2Pddr0rvBj7C5naIHNRtt7+GX6AiPnjADYXs8LL5/sdariAq+u15MMHHggM5LIpILC
	0B2KQYWViOziIx4T53Dkv6TEYjhJhOLlpPDE/1z/MR8c+1Uw4SFBCRTwKRTUsHvjkus6y9HGIYV
	vrfUPnN4eNU9uBNYI3iWahCkA=
X-Received: by 2002:a05:6a20:4305:b0:398:c351:aa0e with SMTP id adf61e73a8af0-398ecab0dabmr9889114637.25.1773622860419;
        Sun, 15 Mar 2026 18:01:00 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c74028eecd4sm1977320a12.26.2026.03.15.18.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:00:59 -0700 (PDT)
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
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Zhi Li <lizhi2@eswincomputing.com>,
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
Subject: [PATCH net-next v10 0/4] riscv: spacemit: Add ethernet support for K3
Date: Mon, 16 Mar 2026 09:00:36 +0800
Message-ID: <20260316010041.164360-1-inochiama@gmail.com>
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

Change from v9:
- https://lore.kernel.org/netdev/20260312012232.373713-1-inochiama@gmail.com
patch 3:
1. fix misaligned brace.

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



