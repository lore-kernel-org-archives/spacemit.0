Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD5438944C
	for <spacemit@lists.linux.dev>; Wed,  4 Mar 2026 08:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772611676; cv=none; b=Dw6KViVct/u3YplO1SqXhRWKF8p2sJYGRqiBk6QUIRRwOOzfNl84tASdyoqSBSPvY42ahytYME8EK2ZZgWVgoOKadZnLFdOvORRniBKLTHbBhkUspg+RLZzgxmjwKH3G8gn0zAn97vrB1/lrd8StpUKvvZcO90l7QDksj6Lqdbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772611676; c=relaxed/simple;
	bh=yoFyqYOAA4V1mwjmMpadIWCZZH1mrEKSXgbeTXxIp64=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kZzva4cFv5/XgxoVXlE4R5FGoTGhPTVmgwltJDZUT+TtnD3GBLnt1w2G6fNrIY5pAAEJAGvdtNmYwi78rGtinknMWp7Afjz1syMAlzOlL4NyO2/LQvMPx91Xxsfsvf3NBfekGXjg9ql6xzTNqCz4rygMvaW6oCJwg8tNwrztfuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J7ZMdoV1; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7ZMdoV1"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2aaf59c4f7cso30002055ad.1
        for <spacemit@lists.linux.dev>; Wed, 04 Mar 2026 00:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772611673; x=1773216473; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=umiDmXimKnwg21TsfCEQ72OkpzfSgk0ygJP0kl6mnKQ=;
        b=J7ZMdoV1vL6WPEwBwF5EFh5yTsLPyMW+5QgNY2pXpiqOwthp/znCtk/mh4TYCJniJE
         z9DPXt72XQdDh/IBajFXvphvGVrshcbZU+DMsIk+UCdO5Hjs85sA4doXnumZLwZqDvvz
         4haCCIuwMeQFchO309Bvns9kDhLfvks4VA1ORHzce54vvefHvlK+C2da7IBA/mQNNPrD
         AYDhVmhA2smJCGcXtq/6S8PvZn6zPvjtMU1NsiQi0VZQ5hABPqeLlsuGY+2frjc5bRa5
         0lPE9ERJMNE/C8vWQsgxFCo/EWSwGSQu0RBqi6jaf7mOz/j2oJm9FdfSbuv8vesVCtGF
         54Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772611673; x=1773216473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umiDmXimKnwg21TsfCEQ72OkpzfSgk0ygJP0kl6mnKQ=;
        b=wNBCM3I6GHHVRiks676yiI5lLVhlzzvygwqz+XDlZohpN4Jz5gIpHbA2/SkVc/g7Dq
         G0oVUj3isx4wW8+PvsGjtvh3yKaSmbC/Igt+yMgTFIiu/jQDyNCa0XK/hnvl1MFbd2K1
         nwejO1rZns9NMRQu1I8mFnQgSDl0hLTTSzQi5emdekt/ud3cpwzhMOhcxwzyqP7T+qjw
         FgxltMPnOuUrNxgIsV3/qIotAlfr2K6T92815FnnQUS6NkC+r3Q4M3Oirg+ePPfZAjzV
         pAdFLUtfdoyGHg0txc9qQrQ9COJEhAOu976Ae0S9rrE9rTxZstcaOGpRsjSEmBhR1WIF
         Ti0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXuV4W4a0qSEUx+1iQZ+hciocxnZIhd5755OHBp8t0iBU4kgywcEr74RhOOgnqeoUWfMA1lOypeww==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxq7PQec5rL60qX1BksTqMZtd6LYrc2ND9c+c6BO9J6fQPyj3+t
	WlQKaIP5HRFXFILBwuemzhtJlayPIFbb6vFiqMJ285zzVFQUIQY4Abxt
X-Gm-Gg: ATEYQzzRjfVDmvrny7m3iB3JP6BwiJPTLZYgMqXxVhGTaKc+mF0qEgaZopoGPwvbfZO
	SC6i/4DZZDHDm0v4TX7mYT0biM/7alcH36uthXo4O9wB3y1mGgqY7p5NefljmNj+vk3U6FejLL+
	WbhcmfJNs1wFw1ewswLScQ+/m42Z43yResIMUFxZ8zSujugwxG+0VV6NezXWD8C9y7UqpDh9plW
	bhy0sfbmydQ2tYj1tImx2kfSkk0jQxAwbKJFzrg6QH2xom16xFalJmv6FWxOnbkTV11zf6PhkKw
	CLjj25OkwfFyEVA/MWFIU8hLStAkpsfWKb6goQsYcYkG5hrqjeHkLCFc8M9eEop1n3ajRDh2xrS
	tqfwd0p15/NMSWxRAHMyvTP/tN8mbySbQjXlMHD28eDKkxRqWIKaAtQkUeYGIdizQWokM37zpLN
	Lh58fNWYD5do+E0S33Z5lnle/HUyB+cJLDUQ==
X-Received: by 2002:a17:902:cecf:b0:2ae:665c:8b16 with SMTP id d9443c01a7336-2ae6ab5ac69mr13854625ad.53.1772611673352;
        Wed, 04 Mar 2026 00:07:53 -0800 (PST)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae489c3626sm94364275ad.8.2026.03.04.00.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:07:52 -0800 (PST)
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
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
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
Subject: [PATCH net-next v7 0/3] riscv: spacemit: Add ethernet support for K3
Date: Wed,  4 Mar 2026 16:07:17 +0800
Message-ID: <20260304080721.1658224-1-inochiama@gmail.com>
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
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 228 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
 6 files changed, 346 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

--
2.53.0

