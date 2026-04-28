Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B253E3D3CE8
	for <spacemit@lists.linux.dev>; Mon, 27 Apr 2026 14:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777298541; cv=none; b=Q9nYpSMn8aobZB5zctTsPskhFbAsLy6486D8Jgmlvi8DC+54+F1YdQHrz5vV5kpJgKY9s678seTAsT4PlpUbS8+Km4DthtU20iJyYpt2w0zv5DHdEtl6boKhVP8VPx2iOoF9XVCmhvcja4Ik5Y06wRia6fskkjescDJkd+cLUVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777298541; c=relaxed/simple;
	bh=DL7WXDFY1O5eBh2tmSI3Zsd/h0SrUvqrCzd486m+vE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KAHSpSVoY3bj0UvJnKgWBr42dgdaYhkbEVrfeR0o7hhzLozAGdEfm4J/d4VeuQhHFKypcKCe1hQkwZGZQzO4VyKDEjZe/cGhH0G9seNd7VxcSSY+KzKoTEwEwaHOVH0n6Q21ZPedVwQ3oGM/e95aReEUlp9H7Ygfcv3mr80e5z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=amP4Mo2d; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="amP4Mo2d"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b2503753efso106019665ad.0
        for <spacemit@lists.linux.dev>; Mon, 27 Apr 2026 07:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777298540; x=1777903340; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Zn1VHf2vGq/Rgp6tmVMmYAtaKJKXMEkXpNhjeJ8VMM=;
        b=amP4Mo2dhohqFIYTQ3QxJFQyXqHH5m+oiREhE+HJj4D41EcaU23JtE6QL7LM26ljTy
         LOy8L1KALm4YQaQg7eo//nboNDXXsjS/t9nGC48CmJoCgUG2Ld/NV4jO/lxEjcLygSbX
         rlvTqDCi/XQwSfncbG9QhdLKOBCQ+tCaHbgFjpZxxt3T6IX9+ig7Ac1o/I+tJ6Jtpf9+
         DrXgaHfGrNweY305AFpRUJsODjRkyS285N6bXOO3RPbL3x9xNTKc08uQVV4G7fbzjlSb
         iLEhxr67SnNJXWs/wXUjYra+y7Izj8GRp7Z3v2kproXSLGbUcyKEAHw15+F2oGcdk8ae
         U15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777298540; x=1777903340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Zn1VHf2vGq/Rgp6tmVMmYAtaKJKXMEkXpNhjeJ8VMM=;
        b=FzXjfBoVpfDn9ihjHy/ClbeEvRErijNhw/1kD3VoltACyNHDl3WYDKZdJwyoanjFfX
         W1EmBuvRhXuGW7c7XiU2s7xUouFo4W41mQtBG3gD0nLUtK1HfipzMFwLy2hWM1Ruwfl1
         3WtZ+8blpTyY5r9X0fyDJMy434M5EahEPsGew0TykDu5lADYlhINCcLS4rl2RM4ZkhXv
         ErR6D7FjzminaRNU26JyqypQQoWOFpLtU7YOd2acd0sm6H8aMsG+AoojwoiwrPmf4UI7
         c3SaEuUu4P1yOd/Goc+z/s9TfQCYdvHnrqWpv1QhPKw3Ec/pbTFoghFs0DyY9/6r5IOB
         QkzQ==
X-Forwarded-Encrypted: i=1; AFNElJ+n+Q3VtjMtX/wbc2EjQ6+YlldaG0t7DSdK8ajakR13mkyEl/c7vY6pEPXe8IhlnO7ahrbghWVrRg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxbzUIHHTc2alxbC+OhDAyxcEUx7VlxxvyI4roFnXr+mhv6qrJa
	87G80fAbg5VK6Q29R7He4WPGNC28J1y+7bf/oKgBX0sXghcoP2c8Gb2B3FLL9Z/TxZI=
X-Gm-Gg: AeBDiesetFqXR9Kh8UwuGbWd3wsY7BGpL+2tt6R9Qxjf78MPffFM0wa6BIGpYuaMwmx
	flWR7D8lYotg0Q++G0QdzR7AHithPpNG5cxpwpCyjGHfjxpo4h6/N0nQtY5P1zdgUoAWoCQjslx
	Ot28dV4tXEY15O3wggiNxV48h9D9izeVLq+dpaumTR4g95BA/vbDnhM6sjYHoFrOhKkkRvgL0jq
	DajEi0be2B7ZTWOVByoeEmS7JQgXsuc6oxRrlIGzlQf/fztZPskLERTNgNGvzVWSYrEVOEcNC7N
	rI+1h490yItxfUwJFWovrKALCJlcJLesD14kgZG4j71/D571leuvAYDwMy3BZ2aM6qy/CHkSr4a
	jiBS/6DB358xczvPDmcJaoRh9z2Kkk3J6zPWb+heq4rSaD/VuJb1z6U6x/HMyrsIaXXkrVTOjzI
	LtMxW8/OuRe5WpezNPKxXjWc5B7rWEmkO6MfF4BEvWAzBd6mpyWo0sug==
X-Received: by 2002:a17:903:3db3:b0:2b2:58a2:c8a with SMTP id d9443c01a7336-2b5f9d68827mr300145985ad.0.1777298539927;
        Mon, 27 Apr 2026 07:02:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::3016])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff98csm307143625ad.3.2026.04.27.07.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 07:02:19 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 27 Apr 2026 22:01:29 -0400
Subject: [PATCH v9 3/3] riscv: dts: spacemit: define a SPI controller node
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-spi-spacemit-k1-v9-3-ff753b551302@riscstar.com>
References: <20260427-spi-spacemit-k1-v9-0-ff753b551302@riscstar.com>
In-Reply-To: <20260427-spi-spacemit-k1-v9-0-ff753b551302@riscstar.com>
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
index 5790d927b93db..9429189354d6a 100644
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
@@ -335,6 +336,12 @@ &pcie2 {
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
index f0bad6855c970..f8747190d2e12 100644
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

