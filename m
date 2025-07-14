Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77191D63E6
	for <spacemit@lists.linux.dev>; Mon, 14 Jul 2025 09:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752486016; cv=none; b=BaRvM2fsJX+en+Xqo9NC2TtX8kWNyPCqh23N2raJon83sC7ARt5aGQqmqtGXFzs4aKH0xfO9h7rKsSz0lfSmHV9gH3S//rO2FkzR5OSMK55cuCM4txleidFZ1+WefwfFGA0VJ6l1kq+Un5nEchyW3Rd2+kO03zyjTa71WTGAeNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752486016; c=relaxed/simple;
	bh=O4w3Ehn7wPYZ4PXDL2LCv0D87qdMNkqeuamD43rkcEU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M3h4bW9ZB3VaQyUhAk/92Lsi7fTG8RE1SnnomgKjyIEgFXPHJw8gSXjOUSTLwNIOnM7sbKH1TH12Ke4qNGJz5raMo0l1DB4qClDzhSySy/O8nliyGdLBlNEKUdJuTfmfqTgFbHvHHIwOcCNpfJc9ER2NKx/Sl6oXnLjwcdp+rwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=HJuaVTVx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="HJuaVTVx"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-456108bf94bso7670015e9.0
        for <spacemit@lists.linux.dev>; Mon, 14 Jul 2025 02:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752486013; x=1753090813; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NW/McQJ6Sd6lpl1yvr5wt77YD+qYB1cLv1xJk7Xbx/U=;
        b=HJuaVTVxdewc0eeblfZdQz8Arr4D1RVhy7EC2v4oi6qJ9rLaf4gDJI4/X7HbJw435o
         T3kD8zg97djhcOCi9my4I6Do0co46pUGh3p9YIPZx2S/lYqb3v4CpFApmKY1xHwaQHf4
         e8E4qknHtirU1DT/iOPkT0YwHC0+pE8TLi/lP56p1wQKVoMIyK/zoGLSKwQQatu0YUF4
         9eW+zDnMZpdnJhA1UCeBdzQuYcU7nanOq9upWeTMDMMzEQivmdsnF4oDxy6J9tA585m/
         n5D9PoXnwPSBq1soC/ZtOntiKO9lLGiGAyQrMtTv4cCc0NzvJh+1laOEq0gyUilTU4v4
         7QYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752486013; x=1753090813;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NW/McQJ6Sd6lpl1yvr5wt77YD+qYB1cLv1xJk7Xbx/U=;
        b=kcsVfX8Y3kv7dPmIpfx7/puNPLnRu+W+YaVJxgRTpTbddZQQqjmg4E4/kQ9dYwUmRV
         KztIDwVh2C1ri3V1JPzFa1F2BUTrBx0LSk1igovj4VgRJJuEs8afihA0ynz9MnrF/q8I
         W5FungbJQ2VilWObfsY6t4LJpLMpqd7J7PqRlKXikKgBsdPd2tv6M835XJflElAYSqMi
         piFk9BgZh1QukK0Lz1R5MekKgEf2jsDLrpVL/WRAotjXlIfzoSPr3rZxgDE0pLp5yp2k
         7PodIte4cPy/AcbLxxxESGK5zM1PKKP9fh84cfx/XocWgfWgvg20o07sKx5AbnMjfS1x
         FlSg==
X-Forwarded-Encrypted: i=1; AJvYcCW+w4EfhxFXZP62N5qGSW6JN/YXhXC4PNrAHPOJ/ndyMOVumTO6VAOW1ND09d52I+/0LyP6s39jnw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGxzWJYssIHay4kWS5RyxvoiFr35IvcKAT2efXvWhgz9QIf5g6
	ndZPQTaWRHkSEt3ZTqx9aSOMqu7AqpH9ZilOX5xV7Dtz5V1encr+dAfFOgKDthacoq0=
X-Gm-Gg: ASbGncug9Dy8s8XblcqwaDBeJkMQbW2z+IYV9jdIqpILx5phkOWYKmsqJalP+HVo0DU
	pR279pas0pu6kT03eJFTkyH+GzBZHgZ0ARmTlYulV8N3Vs+EFaDNBaj9/R4RwklKxD5iM8AXgtO
	75meavbBN93gWFFUI9I98nBji6LkVqjUL4QJ0AnAOMpbBI81KBlsyYt8OL0klu9Zt78exNcN5Qx
	IYl30WLKcbVr22lq3nFDEEduRLaF3qNykIKLyGNI3Zx/LTfKfSDIzcbfsDtmQVHZRzU6wUVLmc1
	fkbWvkJP484vRkFxYOrkXFmpCR2lBOD/NfeU60efeX4Kwy2IntquXUe+YD+ICy6Ioc6HDfyHgw=
	=
X-Google-Smtp-Source: AGHT+IHsiHi2b9XLYJ9fg0Rc9OaPeZG511Kxf8f41m3lSbmqbwnEUrPybpGRc4WW5jMeqOb06dRxYg==
X-Received: by 2002:a05:600c:1c8f:b0:456:2212:46b8 with SMTP id 5b1f17b1804b1-45622124965mr5783115e9.28.1752486013224;
        Mon, 14 Jul 2025 02:40:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a09:0:1:2::3035])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4561b25a948sm24989035e9.35.2025.07.14.02.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 02:40:12 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v3 0/8] dmaengine: mmp_pdma: Add SpacemiT K1 SoC support
 with 64-bit addressing
Date: Mon, 14 Jul 2025 17:39:27 +0800
Message-Id: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE/QdGgC/32Qz24CIRDGX4VwLhVYBeXU9AV66a0xZoBhl1hZC
 7i1Mb572fXSU5M5zDd/vslvbrRgjlioITeacYoljqmJ7olQN0DqkUXfNJVcbrjmgn2P+RhTf/A
 nOMyFwySZ9tKFDVcAXtO2ec4Y4nVx/dg/dMavSzOvjyJ9hYKevSVD3g3pYyVDrediVquWDxf77
 MbTqpzB4SlWNovPmC5XEsbMEl7rfMQ2i7nVJgxRFjVsQKstQHCWay+0tl4Cdgrsdo1r5OA80r9
 chixUSgjWwHIsbmIegxtTiD3TYceD7rzcdt5Mgs4gQyx1zD/Ltya5kPz7mBacgVWIO6GFl+plv
 lIq5JmQ7u/3+y8XDclTggEAAA==
X-Change-ID: 20250701-working_dma_0701_v2-7d2cf506aad7
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

This patchset adds support for SpacemiT K1 PDMA controller to the existing
mmp_pdma driver. The K1 PDMA controller is compatible with Marvell MMP PDMA
but extends it with 64-bit addressing capabilities through LPAE (Long
Physical Address Extension) bit and higher 32-bit address registers (DDADRH,
DSADRH and DTADRH).

In v3, the major change is creating a separate yaml binding schema for
SpacemiT K1 PDMA, per Krzysztof's suggestion. By doing this, the binding
schema got simplified a lot. Deprecated property (ie. #dma-channels) and
unused values for backward compatibility (#dma-cells const 2) can be
removed.

Other changes involve placing pdma0 node in k1.dtsi and in board specific
dts files with proper ordering.

The patchset has been tested on BananaPi F3 board.

This patchset is based on SpacemiT linux (for-next) [1] with Patch 8
depending on:
- riscv: defconfig: run savedefconfig to reorder it
    It has been merged into riscv/linux.git (for-next)
    Link: https://git.kernel.org/riscv/c/d958097bdf88

[1] https://github.com/spacemit-com/linux.git (for-next)

All of these patches are available here:
https://github.com/docularxu/linux/tree/working_dma_0714_v3

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
---
Guodong Xu (8):
      dt-bindings: dma: Add SpacemiT K1 PDMA controller
      dmaengine: mmp_pdma: Add optional clock support
      dmaengine: mmp_pdma: Add optional reset controller support
      dmaengine: mmp_pdma: Add operations structure for controller abstraction
      dmaengine: mmp_pdma: Add SpacemiT K1 PDMA support with 64-bit addressing
      riscv: dts: spacemit: Add PDMA0 node for K1 SoC
      riscv: dts: spacemit: Enable PDMA0 on Banana Pi F3 and Milkv Jupiter
      riscv: defconfig: Enable MMP_PDMA support for SpacemiT K1 SoC

 .../devicetree/bindings/dma/spacemit,k1-pdma.yaml  |  68 +++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |   4 +
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts  |   4 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  11 +
 arch/riscv/configs/defconfig                       |   1 +
 drivers/dma/Kconfig                                |   2 +-
 drivers/dma/mmp_pdma.c                             | 281 ++++++++++++++++++---
 7 files changed, 339 insertions(+), 32 deletions(-)
---
base-commit: 6be7a5a768aafcb07d177bd2ae36ab84e4e0acde
change-id: 20250701-working_dma_0701_v2-7d2cf506aad7
prerequisite-change-id: 20250611-01-riscv-defconfig-7f90f73d283d:v1
prerequisite-patch-id: 53bda77e089023a09152a7d5403e1a738355c5d3

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>

