Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDD43EB7FE
	for <spacemit@lists.linux.dev>; Mon, 12 Oct 2026 23:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791849395; cv=none; b=iDExVFkgwEdvPTdtZ1OxpGKgiKrZ/mIw0oVAuW7WU1zfpmXl2QVo8pyXYG563AEGVd4mtUk64EU9CQ0TaCCzrLzsQzHu7SKVxTLpNJfxaSssGwa27GNPAklGWg43S1x6hycwXrZkF8SkL1Qk+j5XU//PiYz+kez5CGQ8DJ75JfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791849395; c=relaxed/simple;
	bh=3mRuq6sCm2UevKUcPB+TzVQRBcjMFqLG0bZyz0R8+48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DKYqBYeFimUB9Ow0k+873kL7VbXdogtReiZqLk53SR4taWAYs1DVpcyuzpR1LiCzVj9ghK1CWSl79bCAVf2XXFBqYR75BqWvZdcXFQaM3qi0cCYvtD33/UE0oDOlcNcyeTvV3QVM0H2BKQlVeaGxKfjHJ6H472FIc2gUFeNwaK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h7K4KsrZ; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7K4KsrZ"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3115c4451c8so2490101eec.1
        for <spacemit@lists.linux.dev>; Mon, 12 Oct 2026 16:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791849393; x=1792454193; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RE+TAdR2zoysZ2fy7BxGaPmSY+PSjylK6Zrp2w78nJI=;
        b=h7K4KsrZDg5v1+L1QT/+YCTe8aM/X+sQgb/uU91cl5lKWr3RhZMyAbJiAfpeENV+zE
         77+3V/n4aYEmavdyJ/D1gh351668kOO/BE0QZYawBYeoUWs2w59dQ9XSU5zMrpTAvzRZ
         GUhEr1Aycr+diSGYXQ8CW4WkGLKNalGtwMfkQeMxBeCkjQx029SgfyxHDdzdY6jy2CyE
         wsN8Zes1ksjcCVy72mBRbxv7UvkyotjDvrwMec2zYmyT8kyxoFyrEHc/MHdy43P+OzOe
         QWB9xg5Ezwv74FyRnKIyl5wnSDGs3t6DqqVmJymjS1OQO2EGAQqWqAcQlLrMiBSTPnDt
         jZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791849393; x=1792454193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RE+TAdR2zoysZ2fy7BxGaPmSY+PSjylK6Zrp2w78nJI=;
        b=HJKBdwEzKx2qCqCk/n3bCh/VCcyksIWjyurPNUj8JOns77UaL74GPy8j8pklY+YfMe
         vc3H7DleM8VJvCvxAVHyKMm/gJp/B6nA/aIoHv4xe2NYiOwOet3oQM/9trfOmhU1rRV6
         cn5ZVI/w0C3GRkQeIWFHEqYa7vaOyxvLaBRYNFjrNHzP4pK/TNY4yWbhgK792fmMWFF1
         e14eDyor0R+RPzasFasolSBilxXDt0LoiEnuHOimqMMpkBwtXXcikj+1G4p/S+GaQl5y
         HoQaSRGfxCcgtGtuQCx3IdO7D6XTHRpV2iuBmSFBpmZ6dNun4SJUXcpa10WA8vVTCtVm
         7Edw==
X-Forwarded-Encrypted: i=1; AKwUvBwcygXwwaMBOZvbqXcxdbjPM3K9DyYoqYIzMav01GIhOBfvYcBdBfuy0YLzZ/DFKjnrqBBPPJ0M2w==@lists.linux.dev
X-Gm-Message-State: AFq9FYKuOnGVhzlvypD/qbkvs1e+T+QIe+6NRE9x4k0tI/iup3klzFkj
	zUxLhY5dULuLLzd3YUaVpVwx5ixDsNhpC4WNDF1PvkDgk0cq0ft/C/er
X-Gm-Gg: AYBFou163sQzPQOxZmgzBosRMNVcysk1tzH5PEpUQgSkERh9ah4jve2C4YZOtbwkgvj
	bo8QkSWMOqKZfLBDwlahyj8MXLQMkSVZBlA4s5tNUBMXn1RA3hLjpALqzEfxcc550t1rrwE+Bur
	MznEHVBPMQTkdo1+b2ePHHL15uvGLKpnsrzuNXA4uV8+mwAsvRO6xCcxiphGDOdbvMuebsVJ3bZ
	yyUc/3zZ7Vs35p7dqu+2iMjjwYOyinTIip34BzD3+01TBDVGikhHv/HURysZnxh/EVvaqWbKl+S
	azTNwDjb/eZ82/Jz0px4f0kedq0Pvdh2pJYgoGdWDGp7W2OoqvCaYYn6U/nX7JhmWwjyOC/TdrE
	h4EP/GRFterrxJ/R9oLhO629ERCotP1KIIHH0vGgaxeFLdZ4WLpwU9E5P5Q8crc2AYGH1abAio6
	VYe5EWNGPplQfM6ctZKpfMv3tYbW/IXY1HDuZM5DWSgpegiHRzY6ZWFDJ21F2pbDamnCJQqSxq8
	WLHAYeKB4gZyLK7X32UyNhGlhO6HA81HVMTyMo4sAaCf1nrw/EA9wMB75dFT7FPoQjDsuP3QdEI
	eScZc0B04mYKVxGx6ibKEf2HYDrxHIkTvrVY933uPJadmivrBDOIBQ==
X-Received: by 2002:a05:7300:aeaf:b0:341:c383:9afb with SMTP id 5a478bee46e88-3536c59ed2amr14755201eec.20.1791849392798;
        Mon, 12 Oct 2026 16:56:32 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b690af3easm8686145eec.1.2026.10.12.16.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 16:56:32 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
Date: Tue, 13 Oct 2026 07:56:23 +0800
Message-ID: <20261012235624.77993-2-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012235624.77993-1-alan.tseng.cs@gmail.com>
References: <20261012235624.77993-1-alan.tseng.cs@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A bootloader SPL that follows the K1 BootROM runs from SRAM before DRAM
is up. It needs the root clocks, the clock and reset controllers, the
console UART, and the boot media controllers: SD (sdhci0), eMMC and
QSPI NOR. Mark these nodes bootph-pre-ram so an SPL can use the
upstream device tree as is, instead of carrying the tags in per-board
overlays.

These are the SoC nodes that the mainline U-Boot SPL for K1 currently
tags in its board -u-boot.dtsi files.

Assisted-by: claude-opus-5-5 dtbs_check
Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 3fabfd341..8ca98d15a 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -322,6 +322,7 @@ cluster1_l2_cache: l2-cache1 {
 	clocks {
 		vctcxo_1m: clock-1m {
 			compatible = "fixed-clock";
+			bootph-pre-ram;
 			clock-frequency = <1000000>;
 			clock-output-names = "vctcxo_1m";
 			#clock-cells = <0>;
@@ -329,6 +330,7 @@ vctcxo_1m: clock-1m {
 
 		vctcxo_24m: clock-24m {
 			compatible = "fixed-clock";
+			bootph-pre-ram;
 			clock-frequency = <24000000>;
 			clock-output-names = "vctcxo_24m";
 			#clock-cells = <0>;
@@ -336,6 +338,7 @@ vctcxo_24m: clock-24m {
 
 		vctcxo_3m: clock-3m {
 			compatible = "fixed-clock";
+			bootph-pre-ram;
 			clock-frequency = <3000000>;
 			clock-output-names = "vctcxo_3m";
 			#clock-cells = <0>;
@@ -343,6 +346,7 @@ vctcxo_3m: clock-3m {
 
 		osc_32k: clock-32k {
 			compatible = "fixed-clock";
+			bootph-pre-ram;
 			clock-frequency = <32768>;
 			clock-output-names = "osc_32k";
 			#clock-cells = <0>;
@@ -586,6 +590,7 @@ i2c5: i2c@d4013800 {
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
+			bootph-pre-ram;
 			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
 				 <&vctcxo_24m>;
 			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
@@ -857,6 +862,7 @@ pwm19: pwm@d4022c00 {
 		syscon_mpmu: system-controller@d4050000 {
 			compatible = "spacemit,k1-syscon-mpmu";
 			reg = <0x0 0xd4050000 0x0 0x209c>;
+			bootph-pre-ram;
 			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
 				 <&vctcxo_24m>;
 			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
@@ -869,6 +875,7 @@ syscon_mpmu: system-controller@d4050000 {
 		pll: clock-controller@d4090000 {
 			compatible = "spacemit,k1-pll";
 			reg = <0x0 0xd4090000 0x0 0x1000>;
+			bootph-pre-ram;
 			clocks = <&vctcxo_24m>;
 			spacemit,mpmu = <&syscon_mpmu>;
 			#clock-cells = <1>;
@@ -877,6 +884,7 @@ pll: clock-controller@d4090000 {
 		syscon_apmu: system-controller@d4282800 {
 			compatible = "spacemit,k1-syscon-apmu";
 			reg = <0x0 0xd4282800 0x0 0x400>;
+			bootph-pre-ram;
 			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
 				 <&vctcxo_24m>;
 			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
@@ -956,6 +964,7 @@ uart0: serial@d4017000 {
 				compatible = "spacemit,k1-uart",
 					     "intel,xscale-uart";
 				reg = <0x0 0xd4017000 0x0 0x100>;
+				bootph-pre-ram;
 				clocks = <&syscon_apbc CLK_UART0>,
 					 <&syscon_apbc CLK_UART0_BUS>;
 				clock-names = "core", "bus";
@@ -1085,6 +1094,7 @@ qspi: spi@d420c000 {
 				reg = <0x0 0xd420c000 0x0 0x1000>,
 				      <0x0 0xb8000000 0x0 0xc00000>;
 				reg-names = "QuadSPI", "QuadSPI-memory";
+				bootph-pre-ram;
 				clocks = <&syscon_apmu CLK_QSPI_BUS>,
 					 <&syscon_apmu CLK_QSPI>;
 				clock-names = "qspi_en", "qspi";
@@ -1328,6 +1338,7 @@ usb_dwc3: usb@c0a00000 {
 			sdhci0: mmc@d4280000 {
 				compatible = "spacemit,k1-sdhci";
 				reg = <0x0 0xd4280000 0x0 0x200>;
+				bootph-pre-ram;
 				clocks = <&syscon_apmu CLK_SDH_AXI>,
 					 <&syscon_apmu CLK_SDH0>;
 				clock-names = "core", "io";
@@ -1341,6 +1352,7 @@ sdhci0: mmc@d4280000 {
 			emmc: mmc@d4281000 {
 				compatible = "spacemit,k1-sdhci";
 				reg = <0x0 0xd4281000 0x0 0x200>;
+				bootph-pre-ram;
 				clocks = <&syscon_apmu CLK_SDH_AXI>,
 					 <&syscon_apmu CLK_SDH2>;
 				clock-names = "core", "io";
-- 
2.43.0

