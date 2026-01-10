Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC1D338F5E
	for <spacemit@lists.linux.dev>; Sat, 10 Jan 2026 05:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768022451; cv=none; b=CSoYDFNRhdcblrZxUVyEq1iIzEQQbGSL9b5M9pY6yQERli/712NZvNUWOHvEWZm/QlGpNtjJ4dbvUQ7cofZvjiC6XJXlYhHPrxbSNUEWh9Z0Ctnu2h6ZLA+7nw0rFFzVryYXrjhDvZaGIdpmHPT3ZZMY3LqqGTEzwMKoPo/lU3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768022451; c=relaxed/simple;
	bh=RpX/YUsP57yYRCsMuPjhWD/AM3yMIl5MNE+TunhwMLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t2XquA3btus1Asx0BX2rAMuEamF9uGcUQ4s7Rc9U4nEi2keDepK4wMqDCeQlzM2sKrejn+g7BB/rlbyEyAO2wp1gC+9Sq69I+jLaVXN/G/VlyGsDwtl6FKaqpIf4iJPF3HG31tMK99YbF700dM2UxV6iih0GbCQEd8EXcWu/nOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=hWbwc1Y1; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="hWbwc1Y1"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a0d52768ccso34090915ad.1
        for <spacemit@lists.linux.dev>; Fri, 09 Jan 2026 21:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768022449; x=1768627249; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31DgMKkz4Cjgbg70+PADLl7ySardk8pduReCpk77D9U=;
        b=hWbwc1Y1F+docYZB3KM9F+GwgK4rPNJS5+0Menv5OZg0UHHhIKdnUIa7LINfg0Q7JC
         3N2fdIt5XRa3o0qGKjJfsmwsbyPUVilia2mUG5HaVXzzQpAy0HB5aiDcdSWcPCVm7CoY
         yey2eGIgAfTbgKuRWeXOC3uPRE+1Ijfi1Vi+hrQ0VeAHPCLrY2yl3ocNJ6iuq2W0kfNh
         2sHF9GatMtNPIsx7kgpH+g6MFk12K9gB6sD/Kive7RXQpjcjTCxvIWMMNi1uLk+1yscj
         mWhWOSooRuYeS3NneUnUQueaqgSZh5M5od2oeeShF6vpyFmM4OTYeKaXvwMPbPqtdf66
         BjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768022449; x=1768627249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=31DgMKkz4Cjgbg70+PADLl7ySardk8pduReCpk77D9U=;
        b=Cv6/I1c6OyOPwzUTlPSpZdGTj4HawE4S7j1J/DqzDj4MgYh/0LR+QdXGJbsnNOwr5g
         4HKKXMOXupIgdpFK+l0MymOD32jOGG5nMbEg1uFurq9zk1qfl1Zjqk+PY9XZw12CzWCx
         lKIFz5JQiYasOf3HTReWyCfyrguhOLVaZIDBKxb8ZzDolKoXmteAVAL2oCvPxl7iH3gT
         8+44thjC4iFXY25AM+aSF/4aHva5LTS7v0t/oajpyG1pj3dZ1KiiEka4PuW4dtmPykFO
         b1RyCKkvzBii8w195MC+r7mTjK1t8qY9UKK0RfgWhMAYF6hpP4wYZJuTNo2h8EWm6T/B
         OkyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKOVXLjhyOX+H9/d2jn1li49t7QRsF5b1N8NhUf4At7nD6FM9Vz41+Zvb0qpLP/QuApasEGiqe5A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyew2xQi64BfiHjxGfJ4yHkhNAazF7d8n/kuljfvpogr97mqPKd
	/QOyUysriEOPw9YEDXoo6uPl7BPtj2TwZLs7FlOaUy5ObUI0Qqq0Fzq9bH7ZKbq6cSw=
X-Gm-Gg: AY/fxX6jbNR0xcLwlYWV+Yt2fUDlCPEBP0j7lWvAcCp3g815TXjC7Fm2ZCfHtVSFchV
	80T0RxbrzAmFopHMyjqfnSLkzQ0yiVQGkWUwdxH7+4aUXZgZ5y7OkY8B8O4arjOkI13xM0Y6OHG
	70QvM6ZNgEWsOujqdYeBctIcEmaQIP/DpZXIyoy12XB1MkPjcITxEgLG4tlxumWgBu5KOGsL3iH
	2UtdUnpje+FNrbRxkHJB44m4qLedlmnRWjwt0lupN6d8Slnpucaoec+dO8BHb5i6u30MxJ10zWG
	YdzMAJ/PtNHYP3iugCYkxoqo5Ay/EbcnTqBheyQPz3J3sYAFV/uaTy41LPThf/XYbmaNFesHC2z
	1GW2FN8pdCNggGhipsATp8WBQIHbl4NR61lGlcigmIKeOJIpkQTW0+cNnuj6+Avlx36IWfdb3XW
	x6saQSSzr2vLs5bnvcJSCvhJAAUEXu4haTBiCKkzJeBxPLNwmg+SEH+Q==
X-Google-Smtp-Source: AGHT+IHYGojnyw/X9+Sa4CxlCr/3Vn3pURVbolq+Xy03kMkgcsYibAap3C0WizH8w95DkH1bsHgxGQ==
X-Received: by 2002:a17:903:2309:b0:2a0:d46d:f990 with SMTP id d9443c01a7336-2a3ee4e81c6mr120164655ad.31.1768022448640;
        Fri, 09 Jan 2026 21:20:48 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88cdsm118208265ad.73.2026.01.09.21.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 21:20:48 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 10 Jan 2026 13:18:23 +0800
Subject: [PATCH v4 11/11] riscv: dts: spacemit: add SpacemiT K3 Pico-ITX
 board device tree
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-k3-basic-dt-v4-11-d492f3a30ffa@riscstar.com>
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
In-Reply-To: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
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
X-Mailer: b4 0.14.3

K3 Pico-ITX is a 2.5-inch single-board computer equipted with a SpacemiT
K3 SoC.

This minimal device tree enables booting into a serial console with UART
output.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v4: No change.
v3: No change.
v2: Add aliases node in this board DT.
    Update the memory node to reflect the hardware truth. Address
     starts at 0x100000000 (4G) boundary.
---
 arch/riscv/boot/dts/spacemit/Makefile        |  1 +
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 38 ++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
index 95889e7269d1..7e2b87702571 100644
--- a/arch/riscv/boot/dts/spacemit/Makefile
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -4,3 +4,4 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-r2s.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
+dtb-$(CONFIG_ARCH_SPACEMIT) += k3-pico-itx.dtb
diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
new file mode 100644
index 000000000000..037ce757e5bc
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

