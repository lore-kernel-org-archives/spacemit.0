Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601453A6412;
	Tue, 23 Jun 2026 20:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782247479; cv=none; b=KFGgtyDU8Zixz2MCphCTG+OOlUT6Lu2R7fTJtpBIS6GQc0oVCqnhI3USt1TjY4G5S3V74Wz0CxOoaoLwOh+TGslTGIvUzZD7800J3jSkAK7Bf2yfa3iF/lASmLTFeHMv/u2h6+8ub84jN/NGDek71JisC4ao8D8U3O19zYKXNeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782247479; c=relaxed/simple;
	bh=exgbPtFXDdo1B6/9EkQErALBXB3ckMe1TphFNf+owUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uYeYkHAIK8nb0Di5Mo8iOYvPDV8znb7utAymAcZET1Q23D/DxZLxFvkVUzMvSk7+Nr3v0MPq4u2jTtFgucjisvHEVZ5I1/jWJ4pW+y9thMWwvnLK+XLeMbeZ2vhKiFsYRDd5qMzDfHs2Ch5S8/b1kOQObRzoTMf02sSTaax9t3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=uOKtkpL/; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="uOKtkpL/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=sPfOqSYyMVD1TmzxQ73e7MiEPFlzK+Ib0h5frVxP2Dw=; b=uOKtkpL/8A5MfofAaozYgH6Nwf
	mEcCVrLnQmyMzYD+xKEDNG/x+ZKeNN/nxK0zT2SF0SDJjm8nMLQUBvqMlW1bGPxGa4uI/sHVaR9aC
	JR4XMY6JleIlKSbkg36OgSMgcdWwmPc43+niCrpdMRbQqMTcTLJ0vziahQdFtvC0Dfwbp2o3JqjqL
	qZRrNAaVE4i6bYOXB18fwLddVGmVjWYOXm3p1VlAOwXzZbwDx2c07kF+LiyTTg1TFGVcQoFcH9k/s
	t4ljDcn6Ae4hT0pbHlNCJEUaXMoecR0wvzEI0VfMCqN2D6/Qan1IEVlVM2m2GKqGk5sH9PRV3h8zr
	GZ5txDyA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wc7z2-00000004gOQ-2amK;
	Tue, 23 Jun 2026 22:44:36 +0200
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
Subject: [PATCH v2 0/5] riscv: dts: spacemit: serial/i2c/ethernet improvements for the K3 Pico-ITX board
Date: Tue, 23 Jun 2026 22:43:44 +0200
Message-ID: <20260623204431.498700-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series tries to improve the K3 Pico-ITX board DTS by configuring the
default baud rate for the serial port, enabling the 24c02 eeprom on i2c2,
adding aliases for i2c2 and i2c8 ports, and enabling power saving features on
the RTL8211F PHY.

Changes in v2:
- Collect Reviewed-by tag
- Fix issues reported by Sashiko AI in patch 2
- Link to v1: https://lore.kernel.org/linux-riscv/20260620062238.3199108-1-aurelien@aurel32.net


Aurelien Jarno (5):
  riscv: dts: spacemit: set console baud rate on K3 Pico-ITX board
  riscv: dts: spacemit: enable the i2c2 adapter on K3 Pico-ITX board
  riscv: dts: spacemit: add 24c02 eeprom on K3 Pico-ITX board
  riscv: dts: spacemit: add i2c aliases on K3 Pico-ITX board
  riscv: dts: spacemit: improve RTL8211F PHY configuration on K3
    Pico-ITX board

 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 42 +++++++++++++++++++-
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 11 +++++
 2 files changed, 52 insertions(+), 1 deletion(-)

-- 
2.53.0

