Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792833968;
	b=m1IDFmWyr8lqoGHCjvrBG1tGW6EkILsV6dO7LRMtV5/ltzfYBYxY1EaX5dWy2zi4oR8o
	 pZrPMgMW4LxIJo3oonCyN8/xmWfn3lqiZo+lcTt0/jVUzr96UgDfCjdiy+q9JBC7a4iqX
	 Ww1QOnE3ELnTpnxHETaU1WTZwNHwzNKIzegeH8wcayC646xXFbqqbH5coJhhVrrFCDOv4
	 GigrKY9zl2Z4OsetUkhYrtj5gOqwwsEOxH7/aE3mSFFZvzoQuvofCvwvfwmJ+1P2F7f6e
	 koUBjbk4+P8UwPIME0bEhKldWUiZ15tyQsNZGQ6jCbi4x7+2IRZdPYXSc5Y1dSlEz3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792833968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=X5ZJMOxvmROQRxk8HIdSLxRbfib4kWxlGWVgMaC6xl4=;
	b=qJFy/ajfPwdpqkx8NJvV0TA+4+aOGlvORFosVv/RT8di9V87ubJC8fVByXds8PLjAed2
	 WpOo3FHJuf2AQa6f49JRok0/ZAAMKwD+cfALuA936QHt019qvzUkfPRCHdlJnPBmj0gIB
	 pi2/7xEw8XKTx5lYjDpjkCbVzZ4EwaDxhBWy9QgSxewN9I1yvhTgPTDm32H+AVQDgOZwS
	 XgI7vD+eqvxYL2abx4fqYhiKskd2GlCLf+h7+6LnLw2GlkSEThjgJku6JtZLiAehkyPhC
	 tqjW8hYat0Q/JArDwvXFIhuKbsJyHygfaxxxHkgNVKr6UQl6TdpN/KNg67fAdHjr9xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KpLWeqld;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F45D606A320
	for <spacemit@lists.linux.dev>; Sat, 24 Oct 2026 09:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F45D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KpLWeqld
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ade49a7ebdso494420a91.3
        for <spacemit@lists.linux.dev>; Sat, 24 Oct 2026 02:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792833967; x=1793438767; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X5ZJMOxvmROQRxk8HIdSLxRbfib4kWxlGWVgMaC6xl4=;
        b=KpLWeqldvHMtXXoSOGTA7OnorsRKCs2NT+0FR1pbOHvhYFwCwaHFsrB+PItx5FYsy4
         Q1sxmfiILjEBo+bAQVaXic722zywmZPq0prPYSeXSkVaAmur1kbGH59UZUrJCh3eyre0
         fV4tfrkcKMKkxyIE4Sd1HzTP9Cpbw0K/JYyWdhF71C8jOIry0iVru2DJ2v15E2e5L45A
         XlSvJKRoC6FP5dShzznGfPKWLFHbdtaawLeCLltCaER8TxZ5OSQFUXOAqMLKsHGs3qfP
         4V2obBcNbfrYaGsdZMOuSZ1j9uGKOZ4wtsWmLyehSqcG8AiRLH+xYor2ZmimeaI9aIcb
         J81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792833967; x=1793438767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X5ZJMOxvmROQRxk8HIdSLxRbfib4kWxlGWVgMaC6xl4=;
        b=fOsV5o1EnP3R0l9hKGHKyZzk7jt8yyhxemmSXIBUy7ud4IWCfwEz7zS9tDgYTfNmrC
         vHtidQ2MboRfZCY72fGhBXQUJr9ix6jWecaLZsujmjDPR5Gg8K0fZqbJYdkqmE3AoHBi
         gANWRhFDD9F5iQn1vmtBKFfWBJVl3ahKmU6p71f3HQ+xUJqS9DcwTNIwLTQIf1uoUsvp
         W9TwNnp7hCf+UBWvQlTsCESXk+rhIQyHVc0qWWXzFFxynuCfb8DBgrdA0Hx3tkPOuODy
         PMyx/kyptML0B2wJ339TPygukxRhZOVekkwD/zQBHx2gtp0D9N+J4NwZhzbDpb42Mqd5
         JMoA==
X-Forwarded-Encrypted: i=1; AKwUvBx+SyOw7XeyRukmSRCC20dT1aatnXnluzJLGpxj2SzDTwULAVMKqjK3vQh8FmlLKHQrMiDizGu5/w==@lists.linux.dev
X-Gm-Message-State: AFq9FYLTMuHDzcf8BN8FN6nQBcNrZXJGuF7yj/Q4/JKkHlF1ko3152Ns
	gahxllYxVuSDTKoDJtiEcsnZtUP3J2dU7h6I9n5ciWPDeqRxckgQ8gen
X-Gm-Gg: AYBFou0MWmNgqQOdMgDW2VuLB6ABiHvVKqlwj5slIzzxvHfASO10WNx5taCI+W46UEg
	FxCE+L+prIALwXOuoYYzDTbGGWCZrnLGmoHnp/qSfFIUQ2MLU4toTznR44up0v3CMk8neFJrQkf
	K88V1NFSktNT70o9oYtGdna0g0VUqNlnQtVPOm25CTBn9+R6vNFOVZIfelM7g5Uh/hygbA/7yxV
	DtBT7s0dpTMVwbjtQeCBzdEonJGvhPVm2CMlweicWbngwOKFVG5cOHOXkr82pMmtcX5YbLmboaU
	ZIrV86xe4toRgSvHWmVhO5+2jIhwzasSDIac/On0tSONBvscHuJ3AaKVFBYh+/t49ACbE2YaNb7
	H/6mX8eatLJoDKiP+H2WdThhNawlKMNAzm1J0n2UqKQqv1Fe0882ULmAFC6glG7QnScOoF9YUJ5
	Do/sgm9toeLe2km23VPNnhT0y68hte4qR8t+1Lx62vV87TeNZDntvlwfJE/3aKDY5DIllUEQ/il
	5wd9w19MvTR9J7fOU5xyn3GOV/jdg+PgOukFjbIKRccfWdoaPoygCdt5QHYwJCNwsxw8CweHqyp
	1U9ADCt7sYP1AXno0lZtazcA0YKjKpow4q9y7f4WJSzr627fXiYmp6/wKCT7NQM01QBdzfhPyID
	18c4f6baXtZejPf7K1Mdr9TZ+3sbJTy0X+6s=
X-Received: by 2002:a17:90b:1812:b0:3aa:fdad:7d6e with SMTP id 98e67ed59e1d1-3adeac04979mr1472063a91.10.1792833967618;
        Sat, 24 Oct 2026 02:26:07 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba38910sm1392312a91.1.2026.10.24.02.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 02:26:07 -0700 (PDT)
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
Subject: [PATCH v3 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
Date: Sat, 24 Oct 2026 17:25:57 +0800
Message-ID: <20261024092558.143621-2-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024092558.143621-1-alan.tseng.cs@gmail.com>
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The K1 BootROM loads the next boot stage from SD, eMMC or SPI NOR into
SRAM, and that stage brings up DRAM. To do so it needs the fixed clocks,
the clock and reset controllers, the console UART, the boot media
controllers (sdhci0, eMMC and QSPI), and two I2C buses that every K1
board wires the same way: i2c2 to the EEPROM that holds the DRAM
configuration, and i2c8 to the PMIC that supplies the SoC.

Mark these nodes bootph-pre-ram, the phase that sets up SDRAM.

Reviewed-by: E Shattow <e@freeshell.de>
Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 3fabfd3411..8a954f56a9 100644
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
@@ -544,6 +548,7 @@ i2c1: i2c@d4011000 {
 		i2c2: i2c@d4012000 {
 			compatible = "spacemit,k1-i2c";
 			reg = <0x0 0xd4012000 0x0 0x38>;
+			bootph-pre-ram;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&syscon_apbc CLK_TWSI2>,
@@ -586,6 +591,7 @@ i2c5: i2c@d4013800 {
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
+			bootph-pre-ram;
 			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
 				 <&vctcxo_24m>;
 			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
@@ -726,6 +732,7 @@ i2c7: i2c@d401d000 {
 		i2c8: i2c@d401d800 {
 			compatible = "spacemit,k1-i2c";
 			reg = <0x0 0xd401d800 0x0 0x38>;
+			bootph-pre-ram;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&syscon_apbc CLK_TWSI8>,
@@ -857,6 +864,7 @@ pwm19: pwm@d4022c00 {
 		syscon_mpmu: system-controller@d4050000 {
 			compatible = "spacemit,k1-syscon-mpmu";
 			reg = <0x0 0xd4050000 0x0 0x209c>;
+			bootph-pre-ram;
 			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
 				 <&vctcxo_24m>;
 			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
@@ -869,6 +877,7 @@ syscon_mpmu: system-controller@d4050000 {
 		pll: clock-controller@d4090000 {
 			compatible = "spacemit,k1-pll";
 			reg = <0x0 0xd4090000 0x0 0x1000>;
+			bootph-pre-ram;
 			clocks = <&vctcxo_24m>;
 			spacemit,mpmu = <&syscon_mpmu>;
 			#clock-cells = <1>;
@@ -877,6 +886,7 @@ pll: clock-controller@d4090000 {
 		syscon_apmu: system-controller@d4282800 {
 			compatible = "spacemit,k1-syscon-apmu";
 			reg = <0x0 0xd4282800 0x0 0x400>;
+			bootph-pre-ram;
 			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
 				 <&vctcxo_24m>;
 			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
@@ -956,6 +966,7 @@ uart0: serial@d4017000 {
 				compatible = "spacemit,k1-uart",
 					     "intel,xscale-uart";
 				reg = <0x0 0xd4017000 0x0 0x100>;
+				bootph-pre-ram;
 				clocks = <&syscon_apbc CLK_UART0>,
 					 <&syscon_apbc CLK_UART0_BUS>;
 				clock-names = "core", "bus";
@@ -1085,6 +1096,7 @@ qspi: spi@d420c000 {
 				reg = <0x0 0xd420c000 0x0 0x1000>,
 				      <0x0 0xb8000000 0x0 0xc00000>;
 				reg-names = "QuadSPI", "QuadSPI-memory";
+				bootph-pre-ram;
 				clocks = <&syscon_apmu CLK_QSPI_BUS>,
 					 <&syscon_apmu CLK_QSPI>;
 				clock-names = "qspi_en", "qspi";
@@ -1328,6 +1340,7 @@ usb_dwc3: usb@c0a00000 {
 			sdhci0: mmc@d4280000 {
 				compatible = "spacemit,k1-sdhci";
 				reg = <0x0 0xd4280000 0x0 0x200>;
+				bootph-pre-ram;
 				clocks = <&syscon_apmu CLK_SDH_AXI>,
 					 <&syscon_apmu CLK_SDH0>;
 				clock-names = "core", "io";
@@ -1341,6 +1354,7 @@ sdhci0: mmc@d4280000 {
 			emmc: mmc@d4281000 {
 				compatible = "spacemit,k1-sdhci";
 				reg = <0x0 0xd4281000 0x0 0x200>;
+				bootph-pre-ram;
 				clocks = <&syscon_apmu CLK_SDH_AXI>,
 					 <&syscon_apmu CLK_SDH2>;
 				clock-names = "core", "io";
-- 
2.43.0

