Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F274D374A00;
	Sat, 20 Jun 2026 06:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781938268; cv=none; b=S2M+s9EXDVvub5lQEznRksD9i5VqFkgduj9eo0nxYYvJSTsqSp4yr4lzSqUIaMPeNz7FHkCyaq352FXN+l8ThNG1y/IGToEwj3TO58kqVh8EOOJ9Uz+Ov/jM/R7k3EzG/F7bjPV3u9SoDOCc395VapKQZlXKTyJ8I4FBRBdWeZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781938268; c=relaxed/simple;
	bh=cEKoKdbZa2SMV371gozYng1LrdFa/3eXYvX78DYwhec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ooarloH5gqPx0gyQOpnTX28QGtYOQDTDbJmRLm4v6uYIdU1nFUJKTW558MW8fOGOLEpIF5S29G5YCSdiUSMM/okyz7u+rvqYI+ALb6mo35hlywq+dR40iCe5TvhIxRhIT5PvxaMnMuTVmHVTWp+a8ZeTRmOBP2hCVLtxvoCUSg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=XZhSZjvf; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="XZhSZjvf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=XIdL+BJQ2jNkAZTpAx/T9YMOki3iaRJKj0STU1kPQPs=; b=XZhSZjvfzJTI9s7NHrtmudqHsE
	i4A+j2mlUAoDcaQOpbcsTi/KdvEhYUuhwfjWFpT11I+oNIk3MZhPrmwf7vckHQnU4BqodDVCNBt1Q
	jZFNC/dKtrn+01jqOx8r/6SJM0rMOXASFah1lAggTHDz9HhFl3QNqD5ao3oRWlvLG7mKaWVwfPmGt
	b31X7B0NRV8nDZGm6vvUziwYgrhDTotmgLbjoSp85m+hDX2kp62UX5IfELAsRWBokP33Yh/p4e/Du
	vETd3lJo3eDGW+b5e462sHyUg9NIy9w9VZM5jrlvT/s6yRT4GWssO0dG2krBH3kBSeEzyw3h24yk6
	XTV3Pcgw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wap6P-000000006dC-3mPM;
	Sat, 20 Jun 2026 08:22:49 +0200
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
Subject: [PATCH 0/5] riscv: dts: spacemit: serial/i2c/ethernet improvements for the K3 Pico-ITX board 
Date: Sat, 20 Jun 2026 08:22:01 +0200
Message-ID: <20260620062238.3199108-1-aurelien@aurel32.net>
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

