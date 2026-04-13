Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2458837E30D
	for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 08:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067367; cv=none; b=sQSWRnNWdIexUVSjWlVLxGaAxya+1Qv6C0UEAAODNAIYok3feMmBI2impU+YaBLk8JhD54lriIobtm0IC/kvVUsPUFiTmQILVwTUXjsi60e+gaDY9QXeuhI3DngFLsti1OYueqC6jauzHHDgHqe9fNTbWFqumU/pQ4DXuqw4eXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067367; c=relaxed/simple;
	bh=eVrkEXLP+791DyS5CNA9zSUQG9FyxWIPqUaZlx8PVx8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XP3sRa2hhvowroIviWkmODn2I0jBg6z1rUb5qOUcCsvkVpA2uFDuQGBgiT7/k2D5nj4LXslkWcsA5bN5aJRpoKxhJOAtOLulfB45Bd+G5v0hBq51jEYyj7BjBvcH0d0uKntUMmOW2lBhReQcEjTOggeKx2P7K7doUzZ2gq1sY1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oujRPvDL; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oujRPvDL"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43cf5ad500fso3488775f8f.0
        for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 01:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067364; x=1776672164; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J1uRceIt6FZHOLqKiVcTKsVGt2IzySijGuQ2Z2k+iYk=;
        b=oujRPvDLwMkAIjZxiueMMxwDm4curuEiWxYRoHjE9aGaOKvsUTy0jjz8fYxl7cVG5h
         D6ZfO8JdGamxh9ltFDRjhHm0zAJKUZBiNbS7mkFBy6YE60Ie9CoNzjcm797VUsoZIK7Z
         Ie/J+Dx25HIyQ3I8BEehPWYczYj309uZjRNfJGxZ3e2hbJhwfOD1G8Nop2gizL+weICW
         XTD8eElLf7CJn+fDGjaQUhRpuTMPPORpmkQr88qSu4UMPAkbgcEXGK1Rw+4hh4ut+VL0
         88SS5vvzDGQvbhxXGEqrkcrvGO0Wt1KdKHOMhBUg5D5bCPa5oc0uRsmSR2+vcGu9E7Y0
         V8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067364; x=1776672164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J1uRceIt6FZHOLqKiVcTKsVGt2IzySijGuQ2Z2k+iYk=;
        b=WHmSP3JBeebx/jP7Vcp1R6VRQH1QYULCGHw33Kp0RAZaYZ+TcV9ZesMT3lU3remZO9
         6KLk6I/NOp7VS3qrlaqG0ME9pMTG55WSOCzpiLy4r7x8fp4ANynx5FR/rHUkvKnZORPq
         Db4BSaK94RrvObN9nKaIKBYZdPXKl2PA1qao4sBMFOmNbnRB9eE4h2npmwVVNASLWvAP
         kVE/TUDhjw44UeaBwzUfm/v4+5JVDy4mpXGdCLC034V1N/TAxHmU+G8YkuqXAiQYE1Y0
         ApWNYBSD1ZwEI8aeBkOS8gzEVFGJ6TslZWefFgluRxXCpTOS9k435dhB5jC4I7tJS/1G
         SVNQ==
X-Forwarded-Encrypted: i=1; AFNElJ+DZibIEJ6y5C537stYNMrxyeH62PklM3pAUSkcT+VyRmWV0NN9USNqHKnfWrfHf+0CbWJ/aprf4g==@lists.linux.dev
X-Gm-Message-State: AOJu0YykSTVfuMsxEysRPItY4nIZ8vvC47C/9xVL9THutHj1/t8s17tS
	00aQRn98VviUPZWzr5vqeASQRbn7rPlGPnwIZYnZVozH5w3muEpCVmaB
X-Gm-Gg: AeBDietvfbxNSFHRKlYgYp5j+k8JiMAAPYS38CFeu/YC3Q+xvpsnXKbUjeHKtYT7QGr
	dbCi+B3k/ei/+85TasGwm2DgT/F80UK2u9tr1Lh0x1gpgTzqzRqeQEPiEuB2OyltzpySdD29bSX
	eLc4HHZw5xD+sG2R0l6/OrH5yPU/Gdz6QQ+F5CENmJYmb/sXHevPRVl9pFqQU02qF5SQf/1dXiZ
	wd1xkB4Qa2roY1cL1/0xvj1nvwe9nD7VEwO8Cj8iSiA2QDZlmi/b6jAx4xIQIFE9ZZsUHFQ/wMn
	7fil8oM+xnz5bh7/jDIRBJW/YtC5M0nHO8CTuDyIHSqd93+FWNEAIaXnfVQDzv23kibXV5udRgP
	qwcTJT12HufVhzMDQf4S2tydzQsxzDEmr7C2URllYumsiB8OH9CLa9OGtWUIb5f+zPcnla29hqk
	iqRiIvTIVKUk3iV7p1hODKmkjBUW0NMVymLyPsyxrDB1XXYV9KczoKBQPJ+gbce0nT
X-Received: by 2002:a05:6000:40cd:b0:43b:912c:25c7 with SMTP id ffacd0b85a97d-43d642c4f22mr17696379f8f.25.1776067363780;
        Mon, 13 Apr 2026 01:02:43 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm32155932f8f.33.2026.04.13.01.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:02:43 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 13 Apr 2026 10:02:14 +0200
Subject: [PATCH v8 5/9] riscv: dts: spacemit: k1: add SD card controller
 and pinctrl support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-orangepi-sd-card-uhs-v8-5-c21c40ec16d0@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
In-Reply-To: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
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
 Trevor Gamblin <tgamblin@baylibre.com>, Vincent Legoll <legoll@online.fr>
X-Mailer: b4 0.14.3

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
Tested-by: Vincent Legoll <legoll@online.fr>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.dev>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 40 ++++++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi         | 13 +++++++++
 2 files changed, 53 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index b13dcb10f4d6..b3c472a0783b 100644
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
index f0bad6855c97..28949f804610 100644
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

