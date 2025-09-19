Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FE731FEE7
	for <spacemit@lists.linux.dev>; Fri, 19 Sep 2025 15:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758297566; cv=none; b=uw+VMd26UNJldQ+bVouD8RTeDTPa+1N8foaqcBGxeKXGyE78JFEMLPlnz92ujb39vnE7awVDFmWwUOQ1ZbIKF4lLbHhtnzxWJXteNkvPnf1f3eGa5Wfo5p1HTyIqo1QRM/PBKZYOJqKxxGo3Sd7izkrYM00xfzsPj8mPCTbyuRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758297566; c=relaxed/simple;
	bh=NlMkLdvD64IRA/MwFZvIoBYriU4Nid/OitYs5+FRBUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cOHYNetWrFRhpXr7s9o/wIYT1/Jy3DZ8rpMiGY2s3fKqoR1vKxrhEfpU37fGe4g/O1eSg4j4r3z5Us4lmM/CvsLAwQlMQibGtB2az/zts6HLf2zy0JECtk/9x/1GesYkrEkdixS+f++cPrSXQcIa/LQ6wmJ0qkeNDx8PcGp/HD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=izbydtoF; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="izbydtoF"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-4248b13dc1eso1365605ab.3
        for <spacemit@lists.linux.dev>; Fri, 19 Sep 2025 08:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758297563; x=1758902363; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oo7s49MWiPP0XpbU9jJjL7SpuVNC45j91Je82FzACGw=;
        b=izbydtoF69DZs9MDf9c6zYkDjmklm2jodvkSfKdCtBlvShwc86pUPVr/2dn4Q2Ryts
         NL27I5Lv7nZZizn4tfbDgClc61J/DNK9c7bMNZtb55G3jfQsGYcQ6FZIj/fyxH7M0Yli
         2lPujO12BZaa4hHbWrFGeQGVEuJQvomA2Dpg7O2SZUbKQBVQxiklKuxnYdvnvLdCJr5U
         UZPMKKgZObvsT1jru/BJjzW+whlY9qfH+FewM45iTAQ0SmVgsWVzthkmlp2W/mnd6shX
         z0fABVlFbSY2Q/12dIU+ENa2T//BVlBVLNmOIHQCwmlUJLSPBC6Pib//1zZO7DW/aHtv
         BjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758297563; x=1758902363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oo7s49MWiPP0XpbU9jJjL7SpuVNC45j91Je82FzACGw=;
        b=KvNCHuMyUm1DYTwYwSAsQuoaWTndc+nmj6bykRzaA2DYWrGvT7UoTOWXI17RnKKGV5
         mGbDN7foCf4roIHUSF0iqaONTzsDhE+Czrb4LdQWU++sDzpTTbcEnE+04B/TzjekBr69
         IT+CQ2ecK5AaPZBeY7obj0/LSOhQ5xb+49CRFsrtkEiq3D6SK48+W3WChvFUN6N1K0jh
         +YXmIReEcET/+7NGYGTsCliNu8JgyWYKzr3ScguNp2SDqGAly81qHGG5scRMcaGoMSxX
         luww5JiZmGHzC7r5snPJLQvi0MUH/tZ3iUGPFLdhTE5xwmNgCmFT2FVPa8Xq5zrieoRj
         kFPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFVAP5sX+ZFKWbLCqx/R1cdg7o5egEDhGxXNl6gsK6hHhBgl0MEdWM4QeSjydJ2EDV+fWzl7isHw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2IgHsxUBfsJMdFpVQDq3ULRhSEwcbBphWiiwpJp1p3UiTgm9h
	2xAkJOK07M03OkoQNlRtXKkEGu2uKAScaKggQcOoeg85LT68AQf4opDYUFpY90H1Gyg=
X-Gm-Gg: ASbGncsL2knv2F0hN/SojqqOX9c0BYN48R+hUnYsy4VhgXIVw+3FPaDwUO3BWIBqSM+
	ACUFqlao/x2b0O3DWPPocWgAgh5Nef0SjCGdC+1VVobJsLtpqbvItkEUpwK+eucMyh/2Nj4pvz6
	NdjQvY0lZ7+nr7U1g2AJ8z2XftM0qGm3jm1f3atxW3o92gTgBfDyfs1vKqnD2drbR0P/LrRK4rn
	YUYXp/hcv4l98JZzBB4/v46Z6vyx1hoUEG0jBu13zu7LPATeVoPvoebey/qQ+LpdT8wsZXIg/oF
	3GbZtywTyP1oJVudfauHb5AOB7AG5GrV1ZQXVP6Y0ETiu4FxZfZMXhpxVcjWBnsmtyID6NRtbvA
	A/ixSDLEcI08wS7xBOTiQt5iiHiuAXeQRZyo00UVMEJZjNMulHRA5SwXbNfWycLdWug==
X-Google-Smtp-Source: AGHT+IGv8Gt7EaPcdotr9gY5Yd6METFFETdEj+xRnRLa13tdcKb2eRmmBl1GTwt/NGaaW1sg3ZmbBQ==
X-Received: by 2002:a05:6e02:258a:b0:423:fdc4:4e35 with SMTP id e9e14a558f8ab-4248197e1b4mr55249165ab.24.1758297562539;
        Fri, 19 Sep 2025 08:59:22 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d50aa460bsm2250898173.52.2025.09.19.08.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 08:59:22 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	ziyao@disroot.org,
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
Subject: [PATCH v2 3/3] riscv: dts: spacemit: define a SPI controller node
Date: Fri, 19 Sep 2025 10:59:13 -0500
Message-ID: <20250919155914.935608-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250919155914.935608-1-elder@riscstar.com>
References: <20250919155914.935608-1-elder@riscstar.com>
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
v2: - DT aliases are used rather than spacemit,k1-ssp-id for bus number
    - The order of two pin control properties was changed as requested
    - Clock names and DMA names are now on one line in the "k1.dtsi"
    - The interrupts property is used rather than interrupts-extended

 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 20 +++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 16 +++++++++++++++
 3 files changed, 43 insertions(+)

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
index aff19c86d5ff3..205c201a3005c 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -76,4 +76,24 @@ pwm14-1-pins {
 			drive-strength = <32>;
 		};
 	};
+
+	ssp3_0_cfg: ssp3-0-cfg {
+		ssp3-0-no-pull-pins {
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
index 6cdcd80a7c83b..f8c37d16968e4 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -856,6 +856,22 @@ storage-bus {
 			#size-cells = <2>;
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
 
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
+				dmas = <&pdma 20>,
+				       <&pdma 19>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
 			emmc: mmc@d4281000 {
 				compatible = "spacemit,k1-sdhci";
 				reg = <0x0 0xd4281000 0x0 0x200>;
-- 
2.48.1

