Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF64233F8A8
	for <spacemit@lists.linux.dev>; Fri, 17 Oct 2025 19:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760728068; cv=none; b=GAN1r73fLqX3cuIbuPVDIrWaLwA3va6mKN+Vvqyeznefh8Zk9KbnlcQvuRs4CJ1gD7RkDeDRzWmJSAPCWL7UKO+WfnQ43fK8LyTjNlGOoXj5crhUoqMi3oCKdMhREtsl7SCX+0JDGu0atAzAHAsWegogwujNayVf1ciegoDStTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760728068; c=relaxed/simple;
	bh=LqFmCYRDrPtkcUDZw5zwYA2weRZUj13NHO7zeAuhORY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tobQkAP5Cx5PMscWeluVTpdfvoXsmRDW+fY1x+gq43mQngGxhZ6J1zthYETqaU9Spi1u91hmCUUjJaTfDoQuXFHHiPVbSsf3p4NvxZ5YrCZImJBQvYVwcZqKNclPzc8zJ+ipbbnxmQmaD9qEWtH/mGHzNAilsVHhIh4dxBjoDtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=XucNp0FO; arc=none smtp.client-ip=209.85.166.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="XucNp0FO"
Received: by mail-il1-f195.google.com with SMTP id e9e14a558f8ab-430cadec5deso7111175ab.1
        for <spacemit@lists.linux.dev>; Fri, 17 Oct 2025 12:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760728065; x=1761332865; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6AlkAll+OG6DFncv4Mizto8zaWsmmVbaRHf+nrpHgq8=;
        b=XucNp0FOI8E9N9GoiAiy9I7/CzfgNTC97X/lyfhLpWm/pa6UYCDw8SuoAOtRf7Ddee
         UDs6sktFp8PlBVqHnuvM3X0TpUUb+u7QDtMAltG/GmWYcdOjAP3m8+16e9QfxxbenRDG
         pYErg7k4tRLIvcLDQmxWa2ZG2kzkMQv7QWWnoBiB2YzUsCkj2dGmiY4R9YMCgUVW7g1q
         E6a6iCrgbWQywqLKR5VmV4yqHCB/5sEiEsQWyxFY0vstjBDkyE3a4HZGnRlUuC8nfHb3
         GvCObQCIXWzzIiaGSxu9lt0pMdNnkDD5dq7wvdzAGDnH0QQWjHzqNq0s4E3/uI6xhsKp
         xvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760728065; x=1761332865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6AlkAll+OG6DFncv4Mizto8zaWsmmVbaRHf+nrpHgq8=;
        b=eLm0DalSg6wCxa7BnmyrFh6f76F1HG2xRn5PDUzNlixC1Tx07L9bfnjt8wz6LL1ssU
         yhkQZfFqOI6bLEW22rNKUeh8ixrNb3euHQkB7Skar+4bgDnZZP5YezcednYtorOGDZIG
         iRgii9xdygUvtt3MG5sSCPgJIFwsVeFnfVHjDLrSOsFvODv+eLDttE09OaEGsEBKHea6
         26BZi3eVRB0vzlADYv/4AClmsYUtALRaUuzt+vxG9xrha1yDalPruBR8qGog+LiDnP3r
         3/ll/DRj6BSrDaJWDF+d7lT5f5vCiL49yfdddijHhfdWF2Gti8JAdn8NnRwNCp3oZsvH
         Favw==
X-Forwarded-Encrypted: i=1; AJvYcCU2h7403WEpGpvIUmAcKUh7SmrfQge63BpCm/Wy9rQp7VvpED5/fABQ6AhZRRyK8nz60cjqkACh9g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwjW2QK33prmXJszkn2EIc7uLboxku1GDX3a35x3xJPdtgVkvMJ
	z90WcW/dNNmZqh2VPMin/mskOxSr4NY/UkwOLTNxiCzdEVC7INSmpH/1rwYXbepQ+gc=
X-Gm-Gg: ASbGncsgnANT6+XPghdV7def8mSFqrdpkWAaHbcfTxVPWkwnfZVL2m5brEInAmTtYAn
	9UQDgR6GkpGTAS7hNwQCCFUL6EQ495/1BMwiFVWwBtNG2UWTovXNcM810hdMIhcgdWrUZPz6uDU
	cK362Kswo9GXNvfYvsqbH68qZc4BeyT0CImBQPq/nfjFiyu+fkLrCQy0he3brkMNViWOlM5E/WY
	7ujBfTww2K+YcJ+SIybk5GAevIOvDPEElydsjqdFvx+Fn6tX2pMvUvm4jN2L6naTz6YBByWAmUD
	eiBCdpf+d+2uLnv43cTquXZsxLxzn+r1yTONEasDcIBwQ/j+QVpjNvvKOp1he6bMz9vU+1q7Ro1
	PdXNanZrDEtWDO7ajXMqNJmOGNvKgmyajsWWF9xeCmY3kYIPTB9rtN7rrVBTdCtQns7MuqzGBA3
	RZpVZpyA/4x76wvoa0frL0eaT9+DkS6MJbTN+v1WSGUxKspyyTMxjVKA==
X-Google-Smtp-Source: AGHT+IFcpf2h7+KbWg4DjQlVTU7Ya1aj204MdKeqW83UKVIYqzbU0vSTSCHA4r5eCSfPwXiiSMaLeQ==
X-Received: by 2002:a05:6e02:4510:b0:430:c77c:cc35 with SMTP id e9e14a558f8ab-430c77ccd47mr56314875ab.29.1760728064783;
        Fri, 17 Oct 2025 12:07:44 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9768b98sm153462173.46.2025.10.17.12.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 12:07:44 -0700 (PDT)
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
Subject: [PATCH v3 0/7] Introduce SpacemiT K1 PCIe phy and host controller
Date: Fri, 17 Oct 2025 14:07:32 -0500
Message-ID: <20251017190740.306780-1-elder@riscstar.com>
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
review of version 2.  Specific highlights are detailed below.

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pcie-v3

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

 .../bindings/pci/spacemit,k1-pcie-host.yaml   | 147 ++++
 .../bindings/phy/spacemit,k1-combo-phy.yaml   | 114 +++
 .../bindings/phy/spacemit,k1-pcie-phy.yaml    |  71 ++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  38 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  33 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 146 ++++
 drivers/pci/controller/dwc/Kconfig            |  10 +
 drivers/pci/controller/dwc/Makefile           |   1 +
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 311 ++++++++
 drivers/phy/Kconfig                           |  11 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-spacemit-k1-pcie.c            | 670 ++++++++++++++++++
 12 files changed, 1553 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-spacemit-k1.c
 create mode 100644 drivers/phy/phy-spacemit-k1-pcie.c


base-commit: 98ac9cc4b4452ed7e714eddc8c90ac4ae5da1a09
-- 
2.48.1

