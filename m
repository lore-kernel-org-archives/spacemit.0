Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA9033E347;
	Wed, 29 Jul 2026 17:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785345900; cv=none; b=J39HC0A0lco+YJgaegtFADHeYuyXEIeLE2tc9Lt+6rSy/z3k8XObOgLAmqdTZiUdSiPS2Bwm+4ILDVAkvruMZRa6+44lV8OpjhtBLRmnxvWleDYNif6LUdUHtjxTiHpRwHfORbsbw87FgpFNoQw3bQS+DRqxogS/agjdoKgOtPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785345900; c=relaxed/simple;
	bh=J8DrAfYaSl05tHGD5Larfhkjwwzkld/8TOEJbWhbVsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sz91s1qcP7/hHIkPu6qT14/JHEbCbkjSaWr9yHBGdm1Yhh3+FH3zYJOZ0tJhBcz431byUHMwEehZHw5SMoTmNW5O0ALHFMr83XKf0TpVPTtU61E0XuKpq6KVAr6gXpVuxUip/O07D1fhAbhOqePRHaPQPdjoxY14Bq7s+wMihDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=o1LheW/o; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="o1LheW/o"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=AzWGzek/aSIB+x29RlAdvLRQenRGSkh0b2C62hhPO2k=; b=o1LheW/oBgdjjxMHZX7ACtSa4G
	alBOFQaqPKsT/i4Iznn3Ifn6bP7RaUuMyeJFcFLUQvdWHi8hRncQVo09gCTOAQG4iAKJjhfkXeT5F
	Zzmop/oOCFtl2M583a5s+LZHoyLqpilQWCxufMR6k68kHDsFJZPYxq8Tw9bZ15/c47DOyoB1S2IuM
	TC9ukQs1IcQyrH1oXix3/ID2/SOTID2XbxUXv3WwA3Vie5ucYOAG57FjXokPZ+zaIbY/zMByEIqdg
	VSpdMW1Fh5VrPdYV4uuU0I0TSPlId2E1VJHMFjcGVT0aMlb79E+FDN7VGs9B8FRkelD0qU3RrtacH
	hbjtRzAg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wp81Y-00000002mWk-1NL7;
	Wed, 29 Jul 2026 19:24:56 +0200
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
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v2 2/4] riscv: dts: spacemit: k3: add rfkill node for Bluetooth on Pico-ITX board
Date: Wed, 29 Jul 2026 19:20:24 +0200
Message-ID: <20260729172450.1660418-3-aurelien@aurel32.net>
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

On the K3 PICO-ITX board, by default the GPIO pin that connects to the
RTL8852BE Bluetooth enable signal is driven low, resulting in
impossibility to use Bluetooth. Add a DT node to expose it as an RFKILL
device, which lets the Bluetooth driver or userspace toggle it as
required.

Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b084a35aa00e3..6a60fae1f8b50 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -43,6 +43,13 @@ reg_aux_vcc5v: regulator-aux-vcc5v {
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
 	};
+
+	rfkill-usb-bt {
+		compatible = "rfkill-gpio";
+		label = "rfkill-usb-bt";
+		radio-type = "bluetooth";
+		shutdown-gpios = <&gpio 0 30 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &i2c2 {
-- 
2.53.0

