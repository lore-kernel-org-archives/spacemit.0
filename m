Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95FE35E943;
	Wed, 29 Jul 2026 17:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785345901; cv=none; b=fZAIYsmfbPbtgKGAv13B4UlgPEvG2/a93swpAqK1mJUm5McbdUfworeVezL/M644IYT8Yxk+1ZAMKZfIWlLuP1fPlUGGFmkLD7yXn8gTHK3K1KrBmiZj6AB6YTMvVHp4Oijy42wN1z7a/hW74kO+QQyx13uLLBr8zB56N4qrtmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785345901; c=relaxed/simple;
	bh=BrClL9Ilw4pvXsEwX6wcHnfDlKkZi0Pw0A6l6Xpd3F4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=urmiA3yNPBS8ap44fj2wuM2pL3E+UUHhqJ2Bp7oQHDtELr1rAyxhieMfPdXLXwMx3PKK5aEJhv0nsr7bp2XIQYzfmi0D9muJ57R9o6BPHOf0BNE0vcn/0kyE5mIRt/enVDupypGXatO2yrCMsKcIUd0Mih3PeAEFDxPk2ks4of8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=RcbXGPcq; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="RcbXGPcq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=5WSjlBAuSdaaHUNo5sujBqKXsLkR6III6zY1OEFMXJg=; b=RcbXGPcqA1q2fqzk0DLsRQq4g7
	QW1WeMJ7J6MLAt01dG+nz6zbCuRBaBU3NpnWwpwqBKwP4DxyruG87Xla6DL6bBfdqK4l/kQIeXd5x
	GvqPKX1YEnfGbJ9cdpTjfIHpVsl7S6i9UQDC3gmdiF0k+sfgidhRRG4plVCcJrCULaKxIWQ4Dtnnx
	D36S8ZgchKVAhtqrSRMM60mYPRspNNjET0rKnSIfnrvQChCKZy7odJoSGBhhXlxU2pr+bAKGKKZ3N
	it/l2YkWiqRM3PFuuypGC0AGwzZRS2TKy+SgniuZR3K+Z3zt4s7rhaXMVEx04+5IM1CfuboFfpPI4
	xkt8qchw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wp81Z-00000002mXC-3eOc;
	Wed, 29 Jul 2026 19:24:57 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v2 4/4] riscv: dts: spacemit: k3: add rfkill node for WLAN
Date: Wed, 29 Jul 2026 19:20:26 +0200
Message-ID: <20260729172450.1660418-5-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260729172450.1660418-1-aurelien@aurel32.net>
References: <20260729172450.1660418-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By default the GPIO pin that connects to the RTL8852BE WLAN enable
signal is driven low, resulting in impossibility to connect to any
network. Add a DT node to expose it as an RFKILL device, which lets the
WiFi driver or userspace toggle it as required.

Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index 37d3422af32ac..d1e53cfbc9030 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -44,6 +44,13 @@ reg_aux_vcc5v: regulator-aux-vcc5v {
 		regulator-always-on;
 	};
 
+	rfkill-pcie-wlan {
+		compatible = "rfkill-gpio";
+		label = "rfkill-pcie-wlan";
+		radio-type = "wlan";
+		shutdown-gpios = <&gpio 1 3 GPIO_ACTIVE_HIGH>;
+	};
+
 	rfkill-usb-bt {
 		compatible = "rfkill-gpio";
 		label = "rfkill-usb-bt";
-- 
2.53.0

