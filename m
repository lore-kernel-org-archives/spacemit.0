Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5493BBFCD;
	Wed, 19 Aug 2026 17:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787158889; cv=none; b=tTR2xFBIIqBlWOG6mWdcjjaqUc5Q1i4Me1uZUFHGPc7CYU3o5hG4lw16jn2bBgnXkSu9b+UJxY9serJ0ZF4oixH4N5SWLUIgDI+bgcUPLrwIeUmvpC+vWp+KWrkWyO95taCGDPuPeB4yS08flGPwZs5EnV/TlNjK9qVSZVe0tas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787158889; c=relaxed/simple;
	bh=x+bk7JJWjzn/zx4rpRFo5d1QVXLJyCJHk9cDzFEk7sU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S9PxWYWFnEHaWqlVSq7RnRV62Cg1gb0wIcoBiXSRUCyZ/tD0dLPAiIrEJEXTe496Pzx3rOgnuRfX7qX97cF5cHyqhADANxRv27R8Z2jUK+cZJSJl4z6VamJrcUj1XjTOp1CgWtqoHJBZBJfsartm0xYaMAGM4fyKLgrUMpEqWnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=IQ1d42rg; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="IQ1d42rg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=1pyl46IuAP+khElKBqRymsMVGcIi1WVfxbaAW6P5Qns=; b=IQ1d42rg+uF1DNqDMl9+bJ+zfZ
	IMXbdPkRxgARCE4ea8BgBEHbNwVxqQJx2bZPykhMUoerWpvlNH/TssVIxhDMNhVya/ZUlOuyOYOPk
	UWkznUVcCE1/GkkLEx5GazGg49/F1zRj+EqBiHFM6crq6I/4S8eQxpwByg+Qi7DOOd9rlhdC56kYD
	5JLVkWFBsA41G/hS9D8bok9ZJYQrkqvnPfOE6JLnIRIklvyCX9jO71m5jcw7od62Jr5G3M0VJ13SX
	RFy2EVdTgJ4ovfSQz1/Eoo9iMSkILKY+VVE+txWTTxZKnw2oGDj7rI1MwEcNT/E7x3Z2beccHrlYG
	W2U15wKg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wwj2b-0000000D4kf-2fOL;
	Wed, 19 Aug 2026 18:21:25 +0200
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
Subject: [PATCH v3 0/5] Enable Bluetooth and WiFi on K3 Pico ITX
Date: Wed, 19 Aug 2026 18:15:41 +0200
Message-ID: <20260819162115.2252812-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset enables Bluetooth through USB on the K3 Pico ITX board and
adds the rfkill nodes for Bluetooth and WLAN so that the devices can be
activated.

Note that WLAN support also require the following patch series, but
both series can be applied independently: 
- https://lore.kernel.org/spacemit/20260709040027.958400-1-inochiama@gmail.com/

Changes v2 -> v3 
 - reorder patches in a more logical order
 - rebase on current linus/master
 - add patch 1 to move phy definition to the board level for the "usb3d" controller
 - remove link to USB3 phys, they can't be added if the combo phy is not configured accordingly
 - enable Bluetooth and WLAN drivers in defconfig

Aurelien Jarno (5):
  riscv: dts: spacemit: k3: move USB3 phy to board level
  riscv: dts: spacemit: k3: add USB3 B and C controllers for Pico-ITX
    board
  riscv: dts: spacemit: k3: add rfkill node for Bluetooth on Pico-ITX
    board
  riscv: dts: spacemit: k3: add rfkill node for WLAN on the K3 Pico-ITX
    board
  riscv64: defconfig: Enable BT and WLAN support for SpacemiT K3
    Pico-ITX board

 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 35 ++++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 69 +++++++++++++++++++-
 arch/riscv/configs/defconfig                 |  8 +++
 3 files changed, 109 insertions(+), 3 deletions(-)

-- 
2.53.0

