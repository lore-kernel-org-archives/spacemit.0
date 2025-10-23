Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6341C2D061F
	for <spacemit@lists.linux.dev>; Thu, 23 Oct 2025 07:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761204605; cv=none; b=trOQ3RsSWky7/j7nP3Fo4QiSNYD8TsAeUXv0l6S86tRSefpP6clpOvpeK4aEGD2IEWUf5QDT0xoFzBjsfQGyrzEoWVcGc7Vn4yj4z6kycqL8BHCbVkUQ2vYJKu6mZbFV1s3UUl8lTn6SLc1jhSB7qbKdz3h6sX8CiH4dLexBAt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761204605; c=relaxed/simple;
	bh=Ng7sJU6uriYTf5rZYSyCQyjKItQMSXxOIfj5WN50fKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=scVzUxWarFnJc+UE03kfzf4qVoGtmnHTQ9ihQvXFhl5OkH1PU52wSkh2EWkL2uHEBUxqNT/e1YzuMS8wb5od+zbrFlQZ88qLRFU/brOhwwSw+mCee9sELlNBeBXsPMJKpvzCIx/0oUMzAGDeNldhohWs+pOp18tYJ1/HHeSAeu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=TwwNRbEU; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="TwwNRbEU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761204530;
	bh=joD46nXQLvIHo+j0HgWSZvew9QJQpcw/TMa5i9hHU8o=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=TwwNRbEUx9U2/KkYLCLbtCZW9vXMCHi5OtFYhceAcGkFauLnHymPUGCs80zFL4DaI
	 RQUv3M9P5GJyBK6Rj0YwYVoBW66ao3an028bhUdIDg1WQaCkOYwlnRFLT7ZH5/zDgc
	 q4a1vDrbh2LdBn8RJeoxPt0WIJIG/qcd5ptC41Wc=
X-QQ-mid: esmtpgz11t1761204522tff170d3e
X-QQ-Originating-IP: B/S5rV3PQQenjL7i6qoZ3M1T7tn3dtYmHjmxvlqnzvk=
Received: from = ( [221.4.210.170])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 23 Oct 2025 15:28:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5281825611618668887
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 23 Oct 2025 15:28:30 +0800
Subject: [PATCH v4 2/2] riscv: dts: spacemit: add MusePi Pro board device
 tree
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251023-k1-musepi-pro-dts-v4-2-01836303e10f@linux.spacemit.com>
References: <20251023-k1-musepi-pro-dts-v4-0-01836303e10f@linux.spacemit.com>
In-Reply-To: <20251023-k1-musepi-pro-dts-v4-0-01836303e10f@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yangyu Chen <cyy@cyyself.name>, 
 Paul Walmsley <pjw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761204512; l=3829;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=Ng7sJU6uriYTf5rZYSyCQyjKItQMSXxOIfj5WN50fKw=;
 b=Aiw1SmBTfBNhi223fRNMnFvCpW5ccu42hxskoJ/AmhWNppC6CFtRZ8W+4PTH+uXzpai3WFagS
 F5w55z1lylfA5u6xmrZuAvQRQP5QrZugPyMHHVontQjsiZZHLPfx+KY
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OL8ICxn8D/E3Vsbvj1NepmAmZ6LCQ6GVfcqUr0XHJQ8vhNptYAt6Un0w
	QyhJ0IAJLQO2EtpvrLM2ZBN5gitBN3Bo8oEwbVfImbfYtFsA6eCy9tCr+LzF81aCMcU47uP
	CPKeOGdV0Q8yaDxScdX4cHR7O/tvXeLFrpz5P3XgR1nCBGw4ZXkoC6bLGUZq8/7YhIPh6MA
	93TGsev9zODfnThr6sfmB0Mbv+P8zr3Csj1v6z3P83E6lFMW53SOptm5N0fX6yEUjbTnZ05
	l0CH9iHvhYtoWGgqOEcVkGTKt7oVVkoyMRD/RCJVXx2sqB5p6HaFpazYu3VJXY8c0blu8wL
	bjbASjdtbdN1IR0lkZxJMsguzgwcZ4GUaLuniq3mQwGKduBagu3jDE2ft0fe2jsr+j0nQpE
	iCBdVdS6Q7ztwwzjZmlCB3NMxiKeUniwr/yJ75rNZ6q2taebVxLTlJSz4lNqeQC2Bvdte1N
	rgZJyedEp7IKUwf0dHt9DcCYFYY3QAL7HW2eMp2URr2WFhdYlpnxdsEkIw2sSZYOdYZQg38
	bZrcpbDOpzsMCwWdlvsmGrwnDz4KbIu1+hSW+Ly3BWs4ohwKnVqI76sDmmUF12jljqQDFie
	10Dno3iq/EtUt1h72TZAl/AHpmN+DsrroO+3DqLeWolzWBchBxI74kXqLo2kE++hWjLy8on
	JOxMvzL/AztQl6gmiTQSpKUx4ayoW/wXDA9teMUP6BNYPu7vVdKOunQQ+ieafoGeTxv9/AL
	bymPS2ZiDVPl6RJdvrvG8bvZXKrOrQmrzERgszXw7ivs2ta8JrftRz+dloI34mLqzGIGCcu
	F6t6P+1Qs+b8KgZRyMzs/LKs57jVYBIGOjRITRlkdIx++t4Kyr4GupuH4Dkk2KK7fA9suuE
	wRkTQu5+bhT9lQhcE5YNMv8863ysT80yczqCYfHkhByV7HmjQZbjEPZLFlmZ67IYYhmrVdc
	80aisqeCuAq2F3CBLjOQN51Xuqqh6w0E5x37Js98UXm997rxFMcdrYJx3O5Wi88ODjViCAe
	2TppDJfphbtZgJTUkiD+sbjjYKCIqLK7U1hvRJ4CJ8IG9ljHnk7lspl0/o9FZ3aRrQIlafU
	G/kPmaNtWZxagVTv8Rwbqy32SFU6qGUIrgJn004cGyu302kf4Zz17SDUK83xbeuZUFU7OPG
	lGrotz0WuR7LlCw=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

Add initial device tree support for the MusePi Pro board [1].
The board is using the SpacemiT K1/M1 SoC.

This device tree is adapted from the SpacemiT vendor tree [2] and
enables basic board functionality, including UART console, LED, eMMC,
Ethernet, and PDMA.

Link: https://developer.spacemit.com/documentation?token=YJtdwnvvViPVcmkoPDpcvwfVnrh&type=pdf [1]
Link: https://gitee.com/bianbu-linux/linux-6.6/blob/k1-bl-v2.2.y/arch/riscv/boot/dts/spacemit/k1-x_MUSE-Pi-Pro.dts [2]
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changelog in v4:
- modify commit message
- add SpacemiT copyright
- Link to v3: https://lore.kernel.org/all/20251017-k1-musepi-pro-dts-v3-2-40b05491699f@linux.spacemit.com/

Changelog in v3:
- sort dts node
- add ethernet alias
- add emmc, pdma, and eth0 node (a squash of patches 3–5 from v2)
- Link to v2: https://lore.kernel.org/all/20251010-k1-musepi-pro-dts-v2-2-6e1b491f6f3e@linux.spacemit.com/

Changelog in v2:
- modify commit message
- swap pinctrl-names and pinctrl-0 properties in uart0 node
- rename model: "MusePi Pro" -> "SpacemiT MusePi Pro"
- keep the dtb-$(CONFIG_ARCH_SPACEMIT) entries in alphabetical order
- Link to v1: https://lore.kernel.org/all/20250928-k1-musepi-pro-dts-v1-2-5efcca0ce3ae@linux.spacemit.com/
---
 arch/riscv/boot/dts/spacemit/Makefile          |  1 +
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 79 ++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)

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
index 0000000000000000000000000000000000000000..29e333b670cf0a5c4ed852668460db475b9c44cb
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
+ * Copyright (C) 2025 SpacemiT, Inc
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
+		ethernet0 = &eth0;
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
+&emmc {
+	bus-width = <8>;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	non-removable;
+	no-sd;
+	no-sdio;
+	status = "okay";
+};
+
+&eth0 {
+	phy-handle = <&rgmii0>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&gmac0_cfg>;
+	pinctrl-names = "default";
+	rx-internal-delay-ps = <0>;
+	tx-internal-delay-ps = <0>;
+	status = "okay";
+
+	mdio-bus {
+		#address-cells = <0x1>;
+		#size-cells = <0x0>;
+
+		reset-gpios = <&gpio K1_GPIO(110) GPIO_ACTIVE_LOW>;
+		reset-delay-us = <10000>;
+		reset-post-delay-us = <100000>;
+
+		rgmii0: phy@1 {
+			reg = <0x1>;
+		};
+	};
+};
+
+&pdma {
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_2_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};

-- 
2.51.1

