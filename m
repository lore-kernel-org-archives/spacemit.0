Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE3C354AC0
	for <spacemit@lists.linux.dev>; Tue, 20 Jan 2026 04:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768883785; cv=none; b=AKxFhQQljayVXRvaqi5pjWuH4uElshZLhcNErsXPcvHkDSrBET/MnDK9Ksm+QFgQ6q2ToOFqafPaeb1HNfuEoXbKhq/fmvF34mAqC/K0lWxErAcg3ixTCWGu/yJeCOY52mIU84qv0b4WuJ/gTy3waoSCUoMJzIYpXtBjD7tEo2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768883785; c=relaxed/simple;
	bh=Wlngs8GSpv8APxHaAYUjYkmr2dMA0BCajAs9V2BT8ds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UC+/QsbwL72lfkQEyMDuNpGx7I5681vwbSWFWecY+7hBoyTapcuVIgfew5KY3VqUqah76vrjjTUD8P/qbdUhYKxBEkQK8mtX7ifJkg3aELASWEZV/nmf50J1ZOJ/lo4iBUAR5wqrItJMdnhwN+F2cC6e/RTmcC3HKtG/6/Jbcek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJjgisbn; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJjgisbn"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b1981ca515so5361441eec.1
        for <spacemit@lists.linux.dev>; Mon, 19 Jan 2026 20:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768883782; x=1769488582; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=29OkNoazPkO3Cz/ca1GMRTcjG5fAIFuxe8NjRt6vIh0=;
        b=TJjgisbnIo1qvlwkqSgfazObCO8t0Hw/u/OA8WRQDTDyuF6evScZ7L/yQDp76ndHv+
         Txr203qM6vC8fNlyL6kc7IcZ9LJ4HEbY7MiiElhJVW6vsBMECyGFUWIsg7xNF0fHgPzv
         zbhqty49aZqG88RwbiRvXtCMuSzCT58Ir7ikUBESEodpSmpMEr6J0m62zhm1nY43y7d5
         saCLLkAbcV50bNHSnuYIdGZAkOoVz4SuKOziMC+MUhdsVGvWUW/EpkLlBWiEZyrKs+TH
         VvxzHzEn2YupTObE5dTXuoviTUSZDNH0PX/D9FDayy+wZNPzf4XfTVBG4rtrYmQ5Jkkv
         F8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768883782; x=1769488582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29OkNoazPkO3Cz/ca1GMRTcjG5fAIFuxe8NjRt6vIh0=;
        b=VAPhI24/vfOImF8bpJnRjuWKkLMrT+KySIL+QcRCvzB2QlYyZcCFgXGHuX//Md8meT
         J+cKGtaaP4NVY5BTXaseDeeTmb7/WSfUkDBg5lizbNjjylVDidLg1s3siVMFUd9OJvAz
         TcveA3EiHcRhD5X8U0TFWKd6LhEKwkP2M+DTcEfwqB9CxRuT/ZqliKa0mRjTs5JNgnMc
         p9Av0L4c8NCcoVCQOPinEQglw+zKHdk//qTNjawWdE8TYYcPDtrP8nVNB5X32+qmFBio
         NmCy4mOBdIDS7DyIU4Hrb9U+lyVGv4yF195Ia9l2B+76XTz3W+KJqRxgUnjzLwPoKTDp
         sVKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUmmS+0d7LglFl1e10CnDP7UItdl0/AbWfj2lOrqGGqsFnXqGNOefkQEDVF5AViq2s4619OW4xjw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxy7/CmMuoNot5JH+vm+/WxqcN2tEva71PCbLp41SlU2ZZgdFEr
	HWRSS0ivjjhJRtAdxhysQi+pdEuF8W0TD0bpVyqQfCK+fy+442oigKIw
X-Gm-Gg: AZuq6aJseNSvZwdBAG+NZoV1LuPkOFCimow16vb8F9xMInXd0WrdX+JxqKMjoq1G0Am
	uk7Ln76yF0YhXEBsUqMfVkeUmWoESzoto1xbccGr2R2dt5o8ZfGsSAyoA5eTg2hvUi3a4tqR96Y
	IzIL02UTRnOu3Tf05ZG5haFVFgQZWGN0smUw6VTrL0h51P1+jeOWeAYDT6xcMv1KIl+e1quP1vW
	Naqq76fP61GNkeTbWY3DyFhmHfsm1EGh/wjPBEK9vSENoZBrgMkObTQseD23gdCKMBv2CJANs+z
	Qhm6Npxy6OqmxD8PksXrYA1azXi6T7rfohfR2zEyOmXx9izQfm8Jhz+BaNuLrAe3/ZkMdBwPHDd
	vqzPu8IguP0plUkX7ntq/YXl+HviZd/xv+qUwB8C3/2LUWyYQSgi7xHhEPSFcNNf/iWQt0Kn6G5
	cG6aiVE6bxpw==
X-Received: by 2002:a05:7300:a188:b0:2b6:af85:dd29 with SMTP id 5a478bee46e88-2b6fd3a7b8fmr363879eec.0.1768883781926;
        Mon, 19 Jan 2026 20:36:21 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6fba43c3dsm1271369eec.0.2026.01.19.20.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 20:36:21 -0800 (PST)
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
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
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
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next 0/3] riscv: spacemit: Add ethernet support for K3
Date: Tue, 20 Jan 2026 12:36:05 +0800
Message-ID: <20260120043609.910302-1-inochiama@gmail.com>
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

Inochi Amaoto (3):
  dt-bindings: net: Add support for Spacemit K3 dwmac
  net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
  net: stmmac: Add glue layer for Spacemit K3 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   3 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 107 +++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 224 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
 6 files changed, 348 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

--
2.52.0

