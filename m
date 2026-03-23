Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B171038C2DD
	for <spacemit@lists.linux.dev>; Mon, 23 Mar 2026 10:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261179; cv=none; b=qPm5MEmm/4ubzjlhjV/Gl/DXwkngeZDWqhd1QbZUZf/pGEcOYerJM4yd1hahAE0JNbFCKWEiYtxbXr7NvZJeYCLMp9THjqSbrka4v5mfOkijf6Hd4IYm0DT8bnzBZ8i/zKwGD+QftbUD3NPxc23BwpDdCPzuSJdULdcRjjeyNyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261179; c=relaxed/simple;
	bh=/gTW2KIO8YWPZZvIgANhTUBFOJqFsbasdAHU7V4LVpc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dw8SJ7ntsozq5SdoXK+dyULK0DbaX/pnl8xy8GwUaznyhQMRxEuDZ1T0lqfuWKVXDwoaahotB/xDipw+ufP8cqLWdtlWWxtAWEZOvP17qAdKmaOL+YuaCVH7SvM7ydLAkPB+pFm7rVYXvspArbYmWpO5mszoRe1BRnJIXwIgAEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+jxiFUL; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+jxiFUL"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486fd27754bso31935765e9.3
        for <spacemit@lists.linux.dev>; Mon, 23 Mar 2026 03:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261176; x=1774865976; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qk6FKFUlfen7jg7q4m1JiKEm7wDVFQJ1+nZHyEziSco=;
        b=A+jxiFUL7ztDiJ9BD5O6iqJkplQrPdyXWQTos1k373YHyO1FKKg/ySkOVLVrjqi+5Q
         7KC7rFmq31RyL5KOp4cYdFTusup8TxQFQCh9nsZzT4qvXsIZ2khgE5SawbW3G3gqY9WE
         hUd+z9UpkE+9VNgaBjZT4HaT9iqcfEWL8fAyGgdxk1f6YKRXmsrtjSJEIYhIVNHnlLm9
         DRWYVK7ycYvKXxHpSXQZH5CyNF+HZezTc3/W4Wlhu7DuuXyDXHJY4CLsrn6mu5b8bWrD
         MZovp+1Wjon484Cm9SgtfPbIihe/G4wLDTNQpc+dCkl2LRCN0n1qt6o1XBIDlpSA3Kx+
         i8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261176; x=1774865976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qk6FKFUlfen7jg7q4m1JiKEm7wDVFQJ1+nZHyEziSco=;
        b=Sc72Fu23w8IJutO9+nM2oKxO+O6jJH7DgwWncQK/eFZqvLoPRxcIW8++QNLHD3cY94
         GFh7MtFTK5GAbzzYDJRD3ekh15C6mOZD24MGIULtCttoGeXZhq3ISB/WOSUWm7qfghFg
         dGGM6btjMk2ClcJcMGqMD8R2RMv+f02UawGLr+5Ulz7vVFZyhKnwoIjsDodcJ2NzBbJZ
         KnCmXFtp7UxC/0ZDJHpcp0IDvTctehHWSaKTY7W2DiD105dsoY5DX1x8FI2gPrrL+cWk
         70EaIxFTNSiq4ydARvo9h9TfwcnPpwYMEw6k8w0W+s9bYBTkcnmpmePFxzc8WFrjY14S
         w6Iw==
X-Forwarded-Encrypted: i=1; AJvYcCW78ExaJqpnHUoj0WZeTshBeW5W7DWF2z/yO+eT7GwhzLUo9NYloZPGtAieaanBV/XtCmIDwIjj3A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6ibBxDL2y54dAEr2tmX0UR50nqg/i28P/cKuRswC65T6mCtqk
	xc2c9ro0/VBZ8IhMsmhNr1oJcB4xi9BJ8vE3t26Nyu7cSzvbNRx/4DAh
X-Gm-Gg: ATEYQzxsgaju8EbybdiJ229Mr1JrdejEiIPdvG/R7DHGeCk7gl2uoIfN0s9xDohKyB7
	ahSOevP+qHONW7Poi+M9czn232BZ/VBLBudA9AlhF8CyA7fXkwhoMQLGF6VsRrT2oPNXv/Lq3XH
	AvZqEIQxFnbfJejKx79gHlgKIZWS6EhSLgJ3W3zYegrmBAOSVGDY8OI00o5QDHoWb+u5NiGXafI
	FsnKv4GwmXXvyzmOvkFE3PKUbAZSUUCwdVQXpbw6Asl/64cObm4uYdUiFMjLFkF2ZcQsCWffOV+
	D8Hay34gbLMSYS0BFS/yIwn+HKmbP6HapU3m38HYNbTIm4cvjOW2gtE3DMA2R/S5X2QapPW1pKE
	5p/Rp8gMOT0DeriLcj/tz94esgdjUnBRUxU2/lzrQhyonqcTqsRSfrk63RiU2M1tN9eQCtvRr3u
	IGkZQFfMikOjRcZ3pg93mRJPFTgsEgwJjY/c26bPhF49IDIedn3uVi+1cYPRFYsYDE
X-Received: by 2002:a05:600c:c167:b0:483:9139:4c1d with SMTP id 5b1f17b1804b1-486fedd4143mr159160715e9.14.1774261176024;
        Mon, 23 Mar 2026 03:19:36 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe86acb0sm78755445e9.6.2026.03.23.03.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:19:35 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 23 Mar 2026 11:19:07 +0100
Subject: [PATCH v4 4/8] riscv: dts: spacemit: k1: add SD card controller
 and pinctrl support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-orangepi-sd-card-uhs-v4-4-567c9775fd0e@gmail.com>
References: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
In-Reply-To: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
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
index b13dcb10f4d66022d27307de73a6ea3287e97441..8d82011f1af666fb78c282a2abcc0cb88f962053 100644
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
+			drive-strength = <7>;
+			power-source = <3300>;
+		};
+
+		mmc1-clk-pins {
+			pinmux = <K1_PADCONF(109, 0)>;   /* mmc1_clk */
+			bias-pull-down = <1>;
+			drive-strength = <7>;
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
+			drive-strength = <13>;
+			power-source = <1800>;
+		};
+
+		mmc1-clk-pins {
+			pinmux = <K1_PADCONF(109, 0)>;   /* mmc1_clk */
+			bias-pull-down = <1>;
+			drive-strength = <13>;
+			power-source = <1800>;
+		};
+	};
 };
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index d2015201f8e5adff8bda75712036b8dc2b79bcb5..3952c4d0ecfb26e9d215955ca8791243bbd1dab7 100644
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

