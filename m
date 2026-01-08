Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485E248A2A6
	for <spacemit@lists.linux.dev>; Thu,  8 Jan 2026 12:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767875298; cv=none; b=UmJ98sWcqBl9MQW9/zBc2PvnoZN8Xc3nfNiC6MXpRb0AlSmwb+b0L7Vc4rE9Uy+xwIDnBDhvkjawU7YCMFcEGoQI4O/Y+r4tAD3V8fBcK+r85cJ4JRBKyOedtuGijHEcT4/Dk1NR2bCl1T/pf1XSiGrSfgA7WLzccSDJ4XLekJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767875298; c=relaxed/simple;
	bh=B/xJC06ouJTSzqoVe1zpf/ArcrN3kkBBh4pRafmC2q0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K3+2OCDQBVgW7BAebyEUBtWEQEssVMK8naJDeCN/nNBo6rB04GM6wvTQbWuuoxtH805rms3w3KxNy4fznFhTv/JUFOokyshcP1fyfDz4vmsd45mxzMUJt647MuJPzu2AT7eYd6VsQ4WpE4x5a1UKRd0aYxgs5NwNRnoicXn0Atk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=AvVN4xa6; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="AvVN4xa6"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-81c72659e6bso977417b3a.0
        for <spacemit@lists.linux.dev>; Thu, 08 Jan 2026 04:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767875296; x=1768480096; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vr6lqGLFQ3xLUl/SLHoUY02BcAcuWIW3ayvn+T++ix8=;
        b=AvVN4xa6aXGd6/6tEiYTMzriSaB63WSj41EwL1ODPYraTwJaN4qe19haJ7B+xkDiEQ
         ZRZf++fQiwX0a3goJ2SHnJk9eh7IfokkcrBlFFGt+uzseXrRLWYfAy6muzdKS/PFFKC3
         PS4tAAUvgj9mzWkJMwhi8XAiOCfVUu9mu9MFcolF+JsKHvSFnA/wQ8xAa2ZmPd5TtTjQ
         7PfSsuoJtWngc9fDUVIwtRRYfJZdOp3V9By4if+rYZeJlGmdv5VUvBVx7EfAGsaKw2CA
         S6oJF7JzGncQ34HqUAuI6btzqil5cNNbxrFrJVHoEsYhBe7Pj6XhjdLyN+zR6nWR0dOA
         zEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767875296; x=1768480096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vr6lqGLFQ3xLUl/SLHoUY02BcAcuWIW3ayvn+T++ix8=;
        b=qmDGxM02kEOCR7wG7/7+blwtuD18TeccAW44N361wNaW2JMbH9YsI1k76PT2m+Dy+F
         MCIncwk6L3SRAFzEJ6QT6FIzGHSJ54zTEG6Y8C/68vly8BAk7NMIzFR4h7MVvoJggEBO
         a3NSYmnAsckkpvOL90IEWSeueuB9L0n0ENKCe+KRAsQ7Zss7chJlhLYldoDjiSwoDZ1l
         SU3mVjgx/EY6S4YEr9szZOktYXQMuKGPf2QmJte/u/J2ceQy0v55l+EIDwas6CME1l3m
         pzD1rc2CQ7NnZ4snXul9wTOAysx8Hg2xj30+hpliz0zBnQNyXUQ1TNV3nVAivKl5+8WP
         uxYA==
X-Forwarded-Encrypted: i=1; AJvYcCWKsRt670KR4f+Li51OZH5vqXT3naTGfHETXKLCJb4eRqOD5l3ieha7RcYlFSLQk7Jd3yqz5piBTw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPy3Ruucw70fXnUqokAm1+NLWnfQlJr1grMUGkYr5U0dMi4nuZ
	Jo9FvIM/OctKALDQbzHD7M9K1cPZcA2eURBzWuM1WPg9g9XhyWP06Q0rfaee9fAVI7M=
X-Gm-Gg: AY/fxX5Ncm9DpahYlm2IWojkwt+Ls/owKaCqkdg4hIMtjZnhiCQoVy5cqMoZwigwKch
	F1782JjAq6K9K+EaiShM4LdSVTOlpmZLrGpwsBVBFVDaH4I1gI+YLIOGTB0g7eq7xhp9RvDndjh
	YuZabJJGvjOD/hkIFMaCwsNAAmAkj6D3VGCvzD3TwsFYx+570flBmVBgKDv79MsyKZTkH2Jh19U
	pA25iA8tK7uVapX3pJAbIBHUpTLBMVTCfc8L9EiEIWtUvCk/G4DYS3PYzB/PI/GLkwwaUHUmTK/
	KLFQ5dw/d33SpOBiZcn4Ry+iUswgwQjFPzkYvRDhDHnKAorl2c293C1m0UEjIdr8h5Wq3nLtiBu
	+3EE8EYpgvTdUHRirz0Rg0wdRQzVDPMph88NEmQz+F1ZFs36/gtKJZwkcWGmKivbpPw6ZLru2hq
	ImOr1uJBVf9lAW/eEcyJqALPthV7CgHsA=
X-Google-Smtp-Source: AGHT+IEp3lIqQRQ8F/+xV31qGFYy3RxmeX8QufC32EgJpFKkC8v8rt/OnKylZz/xtgAcQ5aWbSQxCQ==
X-Received: by 2002:a05:6a00:3688:b0:819:bad0:1002 with SMTP id d2e1a72fcca58-81b801ce2e1mr5550278b3a.66.1767875295662;
        Thu, 08 Jan 2026 04:28:15 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40df])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm7656401b3a.16.2026.01.08.04.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:28:15 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 08 Jan 2026 20:26:02 +0800
Subject: [PATCH v3 11/11] riscv: dts: spacemit: add SpacemiT K3 Pico-ITX
 board device tree
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-k3-basic-dt-v3-11-ed99eb4c3ad3@riscstar.com>
References: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
In-Reply-To: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

K3 Pico-ITX is a 2.5-inch single-board computer equipted with a SpacemiT
K3 SoC.

This minimal device tree enables booting into a serial console with UART
output.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: No change.
v2: Add aliases node in this board DT.
    Update the memory node to reflect the hardware truth. Address
     starts at 0x100000000 (4G) boundary.
---
 arch/riscv/boot/dts/spacemit/Makefile        |  1 +
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 38 ++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
index 95889e7269d1bae679b28cd053e1b0a23ae6de68..7e2b877025718113a0e31917eadf7562f488d825 100644
--- a/arch/riscv/boot/dts/spacemit/Makefile
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -4,3 +4,4 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-r2s.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
+dtb-$(CONFIG_ARCH_SPACEMIT) += k3-pico-itx.dtb
diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
new file mode 100644
index 0000000000000000000000000000000000000000..037ce757e5bcae0258a326ea6265185d761f2b52
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2025 SpacemiT (Hangzhou) Technology Co. Ltd
+ * Copyright (c) 2025 Guodong Xu <guodong@riscstar.com>
+ */
+
+#include "k3.dtsi"
+
+/ {
+	model = "SpacemiT K3 Pico-ITX";
+	compatible = "spacemit,k3-pico-itx", "spacemit,k3";
+
+	aliases {
+		serial0 = &uart0;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+		serial5 = &uart5;
+		serial6 = &uart6;
+		serial7 = &uart7;
+		serial8 = &uart8;
+		serial9 = &uart9;
+		serial10 = &uart10;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	memory@100000000 {
+		device_type = "memory";
+		reg = <0x1 0x00000000 0x4 0x00000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};

-- 
2.43.0

