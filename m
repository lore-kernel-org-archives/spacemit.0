Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1EB3B19DE
	for <spacemit@lists.linux.dev>; Mon, 30 Mar 2026 08:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859915; cv=none; b=TM+2T4zxddbdT6R37CTYI2SMuUUCDFfIQaNL7SrPsiMYlfXKXJv3bwWXr5aYlLqxqkcoiujXUgQF2z9zbkKukXUOTkwUBzTtDB430151IK8KxJnv+jh0xemEli4VaifUtVc7jEX5cMt6xrMQ7wWIALnqdtH9NasrK6Dx3HYvNOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859915; c=relaxed/simple;
	bh=NzCBjrcTHSjYT4vsIq6VhANz/XgUS+AnZRR6BOfp+KI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IXwUqAzY6cHo1BPXYFZ3yIXbX67p27qXx2tL4W+PBN86S7e92LULi8lfNU3/SbFILcQjBu3fUGAzjOTlzg0x0C+ltC9fPIxsZa7CkHx3YqJ2p1Bm1eBRVYH2Qy77paf37h4sBP9PBATy2OiY7htcPJFViFDVzWjl+Xjx1BqvY/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sQYeXKXJ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sQYeXKXJ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486fb439299so37891695e9.0
        for <spacemit@lists.linux.dev>; Mon, 30 Mar 2026 01:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859912; x=1775464712; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LD8Z/sB/L94aUjRnY0i7hrh3m0eioschCBJ3Qi7mtuM=;
        b=sQYeXKXJ2gdaQo4eKY9d/joB1BqFhzWdRbZ6qg6K1Lz6mccXcSc4sBJp+RazvyWZXB
         4Fiyqg0zTDg1h1kthmDI3mLGXA3Sqtm0tMm/hy22fb0FSdv7msDmItz5W88QiAUkAhhc
         LheUtUP+b6cED3QRMqps66gxs6/eQhE32pefHpxiHIAxnDFeLsolPpwU9LfSAcltA5zF
         Mx4euyk0wD974RRLlZIvjckeC8Z/zmyy5ClDEb3xrvJw0DlI7xe6KqX1Vy51okJtMByD
         ckUAGsNJZu1dRFvnhTE8IP6LkbvT0Nq7qoAAbKIDdX8QD7bq5SRmbTTmFsUNuSy0w/fT
         mGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859912; x=1775464712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LD8Z/sB/L94aUjRnY0i7hrh3m0eioschCBJ3Qi7mtuM=;
        b=CCxVQ/JaQHsL9Xv9rKQ6dzgaL7Id4rY9h3QJ+OccIU1GwzpKTfh/VRB8v4YmGz4LEw
         6ODaPRa2HKGjF6ORNS7JOJpsU8v1n6AEWHtoXUS4t4Sjw8TpSS7bSl+TvFwhuXYtKHol
         EttE0fqpR3L2cTo8cQ+jWfu6teX7myEqzILTWILNZoL+5L6BTLRGTaUXNBaHuKxCFLqY
         pDE8ukniOs9FFuXk/u5ze+wWUYbwiXrlafnfl3NQ57HnxQe1Ejte+MKfABopxOlu60yQ
         4/PTW8yqamfxPK6m0dY34rgcUohpBgfiNHnKuX+vZ22+iBwizHZAHgTYnW9nogCQBkEI
         c//w==
X-Forwarded-Encrypted: i=1; AJvYcCUA3ackR/2O4ZtFkoy9e0kKbiNkkr7AaykJpd0Po95ZhPI3B/03ZCsif5BUl4ZAEhyMumg3zoAlPA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxn+poOQSBFWzkHCfMuJPuQrnjg4rWYS7R+H3NRXp7Opx4vg/jW
	+LLkKRyA6RtAsfrdIzh33GipEuChooHTcgIxdxFxYi1/rGpyX5LDF5BR
X-Gm-Gg: ATEYQzyOgIfaeFI9DSbuD0gcr21oP4nEWK8wYRLmS5wqyXnpV32Mzq2cgzWjtDVlIQZ
	mvWDAJUkkaXpdZDJGOhuuvFtSwWTUEsUeqQHPaKlUc3ZxKK6ALnEsFrGx5IkRCBZW0TuOIVLwA8
	v3UHJT6ETy5CqnFhX53Rd1KecgKQ4GAucEoTK+w0c2jieSdRUaF4XXVTNZVtR3o4iYtL2ci7eZt
	sM5gmCdFLzTVgyJ/0fXPxwOL2za1aXCzOXQz34smfmppfCmOSKJ2W2cS7S9skin87B1/h6iEo85
	R3n1RhJWcYk2cCTPV86Oa3VE1uO3sDP0rOFNwBvtEYSI1Jdo9ETOSR9e/WNfhsD0tK1tBrNxzZk
	I97eaGdXbcFM1kLeL1orvBWFYB3dcKW5uNkGtg2wn8PLcKQaUwtzoerYKicrp+epwECuisGpNUR
	hf1OEN1dZ+06R4IwG6MzXjSKfoOzjY/icOfBiGS+L/U0ZATvuK299aySbVpOD7PPTR
X-Received: by 2002:a05:600c:1393:b0:485:3c8f:e4d9 with SMTP id 5b1f17b1804b1-487280a09a2mr194916195e9.26.1774859911875;
        Mon, 30 Mar 2026 01:38:31 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872712c236sm74063315e9.14.2026.03.30.01.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:38:31 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 30 Mar 2026 10:38:06 +0200
Subject: [PATCH v5 5/9] riscv: dts: spacemit: k1: add SD card controller
 and pinctrl support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-orangepi-sd-card-uhs-v5-5-bd853604322d@gmail.com>
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
In-Reply-To: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
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

