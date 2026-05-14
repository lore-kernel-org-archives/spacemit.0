Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3813F3264ED;
	Thu, 14 May 2026 16:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778774677; cv=none; b=WW/YySavGlLbLRonWzHcJrMWqBHSYniHSKnEIvzV6GtizAaHEk7xMz9MVYILe2XRDatpBPtPoJBDtrSyeSG3kOd4/TIeNPI4xFNgf7ObcaPFWg/AsF7c+l/lgABDcF5T4mdoRpnSJZoZ07tCv+vG9qMkhm+EAQex/ZLG3nCjjig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778774677; c=relaxed/simple;
	bh=eu3v3I361q2EV1iS1kJRe54qVoxVJi+BB6/PgoCfGkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uuWLEikwGkRnkhbLK/CzbVbue79RHy7RCmDl+Krk5Lz6s/PvGgVE0GPzN0y0uflhxnbKvrhOyyBt4H9taB0NbhHY9rmz7ZcE8HsUN8LkanQGuLUeqv9LPl7n2OwWChJQdy1URSmRb2+FXBBDG1oxK/dYfgEUCepnFZjowvV794M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=DT70ziJu; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="DT70ziJu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=sqRxMWMXlSnZN0jD0+5LubNrtpBuXqfyan8I6F7qG0c=; b=DT70ziJu/3UUj2Pji9ORK5HhLG
	bAhTe0+36Ce0cTWrZ28/9ufa/TftuKG9moM/2IO25vBVgzLwNKPuQ44IjxWYlHBzDpFzarCsol3TH
	BuQm0mJzZ/jpuH+hd32eWhQi/go0cWbEOfaScObYd8jnKiurL/cRh22OcgNIPU43vDmKi6PPy6oxj
	wGXr/5LzMY7ydU4mEMDG3mvJWICwK8fKKjIbKyfa3XFz4bufQO2ZwrYaMIaLZABWt4FxnMQGuy4df
	UsNX3WF0FAhFZjOhpHkp6aTr6upPxaAHwpGBUsiAZqmOpHCgKMAi6WhWd31SS2qwyHGHUlqdvQDaT
	JQInceTg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wNYXy-00000007W2C-0qnA;
	Thu, 14 May 2026 18:04:26 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Javier Martinez Canillas <javierm@redhat.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 1/4] riscv: dts: spacemit: set console baud rate on Milk-V Jupiter
Date: Thu, 14 May 2026 17:56:21 +0200
Message-ID: <20260514160356.1642075-2-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260514160356.1642075-1-aurelien@aurel32.net>
References: <20260514160356.1642075-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Because the default console's baud rate is not set, defconfig kernels do
not have any serial output on this platform. Set the baud rate to
115200, matching what is used by U-Boot etc on this platform.

See-also: 24c12ca43b12c ("dts: spacemit: set console baud rate on bpif3")
Fixes: 5b90a3d6092d9 ("riscv: dts: spacemit: Add Milk-V Jupiter board device tree")
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 95c35154da96d..9b1dfddf2bac5 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -21,7 +21,7 @@ aliases {
 	};
 
 	chosen {
-		stdout-path = "serial0";
+		stdout-path = "serial0:115200n8";
 	};
 
 	leds {
-- 
2.53.0

