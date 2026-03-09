Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0135B3A7F57
	for <spacemit@lists.linux.dev>; Mon,  9 Mar 2026 11:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773056440; cv=none; b=Jz3ZeoUn7Za/wqj4GqmS78eBrGJuWRTQ3Gi3uWKCHmaDGMa0WmVhjL46pGBiWVnmFlph5HIvwry2DMblUE/9mfWNHzt/lSDiWzBFbNAZE4enq8nxxLseDmm5qzweq1jTcJnnPf9TQO1prjM+T8WzNjdgk90RCQjuVRd5xO17doU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773056440; c=relaxed/simple;
	bh=dcEFhqPvKdwQuanA4mTY4Hc01u8XbBg6NksC+/+CuBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hU1Lxi7LOmCQ9M9uTtLvBHHYadBLz5lTjHKdpniE5qX41gFfLT1oNONNqK6HNshRA+sGKEMko2x1LRaRGHx6egy9T9qVVHhyhZ+Qaw8ebJFDGI0coY8lIuG13uKd7vKIUPvAHEXYO5WYtC0xeg7ZEP9lauYpZk9esbFgxN6KLV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dv7QiVNQ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dv7QiVNQ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439b611274bso5193356f8f.3
        for <spacemit@lists.linux.dev>; Mon, 09 Mar 2026 04:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773056437; x=1773661237; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dz1rwkI02gKLCCAejR8NRcSe9CYDdLI50V/yGcp3k+8=;
        b=dv7QiVNQpGEdsE14q6xAmMmiLaYAkLs3X/jtj2VXuKVachFFb/IOcZkRKfgCMB/ngN
         Jz+87fsXEWskGH32o1DHuxKv70dEjz8KOiuoFGv3IQWv3kLhyCjw2xs3rdxGYFRTJDyK
         Odidlw/26FErgzu/MhtpRpiY4LFcH5jFatkSeM/TFNORpSjIkG2vvysXPKHT9clbqeVS
         BXIPxwWJM8IgHM/Oe/jvFFQcs2Nva992b0eDYhcjOZdUFqqsLAbvb9loNmCFB1ch+uyh
         8gIrb8+42yPV3F68ozVB+RpZKbvEJgoveoI6uMyJ+BCPo7KXSE3rd+KrElcrTnIElbI4
         3lpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773056437; x=1773661237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dz1rwkI02gKLCCAejR8NRcSe9CYDdLI50V/yGcp3k+8=;
        b=szmampv1fXs0kz6XGRWSnVVSg9owzXcr8NPqyspMAq6U1fZoTkTWjMk42ecvOyg+/o
         /F1o94z664beQn8youapBRo+6cGgP78fuIkAOpZTr2HOfqKsUZcLF3EYW91cfmsH2zsc
         wQ9OYkniTnnqbBjw3vKy7Vcs7LnHkkUqPxvfn3YWjnYV6y9182ctqjLxJB6EzRpJ9D7R
         VRdEhJONzlhMWNohnMAA2DoOuJH7btMNykvcymilDuA5Mg1qfu6RfDZNDaZW7+StK0u1
         2h2EkI6RgpIG2/X+1TXLLYrDAzRnPnQPV1MLNfBdy0p0ljGixtoKBPT0AGvLxSaXwJGV
         nmdA==
X-Forwarded-Encrypted: i=1; AJvYcCUMXwHE6tT1/Z7mRDbjkhg3POmkJfuJIXJC6bFzLmLLd6bK3ryauZ6vA0Ixb+YwIg8te1lRN0emLw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwE97wsQc16HLlELj4xaWqkiEXNB/WsQaNUERup3r95TZv/ggwe
	bGq7y3WoJP4zRNu5AZxmAT7KAW5cbD4pmRcamkbRT4r8gwxErGP43hI+
X-Gm-Gg: ATEYQzwtwcO2668I4R3KdWCm3AH3lxXj/+1fJGGgC2UBvfJi5W3VBEJC0Wfwh7rMnBR
	BGPIatc+CXEim8lEaWV90v1TU8PpRZTGkuZyDTZWSfO3nCGvXv/luDitri2wllyMsX3SqXCxFzY
	irW0wRL8fLJfYcvtB6gTgTSVeQ2x4y8WdE3J6IpsOOyWM4VhZvI5mq/qPJx5Y/h0kVylWx7VJzV
	YE6ShBvYpE3JM41B37mhC5GNssmUERM7CfrRuPFNmsJ/Sou0dEelMD449z7ta4MWuYQdoRGxr65
	HSiqEqjglKQLm8JutMBnpf7/NZc5gqXM7i4Agu7GSEdeyTLHtFlG7bW6bQ+0K2B/onfjCRE/k3d
	/TQFEZpBFosW1ydjCY73c4czmLMJoJvn6qZVMf5kMJ1243IYu212Hr4OMXcZaJmyOfj1SAL6ivt
	Te7yFFsSQIexOxxCoBjGdIJ+nW0+Mi0Fh2mYBIiNmJ9SGjcS+kmHTuSE2L2XXsM+H6QPy9uXjkp
	gQ=
X-Received: by 2002:a5d:5d06:0:b0:439:bb14:23ed with SMTP id ffacd0b85a97d-439da6694afmr18775197f8f.24.1773056437144;
        Mon, 09 Mar 2026 04:40:37 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.236.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8ec97sm28471699f8f.5.2026.03.09.04.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:40:36 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 09 Mar 2026 12:40:15 +0100
Subject: [PATCH v2 5/7] riscv: dts: spacemit: k1: add SD card controller
 and pinctrl support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-orangepi-sd-card-uhs-v2-5-5bb2b574df5d@gmail.com>
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
In-Reply-To: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
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
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2

Add SD card controller infrastructure for SpacemiT K1 SoC with complete
pinctrl support for both standard and UHS modes.

- Add sdhci0 controller definition with clocks, resets and interrupts
- Add mmc1_cfg pinctrl for 3.3V standard SD operation
- Add mmc1_uhs_cfg pinctrl for 1.8V UHS high-speed operation
- Configure appropriate drive strength and power-source properties

This provides complete SD card infrastructure that K1-based boards can
enable.

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
index 529ec68e9c23eb2a93c04e9ccd3f22a01c4cc4ff..1e9e4f4f41c196326f20c0e5ae6721ea85ea5091 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -1207,6 +1207,19 @@ emmc: mmc@d4281000 {
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

