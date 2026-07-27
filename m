Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CED3F788A
	for <spacemit@lists.linux.dev>; Mon, 27 Jul 2026 09:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145670; cv=none; b=BGf5yJ/YRqkNehKzDGPWkRaneRjHDtG3c0snmLIb5GE86V+rIR1IHksPbnSD6SId0wdQKblT229sVMMhAkyMrXzuyzVLQMtofyB9NsN3LZXyb6opvJNX51rVFw/yI4HBdwZvyW6S2EiMS21wuZf1E9L9MaTXCmcAi66LA1+wmkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145670; c=relaxed/simple;
	bh=re99Uw5flpooZI4bdaNzxSOrwxynerNkjIFaOSZ4Fsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M/Csuv+aw4TJkDtgrDV7KL7zX5d8LwBIiZAOwOmH54TscED88ghSpQHo7BbDFfiyyFbPEbpH3z86PbtPaBzy/ORxohKx7fZH8Dtmi8bqWqh5wpTy3wrYlAFGz2ngWTgRs46bVCQBjGlo3Dyl5rhKt4jH/XDGowLQHOELUW17R/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBNCt2lA; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBNCt2lA"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so36992495ad.0
        for <spacemit@lists.linux.dev>; Mon, 27 Jul 2026 02:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145664; x=1785750464; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2N52ZF/IjKhZBIW5738KSh9he99B/S0uG1hHgg20oHU=;
        b=SBNCt2lA2+2pvd1JNQjXZkm7Pd047A3Xc5RkKVo7TBl0Q8c+lcoBvAHjCgg0nVc0Qp
         qEQeZTCSMTamOYqMv9q8xrxOcQbZETSHY1dSVBASEdSYOEeRK1yd0nQQKOMF3GcP5ZSM
         Ca4IR8LFLQVut/lYBoYuKm1mhZs6MVm/9voIZ2S94tNVpKPUAanDnmFapAEdIfP2Jrtn
         VRAmhSthPsx1oxGcORKyKHdY4Hf4Zib2DuL2t3Fp7YMye6ObRqya/rzp2eMgy+4ZHmcu
         ibHy97mqUvR9w6SV26GoVO4AhShGCwBytx50nxl4RUZHQ6PrlR3WyEkc18KDzFsKLeYi
         x/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145664; x=1785750464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2N52ZF/IjKhZBIW5738KSh9he99B/S0uG1hHgg20oHU=;
        b=Qo2ANY0s4cjWoxX3cpVd5+d48yGpYztgNLCPKj1Q0KTFdDkDNXHGfUD+JfG24o2nGz
         52sAWHIJC6CPc6R7OtS2Bt9P4bmx05pAhq/VvTLr2ULL3gaOSI6X/HS/Uy7mJkP/C/mH
         ay55SIEddXcSHg0zJR7DUzpSWzdhnC4mQgfayo7Js2Am1DhJ3Wf87nUf21lDufAtXWCS
         mGAczjxS8gTOEFsJNOoNmWj/mk6i11ugQoZa3Wr2K773KKAE5/GFbI4o8Y+oxrwuZ4nj
         mo2RLUp3QY/0ZGtRX1fBGzIEMvIsGTDQlY079tDEa2iqUbqeUFqkI0frPnCensOryrtv
         6png==
X-Forwarded-Encrypted: i=1; AHgh+Rq0ol+H3cjR+bUxPiHTFx8PQ/yE81WopXsSu71vzNWjkVhhVv1y9pZj4676WEMEvN4ifu4bEMPRfA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6iILUgVmZtjWkfn2QggyiBfv8JRY1UkFohtekXwxv7Gu2elaG
	f/v4/SHner4zqZAWe0o78cbm/h1+t4DnS+bZvWvWFQLpxt7NVHhLUdNi
X-Gm-Gg: AR+sD10zvRXdPNyoBbswRL8ISxxFgqwhtHwnw5bwXcWQOG9TX6sKoHZKZiMF6/fhale
	sa2myOh3wkTBsixKLW8rcXGWM8hfN7QIPMESZiox8jrAUt3lwmIRWFZkPS0lZWNRafk9i7GiSGB
	Sf02BablejksWA06ztAe6J2Q6EzixkMMLglisL28el0rSeE3Rvbb4FtM7WOsUuicRyN+QeDa0Wx
	Mt2hvbZYV2rhF2BIfN+/opTDfS+WHPrFkPj/dOL7PkPzWCXWSVWcBL/iOXCO6LWjQfJYxbHP+ox
	qPFeIJugpVniHznqvo6Z94kdlfMvyC+a1FSpWIy0xMvNiUaB1TKtYamS+lEmVZtps4l+ObHBoi8
	6rrZUWHxItSOqD1pulmRL8CV7UMwhARQsjxgWrGDtRbmV63e6c5tAeWprY+C9a40bT4ybCfguX+
	J+
X-Received: by 2002:a17:902:fc46:b0:2c8:1c05:16bb with SMTP id d9443c01a7336-2cfde851bc2mr78137205ad.24.1785145663832;
        Mon, 27 Jul 2026 02:47:43 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e8a0asm31819215ad.34.2026.07.27.02.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:47:43 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 2/2] riscv: dts: spacemit: k3: Add PCIe device node
Date: Mon, 27 Jul 2026 17:47:24 +0800
Message-ID: <20260727094726.890179-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727094726.890179-1-inochiama@gmail.com>
References: <20260727094726.890179-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add all PCIe device node for Spacemit K3.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  38 ++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi |  33 ++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 195 +++++++++++++++++++
 3 files changed, 266 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index 2a6d35a64d5c..1eb5abbc61f9 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -205,6 +205,44 @@ phy0: phy@1 {
 	};
 };
 
+&pcie0_rc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_0_cfg>;
+	num-lanes = <4>;
+	status = "okay";
+
+	pcie@0 {
+		vpcie3v3-supply = <&reg_aux_vcc3v3>;
+		phys = <&combophy 0 PHY_TYPE_PCIE>,
+		       <&combophy 1 PHY_TYPE_PCIE>;
+	};
+};
+
+&pcie2_rc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_0_cfg>;
+	num-lanes = <2>;
+	status = "okay";
+
+	pcie@0 {
+		vpcie3v3-supply = <&reg_aux_vcc3v3>;
+		phys = <&combophy 2 PHY_TYPE_PCIE>,
+		       <&combophy 3 PHY_TYPE_PCIE>;
+	};
+};
+
+&pcie4_rc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie4_0_cfg>;
+	num-lanes = <1>;
+	status = "okay";
+
+	pcie@0 {
+		vpcie3v3-supply = <&reg_aux_vcc3v3>;
+		phys = <&combophy 5 PHY_TYPE_PCIE>;
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_0_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 3ee1471f3798..68aa21a5279f 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -689,4 +689,37 @@ uart0-0-pins {
 			drive-strength = <25>;
 		};
 	};
+
+	pcie0_0_cfg: pcie0-0-cfg {
+		pcie0-0-pins {
+			pinmux = <K3_PADCONF(79, 5)>,   /* pcie0 perst */
+				 <K3_PADCONF(81, 5)>;	/* pcie0 clkreq */
+
+			bias-pull-up = <1>;
+			drive-strength = <33>;
+			power-source = <1800>;
+		};
+	};
+
+	pcie2_0_cfg: pcie2-0-cfg {
+		pcie2-0-pins {
+			pinmux = <K3_PADCONF(25, 4)>,	/* pcie2 perst */
+				 <K3_PADCONF(27, 4)>;	/* pcie2 clkreq */
+
+			drive-strength = <38>;
+			power-source = <3300>;
+		};
+	};
+
+	pcie4_0_cfg: pcie4-0-cfg {
+		pcie4-0-pins {
+			pinmux = <K3_PADCONF(76, 5)>,	/* pcie4 perst */
+				 <K3_PADCONF(77, 5)>,	/* pcie4 wake */
+				 <K3_PADCONF(78, 5)>;	/* pcie4 clkreq */
+
+			bias-pull-up = <1>;
+			drive-strength = <33>;
+			power-source = <1800>;
+		};
+	};
 };
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 7863ab7dd308..314dea88b4a4 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -439,6 +439,201 @@ soc: soc {
 		dma-noncoherent;
 		ranges;
 
+		pcie0_rc: pcie@80000000 {
+			compatible = "spacemit,k3-pcie";
+			reg = <0x0 0x80000000 0x0 0x00001000>,
+			      <0x0 0x80300000 0x0 0x00003f20>,
+			      <0x11 0x00000000 0x0 0x00010000>,
+			      <0x0 0x82900000 0x0 0x00001000>,
+			      <0x0 0x80100000 0x0 0x00001000>;
+			reg-names = "dbi", "atu", "config", "link", "dbi2";
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			clocks = <&syscon_apmu CLK_APMU_PCIE_PORTA_DBI>,
+				 <&syscon_apmu CLK_APMU_PCIE_PORTA_MSTE>,
+				 <&syscon_apmu CLK_APMU_PCIE_PORTA_SLV>;
+			clock-names = "dbi", "mstr", "slv";
+			msi-parent = <&simsic>;
+			ranges = <0x01000000 0x00 0x00010000 0x11 0x00010000 0x0 0x00100000>,
+				 <0x02000000 0x0 0x00110000 0x11 0x00110000 0x0 0x7fef0000>,
+				 <0x43000000 0x18 0x00000000 0x18 0x00000000 0x1 0x00000000>;
+			resets = <&syscon_apmu RESET_APMU_PCIE_A_DBI>,
+				 <&syscon_apmu RESET_APMU_PCIE_A_MASTER>,
+				 <&syscon_apmu RESET_APMU_PCIE_A_SLAVE>;
+			reset-names = "dbi", "mstr", "slv";
+			max-link-speed = <3>;
+			linux,pci-domain = <0>;
+			spacemit,apmu = <&syscon_apmu 0x1f0>;
+			status = "disabled";
+
+			pcie0_port: pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie1_rc: pcie@80400000 {
+			compatible = "spacemit,k3-pcie";
+			reg = <0x0 0x80400000 0x0 0x00001000>,
+			      <0x0 0x80700000 0x0 0x00003f20>,
+			      <0x11 0x80000000 0x0 0x00010000>,
+			      <0x0 0x82c00000 0x0 0x00001000>,
+			      <0x0 0x80500000 0x0 0x00001000>;
+			reg-names = "dbi", "atu", "config", "link", "dbi2";
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			clocks = <&syscon_apmu CLK_APMU_PCIE_PORTB_DBI>,
+				 <&syscon_apmu CLK_APMU_PCIE_PORTB_MSTE>,
+				 <&syscon_apmu CLK_APMU_PCIE_PORTB_SLV>;
+			clock-names = "dbi", "mstr", "slv";
+			msi-parent = <&simsic>;
+			ranges = <0x01000000 0x0 0x00010000 0x11 0x80010000 0x0 0x00100000>,
+				 <0x02000000 0x0 0x80110000 0x11 0x80110000 0x0 0x7fef0000>,
+				 <0x43000000 0x16 0x00000000 0x16 0x00000000 0x1 0x00000000>;
+			resets = <&syscon_apmu RESET_APMU_PCIE_B_DBI>,
+				 <&syscon_apmu RESET_APMU_PCIE_B_MASTER>,
+				 <&syscon_apmu RESET_APMU_PCIE_B_SLAVE>;
+			reset-names = "dbi", "mstr", "slv";
+			max-link-speed = <3>;
+			linux,pci-domain = <1>;
+			spacemit,apmu = <&syscon_apmu 0x1d0>;
+			status = "disabled";
+
+			pcie1_port: pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie2_rc: pcie@80800000 {
+			compatible = "spacemit,k3-pcie";
+			reg = <0x0 0x80800000 0x0 0x00001000>,
+			      <0x0 0x80b00000 0x0 0x00003f20>,
+			      <0x12 0x00000000 0x0 0x00010000>,
+			      <0x0 0x82d00000 0x0 0x00001000>,
+			      <0x0 0x80900000 0x0 0x00001000>;
+			reg-names = "dbi", "atu", "config", "link", "dbi2";
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			clocks = <&syscon_apmu CLK_APMU_PCIE_PORTC_DBI>,
+				 <&syscon_apmu CLK_APMU_PCIE_PORTC_MSTE>,
+				 <&syscon_apmu CLK_APMU_PCIE_PORTC_SLV>;
+			clock-names = "dbi", "mstr", "slv";
+			msi-parent = <&simsic>;
+			ranges = <0x01000000 0x00 0x00000000 0x12 0x00010000 0x0 0x00100000>,
+				 <0x02000000 0x0 0x00110000 0x12 0x00110000 0x0 0x7fef0000>,
+				 <0x43000000 0x15 0x00000000 0x15 0x00000000 0x1 0x00000000>;
+			resets = <&syscon_apmu RESET_APMU_PCIE_C_DBI>,
+				 <&syscon_apmu RESET_APMU_PCIE_C_MASTER>,
+				 <&syscon_apmu RESET_APMU_PCIE_C_SLAVE>;
+			reset-names = "dbi", "mstr", "slv";
+			linux,pci-domain = <2>;
+			max-link-speed = <3>;
+			spacemit,apmu = <&syscon_apmu 0x1c8>;
+			status = "disabled";
+
+			pcie2_port: pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie3_rc: pcie@80c00000 {
+			compatible = "spacemit,k3-pcie";
+			reg = <0x0 0x80c00000 0x0 0x00001000>,
+			      <0x0 0x80f00000 0x0 0x00003f20>,
+			      <0x12 0x80000000 0x0 0x00010000>,
+			      <0x0 0x82a00000 0x0 0x00001000>,
+			      <0x0 0x80d00000 0x0 0x00001000>;
+			reg-names = "dbi", "atu", "config", "link", "dbi2";
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			clocks = <&syscon_apmu CLK_APMU_PCIE_PORTD_DBI>,
+				 <&syscon_apmu CLK_APMU_PCIE_PORTD_MSTE>,
+				 <&syscon_apmu CLK_APMU_PCIE_PORTD_SLV>;
+			clock-names = "dbi", "mstr", "slv";
+			msi-parent = <&simsic>;
+			ranges = <0x01000000 0x0 0x00010000 0x12 0x80010000 0x0 0x100000>,
+				 <0x02000000 0x0 0x80110000 0x12 0x80110000 0x0 0x3fef0000>,
+				 <0x43000000 0x14 0x00000000 0x14 0x00000000 0x1 0x00000000>;
+			resets = <&syscon_apmu RESET_APMU_PCIE_D_DBI>,
+				 <&syscon_apmu RESET_APMU_PCIE_D_MASTER>,
+				 <&syscon_apmu RESET_APMU_PCIE_D_SLAVE>;
+			reset-names = "dbi", "mstr", "slv";
+			linux,pci-domain = <3>;
+			bus-range = <0x00 0xff>;
+			max-link-speed = <3>;
+			spacemit,apmu = <&syscon_apmu 0x1e0>;
+			status = "disabled";
+
+			pcie3_port: pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie4_rc: pcie@81000000 {
+			compatible = "spacemit,k3-pcie";
+			reg = <0x0 0x81000000 0x0 0x00001000>,
+			      <0x0 0x81300000 0x0 0x00003f20>,
+			      <0x12 0xc0000000 0x0 0x00010000>,
+			      <0x0 0x82b00000 0x0 0x00001000>,
+			      <0x0 0x81100000 0x0 0x00001000>;
+			reg-names = "dbi", "atu", "config", "link", "dbi2";
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			clocks = <&syscon_apmu CLK_APMU_PCIE_PORTE_DBI>,
+				 <&syscon_apmu CLK_APMU_PCIE_PORTE_MSTE>,
+				 <&syscon_apmu CLK_APMU_PCIE_PORTE_SLV>;
+			clock-names = "dbi", "mstr", "slv";
+			msi-parent = <&simsic>;
+			ranges = <0x01000000 0x0 0x00000000 0x12 0xc0010000 0x0 0x100000>,
+				 <0x02000000 0x0 0xc0110000 0x12 0xc0110000 0x0 0x3fef0000>,
+				 <0x43000000 0x13 0x00000000 0x13 0x00000000 0x1 0x00000000>;
+			resets = <&syscon_apmu RESET_APMU_PCIE_E_DBI>,
+				 <&syscon_apmu RESET_APMU_PCIE_E_MASTER>,
+				 <&syscon_apmu RESET_APMU_PCIE_E_SLAVE>;
+			reset-names = "dbi", "mstr", "slv";
+			linux,pci-domain = <4>;
+			max-link-speed = <3>;
+			spacemit,apmu = <&syscon_apmu 0x1e8>;
+			status = "disabled";
+
+			pcie4_port: pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
 		usb3d: usb@81a00000 {
 			compatible = "spacemit,k3-dwc3";
 			reg = <0x0 0x81a00000 0x0 0x10000>;
-- 
2.55.0

