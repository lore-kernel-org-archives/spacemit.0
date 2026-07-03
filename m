Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31781CEAC2
	for <spacemit@lists.linux.dev>; Fri,  3 Jul 2026 02:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783044042; cv=none; b=D3N1NcH41wmaFlA6+vzAMaRzJrxEcbFeeSv5SIGLl+78ASk36m773y4SfPAKdT69+wgOVUDJLeNY49aAG2KFLgW9EFveF1LwW3D0WY5n7k15br9N0DFxB5+CoLCst1Yk3lxFpZCvPB4xJWspMiRqqL814emwlanfiZWJPVyscFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783044042; c=relaxed/simple;
	bh=niEyCQbf2rXsKZ46imneBwDxi19Sy4NSRG4HtEFHO7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UPdWBUdzP0w5/rkXiXRaWS9TbNfgCDeVOdWDQLYh7v3YG0JUQLUv4vAkwLqT+7VsS/k+ch2nxr2u02b9Vj2LFwdGnCOFECxG5n7rQ7dccrF9a+3av8eLhQUje3ZjyR6J7/wJmBg5BGXsufmPJT+LQkVYPQoNrenog1WdWVMNWps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GsxGmhZx; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GsxGmhZx"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c88973b6965so964448a12.1
        for <spacemit@lists.linux.dev>; Thu, 02 Jul 2026 19:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783044039; x=1783648839; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ngIdo3QRj8SJ2wejaOldu+l1ZMsTWJa1beGhYYg+kyE=;
        b=GsxGmhZx1MHtHk41I/SLUudu5R46/xC/Gl99FJ/QTLABBtXxrVuU115Z/MrCRl2SQ9
         E1EVEBNjKjeS3JY3DQnh8oLuH2J2coaSoeWxiCGwLD39VutbyizwcCdm7w7XKtIDBeyz
         u8cT8aDltwp857TfQGFnaN+6T5WdttwhDNmixw/84K2QOkwABvH+fDgQvSSqk8cxmwQe
         cB+Cl6O/IxHs0g1LlhjdSm0o6ZEBXE8wH+9/rgI0zI5C/YSe2yIyx0u7dbyXLoYcWNSD
         ZOITewuBGsg4v6A5yFrptIrUdaS6SryEVPCFqWTlojWH3VcIScPiEh0FTP8pvQfhmmeo
         ErvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783044039; x=1783648839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngIdo3QRj8SJ2wejaOldu+l1ZMsTWJa1beGhYYg+kyE=;
        b=Kwuts07MBMeZpKuO2OUbhzfkZ+uYZRg2ZopoMVS/oRCLo3QODMH5PXvw3+KHs4iLEN
         2riQCbyQWRTr/XQSbXjv1cH1Fz2PsXjfUk8t7jQAKHkEz6BHuIVRU+/JsFUjDBFqMjwZ
         zhl2ByF9vAyiIjs6FZ2po76QCz/+WxqI345bLyoau7FL/uSACMXdVW1+snc9H2WsXa/x
         45lnK6FsuCc5U+EsALL2fRIIL6Jag1Khu0PlDPT4d9ujRQBxIIfb/c26PIxjOTqg3QSH
         pHnVb7jOyeLZA5JjonyyVwhTqJegNT9dEoFlUDcngS92fTTIf3vHKO+jI8C3uiIuWpi1
         38NA==
X-Forwarded-Encrypted: i=1; AFNElJ83WbwZAHlk7whGiZ72dxMt36xhd3vw888C0GMWxyAZdqYMIDY+FDpuC1qx39hQqH6qtvVAWfuk8Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzvPX87mOlNrNMNzAkZEZAOIWDh0shVzzYvhehXFSWVyo0eKAaa
	KWWdZ2SOVzMdNLPKtK6xh2d5q49OgqiJU03tXtv1LNTX3ywHTErGvKnO
X-Gm-Gg: AfdE7cn1xiiZKv/p9ZcWypFDO2Lv0Pt/EI/vFHKK6tM8sL4RCEjKaCLsro+PVCDwgEI
	+M/ctV+ywh1v7xANarmi86mAn9EOQrtgwNmgAunFh/jQ7Djc5CyA0g/bdrRGOq9uyxk131PMvyz
	EOnAvE25kGD2NqXIcfmrxSbTeo4XqKkkbkhQSY/cK9pXbTlcSOaljW4ffUJtFLah4Cy/BkZHl6E
	WVjzzxxcdYPxqh3r+Zuqawuhng6Nyunmj40bsqYmR4ILb0b6IgqgoBHvxHfOZEpMbfKFXXCSU4F
	X34FQkrzhWNSM+ahJFXxyBUoK4nVaUPbdCxZKgNn8L7F8fu+KnnTr/FiRvNX/zP7e70fk7GC8lZ
	YClLZ9Am6hOMUqXvD8OUMzwq5ia3qWxsaDKzzJWk2AJEGMImWETEBg/CIBZVLwFrs0YP0sokFeR
	z4cL5AP1XE0mk=
X-Received: by 2002:a05:6a21:7a9b:b0:3b4:731e:6fad with SMTP id adf61e73a8af0-3c01c6d75c9mr2593383637.16.1783044039066;
        Thu, 02 Jul 2026 19:00:39 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb10638sm1905295a12.2.2026.07.02.19.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 19:00:38 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Randolph Lin <randolph@andestech.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 0/6] riscv: spacemit: Add PCIe RC controller support for K3
Date: Fri,  3 Jul 2026 09:59:56 +0800
Message-ID: <20260703020003.485436-1-inochiama@gmail.com>
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
 .../bindings/pci/spacemit,k1-pcie-host.yaml   |  46 +++-
 drivers/pci/controller/dwc/Kconfig            |   4 +-
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 237 ++++++++++++++++--
 4 files changed, 267 insertions(+), 27 deletions(-)

--
2.55.0

