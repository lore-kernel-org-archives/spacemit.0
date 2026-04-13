Received: from va-2-36.ptr.blmpb.com (va-2-36.ptr.blmpb.com [209.127.231.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C674391840
	for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 06:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776060447; cv=none; b=OOaitRPihXvYG4XZq/gJEN/uKhGYkJPAY1u/PwM9mWrdzR7FH/izUUZpD8Pk2E7NI+/4V4m5AZbEmhWpTJRVKUNWxdIrfPoVNaXJChmEI3oWrUSwyzxBX2Qi/codhlTL85/OSQC8XLL+UiN3Kv/+OZFpAa2qlecP7/AUbdSBtgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776060447; c=relaxed/simple;
	bh=CbCxkqDl6mTA/Tuq6rd3XOJCytvSbtItky/ZCLZHx5c=;
	h=Date:Content-Type:Cc:From:Mime-Version:To:Message-Id:Subject:
	 In-Reply-To:References; b=BWamSV/jC7nV7p9HyQaL00d5VkxHmVbfPnvVgwdVgsFDmBiR6FC5F5lmjG32FrM3bPT7nadv36hpF7ry0afkgh7agLWxuXwvkUFo8AwEqm1k+9Nu5yrTTZRX+joJ0Yowen0JapbIdOvo75maNljIOyKGIPF7i1rMpKApo72cSaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=hBagppB3; arc=none smtp.client-ip=209.127.231.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="hBagppB3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1776060440;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=6/8m1jwqw/6gdlFElveR8F5qXIxZI6jMOvX9OG4Jjb4=;
 b=hBagppB3UVWkPwV5yqB9l2U3foGZHQS6k136JJlXrnoIzb4KLWSasVz6qFVxiau58yP6mU
 yRrU9s35TZJUqSlEkcl3UM3eveSsIjsZ5WAyFWGKGMKsixV2kpG6wLKXFZKPcUEOVTmsgn
 py6zGycXnyHk+0rA21qjAR0QWdhR67oYPm+4gYzl19eDgDfsHLq/l2sq/OdlqiXdeB8rma
 Jk9q2ZDfLqfCseNWz9Ald4+eZ21sm2bKaas3DdCzOP/+3ZkJGcIiE+8vTA+TsFgjHuplzx
 qaiOhoJ5MfJUGSOqPP15VGPP68n85bkBXrJA2iya7/GBwIXmWgseVCIK2lrvsA==
Date: Mon, 13 Apr 2026 14:07:01 +0800
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+269dc8816+13c1ec+lists.linux.dev+sandie.cao@deepcomputing.io>
Cc: "Conor Dooley" <conor+dt@kernel.org>, 
	"Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, 
	"Michael Opdenacker" <michael.opdenacker@rootcommit.com>, 
	"Guodong Xu" <guodong@riscstar.com>, 
	"Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, 
	"Yangyu Chen" <cyy@cyyself.name>, <spacemit@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Message-Id: <20260413060701.1236018-1-sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([61.141.250.238]) by smtp.feishu.cn with ESMTPS; Mon, 13 Apr 2026 14:07:17 +0800
Subject: [PATCH v4 2/2] riscv: dts: spacemit: add DeepComputing FML13V05 board device tree
In-Reply-To: <20260413060524.1235982-1-sandie.cao@deepcomputing.io>
References: <20260413060524.1235982-1-sandie.cao@deepcomputing.io>

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
