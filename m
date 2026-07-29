Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2854052C9;
	Wed, 29 Jul 2026 16:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785341294; cv=none; b=YVja2Stim9DqP7Ad6nXIkbBC19SFb6SkyF0HbDAHnUJwMflAZ9by9sK1JntU/VXAjf5FOOYpvDvOIvC6bnWAjU9KWIGFyAn/S4iyqtc5Qlx8ixvtoi7JLA5gTp+7q/bPKnSyG0LD6nRidf6wVGLUS8vH9lzXoIN+0jz15u1F83s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785341294; c=relaxed/simple;
	bh=Ce4onqJkHSatk7wMRunufGLawPzWzUYhutpwwnIhDBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rhkOnxyoUHmYQvaS84d0WvbOg8ABiYRPSGpgA8UAbVepOvc1otoStJsIHLvKq7NEj+6Kt3Rz8+juzarcZiDCtRf/G4Nxe80Kx2s9tmiFM/pxoaP1bwIYl1txm4WJah/EpJO7q2mi5ucqJ2P0IxOiU1OzxoyMc54/P+9aGAOU2M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=CXSzC4ei; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="CXSzC4ei"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=cveopwzj7XfdCOBfc3Ki3QOytn7ALGYIc0d1OoDtSVo=; b=CXSzC4eibsYUnE6K+8RDgCeHHL
	4pW3vfrkuBUvDWL63WupQ7VAbRUeNPKeFfCybPoJAIe6qbmW2Psd1r8st6o5bqn26MzN/5iwWB7EM
	ZFJ1c49UMzaYMtlyk0tQ6SenACma78nUgzbySZI+sv97HRqw5o0tMCyjSUkRy0c5iRkZ1hi4YV6CN
	gIuA71oCT4QjsJHD6mUC/ZtThlfsl+52csRihGuSqBNsU92AIclroWFWLhPEiOsOiYZ+wbXDMhEAJ
	eQ6a+Mo61ct/i238at2JPsabBayBVQ8PAyAQyzAhcDbxjKTf8vdbMEWvjpcyksqfTjrzXdIgVd94x
	2D1XjjhA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wp6pC-00000002huu-1QZ2;
	Wed, 29 Jul 2026 18:08:06 +0200
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
Subject: [PATCH v2 4/4] riscv: dts: spacemit: Add Milk-V Jupiter board (M1)
Date: Wed, 29 Jul 2026 18:00:31 +0200
Message-ID: <20260729160749.1621415-5-aurelien@aurel32.net>
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

Add support for the Milk-V Jupiter board with the M1 CPU. The M1 differs
from the K1 only by its package, which provides improved cooling
performance and allows it to run at up to 1.8 GHz instead of 1.6 GHz.

Add m1-opp.dtsi to define the 1.8 GHz operating point and the
corresponding core voltage, based on the upstream kernel. Include it
from m1-milkv-jupiter.dts. Raise the maximum buck1 voltage to 1.116V to
match the new operating point.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/Makefile         |   1 +
 .../boot/dts/spacemit/m1-milkv-jupiter.dts    |  16 +++
 arch/riscv/boot/dts/spacemit/m1-opp.dtsi      | 117 ++++++++++++++++++
 3 files changed, 134 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/m1-milkv-jupiter.dts
 create mode 100644 arch/riscv/boot/dts/spacemit/m1-opp.dtsi

diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
index 851b701e5da48..c5c38c17b6ced 100644
--- a/arch/riscv/boot/dts/spacemit/Makefile
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -8,3 +8,4 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-com260-ifx.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-deepcomputing-fml13v05.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-pico-itx.dtb
+dtb-$(CONFIG_ARCH_SPACEMIT) += m1-milkv-jupiter.dtb
diff --git a/arch/riscv/boot/dts/spacemit/m1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/m1-milkv-jupiter.dts
new file mode 100644
index 0000000000000..b0624d65a17fb
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/m1-milkv-jupiter.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2026 Aurelien Jarno <aurelien@aurel32.net>
+ */
+
+#include "k1-milkv-jupiter-common.dtsi"
+#include "m1-opp.dtsi"
+
+/ {
+	model = "Milk-V Jupiter (M1)";
+	compatible = "milkv,jupiter-m1", "spacemit,k1";
+};
+
+&buck1_0v9 {
+	regulator-max-microvolt = <1160000>;
+};
diff --git a/arch/riscv/boot/dts/spacemit/m1-opp.dtsi b/arch/riscv/boot/dts/spacemit/m1-opp.dtsi
new file mode 100644
index 0000000000000..38e0ce7765a2b
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/m1-opp.dtsi
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/ {
+	cluster0_opp_table: opp-table-cluster0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-614400000 {
+			opp-hz = /bits/ 64 <614400000>;
+			opp-microvolt = <950000 950000 1160000>;
+			clock-latency-ns = <200000>;
+		};
+
+		opp-819000000 {
+			opp-hz = /bits/ 64 <819000000>;
+			opp-microvolt = <950000 950000 1160000>;
+			clock-latency-ns = <200000>;
+		};
+
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <950000 950000 1160000>;
+			clock-latency-ns = <200000>;
+		};
+
+		opp-1228800000 {
+			opp-hz = /bits/ 64 <1228800000>;
+			opp-microvolt = <950000 950000 1160000>;
+			clock-latency-ns = <200000>;
+		};
+
+		opp-1600000000 {
+			opp-hz = /bits/ 64 <1600000000>;
+			opp-microvolt = <1050000 1050000 1160000>;
+			clock-latency-ns = <200000>;
+		};
+
+		opp-1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <1160000 1160000 1160000>;
+			clock-latency-ns = <200000>;
+		};
+	};
+
+	cluster1_opp_table: opp-table-cluster1 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-614400000 {
+			opp-hz = /bits/ 64 <614400000>;
+			opp-microvolt = <950000 950000 1160000>;
+			clock-latency-ns = <200000>;
+		};
+
+		opp-819000000 {
+			opp-hz = /bits/ 64 <819000000>;
+			opp-microvolt = <950000 950000 1160000>;
+			clock-latency-ns = <200000>;
+		};
+
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <950000 950000 1160000>;
+			clock-latency-ns = <200000>;
+		};
+
+		opp-1228800000 {
+			opp-hz = /bits/ 64 <1228800000>;
+			opp-microvolt = <950000 950000 1160000>;
+			clock-latency-ns = <200000>;
+		};
+
+		opp-1600000000 {
+			opp-hz = /bits/ 64 <1600000000>;
+			opp-microvolt = <1050000 1050000 1160000>;
+			clock-latency-ns = <200000>;
+		};
+
+		opp-1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <1160000 1160000 1160000>;
+			clock-latency-ns = <200000>;
+		};
+	};
+};
+
+&cpu_0 {
+	operating-points-v2 = <&cluster0_opp_table>;
+};
+
+&cpu_1 {
+	operating-points-v2 = <&cluster0_opp_table>;
+};
+
+&cpu_2 {
+	operating-points-v2 = <&cluster0_opp_table>;
+};
+
+&cpu_3 {
+	operating-points-v2 = <&cluster0_opp_table>;
+};
+
+&cpu_4 {
+	operating-points-v2 = <&cluster1_opp_table>;
+};
+
+&cpu_5 {
+	operating-points-v2 = <&cluster1_opp_table>;
+};
+
+&cpu_6 {
+	operating-points-v2 = <&cluster1_opp_table>;
+};
+
+&cpu_7 {
+	operating-points-v2 = <&cluster1_opp_table>;
+};
-- 
2.53.0

