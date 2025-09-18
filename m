Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29911DF996
	for <spacemit@lists.linux.dev>; Thu, 18 Sep 2025 21:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758232714; cv=none; b=TxQ6Aosk1bnFHNb12Qq9QbxS9DOkIZD+/gBVN5kw1vXdPnsRnJw5hTHxYUv6epS4CBvcylTfTvFxTlpIvXMS9a1yNRC6idboXaTxX/C+JI1soU/LirD+YCaI+ahPY+CumScFnBZ0VOEa0ZvYmI5lA+QdpBRnDWfoLJFgKEZb+XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758232714; c=relaxed/simple;
	bh=0J4k9M3nW/Gn42wRpG6Rt8kBVc8A+C2t6b6WVWYGgmo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gPY4ompIC839bKbAHstYYrgI/RQajZ4EMsbcfTkpvSnF6mBWs+bnE2K3M1spxIsEuETo0xnvQf4o/F5bl2r/E0ZnJD3eGzAWIIz6K/K5yAyjs1U8Z+qyi92xoNnlpFmUwpmpcwH5mlBqyYQCIxB6r8Yn+WSLFponxCtpzPfVrP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from ofsar (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id CE0463421AD;
	Thu, 18 Sep 2025 21:58:29 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: soc@kernel.org
Cc: Yixun Lan <dlan@gentoo.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Alex Elder <elder@riscstar.com>,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [GIT PULL] RISC-V SpacemiT Devicetrees for v6.18
Date: Fri, 19 Sep 2025 05:57:59 +0800
Message-ID: <20250919055525-GYC5766558@gentoo.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Arnd,

   Please pull SpacemiT's DeviceTree changes for v6.18

Yixun Lan

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://github.com/spacemit-com/linux tags/spacemit-dt-for-6.18-1

for you to fetch changes up to 0f084b221e2c5ba16eca85b3d2497f9486bd0329:

  riscv: dts: spacemit: uart: remove sec_uart1 device node (2025-09-04 08:50:29 +0800)

----------------------------------------------------------------
RISC-V SpacemiT DT changes for 6.18

- Add OrangePi RV2 board support
- Add reset support to UART driver
- Add PDMA driver support
- Remove sec_uart1 node

----------------------------------------------------------------
Guodong Xu (2):
      riscv: dts: spacemit: Add PDMA node for K1 SoC
      riscv: dts: spacemit: Enable PDMA on Banana Pi F3 and Milkv Jupiter

Hendrik Hamerlinck (3):
      dt-bindings: riscv: spacemit: Add OrangePi RV2 board
      riscv: dts: spacemit: Add OrangePi RV2 board device tree
      riscv: dts: spacemit: add UART resets for Soc K1

Yixun Lan (1):
      riscv: dts: spacemit: uart: remove sec_uart1 device node

 .../devicetree/bindings/riscv/spacemit.yaml        |  1 +
 arch/riscv/boot/dts/spacemit/Makefile              |  1 +
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  4 +++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts  |  4 +++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   | 40 ++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi               | 31 +++++++++++------
 6 files changed, 71 insertions(+), 10 deletions(-)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
