Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1AB2045B7
	for <spacemit@lists.linux.dev>; Fri, 10 Oct 2025 01:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760061503; cv=none; b=I109ZRaPPNAUbTHq3IalIJQFuRTRiN2mAfM+KGxqGAA33iN3w7/hdIyyd+xFKkC1ofWNKDPDXpbukgrgD+WY5Tgp9mPK1DxQ0QxojQbexzPQ5M05WsHn/5DYqalzefG+XZAdQprNXKlQ82UiPqN5hj7iKhyAmLCEyN6N0ydbeXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760061503; c=relaxed/simple;
	bh=VjPixKGIPSWJzfZt2ZyF98XbRgKw9NPN4uHrBMVdns4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pf+dGaZsSzAGIg0ALbPx/RfJxAEvamR84wxNE8eCL2zGOsuFNTxQHFbUKVwjUJ5vg6G4lBv8KeBmvrWwUzovuQ4ufsuIswKxpTXiTqJ2FakV5D7XloC9MZAlWYCU9xVfGHvAjebK5pfqGKkCbg7ReaxXjWhqb0D7sAsKVJvpBXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=hKiU+3yt; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="hKiU+3yt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1760061418;
	bh=6GEc5zsgut2bnlpv/jK06yid5ojSc7UZYyVZwOJVrww=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=hKiU+3ytWUos1f7MmfCNhHB5ad5lW2wBcBRZIOLT2WLCDgX7c12SUqXXWJI33lwAm
	 vnXto7iIFiVDSg1wlPGGsL0SrqqvLwZiuoePAisX8CfTjGQ93/hdBC+PSXCIhkidEG
	 xLV4S7GnQJn9Ed91sRJoz7cYuL2QhbPEBngO1KI0=
X-QQ-mid: zesmtpgz7t1760061409t51c12a8f
X-QQ-Originating-IP: WsJuJ7joUIEYVadBiCM8TpUaEtQ/VVMoTuhfwSq7zWM=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 10 Oct 2025 09:56:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9563484237322633113
EX-QQ-RecipientCnt: 14
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 10 Oct 2025 09:56:31 +0800
Subject: [PATCH v2 2/5] riscv: dts: spacemit: add MusePi Pro board device
 tree
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-k1-musepi-pro-dts-v2-2-6e1b491f6f3e@linux.spacemit.com>
References: <20251010-k1-musepi-pro-dts-v2-0-6e1b491f6f3e@linux.spacemit.com>
In-Reply-To: <20251010-k1-musepi-pro-dts-v2-0-6e1b491f6f3e@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760061399; l=4072;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=VjPixKGIPSWJzfZt2ZyF98XbRgKw9NPN4uHrBMVdns4=;
 b=A/m/FHWBFUdGxFfgs3ieRTfb/VZpPHeoYY5vznZf39ETrKG80mG9SF7BVI4n8uHkLePrXGf0S
 br7xLEvU26TDIO2opvjInYyVOuEG5tjz0mA+JyRqVaHRFj2WfwEaRPD
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OXlfcwYJeu4g6UTUd0qKxWrM2z0VM9S8DcC6z1A89QwSZlYWq57g57qA
	Esbtl8LLj4shseUFyg7giCz5Phl62Xax6ngamh7mGNhFwp/ITLWxZW00F7W3gDhXn9zC5E6
	TbA3pVUQ/C1svV271zDMYsttYxAfdPtMw65/0RhLnxtkc7P7+Bx9uWhJN2NG8Jm89qSnXlo
	Dwog/B2JBIA75T9TzF+8A1qbYdaxC3iOqTsWDumUs4GDKLd8MKKfXpM1+twYMsUHO0xeeoQ
	IsQSJ+1Otu8KnY+AF3P1Jf9iSU7JN1bTih73shzMXrh8lADcwd5UkjG2iHDXX3Pnjjh5nfZ
	G+BUvzcJW0zBrkJ9Wagrqb/lFygA12e6B2+4kGxydFVicYkY6xzTYiY7oVy77Pcg0onZnAv
	AQp+W9r6fKvMvAgxBH4C82kQjGMRDKFrHuI2yJMlBj2mE+7mOYfxzCW1yvHSiMws688xm4d
	AX/kpJZ8AhQuz4Az57lW1RJOWvUbfxaqVcqlUnM/ffXgxQ/+/9fZKoHLXC48NUYzt4ougMZ
	uLrLBo6/uFSpkT1vG8wm5VYi6tXytlYGjXEnTGn5uiXYwTWXFy9Am9pekNV6mS104pBgJad
	NDnElSc6M3E9/GCd/h84BJ2nxZZ39/pIuCaZ5rd45TSFyhX0dxmlDVeBt/t0IpVsVmp5jYd
	0+2IG04VEjNh1MDoiJ8nukBnBk0UyqFrm0OpBRfhYg38VO7OSGIVB/lIEZRgEqCykDhqGR2
	gEmRBCueIw7HWCIf4o/NXqPMis0LjEB5eVy2jeK7r+9E5Js81MLeu9BIEEODcVC8cXKTG6D
	WnWQIcwf6/74K2w7chm7m1BAJ+2Vwy9spUMNxkPoGTvsBtVP6qbXLmNAldEQMWKD5lKy36H
	BCxNBoMvEiRJSUJjt028DevzmKzeAKfOokTzkh/5vE4JxVCmzTGaJwaUsmRgtuuAVD56G0P
	OLTVfOkGCfAc6g3laqUwxKNkDJs90T0XxuGHoETHbZFD4DqUT/zU24ASHAIhS4ThmD1+YW6
	6cGkWT+Q3ncqVaOZzv/iTCBXUKWGCv5dOxIwo4FQY3ZadXwtKO7JiRNBOsfDlj9EJCexHvL
	SjskLTKS0iHV+Cheq+Oi54fai8fmq0O4OuX0O/94WEpmx1JMkPhQCTW3XtDIkcunFxidCZ0
	ZhyQ5AtfRvi2HCXuPf4nmdDYZg==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

Add initial device tree support for the MusePi Pro board [1].
The board is using the SpacemiT K1/M1 SoC.

The device tree is adapted from the SpacemiT vendor tree [2].

Here's a refined list of its core features for consideration:
  - SoC: SpacemiT M1/K1, 8-core 64-bit RISC-V with 2.0 TOPS AI power.
         This suggests potential for light AI/ML workloads on-device.
  - Memory: LPDDR4X @ 2400MT/s, available in 8GB & 16GB options.
            Sufficient for various workloads.
  - Storage: Onboard eMMC 5.1 (64GB/128GB options). M.2 M-Key for NVMe
             SSD (2230 size), and a microSD slot (UHS-II) for expansion.
             Good variety for boot and data.
  - Display: HDMI 1.4 (1080P@60Hz) and 2-lane MIPI DSI FPC (1080P@60Hz).
             Standard display options.
  - Connectivity: Onboard Wi-Fi 6 & Bluetooth 5.2. A single Gigabit
                  Ethernet port (RJ45). Given the stated markets,
                  this should cover basic networking.
  - USB: 4x USB 3.0 Type-A (host) and 1x USB 2.0 Type-C (device/OTG).
         Decent host capabilities.
  - Expansion: Full-size miniPCIe slot for assorted modules
               (4G/5G, wireless etc.). A second M.2 M-Key (2230) for more
               general PCIe devices (SSD, PCIe-to-SATA, comm boards).
  - GPIO: Standard 40-pin GPIO interface, as expected for an SBC.
  - MIPI: Includes 1x 4-lane MIPI CSI FPC and 2x MIPI DSI FPC interfaces
          for cameras and displays.
  - Clock: Onboard RTC with battery support.

This minimal device tree enables booting into a serial console with UART
output and a blinking LED.

Link: https://developer.spacemit.com/documentation?token=YJtdwnvvViPVcmkoPDpcvwfVnrh&type=pdf [1]
Link: https://gitee.com/bianbu-linux/linux-6.6/blob/k1-bl-v2.2.y/arch/riscv/boot/dts/spacemit/k1-x_MUSE-Pi-Pro.dts [2]

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changelog in v2:
- modify commit message
- swap pinctrl-names and pinctrl-0 properties in uart0 node
- rename model: "MusePi Pro" -> "SpacemiT MusePi Pro"
- keep the dtb-$(CONFIG_ARCH_SPACEMIT) entries in alphabetical order
- Link to v1: https://lore.kernel.org/all/20250928-k1-musepi-pro-dts-v1-2-5efcca0ce3ae@linux.spacemit.com/
---
 arch/riscv/boot/dts/spacemit/Makefile          |  1 +
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 40 ++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
index 152832644870624d8fd77684ef33addb42b0baf3..942ecb38bea034ef5fbf2cef74e682ee0b6ad8f4 100644
--- a/arch/riscv/boot/dts/spacemit/Makefile
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-bananapi-f3.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
+dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
new file mode 100644
index 0000000000000000000000000000000000000000..49c41ce785cded31c9937d8244d9bc99dcd1e1da
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
+ * Copyright (C) 2025 Troy Mitchell <troy.mitchell@linux.spacemit.com>
+ */
+
+/dts-v1/;
+
+#include "k1.dtsi"
+#include "k1-pinctrl.dtsi"
+
+/ {
+	model = "SpacemiT MusePi Pro";
+	compatible = "spacemit,musepi-pro", "spacemit,k1";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led1 {
+			label = "sys-led";
+			gpios = <&gpio K1_GPIO(96) GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			default-state = "on";
+		};
+	};
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_2_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};

-- 
2.51.0

