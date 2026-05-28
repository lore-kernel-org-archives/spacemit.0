Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFDE314B6D
	for <spacemit@lists.linux.dev>; Thu, 28 May 2026 05:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779945870; cv=pass; b=T81ddcxpvhqgcKKy637y5dWwoCfiEdpY/x01RbXMpJjhtUlDH9HsKeXEztJP2LyjJDV/Z7naf/WLuxFIQlsxBHUYjFxUfqFb538D+LuEQUzj5S+y7RUDdeZPPEAeyMjieoP3olTxTdoF/passHwR0+qHnPVSPHNcus038rPm43Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779945870; c=relaxed/simple;
	bh=rPbiI+ilu0sWLrlMfU9HzlanUD+8Jf5nKjJmEKXu0F8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YxQzPZ4VykWeO4POlVjDrsW2D5moILJz+CS9QmNk8FbLDcdQMFREgIaIT6mj5FOgaCv95eOh22pbG45xwru5oUn0aqGhU4dgt9AV2JM8pBLjMLDqidfbvip5jor59Danor4kG07uZ9H/2/CBA7iJkEvhZ2zA6r55CTfSrKpUYSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=A8087KU6; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="A8087KU6"
ARC-Seal: i=1; a=rsa-sha256; t=1779945861; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YYYg3rVkUnOtrn50Rjd8COGW0fIxQV75ZZiBpapTYp3HgJNzBFwLAjMX1hUP50k9kkwQInv+9nXcnxkKzLg1Xd/k4UCaGKtKGn4mS1slT6ibSzarjVJsB1O9wIiwmlbFg19sNUDyh8wkRnuHs9pNiEZ+nUZl8k9CiYN4yCIwe1M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779945861; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jnYH/T7uiauyZSq6GbAqeNmqIkQ5afnNxa3jXoVrECg=; 
	b=Hx+/enCh898s5FKmNVsvzN2MtrKGni3vIEuiMIRn0TdGdHFTS/7xcqqcXAQc15jMIlddPNUg0kgD2odXlf30BVyXoMXb5Z7H74ygrLW6eb2czJtZYFxL5a52hKwoIA4Ey0rzg3i+v/M4If2etXf1bZA97Me52IzFPdKFDE2Mfus=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779945861;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=jnYH/T7uiauyZSq6GbAqeNmqIkQ5afnNxa3jXoVrECg=;
	b=A8087KU6dDiLq+bIG8BbLHApZIwVr+vYo0nxcPHZ3KnGOntonRG4JXqJJIR3b/9Z
	GHZ/5L6h2G8hHVd7VH6aCpxBIsJxKvMoB03HFhFvkTWXPwqibSAV4cy2vQ1of2S28xE
	BYqB+sEsoVYu9AIWE0/0MZROQiIa0RcDBrh8NQjE=
Received: by mx.zohomail.com with SMTPS id 1779945859990355.3956654305638;
	Wed, 27 May 2026 22:24:19 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Thu, 28 May 2026 13:22:48 +0800
Subject: [PATCH v2 2/3] riscv: dts: spacemit: k1: Split gmac_clk_ref into
 independent pinctrl groups
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-bpi-cm6-v2-2-d0eb3f236cea@pigmoral.tech>
References: <20260528-bpi-cm6-v2-0-d0eb3f236cea@pigmoral.tech>
In-Reply-To: <20260528-bpi-cm6-v2-0-d0eb3f236cea@pigmoral.tech>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Paolo Abeni <pabeni@redhat.com>, 
 Guodong Xu <guodong@riscstar.com>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779945818; l=5834;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=rPbiI+ilu0sWLrlMfU9HzlanUD+8Jf5nKjJmEKXu0F8=;
 b=1mQYY2xTcO+DDWebUtj2X3kbiSMbJ9X2a3RloGTPAZTG8qLyeWVCIIl4zm26gSqEDvn2U9jdC
 sDGtBEWadDJBCXwhIwCesmOJbu6hbg8foG9n2AUzbrn9g4Em9kb/Vgg
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External

The gmac_clk_ref signal is optional for the GMAC controller and is not
strictly required for all hardware designs. The pins for gmac0_clk_ref
(GPIO 45) and gmac1_clk_ref (GPIO 46) may also be used as GPIOs for
other functions even when the Ethernet controller is active.

Split the refclk pins into independent pinctrl groups so boards can
request them only when the reference clock path is actually needed.

Among the already mainlined boards, BPI-F3, Jupiter and MusePi Pro have
optional hardware paths for the GMAC refclk pins. BPI-F3 and Jupiter
route both GMAC refclk pins to the PHYs through NC/0R option resistors,
while MusePi Pro only does so for GMAC0. Keep referencing the new
clk-ref pinctrl groups on these boards so the optional hardware paths
remain usable if the option resistors are populated.

OrangePi R2S has no publicly available schematic, so also keep the
clk-ref groups there to preserve the previous pinmux behavior.

Fixes: 60775f28cfb7 ("riscv: dts: spacemit: Add Ethernet support for K1")
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   |  4 ++--
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts |  4 ++--
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    |  2 +-
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  |  4 ++--
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi      | 24 +++++++++++++++++++----
 5 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 72f77e9edd63..e6ab43be301a 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -101,7 +101,7 @@ &eth0 {
 	phy-handle = <&rgmii0>;
 	phy-mode = "rgmii-id";
 	pinctrl-names = "default";
-	pinctrl-0 = <&gmac0_cfg>;
+	pinctrl-0 = <&gmac0_cfg>, <&gmac0_clk_ref_cfg>;
 	rx-internal-delay-ps = <0>;
 	tx-internal-delay-ps = <0>;
 	status = "okay";
@@ -124,7 +124,7 @@ &eth1 {
 	phy-handle = <&rgmii1>;
 	phy-mode = "rgmii-id";
 	pinctrl-names = "default";
-	pinctrl-0 = <&gmac1_cfg>;
+	pinctrl-0 = <&gmac1_cfg>, <&gmac1_clk_ref_cfg>;
 	rx-internal-delay-ps = <0>;
 	tx-internal-delay-ps = <250>;
 	status = "okay";
diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 2fc8d6533786..b61f5995ec77 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -121,7 +121,7 @@ &eth0 {
 	phy-handle = <&rgmii0>;
 	phy-mode = "rgmii-id";
 	pinctrl-names = "default";
-	pinctrl-0 = <&gmac0_cfg>;
+	pinctrl-0 = <&gmac0_cfg>, <&gmac0_clk_ref_cfg>;
 	rx-internal-delay-ps = <0>;
 	tx-internal-delay-ps = <0>;
 	status = "okay";
@@ -144,7 +144,7 @@ &eth1 {
 	phy-handle = <&rgmii1>;
 	phy-mode = "rgmii-id";
 	pinctrl-names = "default";
-	pinctrl-0 = <&gmac1_cfg>;
+	pinctrl-0 = <&gmac1_cfg>, <&gmac1_clk_ref_cfg>;
 	rx-internal-delay-ps = <0>;
 	tx-internal-delay-ps = <250>;
 	status = "okay";
diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 0d809e4ad3b1..3078ffb5cb87 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -102,7 +102,7 @@ &combo_phy {
 &eth0 {
 	phy-handle = <&rgmii0>;
 	phy-mode = "rgmii-id";
-	pinctrl-0 = <&gmac0_cfg>;
+	pinctrl-0 = <&gmac0_cfg>, <&gmac0_clk_ref_cfg>;
 	pinctrl-names = "default";
 	rx-internal-delay-ps = <0>;
 	tx-internal-delay-ps = <0>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
index 1ecc40749e5a..018072722d55 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
@@ -50,7 +50,7 @@ &eth0 {
 	phy-handle = <&rgmii0>;
 	phy-mode = "rgmii-id";
 	pinctrl-names = "default";
-	pinctrl-0 = <&gmac0_cfg>;
+	pinctrl-0 = <&gmac0_cfg>, <&gmac0_clk_ref_cfg>;
 	rx-internal-delay-ps = <0>;
 	tx-internal-delay-ps = <0>;
 	status = "okay";
@@ -74,7 +74,7 @@ &eth1 {
 	phy-handle = <&rgmii1>;
 	phy-mode = "rgmii-id";
 	pinctrl-names = "default";
-	pinctrl-0 = <&gmac1_cfg>;
+	pinctrl-0 = <&gmac1_cfg>, <&gmac1_clk_ref_cfg>;
 	rx-internal-delay-ps = <0>;
 	tx-internal-delay-ps = <250>;
 	status = "okay";
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 4e9a62d0e85b..8c57ca05dabd 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -27,8 +27,16 @@ gmac0-pins {
 				 <K1_PADCONF(11, 1)>,	/* gmac0_tx_en */
 				 <K1_PADCONF(12, 1)>,	/* gmac0_mdc */
 				 <K1_PADCONF(13, 1)>,	/* gmac0_mdio */
-				 <K1_PADCONF(14, 1)>,	/* gmac0_int_n */
-				 <K1_PADCONF(45, 1)>;	/* gmac0_clk_ref */
+				 <K1_PADCONF(14, 1)>;	/* gmac0_int_n */
+
+			bias-pull-up = <0>;
+			drive-strength = <21>;
+		};
+	};
+
+	gmac0_clk_ref_cfg: gmac0-clk-ref-cfg {
+		gmac0-clk-ref-pins {
+			pinmux = <K1_PADCONF(45, 1)>;	/* gmac0_clk_ref */
 
 			bias-pull-up = <0>;
 			drive-strength = <21>;
@@ -51,8 +59,16 @@ gmac1-pins {
 				 <K1_PADCONF(40, 1)>,	/* gmac1_tx_en */
 				 <K1_PADCONF(41, 1)>,	/* gmac1_mdc */
 				 <K1_PADCONF(42, 1)>,	/* gmac1_mdio */
-				 <K1_PADCONF(43, 1)>,	/* gmac1_int_n */
-				 <K1_PADCONF(46, 1)>;	/* gmac1_clk_ref */
+				 <K1_PADCONF(43, 1)>;	/* gmac1_int_n */
+
+			bias-pull-up = <0>;
+			drive-strength = <21>;
+		};
+	};
+
+	gmac1_clk_ref_cfg: gmac1-clk-ref-cfg {
+		gmac1-clk-ref-pins {
+			pinmux = <K1_PADCONF(46, 1)>;	/* gmac1_clk_ref */
 
 			bias-pull-up = <0>;
 			drive-strength = <21>;

-- 
2.54.0

