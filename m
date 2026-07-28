Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788FD40A95F;
	Tue, 28 Jul 2026 21:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785273049; cv=none; b=d3wKDei6plxVWGqzkkkwe8hFJW5yLMM/98yLoXkXIWuBDkNACoUGaTaA2JRpprXD9HldTnHgHl4IVAJNXQMPqkJAOVFKzguAbDU34jv0HsvBIkOh1Sjbx0IC7Mwq70j00PoPaVSkJ+w4PR/WiC61a3KVmmNN3Ihm9Hvt39IGTOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785273049; c=relaxed/simple;
	bh=iGSVGdddVUHcK7dc1o3z/cWwjSDXK+CaAKhTLGvl+Zw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CvKeRAhjOLb3XdHVtkSCDL+sH4YZypQhaHmczx77ywHAtAA+5Gfo/aB/azVH26wDGA5tU5jVCJ/7yuxfz9wtCwYtZw39DMc5WE48q55GEXfk5QMOd/W38zcmCJffbV+8pObxfx4EX6gP/Pic2zuNcqwo4Wvq/a2Ifv+TNn6e1TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=VSVaOoh+; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="VSVaOoh+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=izXEhBJnl8BPt8GBQVh1RwE3TxtiWG+xYjspBpZLhXw=; b=VSVaOoh+Gj8i0H7XCI/OObdr/N
	BKa2feeB+JPQ2z+DUpDK+Tt3C/gA0PnHiP7gqiYYVypLK1iO2btd5lXUhOBdMYq3Rd0kBhaD/CO7n
	WXdx1ww3Q7Nr34eCsfpcqICMoz9T2pHCEdkFPWoI8pxuCT88hJOYl+xUkwYLrbc3WCBbTr0xZQcww
	Du2hFgQsI/KEVJl3sfpqbPCrokN3x/pt9x8k1lMlC+M4QZgjpLjxujhtymVaWNveQMYzpnjDRJ+YB
	IOQyeerx4grbFr2fabbUz2yIwWEg0NyEtbcr3q0UZP1NVPwMs5MMxrB8OcUvskIcSqY8mG13Ea+Jz
	CvKpmLdw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wop4P-00000001a4J-0iuY;
	Tue, 28 Jul 2026 23:10:37 +0200
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
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 1/3] riscv: dts: spacemit: Add cpu scaling for Milk-V Jupiter
Date: Tue, 28 Jul 2026 23:05:06 +0200
Message-ID: <20260728211020.1248676-2-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260728211020.1248676-1-aurelien@aurel32.net>
References: <20260728211020.1248676-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable CPU DVFS on Milk-V Jupiter by including the OPP tables and wiring the
CPU nodes to the CPU regulator supply.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index b61f5995ec771..3c16d0c20050e 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -5,6 +5,7 @@
  */
 
 #include "k1.dtsi"
+#include "k1-opp.dtsi"
 #include "k1-pinctrl.dtsi"
 
 / {
@@ -107,6 +108,38 @@ &combo_phy {
 	status = "okay";
 };
 
+&cpu_0 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_1 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_2 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_3 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_4 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_5 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_6 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_7 {
+	cpu-supply = <&buck1_0v9>;
+};
+
 &emmc {
 	bus-width = <8>;
 	mmc-hs400-1_8v;
@@ -209,7 +242,7 @@ pmic@41 {
 		dldoin2-supply = <&buck5>;
 
 		regulators {
-			buck1 {
+			buck1_0v9: buck1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3450000>;
 				regulator-ramp-delay = <5000>;
-- 
2.53.0

