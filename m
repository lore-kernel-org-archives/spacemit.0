Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C6521CC79
	for <spacemit@lists.linux.dev>; Thu,  7 Aug 2025 19:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754594341; cv=none; b=ELqM9IAZupqpS3r52fZ/VAKblI3CSyDNToH952uCWZ5JtXEksxYo2hj2/Z0nDH66kCzVP7xRIoFEGYkmdQcM8gyg0ypUa7UcGPfgtRvbApRMiOz+IGEAl6oNGB4b3bplyZyDNP+Oq2S5BsWSWmJWxZHMX+iT5WoGQuVi9WDgU4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754594341; c=relaxed/simple;
	bh=P6CYGkCBsS2/j/K0E7tBx1r/xDresPDft3Hy8CqhCSI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=giboGZ5SIKHm0/30IuBXjBDjwEYK3nEaG46J9G3DwYbnTSXCKsC8tD38s3/KyAFeMXWMKtKocgqSlzpclc9qajRLflY5CVomKdUOHPfQhQ0vdGwC5X89JvNDM7whcuvPHXaLpFZXFfC5SZZNOj4L1n1hlLnsn5jREHfehKm/xSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=EwJdssL9; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="EwJdssL9"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso974995f8f.3
        for <spacemit@lists.linux.dev>; Thu, 07 Aug 2025 12:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1754594336; x=1755199136; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TMojSpDs0TkBAWsUruscamCHlztjGhkLSL63bamzheI=;
        b=EwJdssL98N3QdZd2BfYaNfOKjthP9MFMkNfl06XNSe1nTz3LASi0td4bZe6VuuhOuc
         N2Rem9t1d3jOADCWpkG7I1e4hG9Qx2TTJUlSCuWnxt83w2EbSQ1nlSLmrl4w9Gizhozo
         3mtlDS8zfiXda81rk/1co9viGoMqNIRvJaipmJvAZhEOQOhCyp+wSVsnQjb3qHgTve98
         4oSgYAiWOEklK1om7tBaiV8FDMp7PVrTGwZr9ilmeW2tAK/oLELr/buJ72ZaNw9yrB7s
         9+0turUbHhE0dOWCh+CnkbT+8n6+Y1gtpQZ1Hz4uloK4xf+ucAv79a8lUuYfRZixRN68
         BBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754594336; x=1755199136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TMojSpDs0TkBAWsUruscamCHlztjGhkLSL63bamzheI=;
        b=A8g/UvNmkcDuXM9WyAUGagXJGe6ubVX3PDOxNByO6BIWeM6n2EpSHRPhBkdxhTz/9E
         IqYh5ZGpYmO30eiX933IwBRKYbH95bs14dPVunXSnP1wOVbMh00hbIVKp+gDI9u0JKtS
         HzDOvI9G2fQQS0ZRydAhmWyRkR9IGXZvrXnVsC1PYHeFYLYH0+3KV4Wfez/hma8oie8O
         wDMTrAbCsdq0lsbOqC/F/Kmk1bC+pFzIpWWPOXqe0hfNJYZUIgjG5OlaGuJizb3QeCTv
         iFoX1GlDHK/BsjOZ17JNtKM0RYh1KU3ekAlthE+fyGP2ntt2WHJFp1S3dQPGhEESji85
         zfwA==
X-Forwarded-Encrypted: i=1; AJvYcCWof/vSp2jZ2XMLE8kv8Vm7fLLiZSRnXXX+Ui3aLFGt40/y4sZ0bsvvuawLHr1065vCUnX/iN1dBg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxync6cORjIXBCdOmY4bQs4tPgX9jSlqMBthfeBoxDS0rdfHBIX
	va4plEoZcyiLSOsOlnDota1q0R3iaIBym1lBo34yg7j8sME1ysvXvcSOAPDNsOXC/Os=
X-Gm-Gg: ASbGncsR6ICn4/iSWGgsfJnE8vwDG2U3P0o5YAb20Le9tVAsHrA3wBBZAba1jtIb/M4
	l6XZMbrLfP3LAsyUMYU8gEPdcpQNqS9eozTQeHeeR/C50l0JnLMzNwpjfm66bJiux0tmAxIZMLJ
	cyrOuX1I9zy2wqtM45IoXF/vqmGLqJ/GE1BpRnZ6k11v9eiB3dCKyunRVUdBYUjBQdLePwd4tUE
	CpHfiVdtsCZVs2vPLw1NRy+PeCESoD98QxoHvRKOJAcX4ObIgSV8RWJhca9fil4rhlhua44PW67
	YJ/rK2thagykKb94YRpq9AGvWmGAXS2BTWjEvJIPKwOIOwVXv0KYQx0rihDb6lN9FfKnMKXPue8
	a6ghPNM/TXjWs/2dFcZwF3A5bv35pNo979gvTxhEaAZNRby2/Lg==
X-Google-Smtp-Source: AGHT+IGmsZp5QGEdNPY5skMi/ehXySxn/2GJ+zanQmX1/LX2oBeqJ3fxjEoYN3cf/lF9eTayqWyhUQ==
X-Received: by 2002:a05:6000:40ce:b0:3a3:65b5:51d7 with SMTP id ffacd0b85a97d-3b900b54b20mr297294f8f.26.1754594335784;
        Thu, 07 Aug 2025 12:18:55 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:3bcd:db43:406c:324d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3c4d02sm26988589f8f.33.2025.08.07.12.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 12:18:54 -0700 (PDT)
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
Subject: [PATCH] riscv: dts: spacemit: add UART resets for Soc K1
Date: Thu,  7 Aug 2025 21:18:17 +0200
Message-ID: <20250807191817.157494-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add reset control entries for all UARTs in the SpaceMIT K1 SoC Device Tree.
UART0 was functional as it did not need a reset. But the other UARTs were
unable to access their registers without the reset being applied.

Although perhaps not needed I did add the reset for UART0 as well,
to ensure consistency across all UARTs. With the current-speed set to
112500 baud rate, it matches the factory U-Boot settings.
This should not give issues with early console usage. But perhaps it could
be a good idea to let somebody else confirm this as well.

Tested this locally on both Orange Pi RV2 and Banana Pi BPI-F3 boards. 
I enabled the UART9 and was able to use it successfully.

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index abde8bb07c95..7a5196a98085 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -667,6 +667,8 @@ uart0: serial@d4017000 {
 				clocks = <&syscon_apbc CLK_UART0>,
 					 <&syscon_apbc CLK_UART0_BUS>;
 				clock-names = "core", "bus";
+				current-speed = <115200>;
+				resets = <&syscon_apbc RESET_UART0>;
 				interrupts = <42>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -680,6 +682,7 @@ uart2: serial@d4017100 {
 				clocks = <&syscon_apbc CLK_UART2>,
 					 <&syscon_apbc CLK_UART2_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART2>;
 				interrupts = <44>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -693,6 +696,7 @@ uart3: serial@d4017200 {
 				clocks = <&syscon_apbc CLK_UART3>,
 					 <&syscon_apbc CLK_UART3_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART3>;
 				interrupts = <45>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -706,6 +710,7 @@ uart4: serial@d4017300 {
 				clocks = <&syscon_apbc CLK_UART4>,
 					 <&syscon_apbc CLK_UART4_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART4>;
 				interrupts = <46>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -719,6 +724,7 @@ uart5: serial@d4017400 {
 				clocks = <&syscon_apbc CLK_UART5>,
 					 <&syscon_apbc CLK_UART5_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART5>;
 				interrupts = <47>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -732,6 +738,7 @@ uart6: serial@d4017500 {
 				clocks = <&syscon_apbc CLK_UART6>,
 					 <&syscon_apbc CLK_UART6_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART6>;
 				interrupts = <48>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -745,6 +752,7 @@ uart7: serial@d4017600 {
 				clocks = <&syscon_apbc CLK_UART7>,
 					 <&syscon_apbc CLK_UART7_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART7>;
 				interrupts = <49>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -758,6 +766,7 @@ uart8: serial@d4017700 {
 				clocks = <&syscon_apbc CLK_UART8>,
 					 <&syscon_apbc CLK_UART8_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART8>;
 				interrupts = <50>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -771,6 +780,7 @@ uart9: serial@d4017800 {
 				clocks = <&syscon_apbc CLK_UART9>,
 					 <&syscon_apbc CLK_UART9_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART9>;
 				interrupts = <51>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
-- 
2.43.0

