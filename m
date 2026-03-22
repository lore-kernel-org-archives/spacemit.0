Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C369D342CBD;
	Sun, 22 Mar 2026 20:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774211653; cv=none; b=PLGoSLRWM9IvJQpIowdPQdqEYRGwnVzfq5F1VuRS3jvqXxXlUIRUAAh8cPOvk/xN/tg5C50/i22YqJHGGV4/QBV2TuqjV1+l3y09ZLLw/FogMMNSJqW8M5RvzYZykScOwKfwLPvGM2DRRb057VcEIfwLeb9kmWPEt6ssW7OIo0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774211653; c=relaxed/simple;
	bh=OAItUeG74ahjjo8oZd4VgZvypGJC9+n6qB6wy8O2X+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b9DZvXQvp+Xo5i619T5WiBPQTrmkoUOiYnEL9nt0j8lTmiWUm6FyRtTOsoQAYQN+ppjGAM2rXGzDoeDAKfrALBB+7s/mPx3ctez4TGPx0HxoE042J8JkLr2RWS0KksWJ5+o3VDIT/cP58D1ElrZNCXUG1mM+t5DB1qHG7s9Fxc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=aTGTYXfS; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="aTGTYXfS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=75/9iWxl7mUOFlOK6TjH/8LkMUC/M5zfIetQ2CUajbA=; b=aTGTYXfSGi5/5xOWV/cO3ElCTg
	BXmvv9rv4KyjM1RB4tf6B3mF0Mce5Ijk7/NHlis4mtU/H4fqnX1WDyR8DK28JrF2zIwlzge+wUI5X
	EbKQn75UfvlUh7VbbY/wlNtgmWHc6hLpMbKDmUg3xnFbxpcSTUUlodPnkZkPNQEMIlM474ppmkLvM
	jJ7QzIdLl+QbF7WufrfsSqaXeOgDtlZHDJbBAZR0JDpJU8AHWbGulMlILX5qH3QM/VL/OwNvSsCmh
	AtrgG6LVpGTYi1EnBnT7cgVJQ4XlT1qxBllu+cjeBELlBDR/WlPxaaXDI/WoDePHFpYtmhCrxm5Pq
	Z5XcAltA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1w4PUv-0000000Ase5-46Kd;
	Sun, 22 Mar 2026 21:34:09 +0100
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
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 1/6] riscv: dts: spacemit: add LEDs for Milk-V Jupiter board
Date: Sun, 22 Mar 2026 21:28:32 +0100
Message-ID: <20260322203356.2206927-2-aurelien@aurel32.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260322203356.2206927-1-aurelien@aurel32.net>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Milk-V Jupiter board provides support for two LEDs through the front
panel header. The "Power LED" indicates the system is running, and the
"HDD LED" shows disk activity. Configure the corresponding LED triggers
accordingly.

Caveats:
- The LEDs are driven through a 4.7k series resistor, making them
  quite faint.
- The disk activity trigger requires a storage controller on the M.2 or
  PCIe interface. That said, it matches the purpose and the vendor
  kernel.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 .../boot/dts/spacemit/k1-milkv-jupiter.dts      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 9959c8023ece0..3cd83c5924e4f 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -21,6 +21,23 @@ chosen {
 		stdout-path = "serial0";
 	};
 
+	leds {
+		compatible = "gpio-leds";
+
+		led1 {
+			label = "pwr-led";
+			gpios = <&gpio K1_GPIO(96) GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "default-on";
+			default-state = "on";
+		};
+
+		led2 {
+			label = "hdd-led";
+			gpios = <&gpio K1_GPIO(92) GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "disk-activity";
+		};
+	};
+
 	reg_dc_in: regulator-dc-in-12v {
 		compatible = "regulator-fixed";
 		regulator-name = "dc_in_12v";
-- 
2.51.0

