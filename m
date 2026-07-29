Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DBF45C6E3;
	Wed, 29 Jul 2026 16:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785341288; cv=none; b=K3dJlrTWdr+UpmoKuD8shHYqFkIehgkyg4Gvo4zzQOwVSJ1WBWWk40opYZNvh3WTfLA7InTqQxInhaYN4etkplIWA9DkcWpfKv/x0xIdr0IxaBUGMy+5c7w908GZt0JLM+5r3RLqIpNSVWQ2TsmYqRAdSrxOxBj1JOWekxAvxHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785341288; c=relaxed/simple;
	bh=if+W9jkdbFpQ/Wp+8xRDQvwYjy7H0jAYGWaAbsSod2I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bLXOb5GqSM1/pyLTyiuLCAqVycwoFiiRp3rZo/MsUDdWK7B24vfFa/BRdIsdz4xw2pmEJ8rVB2hC4cNz9q8qDisRJylAWZX9WO9VBAXpGJI5erUKzIcsTRq1vPwkQxoOVQspRYZnxIuU/XoDszf02KZr7iHu0PM9M0DZbkeMqQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=sXMS2Vzw; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="sXMS2Vzw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=kEYN0QMMZAZNvNGBzYRPVawrZjSXRyQ+6BY1Mqg/Qag=; b=sXMS2VzwmwLUcta9X2ViZD0F56
	vicu9NBfItF0YCPV/V5slUmaab7dv6wI2YLDVlxKFNJtwKbj6ZLFjs2xn4AF3F70gx/3Pu7sV2khW
	BHEkiw9gTnfplw/m0u5CwwGolXNJ8nW0KeOpVhDoEtmKMJhmeHECxOothSx3r/6ZQ9I90FOE4DGzi
	JNjJ/vc4mrZG7mzy7WmeHkVBXrw99D4GAI2wDNidc7alUO5SHP9dIJHrLk1t1VgDCZlpxoHApgCMJ
	TWn2MfJh7P/mcmEXvtMcUdo8IZCW4pCODPhMAycJSsKWm+E7fFWAqLios01BcztRQHs7GVSv0g0iw
	L0ZzkV8w==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wp6p7-00000002huJ-4C5i;
	Wed, 29 Jul 2026 18:08:02 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE:Keyword:riscv),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit)
Subject: [PATCH v2 0/4] riscv: dts: spacemit: Add cpu scaling for Milk-V Jupiter 
Date: Wed, 29 Jul 2026 18:00:27 +0200
Message-ID: <20260729160749.1621415-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds cpu scaling support for the Milk-V Jupiter boards.

The first commit adds it to the existing "Milk-V Jupiter (K1)" board.

The two following commits add a "Milk-V Jupiter (M1)" board, by moving
the common part, i.e. everything but the model name and the operating
point tables, in a shared DTSI file. This file is then included for both
K1 and M1 variants.

CPU frequency scaling was verified up to 1.8 GHz on the M1 board.

Changes v1 -> v2:
 - Collect Reviewed-by tag for patch 1
 - Fix copyright in patch 2
 - Use a different compatible for the M1 board

Aurelien Jarno (4):
  riscv: dts: spacemit: Add cpu scaling for Milk-V Jupiter
  riscv: dts: spacemit: Add a common board dtsi for Milk-V Jupiter
    boards
  dt-bindings: riscv: spacemit: add Milk-V Jupiter M1 compatible
  riscv: dts: spacemit: Add Milk-V Jupiter board (M1)

 .../devicetree/bindings/riscv/spacemit.yaml   |   1 +
 arch/riscv/boot/dts/spacemit/Makefile         |   1 +
 .../dts/spacemit/k1-milkv-jupiter-common.dtsi | 468 ++++++++++++++++++
 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 430 +---------------
 .../boot/dts/spacemit/m1-milkv-jupiter.dts    |  16 +
 arch/riscv/boot/dts/spacemit/m1-opp.dtsi      | 117 +++++
 6 files changed, 606 insertions(+), 427 deletions(-)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter-common.dtsi
 create mode 100644 arch/riscv/boot/dts/spacemit/m1-milkv-jupiter.dts
 create mode 100644 arch/riscv/boot/dts/spacemit/m1-opp.dtsi

-- 
2.53.0

