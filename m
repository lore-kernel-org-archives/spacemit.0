Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E2034C127
	for <spacemit@lists.linux.dev>; Thu, 18 Dec 2025 15:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766070771; cv=none; b=B314bNunu+Ta6cr2Pg4Vv92UXXDn5lr/BYiELpXBwH4R15iWOzhn7DFzX1iVr3dIYuJlknr6DGNxudolsLc4BHN/lmf/4DiBCmbZgAtb8gj5Kdb73WTIzMl1uNp2YAZ2XN+ZIhNakiIjbWXCWk4mOwsqLYiX0otkR7bNi6Exqqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766070771; c=relaxed/simple;
	bh=LJ5v3sn1H+YFrsC7suciW3nVsqkQr7o+AMQ0WWlVsNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WpJAdMQC7uwYcar5UxbUUVG+52Ii5t02IOF6rdFv2mHLJ8S9VYNqspXTeL/SWkL8APTxmnRtWChv/mOssoVrpyYbBUlX2VI5MwoPqX9pJtnbKN4GYKiMTIl/mzdVHAlgGNv3rDrkNrtBBYyie2o6R6JGkSp3v9IYJiIHfh9n2pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Tj+UygxB; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Tj+UygxB"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8b2a4b6876fso114543685a.3
        for <spacemit@lists.linux.dev>; Thu, 18 Dec 2025 07:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766070767; x=1766675567; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=deRuCrhbg73yoYSTX7ZbEzVdWXcb3YNjOYMcREzS1gQ=;
        b=Tj+UygxB0BD6ICr21dzINKqsYqaVL9oHxtiLMmISdFm7iCVPKCsZDNoRINQyzS5RMM
         1/b2nOY6RlO7R4HIQGDhoDaxOdWMB/FlNTSjHqAS3CVUqyc7hMwpvpyguHuwN0Tssikj
         1Y3Dmc3wB5ehZHlatzb3fA7XS2eSuc8es3g1kJPYTybFXAATbUs3GrkGLI87386cPgT6
         VdKC/6DfxInkzsZQ/tryYGGgmZhyOxKwSii2Td2FZGWEbv+316zoFsLMQVgfgQ2x0g2/
         W5BJ99WhTECPXeKqQYjxy16BDOMGbSaoI+msZQ+fBC28q6epGEzs3/YqL0VlhJRitejG
         xIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766070767; x=1766675567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=deRuCrhbg73yoYSTX7ZbEzVdWXcb3YNjOYMcREzS1gQ=;
        b=pMJhQMQP59pSQ30CCESIWn0COlKz5gkIYmFHNiybS5nXe6lO3DV3e+sQiguKJanvUI
         i1Hob4/encrZOGS0i73KU+e45U4jF+ojVjCZLPd7OLdu7BUNLiytQB31y01GdVWhFNsw
         F/fBSWRYdiXx2cMNuchdnb7Djc5k9wDdDV/Ga3twVTk7qFOlgxMvRo5u9ssIWlI10stx
         wzoadCP6dRcCSSFUmz4EJGGv49oFrysPqgIipmAG5P6/sezrFLbJ/yN2CG5xT4EJhOd7
         HDnhfZv6sc7lu3219SKzqQp8PsmaeU2KlcjCAh8WsAZRm0sQtte/jsfcTgoA5p0p9pfS
         02Ag==
X-Forwarded-Encrypted: i=1; AJvYcCWsaogWxDX+t1wSdTyvz/Rq+Sm1xmSOzFqd2GSxynKNb80t9nOhqu67aNymYymuojFc788TkIuYmw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUlmWVM8nZlwHDs7c/Ib2w0RR3X/XZpEN3XzP6T7TTSraVFL1b
	Uo80eXIaUBzeGHAuVF/DzLG7rrowcfuklNqh53KG7/69d/t4YYs7VMHBQ1F3AUX4fjk=
X-Gm-Gg: AY/fxX65G1zb/EuWF2lbx/+5o1fziGNOHjtK83Y7pkJ+SUDuSDSKB3QZSAMWzUGOGme
	atkQ1w5Dkf3b9Kh+xx3debv8VkKK/VvDDD5Pt5JlMTJVd2AuHysX7N1pqBDGs93fIyFQEY5/XcW
	uTolTMAcENhK0H0cNpcva26IrkT2bwpdGp8H2smy8lMiO+mYPqfivlCo8ZYWEORk9K0APgR6KHW
	/IS8JdiO87gZnCAW74UKgzao3bMzK/jfME428VMHqSW2DsIM017MAOo5WabLYls55va7GDuNUEI
	YvVChWCKo+li4QQw91ECTH95UWPPOZglkI/td6TO+WxaEbm+wsCcnWH9BhK/PxQu6YGV6PCvRVE
	VKZcN2KIYLQSdw8IuujTQrNRT6DfBA6XlrCYqrUwDlfJDY+km7Ew4UxnIZmFOt2j/sp5IS1lLMB
	ZVKmEXUkxBQ+oNOM7iwGa86xrFLwE8N2RBZCGiVM8uIFC9QdK4fRXyBjDmngadl6HA
X-Google-Smtp-Source: AGHT+IEHCa1eJb4MT97WJ2TBr0bKtCpanSEsyCdC2JZoWgz6PHaUL53lwZhkFeEOHvvP2mt5XmJ0qg==
X-Received: by 2002:a05:620a:44d5:b0:8b2:ef2d:f74b with SMTP id af79cd13be357-8bb39ad47fbmr3261657885a.29.1766070767326;
        Thu, 18 Dec 2025 07:12:47 -0800 (PST)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8beeb5d6952sm186866985a.3.2025.12.18.07.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 07:12:47 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 5/5] riscv: dts: spacemit: PCIe and PHY-related updates
Date: Thu, 18 Dec 2025 09:12:31 -0600
Message-ID: <20251218151235.454997-6-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251218151235.454997-1-elder@riscstar.com>
References: <20251218151235.454997-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define PCIe and PHY-related Device Tree nodes for the SpacemiT K1 SoC.

Enable the combo PHY and the two PCIe-only PHYs on the Banana Pi BPI-F3
board.  The combo PHY is used for USB on this board, and that will be
enabled when USB 3 support is accepted.

The combo PHY must perform a calibration step to determine configuration
values used by the PCIe-only PHYs.  As a result, it must be enabled if
either of the other two PHYs is enabled.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  36 ++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  33 ++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 176 ++++++++++++++++++
 3 files changed, 245 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 71f48454ba47c..3f10efd925dc8 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -61,6 +61,12 @@ reg_vcc_4v: vcc-4v {
 	};
 };
 
+&combo_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_3_cfg>;
+	status = "okay";
+};
+
 &emmc {
 	bus-width = <8>;
 	mmc-hs400-1_8v;
@@ -272,6 +278,36 @@ dldo7 {
 	};
 };
 
+&pcie1_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_3_cfg>;
+	status = "okay";
+};
+
+&pcie1_port {
+	phys = <&pcie1_phy>;
+};
+
+&pcie1 {
+	vpcie3v3-supply = <&pcie_vcc_3v3>;
+	status = "okay";
+};
+
+&pcie2_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_4_cfg>;
+	status = "okay";
+};
+
+&pcie2_port {
+	phys = <&pcie2_phy>;
+};
+
+&pcie2 {
+	vpcie3v3-supply = <&pcie_vcc_3v3>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index e922e05ff856d..b13dcb10f4d66 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -530,6 +530,39 @@ uart9-2-pins {
 		};
 	};
 
+	pcie0_3_cfg: pcie0-3-cfg {
+		pcie0-3-pins {
+			pinmux = <K1_PADCONF(54, 3)>,	/* PERST# */
+				 <K1_PADCONF(55, 3)>,	/* WAKE# */
+				 <K1_PADCONF(53, 3)>;	/* CLKREQ# */
+
+			bias-pull-up = <0>;
+			drive-strength = <21>;
+		};
+	};
+
+	pcie1_3_cfg: pcie1-3-cfg {
+		pcie1-3-pins {
+			pinmux = <K1_PADCONF(59, 4)>,	/* PERST# */
+				 <K1_PADCONF(60, 4)>,	/* WAKE# */
+				 <K1_PADCONF(61, 4)>;	/* CLKREQ# */
+
+			bias-pull-up = <0>;
+			drive-strength = <21>;
+		};
+	};
+
+	pcie2_4_cfg: pcie2-4-cfg {
+		pcie2-4-pins {
+			pinmux = <K1_PADCONF(62, 4)>,	/* PERST# */
+				 <K1_PADCONF(112, 3)>,	/* WAKE# */
+				 <K1_PADCONF(117, 4)>;	/* CLKREQ# */
+
+			bias-pull-up = <0>;
+			drive-strength = <21>;
+		};
+	};
+
 	pwm14_1_cfg: pwm14-1-cfg {
 		pwm14-1-pins {
 			pinmux = <K1_PADCONF(44, 4)>;
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 7818ca4979b6a..86d1db14e2ee4 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
+#include <dt-bindings/phy/phy.h>
 
 /dts-v1/;
 / {
@@ -423,6 +424,52 @@ i2c5: i2c@d4013800 {
 			status = "disabled";
 		};
 
+		combo_phy: phy@c0b10000 {
+			compatible = "spacemit,k1-combo-phy";
+			reg = <0x0 0xc0b10000 0x0 0x1000>;
+			clocks = <&vctcxo_24m>,
+				 <&syscon_apmu CLK_PCIE0_DBI>,
+				 <&syscon_apmu CLK_PCIE0_MASTER>,
+				 <&syscon_apmu CLK_PCIE0_SLAVE>;
+			clock-names = "refclk",
+				      "dbi",
+				      "mstr",
+				      "slv";
+			resets = <&syscon_apmu RESET_PCIE0_GLOBAL>,
+				 <&syscon_apmu RESET_PCIE0_DBI>,
+				 <&syscon_apmu RESET_PCIE0_MASTER>,
+				 <&syscon_apmu RESET_PCIE0_SLAVE>;
+			reset-names = "phy",
+				      "dbi",
+				      "mstr",
+				      "slv";
+			#phy-cells = <1>;
+			spacemit,apmu = <&syscon_apmu>;
+			status = "disabled";
+		};
+
+		pcie1_phy: phy@c0c10000 {
+			compatible = "spacemit,k1-pcie-phy";
+			reg = <0x0 0xc0c10000 0x0 0x1000>;
+			clocks = <&vctcxo_24m>;
+			clock-names = "refclk";
+			resets = <&syscon_apmu RESET_PCIE1_GLOBAL>;
+			reset-names = "phy";
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		pcie2_phy: phy@c0d10000 {
+			compatible = "spacemit,k1-pcie-phy";
+			reg = <0x0 0xc0d10000 0x0 0x1000>;
+			clocks = <&vctcxo_24m>;
+			clock-names = "refclk";
+			resets = <&syscon_apmu RESET_PCIE2_GLOBAL>;
+			reset-names = "phy";
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
@@ -969,6 +1016,135 @@ pcie-bus {
 			#size-cells = <2>;
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
 				     <0x0 0xb8000000 0x1 0x38000000 0x3 0x48000000>;
+			pcie0: pcie@ca000000 {
+				device_type = "pci";
+				compatible = "spacemit,k1-pcie";
+				reg = <0x0 0xca000000 0x0 0x00001000>,
+				      <0x0 0xca300000 0x0 0x0001ff24>,
+				      <0x0 0x8f000000 0x0 0x00002000>,
+				      <0x0 0xc0b20000 0x0 0x00001000>;
+				reg-names = "dbi",
+					    "atu",
+					    "config",
+					    "link";
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges = <0x01000000 0x0 0x00000000 0x0 0x8f002000 0x0 0x00100000>,
+					 <0x02000000 0x0 0x80000000 0x0 0x80000000 0x0 0x0f000000>;
+				interrupts = <141>;
+				interrupt-names = "msi";
+				clocks = <&syscon_apmu CLK_PCIE0_DBI>,
+					 <&syscon_apmu CLK_PCIE0_MASTER>,
+					 <&syscon_apmu CLK_PCIE0_SLAVE>;
+				clock-names = "dbi",
+					      "mstr",
+					      "slv";
+				resets = <&syscon_apmu RESET_PCIE0_DBI>,
+					 <&syscon_apmu RESET_PCIE0_MASTER>,
+					 <&syscon_apmu RESET_PCIE0_SLAVE>;
+				reset-names = "dbi",
+					      "mstr",
+					      "slv";
+				spacemit,apmu = <&syscon_apmu 0x03cc>;
+				status = "disabled";
+
+				pcie0_port: pcie@0 {
+					device_type = "pci";
+					compatible = "pciclass,0604";
+					reg = <0x0 0x0 0x0 0x0 0x0>;
+					bus-range = <0x01 0xff>;
+					#address-cells = <3>;
+					#size-cells = <2>;
+					ranges;
+				};
+			};
+
+			pcie1: pcie@ca400000 {
+				device_type = "pci";
+				compatible = "spacemit,k1-pcie";
+				reg = <0x0 0xca400000 0x0 0x00001000>,
+				      <0x0 0xca700000 0x0 0x0001ff24>,
+				      <0x0 0x9f000000 0x0 0x00002000>,
+				      <0x0 0xc0c20000 0x0 0x00001000>;
+				reg-names = "dbi",
+					    "atu",
+					    "config",
+					    "link";
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges = <0x01000000 0x0 0x00000000 0x0 0x9f002000 0x0 0x00100000>,
+					 <0x02000000 0x0 0x90000000 0x0 0x90000000 0x0 0x0f000000>;
+				interrupts = <142>;
+				interrupt-names = "msi";
+				clocks = <&syscon_apmu CLK_PCIE1_DBI>,
+					 <&syscon_apmu CLK_PCIE1_MASTER>,
+					 <&syscon_apmu CLK_PCIE1_SLAVE>;
+				clock-names = "dbi",
+					      "mstr",
+					      "slv";
+				resets = <&syscon_apmu RESET_PCIE1_DBI>,
+					 <&syscon_apmu RESET_PCIE1_MASTER>,
+					 <&syscon_apmu RESET_PCIE1_SLAVE>;
+				reset-names = "dbi",
+					      "mstr",
+					      "slv";
+				spacemit,apmu = <&syscon_apmu 0x3d4>;
+				status = "disabled";
+
+				pcie1_port: pcie@0 {
+					device_type = "pci";
+					compatible = "pciclass,0604";
+					reg = <0x0 0x0 0x0 0x0 0x0>;
+					bus-range = <0x01 0xff>;
+					#address-cells = <3>;
+					#size-cells = <2>;
+					ranges;
+				};
+			};
+
+			pcie2: pcie@ca800000 {
+				device_type = "pci";
+				compatible = "spacemit,k1-pcie";
+				reg = <0x0 0xca800000 0x0 0x00001000>,
+				      <0x0 0xcab00000 0x0 0x0001ff24>,
+				      <0x0 0xb7000000 0x0 0x00002000>,
+				      <0x0 0xc0d20000 0x0 0x00001000>;
+				reg-names = "dbi",
+					    "atu",
+					    "config",
+					    "link";
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges = <0x01000000 0x0 0x00000000 0x0 0xb7002000 0x0 0x00100000>,
+					 <0x42000000 0x0 0xa0000000 0x0 0xa0000000 0x0 0x10000000>,
+					 <0x02000000 0x0 0xb0000000 0x0 0xb0000000 0x0 0x07000000>;
+				interrupts = <143>;
+				interrupt-names = "msi";
+				clocks = <&syscon_apmu CLK_PCIE2_DBI>,
+					 <&syscon_apmu CLK_PCIE2_MASTER>,
+					 <&syscon_apmu CLK_PCIE2_SLAVE>;
+				clock-names = "dbi",
+					      "mstr",
+					      "slv";
+				resets = <&syscon_apmu RESET_PCIE2_DBI>,
+					 <&syscon_apmu RESET_PCIE2_MASTER>,
+					 <&syscon_apmu RESET_PCIE2_SLAVE>;
+				reset-names = "dbi",
+					      "mstr",
+					      "slv";
+				spacemit,apmu = <&syscon_apmu 0x3dc>;
+				status = "disabled";
+
+				pcie2_port: pcie@0 {
+					device_type = "pci";
+					compatible = "pciclass,0604";
+					reg = <0x0 0x0 0x0 0x0 0x0>;
+					bus-range = <0x01 0xff>;
+					#address-cells = <3>;
+					#size-cells = <2>;
+					ranges;
+				};
+			};
 		};
 
 		storage-bus {
-- 
2.48.1

