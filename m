Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85206224AF2
	for <spacemit@lists.linux.dev>; Sat,  2 May 2026 13:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777728718; cv=none; b=qABTP50IJcDUSXaCHnXYX3TGXyVEMp6juj4hZFbck3ghiZdffFvzIxYXNwnXQP8o9gv1WEfu/jQo7Oyn0QABjzbPX3A8zaMZO6PGXc0Q4xHwoHiSWFoP+DjeyEWsZocNbAHYHl1HTz7R9rPW9DzASZ+chXhIy0soCNf8/SBkiv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777728718; c=relaxed/simple;
	bh=mybpnbkUFkw7cm61GvY6X09yZBkBBXqM1ozOHvrnueg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fR2f+sbZpm1aKmE+sj3x7JTlzsCNdJxkHYdzWTiDVKiW20PQsIP10YOFcLp8pKBhbDNLWYRJell0eqorVog5yIlV1yIN7e3jr191I8gtCtNOm1oF8iNmsy2lD9yCnauRHVqHPDYP1d3+J/LK39zg5rTXlQ+jOaR8NHfdP7C/9vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Ob9Hacp/; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Ob9Hacp/"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-364e5d895e3so1352306a91.2
        for <spacemit@lists.linux.dev>; Sat, 02 May 2026 06:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777728717; x=1778333517; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jVhcCTnPlX7VHPRMEWLneWc1gnjPxqjBSj0V35oqvLw=;
        b=Ob9Hacp/8+vhxtmu98Y0Yl2AAGgjQoQApOIY2B7Q4Exz0v0qXXkyzUSxw9mtAY4iz/
         yMJ2SOtHOfJkjLZsTqbHeqjGXIfiMqdX2gj2JjBDIxnlVNWTnOrVnYa9bawbh/8we/bj
         ye0lqzCV6L+IugtuPCJw8W+Zx3JIjw8OFcCMeytpnZ8QmyxHjpkgV/8As4hPAiEfIEQf
         1lYq2DLKA7xcXy/5Lf0keyvwrw2XaAuHDWkwt1Gu6lYmxbRBOBd8m7lWsb77k/Ft5utX
         N+RrAkpZQB1qUiSYhoEmqf41BMgshpMp0mAZvZsMFv4JDXP7jvDWfIGLmtkn4l4o7ajz
         VJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777728717; x=1778333517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jVhcCTnPlX7VHPRMEWLneWc1gnjPxqjBSj0V35oqvLw=;
        b=LbQgHk4H8xZKHCkT+nuv2mWA9NT9BftVXqs3Vu8/9NOFljOuwRWe5mmBZD1UfwHoBF
         Qah6ODRqgHg2zPR+wJ9hoTJHNOqo5jSf+0FbO0vMcRT0HdOoo4FiMgW8r3vDri3LR8qF
         Eg7pefeecoc1dQiBl8r6PCjGQQ28WlDYUU43raa4osujsJ7Dc6LbuSNVqNkriEJIDHpp
         sZviuggwpqM0lZFgKpyf1aGejfQLa3XHzLBFn5tmFh+85lkIMlEnTzM5KGc6rP5xEL6L
         rO4CEveheFLYQxp4A7y6H99wU1cO76K951O2joUF2HHQoDV2JNHNERzd67gpy6T187GR
         S0KQ==
X-Forwarded-Encrypted: i=1; AFNElJ/pI+dldA7vfqRPTwOd7AGzZacckGAPgIVKxuIHZtRqBj2bxeIsm7TamroL7jhWIJ4bvRwuVMuUZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwVoxvqc8sb7ZgtkQrgtXRcUWcHkHpdn6i3CatUva/GH09CW2F9
	XApcYyekB677T/kfhJ/PI6d/fXGxhbM8Yx0ci7x105DkfvFXoUJG+FnWiiU+B/sdX9Wsl7827pq
	sOb9BDQFaFg==
X-Gm-Gg: AeBDiesFVljwnwXAKyOsWdzoSk+y5dt7I6Yq82VklPzzvd/06347kMYQoVPCP25apJN
	Kd9vbudaNvBZB4OETI5ymeUjoMJN9bTUukf22h21xnEV4rEHO9jEPgqsE5XljuN+9jFhwrsvQtK
	6wsCpy6zOsZFSLT2/cXAnRibu7sSX/CL1bt70whgaXYaf3+1G/sziFznoQw6vp3UoRsD0u759in
	RTQaMHneffJhJErDQcEgYy++CzOVShqmMNdBLaoXoj/7G1Oz8KPXLiHWaCOIlZeWYQuC9ZEtWOS
	fvUV/auiznkrhJ+tTUYlun7cPQIwIpYOqLT8zhg5rjUm+Q/htqa9Um2vYUfxbAGWiTe9ke6D+HF
	hJLJy833wvS9Kg63Bl0DDcfXNKAiQQKdtPUOIhH+bmCPN/BQA3TDaBRSr/OUaTMXiArPn6UCEKs
	vQE7Q6tWYMrs94duuVCFmob1jj+MjT2EkfGgtfMdetrrDigYcoWcStVdhLZWcgYCMO
X-Received: by 2002:a17:90a:da8e:b0:35d:9560:3f09 with SMTP id 98e67ed59e1d1-3650ce70a0bmr2989866a91.24.1777728716810;
        Sat, 02 May 2026 06:31:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::3016])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ec02ab2fsm5647937a91.14.2026.05.02.06.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 06:31:56 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 02 May 2026 21:30:53 -0400
Subject: [PATCH v10 3/3] riscv: dts: spacemit: define a SPI controller node
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260502-spi-spacemit-k1-v10-3-f412e1ae8a34@riscstar.com>
References: <20260502-spi-spacemit-k1-v10-0-f412e1ae8a34@riscstar.com>
In-Reply-To: <20260502-spi-spacemit-k1-v10-0-f412e1ae8a34@riscstar.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Alex Elder <elder@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Alex Elder <elder@riscstar.com>, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.1

From: Alex Elder <elder@riscstar.com>

Define a node for the fourth SoC SPI controller (number 3) on the
SpacemiT K1 SoC.

Enable it on the Banana Pi BPI-F3 board, which exposes this feature
via its GPIO block:
  GPIO PIN 19:  MOSI
  GPIO PIN 21:  MISO
  GPIO PIN 23:  SCLK
  GPIO PIN 24:  SS (inverted)

Define pincontrol configurations for the pins as used on that board.

(This was tested using a GigaDevice GD25Q64E SPI NOR chip.)

Reviewed-by: Yixun Lan <dlan@gentoo.org>
Signed-off-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v10: No change
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi    | 20 ++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi            | 15 +++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 5790d927b93db..9429189354d6a 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -14,6 +14,7 @@ aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
 		serial0 = &uart0;
+		spi3 = &spi3;
 		i2c2 = &i2c2;
 		i2c8 = &i2c8;
 	};
@@ -335,6 +336,12 @@ &pcie2 {
 	status = "okay";
 };
 
+&spi3 {
+	pinctrl-0 = <&ssp3_0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index b13dcb10f4d66..34d88334e95e4 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -570,4 +570,24 @@ pwm14-1-pins {
 			drive-strength = <32>;
 		};
 	};
+
+	ssp3_0_cfg: ssp3-0-cfg {
+		ssp3-0-pins {
+			pinmux = <K1_PADCONF(75, 2)>,	/* SCLK */
+				 <K1_PADCONF(77, 2)>,	/* MOSI  */
+				 <K1_PADCONF(78, 2)>;	/* MISO */
+
+			bias-disable;
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+
+		ssp3-0-frm-pins {
+			pinmux = <K1_PADCONF(76, 2)>;	/* FRM (frame) */
+
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+	};
 };
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index f0bad6855c970..f8747190d2e12 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -983,6 +983,21 @@ qspi: spi@d420c000 {
 				status = "disabled";
 			};
 
+			spi3: spi@d401c000 {
+				compatible = "spacemit,k1-spi";
+				reg = <0x0 0xd401c000 0x0 0x30>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&syscon_apbc CLK_SSP3>,
+					 <&syscon_apbc CLK_SSP3_BUS>;
+				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_SSP3>;
+				interrupts = <55>;
+				dmas = <&pdma 20>, <&pdma 19>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
 			/* sec_uart1: 0xf0612000, not available from Linux */
 		};
 

-- 
2.43.0

