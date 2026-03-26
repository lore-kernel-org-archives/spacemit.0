Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD0639FCAD;
	Thu, 26 Mar 2026 18:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774550288; cv=none; b=flQn+dqWpUsvylLO7A/gcRNus80rqg47jEc1ug0srJsiikYXcghJ0zEwtscYo314BFqlV5uzbATJ7qQM0Vcqks2RCkwv00PgErwg/WfzLqLRr6aFZjQc2o1toMiG4IXOORxkanb4Y2SgICOQ8X2qhwr+nj/PfB/gZUqOoVkGBdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774550288; c=relaxed/simple;
	bh=Z5d+qisrCUqKR1bEaqfGKNaDzKxqIcu4biwQahRJmYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mdsbUH9DyvoenLcFn2fkinkV8U1f1ZGqmCNXkFt4dSh/w3sQhqc+rW8+PwixNLNcsxss30c0ed4c48uBwKKap07Gd8fYJ5C7yzAzvVmIXc+6qkmS4YmfVbzJ4xSWtVgD4TZKWaL5NzSDmBxTwoh2LY2J6/MX1YaPrAD93czqalE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=e9aQd6Dz; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="e9aQd6Dz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=+KcrpH8cwpBflE8VQsFexd/Z08Riudm3og8OXJwlHKs=; b=e9aQd6DzTfCmxNpweipgrREW1l
	0UXaQu4R9x8fFWKS1BIIj9CQfmi3R2KaM6qU+uFNDy19x8Vy1x6oL0psyhdicFnl4PetlH/rcGsd3
	5bbphhjJUniMorY84mibFyR94ezf6t/9lQknfVW/qwhnNlmBOxAFSYNCqp/LA0sH2KfChIgh7PwlO
	ddEsDQ8FI1qJApvR+vNh2nt0enzH5f+u+Bh+r8H1+LNBoQVqCDbkQdtGa5adIHd90dSxYxIxx8rom
	nk3Wr57Y36Mqc+/30tC7GcOyhLGL19i96tTrkjbBXGOxdUJCQw1BPkZlE92TXVy4Sp7z9mn7pOYLF
	5q1unowQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1w5pal-0000000GAjN-3tDk;
	Thu, 26 Mar 2026 19:38:03 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Javier Martinez Canillas <javierm@redhat.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v2 1/6] riscv: dts: spacemit: add LEDs for Milk-V Jupiter board
Date: Thu, 26 Mar 2026 19:35:29 +0100
Message-ID: <20260326183745.1370642-2-aurelien@aurel32.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260326183745.1370642-1-aurelien@aurel32.net>
References: <20260326183745.1370642-1-aurelien@aurel32.net>
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
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 .../boot/dts/spacemit/k1-milkv-jupiter.dts      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

v2:
 - Collect Reviewed-by:


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

