Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0E22DECA0
	for <spacemit@lists.linux.dev>; Mon, 22 Dec 2025 13:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766408915; cv=none; b=WS7EMy5DMiAwpzT9H3hmRPQsH8NZGAO5zMZw9jf6JCz702BpL+wuGxApWIjXjz/G1Dgau5lNPCQe9baAMXTRvDo5dHjrKXWbstvGjJa+KTjLKjRcFsRFuojnmq2HdpXQdEIeofGJmlVbiRpN213TvXiA3mOT1gO1WzOBgJAnzhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766408915; c=relaxed/simple;
	bh=y0u/n4GhUkMm64KTKDu+JkVRtDp/2C+mHEkjHh4e2n4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=neNMI68GyB1GUvIV4efkag8ddQOLQXVqdPGZTjRCdG29cx0YZi7/N3y/SV5jps5Z9sj2+VeuaDl6VAYEkHNQiNyVM+eB6njSnRvNle7D3PYNTTyMvp6ouUFPE4fnQEfblGUPH9jAOEndXSeBH1uv43K2djLbqkp7uit+XGZmiCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=jLiLYwU1; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="jLiLYwU1"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-34c84dc332cso3333254a91.0
        for <spacemit@lists.linux.dev>; Mon, 22 Dec 2025 05:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766408912; x=1767013712; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H3NNkdu6W4j+OsajM718CeKag/bUZ8MyV3pKsgf/AdU=;
        b=jLiLYwU1hZhNhXhfv/0DuxjNt/rxe8AI+UBVbESaO8eBFXtpz+ATxcOKUpjxUQfG0x
         HIQVuEHHGq38CLuxtBZpGvKf0wXlRmtvxFASB/6CedCWluRK2ai1txLUCRkW+zli182n
         O/nfcBV2EU8o2Wp1I4+FGsUWs0MAa9TvTp/OMP2lFw8EIKdGlEOGFQxg+zzJCZe94Zxl
         CqGxYPkp1NijPvKlduRp/cfdjsO3nPS5QwbpQ16zmhET4smKPAMZqksKnNTSjMNqkQjK
         eIggmQBnFIBqXAv8VTDgYFIwU7a+1xovrbQxHx7UpoP5bJyiT/U+8WlcWpYkiR2gTdiF
         0Q8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766408912; x=1767013712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H3NNkdu6W4j+OsajM718CeKag/bUZ8MyV3pKsgf/AdU=;
        b=B6lF4fnecN2L5PA1k1SOK9BqdtSoWDEL+85HhPuO4PZgveg29ljWyTvHe82mCMXnVT
         3KgCiRbFHaxBQV36z2j9HoZSCEHQiXfmnd4OkX2o4kbVvtJ1FCLJRd45m3ymoyWyFpeW
         xCYKxSB/7pELyCZUz0O/AgIhfI19XsAMm83J3cIaO2Ntxqtyw1hHw4OeL0LjGV5JgYll
         M/J/uafJPbHAm9md1kNetnyiK7aMumVpF9/EBryvhQURcUiXjD8KkIIQaN+eU2vsu/yK
         /Y0CWDpZvICzq7lA4Q+TjnwtNxLTLqWZ+xsdCrXxdjxKLVIQ41BrMX6M3Va96VoOIW/6
         JrGg==
X-Forwarded-Encrypted: i=1; AJvYcCV9/oB3z+iTTkz3sme33WyqAU7D4GvGEajotNT9jJIpHW+8eYhYr7Y5G5rj5k2lplZuApGzc1s4Og==@lists.linux.dev
X-Gm-Message-State: AOJu0YwjEzdIjLpQ54lJx3AdX3Ec+XmczEUY2hUok/UJSEk2L43/HhW0
	ezQTUbSa+DMSfYSSK5ll0/n/ibTgmFvBgVOvbl5397Wi+Y99AnWDTXHWG2dWiuHHFEo=
X-Gm-Gg: AY/fxX57yHftvfSwXv3MGNRNcAw2ojdL97qOWXVHwHUhtbd1MXwJqtsvvKoRFgSHaNA
	EEwmlfd+khQenWml1NBzN56HLSw4aiHeGtKfsDi7NqUFdXzez086Z7JsntZzYOdJCbqpZngUD07
	Z+PZOIFmISB3MZoeuV1/fvunM7yKyM8vLeaNG9q3TvnJETM8Ts7tJb87WW9x7jJw+77ul7obIR+
	4r4QugQfDDgXEjKRsWlXZBwbTKQc4c6/yLyoC5yHeJua6mLMfaXi3g9OIhP4FXRJA1e9M3hifDu
	z+hfGMaqYWfavVwABPHJbiU1WewOZWPiOz6+VthoepBfgIYKyFEigTObiOdIqAUIEOA2VFUoeG/
	5nYeKbkTjaBx3+q2+0XuZGEkALOJnH05jmixO+OuslBgnFuSthy5ppYRwks+YVk42gNHOb6JgP8
	iHu65Kalr/KWILrAGM3+Zsh0MDw9bX52w=
X-Google-Smtp-Source: AGHT+IGTluwelitc4CMLbYvdSuKKCxZSnMwz5R/2vl7LNB8SlVL9itdHpoddP8wP/vJwIN4qZM6pWw==
X-Received: by 2002:a17:90b:2e4a:b0:339:eff5:ef26 with SMTP id 98e67ed59e1d1-34e921bc3e0mr8890068a91.30.1766408911680;
        Mon, 22 Dec 2025 05:08:31 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::402f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70c932casm12970405a91.0.2025.12.22.05.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 05:08:31 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 22 Dec 2025 21:04:22 +0800
Subject: [PATCH v2 12/13] riscv: dts: spacemit: add initial device tree of
 SpacemiT K3 SoC
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-k3-basic-dt-v2-12-3af3f3cd0f8a@riscstar.com>
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
In-Reply-To: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
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

SpacemiT K3 is equipped with 8 X100 cores, which are RVA23 compliant.
Add nodes of uarts, timer and interrupt-controllers.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Remove aliases from k3.dtsi, they should be in board DTS.
    Updated riscv,isa-extensions with new extensions from the extensions.yaml
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 548 +++++++++++++++++++++++++++++++++++
 1 file changed, 548 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..ff1371e05ad1809cd823477d9599184f7597ce3b
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -0,0 +1,548 @@
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
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
+					       "sha", "shcounterenw", "shgatpa", "shtvala",
+					       "shvsatpa", "shvstvala", "shvstvecd", "smaia",
+					       "smstateen", "ssaia", "ssccptr", "sscofpmf",
+					       "sscounterenw", "ssnpm", "ssstateen", "sstc",
+					       "sstvala", "sstvecd", "ssu64xl", "supm",
+					       "svade", "svinval", "svnapot", "svpbmt",
+					       "za64rs", "zawrs", "zba", "zbb", "zbc", "zbs",
+					       "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
+					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
+					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
+					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
+					       "zvkned", "zvkng", "zvknha", "zvknhb", "zvks",
+					       "zvksc", "zvksed", "zvksg", "zvksh", "zvkt";
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
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
+					       "sha", "shcounterenw", "shgatpa", "shtvala",
+					       "shvsatpa", "shvstvala", "shvstvecd", "smaia",
+					       "smstateen", "ssaia", "ssccptr", "sscofpmf",
+					       "sscounterenw", "ssnpm", "ssstateen", "sstc",
+					       "sstvala", "sstvecd", "ssu64xl", "supm",
+					       "svade", "svinval", "svnapot", "svpbmt",
+					       "za64rs", "zawrs", "zba", "zbb", "zbc", "zbs",
+					       "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
+					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
+					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
+					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
+					       "zvkned", "zvkng", "zvknha", "zvknhb", "zvks",
+					       "zvksc", "zvksed", "zvksg", "zvksh", "zvkt";
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
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
+					       "sha", "shcounterenw", "shgatpa", "shtvala",
+					       "shvsatpa", "shvstvala", "shvstvecd", "smaia",
+					       "smstateen", "ssaia", "ssccptr", "sscofpmf",
+					       "sscounterenw", "ssnpm", "ssstateen", "sstc",
+					       "sstvala", "sstvecd", "ssu64xl", "supm",
+					       "svade", "svinval", "svnapot", "svpbmt",
+					       "za64rs", "zawrs", "zba", "zbb", "zbc", "zbs",
+					       "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
+					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
+					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
+					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
+					       "zvkned", "zvkng", "zvknha", "zvknhb", "zvks",
+					       "zvksc", "zvksed", "zvksg", "zvksh", "zvkt";
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
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
+					       "sha", "shcounterenw", "shgatpa", "shtvala",
+					       "shvsatpa", "shvstvala", "shvstvecd", "smaia",
+					       "smstateen", "ssaia", "ssccptr", "sscofpmf",
+					       "sscounterenw", "ssnpm", "ssstateen", "sstc",
+					       "sstvala", "sstvecd", "ssu64xl", "supm",
+					       "svade", "svinval", "svnapot", "svpbmt",
+					       "za64rs", "zawrs", "zba", "zbb", "zbc", "zbs",
+					       "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
+					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
+					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
+					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
+					       "zvkned", "zvkng", "zvknha", "zvknhb", "zvks",
+					       "zvksc", "zvksed", "zvksg", "zvksh", "zvkt";
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
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
+					       "sha", "shcounterenw", "shgatpa", "shtvala",
+					       "shvsatpa", "shvstvala", "shvstvecd", "smaia",
+					       "smstateen", "ssaia", "ssccptr", "sscofpmf",
+					       "sscounterenw", "ssnpm", "ssstateen", "sstc",
+					       "sstvala", "sstvecd", "ssu64xl", "supm",
+					       "svade", "svinval", "svnapot", "svpbmt",
+					       "za64rs", "zawrs", "zba", "zbb", "zbc", "zbs",
+					       "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
+					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
+					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
+					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
+					       "zvkned", "zvkng", "zvknha", "zvknhb", "zvks",
+					       "zvksc", "zvksed", "zvksg", "zvksh", "zvkt";
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
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
+					       "sha", "shcounterenw", "shgatpa", "shtvala",
+					       "shvsatpa", "shvstvala", "shvstvecd", "smaia",
+					       "smstateen", "ssaia", "ssccptr", "sscofpmf",
+					       "sscounterenw", "ssnpm", "ssstateen", "sstc",
+					       "sstvala", "sstvecd", "ssu64xl", "supm",
+					       "svade", "svinval", "svnapot", "svpbmt",
+					       "za64rs", "zawrs", "zba", "zbb", "zbc", "zbs",
+					       "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
+					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
+					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
+					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
+					       "zvkned", "zvkng", "zvknha", "zvknhb", "zvks",
+					       "zvksc", "zvksed", "zvksg", "zvksh", "zvkt";
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
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
+					       "sha", "shcounterenw", "shgatpa", "shtvala",
+					       "shvsatpa", "shvstvala", "shvstvecd", "smaia",
+					       "smstateen", "ssaia", "ssccptr", "sscofpmf",
+					       "sscounterenw", "ssnpm", "ssstateen", "sstc",
+					       "sstvala", "sstvecd", "ssu64xl", "supm",
+					       "svade", "svinval", "svnapot", "svpbmt",
+					       "za64rs", "zawrs", "zba", "zbb", "zbc", "zbs",
+					       "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
+					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
+					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
+					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
+					       "zvkned", "zvkng", "zvknha", "zvknhb", "zvks",
+					       "zvksc", "zvksed", "zvksg", "zvksh", "zvkt";
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
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
+					       "sha", "shcounterenw", "shgatpa", "shtvala",
+					       "shvsatpa", "shvstvala", "shvstvecd", "smaia",
+					       "smstateen", "ssaia", "ssccptr", "sscofpmf",
+					       "sscounterenw", "ssnpm", "ssstateen", "sstc",
+					       "sstvala", "sstvecd", "ssu64xl", "supm",
+					       "svade", "svinval", "svnapot", "svpbmt",
+					       "za64rs", "zawrs", "zba", "zbb", "zbc", "zbs",
+					       "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
+					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
+					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
+					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
+					       "zvkned", "zvkng", "zvknha", "zvknhb", "zvks",
+					       "zvksc", "zvksed", "zvksg", "zvksh", "zvkt";
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

