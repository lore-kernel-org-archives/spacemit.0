Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0A02931D7;
	Sun,  2 Aug 2026 02:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785638570; cv=none; b=thcnB2M3ZOs6mVocOoPFnIM3y0Utbei1TXAB9DS3w2ju9roa0Th8QYxwPHQNQutLetKAEmb3X995enknToOVmnWqQJxBTPw/3MASRidnHZz+ofPf4j5+n85zY+T+DdpcXYQ+dIEwK6+99xloRNlHoRQkeqJd49nGuhHY9d7asck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785638570; c=relaxed/simple;
	bh=om1o2F5xohlkYwzDg4FK20X4jR0j84zX+T5ddpch3XQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HWGzgcJKI9b94YbfLlM+czUMfm8bpX1rHNNhp4pv1nboAj3VoDPuUHA4vSNKMHvo+h7AsAZUfZ4+Iqhi8uK9WNhxKQCVPuwDJClGgC5dYTlDlwxpTDVm1lZq3H9UsEi5ekT/WMszA2fhi9pD1tvNERN6d0TvZ6zfHFOcGoN2LDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NFuN7roa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NFuN7roa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D5761F00AC4;
	Sun,  2 Aug 2026 02:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785638569;
	bh=G7pjPdHcziQjL7fgeQl0SYtRU28wBVdIe8+9QWyN3dk=;
	h=From:To:Cc:Subject:Date;
	b=NFuN7roafmWP8un0HCDeLjAMTcWtOHov0Ib9mFHDC/yjyoV4eEcNvzz4p6fh+lHCf
	 a9Y7u1IxynTlqbsYEgjr3XB7GcolN2ubz1LeUnNCIB9zPBpo35R+tSBZBpzXrb4+s+
	 e3EgvmT1agjW0foKK4Wd2Eg22ClmDu5KsChuAN1WMgUX4OjgcUFs9K6y7m0lr7OSW1
	 1hvmkeN8gRqDAZrY2OCoPmBfmd4AKH8fbKJWrsbwrDCIrGg9m4n7u5PSavfAj8hKd8
	 7Nzr4DRQ6LoNJAOvHXYG4F2sgw+kZkLiwwvl0Cz5pk/Z4EoFv7Uo933U47XMarpFVT
	 uC7rSo8Dy+3xw==
From: Yixun Lan <dlan@kernel.org>
To: soc@kernel.org
Cc: Yixun Lan <dlan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V SpacemiT Devicetrees for v7.3
Date: Sun,  2 Aug 2026 02:42:43 +0000
Message-ID: <20260802024052-KYC1424545@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi SoC Maintainers,

   Please pull SpacemiT's DeviceTree changes for v7.3

Yixun Lan

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/ tags/spacemit-dt-for-7.3-1

for you to fetch changes up to e273d298b74ea63d5d586bd50240f919a9c33fb3:

  riscv: dts: spacemit: Add cpu scaling for Milk-V Jupiter (2026-07-30 09:02:11 +0000)

----------------------------------------------------------------
RISC-V SpacemiT DT changes for 7.3

For K3 SoC
- Enable SD card support
- Enable QSPI
- Fix reset delay of ETH PHY
- Fix PHY ID of ETH
- Symbolic PDAM ID
- Add SPI controller support
- Add USB and PHY support
- Add I2S nodes

For K1 SoC
- Symbolic PDAM ID
- Enable cpufreq support
- Fix max CPU core voltage

For boards of K3
- Pico-ITX
  - Enable ALDPS on RTL8211F PHY
  - Disable 125MHz clock on RTL8211F PHY
  - Enable NOR flash
  - Add EEPROM support
- CoM260
  - Add EEPROM support

For boards of K1
- Milk-V Jupiter
  - Enable CPU DVFS
- Banana Pi BPI-CM6
  - Add initial support
- OrangePi R2S
  - Enable PCIe

----------------------------------------------------------------
Aurelien Jarno (12):
      riscv: dts: spacemit: set console baud rate on K3 Pico-ITX board
      riscv: dts: spacemit: enable the i2c2 adapter on K3 Pico-ITX board
      riscv: dts: spacemit: add 24c02 eeprom on K3 Pico-ITX board
      riscv: dts: spacemit: add i2c aliases on K3 Pico-ITX board
      riscv: dts: spacemit: improve RTL8211F PHY configuration on K3 Pico-ITX board
      riscv: dts: spacemit: k1-bananapi-f3: fix maximum CPU core voltage
      riscv: dts: spacemit: k1-milkv-jupiter: fix maximum CPU core voltage
      riscv: dts: spacemit: k1-orangepi-rv2: fix maximum CPU core voltage
      riscv: dts: spacemit: k1-musepi-pro: fix maximum CPU core voltage
      riscv: dts: spacemit: k1-orangepi-r2s: fix maximum CPU core voltage
      riscv: dts: spacemit: k1-bananapi-cm6: fix maximum CPU core voltage
      riscv: dts: spacemit: Add cpu scaling for Milk-V Jupiter

Chukun Pan (1):
      riscv: dts: spacemit: enable PCIe on OrangePi R2S

Guodong Xu (1):
      riscv: dts: spacemit: Use symbolic PDMA request numbers on K1

Inochi Amaoto (7):
      riscv: dts: spacemit: Add enough deassert time for the PHY on PICO ITX
      riscv: dts: spacemit: Add enough deassert time for the PHY on com260 board
      riscv: dts: spacemit: Fix phy id check for the phy on pico-itx board
      riscv: dts: spacemit: Fix phy id check for the phy on com260 board
      riscv: dts: spacemit: k3: add USB controller and USB phy support
      riscv: dts: spacemit: Make dtschema recognize the etherent PHY correctly on K3 pico-itx board
      riscv: dts: spacemit: Make dtschema recognize the etherent PHY correctly on K3 com260 board

Jennifer Berringer (2):
      riscv: dts: spacemit: k3-com260: add eeprom on i2c2
      riscv: dts: spacemit: k3-com260-ifx: add eeprom on i2c1

Junhui Liu (3):
      dt-bindings: riscv: spacemit: Add Banana Pi BPI-CM6 compatible
      riscv: dts: spacemit: k1: Split gmac_clk_ref into independent pinctrl groups
      riscv: dts: spacemit: k1: Add Banana Pi BPI-CM6 IO board

Shuwei Wu (2):
      cpufreq: dt-platdev: Add SpacemiT K1 SoC to the allowlist
      riscv: dts: spacemit: Add cpu scaling for K1 SoC

Troy Mitchell (1):
      riscv: dts: spacemit: k3: add i2s0-i2s5 nodes

Yixun Lan (1):
      riscv: dts: spacemit: k3: Enable SD card support

Zhengyu He (2):
      riscv: dts: spacemit: k3: Add QSPI support for Pico-ITX board
      riscv: dts: spacemit: add SPI controllers for K3

liyeshan (1):
      riscv: dts: spacemit: add K3 PDMA request numbers

 .../devicetree/bindings/riscv/spacemit.yaml        |   5 +
 arch/riscv/boot/dts/spacemit/Makefile              |   1 +
 .../riscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts | 177 +++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi  | 217 +++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  43 +++-
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts  |  43 +++-
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts     |   6 +-
 arch/riscv/boot/dts/spacemit/k1-opp.dtsi           | 105 +++++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts   |  46 +++-
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   |   4 +-
 arch/riscv/boot/dts/spacemit/k1-pdma.h             |  56 +++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |  24 ++-
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  12 +-
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts     |  33 +++
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi        |  38 +++-
 arch/riscv/boot/dts/spacemit/k3-pdma.h             |  83 +++++++
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       | 117 +++++++++-
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi       |  88 ++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi               | 240 ++++++++++++++++++++-
 drivers/cpufreq/cpufreq-dt-platdev.c               |   2 +
 20 files changed, 1308 insertions(+), 32 deletions(-)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-opp.dtsi
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-pdma.h
 create mode 100644 arch/riscv/boot/dts/spacemit/k3-pdma.h
