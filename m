Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E33B2E1726
	for <spacemit@lists.linux.dev>; Fri, 14 Nov 2025 18:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763146676; cv=none; b=AmDJgXQdASC7IpxvxCUJ7Gw1hKHMX3ILlOB5MWFY+efNKO2FNvIPbSc8ryF00SLV0t79t8EzWh0EIlPyqdp0QZi3OS2fMhg5qy+5WgjXFc2PtFI+9GBtcT9Vukqjwqv+dAQZkvwou9fkN8nqhpKH6cveNgi+xhwDxoh2oGUq5aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763146676; c=relaxed/simple;
	bh=FiRaEtCqY4UvA3+LjfLHJ64vYLA7UruMs5fZTtA630g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lMjVBJSHgqNUgt2KOQwr9i4fDq/Bdk7qk5vyly9EhyiTf4A7EqGlEps/uglJ0mIrYCraCmS8KU4dogPjACk22jJZV6tLWdXecaPv5KsuSku1WYTIG9CVXooOHn9AiAGvZwCMTLZZj4HCLrMXZ2AmelxRNwSErvqcjqWLBX42l30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=dnHlhlVH; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="dnHlhlVH"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-948d45692b1so83607739f.0
        for <spacemit@lists.linux.dev>; Fri, 14 Nov 2025 10:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763146673; x=1763751473; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47nLDEud9cutefmnYtbk4Jyt3tQUkcCO1JkM1y5jd8g=;
        b=dnHlhlVHSjZo/iREeRoFQ3YDf0kUJ67W0jKnE6n82fqMlGwfCZn/clyqYM0dxLsraN
         U14GT9hhz9g0eBBdfsOj9pi3WbNVIIkD925ZlW4+/iIDltPI+SGESUzwvG5A/ZX8bv8o
         wyD45lzXX7AqllU0JmYAtNrk1sMj1I2I7QMZ/sFOBc0vvdPh2jL3c+btAfjBNHoMDiaN
         ZaOaO2cb0vTpctLDu9k+fhr41o3sgyOGZ5+bXszNgJmRka2mIvX4nZOrF7GHBDVligbT
         +2aGuCESsZgebrILYU5oMyu6tNOWQ1aRRzexMVfecLn3YvHBg5RaCXP8rdKVBkW9+Bbw
         VrsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763146673; x=1763751473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=47nLDEud9cutefmnYtbk4Jyt3tQUkcCO1JkM1y5jd8g=;
        b=Ty+6CbUETYpixWu6E4YW51fcre8EPr+At0JAYuYy1I1Vo/Cl8zjer7Di3jHjeR22qa
         rXNupZBh7aru2YytAx5/W5s0ooIG7weh2CL5f2OXnZwLW45oC6aiFrasIGJfZUXcIKXn
         lJ3wjlwos8T9EnkF4QztT71zoqrGEFLoqXOLeJdGh9l0aNBV98BqDDiux8Ru44Zco2AN
         ZLoF0rNHU7WsY2kClmtMcmIQj1L556jDGi8ya9mB6cxumYBc4NgSMO66rhiu6CiaAfO1
         DXhCM6eAYkEqXEKGc9LMv9dfwt2xxCHIPu3hm8jvgM1WsVe0KOEuR3VVs6sQykdgCpJ9
         ps2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxOBBzTG4GKiLHWxJs8RhciQA5v3Hkn33vY9fVTI7sD6BbZrtm/d9EMpeBlkeuEpzdF76FWZuqAg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzky7iK+V8MhWSha81I2pb3ZYTAp2UD5DwG88/fApTCrJBXN3w/
	36sto7k5Qljyc/owyY5P367yBkyaQVcrfljyhy1MeFRk4020SQztWC5OMESaWXWu4XM=
X-Gm-Gg: ASbGnct7zzRXKS/cToNzEO9vwA7fEDtBYjSpqFmkAGToMFzbzdUloIe3cAICCf1j/SF
	fEyEfqLIFVkRc3eqArQhKYcwYyf89SGbDI52yj8Rss/xBWdnhz0RziHVXhwJwfDBh4AhY8J4HDA
	drrWUdE92t4QCxIYk/mfpL0/wRJ/G10fKtFWVBFU8dZt4irrvPsuKxH+Zb2caPxn6atdNNY4vP6
	BPYHENuINcqAuMr1TUNmUpfHsLDPeH5ezUc/8UJdUbcJPUQzzG6iuueCATXuYOUL8hX5axO9RQi
	nja794cxeQnC5cuS64sVgt9vdgwk5Hu+VZRHWMOlnen2W6TuqiTzTXTr7pl/jdY52eoP3tbL1Th
	nZweisn1fLCrhaGSa0KIA6vV5UORjme8AIV3p2VVSnyufX9oMTGjGYYWaRkBmNSJ1RHyClWjwoz
	EhG6s0VP93Y12JIEQ1PPKmyK2GkhSXfbyWKozoDETb/E40BW+ET3qikNn19tESpDlV
X-Google-Smtp-Source: AGHT+IGklmek1a+ItyhFNeG/XvSxFlD6/UKZNxaoYFczYzwMLuJVkw1H46zy3vMhyxY+BDXWCfMh9A==
X-Received: by 2002:a05:6e02:154e:b0:433:7f57:22fd with SMTP id e9e14a558f8ab-4348c949b8bmr56721165ab.30.1763146673263;
        Fri, 14 Nov 2025 10:57:53 -0800 (PST)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-948d2ba690bsm278679339f.8.2025.11.14.10.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 10:57:52 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: dlan@gentoo.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/3] riscv: dts: spacemit: define a SPI controller node
Date: Fri, 14 Nov 2025 12:57:44 -0600
Message-ID: <20251114185745.2838358-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251114185745.2838358-1-elder@riscstar.com>
References: <20251114185745.2838358-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 20 +++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 15 ++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 02f218a16318e..bdbfd04f21853 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -16,6 +16,7 @@ aliases {
 		serial0 = &uart0;
 		i2c2 = &i2c2;
 		i2c8 = &i2c8;
+		spi3 = &spi3;
 	};
 
 	chosen {
@@ -264,6 +265,12 @@ dldo7 {
 	};
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
index e922e05ff856d..9b4f4949412f3 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -537,4 +537,24 @@ pwm14-1-pins {
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
index 7818ca4979b6a..cb4016886861e 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -919,6 +919,21 @@ qspi: spi@d420c000 {
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

