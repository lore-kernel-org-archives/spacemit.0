Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8141214286
	for <spacemit@lists.linux.dev>; Thu, 13 Nov 2025 21:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763070348; cv=none; b=RAEdbPPSi9HNrCHl9tFSrqi/mQHUBfSskTYuXo43+Fd5DGVjoUK0895aAvn/5JcMseAZP/FtAz5sFlglvoYL6VF8MwbkvnrKYhc/lWfnFsc4CdnRdrutEabZhsyvOTPVJRf7LQBPjrz0UNsn34EIpHNi1MvRHV6z0a11eP3R0WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763070348; c=relaxed/simple;
	bh=9BK/aY1DJKiNGs1q0x6hPPgaG4Z4qLB/Bh+9MtSYO0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bte4QZyoiX2tIzt/n9KTNhkaTS0aCbzOjTV2fydbgjzohT8WNrO6sD11YnnyAGTBR3AcFNeR1C54hnJefFXPNxnajtl7qyFyHMSR0CXC0/p+MmqrXzxnpVlRRU5+sRA8SLyf1/ioBTHiV/ZfpMwo7+PyL0ZzeewwiDm6Z7uwTDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=wzwaWH30; arc=none smtp.client-ip=209.85.166.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="wzwaWH30"
Received: by mail-il1-f193.google.com with SMTP id e9e14a558f8ab-433217b58d9so5902625ab.1
        for <spacemit@lists.linux.dev>; Thu, 13 Nov 2025 13:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763070346; x=1763675146; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B379bUTcQAQWYz6DwkV1TzQYdhegW4cKAiyXnES8aOg=;
        b=wzwaWH30nZEXwafqe0DDACMEO66FwzhtBkIgwZ3dZuYC+JsnnhwFdxUK+mwQB9gK54
         Y2EFqTCHVAR2DU9r40dweqmabj5UajrzneWkSYx1M0EkVoL2ug79FkanVETDP11XQwSf
         GuQJbJl1yHBAO7TQGmTmiGJI8XdCmHpaWBXYq/o56jRkchcem+PLhhfJ+hSWOXYDhawj
         w+4H9hZQf1aiy5lYHd+w14okC0zw6E0X0Bni/5Hp7dUS3OLinWtUGPEdLP5nr2oME6Hm
         77m0h/BIJdcEVFqWAPZ8SZ/FcIOVFH02kdWVCzXpzpdYLXW2dFYD82VGUL+xrYK1xMXr
         Z8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763070346; x=1763675146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B379bUTcQAQWYz6DwkV1TzQYdhegW4cKAiyXnES8aOg=;
        b=AEI75omHDaR0MiaUx8ubLY4HmYZPuyOLb3U7MuAC4OT5+3+4B9Kk2f69te+LkW3F3+
         6XmdVaZgniqE/NO7LjeHTcPwQLB2tyTxnP8IozbgAtJQAancb+0SJ3tuOiVJMUgNjrUz
         37YZ/7oI+TENpG1PgB8+G0ZKiCbtPghMgFEBOUkY9rwdy/w2AEqT7K2H9aUAPuGZXk3/
         j2bGXqHyd+2XqozuBrrZZj/8bdD7F8KRK0u5K4kQlp4uDWVYOwmwyXQ8fznhwRyP5xIt
         IUGvwkLm4DxlmRABS9K0ZjjZT2qo81F7T5yBpxG8J9LbGxd8Mhy4sJ21ShhnZ5Xp8Xrp
         sYlw==
X-Forwarded-Encrypted: i=1; AJvYcCWeDXLt2hObN31xLxoipD2Y08YhbZg36B33udFm/iT757Q+DJF6P0wwNYwI+3N5hYkuxKnMr+FxaA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxg2/0oSSIkn3+IIqgliiO283ueJ7ZvymtxJFum6JvmiNxpiTQs
	/1PlLtOi3hc8Hfqht7ff2VpFLpdsrU4jgUFl+lNYgo+sBCzxvy+geUxE5cZJ35CiJ7I=
X-Gm-Gg: ASbGncvwa5U7zl9M86/X2WzgubtWoOkQCWbmslI7DNeh4fFGu8R1NpoXLu3o9OwzgyL
	mFVDTI1RvXdVe60qEwz3UdMW67AXJnzaon8uwaGqV64PFrBJNLSDM9RP0fnyIOUAriH9TaHdmhg
	IC/wTE1qfEtWp1FVTKA+dXl3DoyyWmlkJh85pDtFQwH8RmacjpmUvs7gLVaUukOl8bBOUXU6oo+
	c3/GnwlHizfu8UagKRRKDXBOAXsGk/XrukLGRUI+Kbq5Cn7tOTPycBKNSUHMJ5eNlSjE0AA1ta7
	PdCxF2Dri3PzRiJLCfMN0tbxIA87Auh52THJIckyQck5TRc/EA4KUmlfEDze+0gM9EmFr52YiMz
	x2LnexB7FBU8IPKMpK45VVmx9K1h4z6KA+7mQ5mKWLv37AoyoMGJjImIDpFq1/d/SGZZwNGYPB7
	6ZMaj9FJF0S13rT6qxEhfPgNdd/f3TDrhCoTorlSF3kRgHoPviBxJDPg==
X-Google-Smtp-Source: AGHT+IGJ0MUov99smegICrZ4kiST3drjyP8OcDyErpcAaWnTogYM2QvmzGI/vYXhzw3nIp4B4JWV4A==
X-Received: by 2002:a05:6e02:3813:b0:433:3316:17db with SMTP id e9e14a558f8ab-4348c863a78mr17011835ab.4.1763070345478;
        Thu, 13 Nov 2025 13:45:45 -0800 (PST)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-434839a4ac7sm10877115ab.25.2025.11.13.13.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 13:45:44 -0800 (PST)
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
Subject: [PATCH v6 0/7] Introduce SpacemiT K1 PCIe phy and host controller
Date: Thu, 13 Nov 2025 15:45:32 -0600
Message-ID: <20251113214540.2623070-1-elder@riscstar.com>
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
that PHY to be used for USB, the needed calibration step is performed
by the PHY driver automatically at probe time.  Once this step is done,
the PHY can be used for either PCIe or USB.

The driver supports 256 MSIs, and initially does not support PCI INTx
interrupts.  The hardware does not support MSI-X.

Version 6 of this series addresses a few comments from Christophe
Jaillet, and improves a workaround that disables ASPM L1.  The two
people who had reported errors on earlier versions of this code have
confirmed their NVMe devices now work when configured with the default
RISC-V kernel configuration.

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pcie-v6

Between version 5 and version 6:
  - Aurelien Jarno and Johannes Erdfelt tested this code and found
    they no longer saw the errors they observed previously
  - Disabling ASPM L1 is now done earlier, at the end of the
    dw_pcie_host_ops->init callback rather than ->post_init
  - The function that disables ASPM L1 has been moved and renamed
  - The return value from devm_platform_ioremap_resource_byname()
    is now checked with IS_ERR()
  - The number of MSI vectors implemented is back to 256, after
    confirming with SpacemiT that they are all in fact supported
  - The sentinel entry in the OF match table no longer includes
    a trailing comma
  - MODULE_LICENSE() and MODULE_DESCRIPTION() macros are now
    included

Here is version 5 of this series:
  https://lore.kernel.org/lkml/20251107191557.1827677-1-elder@riscstar.com/

Between version 4 and version 5:
- Clarify that INTx interrupts are not currently supported
- Add Rob Herring's Reviewed-by on patch 3
- The name of the PCIe root port will always begin with "pcie"
- Lines in the bindings are now wrapped at 80 columns
- Subject lines are all captialized (after subsystem tags)
- Place the PCIe Kconfig option in the proper location based on
  vendor name (not Kconfig symbol); expand its description
- Drop two PCIe controller Kconfig dependencies
- Use dw_pcie_readl_dbi() and dw_pcie_writel_dbi() when turning
  off ASPM L1
- The dw_pcie_host_ops->init callback has been rearranged a bit:
    - The vendor and device IDs are now set early
    - PERST# is asserted separate from putting the controller in RC mode
      and indicating power is detected
    - phy_init() is now called later, just before deasserting PERST#
- Because of timing issues involved in having the root port enable power,
  getting and enabling the regulator is back to being done in the PCIe
  controller probe function
- The regulator definition is moved back to the PCIe controller DT node,
  out of the root port sub-node (in "k1-bananapi-f3.dts")

Here is version 4 of this series:
  https://lore.kernel.org/lkml/20251030220259.1063792-1-elder@riscstar.com/

Additional history is available at that link.


Alex Elder (7):
  dt-bindings: phy: spacemit: Add SpacemiT PCIe/combo PHY
  dt-bindings: phy: spacemit: Introduce PCIe PHY
  dt-bindings: pci: spacemit: Introduce PCIe host controller
  phy: spacemit: Introduce PCIe/combo PHY
  PCI: spacemit: Add SpacemiT PCIe host driver
  riscv: dts: spacemit: Add a PCIe regulator
  riscv: dts: spacemit: PCIe and PHY-related updates

 .../bindings/pci/spacemit,k1-pcie-host.yaml   | 157 ++++
 .../bindings/phy/spacemit,k1-combo-phy.yaml   | 114 +++
 .../bindings/phy/spacemit,k1-pcie-phy.yaml    |  71 ++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  44 ++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  33 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 176 +++++
 drivers/pci/controller/dwc/Kconfig            |  13 +
 drivers/pci/controller/dwc/Makefile           |   1 +
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 358 ++++++++++
 drivers/phy/Kconfig                           |  11 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-spacemit-k1-pcie.c            | 670 ++++++++++++++++++
 12 files changed, 1649 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-spacemit-k1.c
 create mode 100644 drivers/phy/phy-spacemit-k1-pcie.c


base-commit: 6d7e7251d03f98f26f2ee0dfd21bb0a0480a2178
-- 
2.48.1

