Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC3D45C6F7;
	Wed, 29 Jul 2026 16:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785341290; cv=none; b=jQEwMBDoimKwluA5r2PXaaFhR3qrRHOcBGyNIZKybf/HLHkodNf3I3E7NkKprmjsYVAZM31JOvSTYb5igFJIZDanqeqxVpZnQxTAGnUjdjpXxZ42W9R/hmKzOPFG6zdwKG11W5EYDIAk8KRRGFQtoQmuNhcbJmwf3xAtNTzZs8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785341290; c=relaxed/simple;
	bh=xrsrC46HAK+0xXrujI9GwfqZBLAip6qVxT08DQ9iIZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R0voN5DlkW/mAKlE2SjEwmUWr35ejOGvzRfVnLeCusZZMQ3/jhrrDSDIA7yInWUF58Zmf54Rzc2xBcZQDpRKxYQ5B6H5NgHmZRXO0PmSI7cEGh0ZidoD1Q2xda/cs/KlPnUdh+yxGBIB4BT0WeJ7PwJbBrSQ3UqlcYE8SjShZnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=IGkIfzHa; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="IGkIfzHa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=KTD3UeRnk+P13p0Gql6n+5OQ+cgl14ZnkdUkTh2tZBQ=; b=IGkIfzHalltxc5qIlICu2oHbjK
	YhAhUV+tgO+YBSsmBASFW9MKizrvpV8OUT32eIC+gcAXhFzsb14NX7haIwDoUqwMsM9bKbigSqvbM
	zkzLduIGm5gOyod4asniNYcIlIsk6LNuDRQkxbzvIGuUaXZWGG23ISd44KsItT1aNVphfSmMnVZNI
	tSRaRiyQuZFXfgGxIz4ChkDv8jT6cyxgiyB0ykqcC9RIvRPjdYT3YqkVs/OhLq4ukPH2EfO2c/8iv
	386XkAVLHS7dM8uqESfKmPorQq+zlp8eNh+OIONMHih0Dmds6exXLLFfG9lHlU/sP/D/0whTpMSV3
	h42CV0LA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wp6p8-00000002huO-3eBo;
	Wed, 29 Jul 2026 18:08:02 +0200
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
Subject: [PATCH v2 1/4] riscv: dts: spacemit: Add cpu scaling for Milk-V Jupiter
Date: Wed, 29 Jul 2026 18:00:28 +0200
Message-ID: <20260729160749.1621415-2-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260729160749.1621415-1-aurelien@aurel32.net>
References: <20260729160749.1621415-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable CPU DVFS on Milk-V Jupiter by including the OPP tables and wiring the
CPU nodes to the CPU regulator supply.

Reviewed-by: Yixun Lan <dlan@kernel.org>
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index c76b91ecb914d..635e95aad14a5 100644
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
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
-- 
2.53.0

