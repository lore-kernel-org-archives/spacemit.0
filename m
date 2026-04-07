Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043003A6B9B
	for <spacemit@lists.linux.dev>; Tue,  7 Apr 2026 08:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775550372; cv=none; b=Cg+GVsCSkZR0sxSh7Fz5+iGzimkKk6X+xgvjaN8ZrLwRitoM4F8dL2t8YT1TTBA8utTWGtGplZbUsktHvSDUoQ9x8GVIv1dLk3ff9eRUPuGK8VofIEhwNr0rfrvzwkcsZiPK13Ta+PLF3ZRZRTNZ/7/oGDvwG3NCX5Tza4C2ytQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775550372; c=relaxed/simple;
	bh=srwvc+G6b+Bd39d0fyAJoHrONrs2GTTxkVsJWJE2N5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oLACsv1Kr7syqUvfojw52JgnmWLudY3esz/e6+cBR/gP6LiuMLdnhMA4z4nFdxgfdhbnFkerOY5BKxNOYQnP2Nn12yJfcmvgIZJk3mqWCNxdTDUh1gL7myvy/6JDGaYxxDy1mSRPrQPYQifz/jti6Jwxd9egphKS8S07ifjbzaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BuSWRBRg; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BuSWRBRg"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43cf5fbacc9so2251595f8f.1
        for <spacemit@lists.linux.dev>; Tue, 07 Apr 2026 01:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775550369; x=1776155169; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u4Odv7xUvMFtyNhPTKS3HH3RP8ayug8koOlIGuCJxko=;
        b=BuSWRBRgFwM0q2DnMnBBz0S36ostv757g4A6bsqL6K8dMUpcsWEUQDHNRjSbq1tNVQ
         Suraq0TVH2D5ormVnDS26ij2j0rva5qlCCg5ymFWS4nGIRaT3zgyEmkF3P2DbXqehHwX
         No0isopgZS2fNLzcaR/B7Q0qlyevdJIM64hnwAHyNEjjew606crfgiuQXbhO7DrVveK5
         girEpzCobv16DSFt3Fi2DbGytfnIjd8mMaKqboKuVgSuxRoEkVyJcMg7EMztbqTS07Ts
         uis+w8lNsF5i1SNungn3zw1uCbGMRyW6hywH95Wv5F1PQdKoKvzeKpuFEbn0QYgFyQVI
         dVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550369; x=1776155169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u4Odv7xUvMFtyNhPTKS3HH3RP8ayug8koOlIGuCJxko=;
        b=BCwlnE0Cx26wP7AGCRKUFUeraw+Viy7UiDdY+uXMy3bD2HtXPF0lju9mdZgKVZUJbV
         vUWjAg60VbzERi2nTf5olicj6virRz0QhdcL5Oh3j6EXq0im0cuPUQr5weist3y04Oeu
         66GRBTBVBc4ElSH4ia4CDzb5ZyBez/dtlkOQt2t+ZeF830orMgsqei3VYQG6GN19BsR6
         XdBwckwvQ6tFu3zegSrzIt1u2sW///1ShL+xgA90FbrKkhyCJ5255ftvtHQkvSHAUI5N
         S43k2fFht5tW0mlFsgAShyQZmP79buySGvIZXqWxm/l+DIooF4I+eSGVgEX+W7KT8YMw
         fNtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVledctVI+XJf3Di7VZT06cl3xOrZgH8ftNVagE6HGpxHy/rYx/m97DyZB53M4eyyq6Rj1qdUCrNg==@lists.linux.dev
X-Gm-Message-State: AOJu0YztK23CxEAN5IrqZrK6HunvrN45wSzhhYwyXv8nyZIJ4ug0E3wo
	+bmG+O8zOSqeIbJecm2/3Xtyx2CkHK2EzMLjgcqyElnixvmjK+K8UQ/r
X-Gm-Gg: AeBDiesehfnnUk0R5aQV1Osc+Evo6fblSdT8Mv1C0wEDHmYx/lEFOgIBIXFnS3VK1Is
	sg+8njS6KLeiYo4RCUghA0L9D2OOwvnLUSPHVH9TVvLk3/s0U7JgPl7cj2cPR+fTB///xDlLzSH
	gouW4/oBD5MMuBMb/QcCS3z/zvYa2sbAdUmCPx3BxNSM6DU74jVOrPJhcrW/WXUHxJhDkDNw6tj
	0hhmNSMVtELU2XTbD5Hyugm5li+P3tViHKXT5MOFTB0yQJcASNv0xajt5DQypbYfp6ugxJTq71Q
	tbKAD9x9NootR72DnIkmUwZJB/kGXwOdfolN7iuJAHA/1iLJrBlwNi/ExiQJUtVXzbqJY+QZIOD
	QOn6ioq7rcWZOuJhtLpyhBxPKTohyOws8vSWObMqju2Wdo+rDHrZZmVVXiPKYBi16HAjSg5S6oa
	kAYkM/xb/7cusqD/9Q5B8nVooIZh+/GAtLrJHZBeNUomfOYkogzbmR2Vz+2XIsZFfK
X-Received: by 2002:a5d:5f82:0:b0:43d:439b:e102 with SMTP id ffacd0b85a97d-43d439be12bmr7817683f8f.10.1775550369145;
        Tue, 07 Apr 2026 01:26:09 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm48669958f8f.21.2026.04.07.01.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 01:26:08 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 07 Apr 2026 10:25:25 +0200
Subject: [PATCH v6 5/9] riscv: dts: spacemit: k1: add SD card controller
 and pinctrl support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-orangepi-sd-card-uhs-v6-5-b5b8a1b2bfc8@gmail.com>
References: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
In-Reply-To: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2

Add SD card controller infrastructure for SpacemiT K1 SoC with complete
pinctrl support for both standard and UHS modes.

- Add sdhci0 controller definition with clocks, resets and interrupts
- Add mmc1_cfg pinctrl for 3.3V standard SD operation
- Add mmc1_uhs_cfg pinctrl for 1.8V UHS high-speed operation
- Configure appropriate drive strength and power-source properties

This provides complete SD card infrastructure that K1-based boards can
enable.

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 40 ++++++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi         | 13 +++++++++
 2 files changed, 53 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index b13dcb10f4d66022d27307de73a6ea3287e97441..b3c472a0783b99091662d2d3516aa7fec4b3c3a3 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -570,4 +570,44 @@ pwm14-1-pins {
 			drive-strength = <32>;
 		};
 	};
+
+	mmc1_cfg: mmc1-cfg {
+		mmc1-data-cmd-pins {
+			pinmux = <K1_PADCONF(104, 0)>,   /* mmc1_d3 */
+				 <K1_PADCONF(105, 0)>,   /* mmc1_d2 */
+				 <K1_PADCONF(106, 0)>,   /* mmc1_d1 */
+				 <K1_PADCONF(107, 0)>,   /* mmc1_d0 */
+				 <K1_PADCONF(108, 0)>;   /* mmc1_cmd */
+			bias-pull-up = <1>;
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+
+		mmc1-clk-pins {
+			pinmux = <K1_PADCONF(109, 0)>;   /* mmc1_clk */
+			bias-pull-down = <1>;
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+	};
+
+	mmc1_uhs_cfg: mmc1-uhs-cfg {
+		mmc1-data-cmd-pins {
+			pinmux = <K1_PADCONF(104, 0)>,   /* mmc1_d3 */
+				 <K1_PADCONF(105, 0)>,   /* mmc1_d2 */
+				 <K1_PADCONF(106, 0)>,   /* mmc1_d1 */
+				 <K1_PADCONF(107, 0)>,   /* mmc1_d0 */
+				 <K1_PADCONF(108, 0)>;   /* mmc1_cmd */
+			bias-pull-up = <1>;
+			drive-strength = <42>;
+			power-source = <1800>;
+		};
+
+		mmc1-clk-pins {
+			pinmux = <K1_PADCONF(109, 0)>;   /* mmc1_clk */
+			bias-pull-down = <1>;
+			drive-strength = <42>;
+			power-source = <1800>;
+		};
+	};
 };
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index f0bad6855c970a609253d4b0ca2a4fcbf06bb8e3..28949f804610c60b7fa89d957507be32e3b49f34 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -1211,6 +1211,19 @@ emmc: mmc@d4281000 {
 				interrupts = <101>;
 				status = "disabled";
 			};
+
+			sdhci0: mmc@d4280000 {
+				compatible = "spacemit,k1-sdhci";
+				reg = <0x0 0xd4280000 0x0 0x200>;
+				clocks = <&syscon_apmu CLK_SDH_AXI>,
+					 <&syscon_apmu CLK_SDH0>;
+				clock-names = "core", "io";
+				resets = <&syscon_apmu RESET_SDH_AXI>,
+					 <&syscon_apmu RESET_SDH0>;
+				reset-names = "axi", "sdh";
+				interrupts = <99>;
+				status = "disabled";
+			};
 		};
 	};
 };

-- 
2.53.0

