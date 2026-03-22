Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9ED3B7A8;
	Sun, 22 Mar 2026 20:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774211652; cv=none; b=oUXFh9maFPW/g12ZuPOJWCxieyizp5Br4lnj3tjmvjxfJ3K919NMYIMvBmSehrufkx00CqhS6Ocj0ooUnbHZ7DtqhgAIwNMxDTClUBjhIHwblu6q36xUS056U+eM8D38x7BFs1HQSbvLFPTYzJ+vNrP4DTVx/hrfsyju0d//zlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774211652; c=relaxed/simple;
	bh=k4uchfcaG7ZLaPgezDr1xeeOawhsgcv/yZDy4A+RHH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uUp1cZFXOW0nEtiXTO9iP3sjiTEhSFJ0TzFHVLrVB6iPvwS5rAw7IbSU7fiisLyRE8p91Euh6sKl9bajGsI7xJqPEWSDtw9fUrDoSu2X6nqvJlZLicY/bco9ncgJn8QJdeSrvX15AJhy2eQoR5uVUFLFDOgyQtZq9gyEHOviEkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=v92QgJZV; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="v92QgJZV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=lp7abrTQ6VxxE1XhWtGPfA4HAn/URXX9XttQo6UUTBw=; b=v92QgJZVosE46A58gLkH9bQAe9
	fq9EE5JYqp5yVH9H+U4235M7BQsc8QIhfZ/RwaZh5fixFUFjFnT9/f7ASVoM8F/xX1CCArjIEGO12
	+fkCCrLT7EwdBmhq/bCvT28lNz56DwVevlCg8nmWJKKvqKqmd/J22skVqN360wviISIsRoW/xDalU
	6DALOM1ve7drmRua3wyCGjUJKLBMJMvoHpEm6R7DcMD7wfD00WuhRnk9jLgeIquCj0gR06IeFFk0H
	spKHC/3sX3sGfVM19F8VT/YKUaLaMm0UCxm7TdNbNBLwiR/Vh3U7/2PV4yuKavMPQgj2uACTl2LIg
	QkW1TX6w==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1w4PUu-0000000Asdt-3tUW;
	Sun, 22 Mar 2026 21:34:08 +0100
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
Subject: [PATCH 0/6] riscv: dts: spacemit: enable more devices
Date: Sun, 22 Mar 2026 21:28:31 +0100
Message-ID: <20260322203356.2206927-1-aurelien@aurel32.net>
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

Aurelien Jarno (6):
  riscv: dts: spacemit: add LEDs for Milk-V Jupiter board
  riscv: dts: spacemit: add 24c04 eeprom on Milk-V Jupiter
  riscv: dts: spacemit: add i2c aliases on Milk-V Jupiter
  riscv: dts: spacemit: enable QSPI and add SPI NOR on Milk-V Jupiter
  riscv: dts: spacemit: enable USB 3 ports on Milk-V Jupiter
  riscv: dts: spacemit: enable PCIe ports on Milk-V Jupiter

 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 189 +++++++++++++++++-
 1 file changed, 188 insertions(+), 1 deletion(-)

-- 
2.51.0

