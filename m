Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60942367D1
	for <spacemit@lists.linux.dev>; Mon,  9 Mar 2026 00:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773017023; cv=none; b=IuQba1WSLSfPmbkCCstN9cnEDLOwctogZ+EixGypHE7j0g1+LR24eaQChIE1q7C/ibEBuKjwFeebVybX1TSin+fMXxVdp+EXDYdElKyxapR702sSQUu4CLGUgfSLqInMhuMSh8XQ1l00iqM1guOYMZC09ULyCnyLDHrF3dICtBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773017023; c=relaxed/simple;
	bh=F9TAPixUvya/KShKD6K8CYIlWYXDr99PHeT2pj0XyIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MOAIbjAwvBim04KBssaP8iX+yQ/m2Q/MjA0asd//4f3Wa6Pe4CT4plhWZLcaFr6wCQfFNCVI8cwN7HMreCsnEj9z0j18r/ZiN5U0zxAfvhHGxGNnFFkMg68g//sm9yxrHOMR5sK9TLAtIz4acw1qSlFUctCBExaPl5MMXetJhKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mz8nish2; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mz8nish2"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-829a9c03780so2170667b3a.1
        for <spacemit@lists.linux.dev>; Sun, 08 Mar 2026 17:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773017021; x=1773621821; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oSzKv/Yso3zqJtEhQa2CN7kDXaRLoQ3igKM1IB73swc=;
        b=mz8nish2wKl9y+7Cl31r20tWE1DZ9wuOo9zg8KOfIlL5odscAOmkVfrxpQrljj7Tdb
         /RmT4c3eeYSKQqRFbm5/rSWHlNBu/N3DVD8mD0Zn/hAQe/Ym4UMZG2gvj42jhtlUqui5
         MsEyaNOuU8jbUbE6qS2n8NJMYMQn/1WWxstoo09TN3CHkLiK9OQucT9iMEGF5X3+Dm4f
         1VeMSsOvOf1WpoUusGvgTph/nPVwYsALO3LJZjA7dKjz4dxq3ofhFnaGfUOLDW003ZTD
         24c/42GJN047BP7XiogNf3w1SCDUbhjAYSoRuwj11pJw08ovgWk9yNaSHNxmJZ9iJO6I
         cWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773017021; x=1773621821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSzKv/Yso3zqJtEhQa2CN7kDXaRLoQ3igKM1IB73swc=;
        b=fztLepP62sSR0e9xF2BYFGN35TdvrUj+gsrbxuUnnFcNFPZ+KRibjsiIz7Qj2US/H7
         rAyWRSho8rkL65fFjkScqV4cHwQuqYIKX0M/bQWooCncbIL4ERYo0wwT725YVBHwTeze
         /jBNA7AHDd7mJGkzWqKNZl5WNJTT+InsqcLzZ39BfM+XDpU4HPlOvjlwM/nb0YvRl/7s
         t6cstDcnFu8VL99bq/oUDcjvooXTHVFhJ+zd5IMSt79YIFWKlcGhBr6byy+YXTL+UucX
         ojNsF2eavYVSSgp+yGS7+GXg/Jo/FnHdtILFc2pRioaLSvY713WKLdncguQCgx+A+YXl
         2jHA==
X-Forwarded-Encrypted: i=1; AJvYcCUSDDATGdv3aHEvUtBorWnT4esefciF8suYmEg6otYQn/GU7wZSSTxWoZA3g/CRzr+Z9Yp0EYbtrg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwjEmhXo3O31npzBHLIlcFWAQzPdTl7QhPUd7DVToGXGRt815AH
	ZNcXEjLQNSXof3twbYi9HEYeVs4nDTUCyzLbk2Dqm4sGjdA4B2a5DPQo
X-Gm-Gg: ATEYQzyz7qWHTcLLyPgJNIdioBjhe20sdrEb3UWKQpa/dP4UHK5PhgwtHQ51A9vcquB
	KhsPmgIdA2a86VIMYXP1AdKgecH8xz/cFB0KC/T0awf/EVhvzffPODso8MyQ04ZeLNUrpSPgBsJ
	rquBX6MUmXyiqlkj6ByBGuWNIF1gP0H9+JWo2ZqEP6NeTX9KsB76bX4qUUo5/kDiy55k49ijMsQ
	+brIJ+bSvFSJDE+Kf7XKlPFc/yZfMOpIHcmKMoxJmdhA1Cx/7VgEdpw2jCGYU/oZ2TAcwhuY3HO
	U2rM/7+WBqI1XEN8xssGpF6F9FttmeYvLconuCUWVs6gpODv2gpb4suqWXkhy3jLyXdNYN1+Afw
	VUmgTg/EGlVBJeNBv8spWKGx5a6eqp9ui74KwV2MRJebEUZyXAmJhK+ELc5gjNEz2kGoCSL2xeu
	H/UrJdUCpklvz3xodPqme5jnhwawL4RJO47w==
X-Received: by 2002:a05:6a00:1a8c:b0:829:810e:8af8 with SMTP id d2e1a72fcca58-829a2dc4f99mr8946097b3a.22.1773017021121;
        Sun, 08 Mar 2026 17:43:41 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a46369d3sm8200195b3a.2.2026.03.08.17.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 17:43:40 -0700 (PDT)
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
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
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
Subject: [PATCH net-next v8 0/3] riscv: spacemit: Add ethernet support for K3
Date: Mon,  9 Mar 2026 08:42:41 +0800
Message-ID: <20260309004305.315018-1-inochiama@gmail.com>
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

Inochi Amaoto (3):
  dt-bindings: net: Add support for Spacemit K3 dwmac
  net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
  net: stmmac: Add glue layer for Spacemit K3 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 102 ++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 227 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
 6 files changed, 345 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

--
2.53.0

