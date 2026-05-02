Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30D43246F0
	for <spacemit@lists.linux.dev>; Sat,  2 May 2026 10:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777716825; cv=none; b=SNqBZUApF1by3ds+W881xcYtPyRBziEbp66zQykLB94shDLgKbMBq3caoN+TUTXP/RBbBRYT772klAtOsDjDO6ktsQpeyAZYc1nfW3It/7B2hE7tSVak3gJ89i7bBbXc1Mroyrm0IIY6wWeY2waYScXcxEZ2qj61pnNbZ/l9cco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777716825; c=relaxed/simple;
	bh=87vMfmom6x66nDjtyewbi4CA0Cs/yF1ou1YgZ/Fl0ew=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W2HWCH5sV40kmE+Ka5qtAo5yDEBQpxav47c+HZAkPtESho/s297kdTHma0vu62z9EZp1B7kAdYb6kgd3LoP5dupy/HlIgSHTYIwWo//RTNxWbEgv0L/fUfWeQ+5IKr/lXU1LHsNASB0NwlZUAvH80P70t3icHUDeZrI8vsq75Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYdfumO2; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYdfumO2"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-835399c11e0so31983b3a.0
        for <spacemit@lists.linux.dev>; Sat, 02 May 2026 03:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777716822; x=1778321622; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SJKp1v+dhpmw+gdo81yg2J+fP8PT0lbJ9HKJa2rNBWI=;
        b=OYdfumO2f1j0xieHhaXXkS/gYILf809HD+ACShm46pmo0/hTWI1kD5gW+nxjtKkpSe
         s6CoIHIktjVvItB3U6QxI4t03+LqnsTQc7Zdbhys7kkNg40P7ZPyLtuM9NnWHwVaKVfv
         j6g4bHiAlVWaQGTRu6aqkAEpG8j8X44aYY/n8x2kRwrG1Y2KI3BD7dfGqzJNlGQu0n4I
         BnAlaeQpAV/cI1bYPGe1kbkZB4WZwajA00t9g7j+0AaEAQmCxTqG/vC2E9vYo2mZ+hfN
         i2GTp6Jt86CUrMgq+N8k4p456YJ/tBGUn2BvAM0Fq7OfEP87t9OwW+zN4VqT4P78/hmF
         ZSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777716822; x=1778321622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJKp1v+dhpmw+gdo81yg2J+fP8PT0lbJ9HKJa2rNBWI=;
        b=FVCmdqm4NUG2sfqsPen/882SScumCqy3wapN7LPiKAL/709TgnYbxmBrE2dpa9ulkL
         tu3DcPrt4M2sfrcuxeA79BhllIS5uiWJSITjd6KUMa3DvCmyCiMx+KOEmbOy5sIXEKNz
         r/o1EH8Ecq6Cu515WidY2Clbr0piA2jWzhlzC5VCt6OvpmJUnQnj6+hrA47D0tSy99Lm
         9gabqo19Ho/pUDwgiKgjC8z+ROQ63CCarexEolCVPBqKYZfxGe3pv3LlvLf7HLixIcI8
         8tjkAuxQL8a5TY0NEQnXFZjrUrbYHKMyUopIH8/hSqpPX9ce2u9JOEOMmziOX7JOYHbQ
         HtNw==
X-Forwarded-Encrypted: i=1; AFNElJ+kVqw4pvY2mWK9S67040h+Gm6AhyANxcdB3VR8IJL1XznIfLEV/1YAhUOkotXa91kODV6qVmeEaA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8InfAuhuLdUh5qIcS5If4bdmyMXpn67H8LMoZbgglisWYy5YL
	4r9wlTN9PmwZnXyL7giriaAqD3jLqDKc5qwe34S/ZyhWaPW0otAHWQWa
X-Gm-Gg: AeBDieva+XZMXt8ozDFG12ZgtuMX80HLDSipIl3vvju67Bv8rTjIDU3IffypIGJSKsA
	vYYBgWt4x9gQdaI0DceCiwYPq1gh/cEeIYgIO5d7UVfRWjgA7ReuZOV3qCBEhI4CCXBmB1spo18
	wjDxc8aZNBo4EJFyuTNUqwZH4odVaoyEwQIYGLOIREuBk24wrgUu+s8OWOkIWZSE2bGeCUcTpgD
	UESGsyqxNLj5givmD9XDtvvPokbeTGb0t9GJnxJAGxMZYeXwqsVp/hxooaYdX6RMy74vx1uXVvp
	HXQQ0qutXzn+6TpBrOGIUmccn87VTa9l1Bn+L92yuGkhxN6+qf/eaASXik8RmSFz4FalCRvvX7n
	rjSMfq2WPW/cqlTJEU6UQTL9+5CiRgvIm+FInFRPObD5Qdi5RQl2YPBTcik2ZqVjzeoAG8DJd4h
	cxpoUSQ0yokNg/AbDYIyURukTe3eO/AsinQA==
X-Received: by 2002:a05:6a00:1405:b0:82c:dd31:b84a with SMTP id d2e1a72fcca58-8352d28c7d3mr2337323b3a.43.1777716821723;
        Sat, 02 May 2026 03:13:41 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-835158bc863sm4946839b3a.26.2026.05.02.03.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 03:13:41 -0700 (PDT)
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
	Alex Elder <elder@riscstar.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/5] riscv: spacemit: Add PCIe RC controller support for K3
Date: Sat,  2 May 2026 18:13:13 +0800
Message-ID: <20260502101319.2364052-1-inochiama@gmail.com>
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

Inochi Amaoto (5):
  PCI: spacemit-k1: Add device data support
  PCI: spacemit-k1: Add multiple phy handles support
  dt-bindings: PCI: snps,dw-pcie: Add msi-parent for msi handle check
  dt-bindings: pci: spacemit: Introduce Spacemit K3 PCIe host controller
  PCI: spacemit-k1: Add Spacemit K3 PCIe host controller support

 .../devicetree/bindings/pci/snps,dw-pcie.yaml |   7 +-
 .../bindings/pci/spacemit,k3-pcie-host.yaml   | 142 +++++++++
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 289 +++++++++++++++++-
 3 files changed, 428 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml

--
2.54.0

