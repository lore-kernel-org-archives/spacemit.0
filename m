Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95B33932C0
	for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 07:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065188; cv=none; b=kHu9gjAVU/FQAkS6Dewp0kmS0MDyfcsLcDFW97d5U63hBdFm38cIQhqxNQorcejuybQD7KQ/DAwiA2ONV653/Y9de5CmHf6e7Fbk/xh5/FejaHnK7qENr91cGU3F1r0BB4t7yMTFUdA7+kIKqLirf0KI7VLpfJCHD/HpJgc+2Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065188; c=relaxed/simple;
	bh=eVrkEXLP+791DyS5CNA9zSUQG9FyxWIPqUaZlx8PVx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ncQhTpoyLFgphw9eftviPz3+/SXimNh6VnhXPpa38Pj5uLwig9gm4Sz3HyhM/uUUmX/YP6a+F9ybWA3e2yAl5cndc0EUruGaqdUqwvf18nKL8m2gycoigZQYlsdIp8685utvzyCFbKu6Lveie2puBTD41vMNs+SukCbOo8ft+rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yg/OIY7w; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yg/OIY7w"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48374014a77so57158125e9.3
        for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 00:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065185; x=1776669985; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1uRceIt6FZHOLqKiVcTKsVGt2IzySijGuQ2Z2k+iYk=;
        b=Yg/OIY7weQTx9xMn4GlFSLQO+PfAp4rOOdTBeNSN8NQHp1iRrdF1w82RpeBhQgcJYY
         hEHpei4torE/zHG2Zc8VRPenZqR/Cqt0+DF1wmGahGLSxBr/1fr0ZUPeQS/voupcpDfs
         KpKdh78wNDDLmSfjlz/QAkKpRX6kQzthdeGwAq1vOgqzjmnMHLzK7sTm6j9De1ILgPKT
         a5/SvwfizaIvuF+dQ6BZXg32BF/iFh55Oa8rJ/yxIZm+aUvXfLuGQKoMFoz6IHICYDUw
         Fl1bS5rbKGoWUW9HgsAce7RTYMFJATsOHA/QRMURdWQdx2lHT/bCsP/RDs2SSdTAMwuc
         uXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065185; x=1776669985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J1uRceIt6FZHOLqKiVcTKsVGt2IzySijGuQ2Z2k+iYk=;
        b=NEKvmJX9sn9R0TlNNjhYucmyjoLe5xYynaGySddzY7PzlyvkcH/xQcE4nQiuRhUtFr
         6asC6tMo5kuym4iumL9rCEGurp13THszalFPZipF5JCHBzS3aHsxQpfIaTl0VpjL0mvh
         jL0Ysn9IvlNjyUcF8AMaQHsRv/NAEtKnuIXFLzhaSkDuXAxACfWlF4+6Ts1oOqQDe4AN
         D4wvxAF/rme8sdIXkmYsJfMwHvXQw7BREj35NwJSPkQ2on7G8WuWJOs9i00U32Dw6uCk
         88D2UPU6TSDIykQSlT4EJWns0l6EXXm/bcDfK+TyrTN2TNJzu9pJJCJSRndUzlhiGti9
         hn1g==
X-Forwarded-Encrypted: i=1; AFNElJ/F1HHPFIVwRj81FQT/u4JjNuwBOXD35ktIqdGkqN+JZ9QaziBGiPwWvjgizGhEbNS5yCXtPmbv5A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzwHKyOjvYTs2/Ss1JHQDdFFsC7yxjP5Xl5Q3XHpRJINdkmBAgc
	vefQDjZ62oktslKgHmkepmzVJmi1QnTH8sp7QVE64gQmz6kfhEv3REHE
X-Gm-Gg: AeBDieuQw3x0lYznhzog+e5rs6o/3Id7fswPClSWDdYAw5icU4F/bhxxMYAwhYuEYcc
	I292LRhyCe4XdjgfvVhavNPcwQPeyY9mKJUVtIQ8SCLMXkxutuB7jPodlQsRJSeDbP9gEKX+z+T
	Z/7BixhLIswbvSlUxdHQBbMhGPcg0+I+04Ww8p4HNR13I+xRD2pDHuq//EYhtuq4+feqGoaWeq+
	A5/Y00Gy/XO8xwX1KzlxEbahXbQ1HCXVBJRbDT8uQWFrj/9p5B5Lxl/rPZyZ7zDCm/JCwy185RU
	NFfhMRxtGVk+qtb/yAkRjBMyrRRdBmhjKi8D2yFjsu5cmDITbC+9/fFLFWkCzYONKILfBjsz9vn
	01UK1vNJg8aaxePX31zS78azR0NyifGU6UsWAt+E7J23+din+8N+l1eje8o7PAk222WHvm7hz5V
	zVzbveIO8CWCoXr17vs2UETjnEnOhrTeGsTpZTBz6swtnI9ccrMoY5DoDB/+C3IZ54
X-Received: by 2002:a05:600c:528f:b0:488:a82f:bbb4 with SMTP id 5b1f17b1804b1-488d689d0b8mr164261225e9.26.1776065184991;
        Mon, 13 Apr 2026 00:26:24 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d532ef00sm308602325e9.5.2026.04.13.00.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:26:24 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Anand Moon <linux.amoon@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Vincent Legoll <legoll@online.fr>
Subject: [PATCH v7 5/9] riscv: dts: spacemit: k1: add SD card controller and pinctrl support
Date: Mon, 13 Apr 2026 09:24:47 +0200
Message-ID: <20260413-orangepi-sd-card-uhs-v7-5-16650f49c022@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.3
Content-Transfer-Encoding: 8bit

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

