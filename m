Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2767298987
	for <spacemit@lists.linux.dev>; Wed, 17 Sep 2025 06:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758092395; cv=none; b=nP0hfeuVCAEcEM5LescHco0CJ0zHFHNYOZMgVp4e/UdWqfTnQTOf3jVgnAKHJzHLrQ5iPKh/Rr/uQxt+e6KLZF4oaljeS54ogLiGr41xOCybU5ToHplke2oy2EFYvL5JjSVjRIM0/YKR82xu/sSiNd+jvqrCtOXIesfBEvjivac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758092395; c=relaxed/simple;
	bh=m7A9x62vNaAiuQT4LAU5s422w1g5UkDXyP3ODPgCMv8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nzoN8bHAbQ3DPqNlb50alkbDwwypG3v62iucO+LHG1oNG+O5buT85JhlCF4mwZKJeRYlAXz6LBsB9/sfy908ClmgMuHCSuC5hiJ1Jol3p3nRmS8lsVeqSP7D3Lb9B9xgsEz3Faqv+T97BUCj37ALHvY5LB4GUuAfpCbIU9GBZoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=kTYysNeK; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="kTYysNeK"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3c68ac7e18aso3722116f8f.2
        for <spacemit@lists.linux.dev>; Tue, 16 Sep 2025 23:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1758092390; x=1758697190; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p7h2V7+XLJsHOcDetA21NTfGsO1i/U83vyv69RqPpe0=;
        b=kTYysNeKbQGsbDBHemFjJNMSArjau/HP6p2MIRNUfR+c48c6sSNl9PTSbVVZM+e9ya
         7/mgGHIBKmo4HdqIdh8LfwEEVa9/CcCvyyTFOGfQ+ApmT2vZL8nQ5d+lmyFSeSrKJ4oX
         3AsMBz53uFzw5ZOZUV4JjaW5GQxA+b6+t0G/bX3n4GheLI4/xeL8e3dcpDU2SMa3sgL+
         g6bdNtvyQ6SOBYC2/b13fw1EcSn8BVlaU5KF3u6Fl+Ag01m+gyIvuJTQbcrQobTc2Iaj
         QI2G91wUSwm1epzXF3jHKPyo+MTJ0jaHCpINGPVs1UVbactx0R2ScPObLk1TjxLI05og
         KhtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758092390; x=1758697190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p7h2V7+XLJsHOcDetA21NTfGsO1i/U83vyv69RqPpe0=;
        b=w1WdNLlTsQRb/FEA/lzKbOvr7aFKRY9obJ62Le0Ikh/6w3jEmOOhj1DY/BhwnILPih
         tRJcLYk520M0P0HRta/PLKeg4or/0AfeEldG86mKEM6PAFt65UUhqQK99hztc8geW7PC
         SYJ7owOC9VgXfZUw2VxHo1oE+j9L1rIDB6fRKuo2KWR26Z42BLBmvW3ifR3AdS2WFWIQ
         7F9EscUv5JpCsKwMfLJlOfUyBPUibM7q4gLwTwiXDKmGnV0ObzQovI8rY4aKUwefsmWs
         0CIyp2Giro9fieyProfmqpDs6TGbM1muBYtBzutUEnybcpM6uihzAsfXOuPqMwtnrz3s
         Du7A==
X-Forwarded-Encrypted: i=1; AJvYcCXFhhx5mkYjDEb6GOK6aIuCb0zdS4Ze9Bd900iVvbbeoakekV0IDtJG4w4qzJIp7ef8qMYtzkVmjQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJwfTWrZIcnJu4IhNvREI87+wckLiJCjXA7wUsBXiX2kLil+Se
	YwMK0SZKkRwzinprnbJ/0MDyDGYp1bS9UdcMP73rMVL831wd1oAPOuMXRe/2TDnwDcU=
X-Gm-Gg: ASbGncuNLUbUFAT0P7k+vjHSYYrrz6Em9jUJbLurl3AVRSE/cr9rXHGF8XDzcrIBfIn
	O09M8KjgqV076vge/SjUmTyZtkXiF4+D32IjvyttsVIZE09RnlZ2SniQ/u9/lIhYe7/QgpFsC1Y
	cvV7+ZZMZYGfHsSrEQU0VyL91vSF5hKJKbtFocHsTmbw/LDlNwovZyf0p03deHugyyL8nXFO6Cv
	Phy6rnR1qYF94avnbEyyiuKx1nBQ+axZY03JYycPop/2x+PqzcVAbgbgSI4Fmc1HShrykr0Vv3T
	kYYjXE9yl7SSO8qJ38Nw4/EPYbh1mh94y0L23gKqt5NjK6WWYDchI7xhOHtU1taFmrEhzuMLVwe
	6xBn2yIByamQIwFMWvqDvLaarBtElomcT9VztAefhUcoUBo87+Dg=
X-Google-Smtp-Source: AGHT+IGge/PYhWtSCfabX/nrs/mY9m1ICW696JLt4kj2wQMv5DZNSfWYfAOgO/3DRfIWxtWOVhPBTg==
X-Received: by 2002:a05:6000:288a:b0:3ec:4e41:fd97 with SMTP id ffacd0b85a97d-3ecdf9c8a38mr781809f8f.24.1758092389680;
        Tue, 16 Sep 2025 23:59:49 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:1b1a:e580:5909:925c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7e645d1fcsm19202809f8f.48.2025.09.16.23.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 23:59:49 -0700 (PDT)
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
Subject: [PATCH v4] riscv: dts: spacemit: add UART pinctrl combinations
Date: Wed, 17 Sep 2025 08:59:07 +0200
Message-ID: <20250917065907.160615-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add UART pinctrl configurations based on the SoC datasheet and the
downstream Bianbu Linux tree. The drive strength values were taken from
the downstream implementation, which uses medium drive strength.
CTS/RTS are moved to separate *-cts-rts-cfg states so boards can enable
hardware flow control conditionally.

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v4:
- Explicitly use 0 as bias-pull-up value

Changes in v3:
- Added /omit-if-no-ref/ to pinctrl states to reduce DT size

Changes in v2:
- Split cts/rts into separate pinctrl configs as suggested
- Removed options from board DTS files to keep them cleaner
---
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 430 ++++++++++++++++++-
 1 file changed, 428 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 381055737422..44e78764f491 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -11,11 +11,437 @@
 #define K1_GPIO(x)	(x / 32) (x % 32)
 
 &pinctrl {
+	/omit-if-no-ref/
+	uart0_0_cfg: uart0-0-cfg {
+		uart0-0-pins {
+			pinmux = <K1_PADCONF(104, 3)>,	/* uart0_txd */
+				 <K1_PADCONF(105, 3)>;	/* uart0_rxd */
+			power-source = <3300>;
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart0_1_cfg: uart0-1-cfg {
+		uart0-1-pins {
+			pinmux = <K1_PADCONF(108, 1)>,	/* uart0_txd */
+				 <K1_PADCONF(80, 3)>;	/* uart0_rxd */
+			power-source = <3300>;
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+		};
+	};
+
+	/omit-if-no-ref/
 	uart0_2_cfg: uart0-2-cfg {
 		uart0-2-pins {
-			pinmux = <K1_PADCONF(68, 2)>,
-				 <K1_PADCONF(69, 2)>;
+			pinmux = <K1_PADCONF(68, 2)>,	/* uart0_txd */
+				 <K1_PADCONF(69, 2)>;	/* uart0_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart2_0_cfg: uart2-0-cfg {
+		uart2-0-pins {
+			pinmux = <K1_PADCONF(21, 1)>,	/* uart2_txd */
+				 <K1_PADCONF(22, 1)>;	/* uart2_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart2_0_cts_rts_cfg: uart2-0-cts-rts-cfg {
+		uart2-0-pins {
+			pinmux = <K1_PADCONF(23, 1)>,	/* uart2_cts */
+				 <K1_PADCONF(24, 1)>;	/* uart2_rts */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart3_0_cfg: uart3-0-cfg {
+		uart3-0-pins {
+			pinmux = <K1_PADCONF(81, 2)>,	/* uart3_txd */
+				 <K1_PADCONF(82, 2)>;	/* uart3_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart3_0_cts_rts_cfg: uart3-0-cts-rts-cfg {
+		uart3-0-pins {
+			pinmux = <K1_PADCONF(83, 2)>,	/* uart3_cts */
+				 <K1_PADCONF(84, 2)>;	/* uart3_rts */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart3_1_cfg: uart3-1-cfg {
+		uart3-1-pins {
+			pinmux = <K1_PADCONF(18, 2)>,	/* uart3_txd */
+				 <K1_PADCONF(19, 2)>;	/* uart3_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart3_1_cts_rts_cfg: uart3-1-cts-rts-cfg {
+		uart3-1-pins {
+			pinmux = <K1_PADCONF(20, 2)>,	/* uart3_cts */
+				 <K1_PADCONF(21, 2)>;	/* uart3_rts */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart3_2_cfg: uart3-2-cfg {
+		uart3-2-pins {
+			pinmux = <K1_PADCONF(53, 4)>,	/* uart3_txd */
+				 <K1_PADCONF(54, 4)>;	/* uart3_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart3_2_cts_rts_cfg: uart3-2-cts-rts-cfg {
+		uart3-2-pins {
+			pinmux = <K1_PADCONF(55, 4)>,	/* uart3_cts */
+				 <K1_PADCONF(56, 4)>;	/* uart3_rts */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart4_0_cfg: uart4-0-cfg {
+		uart4-0-pins {
+			pinmux = <K1_PADCONF(100, 4)>,	/* uart4_txd */
+				 <K1_PADCONF(101, 4)>;	/* uart4_rxd */
+			power-source = <3300>;
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart4_1_cfg: uart4-1-cfg {
+		uart4-1-pins {
+			pinmux = <K1_PADCONF(83, 3)>,	/* uart4_txd */
+				 <K1_PADCONF(84, 3)>;	/* uart4_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart4_1_cts_rts_cfg: uart4-1-cts-rts-cfg {
+		uart4-1-pins {
+			pinmux = <K1_PADCONF(81, 3)>,	/* uart4_cts */
+				 <K1_PADCONF(82, 3)>;	/* uart4_rts */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart4_2_cfg: uart4-2-cfg {
+		uart4-2-pins {
+			pinmux = <K1_PADCONF(23, 2)>,	/* uart4_txd */
+				 <K1_PADCONF(24, 2)>;	/* uart4_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart4_3_cfg: uart4-3-cfg {
+		uart4-3-pins {
+			pinmux = <K1_PADCONF(33, 2)>,	/* uart4_txd */
+				 <K1_PADCONF(34, 2)>;	/* uart4_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart4_3_cts_rts_cfg: uart4-3-cts-rts-cfg {
+		uart4-3-pins {
+			pinmux = <K1_PADCONF(35, 2)>,	/* uart4_cts */
+				 <K1_PADCONF(36, 2)>;	/* uart4_rts */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart4_4_cfg: uart4-4-cfg {
+		uart4-4-pins {
+			pinmux = <K1_PADCONF(111, 4)>,	/* uart4_txd */
+				 <K1_PADCONF(112, 4)>;	/* uart4_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart4_4_cts_rts_cfg: uart4-4-cts-rts-cfg {
+		uart4-4-pins {
+			pinmux = <K1_PADCONF(113, 4)>,	/* uart4_cts */
+				 <K1_PADCONF(114, 4)>;	/* uart4_rts */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart5_0_cfg: uart5-0-cfg {
+		uart5-0-pins {
+			pinmux = <K1_PADCONF(102, 3)>,	/* uart5_txd */
+				 <K1_PADCONF(103, 3)>;	/* uart5_rxd */
+			power-source = <3300>;
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart5_1_cfg: uart5-1-cfg {
+		uart5-1-pins {
+			pinmux = <K1_PADCONF(25, 2)>,	/* uart5_txd */
+				 <K1_PADCONF(26, 2)>;	/* uart5_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart5_1_cts_rts_cfg: uart5-1-cts-rts-cfg {
+		uart5-1-pins {
+			pinmux = <K1_PADCONF(27, 2)>,	/* uart5_cts */
+				 <K1_PADCONF(28, 2)>;	/* uart5_rts */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart5_2_cfg: uart5-2-cfg {
+		uart5-2-pins {
+			pinmux = <K1_PADCONF(42, 2)>,	/* uart5_txd */
+				 <K1_PADCONF(43, 2)>;	/* uart5_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart5_2_cts_rts_cfg: uart5-2-cts-rts-cfg {
+		uart5-2-pins {
+			pinmux = <K1_PADCONF(44, 2)>,	/* uart5_cts */
+				 <K1_PADCONF(45, 2)>;	/* uart5_rts */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart5_3_cfg: uart5-3-cfg {
+		uart5-3-pins {
+			pinmux = <K1_PADCONF(70, 4)>,	/* uart5_txd */
+				 <K1_PADCONF(71, 4)>;	/* uart5_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart5_3_cts_rts_cfg: uart5-3-cts-rts-cfg {
+		uart5-3-pins {
+			pinmux = <K1_PADCONF(72, 4)>,	/* uart5_cts */
+				 <K1_PADCONF(73, 4)>;	/* uart5_rts */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart6_0_cfg: uart6-0-cfg {
+		uart6-0-pins {
+			pinmux = <K1_PADCONF(86, 2)>,	/* uart6_txd */
+				 <K1_PADCONF(87, 2)>;	/* uart6_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart6_0_cts_rts_cfg: uart6-0-cts-rts-cfg {
+		uart6-0-pins {
+			pinmux = <K1_PADCONF(85, 2)>,	/* uart6_cts */
+				 <K1_PADCONF(90, 2)>;	/* uart6_rts */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart6_1_cfg: uart6-1-cfg {
+		uart6-1-pins {
+			pinmux = <K1_PADCONF(0, 2)>,	/* uart6_txd */
+				 <K1_PADCONF(1, 2)>;	/* uart6_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart6_1_cts_rts_cfg: uart6-1-cts-rts-cfg {
+		uart6-1-pins {
+			pinmux = <K1_PADCONF(2, 2)>,	/* uart6_cts */
+				 <K1_PADCONF(3, 2)>;	/* uart6_rts */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart6_2_cfg: uart6-2-cfg {
+		uart6-2-pins {
+			pinmux = <K1_PADCONF(56, 2)>,	/* uart6_txd */
+				 <K1_PADCONF(57, 2)>;	/* uart6_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart7_0_cfg: uart7-0-cfg {
+		uart7-0-pins {
+			pinmux = <K1_PADCONF(88, 2)>,	/* uart7_txd */
+				 <K1_PADCONF(89, 2)>;	/* uart7_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart7_1_cfg: uart7-1-cfg {
+		uart7-1-pins {
+			pinmux = <K1_PADCONF(4, 2)>,	/* uart7_txd */
+				 <K1_PADCONF(5, 2)>;	/* uart7_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart7_1_cts_rts_cfg: uart7-1-cts-rts-cfg {
+		uart7-1-pins {
+			pinmux = <K1_PADCONF(6, 2)>,	/* uart7_cts */
+				 <K1_PADCONF(7, 2)>;	/* uart7_rts */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart8_0_cfg: uart8-0-cfg {
+		uart8-0-pins {
+			pinmux = <K1_PADCONF(82, 4)>,	/* uart8_txd */
+				 <K1_PADCONF(83, 4)>;	/* uart8_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart8_1_cfg: uart8-1-cfg {
+		uart8-1-pins {
+			pinmux = <K1_PADCONF(8, 2)>,	/* uart8_txd */
+				 <K1_PADCONF(9, 2)>;	/* uart8_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart8_1_cts_rts_cfg: uart8-1-cts-rts-cfg {
+		uart8-1-pins {
+			pinmux = <K1_PADCONF(10, 2)>,	/* uart8_cts */
+				 <K1_PADCONF(11, 2)>;	/* uart8_rts */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart8_2_cfg: uart8-2-cfg {
+		uart8-2-pins {
+			pinmux = <K1_PADCONF(75, 4)>,	/* uart8_txd */
+				 <K1_PADCONF(76, 4)>;	/* uart8_rxd */
+			power-source = <3300>;
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart8_2_cts_rts_cfg: uart8-2-cts-rts-cfg {
+		uart8-2-pins {
+			pinmux = <K1_PADCONF(77, 4)>,	/* uart8_cts */
+				 <K1_PADCONF(78, 4)>;	/* uart8_rts */
+			power-source = <3300>;
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart9_0_cfg: uart9-0-cfg {
+		uart9-0-pins {
+			pinmux = <K1_PADCONF(12, 2)>,	/* uart9_txd */
+				 <K1_PADCONF(13, 2)>;	/* uart9_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart9_1_cfg: uart9-1-cfg {
+		uart9-1-pins {
+			pinmux = <K1_PADCONF(116, 3)>,	/* uart9_txd */
+				 <K1_PADCONF(117, 3)>;	/* uart9_rxd */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart9_1_cts_rts_cfg: uart9-1-cts-rts-cfg {
+		uart9-1-pins {
+			pinmux = <K1_PADCONF(110, 3)>,	/* uart9_cts */
+				 <K1_PADCONF(115, 3)>;	/* uart9_rts */
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
 
+	/omit-if-no-ref/
+	uart9_2_cfg: uart9-2-cfg {
+		uart9-2-pins {
+			pinmux = <K1_PADCONF(72, 2)>,	/* uart9_txd */
+				 <K1_PADCONF(73, 2)>;	/* uart9_rxd */
 			bias-pull-up = <0>;
 			drive-strength = <32>;
 		};
-- 
2.43.0

