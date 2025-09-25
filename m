Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB5730BB89
	for <spacemit@lists.linux.dev>; Thu, 25 Sep 2025 12:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758802647; cv=none; b=NZQLR5l8LITYO5AeVaqXdrO/HdRvTY41Qj0y0D8E2RmaG284TyMIlnvXDNgeJa1wMTD/wZDZ1KIlCp9xF9BcVV++CkXIdiFuJc/NrUp9wEBP3Objur9Pi8KPen9K5EGr+MHUNXPlInRPZBP01LLl+nic1ISc8tCGcp1sltigpDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758802647; c=relaxed/simple;
	bh=QkyaeYYrIMyMEzp2LNwQWfpvfE7ML4Lbu0zpaLJziR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m2CWW5XGmY9U7/Pa608LpDUiBfykqnXihQ7LBtJQ89/qbKdGYxPeozNNN0Nw4ZzNuWxNmII9j2Oi262XGUPsl/LB/opuyUxjPFOqarbOM9A6qL8kuayu54goERmi25s71kmWP2RSvD8TRA9g/k4MkSoL2re/HqbybyM2V5kZV7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=CcmD+XMn; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="CcmD+XMn"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-8f33dad2d7cso45218939f.1
        for <spacemit@lists.linux.dev>; Thu, 25 Sep 2025 05:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758802645; x=1759407445; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8aUdb5J2bZ3LCDFWJY9eLS9X+bRVmSq7qRBdOrt16bI=;
        b=CcmD+XMnAEegIM+6by9RulT03AW+FMEUlEiI90u8VsHhv8s+6tFHbPcWCxFT3jeMSQ
         CS1Ci3oayFJAkvp56gpvyzC3F7fM6wX6qPFoqM3kRUdAPWzmxn/tjN8Qp4iUanPxt1D1
         sgvOLOjHPqONjFPNJpeudCUvsFXKihjM1N3Tqi7F31muX9+vlmobhJlEauTIdqA4FXBH
         +SiXrXsjIiDjgdD8whJZNLSyDbKmdqfepEBJN4CdTkUJ5sm4GJsc4eh7J759kGDdxnoj
         HCpW6vnu5vvpv8M1mgSVyBhFYdq/9ht1KPwj62aCixemu5yTsQBI6XghUBl9fIk6BmfF
         Pk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758802645; x=1759407445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8aUdb5J2bZ3LCDFWJY9eLS9X+bRVmSq7qRBdOrt16bI=;
        b=dM1osKDYxA6WeMuxQWXrd5Ay+DGpHumhWW170AXm3vN2m+e4WD+HaJuvbRIxL/FdHm
         6wvOpgae/dMigQQViLR4NE48QS1WXy4CvPLvHP0QhksjoMZ8UZm5ilLD9kd3gLJQSxV7
         bP4vwmH7S2VqBat9VuiMSAvIamq36Rm28TcIkJgOzM1U/2Dl27d8M/tO3WllRvLiffV/
         AkGalYzkhcQmhQPWl7pFOZ4DBZyiq/WOsBvXnzwMIRwnpssEKGjf1uwndOnuhHsxHAbk
         eXM1Vs7WdBtUHolFvd0J5reBIkD4WMlPetbChR5DFMUCDTlxJ9Z6l/dBumgV8sYmV+nx
         iLyw==
X-Forwarded-Encrypted: i=1; AJvYcCVOeVPU/8o+8EsVHIZL6kTm9bTnf/1JhuGzKh0p+UBcqlHupPsVoCHmyloEMnKkbNQNwf+EORcgvA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwehLZkww8K39EVQYNAb7Yg4Hu/lx7PUrKGQ/fcFSlIwplIJ9uv
	3Zd0XNGppQWwJivf+2x1IoXjsHwSB/7aZWYxF+2KqY6+niAFBx2IOh9D/p6pR7fPVec=
X-Gm-Gg: ASbGncshJY6o0VVZmWe9ML/P8x8bbT0e90rPhRRMTwa4xNvLoHe1nDO1fou1a6SGYld
	spNiVcoblQH4Aban7oJAd+g9O9v0dupqxmeLFp+s94JrjHYuMLRZX2cBJibdHLh1YehNCdvNK+o
	PD4GownclDepV5cR83bnZDs4FvrdmFVdSZzQv70OxQUQnMSawAUoz8m9+J7Iibn6Z2U6oAfwOvQ
	dEZBf0SjVZt7zyTHRubzJBWS/mdHXoiahiQZEZ+sF30/fI9ZYeUq0MCckEIwwDMsIbyH1RrupP4
	Nd+vL/IJT6OmjN5H1t5BSXNOkgnRikRP9+My1mbNyHvAvtIcIJ2fDvCH8I6a0iRG3PH0QfF2dCf
	7rpKrdwYIzb8NgCG2ZBnYZcntqmOBDYq4JfR/pnFuz2tZffwAIn1iES2SzAVXgrjLJg==
X-Google-Smtp-Source: AGHT+IEjFx3AHkVzoNPeHiWmx7pPFWYjcoRPK4j3eY6oFpbVIi6PpgfcNkjAzfPEtCd6T08qkTPNsw==
X-Received: by 2002:a05:6602:3cf:b0:8fc:4226:5d2a with SMTP id ca18e2360f4ac-90152604875mr506586639f.5.1758802645032;
        Thu, 25 Sep 2025 05:17:25 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-9040c57fa59sm66918439f.16.2025.09.25.05.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:17:24 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	ziyao@disroot.org,
	junhui.liu@pigmoral.tech,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] riscv: dts: spacemit: define a SPI controller node
Date: Thu, 25 Sep 2025 07:17:13 -0500
Message-ID: <20250925121714.2514932-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925121714.2514932-1-elder@riscstar.com>
References: <20250925121714.2514932-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define a node for the fourth SoC SPI controller (number 3) on
the SpacemiT K1 SoC.

Enable it on the Banana Pi BPI-F3 board, which exposes this feature
via its GPIO block:
  GPIO PIN 19:  MOSI
  GPIO PIN 21:  MISO
  GPIO PIN 23:  SCLK
  GPIO PIN 24:  SS (inverted)

Define pincontrol configurations for the pins as used on that board.

(This was tested using a GigaDevice GD25Q64E SPI NOR chip.)

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v4: - Formatted dmas and dma-names properties on one line
    - Renamed a pinctrl node

 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 20 +++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 15 ++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 2aaaff77831e1..d9d865fbe320e 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -14,6 +14,7 @@ aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
 		serial0 = &uart0;
+		spi3 = &spi3;
 	};
 
 	chosen {
@@ -92,6 +93,12 @@ &pdma {
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
index aff19c86d5ff3..6ce56584ff473 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -76,4 +76,24 @@ pwm14-1-pins {
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
index 6cdcd80a7c83b..ce55897d34fac 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -797,6 +797,21 @@ uart9: serial@d4017800 {
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
2.48.1

