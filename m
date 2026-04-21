Received: from va-2-26.ptr.blmpb.com (va-2-26.ptr.blmpb.com [209.127.231.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FCD366075
	for <spacemit@lists.linux.dev>; Tue, 21 Apr 2026 06:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776753818; cv=none; b=o59Z61hUruBmRDuXAuhI1hM2+BZeXn3CxUS6xl9bCelfTyLZakY3fF9xjeRQSzM0KbmK8Xv9AXkCI+Kx24TaEjB/BXTeyUNM6H6fnF66APgNQfqUSGhU6c2FtTGHkB5/8Ll/891hudbPWc3NnK9iKgsi5v4vpWuyp9DtHbVLBUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776753818; c=relaxed/simple;
	bh=CbCxkqDl6mTA/Tuq6rd3XOJCytvSbtItky/ZCLZHx5c=;
	h=From:Date:Mime-Version:Cc:Content-Type:Message-Id:References:
	 In-Reply-To:Subject:To; b=Gi26vY/4aH/WEMFrBHZH5O/h4y41VQ9QEYzTbEhrmcZVENEiYcsiPpgNE/lyQ7/hhGLHvSNV8ksfdQCcg2iWN+M1BeppSmdX8dB7b+//nihc+HPPQshTWx7U3utbWiK/uw9gIe3W30jHZw5RGU13ZEyGDRVbAyOwbZ4UReQMigk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=G6rHTNt7; arc=none smtp.client-ip=209.127.231.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="G6rHTNt7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1776753806;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=6/8m1jwqw/6gdlFElveR8F5qXIxZI6jMOvX9OG4Jjb4=;
 b=G6rHTNt7q+3C/yXg9zIVrCDA9/0yMFD1zu3Rkt9kIClHX1P32DtkJyHLj3aHg4AWEVaCuf
 /S4qeVcPuQGwRcRFbr5wz+onqfxdvYpMhTrPsrRNvq1yhJepFkhZE8R1n/mpQ758tqTv1d
 0rLQFcbpIHGsi9pqgHCdUYAvzXD7jbLU5ZkpAIcmvfwMArvVTQuLzKje3JNRu3Gxtott0a
 j6ni31/e1ZP9AIqNQkTamQI/oMZ0ODRfQKB7tSGlTs1XORTsOzrrT08tvXoW03YPxs+Nrz
 p/0a5ua+pm0Ww6Pc8ySJ9en31OsVUwPfO5nJiQmturjadEEwI8ujXns7G3M9tw==
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Date: Tue, 21 Apr 2026 14:43:06 +0800
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Michael Opdenacker" <michael.opdenacker@rootcommit.com>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, "Guodong Xu" <guodong@riscstar.com>, 
	"Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, 
	"Yangyu Chen" <cyy@cyyself.name>, <spacemit@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([113.110.140.180]) by smtp.feishu.cn with ESMTPS; Tue, 21 Apr 2026 14:43:22 +0800
Message-Id: <20260421064306.1583888-1-sandie.cao@deepcomputing.io>
References: <20260421064021.1580094-1-sandie.cao@deepcomputing.io>
In-Reply-To: <20260421064021.1580094-1-sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+269e71c8c+fb4c1f+lists.linux.dev+sandie.cao@deepcomputing.io>
Subject: [PATCH v5 2/2] riscv: dts: spacemit: add DeepComputing FML13V05 board device tree
X-Mailer: git-send-email 2.43.0
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>

The FML13V05 board from DeepComputing incorporates a SpacemiT K3 RISC-V
SoC.It is a mainboard designed for the Framework Laptop 13 Chassis,
which has (Framework) SKU FRANHQ0001.

The FML13V05 board features:
- SpacemiT K3 RISC-V SoC
- LPDDR5 16GB or 32GB
- eMMC 32GB ~128GB (Optional)
- UFS 3.1 256G (Optional)
- QSPI Flash
- MicroSD Slot
- PCIe-based Wi-Fi
- 4 USB-C Ports
 - Port 1: PD 3.0 (65W Max), USB 3.2 Gen 1
 - Port 2: PD 3.0 (65W Max), USB 3.2 Gen 1, DP 1.4 (4K@60Hz)
 - Port 3 & 4: USB 3.2 Gen 1

This minimal device tree enables booting into a serial console with UART
output.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 arch/riscv/boot/dts/spacemit/Makefile         |  1 +
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 31 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts

diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
index 7e2b87702571..acb993c452ba 100644
--- a/arch/riscv/boot/dts/spacemit/Makefile
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -4,4 +4,5 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-r2s.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
+dtb-$(CONFIG_ARCH_SPACEMIT) += k3-deepcomputing-fml13v05.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-pico-itx.dtb
diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
new file mode 100644
index 000000000000..b5d5112de358
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2026 DeepComputing (HK) Limited
+ */
+
+#include "k3.dtsi"
+#include "k3-pinctrl.dtsi"
+
+/ {
+	model = "DeepComputing FML13V05";
+	compatible = "deepcomputing,fml13v05", "spacemit,k3";
+
+	aliases {
+		serial0 = &uart0;
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
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_0_cfg>;
+	status = "okay";
+};
-- 
2.43.0
