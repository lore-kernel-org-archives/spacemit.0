Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4090530216D
	for <spacemit@lists.linux.dev>; Fri,  7 Nov 2025 19:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762542977; cv=none; b=BXKOdSNCvfZaiVezNaM1MocKfp7CszOu4FgNDnE1wdGTftnvH050r/nBXJRc5HrclzIYTzVvij0qXmXcOJlsauhy6CcCn33/1R4IUMJovM+qz4xRD45zlSpBePyT5MffBwZUjIsJypNSJk/Umu7RXf0ucENA4pC+grY4y36jO6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762542977; c=relaxed/simple;
	bh=Wu2Sm53QA+jpTycaZrWNmjrOzNnxjiLndCj6qBa4kng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EBaQ5ef9cGfmQknY6A6E0tY2YHrTnWMRy/sys0bCA+BntuX5JtmgHXpsd5Ch9zEtePvWICqtYf/Dc8S7NBFllrzPKx+3TS5PSxd8kBhd+QDKNUpgyMea/Vdj9+hcuY+JuB5RpliySOcLGczBJX+hBoH7Gx20u7mXPzkevUZJaT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=SHr/bze5; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="SHr/bze5"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-93e7c7c3d0bso87454639f.2
        for <spacemit@lists.linux.dev>; Fri, 07 Nov 2025 11:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1762542974; x=1763147774; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8jxQ2ZdtZCYOQIv/UAQFdIKdJK3+w+n0jdT7aG93hs0=;
        b=SHr/bze5TCtVBxWdj+XWFkj+9qgj1mPlCcUxu5yR+ogkGUKBk7WMQdyF1PK3YG5vog
         V01gn/XR5YUYHeZLBJG/w0vMqi9GNIGbGGkfbHqAeHARE33cJ/aNV0jYtPzcjvnWnAZa
         ZQimIqM5A1dyLYDuJxWu/WeW5PHvdGVU8uPzqS4IDk3yb9YremGRmprirHYO0Oh90BS6
         QWZl+XumLHwvvAwFy3QI8GYu4ZpQwE9XjjDE2LLw6R857mT671ylwB+06lCMvsGIgmge
         wYaJC+ToLBUsDD6gIxudLeFEO0hF4BTHeDbBw5ViYh0kHhMRJk3wF+3RZYPIpPD1j7sm
         mcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762542974; x=1763147774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8jxQ2ZdtZCYOQIv/UAQFdIKdJK3+w+n0jdT7aG93hs0=;
        b=MJMH/8C5Nqg4yUyrSHVH8658mbSGctT84vTS8FQziZvUMyXeivn7HVQtF3TM8M1AEK
         j6OfnVbDkSPI2vMYy1GKgJKfo5UqNe2U0VmPgdRLLCgagHEDFWZ9TVFPYKJ6oG8irtXz
         7P8SsEFj41wkt10WhQTQXNKN9JTtNN610VcYlClT1RF3yx82exdpZWgoKrm4KBRZvtOq
         7WsuwIRnrXaK/MlARPoq5zcg1My+sONc088oEbKzCMZWh0lSm47zUio52pM59Sonkjqc
         XVSBMRHdePn2bf0UwHZs+LRIUR5ZyJfOciJ3QVhD8/3A7AFOS1ad+71aKEElLJ2yLU7B
         rugA==
X-Forwarded-Encrypted: i=1; AJvYcCXiNi2NNhtat6Q2fPqbgIqnPU43FxAyaDVnk+pPJnKBrxsmi2KM39tsGFbYdCQQ86TTnmRtfp7WUA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6x9vQLcxCnO9H0znOZnJ3ie1pFKPfouI1jPK9ZTgorYBZwMAA
	p+0k8R5+9CvBn6b1xgvdOqFtNHoBhpw/8ntRnyQFhFKMAN6afRKp+tWxwMefyh6xj2E=
X-Gm-Gg: ASbGnctVJykwiOWtqjOHAU18YB7Nqgf7C5UgiJ8YZuzTLMdWQ4Z68/m5mKdnofM4GbO
	n5X17skS1sEnFW+bSXFlISBRzOLQZBP1QZjjc5UlytMfcebKOPBCLkqrJ9c1ZYcdqp4J+ln60P4
	nJM737h27iUc8vu6EMPUM79J4riQyjACvApIxDWAfbSStWcbkrUpbdNsSEbYaKOXmE0PaAdHMOz
	BWIi5+dVAhgZmONJ4BH8Mm/tPZJF7vuzvfBXPKGnasc8XnReG/K60YqgaqIiMbQhf5EHUTBSOQk
	eegLM44ASR26Etc40pXP2kX/YbHs0OOXq/S+k2zMRAyauB11+OmDhOz33/f+S6cu10X7iDoPRll
	A6QM0ne0d7XWJXFTNAlIAH74jVGqHnGkBTDv07Gk6AkRaIdB0rrdRFsTRYJyebuQ8R0v7nsnRgG
	Vuqg6qItzOI/lzEirPrN7no6FkMiK06QO8KrZ2lXdJd/JTVdTzbBJkYg==
X-Google-Smtp-Source: AGHT+IEIFqf72Uw7lXpnK7z2vlHsr603Sf+gE4ADuvndF3WZpiJLFRzDUOtpTTOcWimjOtUmXNv9qg==
X-Received: by 2002:a92:cd8d:0:b0:433:2a39:1b92 with SMTP id e9e14a558f8ab-43367deab6cmr10145175ab.11.1762542974129;
        Fri, 07 Nov 2025 11:16:14 -0800 (PST)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-94888c34c6asm118772939f.10.2025.11.07.11.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 11:16:13 -0800 (PST)
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
Subject: [PATCH v5 7/7] riscv: dts: spacemit: PCIe and PHY-related updates
Date: Fri,  7 Nov 2025 13:15:56 -0600
Message-ID: <20251107191557.1827677-8-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251107191557.1827677-1-elder@riscstar.com>
References: <20251107191557.1827677-1-elder@riscstar.com>
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
v5: - Regulators defined in the PCIe controller nodes rather than in
      their root port sub-nodes (in "k1-bananapi-f3.dts")

 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  36 ++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  33 ++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 176 ++++++++++++++++++
 3 files changed, 245 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index a269c2cca3ac9..79ab40d53a4b5 100644
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
@@ -266,6 +272,36 @@ dldo7 {
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
index 4eef81d583f3d..d456dea7bd32a 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -509,6 +509,39 @@ uart9-2-pins {
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
index af35f9cd64351..a20422db101ee 100644
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
@@ -873,6 +920,135 @@ pcie-bus {
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

