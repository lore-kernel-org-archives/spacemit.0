Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B175030C60E
	for <spacemit@lists.linux.dev>; Thu, 15 Jan 2026 06:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768459993; cv=none; b=KgDNX6/qBiyHqCJL9VbJ1nWDfNxWpBhAEiCd87fLgPZfsPJsknPUQqS5I4ci2sJuL7pU0A24OY2peuE1ayYybUBH3032G5nN+PrbbghjlbvILHKPNfmzSHbTzEf25FFFV+P/ahI6FxTAQAR14TvThZEARU6QzeKAK9Ae3wRYCqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768459993; c=relaxed/simple;
	bh=5lCeB1GcOdaoaYHi6D3PIElhAfVcfqWRdp3ECXG9b5Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I0tzIrNgrjOR4PqHvi0xusjaCHENkGgeq/k3ppBXP6bDZ5gWBLlsCf7563yTHBChHJ3QvBN+gZYLOnwAYd9mtaAeASAZxKe24raXDJNYK042FXgnfH5jwpKEmZV+AFWy3FJ8/z4qvy5v5TxYDidqbMN75l4G8MI6oRPpyaZl0n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=uifdiJkT; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="uifdiJkT"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a3e76d0f64so8527205ad.1
        for <spacemit@lists.linux.dev>; Wed, 14 Jan 2026 22:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768459984; x=1769064784; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W0QPsLpzttolEq4AeXwl+YsKAr2ldWZ+dcPCydx1TA8=;
        b=uifdiJkTuXIV/MY/64d0+tOukNoaBm0++ZDVQQhYQBsSdXKyhYcRUBMVOD7C6SRcwP
         BR1/3LpZ/bByHzVr2z+t7fMZ6wB2xnaL8WE+/1n0XYmPu5WmSdMqgTc9ICJkLblRt7t0
         NonhyfmQygvMAY3TbeFyc1WDuX3TgkNK6ClfHC4o3pN9SLcFROnCTOWa+tAAS30z8BL4
         wmdhQqI5N4JDfQ2fjnugjtEO48vqzFtb/UOIyWmZAhoOBJbqAv0Nsq3l1RrkC7AsQR8L
         +GiciVHmJysNEmrxjBuzWqUZDXhKJraUUBdoHYHphhLS2b+ZGgYXM+CizYbrEXohVRwZ
         f7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459984; x=1769064784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W0QPsLpzttolEq4AeXwl+YsKAr2ldWZ+dcPCydx1TA8=;
        b=mKfpdqp3Q15o5UVGaCTn56xfoq1tzXEvaWPmMrUj6R5Oe36rzWP68Nu87NSeWEu6hr
         UTbFtiekDW801dWPit7nw/w9j+nESVGAISs22GU/8Ue4D3sYIrYnelSeaTZBsUCdoOMw
         x5mZmX+8aSyLStkQCfIp2kznZv0yCeuCkAM9lSV0d9Rwnq3z1HB9IoO53q1Elrp2nZor
         EnxUkw8ge0XWAX4mqCXftFEaWODJ6iD2YN33JBYP25101HqgCFiznCYeZ0AXMXq5ZVPv
         WWTZb1xLyh+u9tAY8f4P7yTUv/QUHfnt6hzRwsn3ZFo+O/RhU/UIV3XAhpGnmQvSmC4G
         CSRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqBale79AT6ERF8vTjemjCr0ZkqiXfK0HU5qci/OUbxlLeudfUx700C9fwsaY+N27sGgtwRtUXUg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyN67vIA5I6GSc1Et8s5f6uv6vvsIH4Twuxs2UE4yqF58YAG1lh
	WJiMs4pqDa63OlG0vD5iywYaaVV3MqGEDL/h8GBNXCWRMKV0IC5/B3oZ4zbTBYVDceE=
X-Gm-Gg: AY/fxX4JDxsgKhyPd4CdH6hir1j8jZ3GvCBo42o8mJv0oim0lpFQ5ef6fe3in5u9emG
	XLRZoeUOuWgOZ78WfgB3mEFC5rWUzotiyBeQ5P62kHd/6nxY3FQ8qUpg9lLGVIZCOqAXED9plRA
	hZcq7oui1A9PbDLvNmOazgEjUyzqKtJSh0ucVv8HIb2suZQ1nvyGrAFZ4AsunYQeQ9gwUUJd9Z4
	+zgHkWSWWuRgqOHpbExbOHA5Gtj4MmhRkUShmmxOmZtPLoKz8JYK6iTsMo2fyXu4VE80jvtWfWo
	OfH470lk29Vhm6kkGBP4vxrfgl61TnpVZeO6Bek1YB4ocTMcH1YL3J8yISL/4vITAVZU1g0icbi
	ZUtO3QHi+AZEuhngrd9jO7cl2hJZ1X3Jq7Hyt5QAXhFOgEW46N46rPfZp5mBUXIKKgTW4Jer5Ob
	/TQYU9J38L3DQXI5Ftwi7uAnAYjbtEEjuYXEVvZgtCJktdVhFxaomxd8g+DHrCunuU
X-Received: by 2002:a17:903:2341:b0:2a1:3ad6:fab3 with SMTP id d9443c01a7336-2a700978ecbmr18482855ad.1.1768459984404;
        Wed, 14 Jan 2026 22:53:04 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e7a3c6fdsm235081015ad.15.2026.01.14.22.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:53:04 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 15 Jan 2026 14:51:45 +0800
Subject: [PATCH v5 6/7] riscv: dts: spacemit: add initial support for K3
 SoC
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-k3-basic-dt-v5-6-6990ac9f4308@riscstar.com>
References: <20260115-k3-basic-dt-v5-0-6990ac9f4308@riscstar.com>
In-Reply-To: <20260115-k3-basic-dt-v5-0-6990ac9f4308@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>, Thomas Gleixner <tglx@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3

SpacemiT K3 is equipped with 8 X100 cores, which are RVA23 compliant.
Add nodes of uarts, timer and interrupt-controllers. Also add M-mode
APLIC (maplic) and IMSIC (mimsic) nodes to represent the hardware
topology and ready for potential firmware usage.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v5: Update the copyright year to 2026.
    Set M-mode maplic and mimsic status to "reserved".
    Update the commit message per Yixun's suggestion.
    In maplic node, use riscv,delegation to match kernel binding. OpenSBI
     accepts both delegate and delegation, but the binding documents only
     riscv,delegation.
v4: Fix missing blank space after commas in compatible string.
    Add m-mode imsic and aplic node.
    Reorder properties in simsic, saplic, mimsic, and maplic nodes
     to match DTS coding style.
v3: Remove "supm" from the riscv,isa-extensions list.
v2: Remove aliases from k3.dtsi, they should be in board DTS.
    Updated riscv,isa-extensions with new extensions from the extensions.yaml.
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 590 +++++++++++++++++++++++++++++++++++
 1 file changed, 590 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
new file mode 100644
index 000000000000..53425badfea9
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -0,0 +1,590 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2026 SpacemiT (Hangzhou) Technology Co. Ltd
+ * Copyright (c) 2026 Guodong Xu <guodong@riscstar.com>
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
+					       "sstvala", "sstvecd", "ssu64xl", "svade",
+					       "svinval", "svnapot", "svpbmt", "za64rs",
+					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
+					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
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
+					       "sstvala", "sstvecd", "ssu64xl", "svade",
+					       "svinval", "svnapot", "svpbmt", "za64rs",
+					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
+					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
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
+					       "sstvala", "sstvecd", "ssu64xl", "svade",
+					       "svinval", "svnapot", "svpbmt", "za64rs",
+					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
+					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
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
+					       "sstvala", "sstvecd", "ssu64xl", "svade",
+					       "svinval", "svnapot", "svpbmt", "za64rs",
+					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
+					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
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
+					       "sstvala", "sstvecd", "ssu64xl", "svade",
+					       "svinval", "svnapot", "svpbmt", "za64rs",
+					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
+					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
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
+					       "sstvala", "sstvecd", "ssu64xl", "svade",
+					       "svinval", "svnapot", "svpbmt", "za64rs",
+					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
+					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
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
+					       "sstvala", "sstvecd", "ssu64xl", "svade",
+					       "svinval", "svnapot", "svpbmt", "za64rs",
+					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
+					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
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
+					       "sstvala", "sstvecd", "ssu64xl", "svade",
+					       "svinval", "svnapot", "svpbmt", "za64rs",
+					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
+					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
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
+
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
+
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
+
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
+
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
+
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
+
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
+
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
+
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
+
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
+
+			status = "disabled";
+		};
+
+		simsic: interrupt-controller@e0400000 {
+			compatible = "spacemit,k3-imsics", "riscv,imsics";
+			reg = <0x0 0xe0400000 0x0 0x200000>;
+			#interrupt-cells = <0>;
+			#msi-cells = <0>;
+			interrupt-controller;
+			interrupts-extended = <&cpu0_intc 9>, <&cpu1_intc 9>,
+					      <&cpu2_intc 9>, <&cpu3_intc 9>,
+					      <&cpu4_intc 9>, <&cpu5_intc 9>,
+					      <&cpu6_intc 9>, <&cpu7_intc 9>;
+			msi-controller;
+			riscv,guest-index-bits = <6>;
+			riscv,hart-index-bits = <4>;
+			riscv,num-guest-ids = <511>;
+			riscv,num-ids = <511>;
+		};
+
+		saplic: interrupt-controller@e0804000 {
+			compatible = "spacemit,k3-aplic", "riscv,aplic";
+			reg = <0x0 0xe0804000 0x0 0x4000>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			msi-parent = <&simsic>;
+			riscv,num-sources = <512>;
+		};
+
+		clint: timer@e081c000 {
+			compatible = "spacemit,k3-clint", "sifive,clint0";
+			reg = <0x0 0xe081c000 0x0 0x4000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
+					      <&cpu1_intc 3>, <&cpu1_intc 7>,
+					      <&cpu2_intc 3>, <&cpu2_intc 7>,
+					      <&cpu3_intc 3>, <&cpu3_intc 7>,
+					      <&cpu4_intc 3>, <&cpu4_intc 7>,
+					      <&cpu5_intc 3>, <&cpu5_intc 7>,
+					      <&cpu6_intc 3>, <&cpu6_intc 7>,
+					      <&cpu7_intc 3>, <&cpu7_intc 7>;
+		};
+
+		mimsic: interrupt-controller@f1000000 {
+			compatible = "spacemit,k3-imsics", "riscv,imsics";
+			reg = <0x0 0xf1000000 0x0 0x10000>;
+			#interrupt-cells = <0>;
+			#msi-cells = <0>;
+			interrupt-controller;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu1_intc 11>,
+					      <&cpu2_intc 11>, <&cpu3_intc 11>,
+					      <&cpu4_intc 11>, <&cpu5_intc 11>,
+					      <&cpu6_intc 11>, <&cpu7_intc 11>;
+			msi-controller;
+			riscv,guest-index-bits = <6>;
+			riscv,hart-index-bits = <4>;
+			riscv,num-guest-ids = <511>;
+			riscv,num-ids = <511>;
+
+			status = "reserved";
+		};
+
+		maplic: interrupt-controller@f1800000 {
+			compatible = "spacemit,k3-aplic", "riscv,aplic";
+			reg = <0x0 0xf1800000 0x0 0x4000>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			msi-parent = <&mimsic>;
+			riscv,children = <&saplic>;
+			riscv,delegation = <&saplic 1 512>;
+			riscv,num-sources = <512>;
+
+			status = "reserved";
+		};
+	};
+};

-- 
2.43.0

