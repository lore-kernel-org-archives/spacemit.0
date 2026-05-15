Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298F647278F
	for <spacemit@lists.linux.dev>; Fri, 15 May 2026 10:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842159; cv=none; b=MrGenIjQdCL9V5NofbTLOYjUCdV2ZM4j84G77JrYiEtxRjjS3/uqx5Y9u4VURUruWje1t75ENM79WjNYdIuwlWmBj0unD5OXewrfUo1IS1qJjAsbIUIzsgljXAUATwIox0qGm4aXlPbxmMWojp9bz+1ij690i1z0W1ZzemH0+UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842159; c=relaxed/simple;
	bh=3aSvx4Io/6wXnKYqIdHAgAeK+8aI7Ki0w9r0gL1YGe0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MQTuJaAawLKvIlXuKVevIGHG5iuuiY0AayDsgAdMx3UDVZEWBC+H24hgLok2Giuxv6czBHVsN2Qb8ehwXjZCzN2PD9unc4UGl5qpisoPxBiA61WrjrwfsofMQwVKRemk605eg1JZLq6pI1SDar2ALxgf9NpBaxor6w4UdAtsnlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hGXxw7GJ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hGXxw7GJ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44ce78ab5feso7632868f8f.0
        for <spacemit@lists.linux.dev>; Fri, 15 May 2026 03:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778842155; x=1779446955; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWgPUQvxpgR7326ne226FMqTKp2lrFwP9NQdMcyNV50=;
        b=hGXxw7GJxxHGlNjIgHIKh9sVNyjG+MuFJvmZo4cCNWuCNeMc7jxD4TDFXXK1NVBb9k
         +Ap6BXwGt0HrXdWggEjBvf+Ceinijer8/ghbs+xdBkx6cYGLZex/ZXdLDExu8N+apEpt
         pb2AZH+JW1fReq6P4msARjdfvs0vCeYDsw+saCBlkozo5qn9Orviv0K+Rr5O0Fp5lpfE
         hJ/aJc5oQaHraxttUghNj1VoUdLx9eqzzLWsmkQToUA9gtgJT6KNGjnf28qXo2v1EXdQ
         EudplOaOubrkvczi/CxxvY33ZW6vF2a1PFIwoIioLUwkrKGVbNeEkBPZ/8hvIG6gzAvy
         f19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842155; x=1779446955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AWgPUQvxpgR7326ne226FMqTKp2lrFwP9NQdMcyNV50=;
        b=swTJRwihxf6n3IoGT8GNzaSWchAp2eq1QryEsa6EDkfOZgsLKpyy11RsQl28iuPXsb
         dws/NKDzKIDmPO2hC3JdTt78Dfj4tKw0BRtqrzJ5sYyKgApd+JEUHRBWmc9Zih8atK94
         9xckLzFKGzFM8PDaRPFmNydEmiTR391x81JpBtQBvm9tJPWBli0XQB8d65t3lLCL6LfV
         rP/oWHIjZu3N36ZUT9UHWcYYj1ZOcFm60QzLGu8pmUwRDgxShsYL3sFvOq0N6i+yjagY
         UQkErt2k0LLUmQwnUvMnTZgDpredEKSmxbaF+Ebopaj/nrbMbOG936sVbEUNeKsCXlEH
         Q6MA==
X-Forwarded-Encrypted: i=1; AFNElJ9+kthBIiMGyTBsjnQe7cjY/uA4fxQqUI7KGS3ToWNZzs2DBfaCKpbbA+bRTH7uDAMwNtIgnDUweA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDWtaBXpkadN2p+LPoGNUXfIRNyI6tAIfKV2FUs1Ed3o6zRi5j
	5IWEAK4UOdL2YG93Zwy0yI6Tvdh/XZ0lBVI581DKb+xbYuCf7izoeVNs
X-Gm-Gg: Acq92OEIyfZ4VYWkqQGZt5MCazyBcnwEhZ/LaSMic2fXots6gzEvnzQqHlkkPjVXddj
	nhSeuyl85QS92D0f9TvWCeaUM5UaGwZ2dTTWN8n4vlXiJ61bgwHILRiA4gDcjXgiJhgKqKlW1WS
	FODRKqcmUW+qxhZ/ylEruCdtv3QtD+WN85WdqscPrF6bxZT3oxejIaJhj6Fg6E/dBhhM06MexHz
	YWrCq2KMwvNRL1jjjwrG6jDUV+QKmNNRcA2/AhAIwM3hrd3HfxHvsSdB8uqNgYLMEIRJq4moyM1
	EtzDUIUO02YT88PjWnWBzA/Oa3OlAUbXAOViTqOhDYD29Qt8YgQ+t4O52u8WhtHu+5/ph/7SKfI
	VeMsFh9Uzu57sBJtOnpZU/d8QWULRCtnU1+XY1gCNaZFuwba4TjDvNQY5/CHFFcuGD3lIC3DtqA
	H0XhcLjrfS3m+E0gO9kqJl54EXsE7r7RqVDkkD50H06GPEq+tCt+zUGqxXjRxyTcsMfg==
X-Received: by 2002:a05:6000:220b:b0:45d:d092:ac9c with SMTP id ffacd0b85a97d-45e5c59f691mr4788790f8f.33.1778842155465;
        Fri, 15 May 2026 03:49:15 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3ac86sm13975602f8f.14.2026.05.15.03.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:49:15 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 15 May 2026 12:48:59 +0200
Subject: [PATCH v10 1/4] riscv: dts: spacemit: k1: add SD card controller
 and pinctrl support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-orangepi-sd-card-uhs-v10-1-094af27e310d@gmail.com>
References: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
In-Reply-To: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Yixun Lan <dlan@kernel.org>
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
index 34d88334e95e..4e9a62d0e85b 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -590,4 +590,44 @@ ssp3-0-frm-pins {
 			power-source = <3300>;
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
index 24becab4c959..06469c364eef 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -1214,6 +1214,19 @@ usb_dwc3: usb@c0a00000 {
 				status = "disabled";
 			};
 
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
+
 			emmc: mmc@d4281000 {
 				compatible = "spacemit,k1-sdhci";
 				reg = <0x0 0xd4281000 0x0 0x200>;

-- 
2.54.0

