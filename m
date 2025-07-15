Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A40B67F
	for <spacemit@lists.linux.dev>; Tue, 15 Jul 2025 01:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752541716; cv=none; b=HTxnSnUUfgiXZtoC51aQ5vuAs6pyAZTMeeeyJS5npkjUfjn3KHMpdSfRuq5ziA3qy+wnPaggiaC+AaF5JL8Vz2J0uTI1onkwtUfOyUxXNtyffZ7KjY+PyCHd9uxhj+hjwSZej7eSru8y3Jo0R0Oxtu43JFLceYV9uQIZkZuEBpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752541716; c=relaxed/simple;
	bh=Fu5ixB0hPokbF97TZn3PHSr6gdbMKZ9P5xNxYJ48qfA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kAWS5wnLdzsQXrOTCNbzKRFjMVgUmEWVey+VJDepognuA8AWGE4m9WB0I4ewtpa+LHtypUpTQOU0Oj2w1lOvUWEh5v8lZl1dh6EeIe3skC6le/nsjVofJ2z3OsetlldapnMqm0TQKW/nAhNkI9Gc/XGGVmgh8f1dxqTxtrxGXbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id AC25E340E39;
	Tue, 15 Jul 2025 01:08:33 +0000 (UTC)
Date: Tue, 15 Jul 2025 01:08:22 +0000
From: Yixun Lan <dlan@gentoo.org>
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: pll
Message-ID: <20250715010822-GYA539814@gentoo>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

  Please pull SpacemiT's device tree changes for v6.17,
Note, I've included an immutable shared tag of reset-binding
in this PR.

  Thanks

Yixun Lan

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://github.com/spacemit-com/linux spacemit-dt-for-6.17-1

for you to fetch changes up to 57fa4ba6d0a4669fd8f2557e760442d684374f3c:

  riscv: dts: spacemit: Move eMMC under storage-bus for K1 (2025-07-09 13:49:27 +0800)

----------------------------------------------------------------
RISC-V SpacemiT DT changes for 6.17

- Add DMA translation buses
- Add PWM support
- Add Reset support
- Add eMMC node

----------------------------------------------------------------
Alex Elder (2):
      dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
      riscv: dts: spacemit: add reset support for the K1 SoC

Guodong Xu (2):
      riscv: dts: spacemit: add PWM support for K1 SoC
      riscv: dts: spacemit: add pwm14_1 pinctrl setting

Vivian Wang (3):
      riscv: dts: spacemit: Add DMA translation buses for K1
      riscv: dts: spacemit: Move UARTs under dma-bus for K1
      riscv: dts: spacemit: Move eMMC under storage-bus for K1

Yixun Lan (2):
      riscv: dts: spacemit: enable eMMC for K1 SoC
      Merge tag 'spacemit-reset-binding-for-6.17-1' of https://github.com/spacemit-com/linux

 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |  27 +-
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  10 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |   8 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               | 485 ++++++++++++++++-----
 include/dt-bindings/clock/spacemit,k1-syscon.h     | 141 ++++++
 5 files changed, 558 insertions(+), 113 deletions(-)

