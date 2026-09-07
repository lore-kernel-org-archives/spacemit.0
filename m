Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07304756BB
	for <spacemit@lists.linux.dev>; Mon,  7 Sep 2026 11:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780399; cv=none; b=qMNEAlh0vRbU7E6B95Knf6FV0gmuD20uUdeFYlHT91SCuMMGEjFEjK/j9Faw41rP9j2J8Q2O2X8vSppzP3a7K+kqzicjTH6X+rw6HLe5oat7az/+2qBzQrYVvsHUj3/CMn8ONdI1fe8P0YME8iRHf0eX0ZY/Yt0QANCYJJyjaeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780399; c=relaxed/simple;
	bh=5FeeOADUNbByjyhwFpHXMXOzMsToXCwZgtfQIgCGMQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rf0k6yTXSOQ81Oc06O/G5iacNnOzyNpWrmUQ5loDB9Z/NDmOi0TyYJlS75/JbT6yyWgK9r5I0VINfkZjYYkWMrwgkZesmn6sTXoT2rSlNg72LFDk6GztukzfmO1nMHJ/KVQE7Y/WKjsWw0UOZPd+TgRiO9v4s/msY7Kn2yVWfyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQ9Vqicb; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQ9Vqicb"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d71ae3455aso51185055ad.1
        for <spacemit@lists.linux.dev>; Mon, 07 Sep 2026 04:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788780397; x=1789385197; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oCIRpQj2OSAEKhN68oM/fFJ8TP8Qm5gHiN+49vtxncM=;
        b=lQ9VqicbqgXNd4qF2sVhxXN68+OeUJEmvTvPYri9y6vlcCO6c//VnVkbR1Ut6wFi/U
         uKwLGFc/A0KazaLeicMZhm+UeoeezHvsKe++hT+0snVnF0enAryb13Crp5zhWrO5hrki
         MPUgvlWtz3n9ZujJ7awPTGL4O8nP61kVUDHKnKJyClFyRAXz4vkZSP5TKo+5xnXoaxoM
         WWVj6eGz8PgsZM69CUQvKChBHPjUloY/2Mz0S/XaE4nzV1vJIa8D7N9HSfeR1SfljQyo
         C9jpx/ptyUtYZ5GkEVQWUBHhljG7pXSYEEbcKq0eoQ/C88aEoo/ijQXbKbjYX4n5/4X9
         n7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788780397; x=1789385197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oCIRpQj2OSAEKhN68oM/fFJ8TP8Qm5gHiN+49vtxncM=;
        b=Dp6AIzT5y6hOOT0Pb3CEv668wbWZoMGd9zM5yWNWoZcjQQewEp4s5V6kmc6QklH0du
         rN8S/mZu23WqTAaI57SYStcNQIDHCKiY0AZ0J16UZT4sl2CWEeQkunDCCzfX1xn4mZ1F
         zUrrG/PqNF6V9j9GnFgZjts9GkrRiMzKKysz7na6hKQtl/5QxwSeBxLX3xNPN4qEgDZC
         B3SYno1AvHklVxjVCPQNWBwnpQdtcI/SxnCs0RRwlJ/T5+5MkepIQpr6SbthKAcTA3Kq
         61eGotlL7mJh2euAVUX1/SzV37FIIJXXyXiEIU33WdvgCBxPU1ZlQVnGJoUzfYi22Bi+
         Ykgg==
X-Forwarded-Encrypted: i=1; AKwUvByDRgi5BXQJmQokUuA44J5zmQGmYGDyDS6GM3Lasanek917Szg8390UoubIbze8/owV+bIimoyKTA==@lists.linux.dev
X-Gm-Message-State: AFuF++kd2e804KXXLf4X93a+HSc7gZ3z1bed9St5dGmsisi8L9Ai90A0
	LlfiuyuBRLJX7eNv+UY15z9TCS9wx/1VFqtS687ABGit8H3Gx+vZlv9b
X-Gm-Gg: AYBFou2oSADBkOSz8S2OoqAbVv+2zb3V7vjRm7C4cTP1HLoh/lUac6oSMJhJE40uhHe
	aFF1L+aFi/T0YlTkCsRNVfWvs8TSh8GYt1MarPMf5w/KeZc7RRkrd4PVbaPB4KKwqdIBN1imop8
	YXAa5lg91iILhhtZEZgCVWa82brHvKBoCSEXma0C10NZ12PTwL2OnTtDZvkb83SAdXQicIibYDt
	jzO8+ogFhb3NxEiN8b+7IvrPinzOSC5zDjXUdPcjB5Hkm+Upm55c1i+f90wuJK9M9LTyVBvv0+8
	QgktRLl6wLnN/H5MM1KJAgbwRgvk4dF2LV4S0l26299VBzO4G1TvWGTyXa8jhq8d2KIEB0omWTC
	MXrqZSSljqU6cuXRq9mABqPjb0sIaVM9KCHpu4HGLV9nmDFLYR8pCYUpFkuVS6QkaHB6TmqKpmN
	lcEjUQzc4D7yEdZXzPiUaZt9Jzmy/bYa76ms7o
X-Received: by 2002:a17:90b:544b:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-39b261e3b72mr33475243a91.12.1788780396594;
        Mon, 07 Sep 2026 04:26:36 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ce4221sm31225121a91.14.2026.09.07.04.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:26:36 -0700 (PDT)
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
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alex Elder <elder@riscstar.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 0/6] riscv: spacemit: Add PCIe RC controller support for K3
Date: Mon,  7 Sep 2026 19:25:59 +0800
Message-ID: <20260907112606.465778-1-inochiama@gmail.com>
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
 .../bindings/pci/spacemit,k1-pcie-host.yaml   |  50 ++++-
 drivers/pci/controller/dwc/Kconfig            |   4 +-
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 210 ++++++++++++++++--
 4 files changed, 244 insertions(+), 27 deletions(-)

--
2.55.0

