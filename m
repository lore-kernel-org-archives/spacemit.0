Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA87311949
	for <spacemit@lists.linux.dev>; Mon, 22 Sep 2025 16:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758557849; cv=none; b=eci5h+jNP1Qa86rWLL2fP9FKDnFoifqEuxGb+hDQyrzv88+oEhhkx/WIlbUXzixsvRMzW378gQ9stpkjcCKVaGVg406cs8oHR7BHKHCH7ocgusK4DKV08dyXFdfgKVN67IShyygEk02Ue6R3mg6s5jwYIHzYds7dhV6uYB0XV30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758557849; c=relaxed/simple;
	bh=NlbheDXpECv8KOzHHrPYOJU3W86bTH3Ut6RJOpS2J+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mle4LHL0snX1EOWoZB7jqxWXHDsqAV3gFf1hP465pN95WGY5vQQZWMR+hSYL7DlKp+goWIy7gKe41NVidXNHMfir4Dxx5BTpj/Mo869eJv4EUU3B9iyXsTS+ZCB1PNNONx/RiAwo3ravxxYGwEnaFoZ50aVcvH0nClh7i3HPki0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=CGBswQf4; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="CGBswQf4"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-42480cb42e9so18962915ab.0
        for <spacemit@lists.linux.dev>; Mon, 22 Sep 2025 09:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758557846; x=1759162646; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aoOY7RfK5Srk9OHnvU+owYvzqDNBeS7oAz1E0iurER0=;
        b=CGBswQf4nO/YDhIvElAe/7PBCqBTrRww+tgl0g6cfKmwlsUJ9/X0a9bEkLoANeCPgx
         MRK04xQBRkK75ftZsBisNSB4BdbKHtgESdcYhUVDN850B6JlkWl/brgP8Cp60U7/qKSA
         BVqyjyvaell8jev4Hi+UuuTWgeyAo3ww2gpR1O08nvb2ez9P1yru0/0wTWwRbLBk3bxa
         TBB9wUA7kPRCFOTWBRsNohZCzCnrKViMRofCcF3YQBKcjD2CEIx6G7IDKAmz8iNl6F8z
         whOPbZsS5d3ZPvujFIHjkGhDhE3N1sEkaQw43vBpxQS+qiW2GQO5TZ5v1mCp4XNI/0VA
         hjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758557846; x=1759162646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aoOY7RfK5Srk9OHnvU+owYvzqDNBeS7oAz1E0iurER0=;
        b=cK1zf7tUP3EcLfh8Rm5KGUWwN88qHyMBSBsMDoUYs1jfv8W+oyq3NLo6LmCaKnSsJn
         Vpm//Ff/3g2Q1DA7z9fAh81b3iidAd0EK2DfiDYTBaAeHNj09MCxlX2wv55G5pMqBpIq
         ZMb6OhJXh5uAZ0ZMK58oJTWTIBxm6OtZfgH60/Jehf7gFlVaWhvFU4IEC8Lz+ixENss/
         HS3J+8/1R0uY4HUCZ7ctTYIBvEn7wbp4h7TucdaaM1Nq/aqDKd7RV6TP10lCveqfmbhO
         B57aLWhwe4sKgv+uIYDRST+vJsH7qfk4xa1ti2IjF323Ma8oD5WLnXLwpEifqyj/oyDh
         KXnA==
X-Forwarded-Encrypted: i=1; AJvYcCX3sczlro7kzYO0lnipzIgpIkuLW7xxycr+ti7XDXev/7sUv1F+z9NKFVCG2Ir2J1jRAmksQ/LB+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAREY441ySwRfzv5gRVxSVaEG0KbiF4vbtM7ZFvrakrCrfhHEI
	MtCMLM14Ab63YZ6rjrrViSpPwsEIHMuQelgQRTSZ+gbB9uUzUi4J5CJF8YB8G6MRrCA=
X-Gm-Gg: ASbGncvTnYnFTVPwV0LswrOUT3L59eSFcLE1Xe1o0DBYVPkIV1m5ax2a+J0KLorwWt9
	BDuQiSyhoKkotr2sxS4969Zkh+y9HCD3a1iUkBJXsM5WlTLvSHl8U0elC2CKr2GZj5vIyfieVSU
	qJLa2Xs1i3rE0FcJtTAm/NpTEWTSa1iR0GO1d6qg00/pZZRW3BnbOfsZxyso4cbYq7zI6v0pIT1
	hHtcH4OnYo0H06VtjS3JkQ++JpQ1UngNxNS3e41hAMHJlnYwZKHjxi0GXVVu/nwpQnbFoMGY4cM
	rUiKr+eiZM9vKz1+yPRmYVMClIybf+mgUyMXwtLepcJ893kB05yh4QNHIacRzRdXsZuObp+f//W
	pF3uFT2Y/29jO3yHpYjaIPX/SSMR4e8U2EPQDO6dYL85gpTsMruV7m0OiEw9Xvol2Xw==
X-Google-Smtp-Source: AGHT+IGtbLw0Yh8YMxa0k32ja3gy2lmtWw7KYJ5toaZ8D6XiMR5qUSNHvj3Y8EAnz6GgOP6IVLuhZg==
X-Received: by 2002:a05:6e02:164d:b0:402:b8e3:c9f5 with SMTP id e9e14a558f8ab-42481911960mr204709235ab.2.1758557846329;
        Mon, 22 Sep 2025 09:17:26 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425711d9aa0sm25207185ab.48.2025.09.22.09.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 09:17:26 -0700 (PDT)
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
Subject: [PATCH v3 3/3] riscv: dts: spacemit: define a SPI controller node
Date: Mon, 22 Sep 2025 11:17:16 -0500
Message-ID: <20250922161717.1590690-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250922161717.1590690-1-elder@riscstar.com>
References: <20250922161717.1590690-1-elder@riscstar.com>
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
v3: - Moved the SPI controller into the dma-bus memory region

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
index 6cdcd80a7c83b..eb8a14dd72ea4 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -797,6 +797,22 @@ uart9: serial@d4017800 {
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
+				dmas = <&pdma 20>,
+				       <&pdma 19>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
 			/* sec_uart1: 0xf0612000, not available from Linux */
 		};
 
-- 
2.48.1

