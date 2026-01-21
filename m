Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204DE361663
	for <spacemit@lists.linux.dev>; Wed, 21 Jan 2026 08:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768985403; cv=none; b=ZSyv/vv+UT5OSxU8vpyy3Hb8TDFido1o1QkNFKoWPjUF4bavCUcTzwfqlkJL5mYDNE/suI7Alq189Lua3jctRmCgqqenI/hgvBo+nKHSo5OozUQIffeBqg3M7kL2yYxRFxM9FJ9s/xQfnfn503JGSgYLPLpHS6GHSXcZek0JNrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768985403; c=relaxed/simple;
	bh=ivdSRO/Sa+8y6SbfRo9OGAFBLBdiIOgB64qyEx+BEkA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MITs3hRjwpz180HY5dVi+n/kRGzn6KWIFucLE/QYFgOXLS0ijqpjsTX7XTYrPWkqbEim9XfH5kS+2+DJ6NRSsc1nFIzD4udCF6WAnSZfKOoEnJ5sAqZfuXSKHVH4k0+87DEFeDwfrN143gyzhahc6ptIPkY5F0nxTW2gKe+P00I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IXLRDxl2; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXLRDxl2"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8c531473fdcso832641985a.3
        for <spacemit@lists.linux.dev>; Wed, 21 Jan 2026 00:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768985401; x=1769590201; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fbq78sea0hmX5//P4GjhYjkpSX+LqZ+KYNl1xezZDJM=;
        b=IXLRDxl20kgtHRhxcDwdMoATxs6XU/EeBhyZbBxjowDQw2LSUZo3pWWJIufBw1oPC9
         yQ6o4bt99R8cLbfFkhgDbrY/HD+EBFzm2fPC3HjBHR1++vV3cFellbWB/Y+Kw0sZmMQg
         ZFspLqFcc9BfzCvvCZJM/Te935bmHGdqeaHFcQanXiBWM4WfHO1UMqTBXi1vy14z03Yy
         JG+gd33bJrCQ2IghjJg2pMaCq3CYo9JDAGLIM2q4O1ff0KM50CkuRouG6Euh0dULHSZ1
         JINzSQ+cuEFERW2rb5JiDg8idePirInSwXZJffhQDSfC1M/fBpbZPyzPAxyQkR/mf/y8
         2xvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768985401; x=1769590201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fbq78sea0hmX5//P4GjhYjkpSX+LqZ+KYNl1xezZDJM=;
        b=bvc8tIhNbjcP5SC8adJ+U1BCBlHbHxjYJ4qI4KJWSSN2JlGzP/pGGFYiyrPLizk8mI
         VHdNnCg/ENQB0UTH1QKkacu5QSB0GTL+4U4c4APjYADtFdv5BhH7MhFXbJv+yGcAx9KQ
         kAAhPtl4GLNCvwHSIMUhVVRonT1p0B2RZ0qe8mBRBnLC+TPXdICK8A6+bH65j6Vq0qU4
         Vw7UF3oKaLNj3fyRagZNVBM5xSjCmzJrFPjycZVyLC1l3qhF8INFd3/ABQAaYXm51Yoa
         SvJVZcjbCvonvPQo78tZgD/ubWLcVcCq6/RwIzJdvK/e/mpU5I4VXHkNAyB6Bnckbz7x
         E0rQ==
X-Forwarded-Encrypted: i=1; AJvYcCVf/kh5GSQAEJba1sV8JdjV1w/5OQSz4xXdktQvKoRvkgrxWTJb3SR1nyZB8ET7KXDfy7UfiDaY0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YznZU8tfX32leDTFkkvdAwPSL41wxilqdeURfIr9M8SwzwFv7Rb
	lS9ShPuVc9Mj/Vu2LBwDy7Uy0hf6X6CLJhQ7EaKuOpRsFUZ4lPJA3SY7T/zXw3Xn
X-Gm-Gg: AZuq6aJnmPPqlK7sL5WuIk8q1/H0jZdshUMwNnjfOwEthgtVFQxzQOgaCucHHuR6OiR
	Z9tWQ3zhlEo6BAuo3S1oXpUvpAqiIbbDgRBHxRXVEBnRsOQy01C6SS+MyygQEnTYG+jN1FWVf9B
	5e5AYxsSuskOX9+wiG4Q/0YFiMzv6KGJjK1wB3RwmNht5mK05hrsqR8DVgiViHzy3db3cDmQuE9
	R0XRsPEc2pqlXxvNDo8rgyfnIylrdreZY9E5xBUBTKZmB9bd/b4zR+KfOpfENmRhNNdUPgs1JuZ
	LHkVOXUfVJfwmVEsocYnBbIiOwpuGDv1/8P/awj42WUuXRsPIXNpJ7MFe78kYlOfB7XPEneRgWC
	nLlx41Gfv98wH+3M9TWdQimJfn7HHv3Rjze+j4QYuoL8hi5JmcA0Gek3fpVg1dpvfQJSaMaD0Gm
	NMJ4EgXIVb8Q==
X-Received: by 2002:a05:7022:6b86:b0:11b:923d:773f with SMTP id a92af1059eb24-1244b3081a4mr12334928c88.5.1768979609488;
        Tue, 20 Jan 2026 23:13:29 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad7201fsm24056346c88.7.2026.01.20.23.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 23:13:29 -0800 (PST)
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
	Yao Zi <ziyao@disroot.org>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
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
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v2 0/3] riscv: spacemit: Add ethernet support for K3
Date: Wed, 21 Jan 2026 15:13:08 +0800
Message-ID: <20260121071315.940130-1-inochiama@gmail.com>
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

 .../devicetree/bindings/net/snps,dwmac.yaml   |   3 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 103 ++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 221 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
 6 files changed, 341 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

--
2.52.0

