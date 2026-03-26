Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35BE39EF17;
	Thu, 26 Mar 2026 18:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774550286; cv=none; b=i18NAsEV0/ER1FriNWtCdLdG3hbjmV1GWk7IwJCGzv30xqrSZ/cF3hPP47VryTOjGzHBQRi+eNM7xltIC5UES9OeWaMvhMqgAu2kgsksj+KkxZnw15ciUqDCGnTZ0LkBoCReLfdu1NGmaIPvveygWGGXDp86bG0OAW56SXsS3ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774550286; c=relaxed/simple;
	bh=KEJLxQjVYVnI8xd60sWQTFJnTKUsPZ3CZRjn78h3wSU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ICUMsgF7yQxkUnisZ1tV/7Xwf2elgG0mncsqLel+T9Q2bz9MamciGwjrEbWKZqxIWPfCqS/h5TECsoOkClVBBcE+FMkZyAy7GCJ2m1lxO1a3SEm5QsCCN0fVjyXnMPCsvcZO0aqGDXWz/afcQfOGT1R8zEDz3AiDlCbT2XuIz4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=xpIkWgL1; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="xpIkWgL1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=pKYF2U3blSKdPTf4iCctXPVsD9JEXM2IleXwM15XUQE=; b=xpIkWgL1inn8tnUCcEBJQlSlRc
	1WIwWlcU0VvqrlGmv31oKz0EYEmCtP49fD4qV/qbDEd6XNqkHfJx/hBZss6EgkHK75s6NjDNKv/bE
	reA1bb2TMU0TMLQplE1/xB0sDnKDNgCLgOcQrPJs8Hx7ZjARpWiQTwUNBa/fyTihZzqlCVoxe5oc5
	catug6YBFqjDl8gGOTon1Yhd4R6bIG7Oc/lddSP3uOkYbC2uIDVZwD2oDSmuq3jt8vrrVg5+RvlH9
	qIHvVOiYkat2ULrOJ93A2oNiQ2T/5HZ4eDqq3YJ7ysNfFEqFAuSiZcWaM9UUG46t9Ev1DGDSvJHkh
	pcG+r0rw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1w5pad-0000000GAiw-2Nke;
	Thu, 26 Mar 2026 19:37:55 +0100
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
Subject: [PATCH v2 0/6] riscv: dts: spacemit: enable more devices on Milk-V Jupiter
Date: Thu, 26 Mar 2026 19:35:28 +0100
Message-ID: <20260326183745.1370642-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset improves support of the Milk-V Jupiter board by enabling
more devices. Most notably the NOR flash (useful for upgrading the
bootloader), the USB 3 ports and the PCIe ports.

It was inspired by the Banana Pi F3 device tree file. It is based
against the k1/dt-for-next branch and does not have any other
dependency.


Changes between version 1 and version 2:
 - Collect Reviewed-by:
 - Remove bootph-pre-ram property from SPI NOR flash
 - Mention that the fast read opcodes is marked as supported in the SPI NOR flash datasheet
 - Fix typo in the description of patch 6

Version 1 of this series is available here:
  https://lore.kernel.org/lkml/20260322203356.2206927-1-aurelien@aurel32.net


Aurelien Jarno (6):
  riscv: dts: spacemit: add LEDs for Milk-V Jupiter board
  riscv: dts: spacemit: add 24c04 eeprom on Milk-V Jupiter
  riscv: dts: spacemit: add i2c aliases on Milk-V Jupiter
  riscv: dts: spacemit: enable QSPI and add SPI NOR on Milk-V Jupiter
  riscv: dts: spacemit: enable USB 3 ports on Milk-V Jupiter
  riscv: dts: spacemit: enable PCIe ports on Milk-V Jupiter

 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 188 +++++++++++++++++-
 1 file changed, 187 insertions(+), 1 deletion(-)

-- 
2.51.0

