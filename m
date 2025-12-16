Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6003DAC02
	for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 13:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765892059; cv=none; b=SWL8/EAl/NSPzY4zcEw6vTyw0KuW4QfpQ5eBvt9TzJPaOMAMK+nQAL9DOCtzG4s1CAjI/WUy5ERTDKSourTY/qL+2549aSx+1OnojTt3zYzPDbauwrIi4ZicQKDsg5rw0dmL5zgxHlnoN9A1+0MsFXO614bXt56fVRuGZC+qIgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765892059; c=relaxed/simple;
	bh=nYqDa0MT2EF7ddsZiIeHAdn1cpNK+emDKQZ73kLQ9w0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oj5xzvDFZVCZBBgaja5i0Khgr9aOXbH/8uEcOGpT56pY8A6iGcViDbRKcILh5/iRpDC/8oRr/AVn3vX8rexBTmel/4vX5dTcPgljB3OkrCpPuILPHTOYFMOWUQbJmiDSnBd4VZUoUJZqh16X0nVmTccHnvArc9iKia2DOXYPmXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=zFaeNcm2; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="zFaeNcm2"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a0a33d0585so27258325ad.1
        for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 05:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765892056; x=1766496856; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+qQ3eHhisvmtOWqdlBLmEdp33CsXRSkulBff6gjbNnc=;
        b=zFaeNcm2MouhQtuJiacdEr2SyPocnDYtE8c0sdnbRxLvnUjLlytPklb4WTNcEyWe/s
         1azdOC78x88aVv7IOocmzUme4oqV4MBJodlHC4bDIvWSyYFcYRn/DZ85HhVDWJnQP7eb
         W3BWpUmS0Dd+Bj837mDtGnzo1QYbsFGKKby1W+3lxXQrZ+QlPwGZacUcOC90Ju2M69bB
         4p6qSe4GqYGPcsdOX3fwUEJT3UsajeKwOe7coUiCV+UTYcT2wEuTT6DYxTn0ijMzU1oK
         ONXj5HlqLePzrGHA/iCUIGQJcjg4ZkjBAD5d4n8BWqvKjD4sUgqDciSEoiDrEK9NzrVY
         pwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765892056; x=1766496856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+qQ3eHhisvmtOWqdlBLmEdp33CsXRSkulBff6gjbNnc=;
        b=LB8Arm9TeohaO0oj7W7NQNJVdOnFq8iUsNcVTBGsnhOZzpoj2UjrxaMg1mzJrxaJ+t
         a1KGi2P79Re2EqXFlqt/MyBPFUdmDoXKJ0GRzRK9a2BqcR5vHRcn24DGh6lq5EA/LszF
         PIs8mfRefgsF7PNn5rHMiXTfBU463PFKi/5icL2wByJ1hgkG5ECqiErE6+GmPGbUU/X6
         fl84e/t5RRmlS7KkYk1uoSMUqEsel0xdrkEgLq/ImuUOC6LQNtAHgNKsMAFXICy8LNiU
         8ryysifSi2AXwcOmzgzG0TA4fyJqBoAYmBa7NqosIdamd1jU1/XDif3JcbXVffziEsq/
         VHWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdkYoNalIK0BOjmuXk+tK4kI2nCiNHy2Cv4eNDkwS+i0oTplOrT1giQdmNCptLh3tkahIXuBi/fw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwEgR/5IsgpAxKw7B1TDllFFA9vJ9uIJ/RmFIEcXm9FJl0X6MaB
	vuw23FHPJ+FpAente5Pf7Du7EdkBx0x4aAy9IqlwfSf2GopSJX1Y7CXLezCucJRoP40=
X-Gm-Gg: AY/fxX7IJn849UWbgFi5EFnzGRBP0mzTbB23WDZB9n9qj8rtrjnccz2KkTLzKyZfPRo
	pR7NvM/b1y6sCdq4u1ZcHuwEdAx++9F9bsKO2ICDFQCUDeNuJbIv24DQEm6UMeE+zDcxCqYzgb0
	GhZEv/jmo7Zb3cGOo64nS1WmBNVzHSLwFNN0mSaXKOqMPULxxOUyu2LEEViqGNBcpzVNUSwLzP1
	rMLp6/JiYjyhOHujcV1W2M+kZP4hbhUgoRFiJH11fmmDPQ+gQ8eTyBGbboZKJFS6cyqQGfSWN8T
	Px9UeR7lsnDNs1yr3UHr76nRoXYYVgOuzcFelRIu58b4IJ6kohSHZYCvhgzLAiOTeiCd6Y3wiVT
	P1biGK3wVRtLhsB9jelCJ5hxeUiv4fa8dtwk0DjdGzKh3SJAcsAEeXYzu+Dk924t9BnFs8c+vns
	N8fs29DUFtzisE8IU+2PZYRlj5VZFAnlOYRY+YvIxhfg==
X-Google-Smtp-Source: AGHT+IEeOBOd3s5RHNSYePxmYi+3w5U0r2lvSZOjKCgBznCRlzMR+LVjww93EvvVn9vTLNkucmTX5A==
X-Received: by 2002:a17:903:4b27:b0:295:ceaf:8d76 with SMTP id d9443c01a7336-29f2435b8d6mr145169125ad.47.1765892056026;
        Tue, 16 Dec 2025 05:34:16 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4029])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a14625add8sm15829525ad.61.2025.12.16.05.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 05:34:15 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 16 Dec 2025 21:32:31 +0800
Subject: [PATCH 7/8] riscv: dts: spacemit: add initial device tree of
 SpacemiT K3 SoC
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-k3-basic-dt-v1-7-a0d256c9dc92@riscstar.com>
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
In-Reply-To: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
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
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

SpacemiT K3 is equipped with 8 X100 cores, which are RVA23 compliant.
Add nodes of uarts, timer and interrupt-controllers.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 529 +++++++++++++++++++++++++++++++++++
 1 file changed, 529 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..cb27b790716fdd6dc2bc89c28dd2588a596a5af9
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -0,0 +1,529 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2025 SpacemiT (Hangzhou) Technology Co. Ltd
+ * Copyright (c) 2025 Guodong Xu <guodong@riscstar.com>
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/dts-v1/;
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	model = "SpacemiT K3";
+	compatible = "spacemit,k3";
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
+	cpus: cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <24000000>;
+
+		cpu_0: cpu@0 {
+			compatible = "spacemit,x100", "riscv";
+			device_type = "cpu";
+			reg = <0>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "h",
+					       "smaia", "smstateen", "ssaia", "sscofpmf",
+					       "ssnpm", "sstc", "svade", "svinval", "svnapot",
+					       "svpbmt", "zawrs", "zba", "zbb", "zbc", "zbs",
+					       "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
+					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond", "zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm", "zimop",
+					       "zkt", "zvbb", "zvbc", "zvfbfmin", "zvfbfwma",
+					       "zvfh", "zvfhmin", "zvkb", "zvkg", "zvkn",
+					       "zvknc", "zvkned", "zvkng", "zvknha",
+					       "zvknhb", "zvks", "zvksc", "zvksed",
+					       "zvksg", "zvksh", "zvkt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <256>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2_cache0>;
+			mmu-type = "riscv,sv39";
+
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu_1: cpu@1 {
+			compatible = "spacemit,x100", "riscv";
+			device_type = "cpu";
+			reg = <1>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "h",
+					       "smaia", "smstateen", "ssaia", "sscofpmf",
+					       "ssnpm", "sstc", "svade", "svinval", "svnapot",
+					       "svpbmt", "zawrs", "zba", "zbb", "zbc", "zbs",
+					       "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
+					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond", "zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm", "zimop",
+					       "zkt", "zvbb", "zvbc", "zvfbfmin", "zvfbfwma",
+					       "zvfh", "zvfhmin", "zvkb", "zvkg", "zvkn",
+					       "zvknc", "zvkned", "zvkng", "zvknha",
+					       "zvknhb", "zvks", "zvksc", "zvksed",
+					       "zvksg", "zvksh", "zvkt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <256>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2_cache0>;
+			mmu-type = "riscv,sv39";
+
+			cpu1_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu_2: cpu@2 {
+			compatible = "spacemit,x100", "riscv";
+			device_type = "cpu";
+			reg = <2>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "h",
+					       "smaia", "smstateen", "ssaia", "sscofpmf",
+					       "ssnpm", "sstc", "svade", "svinval", "svnapot",
+					       "svpbmt", "zawrs", "zba", "zbb", "zbc", "zbs",
+					       "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
+					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond", "zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm", "zimop",
+					       "zkt", "zvbb", "zvbc", "zvfbfmin", "zvfbfwma",
+					       "zvfh", "zvfhmin", "zvkb", "zvkg", "zvkn",
+					       "zvknc", "zvkned", "zvkng", "zvknha",
+					       "zvknhb", "zvks", "zvksc", "zvksed",
+					       "zvksg", "zvksh", "zvkt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <256>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2_cache0>;
+			mmu-type = "riscv,sv39";
+
+			cpu2_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu_3: cpu@3 {
+			compatible = "spacemit,x100", "riscv";
+			device_type = "cpu";
+			reg = <3>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "h",
+					       "smaia", "smstateen", "ssaia", "sscofpmf",
+					       "ssnpm", "sstc", "svade", "svinval", "svnapot",
+					       "svpbmt", "zawrs", "zba", "zbb", "zbc", "zbs",
+					       "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
+					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond", "zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm", "zimop",
+					       "zkt", "zvbb", "zvbc", "zvfbfmin", "zvfbfwma",
+					       "zvfh", "zvfhmin", "zvkb", "zvkg", "zvkn",
+					       "zvknc", "zvkned", "zvkng", "zvknha",
+					       "zvknhb", "zvks", "zvksc", "zvksed",
+					       "zvksg", "zvksh", "zvkt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <256>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2_cache0>;
+			mmu-type = "riscv,sv39";
+
+			cpu3_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu_4: cpu@4 {
+			compatible = "spacemit,x100", "riscv";
+			device_type = "cpu";
+			reg = <4>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "h",
+					       "smaia", "smstateen", "ssaia", "sscofpmf",
+					       "ssnpm", "sstc", "svade", "svinval", "svnapot",
+					       "svpbmt", "zawrs", "zba", "zbb", "zbc", "zbs",
+					       "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
+					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond", "zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm", "zimop",
+					       "zkt", "zvbb", "zvbc", "zvfbfmin", "zvfbfwma",
+					       "zvfh", "zvfhmin", "zvkb", "zvkg", "zvkn",
+					       "zvknc", "zvkned", "zvkng", "zvknha",
+					       "zvknhb", "zvks", "zvksc", "zvksed",
+					       "zvksg", "zvksh", "zvkt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <256>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2_cache1>;
+			mmu-type = "riscv,sv39";
+
+			cpu4_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu_5: cpu@5 {
+			compatible = "spacemit,x100", "riscv";
+			device_type = "cpu";
+			reg = <5>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "h",
+					       "smaia", "smstateen", "ssaia", "sscofpmf",
+					       "ssnpm", "sstc", "svade", "svinval", "svnapot",
+					       "svpbmt", "zawrs", "zba", "zbb", "zbc", "zbs",
+					       "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
+					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond", "zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm", "zimop",
+					       "zkt", "zvbb", "zvbc", "zvfbfmin", "zvfbfwma",
+					       "zvfh", "zvfhmin", "zvkb", "zvkg", "zvkn",
+					       "zvknc", "zvkned", "zvkng", "zvknha",
+					       "zvknhb", "zvks", "zvksc", "zvksed",
+					       "zvksg", "zvksh", "zvkt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <256>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2_cache1>;
+			mmu-type = "riscv,sv39";
+
+			cpu5_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu_6: cpu@6 {
+			compatible = "spacemit,x100", "riscv";
+			device_type = "cpu";
+			reg = <6>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "h",
+					       "smaia", "smstateen", "ssaia", "sscofpmf",
+					       "ssnpm", "sstc", "svade", "svinval", "svnapot",
+					       "svpbmt", "zawrs", "zba", "zbb", "zbc", "zbs",
+					       "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
+					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond", "zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm", "zimop",
+					       "zkt", "zvbb", "zvbc", "zvfbfmin", "zvfbfwma",
+					       "zvfh", "zvfhmin", "zvkb", "zvkg", "zvkn",
+					       "zvknc", "zvkned", "zvkng", "zvknha",
+					       "zvknhb", "zvks", "zvksc", "zvksed",
+					       "zvksg", "zvksh", "zvkt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <256>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2_cache1>;
+			mmu-type = "riscv,sv39";
+
+			cpu6_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu_7: cpu@7 {
+			compatible = "spacemit,x100", "riscv";
+			device_type = "cpu";
+			reg = <7>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "h",
+					       "smaia", "smstateen", "ssaia", "sscofpmf",
+					       "ssnpm", "sstc", "svade", "svinval", "svnapot",
+					       "svpbmt", "zawrs", "zba", "zbb", "zbc", "zbs",
+					       "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
+					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond", "zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm", "zimop",
+					       "zkt", "zvbb", "zvbc", "zvfbfmin", "zvfbfwma",
+					       "zvfh", "zvfhmin", "zvkb", "zvkg", "zvkn",
+					       "zvknc", "zvkned", "zvkng", "zvknha",
+					       "zvknhb", "zvks", "zvksc", "zvksed",
+					       "zvksg", "zvksh", "zvkt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <256>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2_cache1>;
+			mmu-type = "riscv,sv39";
+
+			cpu7_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		l2_cache0: cache-controller-0 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <4194304>;
+			cache-sets = <4096>;
+			cache-unified;
+		};
+
+		l2_cache1: cache-controller-1 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <4194304>;
+			cache-sets = <4096>;
+			cache-unified;
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu_0>;
+				};
+				core1 {
+					cpu = <&cpu_1>;
+				};
+				core2 {
+					cpu = <&cpu_2>;
+				};
+				core3 {
+					cpu = <&cpu_3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&cpu_4>;
+				};
+				core1 {
+					cpu = <&cpu_5>;
+				};
+				core2 {
+					cpu = <&cpu_6>;
+				};
+				core3 {
+					cpu = <&cpu_7>;
+				};
+			};
+		};
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		interrupt-parent = <&saplic>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		dma-noncoherent;
+		ranges;
+
+		uart0: serial@d4017000 {
+			compatible = "spacemit,k3-uart", "intel,xscale-uart";
+			reg = <0x0 0xd4017000 0x0 0x100>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clock-frequency = <14700000>;
+			interrupts = <42 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart2: serial@d4017100 {
+			compatible = "spacemit,k3-uart", "intel,xscale-uart";
+			reg = <0x0 0xd4017100 0x0 0x100>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clock-frequency = <14700000>;
+			interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart3: serial@d4017200 {
+			compatible = "spacemit,k3-uart", "intel,xscale-uart";
+			reg = <0x0 0xd4017200 0x0 0x100>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clock-frequency = <14700000>;
+			interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart4: serial@d4017300 {
+			compatible = "spacemit,k3-uart", "intel,xscale-uart";
+			reg = <0x0 0xd4017300 0x0 0x100>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clock-frequency = <14700000>;
+			interrupts = <46 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart5: serial@d4017400 {
+			compatible = "spacemit,k3-uart", "intel,xscale-uart";
+			reg = <0x0 0xd4017400 0x0 0x100>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clock-frequency = <14700000>;
+			interrupts = <47 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart6: serial@d4017500 {
+			compatible = "spacemit,k3-uart", "intel,xscale-uart";
+			reg = <0x0 0xd4017500 0x0 0x100>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clock-frequency = <14700000>;
+			interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart7: serial@d4017600 {
+			compatible = "spacemit,k3-uart", "intel,xscale-uart";
+			reg = <0x0 0xd4017600 0x0 0x100>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clock-frequency = <14700000>;
+			interrupts = <49 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart8: serial@d4017700 {
+			compatible = "spacemit,k3-uart", "intel,xscale-uart";
+			reg = <0x0 0xd4017700 0x0 0x100>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clock-frequency = <14700000>;
+			interrupts = <50 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart9: serial@d4017800 {
+			compatible = "spacemit,k3-uart", "intel,xscale-uart";
+			reg = <0x0 0xd4017800 0x0 0x100>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clock-frequency = <14700000>;
+			interrupts = <51 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart10: serial@d401f000 {
+			compatible = "spacemit,k3-uart", "intel,xscale-uart";
+			reg = <0x0 0xd401f000 0x0 0x100>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clock-frequency = <14700000>;
+			interrupts = <281 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		simsic: interrupt-controller@e0400000 {
+			compatible = "spacemit,k3-imsics","riscv,imsics";
+			reg = <0x0 0xe0400000 0x0 0x00200000>;
+			interrupt-controller;
+			#interrupt-cells = <0>;
+			msi-controller;
+			#msi-cells = <0>;
+			interrupts-extended = <&cpu0_intc 9>, <&cpu1_intc 9>,
+					      <&cpu2_intc 9>, <&cpu3_intc 9>,
+					      <&cpu4_intc 9>, <&cpu5_intc 9>,
+					      <&cpu6_intc 9>, <&cpu7_intc 9>;
+			riscv,num-ids = <511>;
+			riscv,num-guest-ids = <511>;
+			riscv,hart-index-bits = <4>;
+			riscv,guest-index-bits = <6>;
+		};
+
+		saplic: interrupt-controller@e0804000 {
+			compatible = "spacemit,k3-aplic", "riscv,aplic";
+			reg = <0x0 0xe0804000 0x0 0x4000>;
+			msi-parent = <&simsic>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			riscv,num-sources = <512>;
+		};
+
+		clint: timer@e081c000 {
+			compatible = "spacemit,k3-clint", "sifive,clint0";
+			reg = <0x0 0xe081c000 0x0 0x0004000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
+					      <&cpu1_intc 3>, <&cpu1_intc 7>,
+					      <&cpu2_intc 3>, <&cpu2_intc 7>,
+					      <&cpu3_intc 3>, <&cpu3_intc 7>,
+					      <&cpu4_intc 3>, <&cpu4_intc 7>,
+					      <&cpu5_intc 3>, <&cpu5_intc 7>,
+					      <&cpu6_intc 3>, <&cpu6_intc 7>,
+					      <&cpu7_intc 3>, <&cpu7_intc 7>;
+		};
+	};
+};

-- 
2.43.0

