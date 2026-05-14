Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA0031AF33;
	Thu, 14 May 2026 16:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778774678; cv=none; b=bLuuKkxdhE6ukjpoZuWKuyEA+l83AW8RmFu6wTnFvwv2/xC+zxvTxqz9bVfvh/Z609ndpIR5D/UInSrKkaEUh8HTj/RHDWHZ41M/bpBJplT28Yj/0K8Thd3MsFV6GGvaYyfblZF96Y0dRptzNwlJLGwWtbliR8vbaREJReRD8n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778774678; c=relaxed/simple;
	bh=PqsmGDY7T6gx+9okGXN4V0/415CBIKAn34Xet3Sxc9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DjtSRFmv7F3uLeTI5AkgwYfcTIPyG6cO2lZLCChFGsbkofYtVSuKpJi+pFSj07m6LsnZJCTH+gVhr2roZC75fV9bpJQu+1JUCkeD/8T+RvcZeH5v5LE1l7i4gLi43UMXgFkxWIifrvnm/DuVV4n9/VYoIrL79c53q2WaMOZPEZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=D6kV5Dk9; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="D6kV5Dk9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=JARAgOxWgx/BmBgpATzav7ngBmd3um0PYsWZ9kX/7f4=; b=D6kV5Dk9H5LOFeb729H2DsI0Bw
	c5djFikSM0W4LPoJcZgvA/6Y6HEZ35S2pzSjM/C+zlNA1RHazDJB/wKWiU+uigd5q4hkTUTl7OIWe
	xfM4/cMHw5v6g/MFjLax3KTDfbGeo+hcXVQDRmyHOP5xQjIfBewzK22wSCwdUtZAushQDnkorwqOs
	PbBr68U8WevDnGtmmCv9G2bnmrOXLKJ+joB+cMpzMrajPW4xoVPilVIFl1F+y4yqxpBH6uJcO00va
	58BbpPpcOZ2op42Ydn5vsvX03ZDGk7uVnO01yVFNtnqCKdSryfhKecmE0TMyxQbiUABs8ztFVSm0G
	evVb99Qg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wNYXx-00000007W27-1lZX;
	Thu, 14 May 2026 18:04:25 +0200
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
Subject: [PATCH 0/4] riscv: dts: spacemit: improve Milk-V Jupiter device tree
Date: Thu, 14 May 2026 17:56:20 +0200
Message-ID: <20260514160356.1642075-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset updates the Milk-V Jupiter device tree to align with the
changes recently done for other SpacemiT K1 based boards.

In addition the last patch enables SD card support, but it depends on
the SD card support series for the K1 SoC to be merged first:
https://lore.kernel.org/linux-riscv/20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com/

Aurelien Jarno (4):
  riscv: dts: spacemit: set console baud rate on Milk-V Jupiter
  riscv: dts: spacemit: sort aliases on Milk-V Jupiter
  riscv: dts: spacemit: enable eMMC on Milk-V Jupiter
  riscv: dts: spacemit: enable SD card support on Milk-V Jupiter

 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 35 +++++++++++++++++--
 1 file changed, 32 insertions(+), 3 deletions(-)

-- 
2.53.0

