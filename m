Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044A91E0DE4
	for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 13:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744377364; cv=none; b=oW1+Uc49/hQYcmROJjQ6aLXD3IjQOqIPJqmotzi/h2CVDBQvZKzzyQNFR1r4Ez4qnkrc9/6ztcdx0OogoF9ALsCD/u1xMUWOZuGYEa/F3RhaElqY0enHUqJXfJsE5APnU/tb+mzVSkf/ziKo2ekrLwbJ37qJkquGYm1eiWs/qPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744377364; c=relaxed/simple;
	bh=MjIPXLoM5IUhIoZhl+wifWQND7T3/kSCdIUtGuu23/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=paQzABsUvmR9M8XGdS/XzaMNjumfnt+NQm2oQ4Y2IsjALPtmmsJaaq25FFAlyHorEDAyBMUQE1VNCH5wdckS3J1zVP5F86D5C12FL03dIuKxwKIcw/4T6KWIfNRoYcWxVMBEtIGtSjSrF3FxtIDKHs0XoMrgdgy6IdljrfEWWHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=zJEkHr4I; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="zJEkHr4I"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2295d78b45cso27366855ad.0
        for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 06:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744377362; x=1744982162; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iq/zLUOAjmqMOQyCH6CedvdIB7nhaB2p2wb10oaF0qQ=;
        b=zJEkHr4I5/OrPWZ09Ob6SXwWIQRHTaVqYovgXClfffUL17MBv5SvUKSUXk064afwTy
         +S92Lcmnp/dYN4bv/yKDoJf9+8zr8yj1U2allp7BGCuquRNsG+bCDk9PzF0NJvCko+Ew
         CfwdDjnYIXSDf2rLm6XDgr1DTd5PAXnIgJukNWVySIQNo6S4nYCBMC0c0krPQvrqKcc8
         gTKprO93rvjXag4eEqm7TI5hTx6CDcAVLppkMnQzNuESRD3fS6yiDL2zUTOtxFg/nHjL
         34X7gW2qndm0OT7MRcYAn/03kgS395SwJ9g69KARnGNRfIMGx1HC9YW5S39NQ9kkT7T/
         6Rlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744377362; x=1744982162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iq/zLUOAjmqMOQyCH6CedvdIB7nhaB2p2wb10oaF0qQ=;
        b=FuYUupBOARrsww1eO9QpQ00RuTA6kWCn97wPBEWVKqEkC4agXR8SHpnbHDhz+5KLWm
         zpmHYg54KjK8KMe93ZxQ9y5HDsU9JlaoW7Pf3HcI66exHdELMKIzJmyHKCLmQSwrYYg1
         hkpphLjgVZaEZkoDgjyDIlKhr2XHgH/TtWQ8BQK0yfH+bdf6uomItpIVuYS9Kr0eYjxj
         B56V2NyS99GGY6VaOMUox4QNqzYfOu+kLxfBYx2w4xyXKqxbYu3G2CfohskmCdXQcTsN
         H01sB4acYYwKdA1wvK0QpdVmvBbnInRgiBvFi38/zfetzEvSu84YcJzB52h0hPotDo8e
         yyeg==
X-Forwarded-Encrypted: i=1; AJvYcCV8wZ6jXYMTUa6ZahO56uH1/4+1O/hPCX1e3LQHL5o0WUGNfKh9jykwOUC0dju/Y84MMwodggNuoA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy70RG9DGhKf78qR7tgNQ1n3ivSDluDtK0n1sl+aOWrTF53uv9y
	M/ksHKyNOa1QvSe3o/4GNn56bQXrOrR3LQ5z7kX6TzBaFhuhSkruOf4mLKpASX0=
X-Gm-Gg: ASbGncuPWR6/F+y1iVwMR32ihMxhn+cNuMcLmdbAsM8ahC4/b/6AwkndVKkOjrpOLBQ
	euODBy4lkArKxQx39HuMUrrcWqie2N5EYc9zV6lPpkjjGBSYrZxHU5xO07U26cGn3Wce9ohbtfG
	16aMgth8GUIS19T0DSk+/bmTIMlRgkUW7QV08s/x80LJTJ9NRUBwTV1RcH1Fo/WjYdwk264dR2l
	l9WUr6WN2DEw+rPWtVR9QfNuBizS79BF87obLE2BK7rfKMCjIYe0//6zt1HaRa4wnc5stX6CfI7
	LhShT12ZigSQsebtQzRbgJFxYpvBoC4=
X-Google-Smtp-Source: AGHT+IFYuzue8rTIhMXZdvGPMyvl0e8z93Koxv1rsyMMhwoJlET+hmldcsrrZX6b0qlRAdpPJUNnxg==
X-Received: by 2002:a17:902:f68f:b0:215:7421:262 with SMTP id d9443c01a7336-22bea4b40f9mr36467045ad.12.1744377362506;
        Fri, 11 Apr 2025 06:16:02 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a305:4::308a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cc6sm48245005ad.122.2025.04.11.06.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:16:02 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 5/9] riscv: dts: spacemit: add PWM support for K1 SoC
Date: Fri, 11 Apr 2025 21:14:19 +0800
Message-ID: <20250411131423.3802611-6-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411131423.3802611-1-guodong@riscstar.com>
References: <20250411131423.3802611-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT K1 SoC features a PWM controller with 20 independent
channels. Add the corresponding 20 PWM nodes to the device tree.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 180 +++++++++++++++++++++++++++
 1 file changed, 180 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index c0cc4b99c935..609135cb5282 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -556,5 +556,185 @@ sec_uart1: serial@f0612000 {
 			reg-io-width = <4>;
 			status = "reserved"; /* for TEE usage */
 		};
+
+		pwm0: pwm@d401a000 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd401a000 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM0>;
+			resets = <&syscon_apbc RESET_PWM0>;
+			status = "disabled";
+		};
+
+		pwm1: pwm@d401a400 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd401a400 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM1>;
+			resets = <&syscon_apbc RESET_PWM1>;
+			status = "disabled";
+		};
+
+		pwm2: pwm@d401a800 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd401a800 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM2>;
+			resets = <&syscon_apbc RESET_PWM2>;
+			status = "disabled";
+		};
+
+		pwm3: pwm@d401ac00 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd401ac00 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM3>;
+			resets = <&syscon_apbc RESET_PWM3>;
+			status = "disabled";
+		};
+
+		pwm4: pwm@d401b000 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd401b000 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM4>;
+			resets = <&syscon_apbc RESET_PWM4>;
+			status = "disabled";
+		};
+
+		pwm5: pwm@d401b400 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd401b400 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM5>;
+			resets = <&syscon_apbc RESET_PWM5>;
+			status = "disabled";
+		};
+
+		pwm6: pwm@d401b800 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd401b800 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM6>;
+			resets = <&syscon_apbc RESET_PWM6>;
+			status = "disabled";
+		};
+
+		pwm7: pwm@d401bc00 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd401bc00 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM7>;
+			resets = <&syscon_apbc RESET_PWM7>;
+			status = "disabled";
+		};
+
+		pwm8: pwm@d4020000 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd4020000 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM8>;
+			resets = <&syscon_apbc RESET_PWM8>;
+			status = "disabled";
+		};
+
+		pwm9: pwm@d4020400 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd4020400 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM9>;
+			resets = <&syscon_apbc RESET_PWM9>;
+			status = "disabled";
+		};
+
+		pwm10: pwm@d4020800 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd4020800 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM10>;
+			resets = <&syscon_apbc RESET_PWM10>;
+			status = "disabled";
+		};
+
+		pwm11: pwm@d4020c00 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd4020c00 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM11>;
+			resets = <&syscon_apbc RESET_PWM11>;
+			status = "disabled";
+		};
+
+		pwm12: pwm@d4021000 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd4021000 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM12>;
+			resets = <&syscon_apbc RESET_PWM12>;
+			status = "disabled";
+		};
+
+		pwm13: pwm@d4021400 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd4021400 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM13>;
+			resets = <&syscon_apbc RESET_PWM13>;
+			status = "disabled";
+		};
+
+		pwm14: pwm@d4021800 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd4021800 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM14>;
+			resets = <&syscon_apbc RESET_PWM14>;
+			status = "disabled";
+		};
+
+		pwm15: pwm@d4021c00 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd4021c00 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM15>;
+			resets = <&syscon_apbc RESET_PWM15>;
+			status = "disabled";
+		};
+
+		pwm16: pwm@d4022000 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd4022000 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM16>;
+			resets = <&syscon_apbc RESET_PWM16>;
+			status = "disabled";
+		};
+
+		pwm17: pwm@d4022400 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd4022400 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM17>;
+			resets = <&syscon_apbc RESET_PWM17>;
+			status = "disabled";
+		};
+
+		pwm18: pwm@d4022800 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd4022800 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM18>;
+			resets = <&syscon_apbc RESET_PWM18>;
+			status = "disabled";
+		};
+
+		pwm19: pwm@d4022c00 {
+			compatible = "spacemit,k1-pwm";
+			reg = <0x0 0xd4022c00 0x0 0x10>;
+			#pwm-cells = <1>;
+			clocks = <&syscon_apbc CLK_PWM19>;
+			resets = <&syscon_apbc RESET_PWM19>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.43.0

