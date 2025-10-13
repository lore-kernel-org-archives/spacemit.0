Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3110731AF07
	for <spacemit@lists.linux.dev>; Mon, 13 Oct 2025 15:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760369748; cv=none; b=c6nhMMlrJedC9qVV3rlA9H57CKA52WPrOzCnGD3SGWH4qkBONHWFUj4Hu8pR9a7K3ZyjO0kzmOgc+/vq7lwwNafGBk0CbSf5Trk121KSDCKW6pT3cPtreiLJNbsDojXUpv+9uExZ69J4+NU8vTBPnKJnaM7cuXu5ASoM7nY53X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760369748; c=relaxed/simple;
	bh=4aZka/RAU4QYbrbCdQ/ULFAxcWVzlo5Q0/JoKZooWf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dTHFqP+VkOArmzWmH0sbWZPIKID07AUuYembJvnzVs+6qCs2UcpMbCQfEh8mj4JEKrY5Tg8a4CehepnLQYw8F/67jSbGp1O6G6HHd/y8jxN9JCDmGjUqpAUsmegHb6rg/BsSG3gxQUw3Oz0zaox5Z6EnVCYXyGY0WbTjhsSrKws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=D6no1giO; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="D6no1giO"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-42f91d225c9so17699785ab.0
        for <spacemit@lists.linux.dev>; Mon, 13 Oct 2025 08:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760369745; x=1760974545; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IC7TMG3lk59s+A7a4ImbP9PPZe+ugMZHmrnVEzsSLBc=;
        b=D6no1giOpmyAMY6Y1Hq9IziG+hTsPQimG3yBMBqwkj4bH1+35UOhT3OMV9PyxwWbwl
         PKa9CWwUcBrBHJMbZThN7i6kRh80UhPYDEH1nMrOaBkK+fHHL2Jp7DA982SAyN+rHd9G
         o44rnlBCcGZvJMAFLCvtDfzS+d+SpISIcgb0zECpvd6sQGUHzovg0GyDCkYW3Le+zo4V
         ByWAfunO3QJuG0cU2g1zTsNgZ8uOWgU/JLJ2IsABO8YOh602W1vJMIRd2uL4CoBh5VdW
         p7BYHrS4lH4sQ92nGeB76OFkFg8L2jRjEuLaqGCXD1ThbpNKmRNkF3gC8TAGKPHrmtth
         DiJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760369745; x=1760974545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IC7TMG3lk59s+A7a4ImbP9PPZe+ugMZHmrnVEzsSLBc=;
        b=bDU61wV5nDH8NWQKTntk5qcKYUGj4/en1DWYNGxQ89sgJIWic8eKBZ1QsOlk5X6D+v
         IlvpUHLdumIDhb87+GpzTTv9vLGdCY+TTQGOzkzP/uHFot3XySQ7P4V8Hq1+41EA2sMt
         QmjaBGgmm+eoe8MpwZEjnXr/rSodXN7g7FcijFiqPkjFuo5SybYXWMXfFkK1BEHU+rs1
         Z1agZjabUYZwTseTplcQTK6CFuslcIS2ja6QZQm00V5kDWW0JGpOkoK8WYyNut2eqdnl
         YBI58gnD7OlBKK+qkgWIZfd5PVMzWSikPIqxPsXEYPLw/zDepfxc+9yxg26OJUNCSRAL
         kETw==
X-Forwarded-Encrypted: i=1; AJvYcCUf4y5yoYRjEVh3pil17quSV6oTgSPczwYRGT/SmubDmnGFYSKWzZabJU35vj0jdBcjlvq+5UK5Jg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyLwXWuVbBdBOzA57E6CKw+pGhQ82CMcAk70SouX4CvxBO5Osvz
	yxVu/9PvTka4kLXfyxZLjgFEKWTOcfk4E6pBz6KQmfrZjJPK3M7it5shELFNZjbLZII=
X-Gm-Gg: ASbGncuDAkhQjpGM1pcRCdS/D8VCUNOpOoT5m/YJcEPBS0Pe9VaCflNZYbqYwFsUW91
	FU2aV1cuaXqwoFuWHMPO3GJfb7BO4+kLq1yaKQsL0wqmH3Tbq7eXZvR3PX0UNp9hq9/e7vJ9nL5
	v7HGEIm1GEhaYjdkwh7eKp1p1LR9WbkoMTcObIZtSppyz83ExWhDFdd5l98zDT+vIK0qAKNnXJH
	UQcRzdTmFmH2lWxUHGoWNvoMEVm4e+AXN8Qw/E8hnQobefnFNOOxGFTVOUqqXzPii54Wrn0G+Xc
	MdbDHr+LBhSrOuCqOZj5AlTteD/7dp4vjznYOj69LoVMG68KOJSADae4VPnxdHPMviFcsAUtlW6
	JikdO7P2upfYsJaKjHD5hifCmSdu01gifQZNMzn32u3IrSa5/43rxdv4udaNLZ81dlkkEYlzD9X
	FRO0h2r7iVM1ZIJoDrdEk=
X-Google-Smtp-Source: AGHT+IHjDpApPK7L1lugdyMLdu/ALrQ3dDMp82iS7o9Xm0eHdrN9XhJaFVaUZhe9AQe+NVGfsh4gKw==
X-Received: by 2002:a05:6e02:1545:b0:42f:8d6c:f502 with SMTP id e9e14a558f8ab-42f8d6cf905mr216933655ab.0.1760369745223;
        Mon, 13 Oct 2025 08:35:45 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-58f6c49b522sm3910266173.1.2025.10.13.08.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 08:35:44 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org
Cc: dlan@gentoo.org,
	guodong@riscstar.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	christian.bruel@foss.st.com,
	shradha.t@samsung.com,
	krishna.chundru@oss.qualcomm.com,
	qiang.yu@oss.qualcomm.com,
	namcao@linutronix.de,
	thippeswamy.havalige@amd.com,
	inochiama@gmail.com,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] riscv: dts: spacemit: PCIe and PHY-related updates
Date: Mon, 13 Oct 2025 10:35:24 -0500
Message-ID: <20251013153526.2276556-8-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251013153526.2276556-1-elder@riscstar.com>
References: <20251013153526.2276556-1-elder@riscstar.com>
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
v2: - Added vpcie3v3-supply nodes to PCIe ports
    - Combo PHY node is now defined earlier in the file (alphabetized)

 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  30 ++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  33 ++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 151 ++++++++++++++++++
 3 files changed, 214 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 046ad441b7b4e..6d566780aed9d 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -40,6 +40,12 @@ pcie_vcc_3v3: pcie-vcc3v3 {
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
@@ -100,6 +106,30 @@ &pdma {
 	status = "okay";
 };
 
+&pcie1_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_3_cfg>;
+	status = "okay";
+};
+
+&pcie2_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_4_cfg>;
+	status = "okay";
+};
+
+&pcie1 {
+	phys = <&pcie1_phy>;
+	vpcie3v3-supply = <&pcie_vcc_3v3>;
+	status = "okay";
+};
+
+&pcie2 {
+	phys = <&pcie2_phy>;
+	vpcie3v3-supply = <&pcie_vcc_3v3>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index aff19c86d5ff3..5bacb6aff23f8 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -69,6 +69,39 @@ uart0-2-pins {
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
index 6cdcd80a7c83b..a38c578f24004 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
+#include <dt-bindings/phy/phy.h>
 
 /dts-v1/;
 / {
@@ -358,6 +359,48 @@ syscon_rcpu2: system-controller@c0888000 {
 			#reset-cells = <1>;
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
+			resets = <&syscon_apmu RESET_PCIE0_DBI>,
+				 <&syscon_apmu RESET_PCIE0_MASTER>,
+				 <&syscon_apmu RESET_PCIE0_SLAVE>,
+				 <&syscon_apmu RESET_PCIE0_GLOBAL>;
+			reset-names = "dbi",
+				      "mstr",
+				      "slv",
+				      "phy";
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
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		pcie2_phy: phy@c0d10000 {
+			compatible = "spacemit,k1-pcie-phy";
+			clocks = <&vctcxo_24m>;
+			clock-names = "refclk";
+			reg = <0x0 0xc0d10000 0x0 0x1000>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
@@ -847,6 +890,114 @@ pcie-bus {
 			#size-cells = <2>;
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
 				     <0x0 0xb8000000 0x1 0x38000000 0x3 0x48000000>;
+			pcie0: pcie@ca000000 {
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
+					 <&syscon_apmu RESET_PCIE0_SLAVE>,
+					 <&syscon_apmu RESET_PCIE0_GLOBAL>;
+				reset-names = "dbi",
+					      "mstr",
+					      "slv",
+					      "phy";
+				device_type = "pci";
+				num-viewport = <8>;
+				spacemit,apmu = <&syscon_apmu 0x03cc>;
+				status = "disabled";
+			};
+
+			pcie1: pcie@ca400000 {
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
+					 <&syscon_apmu RESET_PCIE1_SLAVE>,
+					 <&syscon_apmu RESET_PCIE1_GLOBAL>;
+				reset-names = "dbi",
+					      "mstr",
+					      "slv",
+					      "phy";
+				device_type = "pci";
+				num-viewport = <8>;
+				spacemit,apmu = <&syscon_apmu 0x3d4>;
+				status = "disabled";
+			};
+
+			pcie2: pcie@ca800000 {
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
+					 <&syscon_apmu RESET_PCIE2_SLAVE>,
+					 <&syscon_apmu RESET_PCIE2_GLOBAL>;
+				reset-names = "dbi",
+					      "mstr",
+					      "slv",
+					      "phy";
+				device_type = "pci";
+				num-viewport = <8>;
+				spacemit,apmu = <&syscon_apmu 0x3dc>;
+				status = "disabled";
+			};
 		};
 
 		storage-bus {
-- 
2.48.1

