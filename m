Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E7F412264;
	Tue, 28 Jul 2026 21:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785273048; cv=none; b=TRSnc8CR+xMpNSbgK/Tyxy8lIW3dkLlr+qI/z6MJSm9cGkAXclxZJwsT9hcTAkHQa1slfrBdWCIgtIZ5ngxkCyqZ0vjYEf5lSQdrFJee1atnM61Wo94JeSeHMQ0ba9IqdptxO+JY/iFDABcDNuTnfILe1ABh3tLfvjrDFHr4p+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785273048; c=relaxed/simple;
	bh=0KSe5X6gbj8d1KGc+z9Whe/7bvi3pGqnqP8FyUaepbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S3BdciTlFFLTKAmiacGFNqhrNnsSvsKml1KKWf+aMiuJD97hrC+JcEuNGesP+STGN6oHGAxltJLB15TgPmmD8tpyeVjWQs4VCfUNW1djXCaztBv9aDGzXw037IDoAwWjx6/4H0TK9APVhvP5NbpWqcULM0ftF53U/GEKLr8L/7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=nD6uQ6r9; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="nD6uQ6r9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=TXhqo12SdAHNMxE8AMJ+oh/lXzA6j5PNy0D6aKIdi/0=; b=nD6uQ6r9XW+Ls0Sj0/9UHEj9Aq
	XN0gcjcvlOcsoarn0XMRUNytrZOM2pLBwlKdKWKzFrhd1tx806em6RjKcsg61/shf/ZA4zHSPLHBz
	MlqSsWlkCg0z/GuiwPBjpJd16zWfA1w0OwEUlVdiifxqoEeuLF06V+HT4A3Kbdpxl4cZSE3ARU6vW
	2XYdDCR9N+OeF0y6RhafVhYxOnC7Y21c4kGMoiec0xkt84z2sgIJMC/g4hwDOWuwDyKYnW8giKwU2
	4jkcDEKsQ6Rpcg7XasNGmhIiyxzoThi9TYcaEUJgXkvyjTFIPf7nWQIEhdP3n2MaBqdl2pyHdEU/r
	fr5yBYZQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wop4O-00000001a4I-2XGt;
	Tue, 28 Jul 2026 23:10:36 +0200
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
Subject: [PATCH 0/3] riscv: dts: spacemit: Add cpu scaling for Milk-V Jupiter
Date: Tue, 28 Jul 2026 23:05:05 +0200
Message-ID: <20260728211020.1248676-1-aurelien@aurel32.net>
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

Aurelien Jarno (3):
  riscv: dts: spacemit: Add cpu scaling for Milk-V Jupiter
  riscv: dts: spacemit: Add a common board dtsi for Milk-V Jupiter
    boards
  riscv: dts: spacemit: Add Milk-V Jupiter board (M1)

 arch/riscv/boot/dts/spacemit/Makefile         |   1 +
 .../dts/spacemit/k1-milkv-jupiter-common.dtsi | 469 ++++++++++++++++++
 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 433 +---------------
 .../boot/dts/spacemit/m1-milkv-jupiter.dts    |  11 +
 arch/riscv/boot/dts/spacemit/m1-opp.dtsi      | 117 +++++
 5 files changed, 601 insertions(+), 430 deletions(-)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter-common.dtsi
 create mode 100644 arch/riscv/boot/dts/spacemit/m1-milkv-jupiter.dts
 create mode 100644 arch/riscv/boot/dts/spacemit/m1-opp.dtsi

-- 
2.53.0

