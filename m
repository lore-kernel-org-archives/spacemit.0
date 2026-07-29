Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E56F469831;
	Wed, 29 Jul 2026 17:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785345899; cv=none; b=PCaRV4JFWlGol4xXfa8WU7beP40ihhlWK2YcU12gN8xGX+koHc/lXMW3FNWpjXfUzaj2dvzdD+fnw2MTdN4Y0WL2ph9v4kRDqQD2r9RGCAMJXdIfFEFJ8cMCze0tVeBpbYU3CNPKPbYZLPCVNjCFKPUjBAedG4SyH0UuxMcFBG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785345899; c=relaxed/simple;
	bh=HmzIinMreitXYlSVWpjypTHQx2OkWFgBQ4YFRdocSUM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nZuPnJqnQA6uCd3nbU88DGqvtq3oX3usbH69zid6YuH6YoLlQvK3usfhoSCcAvlyR8Lu6VNBIyNO8OuObsYz7CEMLwibzQaqbPqXRCTB622jCnxL804ZqhNI64kjQqWH9ozvMIn2XfbdQzwMUFSrgxAosVuSfKB4n5oLIXzdkb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=WmI6vuZq; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="WmI6vuZq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=aLCUqsHes7MSmPIPuyE6Y7oiHgf3ZzmbZtoVZyCV8oQ=; b=WmI6vuZqobvqOM8DE7nxezDcSc
	2h5Sx76p4rl0AfLURaYeO/PxIoCoZCdTBXA1PpYzwyVtRy+eR5OKsAFwNzytynYUlSiR43Bk7tFMO
	gd7WvHwHgDLVgPRvA3tw3VvgS7LAzEyUCR66/316DfxJxNx2WM5MXrihPfCbl9MtNn7zMKGv5vp6U
	OJNs8k6v1KA3vsH7A2Qg1IbseguwsjRGJt63fb4pnf8KTwCc3doyLla1ycZyc97Pw8g3gn0QLlXgr
	42qJXysnanVbEqFv2KgsX14CYVOoQ2hSJO3U2KxWMP3jmGtsJPwb3iken6tDYA9M/z5ZMB4s/4E+I
	ueCZk8Bg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wp81W-00000002mWi-1kXs;
	Wed, 29 Jul 2026 19:24:54 +0200
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
Subject: [PATCH v2 0/4] Enable Bluetooth and WiFi rfkill on K3 Pico ITX
Date: Wed, 29 Jul 2026 19:20:22 +0200
Message-ID: <20260729172450.1660418-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset enables Bluetooth through USB on the K3 Pico ITX board and adds the
rfkill nodes for Bluetooth and WiFi so that the devices can be activated.

Note that the patch 4 is only useful with the following patch series
(but it doesn't hurt appying it before):
- https://lore.kernel.org/spacemit/20260709040027.958400-1-inochiama@gmail.com/

Changes v1 -> v2:
 - Rebase on current spacemit/dt-for-next branch
 - Collect Tested-by tag
 - Add link to USB3 PHYs in DT now that K3 PHY support is merged

Aurelien Jarno (4):
  riscv: defconfig: enable RFKILL and RFKILL_GPIO
  riscv: dts: spacemit: k3: add rfkill node for Bluetooth on Pico-ITX
    board
  riscv: dts: spacemit: k3: add USB3 B and C controllers for Pico-ITX
    board
  riscv: dts: spacemit: k3: add rfkill node for WLAN

 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 32 ++++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 66 ++++++++++++++++++++
 arch/riscv/configs/defconfig                 |  2 +
 3 files changed, 100 insertions(+)

-- 
2.53.0

