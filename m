Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1371A7264
	for <spacemit@lists.linux.dev>; Tue,  3 Mar 2026 01:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772500028; cv=none; b=I31TE3k+/RvUaiJ7quZGjcvBTdB6julMEMU/mjra4EmnD9tK+oV04bUXs5yp1U9/mNmp3iypDFCHcsSDU9k21J0qcfFyPDdAPtbIVi1GKRGFR027YloH8Z0QPwv6YnCGDk7wdVBdKtltLvO3cZKoFKS3vRtNDL5cBG2D90/H5rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772500028; c=relaxed/simple;
	bh=gES4GJg7caL7FDakaIQFxprqwVBsSTtJ0RmrIWeRxjk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p9EfxoK6iEoR/2KEtv+VHeIB1x8UF5e4bcpeEQgF9fFLcsNolrp448Eya5yDIiox/1/LrorMjt7FwVZaa8E1+mMCBkkQaaINTZ/A2B02KZbpE5k33QXjVdt+eMmy0JhxHS1M/6wFzN9YDensoGSyR9K6GvN+m0JRuO1AxA4Db9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BkUWkr8K; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BkUWkr8K"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ae46b9c70dso8237335ad.1
        for <spacemit@lists.linux.dev>; Mon, 02 Mar 2026 17:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772500027; x=1773104827; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uyhrdqZlHw4Vr79hIFoPgUvb87j9Owo78niBL4sfkNc=;
        b=BkUWkr8KhvnWmMkV5XSn5G1tD+Nl3HZ5PRaW+d3s5Ovk14P5tMpBxkUi9QAyFIJ0Qs
         J10FPXbgatSATKXsxbbKaRaJM1UQTb/wscDHq5KuH0eicKxU43faFUXzceVMarRcqKC8
         vpGDO0F1dptEMhOvbtGuGa0J4g5DNiNgnhFU+69DKcaYHI5y0zKZZTCam7SBCOUOsBoS
         nAFIpKZrdjt4ZwcBh/beEdHplWYw8FlXQkL1t9YIBa9CsnvkGsqEUriZ17M5C04Tn/dP
         twF5TxmaSZzkKLNg79QEYGPF5DfdYLvXL6y4CHq1kHnK5DP2hqpVI76JPd4ZBbNcWpk6
         pGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772500027; x=1773104827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uyhrdqZlHw4Vr79hIFoPgUvb87j9Owo78niBL4sfkNc=;
        b=uSyRDEEkIyVbxZOgPDcr8nbE6Nt7iHLr+IwCG5MV+RWZhUI9cI83LpyTc+C0t51hou
         ZmuxM2FWbKNezxG1gSVtBvhJOvrKUJe0EpVHCB2sIaGnyiMbgesX7ayo0hHxOIJM4LiQ
         zGwyLTq4q00Rt/tkApfE/7CWqBQfaubCkolFNIYNBAXa2wglL/nVzUuwvjiupot9N35/
         RXK903aYRP+R76jUVIC262gmssyzHyNhSqYsLJUNHLOzc5QXgDOb9Kvv0LsVDiLPTwrQ
         7Iem0INoOQgF29cDfPbOxSloN5tZlos0ABRubz2QfVqWPn29xiPLJtyEJIbWxAVe5Bpp
         fafg==
X-Forwarded-Encrypted: i=1; AJvYcCWa+FZxV2BT0LwXB+WFb0xM3VpzC6SQIqK1203Klt7Hm+nXDzK8y1GNvOUfKrMmMAvKy2x1KjTcog==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPB1riUzXecJK9GO9vdrApDRbYf/BUL43YHBzmf0aE8Cw6O4zx
	589ir2IbNbWJ0R6Z3APMnZdNKzeGc2MNRFZ3T0fUTe9a9lW/m1/ICJFu
X-Gm-Gg: ATEYQzwFz1RSbKfM+QH8Qldu30jhnre4d3ubdHhc73cgxk4aXNtEJx9o4exlsQ+85hE
	ueThEoVI+LAygleZtkrLeSpgY9Fc8VZbSGwSrocjRjIMSFAkUmt7m08F7sSHeB6/8e0PCVWeR8l
	Y6Sfeaot6nz36dteicwYVPTeOz20FkFBL/GU+S6NK9dfFhI/WRojdBFa77SBAgnYL1VFJmuofpH
	wD+U8qjVh+EGrTrx4lYFl9Pdc5SoEIox0cA8g4Gdzsm4gtyXLnqbc1SzokToJIe3cCBLVIMh9UJ
	WdJGT3ScJ4t4VklEuvHeyFJC/bxyuZ/VK7O9RmDcsma3hSmw0R6YgUvDfooSrrpVpDh/G8zwBbh
	HFOEmoei1bJNSTlzZz6zzREDuuFYJjOkWucEv6wMynFAiLYSb4TBpCj3NcPsfeQyRDl2y36v1Tv
	VwNcSa7c8JzzrL2Jh5SqRWUw==
X-Received: by 2002:a17:903:2447:b0:2a0:b432:4a6 with SMTP id d9443c01a7336-2ae60cc32efmr3595925ad.15.1772500026993;
        Mon, 02 Mar 2026 17:07:06 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae45b5201fsm66337935ad.87.2026.03.02.17.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 17:07:06 -0800 (PST)
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
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
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
Subject: [PATCH net-next v6 0/3] riscv: spacemit: Add ethernet support for K3
Date: Tue,  3 Mar 2026 09:06:26 +0800
Message-ID: <20260303010630.567674-1-inochiama@gmail.com>
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
 .../bindings/net/spacemit,k3-dwmac.yaml       | 103 ++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 228 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
 6 files changed, 347 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

--
2.53.0

