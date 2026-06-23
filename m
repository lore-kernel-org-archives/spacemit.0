Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6993A961B;
	Tue, 23 Jun 2026 20:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782247483; cv=none; b=f7KPlG12p5zNNdy8iUF4umbdIo58apD7h+le3llBqjpotB1Wyzzr2LCUaOMdWaXYY4ElQOHBri8/B6sRXNrksMd7i7nBahwZWN3U5s52X90HwqNkwDdfcGhUCbOf8Tj5HJCrsdHaQ0w5TSGcwEaCnjg3uC024jm7bkqE3Y4f2TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782247483; c=relaxed/simple;
	bh=tpGkdig1nv3t46AahgU+hZ48hExZdebk+oPkQHbPTXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rh+NfPS/+c/k5KvFE4ho0t8BGGNSphZiDf7bPMBKJru++JB1ofT4R0ashWE9GMyJ/CjY6HKmKk2l9lI7oCrLLQ5Nh3LykvXfM1Px8RDZNWazcC6WoHWxPwkbu25rG2+CrdpAtW4aAJf12DmDHcSSDCX8k4tOCIIqhu2x4JFNobM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=utlWv3+E; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="utlWv3+E"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=OmX4eD9vf59jP6Lq5Q979aBQWLB/rxIvO8yHZPRXNAc=; b=utlWv3+E4QgEBEnUcMNJ0PMSaE
	lRpVtZYN9fSXDqa3naRS5+Hm1GU3WkC6XGthtauHUZb3XUIFl628ElmAoPpuUK/4VIF3ibdcOsAgH
	NrB2nnJxCkawMsnGB/kWXFV+fwO9eYlqx8C9Pp1tm94gbymDMe1bgH9kEEPnzfVtwzvN0Li4dg0PJ
	7vPJBdb/UUJCgas7BVh2Nn7xuxT0On55pwHcQikzY9/mTHESdD0VnJNOn/e24wVysaSHdh3cvSQiT
	WKBsj9yLHqYmL4xxMf9GXvlhKk24BzwUCVMOae6rr3O//5ZFP1aF2Jh5S4CY2KAP9noq6RJ89atlw
	+e/Ko72Q==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wc7z5-00000004gPN-0wSy;
	Tue, 23 Jun 2026 22:44:39 +0200
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
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v2 5/5] riscv: dts: spacemit: improve RTL8211F PHY configuration on K3 Pico-ITX board
Date: Tue, 23 Jun 2026 22:43:49 +0200
Message-ID: <20260623204431.498700-6-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623204431.498700-1-aurelien@aurel32.net>
References: <20260623204431.498700-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Vendor kernel enabled ALDPS (Advanced Link Down Power Saving) on the
RTL8211F PHY to save power when link down.

Vendor kernel also disabled the 125MHz clkout clock signal, and indeed
the schematics confirms that it only goes to a test point (TP14), so
let's do the same.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index bf64b6c6f867f..e12d798b48a49 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -234,6 +234,8 @@ phy0: phy@1 {
 			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <10000>;
+			realtek,aldps-enable;
+			realtek,clkout-disable;
 		};
 	};
 };
-- 
2.53.0

