Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7842F83A0;
	Tue, 19 May 2026 04:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779164119; cv=none; b=uGH3q8f8alkYJdN0Z/a3NQiHbXq98DZcCwQdxaNFJJbGjXehRqEi9vXmUfrl+alJtAz7Xql9Lw5iGSXlDVVP5bjkrjwPIQifYcBSJb7oKeNuinpImZIQ6hmZWEKsDomgsx9vvDpoUnZ8iBDrenk+2R8vr+AqOjbIOoOqleFkvKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779164119; c=relaxed/simple;
	bh=hQ4ybYY8IccBZrx/lFW2t56YbVsHuuc1glrYU0T6uUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D3fHPEx9eRvhFH1qQUOOh+LjeCYXpq8yZdEXwyTgp8/4S3Qy+S9I403nQTiwSbK5W5GoajVWah1InhYk9+6vRCVV2DghRFaHJy8qZAGAzYZUMC/WCFSlXvJ+ebuiyB419ZXp9VGPwa85FANGN8su6zUjHPgkNRHtc2ABeqOA1QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=NG2m1G6G; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="NG2m1G6G"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=wM4H58iEOJFXQLWNwkR2FmcvNn+x1jTyqvj3BChTMss=; b=NG2m1G6GxfGiHbGuQn6kUo2drP
	JQOh6frU1TtpzshZxfbua3NQvA/sm/17TJMFNHcaBp0eF3MlZRwMy+aNBD5AYC9rUQDzX++uh5gmX
	HsqgrdzvVWoFOkJgfCYGqpX8B/4yN0/NkDnfRVobBueRZfH4fPhaLUVKct+UWfueso1Z8gtDBpqC0
	N8o34186X/SvmZTKY/ixix/wU1du+yAbjZhamtGMAdaclHNNaBd2NiFPYeLS7YCStgq+47WTaU/9d
	T15eieUl7VKwpqzbsvX2yYda0CpzqJzMj7xa94PRLgjEqG3Tn63aRcNzBk0PkomQ/lWUNE6U1/6Va
	NtFePZKw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wPBrG-000000032le-2MrT;
	Tue, 19 May 2026 06:15:06 +0200
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
Subject: [PATCH v2 0/5] riscv: dts: spacemit: improve Milk-V Jupiter device tree
Date: Tue, 19 May 2026 06:12:34 +0200
Message-ID: <20260519041458.3287843-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset updates the Milk-V Jupiter device tree to align with the
changes recently done for other SpacemiT K1 based boards, including
enabling SD card support.

Changes in v2:
- Rebase on linux-next, which includes the SD card support series for
  the K1 SoC
- Mark the eMMC as non-removable
- Add patch to fix uboot partition offset
- Link to v1: https://lore.kernel.org/linux-riscv/20260514160356.1642075-1-aurelien@aurel32.net/

Aurelien Jarno (5):
  riscv: dts: spacemit: set console baud rate on Milk-V Jupiter
  riscv: dts: spacemit: sort aliases on Milk-V Jupiter
  riscv: dts: spacemit: enable eMMC on Milk-V Jupiter
  riscv: dts: spacemit: enable SD card support on Milk-V Jupiter
  riscv: dts: spacemit: fix uboot partition offset on Milk-V Jupiter

 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 38 +++++++++++++++++--
 1 file changed, 34 insertions(+), 4 deletions(-)

-- 
2.53.0

