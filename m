Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1353E1662E9
	for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 13:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744377376; cv=none; b=WvmNrx4UhbvH6thluJFDKxG1m4wcTa766i4QhvijKazDQI0ncNUOCiNCsBgJDlQWaVF6c3w4EyFbiCfsOWQBGMMXzafZ1XTmgqgL61V+hTCZZjvhB2Mwa6bI5HAZ4abwqKZfT0+JrwKun2FQR5q613BzOaw0B0ZS24Inn5Vg1tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744377376; c=relaxed/simple;
	bh=ZhNpid86PW40a0ogdTCjSqyWtpwrJbhHl+hMeMb+LtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J7jKNhnzTYNVX0IF6cbcgzE6O1Uuv365DkrYP8JKKl3j8ZhMDZX1j8Ag5/XBP6XoaW/5aWMDp+iKCJi9e9tMCHhw5l8Ur2rYO73YtAUDitwYIjsFvXux2xgOHNcH4xR53qFSIVQClaQMe5r+chN2bIoIsbKEt9kCX8b90OGzGHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ourQzLuw; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ourQzLuw"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22423adf751so19062755ad.2
        for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 06:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744377374; x=1744982174; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L81sw7HLh9+LhiB6MR/QGvuJQdrXF+C64yrUzRsSA2I=;
        b=ourQzLuwZzKYDjfGNY0K6klWKLusAVuYuHrk3wtvRKf0Eye9A0pAs8/3Z61laxLlBT
         jRpdBpz9Zh25kRrSh4iSBSrqz/XXpQpnbMLyHbmwI6ZWJvQBaL7wAnp6jpn5Gge93fd5
         Pip+JOmsy/jhJU57Vk9lblXuJy99eFFjXLO5pGSiZe9uDvkHK/Rrg42R4ZoZpLkpYcsm
         S3hBJYO89b8Qs1itDO+3/LGhoBast9Vk0r0YB0dQIrQeKBukLOGgEvtr669YnsBjmw0v
         yK1mv6jPZW3Lazv5dvMQgIxv065LonGH+GjX4VrG05psg6hU6e5wG8HNm32C3Cl/ASl4
         zIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744377374; x=1744982174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L81sw7HLh9+LhiB6MR/QGvuJQdrXF+C64yrUzRsSA2I=;
        b=tPQmjqS6Wy/P2249SuDDhaeYZZ3F+n7oM04NPgL3LbQL7tEoPPaHQRv+V8TWS6hLEY
         JKBkJAalzm/QG5oT2hRMj9NSjackXYfpNM2UNZTVBNL/cei5brt0vMSjzFqOJIvgzoKX
         jbA3W+m63zmUjS6gjmtoBMCzD3c0bgi4c1HxH1YcArdwCZdnpxRtrgS5BbPwoaUMahyy
         VRhljBpr2GvwKApv44QW0Cj3vNHTF9lGsBgceY/z3oxQf3M9sG3m56+m0bxdPgSrnGx/
         +X407jHjTnCSeyOG1uOmkh6Pega5uIJRdTNaRHBFWi1tOnlWtViFT5SmX9BYAqL76cIo
         aH2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQeyO48s2fGzZUjQTRMEgCxBXHFJAu+Icw9HL8fTRWTrkN8WT7NN5uSaN+COy1favLlWYgCbnqqw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yysd9b++OGSYTRwNVNq4PR4l398m3qwmtdTqand8ie2a/6wn8GO
	l4wv9VghyEmD/kJTBBwLacCmjnVzjOMbUtBHGOdX+4QPIKD6lGWUnlX7Pt1FzvM=
X-Gm-Gg: ASbGnct0ezdcXa2iiGLgWG5AwwUU2wJeE59VJslfuzJ7E3bZryban5DHMLGFpMkgFkj
	0KbEfJ+fFp4IHi56F/qm3JHJBk98t+/vtqqKIS9pnU4RRQCEsvPh4kyd53oficQs6I7AQY6IukU
	G1T6HdEkJ5RltomuiYfjebpKndUvzz0/vjDUMOmQ0caPqwuZdUNO6b0XZu6rN2LsGuF1KBuOKEb
	1UGnX5MsTkv+RbiJgPxK39gbSPy9hoSyh9noyP+wYk+72tis3/81ddAdSxq8w+A8vdsVkQIA+0g
	C9/Bj2Skfhw7bq6WP5AQKn7FMRsMb42Zz0cnrhlBEQ==
X-Google-Smtp-Source: AGHT+IEmLwAHBY89tjHCSmST4XI9krTWMwziLaJxfMz91MwbguhjP76VbrqQ0QFcdTjWcsDUD+s2Rw==
X-Received: by 2002:a17:902:d4c2:b0:223:26da:4b8e with SMTP id d9443c01a7336-22bea493893mr42628305ad.4.1744377374221;
        Fri, 11 Apr 2025 06:16:14 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a305:4::308a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cc6sm48245005ad.122.2025.04.11.06.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:16:13 -0700 (PDT)
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
Subject: [PATCH 6/9] riscv: dts: spacemit: Add pinctrl configurations for PWM0-PWM19
Date: Fri, 11 Apr 2025 21:14:20 +0800
Message-ID: <20250411131423.3802611-7-guodong@riscstar.com>
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

Add pinctrl configurations for PWM0 to PWM19 in the SpacemiT K1
device tree source file. Each PWM instance is assigned multiple
pinmux configurations corresponding to different GPIOs and
function modes.

Configurations include:
- Mapping GPIOs to appropriate pinctrl nodes for PWM functionality
- Specifying bias-pull-up and drive-strength attributes

These updates ensure proper pin multiplexing and drive strength
settings for PWM signals on the SpacemiT K1 SoC when selected.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 315 +++++++++++++++++++
 1 file changed, 315 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 283663647a86..294e05409933 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -20,4 +20,319 @@ uart0-2-pins {
 			drive-strength = <32>;
 		};
 	};
+	pwm0_0_cfg: pwm0-0-cfg {
+		pwm0-0-pins {
+			pinmux = <K1_PADCONF(104, 5)>;
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+		};
+	};
+	pwm0_1_cfg: pwm0-1-cfg {
+		pwm0-1-pins {
+			pinmux = <K1_PADCONF(14, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm0_2_cfg: pwm0-2-cfg {
+		pwm0-2-pins {
+			pinmux = <K1_PADCONF(22, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm1_0_cfg: pwm1-0-cfg {
+		pwm1-0-pins {
+			pinmux = <K1_PADCONF(105, 5)>;
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+		};
+	};
+	pwm1_1_cfg: pwm1-1-cfg {
+		pwm1-1-pins {
+			pinmux = <K1_PADCONF(29, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm1_2_cfg: pwm1-2-cfg {
+		pwm1-2-pins {
+			pinmux = <K1_PADCONF(23, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm2_0_cfg: pwm2-0-cfg {
+		pwm2-0-pins {
+			pinmux = <K1_PADCONF(106, 5)>;
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+		};
+	};
+	pwm2_1_cfg: pwm2-1-cfg {
+		pwm2-1-pins {
+			pinmux = <K1_PADCONF(22, 2)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm2_2_cfg: pwm2-2-cfg {
+		pwm2-2-pins {
+			pinmux = <K1_PADCONF(30, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm2_3_cfg: pwm2-3-cfg {
+		pwm2-3-pins {
+			pinmux = <K1_PADCONF(24, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm3_0_cfg: pwm3-0-cfg {
+		pwm3-0-pins {
+			pinmux = <K1_PADCONF(107, 5)>;
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+		};
+	};
+	pwm3_1_cfg: pwm3-1-cfg {
+		pwm3-1-pins {
+			pinmux = <K1_PADCONF(33, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm3_2_cfg: pwm3-2-cfg {
+		pwm3-2-pins {
+			pinmux = <K1_PADCONF(25, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm4_0_cfg: pwm4-0-cfg {
+		pwm4-0-pins {
+			pinmux = <K1_PADCONF(108, 5)>;
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+		};
+	};
+	pwm4_1_cfg: pwm4-1-cfg {
+		pwm4-1-pins {
+			pinmux = <K1_PADCONF(34, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm5_0_cfg: pwm5-0-cfg {
+		pwm5-0-pins {
+			pinmux = <K1_PADCONF(109, 5)>;
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+		};
+	};
+	pwm5_1_cfg: pwm5-1-cfg {
+		pwm5-1-pins {
+			pinmux = <K1_PADCONF(35, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm6_0_cfg: pwm6-0-cfg {
+		pwm6-0-pins {
+			pinmux = <K1_PADCONF(88, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm6_1_cfg: pwm6-1-cfg {
+		pwm6-1-pins {
+			pinmux = <K1_PADCONF(36, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm7_0_cfg: pwm7-0-cfg {
+		pwm7-0-pins {
+			pinmux = <K1_PADCONF(92, 2)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm7_1_cfg: pwm7-1-cfg {
+		pwm7-1-pins {
+			pinmux = <K1_PADCONF(37, 2)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm8_0_cfg: pwm8-0-cfg {
+		pwm8-0-pins {
+			pinmux = <K1_PADCONF(0, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm8_1_cfg: pwm8-1-cfg {
+		pwm8-1-pins {
+			pinmux = <K1_PADCONF(38, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm9_0_cfg: pwm9-0-cfg {
+		pwm9-0-pins {
+			pinmux = <K1_PADCONF(1, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm9_1_cfg: pwm9-1-cfg {
+		pwm9-1-pins {
+			pinmux = <K1_PADCONF(39, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm10_0_cfg: pwm10-0-cfg {
+		pwm10-0-pins {
+			pinmux = <K1_PADCONF(2, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm10_1_cfg: pwm10-1-cfg {
+		pwm10-1-pins {
+			pinmux = <K1_PADCONF(40, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm11_0_cfg: pwm11-0-cfg {
+		pwm11-0-pins {
+			pinmux = <K1_PADCONF(3, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm11_1_cfg: pwm11-1-cfg {
+		pwm11-1-pins {
+			pinmux = <K1_PADCONF(41, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm12_0_cfg: pwm12-0-cfg {
+		pwm12-0-pins {
+			pinmux = <K1_PADCONF(4, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm12_1_cfg: pwm12-1-cfg {
+		pwm12-1-pins {
+			pinmux = <K1_PADCONF(42, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm13_0_cfg: pwm13-0-cfg {
+		pwm13-0-pins {
+			pinmux = <K1_PADCONF(5, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm13_1_cfg: pwm13-1-cfg {
+		pwm13-1-pins {
+			pinmux = <K1_PADCONF(43, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm14_0_cfg: pwm14-0-cfg {
+		pwm14-0-pins {
+			pinmux = <K1_PADCONF(6, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm14_1_cfg: pwm14-1-cfg {
+		pwm14-1-pins {
+			pinmux = <K1_PADCONF(44, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm15_0_cfg: pwm15-0-cfg {
+		pwm15-0-pins {
+			pinmux = <K1_PADCONF(7, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm15_1_cfg: pwm15-1-cfg {
+		pwm15-1-pins {
+			pinmux = <K1_PADCONF(45, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm16_0_cfg: pwm16-0-cfg {
+		pwm16-0-pins {
+			pinmux = <K1_PADCONF(9, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm16_1_cfg: pwm16-1-cfg {
+		pwm16-1-pins {
+			pinmux = <K1_PADCONF(46, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm17_0_cfg: pwm17-0-cfg {
+		pwm17-0-pins {
+			pinmux = <K1_PADCONF(10, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm17_1_cfg: pwm17-1-cfg {
+		pwm17-1-pins {
+			pinmux = <K1_PADCONF(53, 2)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm18_0_cfg: pwm18-0-cfg {
+		pwm18-0-pins {
+			pinmux = <K1_PADCONF(11, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm18_1_cfg: pwm18-1-cfg {
+		pwm18-1-pins {
+			pinmux = <K1_PADCONF(57, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm19_0_cfg: pwm19-0-cfg {
+		pwm19-0-pins {
+			pinmux = <K1_PADCONF(13, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm19_1_cfg: pwm19-1-cfg {
+		pwm19-1-pins {
+			pinmux = <K1_PADCONF(63, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
 };
-- 
2.43.0

