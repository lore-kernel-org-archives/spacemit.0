Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0177322ACFA
	for <spacemit@lists.linux.dev>; Sun, 12 Jul 2026 04:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783828866; cv=pass; b=k+ujbfiZrii7fvQyDko8aYOK78bZkbG2Yw4/E48G6pUbDD39f/T9vX6ID85CkDHE6hJrU2okZITnN5l0PizzTdaNfxCQxzKxZRS81K7yBMvjOTsgJWQLzajB5b5p7C993DUHOX/zeyl/Sji7gOSlO7o35bTjivLtA0NpNKPjaOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783828866; c=relaxed/simple;
	bh=sSeTbiBwPQ6DjLkmKLnOfkPCA53RLd/BeJlLx3h0kms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MkV+VrAQD+FLexTTO6DzbTprab0/+cT4kgme2k3U3KQpzNY8lpeeUaTt34j6ql3xMYTCkA5H6mOke7FAYsMYYOgwpjQXmMzdSidIA02cmHQz8HxYxrGQp/ZUzg+Ld8myIaamLYw3+1jIO2vFvWTc8TeWJ/Lm4PPTP6IWr5R+HXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=IeFM9NHY; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="IeFM9NHY"
ARC-Seal: i=1; a=rsa-sha256; t=1783828858; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mwwdWwmUttni2cJuSVFItLC/pg67qtjjnSR2eo9FcJd2V6DR//h0QkZaIscX9trelRonBo1rLKEwHfaqWYggvUGTz4tZmxkGOaiVv72DvAJZjFjtzqnTGDP/UW8mEdcFw2tznNE+qqc6lLgi0ZS1IjtNnM54dMM62B4RD3x7Bak=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783828858; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1XM9WhEYjo7g6ksDbiUNrS4SEmNY6DP2S7J0vO6k1QQ=; 
	b=XQ3/pBzGIWjEHF94NONby5PozjyMvGJ22IDKatWRspVvwudjX4AuJUA0hNB7n3vqCRMNa+a4YB+Ikvltek9ZseyrwMIW8Ad5QV7k8/q7g3XT1vsR8oh9RiYclfidNSoB7MsN61tFeDfKOFCHy69+7kPl+oNbfBfxouxk+G2wIkE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783828858;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=1XM9WhEYjo7g6ksDbiUNrS4SEmNY6DP2S7J0vO6k1QQ=;
	b=IeFM9NHYwKvJCp+FM4JpcCCKGhGuL8zNAeepxY4iH/LlMbd6KfJpEERSQBNymDlV
	+PNRozTByXuHZn6oZZKop9y43sNGMX+U5pdB5B+roZ082J/evMSPBAvc/R5aWY7Li5t
	ix4MQqpi+BjoGGjQHkede+N2m5CGpDbt/ZulEXX4=
Received: by mx.zohomail.com with SMTPS id 1783828856840857.1737428996421;
	Sat, 11 Jul 2026 21:00:56 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Sun, 12 Jul 2026 12:00:02 +0800
Subject: [PATCH v3 2/3] riscv: dts: spacemit: k1: Split gmac_clk_ref into
 independent pinctrl groups
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-bpi-cm6-v3-2-8d1e2045179d@pigmoral.tech>
References: <20260712-bpi-cm6-v3-0-8d1e2045179d@pigmoral.tech>
In-Reply-To: <20260712-bpi-cm6-v3-0-8d1e2045179d@pigmoral.tech>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Guodong Xu <guodong@riscstar.com>, Yangyu Chen <cyy@cyyself.name>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Paolo Abeni <pabeni@redhat.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783828822; l=5834;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=sSeTbiBwPQ6DjLkmKLnOfkPCA53RLd/BeJlLx3h0kms=;
 b=tDazRhIsIjPkuU8N7Zi53BHneDrpSn+uv2IdJy12dN+5v0KUCaQMNmr7cxIjP2ARM+fZGFfey
 Siw1ufR9eMFC2XygNhwhWv383Iqirz3GjGcw/KfWz3InQe5OoeXODev
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
index b13a8d6a2670..dd72c33bd54c 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
@@ -60,7 +60,7 @@ &eth0 {
 	phy-handle = <&rgmii0>;
 	phy-mode = "rgmii-id";
 	pinctrl-names = "default";
-	pinctrl-0 = <&gmac0_cfg>;
+	pinctrl-0 = <&gmac0_cfg>, <&gmac0_clk_ref_cfg>;
 	rx-internal-delay-ps = <0>;
 	tx-internal-delay-ps = <0>;
 	status = "okay";
@@ -84,7 +84,7 @@ &eth1 {
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

