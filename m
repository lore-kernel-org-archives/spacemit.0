Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439633A7585
	for <spacemit@lists.linux.dev>; Fri, 10 Apr 2026 15:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775833525; cv=none; b=SjKYPCm98UY6CkgsWINEBH+VV4QQbbbgONOPj5Isq4UGNza4NS9HtQZfzFNVHcX5vSviUhfAKZNV5nNlhRIvwOjGMcVyAgF5gruRW/hT9CLKBWl2FE65CEhaNAv0ZDuCdW6j0S9/Eu9Bf5+je0KBhXNFMDQQmTCpNQhJQ5OXjyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775833525; c=relaxed/simple;
	bh=kCQLWikKMQAZX52zP7mCbrq1YoM5AGwQQLQGtUCpDU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pxpkKr3YvY8i0d1KLyvvex2ILY5BlsiUaQsDIjRN5rIOTXXmpy/0pyFUjSe9t79jjIO0lB1NmTaAYj9FaCy7/nd+EhW8IlSLULKQfK3LqoKCr28RK2eZsO4qlL0n1aO9S+1ATwuaDs7wumbmc0y1AlecraBLnBvvn10VNMma8dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=hCycDcD5; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="hCycDcD5"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c76eea1672aso797989a12.1
        for <spacemit@lists.linux.dev>; Fri, 10 Apr 2026 08:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1775833523; x=1776438323; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yoe0HYlE0K0NbksazLkXaws1bR4DgN+t36khjDPYQVk=;
        b=hCycDcD5dFxKKEAmvkg3DkAmYThIXL1whhM8dPiUEttQNQ5wE3AN/RTkpkaj4gbHKc
         C4EEbbcLQT9ledBw8JixEqAQP0opaKACTVyJr7YwGmJ3JX53GzkzJHS+Bg7ObbEQVakL
         L+1vZeygkAzVSS+JmfGG2KqJ2VmB1Jw1sKmLSva8Y2PYZaIsiVkIlZGjCyAgaBrlg3xd
         SjASb8maaGlWlQiE+iKLnPiI9npnxegOAO8Ka2M8qVtPx8Zx0BrIzZu5MMMHqy8/YjX9
         b4r60WcY8O5krEQcJ8ogbIncRnV1r0OyFrOWLJ5H3NtlRuRFTHUHDIrjd5+g3xZInESF
         27/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775833523; x=1776438323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yoe0HYlE0K0NbksazLkXaws1bR4DgN+t36khjDPYQVk=;
        b=iiKAWEN54ePNxs95ltmvDhvDYmTkm5zGCxuY1PVBeKo2E/x5GqFgTh2HdOfvNV+p2i
         iPEocUnGkRe/PNyGE39ddt/eJYLEpgH5GlEdkS92d7x9uVmBIRjSHHgI6C4zmQOcXmqi
         IU7khkppN6KDfyaRPTtnqB2LVBksh3RuhYfqWlQxF2fpIbggfGOiYPUJiAoz4kUE4GmC
         rwc0oSDBTgEN/IBGB8VJn2kuPyNn8MsybcL59aQVkrMubCV5vjlNjPbXCIZLR40/AgaP
         5xrLOacRTutMfgBcoL9nP4kwDuf/CM3C9OXAx5oL2Y8v0dZz0zXdRxcvp31DCHEOIAJA
         rVyA==
X-Forwarded-Encrypted: i=1; AJvYcCWmLNon7hF3EngvI7t6mT5AfmlncU5pq+rvbcAJhTmO+PcrrQ5xwwT5yT6qpYQ3FFP7KBzQJO1AMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0NPDzt8uxPQLIuCXPhozyujziViTFE1XkMq1MZWSajC7TIDVS
	FpBOniuUDH2a/7cg9cfuHz1f8ZDw14EBCzfI358X3Vm8nKdUacx23BzMHB6GkjZL/gk=
X-Gm-Gg: AeBDieuz/1L5Zyy0gN5YATPDSqjQSH7FNTtKPTmHitPFM1k1onxmfayZTdFhhveSP5h
	iJQQ5ScRwgift1JXkFiZCS8BYBFT1V0iWB//XHoh2J/H5cr7THtOZ/cYiz2Emnvi1wgZ6HfzURn
	by+0W/0tlZJdVC1FOsTyM2MkY6uY2ppVnGvHD6vl89ObRcDUmtQLw9O2UlmRD/7T0kWuBitlIi3
	xoa4XW0SMxosWyRjxZFtZ1PSlBMLLhnYp3pbiDEAT3rj3EEvOf6zTpHXjutl3R1ehHHJDaoLtto
	X6f435fdOMzxa8rgXQM0HH2PkfuF19A101WaNTv2oLoLOnHJFKXNhbRO5v1u3lNLmPmAjRd2kSI
	48cn5JlIzIl3Wo13kQr7IkxY3MGsnmxDl6aP5M8OdoFyjwbluSR50U49xVgiyC88qltMzi959pG
	InOSftz/vyyumLdV7ZEzLvxzhA35ZlGil9BWvv1+XtfJ0UUlFJIHLR+DBWAxmoTV3I
X-Received: by 2002:a05:6300:210c:b0:39f:3559:7516 with SMTP id adf61e73a8af0-39fe400f81fmr3967582637.48.1775833522543;
        Fri, 10 Apr 2026 08:05:22 -0700 (PDT)
Received: from [127.0.1.1] ([45.8.220.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4d5413sm2970532b3a.40.2026.04.10.08.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:05:21 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 10 Apr 2026 23:04:22 -0400
Subject: [PATCH v8 3/3] riscv: dts: spacemit: define a SPI controller node
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-spi-spacemit-k1-v8-3-53ebb48a4146@riscstar.com>
References: <20260410-spi-spacemit-k1-v8-0-53ebb48a4146@riscstar.com>
In-Reply-To: <20260410-spi-spacemit-k1-v8-0-53ebb48a4146@riscstar.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Alex Elder <elder@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Alex Elder <elder@riscstar.com>, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.1

From: Alex Elder <elder@riscstar.com>

Define a node for the fourth SoC SPI controller (number 3) on the
SpacemiT K1 SoC.

Enable it on the Banana Pi BPI-F3 board, which exposes this feature
via its GPIO block:
  GPIO PIN 19:  MOSI
  GPIO PIN 21:  MISO
  GPIO PIN 23:  SCLK
  GPIO PIN 24:  SS (inverted)

Define pincontrol configurations for the pins as used on that board.

(This was tested using a GigaDevice GD25Q64E SPI NOR chip.)

Reviewed-by: Yixun Lan <dlan@gentoo.org>
Signed-off-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi    | 20 ++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi            | 15 +++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 5971605754b35..61b93765f42cf 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -14,6 +14,7 @@ aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
 		serial0 = &uart0;
+		spi3 = &spi3;
 		i2c2 = &i2c2;
 		i2c8 = &i2c8;
 	};
@@ -327,6 +328,12 @@ &pcie2 {
 	status = "okay";
 };
 
+&spi3 {
+	pinctrl-0 = <&ssp3_0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index b13dcb10f4d66..34d88334e95e4 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -570,4 +570,24 @@ pwm14-1-pins {
 			drive-strength = <32>;
 		};
 	};
+
+	ssp3_0_cfg: ssp3-0-cfg {
+		ssp3-0-pins {
+			pinmux = <K1_PADCONF(75, 2)>,	/* SCLK */
+				 <K1_PADCONF(77, 2)>,	/* MOSI  */
+				 <K1_PADCONF(78, 2)>;	/* MISO */
+
+			bias-disable;
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+
+		ssp3-0-frm-pins {
+			pinmux = <K1_PADCONF(76, 2)>;	/* FRM (frame) */
+
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+	};
 };
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 529ec68e9c23e..1ecb09e58042f 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -983,6 +983,21 @@ qspi: spi@d420c000 {
 				status = "disabled";
 			};
 
+			spi3: spi@d401c000 {
+				compatible = "spacemit,k1-spi";
+				reg = <0x0 0xd401c000 0x0 0x30>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&syscon_apbc CLK_SSP3>,
+					 <&syscon_apbc CLK_SSP3_BUS>;
+				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_SSP3>;
+				interrupts = <55>;
+				dmas = <&pdma 20>, <&pdma 19>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
 			/* sec_uart1: 0xf0612000, not available from Linux */
 		};
 

-- 
2.43.0

