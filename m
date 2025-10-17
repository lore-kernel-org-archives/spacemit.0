Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490AA33F8A7
	for <spacemit@lists.linux.dev>; Fri, 17 Oct 2025 19:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760728078; cv=none; b=Ntknd/oAgkZKlkPdakQWRd+/WFtIldCkxZpjsp9b13C6g4ct5aA3GmD9sryJR55SQmq2h96w1UDtLsWSfLoqG0HhoFMkaMsAdVkegLBgzzdVAxeJ5t09DS1q8V/4bnWYT8xHzpCesRVrTig+5FMj9csLXYO0UHZHtEzbwypLiUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760728078; c=relaxed/simple;
	bh=WajF4YomrPeBXnIl6Pb3JlCid5sH+q3PqlRmRFnM64M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lYHJ6OxcARt4zM2DuBU2q3rNdxzijneZPEZuohUAF7NsO7dgXo6ArylQUD+ODDBZaf5LtbeVO+81r+vJvoZQgUCtvGGLCeWw4pPQh6oesnGTa6Wu94zlprD+OfLWPkJIeysbCjYPd53xpZgK7MPNyWwjAYP0eAVyy9lChOgrzMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=bCJAINNZ; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="bCJAINNZ"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-430aeaffeaeso9726485ab.3
        for <spacemit@lists.linux.dev>; Fri, 17 Oct 2025 12:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760728074; x=1761332874; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVuMJueWnAkYuh5TQkXI6Y6hYDpxc+wPv4az6s1+IXE=;
        b=bCJAINNZ7Nt1XXEtSqEvJv6FeW7v2DqWYvGA4ySNtmPujHf6Cul2JQMZDEk6YQ1d9o
         12EniqlNO4EUdpuPd5wUc7UH6WlZnm16vEzpCjIRKt8MeyoLJpljIXmk87B6WmNEf6Ac
         ujuclRkQm1oi568o2ty0UyCebMFOQbgsFEzNF9EM/Ac2B9m4dMxB5re3E72ZkFzu27T4
         d8h954dkJTxHyCn6PxXBsMRt4bmv7OvE31sCqKLpxdIQDi9SduLS3yIgZ1Rumg/0iq4q
         q9xLUx/ZKFVMj6bcjhrV6oIijvolKUWJ9ExYzglIXGAaC1g4n0rw1pUY0DThLKRbcZpl
         HhFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760728074; x=1761332874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jVuMJueWnAkYuh5TQkXI6Y6hYDpxc+wPv4az6s1+IXE=;
        b=rCQx6fN0NuH4GrsYyn+VKzWVWa2isu0gn5qgpb7ZAv/5QodggYcZImbvUaxtIk6SHV
         6KFBerlpJwZA6i7tKlZft9f2L/43IuPDVcUbJEUGOmNeYjoqFa5zZPU+c5BbxQfUxJWq
         XG5feEbecna9wyOEMJPPNCGf7JStlVYZ/wTuCanmzeNL1qxyYkybd9ClLsFA+OZWBFT/
         z+EuFRdD96UJSJgb4YNSE6BioEnKQi+0D4hn8Uyns36xKApfuEHWbaYxNaBZEEWA2GLT
         A9hK0yaEwshaMtMB+eBrlwagvGKD7dz/5eOm0m9zQ8XJFwRwaGjni118MHHbA4isQ1Ew
         GRiA==
X-Forwarded-Encrypted: i=1; AJvYcCWsGcqkj7cCzJDa344va6JJ2dr8pOrpJqDrk5bXDl6nddMugwccD9ZOvhTe961CN3LkZ/Z/6BTIAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPB/ZojDgkqeK4UUZmpq5MxS9vfGRbNsnOlE0JUU/+A9ltIfTh
	csopP/3wF7wHenjtb0Hn4OOCHDTl56o5gJRXKtWYo6AEond2MOmXZvkUEJHUdJOfALo=
X-Gm-Gg: ASbGnctmP0rwXNxxhb7QhGtFsFo+JMOQa9O9VFiYCDXX7AgTGPnvIfpb1x7KFniI87u
	hCwhXEiqFvmzgObRavJuf+QJD9V39iXaKvv26MQDDnOh8+YbTx2RJL3o4CHGoxhoNdCa9OC/DsO
	P6ebyGU+efEvMppbK3U1lqhpZ49PQgOcFu5+CPM4m5N1NHyrEGDmSV1CF9YVu7zoq257SkpuaBt
	0ukvVMSq3T0I6s5SNz9h4gA9QTBKt6RDLLZHpbq3NmVo6jIfhmDDBJl9myHBjrfpub9RvJqy/aC
	9hxqcTZvPuEFX046UrbYhFnU0UeAzoBbnXEAqUUybdeluDGMtoQq/QMZVyK6V+r5HwcPAuDmNp3
	6ghnlNKIhHav352XcCNKJGT8IQ876XcQY6yWo3UzvjVA3VoHZueUqxydrZxLow5rWR4wKK115Lf
	3lmZEwLKtLFu1MsuvrxBAQFdpBn7isy9UpbsLbt96MxTza/2AXzPpDfA==
X-Google-Smtp-Source: AGHT+IES/rfKhlvARUhnX0tfzUfrV5BOC+gvOxLXp1w4hAUg6/0iisUNrZFn1K7mYG1Jq6GYnw5WKw==
X-Received: by 2002:a92:cd83:0:b0:430:ae8b:d2d8 with SMTP id e9e14a558f8ab-430c526926cmr72010455ab.15.1760728074017;
        Fri, 17 Oct 2025 12:07:54 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9768b98sm153462173.46.2025.10.17.12.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 12:07:53 -0700 (PDT)
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
Subject: [PATCH v3 7/7] riscv: dts: spacemit: PCIe and PHY-related updates
Date: Fri, 17 Oct 2025 14:07:39 -0500
Message-ID: <20251017190740.306780-8-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251017190740.306780-1-elder@riscstar.com>
References: <20251017190740.306780-1-elder@riscstar.com>
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
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  30 ++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  33 ++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 146 ++++++++++++++++++
 3 files changed, 209 insertions(+)

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
index 6cdcd80a7c83b..214216fdecd32 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
+#include <dt-bindings/phy/phy.h>
 
 /dts-v1/;
 / {
@@ -358,6 +359,52 @@ syscon_rcpu2: system-controller@c0888000 {
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
@@ -847,6 +894,105 @@ pcie-bus {
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
+					 <&syscon_apmu RESET_PCIE0_SLAVE>;
+				reset-names = "dbi",
+					      "mstr",
+					      "slv";
+				device_type = "pci";
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
+					 <&syscon_apmu RESET_PCIE1_SLAVE>;
+				reset-names = "dbi",
+					      "mstr",
+					      "slv";
+				device_type = "pci";
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
+					 <&syscon_apmu RESET_PCIE2_SLAVE>;
+				reset-names = "dbi",
+					      "mstr",
+					      "slv";
+				device_type = "pci";
+				spacemit,apmu = <&syscon_apmu 0x3dc>;
+				status = "disabled";
+			};
 		};
 
 		storage-bus {
-- 
2.48.1

