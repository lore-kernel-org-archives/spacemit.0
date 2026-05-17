Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F0223507B
	for <spacemit@lists.linux.dev>; Sun, 17 May 2026 01:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778982557; cv=none; b=U5PjGrUoXNCHDzCUAbZBV345Nu7CJXDtUDEF1mSa4RE9PLtmS9urVvjiZj3gkLWBpIY/HxOU91E5spwxCRKiGT6f7gsJvCrmiNXFbniJBum9P6QFDUc7z1cTtMDWSHKqyhiRmcObRpzDBN1qhVe5oeV2MDD2dw7OAtjjYmoW884=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778982557; c=relaxed/simple;
	bh=VFz+7WbS8QqpbMzmZlj/7iUhU7PPWjD/yohdUY5kCG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rO4jorgFmjDw756oUqMTJkJHJal7XD2X1MgLFSMIuBXU/ocl8JDQlwI+hZAgbtejfChau25o6RaZWn40BpXQDewTZqW0I5A1ItnpXwFQkcW0D2sa0HqQnrO1EiX0ou3FW59qeA4b5tHvX127at6OMHvq8Qf6yBW5yVPuRmtn8QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N6deqjqu; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N6deqjqu"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3665a90bcd3so1079718a91.1
        for <spacemit@lists.linux.dev>; Sat, 16 May 2026 18:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778982555; x=1779587355; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n7RsZByyP81xsWgXZpteSqn5b3NI0aEqfKSesYIzFiI=;
        b=N6deqjqutZIZjLprwfOiNEVE1+xKY1xeZ5/8e7NoivZHB7q5r4kc+QTIWREsWVtCXM
         1s03jiCDBFPG+9VPdwNWzBgi0fHXnYlBVhcKfKHLqBXfYLpcUnAMq/eQ2xTyN+hYB+KM
         z/zzYn5hEZHnZ+S4+IeNHYR6MP/ei+4JspHlo8CRseg52kO0nCcAXJxX5SXQFGgaw6xp
         ovbqzDKB3D63Is7vDv5BuS//ux3UbquYKfYvcFrGHGxItrbKgWXcMoTRnXRhO56jNvtX
         s6RP1YD+lnmf3HNqdpWdPxDA/LayzSOfHxZBwyRxbPnqkrRxdEaL6COjsKUKYsF+3mOI
         9hKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778982555; x=1779587355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7RsZByyP81xsWgXZpteSqn5b3NI0aEqfKSesYIzFiI=;
        b=f/28k5p62ALWnG792nf824eh5Z4oEA5R2DGKGyuZN/7mYt5ClazuSiYUl5s8tVkdYk
         9W3CuOuVrCfBubySzDzwS3ZAeRGhaOMgUNW8ok3IIxn3Jb4MDK016g5XZWul+ReB0CNT
         zz029DyGM6UOpn4tVtUvAzV3VPoNeNpBFyGTti1zXfrWx4pEfNYt3qeBIL+0xkQBijnU
         ErHThC5IIW3Xu0DyKyUy86Bat/WeJ32IqztxSGNqVXTK7k5Qozo0z6HvX9o5NK9AglqE
         DINZMbU1U4HLzExiTxQb7MjqIWXszksa1+NNOzFIdFpYQy+cTBNGfLFDr+6vTQZ3a215
         Hx5A==
X-Forwarded-Encrypted: i=1; AFNElJ+J8yqJ0S611XCofIPqD3XPn1sEuenCwQL7r35vF9VY2GYYPnfNmqdB3jyoebENZc0CHU8aMB6aRQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxWvKK0kCHDIuBpS7Y1ikUzHWfNgfRP0/NZlpirD2b2nKBpfoZ+
	p4LKNefP3JMVmR2E0Di3hp0QPEP9ERb3dQtP0mkW95+BoIw1xug3YFG4
X-Gm-Gg: Acq92OFh60JN7DsR2p5DnVasDjJQ/rpqqWrnijYulp2r1z+1xeQAI6WWaiAxKjFMgnx
	DWxn+w9l3CMqxBz5djOo+W0++q077rwNpQJTHiwlMbqK1axXmSRlvIh3dDvwQz5CroXwAe/rIti
	UB4ZrteZZ79A8KguI/qlvLJPR1XlLmcmBp/Wf/RiUUHsjS42hRYQ6rvpq3xYfP/iJw1X9z8wH2y
	N/WTEn0uxbWghXFzl/k6KNfN8qybiMTxwzTB4doq0p7fFgoSTsdRv5dNYTnXUnhQMvhOD3sLcpx
	Zj7ivEqrOEpO++NpgdSBr/ffHjuIKP5iDwXpt2pLZNj+4ixar4EkWdXjYxO/rkgX+u0KizbB+sY
	b3SKU7dcuhR+EI49Su7CECYVAepwMc/V6HMYmuOyP0dEh2e7qKjMQILm+qyAr826ZoSr/qzwGXn
	TAsSELzSb9fxfuJfBVR83O2x3295hz2ZjonA==
X-Received: by 2002:a17:90a:f10:b0:369:7b04:49d1 with SMTP id 98e67ed59e1d1-3697b044e5dmr2192326a91.1.1778982555040;
        Sat, 16 May 2026 18:49:15 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695155b2c4sm6861899a91.3.2026.05.16.18.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 18:49:14 -0700 (PDT)
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
	Inochi Amaoto <inochiama@gmail.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Alex Elder <elder@riscstar.com>,
	Nam Cao <namcao@linutronix.de>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Randolph Lin <randolph@andestech.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/5] riscv: spacemit: Add PCIe RC controller support for K3
Date: Sun, 17 May 2026 09:48:35 +0800
Message-ID: <20260517014841.254085-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Inochi Amaoto (5):
  PCI: spacemit-k1: Add device data support
  PCI: spacemit-k1: Add multiple PHY handles support
  dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
  dt-bindings: PCI: spacemit: Introduce Spacemit K3 PCIe host controller
  PCI: spacemit-k1: Add Spacemit K3 PCIe host controller support

 .../devicetree/bindings/pci/snps,dw-pcie.yaml |   7 +-
 .../bindings/pci/spacemit,k3-pcie-host.yaml   | 135 +++++++++++
 drivers/pci/controller/dwc/Kconfig            |   4 +-
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 210 +++++++++++++++++-
 4 files changed, 344 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml

--
2.54.0

