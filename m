Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58B73C4B88;
	Thu, 16 Jul 2026 21:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784237610; cv=none; b=CE+zn43my8EagwR2ACe0vnd6eJcTw6vNI4GSj97E/lLP5VYUsDzo8ZO3wqHH0Ym73mVmqhWUEc7cNKICXjCw/mi3a3FkQmNoyzVymJxsMXe8j0Ez/UZs0ynholE2WyHS+PI+ZcSRh8dH7Yt1qrOMPRUxtunYGOD4FYwBBWFA3n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784237610; c=relaxed/simple;
	bh=ixwmN7ApwaZCwKdEvBhJMTs1Wg9gnmqMTRbrnyQ92P8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CyYR5VMksr6QaxW9tBXWWbxWnizY5TzKvQY8mk2GieWECv9GJYuJI1Fzi+/Zl2GgJjtTwgWKgFfZ0II1Gd/SpCYIHCHGqb9Zig9ehfYnKK2+6iFGSNrENX1+TTSfaVnQt0JFKECkETnUpxWHUY8cqWY7K7vlUcI8kr1CHOpng20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=wiWyipM/; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="wiWyipM/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=w20tFWjgl7SpbISkFY39+gk/LQYyndb7IGAWxD+7QfM=; b=wiWyipM/QjvIzgDdjiDYPAGepM
	KnUTcKBBfBW9lQ4tPzBG7wc3GqcTWNUhAmM4nPoToxEYpGBpiGqOnuTlXo9AbJVry2Q0o/pJBGrI9
	SXyac/e0i5y/jf5APjVm9nThQWzVv0QjQkQvaqSjS2XsYtMGry5eyiiYzhrwN5HT6gV1puKZLzSZ/
	irIUdeo40Zt9/MAJ5W4IBb0v289S17O3pW0AWjsIaovvHcEGmNmCzo/miRCcYBLywgTnTeflhSgfm
	XsTXdoLCTdD9qqxcPRdPU/lwsZbxSzFU3tnayiaMtL5PX6NYYm8CRyKXDfcYetvSY91QOvYJoM1wu
	nCieDbmQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wkThu-00000003GZK-1Wew;
	Thu, 16 Jul 2026 23:33:26 +0200
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
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 4/4] riscv: dts: spacemit: k3: add rfkill node for WLAN on Pico-ITX board
Date: Thu, 16 Jul 2026 23:19:04 +0200
Message-ID: <20260716213314.3027969-5-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260716213314.3027969-1-aurelien@aurel32.net>
References: <20260716213314.3027969-1-aurelien@aurel32.net>
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

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index 011a35e6372e1..328f4c2cd7e14 100644
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

