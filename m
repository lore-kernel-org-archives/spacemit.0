Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B4531DDBB
	for <spacemit@lists.linux.dev>; Thu, 21 Aug 2025 15:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755790027; cv=none; b=Knx5P8b82NJyHGe/ZnLgPrP15oPUMCnPQhpZG2VGGf2OXIcexi7lmJe5qbOd0GGzLC50IqAcxTgfEh9X2yQaG+GBbEXcZEOPQd+zz/j7zvIor2XrpiYYwLcBDQPh1I9nz77IEmIZvXrTnolNCGEhit93jC7/Q0U7NclmxoFh3T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755790027; c=relaxed/simple;
	bh=pTn8q9gyy4U3k5WPUfs8ClUunMArOq9kWVVYSQNm6jA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sZM/9+/M7rdqwf6iYjTywH2GpqTUPZi5OjPdItQflWAGYd1CLOrDtALud1qQZyPSsxqt/AAyt1fcI4Ll6bfQvOwKwEK/o5z9aD/1gFcEeLbraP8TwYSIm25nrFy0Ie62YSfAHSIMCp7lkq9x4MLC9zGyQ19npQI9PVC6NfPacgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=j4GkwgME; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="j4GkwgME"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45a1b05a59fso8529205e9.1
        for <spacemit@lists.linux.dev>; Thu, 21 Aug 2025 08:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1755790022; x=1756394822; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2sjxBGydTfjruOh7OE8E/RbRzU+dSv4jaJNJXDHUfdU=;
        b=j4GkwgMEPiVrgI/xv8bYdhT7Sow7rscMoYFFi/eOG83HroiOSja7DyqXb4fsx9QbKu
         JN/udpL0xjtjyf814a9dNq6fDbAjtbAcH2pGjEimnYnuT9WoiSHgIgXwWr4AIhldS0gR
         axONhNZxsILzkQotMQ1EQL7jPPPBnI4+HQTDBGM37fL5m4zXHezjKQgix57kSZH8oMWb
         viOn7mFCcnM4kmuPCIjjJD0WEeljg1y62L5DeoMd3WhktPI8LuiJBoTkHgun+N0U/CPc
         bTKX4W5cbGkritwMB4Lh9x0n1WOgcEMc3tkaSZTeJJOrPKwMzvsb9ThKRU6BUmhrlyH9
         TE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790022; x=1756394822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2sjxBGydTfjruOh7OE8E/RbRzU+dSv4jaJNJXDHUfdU=;
        b=cPfp6IYmB+Ur1VqddPk9mZdRIKZgV/HIC72eWe1HjpbBduMi8z4XZ/NiYiEfjMOamR
         Z74wH7hH85ZE8Hp4aZgWwBmqbwruI+YallGigC9LDcoNapJAEbf8hh3rJVNzIUb7yD4W
         FbfSKYJ7crvhQJihiOGQ5cRa1/+9YT3DraF53Tl1k6fLasw6S09XeNnJO21eKO5H1qwI
         vKT1D7tPb/ckeMvpQns9+K6ugh1/5l0pP3MzVMC6vAKj+Ikol+9p+Xyt7hpCdttTModS
         K0ZASYt1e7sWqm4D5lyVDmMkqNFi84GlkGPfUAOH642VmiSzd83+zfv3SUeS/IajRR0f
         DLIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGqGYFXmYQTwz2sn0OX/hGhqu1gv9u+rQ7lc1Ha9A8nlIgm+6PsK97EIa68o+PSq4H0+uYcNDMZw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyEOJKVpUb873vArISWw0WDqbvZzazNksYrFSReT8jbysJma/9B
	w7xUfiCF9jQfOA9ebJhUbqdWPoXo4H+G1R54RfUDAac888ZIi96UIWczem4CS6uf0cY=
X-Gm-Gg: ASbGncvAZb1XByjuiDWgrNdzpa1eQ0w8Ah5yw9mZSEy4WRSE7WCZwzPB6FDj70bmtQJ
	4vvJK47e1C8DxWYWxRzOQgxNyRNuQ78pMhOxQtxIpBhQlHPC5D7K1+p72iEEgzVq4npFWyqL09n
	gKKxE1GzTFwTRIrVoGe/HZNdix888VTqknAkDiPuV4NZG/t/9+la2UXRGpDAstHXFvcztkr/ovy
	b9udMC/TPZSrI/MggeUC5OoonblHP61VaPWOY5PHw1VdCzRD3+DXye/H+Ic207RB1fXK9IDbCn/
	jOZpBlgyM4uT7bUiXZTBGJMnIqLF+Caek1OAlghXlvGqi2SMG5zIHiQeRaMINf06rMSFoF6yIZZ
	b/I/wQ34Yy6dTCr3EB7PK1oNEZ5JqKoi4ntGo6kk+AB/oJmTlZg==
X-Google-Smtp-Source: AGHT+IE+4ute/Nv5CZt5NNaDUwvVYtWu4YiNVI45PLItPoW2P50dq71Gb9k2LF4AVVqf2Lr512IxQQ==
X-Received: by 2002:a05:600c:1c90:b0:45b:4282:7b60 with SMTP id 5b1f17b1804b1-45b4fcc3244mr15901095e9.34.1755790022155;
        Thu, 21 Aug 2025 08:27:02 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:f5e3:b428:f4bc:eb5f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b50dc00b6sm1538345e9.2.2025.08.21.08.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:27:01 -0700 (PDT)
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
Subject: [PATCH v2] riscv: dts: spacemit: add UART resets for Soc K1
Date: Thu, 21 Aug 2025 17:26:19 +0200
Message-ID: <20250821152619.597051-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The UARTs in the SpacemiT K1 device tree are probed by the 8250_of driver,
but without reset lines they remain non-functional.

Add reset control entries so that the UARTs can operate when mapped to
devices. UART0 is already de-asserted by the bootloader, but include its
reset as well to avoid relying on bootloader state.

Tested on Orange Pi RV2 and Banana Pi BPI-F3 boards, with UART9 enabled
and verified functional.

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
Changes in v2:
- Improved changelog
- Omitted current-speed property for UART0
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index abde8bb07c95..6c68b2e54675 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -667,6 +667,7 @@ uart0: serial@d4017000 {
 				clocks = <&syscon_apbc CLK_UART0>,
 					 <&syscon_apbc CLK_UART0_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART0>;
 				interrupts = <42>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -680,6 +681,7 @@ uart2: serial@d4017100 {
 				clocks = <&syscon_apbc CLK_UART2>,
 					 <&syscon_apbc CLK_UART2_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART2>;
 				interrupts = <44>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -693,6 +695,7 @@ uart3: serial@d4017200 {
 				clocks = <&syscon_apbc CLK_UART3>,
 					 <&syscon_apbc CLK_UART3_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART3>;
 				interrupts = <45>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -706,6 +709,7 @@ uart4: serial@d4017300 {
 				clocks = <&syscon_apbc CLK_UART4>,
 					 <&syscon_apbc CLK_UART4_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART4>;
 				interrupts = <46>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -719,6 +723,7 @@ uart5: serial@d4017400 {
 				clocks = <&syscon_apbc CLK_UART5>,
 					 <&syscon_apbc CLK_UART5_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART5>;
 				interrupts = <47>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -732,6 +737,7 @@ uart6: serial@d4017500 {
 				clocks = <&syscon_apbc CLK_UART6>,
 					 <&syscon_apbc CLK_UART6_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART6>;
 				interrupts = <48>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -745,6 +751,7 @@ uart7: serial@d4017600 {
 				clocks = <&syscon_apbc CLK_UART7>,
 					 <&syscon_apbc CLK_UART7_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART7>;
 				interrupts = <49>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -758,6 +765,7 @@ uart8: serial@d4017700 {
 				clocks = <&syscon_apbc CLK_UART8>,
 					 <&syscon_apbc CLK_UART8_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART8>;
 				interrupts = <50>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -771,6 +779,7 @@ uart9: serial@d4017800 {
 				clocks = <&syscon_apbc CLK_UART9>,
 					 <&syscon_apbc CLK_UART9_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART9>;
 				interrupts = <51>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
-- 
2.43.0

