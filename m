Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20DFCA52
	for <spacemit@lists.linux.dev>; Sun, 28 Sep 2025 03:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759031188; cv=none; b=Hc7mjDseD94nEB6kw847B+snIAK5lGGWhQ18egEq81rWk2EdSgVPvFYEPEfZie/5Sq8F6q/8haWcqgSXvx8EpA7LSS40/Di8VjcEcn+zlH92+Zszd3vdJTSRCq39vgG3Tg9y954Xtg2eufy4Ypp8Hrczhkx2hK4fqZTPlruzbec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759031188; c=relaxed/simple;
	bh=leAHyipuOrrNM/GHdGoDUYGJ6EFVBQ6TUO5UvR4dHaM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S0ciNSNrv9wTYR7CH5CVYWaxyrEmaxOBvLtGZJJD5jj7nT2T8cJuI5ZRiiJltrt/FESi53rDICSY4LHJd8Uozt6DJjHDLBABdW7Ub7tPfkZEXYN/B9W66OF4Okv2AD0/2EmxkTqjSgKS8mFtgtqal6UpUqxJw7/eiZl0Bazmxp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH 0/2] riscv: dts: spacemit: Add initial support for MusePi
 Pro
Date: Sun, 28 Sep 2025 11:46:14 +0800
Message-Id: <20250928-k1-musepi-pro-dts-v1-0-64d0659dfdbc@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIav2GgC/x3MwQpAQBCA4VfRnE2taQmvIgfsYBK2HaTk3W2O3
 +H/H1AOwgp18kDgS1T2LSJLExjmbpsYxUUDGcpNRSUuGa6nshf0YUd3KOa2cGQGa6nrIXY+8Cj
 3/2za9/0APJ4m42MAAAA=
X-Change-ID: 20250928-k1-musepi-pro-dts-546d20c442ab
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759031178; l=997;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=leAHyipuOrrNM/GHdGoDUYGJ6EFVBQ6TUO5UvR4dHaM=;
 b=KyplklxWO12GVPU+bp0gZ7RAp9WhOAzlXhFOisv8yAJsjTObE2dUqJ6fdZAbisASFR/pKWyjm
 aH/L3CB9hIKBWAuh4KSRBKXJRrNG8EHIcAP/1kCZ3Ix/O6pdpBAZfHD
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-Migadu-Flow: FLOW_OUT

This patchset adds initial device tree support for the MusePi Pro board.

Muse Pi Pro [1] is a single-board computer integrating a high-performance
RISC-V 8-core processor, storage, I/O and expansion capabilities into
a credit card-sized 1.8-inch board.

Link:
https://developer.spacemit.com/documentation?token=YJtdwnvvViPVcmkoPDpcvwfVnrh&type=pdf
[1]

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (2):
      dt-bindings: riscv: spacemit: Add MusePi Pro board
      riscv: dts: spacemit: Add MusePi Pro board device tree

 .../devicetree/bindings/riscv/spacemit.yaml        |  1 +
 arch/riscv/boot/dts/spacemit/Makefile              |  1 +
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts     | 40 ++++++++++++++++++++++
 3 files changed, 42 insertions(+)
---
base-commit: 0f084b221e2c5ba16eca85b3d2497f9486bd0329
change-id: 20250928-k1-musepi-pro-dts-546d20c442ab

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>

