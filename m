Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9633B31A06A
	for <spacemit@lists.linux.dev>; Wed,  3 Sep 2025 14:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756911260; cv=none; b=X8xoIGuqoDs/DMKXDQjgA3X5hC20sw0TMLNrENAILIC+lQk82GG88djpAANNpFVxhYrjEZiGWfaS5wesmluLLS43CEi1LI85YEmrj+Ha60CF+yQhvT20/kQOiTx4E85JB4rxTcRCYqrYqv3/gxYJcOkrhmsMw+rGwwmtv5uYN/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756911260; c=relaxed/simple;
	bh=KpHOj0mNA4+e9kUqlWS2RJgWfZkd6/Eg0O9escihThQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cm4OEm/kClZh4C7xjmlUOcL5PNVnHtynDcIMkhB4HUeiX5cvcbiiI/zLWiPOqYwkvN/mjUedDhYkankRdjhTXweU2LtHkbDGlz6552+Pa84VMoPw1Akk/fofBa++hGOjHXT9vbHbYZLfX3cYJb2wZaEzLYLkTio08zMPpwRMWPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=YQ5/YeIj; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="YQ5/YeIj"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3d19699240dso716598f8f.1
        for <spacemit@lists.linux.dev>; Wed, 03 Sep 2025 07:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1756911254; x=1757516054; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KfRoqQl7bTrgAdolwwez1LaewcASB4l+oYGwiyVhGj4=;
        b=YQ5/YeIjJ0zvbpIJ+4O/2yIAHJM/q6crGZH8Mtj4WP222/huwOK761O1yIpxUFyt0w
         lTT0muGMN1+EFZ63wT2qDkMqquQ8Q8NCrbriGalYUGPBh4IeIjXCehiEdxGiN/9oMQ5x
         t5sw9UrPkGqhO2a/RTO39a3tGyu0WBDW32u4vLeiZ0l22s0F6HORCb7YMV0O5Gl5p6LL
         mwx1417GQ/FoUNoYbdZ53pcVtm6M1yw8EUJza83V+tfJqG1s5h8WFUO9uCbQJ3ap4DZH
         LlW8mRU2EQtZeUK6cO6cvJO0s6Kgf+MP2Q42MD9UcXhUK3m9QUMkSqmj6AHFgZoKLoZR
         b7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756911254; x=1757516054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KfRoqQl7bTrgAdolwwez1LaewcASB4l+oYGwiyVhGj4=;
        b=JRxwkNItp0HGv3Jh3sMGzOthFFOyZp2NzV7+hX/LkJ03tUZSwmMxZgkEu1lVooHZyx
         Jtprxyc3cMPJQZcMK9FhlNCBqYPV02Z9CL6TiCEZ0GGpYgDdMeAWwHzZs1P+Ol7+2ybf
         T2PPIrMp51pMgb8rBMHUF6JFcdhvBfHW7gjBwa8ocvUUVLnfh1E+sz77x326sVy8Y/HH
         lyYzQLktJReJfvCETvNX0H3+ZKQWpbqyAph8A7LmbTY9chMjIIV8dQPkfJDPl4wzNIfO
         iuBlT/ndxZPONgq6qmh7VAX0MAoUcb9LMTiPddAv6Kxgx5tzV8b/ruapFczvuJ9Xpljo
         z6lw==
X-Forwarded-Encrypted: i=1; AJvYcCWqPzX7+csvz6MoXhRMb77QhyezYLLw6dPYRPRQhbUysZzeYH80bhauN7UVE40BnjNCsz/ZIq48QA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwcajfciIViyaOhakv1nnf71IqfQrjE/fgPbH5nJxEGzUSQw4jr
	AgPFmf/SLeMhA1PsTN3gJezzLV4K0t63SPiQTCnmS9dOTI4oz0o9Q5mUbGEJ5CEvQGc=
X-Gm-Gg: ASbGncurXg8ZENDLz6mnHF8Z6tsmJstziPX2kUKq9uCbd03+IzovfWVtbLPnBZsagcB
	g6fk/rkh8PxFs/C15WNP77gE5iMe1jjQ3U/FO3gIIiRZpp5zsDK7uwclWkg2sDmw6g+s6gxarWH
	eLA+fiGBHh3c53aF6S6USqg/K5xODoHmzjh4R7as4gZSJ7Zz3oCeNDdPhAneosuVimtjesiXM62
	cho7zIqDjjL6yV8U9CPYYR9Tdug5zcnOP7gOniwwkdPuuO6ciW4kpOJDxHi/wdu1j6H58QyXyWB
	M5Y/4JGQg+IIYlaXLTVMxUTx2AUxAnOBPMapYlegx1Ki75PFO4GWz+iLZAw9drAw2XMcid0qZtc
	c9YbZQi+DCPjZJGCwrvt8IpjeVd8j3zty7+Tw8OvOvWg4d6REm9mjsex7zNvdY/IFN5URkA==
X-Google-Smtp-Source: AGHT+IFKlUEKzOojQldM0O3QUhp1WqFQrJMW4YyIwO+SE1fmwBD/U9KH7gat3RRaNFqT/jHFuMp31A==
X-Received: by 2002:a05:6000:1ac8:b0:3c7:244:a4be with SMTP id ffacd0b85a97d-3d1dd04e24bmr13949477f8f.10.1756911254206;
        Wed, 03 Sep 2025 07:54:14 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:7e45:593:64fd:6612])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3dc1cd4a7d2sm4087175f8f.33.2025.09.03.07.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 07:54:13 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH] riscv: dts: spacemit: add UART pinctrl combinations
Date: Wed,  3 Sep 2025 16:53:34 +0200
Message-ID: <20250903145334.425633-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds UART pinctrl configurations based on the SoC datasheet and the
downstream Bianbu Linux tree. The drive strength values were taken from
the downstream implementation, which uses medium drive strength.

For convenience, the board DTS files have been updated to include all
UART instances with their possible pinmux options in a disabled state.

Tested this locally on both Orange Pi RV2 and Banana Pi BPI-F3 boards. 

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  18 ++
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     |  18 ++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 276 +++++++++++++++++-
 3 files changed, 309 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 6013be258542..661d47d1ce9e 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -49,3 +49,21 @@ &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	status = "okay";
 };
+
+&uart5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart5_3_cfg>;
+	status = "disabled";
+};
+
+&uart8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart8_2_cfg>;
+	status = "disabled";
+};
+
+&uart9 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart9_2_cfg>;
+	status = "disabled";
+};
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 337240ebb7b7..dc45b75b1ad4 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -38,3 +38,21 @@ &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	status = "okay";
 };
+
+&uart5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart5_3_cfg>;
+	status = "disabled";
+};
+
+&uart8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart8_2_cfg>;
+	status = "disabled";
+};
+
+&uart9 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart9_2_cfg>;
+	status = "disabled";
+};
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 381055737422..43425530b5bf 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -11,12 +11,282 @@
 #define K1_GPIO(x)	(x / 32) (x % 32)
 
 &pinctrl {
+	uart0_0_cfg: uart0-0-cfg {
+		uart0-0-pins {
+			pinmux = <K1_PADCONF(104, 3)>,	/* uart0_txd */
+				 <K1_PADCONF(105, 3)>;	/* uart0_rxd */
+			power-source = <3300>;
+			bias-pull-up;
+			drive-strength = <19>;
+		};
+	};
+
+	uart0_1_cfg: uart0-1-cfg {
+		uart0-1-pins {
+			pinmux = <K1_PADCONF(108, 1)>,	/* uart0_txd */
+				 <K1_PADCONF(80, 3)>;	/* uart0_rxd */
+			power-source = <3300>;
+			bias-pull-up;
+			drive-strength = <19>;
+		};
+	};
+
 	uart0_2_cfg: uart0-2-cfg {
 		uart0-2-pins {
-			pinmux = <K1_PADCONF(68, 2)>,
-				 <K1_PADCONF(69, 2)>;
+			pinmux = <K1_PADCONF(68, 2)>,	/* uart0_txd */
+				 <K1_PADCONF(69, 2)>;	/* uart0_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
 
-			bias-pull-up = <0>;
+	uart2_0_cfg: uart2-0-cfg {
+		uart2-0-pins {
+			pinmux = <K1_PADCONF(21, 1)>,	/* uart2_txd */
+				 <K1_PADCONF(22, 1)>,	/* uart2_rxd */
+				 <K1_PADCONF(23, 1)>,	/* uart2_cts */
+				 <K1_PADCONF(24, 1)>;	/* uart2_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart3_0_cfg: uart3-0-cfg {
+		uart3-0-pins {
+			pinmux = <K1_PADCONF(81, 2)>,	/* uart3_txd */
+				 <K1_PADCONF(82, 2)>,	/* uart3_rxd */
+				 <K1_PADCONF(83, 2)>,	/* uart3_cts */
+				 <K1_PADCONF(84, 2)>;	/* uart3_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart3_1_cfg: uart3-1-cfg {
+		uart3-1-pins {
+			pinmux = <K1_PADCONF(18, 2)>,	/* uart3_txd */
+				 <K1_PADCONF(19, 2)>,	/* uart3_rxd */
+				 <K1_PADCONF(20, 2)>,	/* uart3_cts */
+				 <K1_PADCONF(21, 2)>;	/* uart3_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart3_2_cfg: uart3-2-cfg {
+		uart3-2-pins {
+			pinmux = <K1_PADCONF(53, 4)>,	/* uart3_txd */
+				 <K1_PADCONF(54, 4)>,	/* uart3_rxd */
+				 <K1_PADCONF(55, 4)>,	/* uart3_cts */
+				 <K1_PADCONF(56, 4)>;	/* uart3_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart4_0_cfg: uart4-0-cfg {
+		uart4-0-pins {
+			pinmux = <K1_PADCONF(100, 4)>,	/* uart4_txd */
+				 <K1_PADCONF(101, 4)>;	/* uart4_rxd */
+			power-source = <3300>;
+			bias-pull-up;
+			drive-strength = <19>;
+		};
+	};
+
+	uart4_1_cfg: uart4-1-cfg {
+		uart4-1-pins {
+			pinmux = <K1_PADCONF(81, 3)>,	/* uart4_cts */
+				 <K1_PADCONF(82, 3)>,	/* uart4_rts */
+				 <K1_PADCONF(83, 3)>,	/* uart4_txd */
+				 <K1_PADCONF(84, 3)>;	/* uart4_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart4_2_cfg: uart4-2-cfg {
+		uart4-2-pins {
+			pinmux = <K1_PADCONF(23, 2)>,	/* uart4_txd */
+				 <K1_PADCONF(24, 2)>;	/* uart4_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart4_3_cfg: uart4-3-cfg {
+		uart4-3-pins {
+			pinmux = <K1_PADCONF(33, 2)>,	/* uart4_txd */
+				 <K1_PADCONF(34, 2)>,	/* uart4_rxd */
+				 <K1_PADCONF(35, 2)>,	/* uart4_cts */
+				 <K1_PADCONF(36, 2)>;	/* uart4_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart4_4_cfg: uart4-4-cfg {
+		uart4-4-pins {
+			pinmux = <K1_PADCONF(111, 4)>,	/* uart4_txd */
+				 <K1_PADCONF(112, 4)>,	/* uart4_rxd */
+				 <K1_PADCONF(113, 4)>,	/* uart4_cts */
+				 <K1_PADCONF(114, 4)>;	/* uart4_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart5_0_cfg: uart5-0-cfg {
+		uart5-0-pins {
+			pinmux = <K1_PADCONF(102, 3)>,	/* uart5_txd */
+				 <K1_PADCONF(103, 3)>;	/* uart5_rxd */
+			power-source = <3300>;
+			bias-pull-up;
+			drive-strength = <19>;
+		};
+	};
+
+	uart5_1_cfg: uart5-1-cfg {
+		uart5-1-pins {
+			pinmux = <K1_PADCONF(25, 2)>,	/* uart5_txd */
+				 <K1_PADCONF(26, 2)>,	/* uart5_rxd */
+				 <K1_PADCONF(27, 2)>,	/* uart5_cts */
+				 <K1_PADCONF(28, 2)>;	/* uart5_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart5_2_cfg: uart5-2-cfg {
+		uart5-2-pins {
+			pinmux = <K1_PADCONF(42, 2)>,	/* uart5_txd */
+				 <K1_PADCONF(43, 2)>,	/* uart5_rxd */
+				 <K1_PADCONF(44, 2)>,	/* uart5_cts */
+				 <K1_PADCONF(45, 2)>;	/* uart5_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart5_3_cfg: uart5-3-cfg {
+		uart5-3-pins {
+			pinmux = <K1_PADCONF(70, 4)>,	/* uart5_txd */
+				 <K1_PADCONF(71, 4)>,	/* uart5_rxd */
+				 <K1_PADCONF(72, 4)>,	/* uart5_cts */
+				 <K1_PADCONF(73, 4)>;	/* uart5_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart6_0_cfg: uart6-0-cfg {
+		uart6-0-pins {
+			pinmux = <K1_PADCONF(85, 2)>,	/* uart6_cts */
+				 <K1_PADCONF(86, 2)>,	/* uart6_txd */
+				 <K1_PADCONF(87, 2)>,	/* uart6_rxd */
+				 <K1_PADCONF(90, 2)>;	/* uart6_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart6_1_cfg: uart6-1-cfg {
+		uart6-1-pins {
+			pinmux = <K1_PADCONF(0, 2)>,	/* uart6_txd */
+				 <K1_PADCONF(1, 2)>,	/* uart6_rxd */
+				 <K1_PADCONF(2, 2)>,	/* uart6_cts */
+				 <K1_PADCONF(3, 2)>;	/* uart6_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart6_2_cfg: uart6-2-cfg {
+		uart6-2-pins {
+			pinmux = <K1_PADCONF(56, 2)>,	/* uart6_txd */
+				 <K1_PADCONF(57, 2)>;	/* uart6_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart7_0_cfg: uart7-0-cfg {
+		uart7-0-pins {
+			pinmux = <K1_PADCONF(88, 2)>,	/* uart7_txd */
+				 <K1_PADCONF(89, 2)>;	/* uart7_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart7_1_cfg: uart7-1-cfg {
+		uart7-1-pins {
+			pinmux = <K1_PADCONF(4, 2)>,	/* uart7_txd */
+				 <K1_PADCONF(5, 2)>,	/* uart7_rxd */
+				 <K1_PADCONF(6, 2)>,	/* uart7_cts */
+				 <K1_PADCONF(7, 2)>;	/* uart7_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart8_0_cfg: uart8-0-cfg {
+		uart8-0-pins {
+			pinmux = <K1_PADCONF(82, 4)>,	/* uart8_txd */
+				 <K1_PADCONF(83, 4)>;	/* uart8_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart8_1_cfg: uart8-1-cfg {
+		uart8-1-pins {
+			pinmux = <K1_PADCONF(8, 2)>,	/* uart8_txd */
+				 <K1_PADCONF(9, 2)>,	/* uart8_rxd */
+				 <K1_PADCONF(10, 2)>,	/* uart8_cts */
+				 <K1_PADCONF(11, 2)>;	/* uart8_rts */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart8_2_cfg: uart8-2-cfg {
+		uart8-2-pins {
+			pinmux = <K1_PADCONF(75, 4)>,	/* uart8_txd */
+				 <K1_PADCONF(76, 4)>,	/* uart8_rxd */
+				 <K1_PADCONF(77, 4)>,	/* uart8_cts */
+				 <K1_PADCONF(78, 4)>;	/* uart8_rts */
+			power-source = <3300>;
+			bias-pull-up;
+			drive-strength = <19>;
+		};
+	};
+
+	uart9_0_cfg: uart9-0-cfg {
+		uart9-0-pins {
+			pinmux = <K1_PADCONF(12, 2)>,	/* uart9_txd */
+				 <K1_PADCONF(13, 2)>;	/* uart9_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart9_1_cfg: uart9-1-cfg {
+		uart9-1-pins {
+			pinmux = <K1_PADCONF(110, 3)>,	/* uart9_cts */
+				 <K1_PADCONF(115, 3)>,	/* uart9_rts */
+				 <K1_PADCONF(116, 3)>,	/* uart9_txd */
+				 <K1_PADCONF(117, 3)>;	/* uart9_rxd */
+			bias-pull-up;
+			drive-strength = <32>;
+		};
+	};
+
+	uart9_2_cfg: uart9-2-cfg {
+		uart9-2-pins {
+			pinmux = <K1_PADCONF(72, 2)>,	/* uart9_txd */
+				 <K1_PADCONF(73, 2)>;	/* uart9_rxd */
+			bias-pull-up;
 			drive-strength = <32>;
 		};
 	};
-- 
2.43.0

