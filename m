Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387A3223DE7
	for <spacemit@lists.linux.dev>; Fri, 22 Aug 2025 03:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755831999; cv=none; b=XSA28ogxdHtZvlddV/fdZmC/I8Sr/X3LmsUE74oaJRwJkypTiIwO1tPb/Chqeh/dA5ukkcQF/LxQQo8Jxqk24n5C1TIfR4hJQ4CD2+He1mBRMwTPivkTAsb0nCRtk5lAcerc8+Qk41Qc+VpUbyaij7E4/JcgaZy8OEt0lHAgy7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755831999; c=relaxed/simple;
	bh=u7ekXjXJSlgmx+6qpcTRyF94IIALvz34gD+ScB8tY3k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PTOoJglcJA/eSnu4utPXFpbFJFMu6wuQNvllgpHLr0j3eKD6uPggyjCKNzmvu5jvZBNUaQASqYUiR0/Pw2uMxUfuuDO7lJULFXL4MjUQG0nfMtvPgIbuFKn1u3b/um3Y0hrzTeqie22gNKqY7kBnfUJuDHV7g2tom7pcvuFyAac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=djn1umKD; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="djn1umKD"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-325195d1b1bso334470a91.2
        for <spacemit@lists.linux.dev>; Thu, 21 Aug 2025 20:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755831996; x=1756436796; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J6APY0iTgruqzu+Xt1WmIhK4gL27PQZoo5QbMl/JJBQ=;
        b=djn1umKDfnHCziIJGRgnHElEJMhq82ryBw4DmAquakQi1MSI1yvL4NGD24QZUUpxWD
         es2fzvtzxsY8I9rYwqkIJGuL+dmPTQWYbDmi83VLYGdsy5ZAeSwkpuIEVNn18JnpZEyk
         7mDW9hpCbb4KfH3t/TCLDDNdDL7TirZYg3sKoasqszMV/pDGYE+fWAp4HdwM5Ejya6lR
         G3rnJJMHfQ0rPFo1O0aBUZQI1RY95k5JBwJ/M8vetldu2MNj3zCt0nIYEXcryOXCy+74
         q6NtBLNeOnkKTe5V5WdylelU+QWMjHQbFK0f/XTdkO0j+C/s/g80M2NEA6n1uIJPZhc6
         Pb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755831996; x=1756436796;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J6APY0iTgruqzu+Xt1WmIhK4gL27PQZoo5QbMl/JJBQ=;
        b=FZYvsGI/aFOHjpmtk9rCY5F9o0hg0mTxQnE3R2exKBXJs0p7x1s/91G2bxbxxSkrCk
         dA1wReMeNWSQWDb92qp2uBe+qffOd1FjfZN1OFpUrgDPQSPuydexXaoARNF9EgYDTcC2
         NrknoZDuCKuQ2Js9mTYAuGW0oEtASze615Aq1plSO0URV8vI0CXnd6OI3T47s4P/T4c3
         +l+tQnT3uM7OMbuDsyh3MRq8j6loH2GN9pgwQbU6K2r42cXwL6o1g4B67lRfAZ5LC3pW
         hev9E4yJrwS8j2D2RF5UMpawsEeCHAX8t1lKZZsyl8HTvS6jb9F3Ja7h1mlZidcuifTK
         0vaw==
X-Forwarded-Encrypted: i=1; AJvYcCXSCpdsJBgiaaeNzHpz5eSOyn/nbkntMGMUjM5+fYuP7Kiu6W2kiWopeATevy329dOyIY/kJf0leA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxWhMfVaOzelgT2Sqi1K90Z7mKJS82uCvPbwMxO8Z4zX8oq613u
	d9JlXYn+vy9XCvXgjYzdmH0FJOkq6LyHmkMpfGdrIkcy9bXlRw7SJWAhPEvsXS5jXY0=
X-Gm-Gg: ASbGncsh8hTQRybbNqfaNxvY1svV7lxYqtSXAM+LvqDnQLYQYKIpirREivA7/MsKhl8
	W97r3ivi95lJy3I4ACLZ5qr4HsdV4iwIAM7z5Ueji1K8gyBE50V8Kc3fH7tKWvNI1mZyrgQqJNv
	JrUY335UhFJYNqk/sTZwTOXpFFLxPMscnqr4oJE5FsF7JRPZPVeUDrgKlIcCnHiFz/vyfWuGdtU
	nY4nOlKm4TcBrut7IPzwkqaYFCH+KzcdIqdOVxvb/byYTl/lnqFPS8jgIOKpChnzCLJhMnH6mZq
	zvqDlJFmNXZFa2uYS50CbiF1ioU3iPj0mJvh87VapfafJhtgPEE7x6P98ADry5+ekzyG6SpEz13
	qQNnzMH3kDWTvvCvq1K/Rr/LkpILCG0t3Y9tl9VQ+wteq
X-Google-Smtp-Source: AGHT+IGbrksi9Vl6DjeeywwPEHNBqOc6j8/i0ukCMTc/yG+kfQptCBbBbJ0xlFQr6PjQHtWsRfWM3Q==
X-Received: by 2002:a17:90b:17c6:b0:31e:beae:2934 with SMTP id 98e67ed59e1d1-32517749976mr2112592a91.18.1755831996181;
        Thu, 21 Aug 2025 20:06:36 -0700 (PDT)
Received: from [127.0.1.1] ([222.71.237.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47769afc1bsm2756777a12.19.2025.08.21.20.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:06:35 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v5 0/8] dmaengine: mmp_pdma: Add SpacemiT K1 SoC support
 with 64-bit addressing
Date: Fri, 22 Aug 2025 11:06:26 +0800
Message-Id: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALLep2gC/32P3WrEIBBGXyV4XRdHoya56nuUJRh/slISt5q6L
 UvevSZ70aWEwtx8A3PON3eUbPQ2oa66o2izTz7MJfCXCumLmkeLvSkZUUI5kQTwLcR3P4+9mVS
 /LfpMsTRUO06EUkaicnmN1vmvnfp2fuRoPz4LfHks0aCSxTpMk1+6KosTSBw1Rc/WrtqdAgAXb
 fRJZ2ys02F2fsTStcRJZmjDTJcBbZqLT0uI3/svme6ef2uXIVgNwtoWJBgqXjdLWlQ8lWo7MrM
 nDNTHGFYwzUAc10YCb/kBpv7FNMCPMXXBCAo13yopRv5g1nX9Aau66n6uAQAA
X-Change-ID: 20250701-working_dma_0701_v2-7d2cf506aad7
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, duje@dujemihanovic.xyz
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: b4 0.14.2

This patchset adds support for SpacemiT K1 PDMA controller to the existing
mmp_pdma driver. The K1 PDMA controller is compatible with Marvell MMP PDMA
but extends it with 64-bit addressing capabilities through LPAE (Long
Physical Address Extension) bit and higher 32-bit address registers (DDADRH,
DSADRH and DTADRH).

In v5, two smatch warnings reported by kernel test bot and Dan Carpenter were
fixed.

The patchset has been tested on BananaPi F3 board.

This patchset is based on v6.17-rc2, with patch 8 (defconfig) depending on:
 - riscv: defconfig: run savedefconfig to reorder it
Link: https://lore.kernel.org/all/20250611-01-riscv-defconfig-v1-1-b48fc3517498@gentoo.org/

All of these patches are available here:
https://github.com/docularxu/linux/tree/working_dma_0819

Changes in v5:
- Rebased to v6.17-rc2.
- Two variable dereference issues are fixed in patch 4.

Link to v4:
https://lore.kernel.org/r/20250815-working_dma_0701_v2-v4-0-62145ab6ea30@riscstar.com

Changes in v4:
- Rebased to v6.17-rc1.
- Updated commit messages in patch 2 and 3.
- Renamed the node from pdma0 to pdma.
- Put "interrupts" after "clocks" and "resets"

Link to v3:
https://lore.kernel.org/r/20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com

Changes in v3:
- Created separated yaml binding for Spacemit K1 PDMA controller
- Updated pdma0 node properties according to the new yaml binding
- Put pdma0 node in k1.dtsi according to its device address
- Put pdma0 node in board dts files according to alphabetic order

Link to v2:
https://lore.kernel.org/r/20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com

Changes in v2:
- Tag the series as "damengine".
- Used more specific compatible string "spacemit,k1-pdma"
- Enhanced DT bindings with conditional constraints:
   - clocks/resets properties only required for SpacemiT K1
   - #dma-cells set to 2 for marvell,pdma-1.0 and spacemit,k1-pdma
   - #dma-cells set to 1 for other variants
- Split mmp_pdma driver changes per maintainer feedback:
   - First patch (4/8) adds ops abstraction layer and 32-bit support
   - Second patch (5/8) adds K1-specific 64-bit support
- Merged Kconfig changes into the dmaengine: mmp_pdma driver patch (5/8)
- Enabled pdma0 on both BPI-F3 and Milk-V Jupiter

Link to v1:
https://lore.kernel.org/all/20250611125723.181711-1-guodong@riscstar.com/

Signed-off-by: Guodong Xu <guodong@riscstar.com>
Tested-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Guodong Xu (8):
      dt-bindings: dma: Add SpacemiT K1 PDMA controller
      dmaengine: mmp_pdma: Add clock support
      dmaengine: mmp_pdma: Add reset controller support
      dmaengine: mmp_pdma: Add operations structure for controller abstraction
      dmaengine: mmp_pdma: Add SpacemiT K1 PDMA support with 64-bit addressing
      riscv: dts: spacemit: Add PDMA node for K1 SoC
      riscv: dts: spacemit: Enable PDMA on Banana Pi F3 and Milkv Jupiter
      riscv: defconfig: Enable MMP_PDMA support for SpacemiT K1 SoC

 .../devicetree/bindings/dma/spacemit,k1-pdma.yaml  |  68 +++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |   4 +
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts  |   4 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  11 +
 arch/riscv/configs/defconfig                       |   1 +
 drivers/dma/Kconfig                                |   2 +-
 drivers/dma/mmp_pdma.c                             | 289 ++++++++++++++++++---
 7 files changed, 343 insertions(+), 36 deletions(-)
---
base-commit: f3c5631f70e434e318c44001e2417d4770f06cd0
change-id: 20250701-working_dma_0701_v2-7d2cf506aad7
prerequisite-change-id: 20250611-01-riscv-defconfig-7f90f73d283d:v1
prerequisite-patch-id: 53bda77e089023a09152a7d5403e1a738355c5d3

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>

