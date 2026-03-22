Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B073161A2;
	Sun, 22 Mar 2026 20:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774211123; cv=none; b=d1BO1sK6W6M6P4IntQb/CclUjGhGmL2swOQCDESnxCsKzzSBxKBs7otwhIC9yThbdriH+ms0RGUupmxlt2h9a13gJQ4gLZpbMqoX0tzdUTd0/1z7SINZWWTSvCLpdsej0KpYv4Wn1j1B2SzUI2eNVLgkqXtU/NLtappqJwrHkkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774211123; c=relaxed/simple;
	bh=pE0vwXnuP+XgN6SLgExPSVUzCS7wxrj7ZmWthfigl6g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=imGlWBRlH+f0qB2oUf5/LEc0srtlFD/UHrHZK5CEQsnpeJno8+SyD5V4+ToDdYs9QMpjkOy93EjXHATXgiDy8kq0p+eS4WncDuR210PKHFkC8uWCGR1G2tMeRwKMo5GHWMF8zQPbKiySeF33YdUtsK/1fa6gGKHfhibPrfOPfmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=EceHX5FB; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="EceHX5FB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=bHa+8TMPMx1ILvk4E2TqNsND9CWODuS5VukkZ3jetbc=; b=EceHX5FBf1yLcFaOvIaQUrj8mf
	LhUzcvUNoXEQRJYJhMi34WbFglOds//tWPthVD1OVHe7/tc1pXDMAK1GO6BsQ2QQnw3Du67YGKPkf
	PRbSe2h0GACXQZlS/nvtzx+5pw0RYAfgocxGrKoyMGfL+FcS++J26r6xbUm32txJdJbCNCxEwzPOd
	Cwx39wOFcxNSHDrqZYy8yEcL2NJ3lMBVdPgFC+H6PyfyKVXOYsVQGpn73rRR+Fjpxwidjba89hS2b
	xV1VTH1Zk8UgaMlXR7xYuPrAOJp31Oe+0+kfqi+wtlEvFojwZY+O3R0F1U+h6l/BjIuiVoyS9ChiO
	6cLHqLLQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1w4PMF-0000000AsAG-1Ndu;
	Sun, 22 Mar 2026 21:25:11 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Alex Elder <elder@riscstar.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH] riscv: dts: spacemit: drop incorrect pinctrl for combo PHY
Date: Sun, 22 Mar 2026 21:25:01 +0100
Message-ID: <20260322202502.2205755-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The combo PHY on the Banana Pi F3 is used for the USB 3.0 port. The high
speed differential lanes are always configured as such, and do not
require a pinctrl entry.

The existing pinctrl entry only configures PCIe secondary pins, which
are unused for USB and instead routed to the MIPI CSI1 connector.

Remove this incorrect pinctrl entry.

Fixes: 0be016a4b5d1b9 ("riscv: dts: spacemit: PCIe and PHY-related updates")
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 404b69c47b91f..5790d927b93db 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -81,8 +81,6 @@ usb3_hub_5v: regulator-usb3-hub-5v {
 };
 
 &combo_phy {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pcie0_3_cfg>;
 	status = "okay";
 };
 
-- 
2.51.0

