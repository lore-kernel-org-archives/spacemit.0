Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913D539B977
	for <spacemit@lists.linux.dev>; Mon, 16 Mar 2026 14:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773669879; cv=none; b=RY8UCtwcJW2scLKcND6wWxKqlsz5r5koZhUVGt6iuM2bi3XDgFJNd1Sb6ODwbJdmpZQIMP+GBiCur15yIXivdxy/Pp2z2j7O5mmiUIXj4MlYLhyssi4RxvI18CH6dq4XjK8rO9ZoKVvqlPYho6CpycNbuUI+K2nb2iOcpAb2a2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773669879; c=relaxed/simple;
	bh=VV6Uc/fQnB1CO6vc4YbToyuLpo7rYuo3u8QPLHi0LME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DP6GMphNIuxd4ntAKBM56ycrqlCHl1YVH+wUYQgpYbW4yQNairctgTIo88Vi2WR9mszx4LE2taEEYPDSDCqX/3fQgm6sOMOssK8XNE+PlypAbHK6HqYOscN2YXzDCe8VSs7hNjYOiWsDZwGNflkkGGsuyQp13OKWaKSvzLgtR3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uft0O1Qb; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uft0O1Qb"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439b9cf8cb5so5238209f8f.0
        for <spacemit@lists.linux.dev>; Mon, 16 Mar 2026 07:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773669874; x=1774274674; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rCiQ7r9hHEhSUVh9d7R+U0a5N1ipko9lEeJud3TU6bk=;
        b=Uft0O1Qb/SREyArWmbXA8QoIH3mRE2S3U9ErlSxX4wKUfb255nlP23FNPXFpzGu9Og
         ZdY61Gys8iKhHnk6fKqAbG2NMnC42av9u+uBmYhMbNxSng9b96uKrfeXF4argR5nEU0d
         eZYnyJvAMybQIGuJgT5NtJ1+7/a43OBUAV+Xmi/xjrqMAoxQb4W1Za1+9T/q2zqh9sjc
         DCjuE48zLC/oCLedSJLufr4E3vc0ULVpxUR7EeqTp9s5OCZiMeCO82hIoncyA0dg6wbs
         5/gjNhHqNvcuFvtrPjXFtdcic0ZfMSpJhhVpE47Tn8kNBAFGDwZWQgaF9E0/tve2eYKt
         DrHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773669874; x=1774274674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rCiQ7r9hHEhSUVh9d7R+U0a5N1ipko9lEeJud3TU6bk=;
        b=KVMmZvW/Pvtrf3ErDmnTtt6mXskrKFMJ4hsdAl6fQ/vXOFjZMXJ8rcdZb2XC+1EVNR
         z1jsk1mBiK0EuEC1pLc2Wp2w3XGwtlcL9jQ+Hwi/DSBXrG6K+ZqVCia+nRohTgVHRvkm
         rKSfvL8KXnd8DoO9Ldt0tQxAyJ/VEg6BNGnLE/EeN4zoPu9kWGjuNT0/PfO1ODgZig1y
         krE3YBv7r5cZBSS0tPG421pwU98n9zzkmxBVUL8idIiky3CpcXm8vTNT+rC8uMi9KZom
         V+bXofV+NGemYaeqGk37zfX+8sjgioMM8atqoz//USQxQN2jFJgvYC4REQEgKbkbB65T
         jGwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVC3rm+fG+A6iY5pDzdajRGMLrY1owup7WVxX8kypab4pE9gnCXUYinnYyIXiWklkn/XTS2/oNYBg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy93IrjvMxvcXgnLHt6iAmOkJycYBLco3WnxmdarG/j+nrCQqYI
	7EYm1FyhBZ14hEG1vtsb7PxvAizwyHBK43T7yWFDz0r+ecDX12HPtYmp
X-Gm-Gg: ATEYQzylc8TdM7Kui8+DvCsCnlJdlFsr54XLRq47yOkkBlLdqerIbOaISrnVvGZO8BX
	8Wtv3SWlumrBz4eFV8IhRgCIn0hWbGma5g0GpawAgFIhs4kuT5/pR7qWlE1XseNJVYdCQQdcJ91
	LYWvfBTpjqLQ089O4iZdGOUcQqJlAcCSDk5rqRGJ2ALEU2HG7n4WGThePFbnvMMFaS4AQazq7le
	PNe2/Ugyiog59/JOKAxc2cRghDUAu/t2HXjzLloB+0X9h+mEgzoVwo6et2bCN71y+DkvzLGVtjr
	SAQQzXnbY3oEUi8sVg5LPVR5I3TNIlOUrYNkgx7I7dXpaH5FLLmDPnOW6WvVTjrIq7MyIeqzSJ1
	C708UH/Nuhv12i2JBB+NVemHqQF6JAWCYQSgTkyDZ0skyE0b+yaYH1V8QaCYZqug3bbtw6iI4s+
	Z4ZTB1Omm7+dCtUafASMtzV/bUHtam9q0XZnxvuE+2f3Es0tJ1kR5zA46/EfkKe6ja
X-Received: by 2002:a05:6000:4012:b0:43b:433f:48a9 with SMTP id ffacd0b85a97d-43b433f4a42mr8024247f8f.15.1773669873688;
        Mon, 16 Mar 2026 07:04:33 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.234.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b3a09e453sm20698725f8f.0.2026.03.16.07.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 07:04:32 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 16 Mar 2026 15:03:32 +0100
Subject: [PATCH v3 4/7] riscv: dts: spacemit: k1: add SD card controller
 and pinctrl support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-orangepi-sd-card-uhs-v3-4-aefd3b7832df@gmail.com>
References: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
In-Reply-To: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
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
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>
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

