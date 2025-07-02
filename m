Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D986626D4FC
	for <spacemit@lists.linux.dev>; Wed,  2 Jul 2025 11:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751456245; cv=none; b=EJ5i+emgmcuQzcWfg6WDm+V9cMaON4CMGu9V1994HR6jtN6J+o9pec0VWKqcCTrlXonymyuiGM9AY3M6woEd8WKVuOjirWr65BSsphQk+6RV3uJbNU0wDU44/9MQcYuQB4DZyqYyBGyqZwwB/jaBmTZad3I0M+M2yh3dYafKd/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751456245; c=relaxed/simple;
	bh=uhCWHyd3B3M9UnF4Ahzw/jZFjxrbH8IJ9YEb9lQ3JC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eP5XdV18Jze8uXBN7KdmnzXnp0PSIxRO+9AMaYxrIzmSwNiBx4D3gIz2odLa7YwX3GriHBwdgnpMN/m+zWcW1lOE1JabnT1nMYjDjyxUjfBZXytVnfD7uVrlw8UF0AE8GPHixC6PE2VtkwozyNcwDWrPA88ViX+DtCjY+xpkljI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=iRGh0hiW; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="iRGh0hiW"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6fad79433bbso39948816d6.0
        for <spacemit@lists.linux.dev>; Wed, 02 Jul 2025 04:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751456242; x=1752061042; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MoP1pXdfqtHiiOeYolqOqMKK+HZ6JiOVPla39TeeGl8=;
        b=iRGh0hiWz72IUfpxWZDiwzdQlSZGK5xHcTkxsyW53/N0eas8kHdTf4GSYBPsagDfTF
         AukcbMlCdTAemrXK1ltyHaWXlA95mYDjhCeq3NRNTOpj75G8rYRESjTjde8vJN/EXtZg
         s7pCxtE50XaOjx8AAVvkgXLUzjZuODEbGQGFvuvyMLrGMWXPbTJwnvxKItSOWnOczEK6
         oTnmSyndMagHkj+500Kuoy+zotrO+lG9Mj5xr4zuXRYzmrIKa4ZfL89EEqLgET84pq55
         IN99X5tubkrYtjf6hxMgRTS4K7hecH1BfQ5nmRb/WsYTL/KHQAEs5FcLYlT5JJEddL0y
         KCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751456242; x=1752061042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MoP1pXdfqtHiiOeYolqOqMKK+HZ6JiOVPla39TeeGl8=;
        b=Efd1/Bth/W+t2SWP3VXlvqOxNhID61c7PxVMAJNQ5byXvgNsXSagAj6rIQlo79NGAy
         dVlDZm6Yj9DQAclH7aZovLZmuuaF3JkVZfl9BYT9N7+DZKiCDdUB8Zh9V+uL8s4Ly9iN
         s0oIbUJe09FCp3L+PIdp/FcUzqBkYh2NRDJIAvKhePWZc5ZMOGntEgl8KnUla7uiO7DZ
         Yvl9QBesjUqXGOeldHSaLnmdDs60Y5ZiHZO5gQiC2NT6+DHYptPmXe3bkjsufQ91b3u2
         WPDS1lEjxEoBTwaxI8SgOqEn5uls3UOAS/yytSXPTdcg/BhCtzrgwv8U0/GcdyS2RxW3
         GWZA==
X-Forwarded-Encrypted: i=1; AJvYcCVCd/ib/hEeJ/jfPMxThOx7I9A7LEB1es9ecc+1k616UjubPbtaUBTeqUxKh02IMMIng2n72jmyCg==@lists.linux.dev
X-Gm-Message-State: AOJu0YysRvzhFsWsLjIDQQH3sT2J/8+O56Jmi68krG1gkKKqGAG+NqUC
	kyfgvEqtvZRvzMxn9GYLesn/NaqVAubHxSgUOu0ydBPacx7sUsAyLhFRcSLYQqiUgUE=
X-Gm-Gg: ASbGnct8R2hr/xZpouMl3GNcatbUMlniDdNW4Tmcf6sGAxaB7dHJGI7hdMA5tOrmFQw
	gb0kg6R6em/fOB2YD0yzThxai3BF746DOXueeFnCyYvyT0lVtufqcySvgONVmtHzp8it3J7vCqh
	ZW5gT3jHHB2uC/V2VynJ0IFbY6ch/RrN8I6BTjsjJYDQWehvo8+ri8LpV7HRP2m8loRl1Ip+Ted
	UW6AF8Eru53Fgt2+VZgic+cm73kf8yNRNLphdeoM4CALkESPkPi2A1fIMWZpsH53jAW08xW/t4w
	578ZVGBtXWlKR6L5+aExHMc10DR8lm4wNb0ECkwn9YY4qy4CKxQA5zV62lXWh2Kkss+Ktei0Pkc
	DYxUOHkmX1le3blUVL/2NOBufL66KSryUOvNPbcnP8gJEtw==
X-Google-Smtp-Source: AGHT+IGVzvYqyb92eSOlmx/sXh5kUAYoEUgvaX7Z5vlbrOx+1z7amBVysl7FNglINMkR5+bJnESH7g==
X-Received: by 2002:a05:6214:3006:b0:6fb:6040:5d4d with SMTP id 6a1803df08f44-702b1bad9e2mr41519016d6.28.1751456242594;
        Wed, 02 Jul 2025 04:37:22 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7730ac6csm99218046d6.103.2025.07.02.04.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 04:37:22 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 6/6] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Wed,  2 Jul 2025 06:37:08 -0500
Message-ID: <20250702113709.291748-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702113709.291748-1-elder@riscstar.com>
References: <20250702113709.291748-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define syscon nodes for the RCPU, RCPU2, and APBC2 SpacemiT CCUS, which
currently support resets but not clocks in the SpacemiT K1.

Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 14097f1f6f447..4bc69bebfebfa 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -346,6 +346,18 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		syscon_rcpu: system-controller@c0880000 {
+			compatible = "spacemit,k1-syscon-rcpu";
+			reg = <0x0 0xc0880000 0x0 0x2048>;
+			#reset-cells = <1>;
+		};
+
+		syscon_rcpu2: system-controller@c0888000 {
+			compatible = "spacemit,k1-syscon-rcpu2";
+			reg = <0x0 0xc0888000 0x0 0x28>;
+			#reset-cells = <1>;
+		};
+
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
@@ -562,6 +574,12 @@ clint: timer@e4000000 {
 					      <&cpu7_intc 3>, <&cpu7_intc 7>;
 		};
 
+		syscon_apbc2: system-controller@f0610000 {
+			compatible = "spacemit,k1-syscon-apbc2";
+			reg = <0x0 0xf0610000 0x0 0x20>;
+			#reset-cells = <1>;
+		};
+
 		sec_uart1: serial@f0612000 {
 			compatible = "spacemit,k1-uart", "intel,xscale-uart";
 			reg = <0x0 0xf0612000 0x0 0x100>;
-- 
2.45.2

