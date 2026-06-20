Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029F6374A03;
	Sat, 20 Jun 2026 06:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781938265; cv=none; b=nYDwCNZQbvBu+GEFLozoi/FAgq0jesQuYJpDsmgMGLKbX5H7Y2qlbYyFoW4zwJHSpgF/HYNL4YXrBTUkahG5kPwF0+5Y1v7mTaTJBPAomZCx0hDToekfQBN9cxVSiLo3BOikIpJNXjiRwoq8pzmVlE1Kq2IBzq9GdkhAGlVXlIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781938265; c=relaxed/simple;
	bh=tpGkdig1nv3t46AahgU+hZ48hExZdebk+oPkQHbPTXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qBgqVc+RItUQ1gbLge5rhUXGTxxbttiGmSYnxzbpJJJnfYJwNA0g0NIQq6JebLqH9iKuWl3qDiT1XeKaen/xSYXoWkENdxPBYjbfiSpQj1ztZROnyYFqugIuvdv/NcsesYrfMP4prRdQDowj1pVB3iqkvdfGbZcQcXrwxXa+Is0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=D5V0pxww; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="D5V0pxww"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=OmX4eD9vf59jP6Lq5Q979aBQWLB/rxIvO8yHZPRXNAc=; b=D5V0pxww8KL6qL9RNHMebLabQx
	/SmftApCtfC7zXo1feF3C+nnOE10bIbWBoqgknPwoXqIB5CvicJcLjFAihdlEyICONBQBIM2QkrMv
	K7aVuhRldjFbbfsyGYoji238onVBKUFicKUNUDRwZQot/pL5loQy80l7YMADxRnJkMI8es8kz4sj8
	3L8lgGigvfO1b/cOHXrHd+6qDUiilL9MA56R0Svls3RmUS+rN8jlRF+jwYMiPLq0Ciqe3kTiVqtuW
	GnNFk+w7hhATxQ7jZh7bJXqmlo/nW1OcfRcIAYBmxYLcpPd2Enno6VSQ3MBmvkLLb49/KxZo/ha28
	iSi84aNQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wap6U-000000006e1-1LqJ;
	Sat, 20 Jun 2026 08:22:54 +0200
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
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 5/5] riscv: dts: spacemit: improve RTL8211F PHY configuration on K3 Pico-ITX board
Date: Sat, 20 Jun 2026 08:22:06 +0200
Message-ID: <20260620062238.3199108-6-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260620062238.3199108-1-aurelien@aurel32.net>
References: <20260620062238.3199108-1-aurelien@aurel32.net>
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

