Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905358;
	b=v4tp01oLNbmC3zRTxrSBEzkNfNtbJLbDBRzrb7fu32HDZtS0+qNCI4nNUSeWOy3TtUi9
	 sHgk82Zjf2GenDjZd2h/LhdVsPyxiBZklNx33xvn/RqxkVD9mrIv8AmniFGJHgJzgg9ya
	 TEqFtr54r6zj0Odu9FwEjcgpzoJ/Kp7SvD2t6858S/C+My8006LBGtcsnuJtFhom1LUqs
	 Bc3JZzBJz1nvmyTKjUFn+GWY92Cucnoru8MymGEyvOaTvNQ2bQmxn02qFlP7JmkyZi0OA
	 JfO9jjc2Z2tTVOf9K+/gA6SFrFN2kk1vJVL/dUcac60JfqWsCSX1zUe5WO0oyc7FqNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905358;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=wU4xhqWl4USAlYADvxoZPgburqO26mwdbOZt/lIipRQ=;
	b=rNuazZTAA+5IE1gBO0vvFjbYuP9C0aXvXjEo7Tr6Hixw5UWlplMvx+59JsTGdJwxTNBD
	 RQNFg4215Xi2BVGHvxxnqsZMeST6dLQX3Z9ygdTSWn0ZinQJcAwA/Ip0LvJ6DjagLkI+Y
	 s8HiLcsGTMpHs36BNM98eO3iY2eaLrg0Ct57JF/lnp5gM+8h6AeyYNTJkdI9ai8SH1dc8
	 lS2KYpz6DKu0dL0OIduCCTy3glvvx+Ss+oOPkzmMkwXIbwhsTAEa6mJY3ji0JGPq9aAUW
	 f2flajISs/AL/0mug753I5jaS/j0TsiXMGX+6/JbZ6AGR79QanvUIAfkiiVjD/IlOyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=fpGsOHNO;
	arc=none smtp.remote-ip=54.254.200.128
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECED606A335
	for <spacemit@lists.linux.dev>; Tue, 17 Nov 2026 08:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BECED606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=fpGsOHNO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794905346;
	bh=wU4xhqWl4USAlYADvxoZPgburqO26mwdbOZt/lIipRQ=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=fpGsOHNOKhtYsvIM5B7UpuheRHlYpgXktnsP04qPqy3m+Az1zk1KYdr3gS2RGpYDe
	 DtBnlA7q/klnUMXBMu73vQ5hC7wLVCuwUJcfl8+b39btBuAzFSNC/ClPUOQCALd5J5
	 TGsrZbGV5L58oxbyeTnMrmal0RdeqIF+MxyDa350=
X-QQ-mid: esmtpsz16t1794905345t39b49035
X-QQ-Originating-IP: 8i72p43sCJOlZh+xmUN2PACtZiedRJUMSKKHKChrVCg=
Received: from = ( [183.48.247.191])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 16:49:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3412498541306828585
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 17 Nov 2026 08:48:52 +0000
Subject: [PATCH v2 2/2] riscv: dts: spacemit: Add K3 CoM260 TQ support
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-k3-tq-dts-based-on-com260-v2-2-68b337bd8938@linux.spacemit.com>
References: <20261117-k3-tq-dts-based-on-com260-v2-0-68b337bd8938@linux.spacemit.com>
In-Reply-To: <20261117-k3-tq-dts-based-on-com260-v2-0-68b337bd8938@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2698;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=dIRJzVDA8Y7pxPhVjGCYcpGvvNVKuQnpBBe7ZGfT2hM=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFl/RL6FGigeUDT49KTO6c1ar76Tx6/oidRVvJdQ3Wi1S
 HL3//XzOkpZGMS4GGTFFFm6H/BsK/CJsi0QKPSFmcPKBDKEgYtTACaicYeR4cETg/3vezneNGrL
 8UtI/lSOCV149n7g95U2Vw9t2W8rrsXwP76j827YvJZqiU2t+24fbYjQzdS70KLPqb6/657Yb6W
 XbAA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NsKw77UaNFtD2M9a+2gpYKmDeJbF2t8gO868qIGbpH0hENPhLgMhfbHG
	lkgGWf6t3mzKfNcONKxHpGulfGuVYqh5/KWyIRRgix8mVand/Qd65D95S5TNPIjmXUh/GcP
	Kihb/cK+Ec3WLkElQ3XSZkidB8VKtpBhMwCJieY8oDKUwjTX5IspSnOErTlQC2Ko/Dy3pHv
	sacrOfZyPg08ZJkD7QT5SY11QTswyW1g3hqnS+nXFSYGVIMWpsAvmyBVzD+RpQAIQxV/i8J
	QyyWpmGJ04zXWLO50hxgnP+5P/rwc3cBE44eXMUnnHW4rrJiGaeEDwFZgvpC8qBJ54lUFdX
	s/CYBR20cH6hJndcrd8+jgtiUtqN8JY24eVPMDUb+d5QtsRTdT33A/B9Kz5ZQXjfh+8iUoQ
	42/61IZnzbKQkoLV7zZRsxAdDjdCqo1/sfxPTn0NOsLdkviYodZkflVYnp1e/SQxBHZS8X3
	/ll5/I2slELWr7t31sXk10M56Ggf8YsRzICBTGsONSY0bhC27/McngU6zfc1ryjez8LYw0s
	pn+cDd5kkfcinc/SY5Nnu9B4FPyO84sA0t5Y3XZRVJcnZi2GBeytU/G/O07qFriNSY8ZLx5
	lnvYwk+kGMWbBDtLMFKYRvi6/s6MXiUb9s+1Z9IzOD4qOYzkGXemg3DA4qzve/jfB7AOfq7
	iUZSrwbzQPE4X4JcTU3BOgW0idS/L+RgIYN2AVqz9xnidg4a0qF2L1GL+DRX+uemwhrKR3c
	nU6x4yrpRyH9GOt9EF8Jl6tyETsqknXcKWPvHwTpnehAnk6A9shLHSQEcbVKLyPhO53WJBA
	HNj6AAxvU1O4wYXBaxk+SxZBX+gvkjEyJaqpYcjjoEUKJz9CjxOnr+ejfIQMQdKqzVImWwO
	iPn6OsuEiKvUHUWnGKVq6fjnPOJ0P16kmFmzmDYwvGRKNuLUgMVO4Qzm5mnlNNUxpOU4psP
	lLQSIrtDpogvE2FKbukq8zCh0DqAgSxoHZ2APWGDzznVfocTIDywdlFGnYrvu8zSAwv0D7R
	jmsXvHpzrKthDtGMk1Jtkp8R1oe6tYc5uud3fAeKalQGiT+ikPgI9vL9DqO7PKllhL3u7lM
	Kf6w8bXshEcjwTdzEIy7/ch3e+PwIAit2CUE2vncoOZncqEVQnIkJAK0V5I1AJX3EAcFXB1
	xes/
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

Add a device tree for the K3 CoM260 TQ board, a K3 CoM260 module on the
TQ carrier board. It reuses the CoM260 module description for the UART
console, Ethernet, module EEPROM and PMIC.

Describe the carrier's green and yellow Ethernet PHY LEDs while keeping
their existing hardware state, and enable ALDPS power saving on the
RTL8211F PHY with its unused CLKOUT output disabled.

The TQ carrier board is built with one of two power schemes for the CPU
clusters. The bootloader programs those regulators and Linux keeps the
voltages it leaves, so this description covers both variants. Once the
regulators are supported, the power schemes can be described as
overlays and applied to this device tree at build time.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/Makefile         |  1 +
 arch/riscv/boot/dts/spacemit/k3-com260-tq.dts | 44 +++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
index 851b701e5da4..bac9dcb5efe5 100644
--- a/arch/riscv/boot/dts/spacemit/Makefile
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -6,5 +6,6 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-r2s.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-com260-ifx.dtb
+dtb-$(CONFIG_ARCH_SPACEMIT) += k3-com260-tq.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-deepcomputing-fml13v05.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-pico-itx.dtb
diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-tq.dts b/arch/riscv/boot/dts/spacemit/k3-com260-tq.dts
new file mode 100644
index 000000000000..758347f30b3c
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-tq.dts
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2026 SpacemiT (Hangzhou) Technology Co. Ltd */
+
+#include <dt-bindings/leds/common.h>
+
+#include "k3-com260.dtsi"
+
+/ {
+	model = "SpacemiT K3 CoM260 TQ";
+	compatible = "spacemit,k3-com260-tq", "spacemit,k3-com260", "spacemit,k3";
+
+	aliases {
+		serial0 = &uart0;
+		ethernet0 = &eth1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&phy1 {
+	realtek,aldps-enable;
+	realtek,clkout-disable;
+
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@1 {
+			reg = <1>;
+			function = LED_FUNCTION_LAN;
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "keep";
+		};
+
+		led@2 {
+			reg = <2>;
+			function = LED_FUNCTION_LAN;
+			color = <LED_COLOR_ID_YELLOW>;
+			default-state = "keep";
+		};
+	};
+};

-- 
2.56.0

