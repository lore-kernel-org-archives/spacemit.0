Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A763630B3
	for <spacemit@lists.linux.dev>; Wed, 23 Sep 2026 01:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790128275; cv=none; b=mcYSR97o7OKgG1u93dbC9aFj66bDWv/KpZLbR1JJI46tGCULsIc46SF+WbZM3iI6l0yjhmx+z+flAa+Cf2cXL64mDCQJJ1302QDcP/CWaiv0fVMTpmQsB2BVWXmkD9sIYTJVzzOjSGUGc2cctcylw0/EpRdWtpHtf1OUXzThknQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790128275; c=relaxed/simple;
	bh=qg8v1Bj0AJ7LrZXBhxVjtYCO330qkDOjIG55GgTZsR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B9KAn+Mrs80YEgMCqhwwQ2/Y4bOh3T8t3n29IsCaNZ9wYOYd9letO0/x2Lx92tCE+g+8NJRBu9YtKgFOxsSAHhbI/EaUqB5tFV9arRGZG8xzt3cplK84xBh3CusVMlvh2Yv9HxB9dDaNU9NyIIwuK2Y8SGxnbOcbd/LI05wAIPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YPXfsbsf; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPXfsbsf"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df4aa80a73so2694935ad.3
        for <spacemit@lists.linux.dev>; Tue, 22 Sep 2026 18:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790128273; x=1790733073; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L6bw/fsy4XZLqY7688qpNAi5VG6nNf6KIvqtLcr0OWg=;
        b=YPXfsbsfy2zBKe0Grn7xKeLSDJX8ClJMd8lOJ1eXYYismz06RCR8jgO8+Y+fqwx722
         /LbiicXe1InG1IQA3ZbbV3f5PeT1cIt0eX/AgpGon0PXVn8+shvuVbVtydUbITLTQsbi
         Eoqu9G1KRmzrwzcxqjYxTNxIjNMy92JDcd962y1wSEDNQZZxgGHGlveiWL3kj406Ltqj
         6awwoS7aWap0rVXEfiZhFqr9P5ZVdHjk/SFXYnXYJu+gkuq7SgmJmTT4uyMX+kmtx/cO
         1r9DFugwS8ZaDBiDTc+Si0SSqzas7jTzCZ18iW7ZSiOfMhPvGQKgY80XYhfmNxPe1EJV
         TFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790128273; x=1790733073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L6bw/fsy4XZLqY7688qpNAi5VG6nNf6KIvqtLcr0OWg=;
        b=i/g2t+yEzCRBqeLIfIjW+KK/ng2R5SnxPZ/huh2dee4HXcm90t7V694E8zT+A5rAqT
         LiHc6kmKfmx0gQ5+KFRq/nnMwZWeekidIpAmL/afUAtAk3jliIsuh5bKvkbwD2HBPqWP
         6mNnlET0F6fcy6eehSpzbQt5XjFfE717xhrNupSYJ3ueTZ/na0AXlNnRbhzfwTnS72An
         jzSPcjZ9higtKrD/4cveg4Qv+lKfUa+JAVkjms00/3ceSAnBQyAdpCSOlnPeWq2oTET0
         FWHKyS2rT5J3dAB+N+vdkZtJN6FFOb8DNFIu18C8XRFsj5hSZFg1s/v+pi/ef/5wXPYz
         JqPA==
X-Forwarded-Encrypted: i=1; AKwUvBzhkVI5W2ODYVfrlv8CxSG3cPPD1qoS+H5OE+7lEjTPAOWRanb29MLW/6M8Q/EVK+N0DmWDxDEPJA==@lists.linux.dev
X-Gm-Message-State: AFuF++kkhQgjWQIIFfld5+xq0Kin+ngsUSWA7pDE7DaI0xJKdGVbNmLO
	IMHLmVJfjmF31LbTggvgH07+OBn0oLj5rNToKt++/5NHIOpTKPVDBw6N
X-Gm-Gg: AYBFou0WgiElKBwETOIAkTNPcikez7Y/Q9LjBzo9eYCNYf/VwruyEpLcREh3S4yu2n+
	z/zdWZDII/bPACR2egv9rr6xlIuLRRvoRCCE9Bz/7N1TvKPFNiC7ywxmts4iYv89bb7UVZlQoFC
	wyq4/iancKs8CvgE/LOiD09qqDMAgoi5YIJcgBGcyMWtVa2lY+LwapderJd1DICO/KSutK4xcfN
	2t+dTm1f55xUljciYQwI8ooyHGCQVEJXniLgwSPGgN2jroveiMIRrfH+r3xi63E2CTcFwNe6UON
	q1XzWU45pzCY2wg6SP4jh16z+GBR+wP2YYcyRPponNLvIWNleC8/2bHWiu+lBaKqkXRZpPSCcaq
	6A14eiWZOiap6u7HLj+Dwn1tv3a8bFYT7zWtPuRmvdhellZU4wLUakrRSgr+ee4b4OkiOoecegp
	6YWy5CUbSVJBmTc08FXBzEBB/havOeh52e8OSWdc9txrJWURA=
X-Received: by 2002:a17:903:2c07:b0:2db:257c:9fd5 with SMTP id d9443c01a7336-2df69d3d22amr10510345ad.16.1790128272959;
        Tue, 22 Sep 2026 18:51:12 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5f66b3sm2769165ad.73.2026.09.22.18.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:51:12 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Sherry Sun <sherry.sun@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vidya Sagar <vidyas@nvidia.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Randolph Lin <randolph@andestech.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v6 0/6] riscv: spacemit: Add PCIe RC controller support for K3
Date: Wed, 23 Sep 2026 09:50:09 +0800
Message-ID: <20260923015016.64069-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCIe controller on Spacemit K3 is almost a standard Synopsys
Designware PCIe IP with extra control and external MSI controller
(IMSIC).

Add binding and driver support for PCIe RC controller support on K3.

Since v5, multiple vendor fix are included in this series, you can find
in [1]. And this version required [2] for phy bulk data support.

[1] https://github.com/spacemit-com/linux-6.18/commits/k3-br-v1.0.y/drivers/pci/controller/dwc/pcie-spacemit-k1.c
[2] https://lore.kernel.org/linux-phy/20260904083709.425893-1-inochiama@gmail.com/

Changed from v5:
- https://lore.kernel.org/linux-pci/20260907112606.465778-1-inochiama@gmail.com/
patch 1:
1. Return ENODATA for no device data found.
patch 2:
1. Add power_on/power_off suggested in [2].
2. Add zero phy check in the driver.
patch 5:
1. Add K3 device description.
patch 6:
1. Update comments.

Changed from v4:
- https://lore.kernel.org/linux-pci/20260709040027.958400-1-inochiama@gmail.com/
patch 1:
1. fix comments
patch 2:
1. Use phy bulk data to simplify the code
patch 3:
1. Rebased to latest master
patch 6:
1. Apply several fix from the vendor code
2. Use separated init/deinit function for K3.
3. Add some error handle for K3 init function

Changed from v3:
- https://lore.kernel.org/linux-pci/20260703020003.485436-1-inochiama@gmail.com/
patch 5:
1. Add missing interrupt/interrupt-names check for K1

Changed from v2:
- https://lore.kernel.org/linux-pci/20260517014841.254085-1-inochiama@gmail.com/
patch 2:
1. Use unify PCIe phy get/enable/exit function for both K1 and K3.
patch 3:
1. New patch for updating device id for both K1/K3
patch 5:
1. Reuse binding for spacemit,k1-pcie-host
patch 6:
1. Multiple cleanup for the logic already generalized in the previous
   patches.
2. Use generic description for the Kconfig entry.

Changed from v1:
patch 1:
1. Remove post_init callback.
patch 2:
1. Fix devm_kmalloc_array arguments order and error check.
patch 3:
1. Apply Rob's tag.
2. Change check from oneOf to anyOf.
3. Fix spelling mistakes in commit message.
patch 4:
1. Add comment about PHY handle.
2. Remove interrupt "app".
3. Fix spelling mistakes in commit message.
patch 5:
1. Remove all logic related to link up interrupt.
2. Clean up all unused macros.
3. Fix devm_kmalloc_array arguments order and error check.
4. Remove unnecessary start_link logic.
5. Make all magic number as a macro.
6. Fix spelling mistakes in code and commit message.

Inochi Amaoto (6):
  PCI: spacemit-k1: Add device data support
  PCI: spacemit-k1: Add multiple PHY handles support
  PCI: spacemit-k1: Add device id update helper
  dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
  dt-bindings: PCI: spacemit: Introduce Spacemit K3 PCIe host controller
  PCI: spacemit-k1: Add Spacemit K3 PCIe host controller support

 .../devicetree/bindings/pci/snps,dw-pcie.yaml |   7 +-
 .../bindings/pci/spacemit,k1-pcie-host.yaml   |  55 +++-
 drivers/pci/controller/dwc/Kconfig            |   4 +-
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 237 ++++++++++++++++--
 4 files changed, 270 insertions(+), 33 deletions(-)

--
2.55.0

