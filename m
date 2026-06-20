Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF846374A03;
	Sat, 20 Jun 2026 06:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781938274; cv=none; b=In+S+Mz02fYd/i6HS4EHpG+c0LO0tlFsE8vm1Kj9XJP6X5NDJd39MzqFTclgo6KL0AHMTgvizs2bsLmjF8aOL3UrwETg/SJDKT65u2NFIcILkEoAs91CHZIIvzJSj4IEAQt+z4f+J8yxgneYezpyDpjk9kzj+pkiOEkNyv8SztU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781938274; c=relaxed/simple;
	bh=VGP19Vy4Qqe3oYTM+IzdvTuhxv78jC4hx+lrVfuKK3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bSlKD0tH6N5gfR+fJ+Yp8Ydpha23px2mqNLN0W+sdQAIADnmMRUruFw95kLzvQmLkjOzOJbZ8M3NjuTbMk9gYNOKMdhsitkpeq5S+tw7nTZUUPIWktrO/LBYsy/9j8W1mA02XvLMWBkZud0QvJe+mw07IveNaO07qAKUrYDJ70g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=u1RDWcrK; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="u1RDWcrK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=Z782Pfe1Kf4eZ9GkQdSKkYALzPrTWhUboPjR6Ug9LSs=; b=u1RDWcrKi5sq21+gmqeDEGO0+p
	DhNA1+TQUNlUrprl2nt5tALVv5ykLBhS+fkAzIrxO1Ck7PXx050hDK6ODtxlyQnr8Z9iLLoPJPSq8
	icrDzDrFCED8gYYfs8u5Q/rq6O9mFPRroYGd7vsnWBZnHYm3z1pLgq+j0bF4Oz2bJQew9kocKXV16
	zgctLiSmq2NY5ACSjLVAyNpkd6xWhsI4JY98XDNLVRufuJyyyNlBdRfZoT34BUFiuMW5tMrnpflyL
	jQueh9d4E8CpvctLEsHylSsKvuF9bqb67ejhPlZQTY7bYU9pvANzBBbdzXEtytslWNlKaW58mwCm/
	0YJA38eA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wap6T-000000006dZ-0qwP;
	Sat, 20 Jun 2026 08:22:53 +0200
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
Subject: [PATCH 2/5] riscv: dts: spacemit: enable the i2c2 adapter on K3 Pico-ITX board
Date: Sat, 20 Jun 2026 08:22:03 +0200
Message-ID: <20260620062238.3199108-3-aurelien@aurel32.net>
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

Define I2C2 pinctrl properties, and enable it on the K3 Pico-ITX board.
It will be used by the 24c02 eeprom.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  6 ++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 11 +++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index 509cebc0c9568..5fe9041ec5702 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -43,6 +43,12 @@ reg_aux_vcc5v: regulator-aux-vcc5v {
 	};
 };
 
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_1_cfg>;
+	status = "okay";
+};
+
 &i2c8 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c8_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 3ee1471f37985..2017aa14fb424 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -78,6 +78,17 @@ gmac1-phy-0-pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	i2c2_1_cfg: i2c2-1-cfg {
+		i2c2-0-pins {
+			pinmux = <K3_PADCONF(46, 5)>,	/* i2c2 scl */
+				 <K3_PADCONF(47, 5)>;	/* i2c2 sda */
+
+			bias-pull-up= <0>;
+			drive-strength = <25>;
+		};
+	};
+
 	/omit-if-no-ref/
 	i2c8_cfg: i2c8-cfg {
 		i2c8-pins {
-- 
2.53.0

