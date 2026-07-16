Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFA13C4544;
	Thu, 16 Jul 2026 21:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784237609; cv=none; b=q/BhXebZicQoE+72pz9LbLbcIV9Adwp030LQ4QMGP9GzPQisMK8IBFsjDfw0f8wOjs0mw9j+UZqjvTqWbM1ekEz948pNLLCRDD8ljAIGBnHAY9689DluWnyI+EkhYT4FIsi3oEEiLClD0o8Z361tH6VdntzmWpARtmHqW6Sm1pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784237609; c=relaxed/simple;
	bh=nh3IresRmlJc9BHXez0EQoTV179OC5kILjDNqhxVuLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DXsRMh49zXxYBqaA2Lf2L/jHI6/9olrMrZM6vw1gz9pH7yAGdva0PU4dQj+nOFIRLvcAzVk1rPU+60W7InFbK7FEipp8r/adGZ2Ak427UXGuzY2TVS92Wkc1TsTuuwdOZLT+ZGukwmmbgph0z9NI1j/LgNw1Ru6UC8iMhoTTM60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=WIWENEJS; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="WIWENEJS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=mHnVwT1+Yjvp5RDq89O4la0pgIctTbERsLfiIHJzr78=; b=WIWENEJS2xZmabuyDIQ10BBfHU
	dS4WI95fvyaDt/xnV9/tYsAMkDbJ+iIQ4p5Y4E2klY/HSBUWrwe3jPa+caKlTNkxbDb+YERO8CVNv
	JQ8Je6epXpvMhJqni1QfPyjegkpAd7H19MzD9PR8A/I35Og+ZVS45FXxIy4mKfQpHnXqUpN947oOA
	1K7Q9WNm+ATYmtlKaMNwte8XLP8JXvWH9V8Y2Wgl35aU8du/FuIs3xFM1uleIBmujDOWWs1R54tpE
	BfcE+NLnUktNe+UTLSVGHH/vavzfbfAvHoumVl0IqylC6xCsDRejy2FYLQgm8rfDBcWnuCDNGUoYj
	WhsjWklw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wkTht-00000003GYo-1BYn;
	Thu, 16 Jul 2026 23:33:25 +0200
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
Subject: [PATCH 2/4] riscv: dts: spacemit: k3: add rfkill node for Bluetooth on Pico-ITX board
Date: Thu, 16 Jul 2026 23:19:02 +0200
Message-ID: <20260716213314.3027969-3-aurelien@aurel32.net>
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

On the K3 PICO-ITX board, by default the GPIO pin that connects to the
RTL8852BE Bluetooth enable signal is driven low, resulting in
impossibility to use Bluetooth. Add a DT node to expose it as an RFKILL
device, which lets the Bluetooth driver or userspace toggle it as
required.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index 48b71cc419f09..4aa7d56fb7568 100644
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

