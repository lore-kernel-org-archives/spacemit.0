Received: from quail.birch.relay.mailchannels.net (quail.birch.relay.mailchannels.net [23.83.209.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51CE334C0E
	for <spacemit@lists.linux.dev>; Mon, 10 Nov 2025 22:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.151
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762813540; cv=pass; b=Fj54t3lS5xwGRSisdie4yqIC0qlFQM9hFO59nqno6Dpp0wn/bPSJeySLwBFQTh6MlLkpRoH/iCGD9WTsOO8vjMKsdyTf9Y/VBoQsImErl82S9KqqH9prTGXzyM1q4xPZbA9pM5N3fDgnqFtsZXAvIarElU2wbaRSTgRBIMY4kGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762813540; c=relaxed/simple;
	bh=LScC7KbySktlhyWc8QzWuaJL1BV1VNB3Fzub7Zg8vxA=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:
	 Date; b=HqeA5ohMMMyYpMJtNsf5zOVBomULTKkveEIqDgjomW5yNqvy0ZAefq/PLP2SngGTtwMqWchqicS71U0EIrEKzmJePwe7u5/PF8mmqRb1Yvyp78PXnPcL0E+dfram9C072wMkYaQxcJEHyYTWSYgMCwYFf3JwCLfr2BlDKlB5S7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com; spf=pass smtp.mailfrom=rootcommit.com; dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b=Z1NBuBm8; arc=pass smtp.client-ip=23.83.209.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b="Z1NBuBm8"
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 207CD161A51;
	Mon, 10 Nov 2025 22:06:55 +0000 (UTC)
Received: from fr-int-smtpout26.hostinger.io (trex-green-9.trex.outbound.svc.cluster.local [100.124.161.181])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id B1083161925;
	Mon, 10 Nov 2025 22:06:52 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1762812414; a=rsa-sha256;
	cv=none;
	b=jNJG1q+L+SRks5GOz39k67OP4yFJT94cFmPAG5lAtKULpaF6+5ggXv1TQGW2syQUk30qvk
	J6iI9KBzFxkqynyV96wTDzZESrBgJf6q0pemz8xdZ4AS2hS8F7+UxUyaQQLYEiU3vDaOO6
	LK3i+TjF82vU2hwvrbGqH5Lsft5PnoF5XWgfvnVSlY0Ziux5AokW7uoVV4xafw1HGIqBdK
	ctrvro9gHSlpfm5JSDRcshMTOWp7Sx+lkSKJatl10+HWqZev8oh2HYnERn9wdkNvVyLuGd
	FJ0uBgMlqn0hnELDn3T6FCdNltVH+Ixy84OM9QGTDnjyAifAGJra/h+tkd7o6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1762812414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=Mg5JZD6BNpU/K0I63m6EJYff359L/0jj4o7n86WLhVI=;
	b=A/VurjAqFrBSjb531ID2BFrwUzAzdevDmP4R196Q11ezyUPcw91e7luNTXoiQXwbqaWK60
	wK/q0I/j/2IJsmsMJGWV0HTL/lNFqks0jPEuomPUlFh/TaiQyLJVQSfomtO15DrU+mM2vs
	wKvF9j33KR4GzQAmz2GRlGesI/wZgNXBDELAbmRk/vDwqfhGs0+TqwuzrdvlBGqEWCQPFz
	MmXzHt0aTl9eZkvxbJAkcQXjoEEEAUWF+r2r/h5rSlhnuujA5BVX0YWOCTfC0r/LS4sAUG
	LdqTZZczjR+ubS1eEv0JO1b85VMXLtapCKa15s9opJlxopqcgpu6jh6PVIPISA==
ARC-Authentication-Results: i=1;
	rspamd-77bb85d8d5-8r9nj;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Trail-Squirrel: 5496329a39398fab_1762812415040_2059087144
X-MC-Loop-Signature: 1762812415040:854549598
X-MC-Ingress-Time: 1762812415040
Received: from fr-int-smtpout26.hostinger.io (fr-int-smtpout26.hostinger.io
 [148.222.54.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.124.161.181 (trex/7.1.3);
	Mon, 10 Nov 2025 22:06:55 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:31e9:b9de:fe42:7704])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4d53ff2Zb5z1yQg;
	Mon, 10 Nov 2025 22:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1762812410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mg5JZD6BNpU/K0I63m6EJYff359L/0jj4o7n86WLhVI=;
	b=Z1NBuBm8Oyu3ZPQe3iqQErofO1s0BGgoQf+Kq3Q/gyM5N2sJvy1/YetaMDKhpelU4o6Z+U
	9/eONoj0wGBnn9AIrnz/TW/kLsxj42x7+OP7f8YTevuIa44TGB+pjX9vvdlm0PJ+viiJ9J
	OhEvx6J0hzh7xI2Fk5lKzvUEKv9uIFPPHSXnVLbKKjfcIAIHUk0ZCiMYXKcRfKHIhSCk5Q
	dpa2k9UpQINSlOCnu+PMNDE7wp8puzM+1FSBNQj+Um+XhY4d8gdMWsEH5r9Ictt8o22l+/
	H8VbN3VFQ8kb23zoPBzlpT0kkLlhWX0wgPDf7foROuvRCp3pGkF5P52dNF4Qwg==
From: michael.opdenacker@rootcommit.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] riscv: dts: spacemit: Add OrangePi R2S board device tree
Message-ID: <20251110220641.1751392-3-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110220641.1751392-1-michael.opdenacker@rootcommit.com>
References: <20251110220641.1751392-1-michael.opdenacker@rootcommit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Mon, 10 Nov 2025 22:06:50 +0000 (UTC)
X-CM-Envelope: MS4xfP3Q4WNBpiDRsdhHInwiObK+Gr6NxnwTGnrA5mZIDsJ87EnQeurXIuF3jEke7Nc3BM5GZHSZ/ZL9hsCzdSuNxeMwmrTB8CIwMABtH9GxFE2uR4zMZ8Aq /XsT29QMD7zcZn+x125X+x1/bSjMB0BluHq2vMBAg5g5/fNteP/NgSron+b8vw6yRghg4CHYSsJlQ7vGEP0OPm4C0IyY8iGJG/keS09ZE53gu+riim6jFyVk +OsgMEGXbuuc6Xs/DYqRPe5lDvGIeuKOIERGrlevVbtGUdom3ySitSCl8/JAYE2e66okR5aZFf4YN2YagtYkY0S05Sjew0JLBptkfEeHi/Fw6Db/tbiR5q4y IzsUyTBoU5SnPvW6cnETm2y6UDrVFESLZ2GIwHYBA4RgpB717sQnyz2GGX2lOTD6maTn47WaBmMgYYD7ymFOQkHBIS8GTlYKdyjuQgO5/BfjP95BZNHB88Ha U9EyR9z1ltYSE/4cH1rrW3rOunaVZAmQ94d5RsBTRat/lB65rm4y2ZpRYmQOCH3tIBnuFoSgsETaNH7NyZPHJm2AEvb5+k3kc3mwzRWruj04NiCAtgs0sZ9T L4cRJoR/SuNyHSM8HhzRrLL/95mljnxVRv5dQKF80VptXQhM6uq0Qgl92pJDshDOv2sS3Z3MvRrE8yhanlQWAwCgdoJ1K67jAX1G00kaNu5JIg==
X-CM-Analysis: v=2.4 cv=Lflu6Sfi c=1 sm=1 tr=0 ts=691261fa a=6hOvbz5PeP13GDnUra1LTQ==:617 a=xqWC_Br6kY4A:10 a=5dAzR5NRAAAA:8 a=lv0vYI88AAAA:8 a=d70CFdQeAAAA:8 a=MVgXUy26Hj1uv-KAJh8A:9 a=9STjDIb-X-UA:10 a=ZKAZAlVgJm32z6MX8p4a:22 a=9qqun4PRrEabIEPCFt1_:22 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Add initial device tree support for the OrangePi RV2 board [1], which is
marketed as using the Ky X1 SoC but has been confirmed to be
identical to the SpacemiT K1 [2].

Enable UART0, to boot into a serial console

Two Gigabit Ethernet ports with RGMII interface standard support
are enabled, each port is connected to an external
Motorcomm YT8531C PHY chip which uses the GPIO for reset control.

Enable PDMA.

Enable 8 GB eMMC chip for storage.

Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-R2S.html [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]
Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 arch/riscv/boot/dts/spacemit/Makefile         |  1 +
 .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 90 +++++++++++++++++++
 2 files changed, 91 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts

diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
index 942ecb38bea0..96b3a13a3944 100644
--- a/arch/riscv/boot/dts/spacemit/Makefile
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -3,3 +3,4 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-bananapi-f3.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
+dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-r2s.dtb
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
new file mode 100644
index 000000000000..58098c4a2aab
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Michael Opdenacker <michael.opdenacker@rootcommit.com>
+ */
+
+/dts-v1/;
+
+#include "k1.dtsi"
+#include "k1-pinctrl.dtsi"
+
+/ {
+	model = "OrangePi R2S";
+	compatible = "xunlong,orangepi-r2s", "spacemit,k1";
+
+	aliases {
+		serial0 = &uart0;
+		ethernet0 = &eth0;
+		ethernet1 = &eth1;
+	};
+
+	chosen {
+		stdout-path = "serial0";
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
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_cfg>;
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
+&eth1 {
+	phy-handle = <&rgmii1>;
+	phy-mode = "rgmii-id";
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac1_cfg>;
+	rx-internal-delay-ps = <0>;
+	tx-internal-delay-ps = <250>;
+	status = "okay";
+
+	mdio-bus {
+		#address-cells = <0x1>;
+		#size-cells = <0x0>;
+
+		reset-gpios = <&gpio K1_GPIO(115) GPIO_ACTIVE_LOW>;
+		reset-delay-us = <10000>;
+		reset-post-delay-us = <100000>;
+
+		rgmii1: phy@1 {
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
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_2_cfg>;
+	status = "okay";
+};
