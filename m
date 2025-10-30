Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DB223A9BD
	for <spacemit@lists.linux.dev>; Thu, 30 Oct 2025 22:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761861789; cv=none; b=MJtKAqjmdBFjulUAoQma3NAJWAxEU3YPjTVdO/Z8hX2tYONXeNyIMUNISQweoXVGZLljicVB4R2GjF28+54Kyyd3NaBrCYdzOwUmfQzmMrB6J9cn1U9dau1OPDejFagxjy4gb48XfKzVg05+aDsiTVXf1yF6qLO4DckinxghjBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761861789; c=relaxed/simple;
	bh=QOIcc2+l6slkkak/Opq+CJtKjU3NIDV1tx4AeEAkKKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rGmBe5b0Oc3DPv1ZqPlXIZuCmNydyu5f2EbaFas3pyWRz4NEQ8q7+VGF0cAsOp3wsX846RYHRDvozDnqUOdHi9EPZ1QUEhCaLaOq8Fy729lPnrgSu/HvqjC1wqk8V5+2CqVRNV2M+y6cuKSulSZudprWlAkxYdCuTQeJlCL9uYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=z0TAj0s2; arc=none smtp.client-ip=209.85.166.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="z0TAj0s2"
Received: by mail-io1-f68.google.com with SMTP id ca18e2360f4ac-945a2c8e52cso69678939f.3
        for <spacemit@lists.linux.dev>; Thu, 30 Oct 2025 15:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761861785; x=1762466585; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Phq3DSvAibN+39Xx+hszp3gQ0pcRpusIMooyNw/JXGg=;
        b=z0TAj0s2mfUZUD7xX5ngG75OeS87Qblz3qaM1IeXyjnuI3wUeq9Xe/FnuJ505lLpD5
         PIcFoM4xwQacxJWqGW7oBPdg8DZ1H1I13JTHjss01GZZm5tosD/NsotRcA8+C0rsbtWY
         YDc9bOhbcmNDNA8cYe4O4/Rep0+9kvtlfdbyt0o9pBCg68Yg1m69w09UJECm1TMCQYJA
         Z6tyKZkLHgOUR2WZ89n17JbW0+zm8zyMsgF+HKsNXvwMYQTpTepx2p7dllVQAY59wv96
         b2Z2XqZUlmLrrmSbxo3szgFf8TrNIBmqc/j8bSuSjcjorJzawA+SauqcI3vIUSiW/pmM
         G3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761861785; x=1762466585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Phq3DSvAibN+39Xx+hszp3gQ0pcRpusIMooyNw/JXGg=;
        b=T69mWCJP0y5rju7qzHqo/fp3dt5lItqv6Wc7xf0NSJtf7tgHcfwTvr+9wzSGLh1qol
         ExuCYeIKbG4rF8czTzd3l9E6oYEBL4t0KPdiKN50bWmv5+gOuAUzrUinSLOZosjvCESH
         5RTTo0IBf5D/kfVGNAsAm4top4eTWBpqi4MZ/jkwDuUixJTCXmKQ0WPiLv75CwXCgMg2
         pv5YIBQeQxxz7mkpCBbslAgniSnFOkX1/ZbBUd9Q2g2BqVGnlKQgwrDO0JbIdJ1bxC9K
         dy2WKsiSOSgGqsJ5m0B1sfgxDVCZm+i8X6Q6sR3louuktvfjEZKkfH0D+Ak0n3K5Ye1c
         9oSw==
X-Forwarded-Encrypted: i=1; AJvYcCUfeNZGtV5Ab8IpBFzvQDVNZeQEW1M6+1s00SiZBAeiPzzXSIySB/zVfkiVa+OrgrdobrCv7y80Tg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyjVXBkKF/3GQxBXwyvHXBYYwLUV+Yq5V4cmAMb3SzELsO41Wuo
	GgokhhX5w7IS+qwoFWzGRuj25sRPvhEe+bsE3yag60KFb0SxQnxd2d9vklARbZjvefI=
X-Gm-Gg: ASbGncueO5beiAg4dkTSaGBzWISrj5BTjpVKBFeizACqsm4Jidyzu1GCty1OGK0Mf1w
	+kCmHtu6W5EU23PnLuP7urBVv1CgVOD2XKIDl649bxr0W7SPlrGZ7MXukCgXVVv+NIbJQ2kvsar
	sEqCJyB9iSsFvxKuI8RTiN+hix6LJcM1KxJ2DaQAlgl3n/iQuqTBDDOQRP2XtSmy1i/jaUgKETy
	KnOOkWX44jVxmaqxx3gqDEo7qoLktMzSAWHhID3xQxOON0WzOTu1mrsOg7i2t4EacGmVw2BKJJQ
	yc0V74AcqTcailPwKre6N6VVh+nKNBuL11B+diHCtoCuY0N9DXzgVNx9tMFwBDCEHQjaL2zSlPZ
	YcfXoeyc21h06DdvlC5jWpGFAptjGzbZWO98sggFaLJsvnZgnJKMkNFopNM8S94gpDTMvWT2jyA
	pPo40qx+kGaNSsXDAeK8DE0se+Z+/nlAjjZru+G4qUNUYpFx33PAzmUg==
X-Google-Smtp-Source: AGHT+IHIfi5HvcZFQEMsBLWU40iLrdbD6dtXflle6FkJVnDeQEPilinICeuX7JKqnLgG58PEKCRkEQ==
X-Received: by 2002:a05:6602:1606:b0:944:f050:65d6 with SMTP id ca18e2360f4ac-948229ca479mr236508039f.10.1761861784511;
        Thu, 30 Oct 2025 15:03:04 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-94359efe149sm604118039f.13.2025.10.30.15.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 15:03:03 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org
Cc: ziyao@disroot.org,
	aurelien@aurel32.net,
	johannes@erdfelt.com,
	mayank.rana@oss.qualcomm.com,
	qiang.yu@oss.qualcomm.com,
	shradha.t@samsung.com,
	inochiama@gmail.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	christian.bruel@foss.st.com,
	thippeswamy.havalige@amd.com,
	krishna.chundru@oss.qualcomm.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/7] Introduce SpacemiT K1 PCIe phy and host controller
Date: Thu, 30 Oct 2025 17:02:51 -0500
Message-ID: <20251030220259.1063792-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduces a PHY driver and a PCIe driver to support PCIe
on the SpacemiT K1 SoC.  The PCIe implementation is derived from a
Synopsys DesignWare PCIe IP.  The PHY driver supports one combination
PCIe/USB PHY as well as two PCIe-only PHYs.  The combo PHY port uses
one PCIe lane, and the other two ports each have two lanes.  All PCIe
ports operate at 5 GT/second.

The PCIe PHYs must be configured using a value that can only be
determined using the combo PHY, operating in PCIe mode.  To allow
that PHY to be used for USB, the calibration step is performed by
the PHY driver automatically at probe time.  Once this step is done,
the PHY can be used for either PCIe or USB.

Version 3 of this series incorporates suggestions made during the
review of version 2, and based on some error reports from Aurelien
Jarno and Johannes Erdfelt, disabled ASPM L1.  Specific highlights
are detailed below.

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pcie-v4

Between version 3 and version 4:
  - In the DT binding for the PCIe host controlloller, add a new
    sub-node representing the root port
  - Move the phys and supply properties out of the PCIe host controller
    and into the root port node
  - Define the spacemit,apmu property later in the binding and DTS files
  - Define the device_type property first in the binding examples and
    DTS files
  - Add root port sub-nodes in the examples and the DTS files
  - Select the PCI_PWRCTRL_SLOT config option when PCIE_SPACEMIT_K1 is
    enabled
  - Parse the root port node in the driver, and get the PHY
  - Leverage the PCI pwrctrl slot driver to get and enable the regulator
  - Don't set num_vectors to 256; just use the default (32)
  - Cleaned up some comments, white space, and symbol names based on
    feedback from Mani
  - Add some runtime PM calls to ensure it works propertly
  - Add a new post_init callback, which disables ASPM L1 for the link

Here is version 3 of this series:
  https://lore.kernel.org/lkml/20251017190740.306780-1-elder@riscstar.com/

Between version 2 and version 3:
  - Reviewed-by from Rob added to the first two patches
  - The "num-viewport" property has been removed
  - The "phy" reset is listed first in the combo PHY binding
  - The PHY now requires a resets property to specify the "phy" reset
  - The PCIe driver no longer requires a "phy" reset
  - The PHY driver now gets and deasserts the reset for all PHYs
  - Error handling and "put" of clocks in the PHY driver has been
    corrected (for clk_bulk_get() rather than clk_bulk_get_all())

Here is version 2 of this series:
  https://lore.kernel.org/lkml/20251013153526.2276556-1-elder@riscstar.com/

Full details of changes made for version 2 are available there.


Alex Elder (7):
  dt-bindings: phy: spacemit: add SpacemiT PCIe/combo PHY
  dt-bindings: phy: spacemit: introduce PCIe PHY
  dt-bindings: pci: spacemit: introduce PCIe host controller
  phy: spacemit: introduce PCIe/combo PHY
  PCI: spacemit: introduce SpacemiT PCIe host driver
  riscv: dts: spacemit: add a PCIe regulator
  riscv: dts: spacemit: PCIe and PHY-related updates

 .../bindings/pci/spacemit,k1-pcie-host.yaml   | 157 ++++
 .../bindings/phy/spacemit,k1-combo-phy.yaml   | 114 +++
 .../bindings/phy/spacemit,k1-pcie-phy.yaml    |  71 ++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  44 ++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  33 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 176 +++++
 drivers/pci/controller/dwc/Kconfig            |  11 +
 drivers/pci/controller/dwc/Makefile           |   1 +
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 349 +++++++++
 drivers/phy/Kconfig                           |  11 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-spacemit-k1-pcie.c            | 670 ++++++++++++++++++
 12 files changed, 1638 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-spacemit-k1.c
 create mode 100644 drivers/phy/phy-spacemit-k1-pcie.c


base-commit: 131f3d9446a6075192cdd91f197989d98302faa6
-- 
2.48.1

