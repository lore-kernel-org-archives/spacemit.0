Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCAF155C82;
	Fri,  3 Apr 2026 12:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775219540; cv=none; b=VxLb4lCk4QUph8npb+PjOMBNXQnegLPjAH46Bjsx9njGtmXXucdeoS/l+Jv6uEKPeyyIFP0BhzNfDMlKhOD1WEZEoslUzNfzMCHT9p4sCwuGGw7oSYQdQozt8s6G2CIpo8D/AA+pTXEPLlE38WgTwnX7rCR/CANxkLhf8h7Sacc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775219540; c=relaxed/simple;
	bh=KBUjyrpPe2k4XhKFx345kREYiQ7Vjgg1jBFk6gpSAns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AfKl8RD+hx3P0R2RiV1aZPrQ1s+kI7F37ZmVRbMPvz9Mczm9oEY3OtTXAXJ8Pi6oYY9gmlzGICcRUUPKmIIMXVmgWH1INXL9i3G++7nY6uiya38iZh9KGQPYvE4AMjbw4pyxdRifMa7rnZoAzcFpjdWBiQ5iaX79uBmFVyj0Ke0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hPIUyh5M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPIUyh5M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5498DC4CEF7;
	Fri,  3 Apr 2026 12:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775219539;
	bh=KBUjyrpPe2k4XhKFx345kREYiQ7Vjgg1jBFk6gpSAns=;
	h=From:To:Cc:Subject:Date:From;
	b=hPIUyh5MLKJzCMUWJkZ1EW0Uo8J1VVlOIxSZpxB3jrEPp8Eo7JYo0WRfg4Uh2VaZB
	 oMZxBGwOE2dyRnlhW8I3rRnc93/TWbs7Qcg3A1igt7gshVsKd3WkSuKvC2MIqnvyEY
	 zAhlQP7Jd4aLyCDwTAigM5M9PlnyJT5tRMko5YRaburX6yg8QF4tuxTGD/1mFwvAAK
	 8uyWGBegVIt6kuG9Peo2J5f4CqkO44utmxlyGukSbKk6n3pyXq+XMi0S5zhYRGkRQj
	 cwewXHoyz36eRdQL4iTKYkZraTftrnCe5A4crCoEdK87FMV9lnl5jgrbfRNwYW3eZ4
	 NHWtWszItvOGw==
From: Yixun Lan <dlan@kernel.org>
To: soc@kernel.org
Cc: Yixun Lan <dlan@gentoo.org>,
	Arnd Bergmann <arnd@arndb.de>,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V SpacemiT Devicetrees for v7.1
Date: Fri,  3 Apr 2026 12:32:06 +0000
Message-ID: <20260403123040-KYC0145825@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Yixun Lan <dlan@gentoo.org>

Hi Arnd,

   Please pull SpacemiT's DeviceTree changes for v7.1

Yixun Lan

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://github.com/spacemit-com/linux tags/spacemit-dt-for-7.1-1

for you to fetch changes up to af62a095eb0c3359d477b55ef72d2afd94c83c8f:

  dts: riscv: spacemit: k3: add P1 PMIC regulator tree (2026-03-30 04:42:10 +0000)

----------------------------------------------------------------
RISC-V SpacemiT DT changes for 7.1

For K3 SoC
- Add I2C support
- Add PMIC regulator tree
- Add ethernet support
- Add pinctrl/GPIO/Clock
- Enable full UART support

For K1 SoC
 On Milk-V Jupiter
- Enable PCIe/USB on
- Enable QSPI/SPI NOR
- Enable EEPROM, LEDs
 Others
- Fix PMIC supply properties
- Fix PCIe missing power regulator

----------------------------------------------------------------
Aurelien Jarno (7):
      riscv: dts: spacemit: drop incorrect pinctrl for combo PHY
      riscv: dts: spacemit: add LEDs for Milk-V Jupiter board
      riscv: dts: spacemit: add 24c04 eeprom on Milk-V Jupiter
      riscv: dts: spacemit: add i2c aliases on Milk-V Jupiter
      riscv: dts: spacemit: enable QSPI and add SPI NOR on Milk-V Jupiter
      riscv: dts: spacemit: enable USB 3 ports on Milk-V Jupiter
      riscv: dts: spacemit: enable PCIe ports on Milk-V Jupiter

Chukun Pan (2):
      riscv: dts: spacemit: Add 'linux,pci-domain' to PCIe nodes for K1
      riscv: dts: spacemit: reorder phy nodes for K1

Guodong Xu (1):
      riscv: dts: spacemit: Update PMIC supply properties for BPI-F3 and Jupiter

Inochi Amaoto (1):
      riscv: dts: spacemit: Add ethernet device for K3

Yixun Lan (9):
      riscv: dts: spacemit: pcie: fix missing power regulator
      riscv: dts: spacemit: adapt regulator node name to preferred form
      dt-bindings: serial: 8250: spacemit: fix clock property for K3 SoC
      riscv: dts: spacemit: k3: add clock tree
      riscv: dts: spacemit: k3: add pinctrl support
      riscv: dts: spacemit: k3: add GPIO support
      riscv: dts: spacemit: k3: add full resource to UART
      dts: riscv: spacemit: k3: Add i2c nodes
      dts: riscv: spacemit: k3: add P1 PMIC regulator tree

 Documentation/devicetree/bindings/serial/8250.yaml |   5 +-
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  26 +-
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts  | 204 +++++++++++-
 arch/riscv/boot/dts/spacemit/k1.dtsi               | 112 ++++---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       | 170 ++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi       |  69 ++++
 arch/riscv/boot/dts/spacemit/k3.dtsi               | 369 ++++++++++++++++++++-
 7 files changed, 876 insertions(+), 79 deletions(-)
 create mode 100644 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
