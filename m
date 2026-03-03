Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098AA39098E
	for <spacemit@lists.linux.dev>; Tue,  3 Mar 2026 01:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772499857; cv=none; b=ccqFKOfm8KWFUnxOOy1K8ZJ1B/5fD2JFXTAjFrCYtaIQ2UXf06L6TPGgh3ngnulSmkYPvDFPehYrYqw5ZevCOr7Y6Aa36zVmLi6QyV8L37hT3kKBusPkAhJuGz3ozpDdOZKUEdJgQ1ToNccX/S5QCoqXNgU9PVWQmSqsvqrjFis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772499857; c=relaxed/simple;
	bh=CoXi3raZ8Hi+U1VVQqdGvWKzGnKswTm8aEYfEf9JBhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EdvLqSicJCzDJgLGilUx8hn7LHJ63SnK5WeOO0u/g4LBnbP7RJFztJBosz3djwgBbikoRkltttEKp55SOXCm0JiS1CBPdeE2j6/o1o9Hd4XVSPvyosAL+UPeHkVeQSjUAH3CQGyNpBo+y/t60VMQWPhHwUli6bEOpp/6EiV/sgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WTajSJ9U; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WTajSJ9U"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3597df496f6so1224903a91.1
        for <spacemit@lists.linux.dev>; Mon, 02 Mar 2026 17:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772499855; x=1773104655; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LJfO34USsvCpv1UH9qU1hYEgkmphxj2R3COc9IPiZ2A=;
        b=WTajSJ9U4CagfDPXZm0Wyc/8bSVN2EcZ47IixDl+NbVV/oAQF0Oy/k9v8KqkWFhdsk
         iLnitei0WOXy16N/8aMVd7T5cwnDULx48hye0kYsPjZuVToQcan2wv/znJZj9Bqi548A
         Nf5SW3YTZGbvcua+M5aX+PT92QN/2N4gohpk637DzXS5r/hYsPn4XeadEpSn7tidSwN3
         9sqhO20lWIcUbxQ0Igyfy7S7xQ9fZ8Tf8m50oOjKS2kFINnSqBxwM4oV3WtklO2tBmB5
         cxPkoV1uJAJoHoKb/gnT0DoRITgkW2HK6cDm9dfC9sWeahPJtwPOa2uNambqfX9o24qi
         CiXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772499855; x=1773104655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJfO34USsvCpv1UH9qU1hYEgkmphxj2R3COc9IPiZ2A=;
        b=SF7kwfFT/v1nTxOGc6t2FiHwJcfTJ2HCuj9pUknz8qQfQfsu95fNStbFXLE7/Clhxa
         CrOvIs38FoKPZCKEB1WJg4mi90ZoFBFmdaniJOetGy0kSvOUcQbseM8Zwbt+XvttMy1a
         aAKim/OPt0pNBg8+N6llWNBq7lgx+DOlwEoWKbQW5cJu4ohYZNgHELIu6XbYGKGpMyRT
         HRxtndZQyJgUuyxmtC/ARQBelLJt3r4/kAHjEjzbI8UwePZo2qRKG7lmeKyjYc2QPxLS
         jCXnOmxO5uC6fFH/+gOedq4WiRaLek1kN6YGzsm28J57Dr/14kSEGUbADNvZAzj6xjup
         gFUw==
X-Forwarded-Encrypted: i=1; AJvYcCV2bv11raThd+Htc1E+B8r5Js3uCB+lmW3Lp3/rB303PRKGOMhfugXveMleYY93j+nKQhWOsOVh2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxQk5yQOscaDWVd26reiY47Lcju20Vmh8IIzV50uvBFuDBsJPkB
	9m32o+Btumja1u2vi7SXN+ZgAYzbAyokHmKB2dh5jgjX9WTvArdTqkyi
X-Gm-Gg: ATEYQzy9pZH7thy6VHLzSr6a+IVcz0ECdN+DNanE3e9jLkivAMBJvLTZkLsg7wzurR6
	Mf5OFkrJOYnalCTXtUkBUs9HRvT6FQc4RgYMPOkQox220Euoo6svdDH7XydAtKYkPriGxEkhL3q
	1Ma9yLFLvXEbsC/47QA88FdLw4GyM31f4hG1O8pZ4L69cOiFF/zriL6IPb072hvIrOEw6gjhuN0
	nSNPnuitB7vLDX8z9E3P8BmrFmHFV2z+Uz4GRP2gfHt8Tnrg59XOyIbrJR3HvQGBL4Vgd1dzESq
	Y2RNC0RWhgd8OTSTy4qi3Y+GHQGlHistU+CnmFnqOhvWCnSBP2FVYdKif8f8zgIHIPEPB+YeU7n
	tuu0nIzbxZSzRmJuwV9PjwqEofvRNbqWBlkDlgKYAnBSQe5V3hmk4aG/XpyVbd/KfDc4FFeZIeX
	SA9P8rRP1hMkDauTJGPJJA1Q==
X-Received: by 2002:a17:90b:578d:b0:343:e2ba:e8be with SMTP id 98e67ed59e1d1-35965c3c945mr12250080a91.10.1772499855342;
        Mon, 02 Mar 2026 17:04:15 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c49eb5bsm361668a91.11.2026.03.02.17.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 17:04:14 -0800 (PST)
Date: Tue, 3 Mar 2026 09:03:46 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Choong Yong Liang <yong.liang.choong@linux.intel.com>, 
	Conor Dooley <conor+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jose Abreu <joabreu@synopsys.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Abeni <pabeni@redhat.com>, Paul Walmsley <pjw@kernel.org>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Richard Cochran <richardcochran@gmail.com>, 
	Rob Herring <robh@kernel.org>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <me@ziyao.cc>, Yixun Lan <dlan@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v5 0/3] riscv: spacemit: Add ethernet support
 for K3
Message-ID: <aaYyUAaz7cSnBXl9@inochi.infowork>
References: <20260227075718.2243818-1-inochiama@gmail.com>
 <CAJM55Z_soPhC9P03edfq_A-GN07PbGqu31aHgE_5kKhkQwkMmQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJM55Z_soPhC9P03edfq_A-GN07PbGqu31aHgE_5kKhkQwkMmQ@mail.gmail.com>

On Mon, Mar 02, 2026 at 08:08:59AM -0500, Emil Renner Berthing wrote:
> Quoting Inochi Amaoto (2026-02-27 08:57:14)
> > Add initial support for ethernet controller of the Spacemit K3 SoC.
> > This ethernet controller is almost a standard Synopsys DesignWare
> > MAC (version 5.40a). This controller require a syscon device to
> > configure some basic features, like interface type and internal delay.
> 
> I don't know how we can accept this when it can't be tested since it still
> doesn't come with the device tree nodes. If you don't want it to be part of the
> series, just share a tree where this code is working. There are plenty of free
> public git hosting sites available.
> 

It seems like you have not read my reply before, I was forbidden from
opening other's patch. So some dependency can not be satisfied. For me,
the only thing I can open is the ethernet device node. The other things,
like clock, pinctrl and gpio devices. You should collect by yourself and
I can not provide.

Here is the ethernet DTS patch

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b691304d4b74..1dfeef564ef3 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -5,6 +5,7 @@
  */
 
 #include "k3.dtsi"
+#include "k3-pinctrl.dtsi"
 
 / {
 	model = "SpacemiT K3 Pico-ITX";
@@ -24,6 +25,25 @@ memory@100000000 {
 	};
 };
 
+&eth0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_cfg>;
+
+	phy-mode = "rgmii-id";
+	phy-handle = <&phy0>;
+	status = "okay";
+
+	mdio {
+		phy0: phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <1>;
+			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <10000>;
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
new file mode 100644
index 000000000000..aa8e7cfd7efe
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#include <dt-bindings/gpio/gpio.h>
+
+#define K3_PADCONF(pin, func) (((pin) << 16) | (func))
+
+&pinctrl {
+	gmac0_cfg: gmac0-cfg {
+		/* Base pins: - Used by RMII directly */
+		gmac0_base_pins: gmac0-0-pins {
+			pinmux = <K3_PADCONF(0, 1)>,
+				 <K3_PADCONF(1, 1)>,
+				 <K3_PADCONF(2, 1)>,
+				 <K3_PADCONF(3, 1)>,
+				 <K3_PADCONF(6, 1)>,
+				 <K3_PADCONF(7, 1)>,
+				 <K3_PADCONF(11, 1)>,
+				 <K3_PADCONF(12, 1)>,
+				 <K3_PADCONF(13, 1)>;
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+
+		/* RGMII extra pins: add on top of base pins */
+		gmac0_rgmii_add_pins: gmac0-1-pins {
+			pinmux = <K3_PADCONF(4, 1)>,
+				 <K3_PADCONF(5, 1)>,
+				 <K3_PADCONF(8, 1)>,
+				 <K3_PADCONF(9, 1)>,
+				 <K3_PADCONF(10, 1)>;
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+
+		/* Optional int pins */
+		gmac0_int_pins: gmac0-3-pins {
+			pinmux = <K3_PADCONF(14, 1)>;
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+
+		gmac0-6-pins {
+			pinmux = <K3_PADCONF(15, 0)>;
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+	};
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 6cc31e94c13a..066006826e92 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/clock/spacemit,k3-clocks.h>
+#include <dt-bindings/reset/spacemit,k3-resets.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
 /dts-v1/;
@@ -437,6 +438,112 @@ soc: soc {
 		dma-noncoherent;
 		ranges;
 
+		gmac_axi_setup: stmmac-axi-config {
+			snps,wr_osr_lmt = <0xf>;
+			snps,rd_osr_lmt = <0xf>;
+			/* max axi burst len is 256 */
+			snps,blen = <256 128 64 32 16 0 0>;
+		};
+
+		eth0: ethernet@cac80000 {
+			compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
+			reg = <0x0 0xcac80000 0x0 0x2000>;
+			clocks = <&syscon_apmu CLK_APMU_EMAC0_BUS>,
+				 <&syscon_apmu CLK_APMU_EMAC0_1588>,
+				 <&syscon_apmu CLK_APMU_EMAC0_RGMII_TX>;
+			clock-names = "stmmaceth", "ptp_ref", "tx";
+			interrupt-parent = <&saplic>;
+			interrupts = <131 IRQ_TYPE_LEVEL_HIGH>,
+				     <276 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_wake_irq";
+			resets = <&syscon_apmu RESET_APMU_EMAC0>;
+			reset-names = "stmmaceth";
+			rx-fifo-depth = <8192>;
+			tx-fifo-depth = <8192>;
+			snps,multicast-filter-bins = <64>;
+			snps,perfect-filter-entries = <32>;
+			snps,aal;
+			snps,tso;
+			snps,txpbl = <8>;
+			snps,rxpbl = <8>;
+			snps,force_sf_dma_mode;
+			snps,axi-config = <&gmac_axi_setup>;
+			spacemit,apmu = <&syscon_apmu 0x3e4 0x3e8>;
+			status = "disabled";
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		eth1: ethernet@cac82000 {
+			compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
+			reg = <0x0 0xcac82000 0x0 0x2000>;
+			clocks = <&syscon_apmu CLK_APMU_EMAC1_BUS>,
+				 <&syscon_apmu CLK_APMU_EMAC1_1588>,
+				 <&syscon_apmu CLK_APMU_EMAC1_RGMII_TX>;
+			clock-names = "stmmaceth", "ptp_ref", "tx";
+			interrupt-parent = <&saplic>;
+			interrupts = <133 IRQ_TYPE_LEVEL_HIGH>,
+				     <277 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_wake_irq";
+			resets = <&syscon_apmu RESET_APMU_EMAC1>;
+			reset-names = "stmmaceth";
+			rx-fifo-depth = <8192>;
+			tx-fifo-depth = <8192>;
+			snps,multicast-filter-bins = <64>;
+			snps,perfect-filter-entries = <32>;
+			snps,aal;
+			snps,tso;
+			snps,txpbl = <8>;
+			snps,rxpbl = <8>;
+			snps,force_sf_dma_mode;
+			snps,axi-config = <&gmac_axi_setup>;
+			spacemit,apmu = <&syscon_apmu 0x3ec 0x3f0>;
+			status = "disabled";
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		eth2: ethernet@cac8e000 {
+			compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
+			reg = <0x0 0xcac8e000 0x0 0x2000>;
+			clocks = <&syscon_apmu CLK_APMU_EMAC2_BUS>,
+				 <&syscon_apmu CLK_APMU_EMAC2_1588>,
+				 <&syscon_apmu CLK_APMU_EMAC2_RGMII_TX>;
+			clock-names = "stmmaceth", "ptp_ref", "tx";
+			interrupt-parent = <&saplic>;
+			interrupts = <130 IRQ_TYPE_LEVEL_HIGH>,
+				     <278 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_wake_irq";
+			resets = <&syscon_apmu RESET_APMU_EMAC2>;
+			reset-names = "stmmaceth";
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <4096>;
+			snps,multicast-filter-bins = <64>;
+			snps,perfect-filter-entries = <32>;
+			snps,aal;
+			snps,tso;
+			snps,txpbl = <8>;
+			snps,rxpbl = <8>;
+			snps,force_sf_dma_mode;
+			snps,axi-config = <&gmac_axi_setup>;
+			spacemit,apmu = <&syscon_apmu 0x248 0x24c>;
+			status = "disabled";
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k3-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
-- 
2.53.0

Inochi

