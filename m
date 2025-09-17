Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FC730EF97
	for <spacemit@lists.linux.dev>; Wed, 17 Sep 2025 22:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758146856; cv=none; b=h03U5B6ns+SPoPdoyEgoS8ffOezwVs7ItVsVh6vMbIpSqpfvayct6xAZKFoniWEhNtgsWidfrQGCVqzUSLer13002AkTUskhpuaWpA8spKI9H8YrOIoT0MQNQdkZBeVlfEXtNxM1tDGXipy7aJDBh3deOcalr6oe7nOI6a0lRbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758146856; c=relaxed/simple;
	bh=LQuphTXldy5NKx8fqzkFlqI6SZIIEj7x/KiY6+KNrTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SLw6f4SkTm1YZFnVoMeJq8/QosoJBAWpAg1QLib0qwIdwxXWfUyIPgb9Psu8cdbuKRR2yRwyHmb9eGAT3/rwLW7nl7ruN0t5F8jKHGJoP4ycfsEn3gkCj4Rm/6ITA8F/49Wb/LACYUxdxSznpLmtimxtrmSaEtAk3tevUHgZUu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=vYhq15Zh; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="vYhq15Zh"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-890e5bb3100so10565439f.0
        for <spacemit@lists.linux.dev>; Wed, 17 Sep 2025 15:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758146853; x=1758751653; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plxR1Q0OTlig1zTxHt8JGiXb5CbrsV82EqogeHId9hQ=;
        b=vYhq15Zh2zPuSu3NeLyoFBKa7HrAaAOsR9ubU2nTl0IfFr39fIuQlb1DfRDJTWYzsP
         SdOhYyQblSy50KJOvmKN/w1L22uuJFDsRVukgue/cSZ398UgBLRLb1d7OV7igW1kYkMt
         PimmGZrneovjd3n8wDLmNXgfIRNaf+93DUTPO72fg5It36UF8aLlTBMHn6uD/2sNQPJU
         CBjEVbiLvAGkgNUEIXP3NfwCzEhRtB9m4c4cfOI9z84zc6iG/TSRC4rfwTIeJtGVCNcs
         qP12KNYODw9xljxvt5grp73a08YS/svtmZkx2fwiKmL7g1QDYi1KzoRpalYCHW7oK+bJ
         AH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758146853; x=1758751653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=plxR1Q0OTlig1zTxHt8JGiXb5CbrsV82EqogeHId9hQ=;
        b=vnAIO2rQkgq66pBD6zj/68Mo6bXdoDnUTakK07tiy5I9Vgb3i5M4geo83KjefsQR2K
         PBBOzUEBzoc3Sau2OsiH1bSncqO3HhbDs0bGGrCbcIl0dryz9yGa7ZYHDxX6EolnzIc1
         ofgg2j3GEi0rbzl5YmjU5BxrwLYKCWZTf2vCj012YqtJOMAnBV7SrU3MxANJc41T/iv5
         2uME2/Lhl2D1dyLOnhLaDfy7WfNEepme3ZVlrpeCwDf4ZHD6x6QRhIIog402z0l9N3Pz
         wNw8nbV0/l16D7d23kRhvYr0LnW035OM1jKYOjGzRkwJRlrBQtCk+Gx25Be8yzR3zawj
         R4Vw==
X-Forwarded-Encrypted: i=1; AJvYcCW2//z8WRXlFZmQ6AU4/hc3L33DlkhqTsow+lRllE4kyPHqgWAY4U1FWHl7G7JWmivjl3KY2dIrPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwbAtC41iZwWQkrkYnjG+pEdbgKr39IGNm7xd+vqviM/N+hKKWg
	UyvT1iiwGyt4GPSEqIqxZhUdpFE5y5DQ6nVl3NCiCxIi9haGik/wmvlldli/d8dRdrY=
X-Gm-Gg: ASbGncvkTHNhWbfPZBqbPGCDg/H8w1jkoc4NpbiA5jFqZJhtuxS8vB9E1vgCKQTT1CR
	vlRs97OaCEXZSQL35d7dTVQNbaoVJjXryDzvHQAc6PcoFunapfQvGawHACVUj192Z04ydum0HiQ
	po42/S9RDNjsIa4NGp0BuFhxPzKYdq6N7STZfSRXbWiA3I4092glo92tLKUcxS6uuYWrKA4Myvv
	L1GQ6oTnMPRABdQPaRrtMBQmIttyKcdPf7cGgEr26yKcqRNVp2NdRdATlq3e/iZuPBcckj0m87W
	xGE0nDtXDwGOwm5CO0bJJRHtMuIwPvFvOfrGVXV0xkdwFG2n5zO9n+0Bo0Vs7T3eZEdspmYiP9u
	oyKYVkg2mxdZPWuOzI02tHxCQogfcoJ/E7qGN1ftpdif0lKjfDj7S/lJiFG1UfgSJHCS63RqZUn
	wk00epmK9Q
X-Google-Smtp-Source: AGHT+IEhEgpu/y6hcFx432FAALiFyoyiIEe7VNM4oad62y0XdESrMbIYe4L7CYQ1KsF8cTepL/COMg==
X-Received: by 2002:a05:6e02:164b:b0:3f0:7ad2:2bf5 with SMTP id e9e14a558f8ab-4241a4e1040mr57294085ab.12.1758146853240;
        Wed, 17 Sep 2025 15:07:33 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-4244afa9f6fsm2346335ab.22.2025.09.17.15.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 15:07:32 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] riscv: dts: spacemit: define a SPI controller node
Date: Wed, 17 Sep 2025 17:07:23 -0500
Message-ID: <20250917220724.288127-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250917220724.288127-1-elder@riscstar.com>
References: <20250917220724.288127-1-elder@riscstar.com>
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
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 20 +++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 19 ++++++++++++++++++
 3 files changed, 45 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 6013be2585428..380d475d2f3f3 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -44,6 +44,12 @@ &pdma {
 	status = "okay";
 };
 
+&spi3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ssp3_0_cfg>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 3810557374228..16c953eca2aaa 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -28,4 +28,24 @@ pwm14-1-pins {
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
index 66b33a9110ccd..a826cc1ac83d5 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -834,6 +834,25 @@ storage-bus {
 			#size-cells = <2>;
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
 
+			spi3: spi@d401c000 {
+				compatible = "spacemit,k1-spi";
+				reg = <0x0 0xd401c000 0x0 0x30>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&syscon_apbc CLK_SSP3>,
+					 <&syscon_apbc CLK_SSP3_BUS>;
+				clock-names = "core",
+					      "bus";
+				resets = <&syscon_apbc RESET_SSP3>;
+				interrupts-extended = <&plic 55>;
+				spacemit,k1-ssp-id = <3>;
+				dmas = <&pdma 20>,
+				       <&pdma 19>;
+				dma-names = "rx",
+					    "tx";
+				status = "disabled";
+			};
+
 			emmc: mmc@d4281000 {
 				compatible = "spacemit,k1-sdhci";
 				reg = <0x0 0xd4281000 0x0 0x200>;
-- 
2.48.1

