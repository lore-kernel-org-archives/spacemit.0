Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0360D2594
	for <spacemit@lists.linux.dev>; Wed, 12 Mar 2025 00:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741739437; cv=none; b=qavthhfh/cfj1M0by9d3SzyY4BRQjk/24QM54LA7vVuA7paQLhCcKLrMx2xt0jWIfCbuFeX/G45bcyhxGWXDUYtLqqDa7bBxK9I0l4bVOF0wvKNhPXN3N7rlWQrJIg6e1G6egLpYxekz/dCrShfc43OQ+7+ini7lQg53QFPuFIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741739437; c=relaxed/simple;
	bh=cXzXgxJw4BfZbHJoxbEuCD45od5Yh7nLFzCNoRlhu/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VbVGvdg0FKTyM2n1AQF+wnw1mkrtrfm6cQka9dBRITGVRGIbQTC3ffpoha4IcON8WMKAQ5HYY1o+RmAuSxtIwkJNtp7cwK3E3101eUsfXOQlxaQAcJg+nN8BkUdrlvOLs6iwKxISdgfjGHa4jDKwwAsBQiiAHBPEEVwtULQpccA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BAC8534313D;
	Wed, 12 Mar 2025 00:30:33 +0000 (UTC)
Date: Wed, 12 Mar 2025 00:30:23 +0000
From: Yixun Lan <dlan@gentoo.org>
To: soc@kernel.org
Cc: Conor Dooley <conor@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	spacemit@lists.linux.dev
Subject: [GIT PULL] RISC-V SpacemiT Devicetrees for v6.15
Message-ID: <20250312003023-GYA76989@gentoo>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd:

Here is SpacemiT's device tree changes for v6.15, thanks


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://github.com/spacemit-com/linux tags/spacemit-dt-for-6.15-1

for you to fetch changes up to 5b90a3d6092d9292d3c4fe4eef8969282e070ae3:

  riscv: dts: spacemit: Add Milk-V Jupiter board device tree (2025-02-17 21:11:50 +0800)

----------------------------------------------------------------
RISC-V SpacemiT DT changes for 6.15

- Add Milk-V Jupiter board
- MAINTAINERS info

----------------------------------------------------------------
Javier Martinez Canillas (2):
      dt-bindings: riscv: spacemit: Add Milk-V Jupiter board compatible
      riscv: dts: spacemit: Add Milk-V Jupiter board device tree

Yixun Lan (1):
      MAINTAINERS: spacemit: update various info

 .../devicetree/bindings/riscv/spacemit.yaml        |  1 +
 MAINTAINERS                                        |  3 +++
 arch/riscv/boot/dts/spacemit/Makefile              |  1 +
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts  | 27 ++++++++++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55
