Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B39A23D291
	for <spacemit@lists.linux.dev>; Thu,  9 Jul 2026 04:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783569682; cv=none; b=knFFAv5nZh4dt/pPjYVLPKCHijY5izN8wgGCkcwasMMPHbyrFtekFD3BNfYjZqDiwg73dDtP4lCvQBq6dJN7thPZGBJUkkGsNvv3BUh9+bsJRyyisXj46JUCPLba0nmPp7x6Ge86qcRU4O7IcJFAm0lLO4XTLLmqQZW3mubMZKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783569682; c=relaxed/simple;
	bh=iDi6eMAdavvHdiNKGxpAXcZmLMfTTt/P5T++UkYTMYY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jht71ltcptda4ZA30GhAB2+BpST4WkA69ESVTKI7+REmixNz6wcgKjDv3Khy1bj/uS85gGmEJARD5j/QysxM5W/xSLsGzEZ/3eyddG/7R5DzMoMP62swCuiFTH3uzfLxozvYMIz7XY1NSQyAFnKBx73nokKeJLiEHQ0AbbJaOJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0uC1+C6; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0uC1+C6"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84861fc51a5so14399b3a.0
        for <spacemit@lists.linux.dev>; Wed, 08 Jul 2026 21:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783569680; x=1784174480; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cvLv9XK6KjcJ7sFC5wHJkjs3i5/edN/xpBE+mpYwY4k=;
        b=P0uC1+C6oWrzwU/Y798eOODMNuhIHtWTXWC/A7lXT/McCxThfYXgVudbnIokyO81Cj
         IldGkXwC5SGI0y23vYQe55Q7Nm5/NaGJVPNh8GtdOaT38F8CJJOiqHCQPQPzrH4g32AA
         x2MREZr4lSqgvpMgtp9jFv+n5d++/M2vLmFwTSghSVa4PlYaD0rvSkQ27+/4f3tLwSBQ
         7qRkG5KlRafuVRQiuEnHuHnBl/IHaDLFFE3f6dZBcSRYv6uh8QuPrkuFgSa2y3xipo8q
         UMlhxkNCe839CEFqNCDQ0lywshmhnFg/q9b2+56CWT4p+vCFuuarlw8FcFdZ1ix9XrQK
         FkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783569680; x=1784174480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cvLv9XK6KjcJ7sFC5wHJkjs3i5/edN/xpBE+mpYwY4k=;
        b=ObIv63uRmhdLT4As2Aju8paxDRVJbgux9/q6+sREhaTrihsxBkgR1MCEYIvlWSJfK9
         V42frNaQi++sR4iQge0Bd5ZqWvRfPd6XwlRMs7s9KSq+u9EdbUcjzFdceM3mHWn+HJTh
         DvyrCpNvo6PHM7fAiDxjbTecQebu5D/FkcBNukU69XCGQ+m40RTZls9z+n775CwVN4nX
         YXjWbEtSpHI8fS0fVEl/E43yWS8jZLY2xWXyLDzQiGqKQ5SThAvGmKG/rghUFIsQ9Gmn
         DIdpJ+9qcpNrmiLUVklaZwfNPdnbF4Xs4kFG4l+DTQlZMb2V0CigHaIGGcaiUs9UbIZu
         9bfQ==
X-Forwarded-Encrypted: i=1; AHgh+RpczAsE5SsnLOyH/JTfaIJfrvTZ6R5L03Bw3Dm9SoS6RIX+T13kQXxncrGwLghMVIY6ALKamS8sIA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmGvMk7nid3O/aXK2FypvUJpuheuEz9CGPLZEyP/36DwQ2gAW6
	A8aPtCQNq7MBgqtME6FE7+OTfvmWarppCxwzEfzdVxHsPgA+jbOScPvG
X-Gm-Gg: AfdE7clNAZhf92C3VelpCeecjV20gcU/NP9NWSe2xWDrvZIRTFJoH1rCqe/JIvoe256
	TmDd4KeOu63H3eJ0XHfKlruuvaPztCb2/IRFpOkmCybJ2NKEutOy4LCYmVis0z5FfD7QRFk+Dao
	NbQu0OwHnUk4W+jiZcIugJYmmmMnlRzpcqdbU8V7Wtmkq9/N4dU0p42Ipqjn0ydoFCp2IE9F3R0
	tFzpOc7iJ7tnJtFAFrp92wNeRFXKMjunl76EZtQlQboEIULeThTpXon4y+TiWK0SdG9H9oNP32z
	VNsiBMSv+MfsWTV/Oz5zsQnr3AQx1vFe+jjsym8W+YLVSaIlOivrLkLY8grw5KEinv2V0KEF2q+
	WC7SjK6SAryAflQ1mmdnoxCKuvhmVNFzvLAOk8lLcpi1tTbZDnv4FtrnlkXo/h055
X-Received: by 2002:a05:6a00:4405:b0:848:2f74:d8d9 with SMTP id d2e1a72fcca58-84843004857mr5364669b3a.74.1783569680457;
        Wed, 08 Jul 2026 21:01:20 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b9a832sm7919258b3a.18.2026.07.08.21.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:01:19 -0700 (PDT)
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
	Nam Cao <namcao@linutronix.de>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
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
Subject: [PATCH v4 0/6] riscv: spacemit: Add PCIe RC controller support for K3
Date: Thu,  9 Jul 2026 12:00:20 +0800
Message-ID: <20260709040027.958400-1-inochiama@gmail.com>
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
 .../bindings/pci/spacemit,k1-pcie-host.yaml   |  50 +++-
 drivers/pci/controller/dwc/Kconfig            |   4 +-
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 237 ++++++++++++++++--
 4 files changed, 271 insertions(+), 27 deletions(-)

--
2.55.0

