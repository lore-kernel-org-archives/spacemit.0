Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=43.154.54.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874710;
	b=ZKHjGRlkY4HWrF2VL0Fct1ELGaBqzRqlPBNuPQXom0ASHZdsFY9mcLDkC9qREqlbDqz+
	 Hyc5si/m5wuNKFnpTz/Q5cvFK3JgB4EvjLErxXOKeHELbxSgL5bEcldXlMIN+P6NdCNbT
	 V/SXJ7dGSHffjzx0wsXzYI4A5bYR+tsJWwgrlRyBK8aQpnQsC0aqLwp9wBhvDy1Eee6oR
	 708InYI2wHP64PfG+xZgmMrpJrIollKBFIZCn83GjqY9gFP5R2tAYBj5GSZ1jfw3RDGkh
	 +edGfug5lgYmptCzz0yTojnky4fJclbFQom2eaMPOg3XKZFo2MF4A1xmvGD5tIRL0Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874710;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-SPAM:X-QQ-RECHKSPAM;
	bh=QpryRELSGG80FrBTzrLF4Ebl/cDHIgqfhVdJfsX/2Ck=;
	b=FaHJ4AIS4SHzQSgI2ibrfSrUGfLrE0cZ9ONZzJ6nJNTNW3sjiqPaY9vH9GNFUuaqLsMG
	 GiJwujOQPZk5NPCyp0FhHbOHcJpmh/9gUNRFgkACejAR03W0Pu/Fm6tFlVRo/26iTT1mB
	 jMO9DMAUh/I9BUTtyDdzc7Im8ftOoSbUt+DWj3LR5UjMR7dOXVF2q0i3xfDFtzUTxLKi7
	 m/Wm0/VTvcJymJO0WAm5qGwthynyJOwCYWXUMpyqu+H40O5eZoBLL1wot0535P98Z16Q1
	 3ygvuHzovTe3/AD/Stp/gWARMxQBEh5+BUOgZ/0nqg1lIOY4njt/6bPoU7gm7Dni28Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Mcj63AoA;
	arc=none smtp.remote-ip=43.154.54.12
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.54.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89400606A326
	for <spacemit@lists.linux.dev>; Thu,  5 Nov 2026 10:31:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89400606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Mcj63AoA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793874696;
	bh=QpryRELSGG80FrBTzrLF4Ebl/cDHIgqfhVdJfsX/2Ck=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Mcj63AoALgifsDYgU9vBGy4J90Hp2sv2lyMKh/3DvDG/34+xGnOugdnR9jgDnH+g/
	 kWVb9758lfeKO7nbcTeTpkO/ezCAgLyC+g4DBp9a75fSieeyoS4JMipM8uHTrVyFmX
	 Jc14fF2SpNJa+2LxClMLzPjEs9u1OdFGxADRcJI4=
X-QQ-mid: esmtpsz11t1793874693t02fac1d7
X-QQ-Originating-IP: 4eTnkOOCAXSXOIckUgJdTR9LbDF8/V9x8+qSR90OPrc=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 18:31:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 313034118725653772
EX-QQ-RecipientCnt: 14
From: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
To: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2] riscv: dts: spacemit: k3: add USB3 port A (DRD) nodes
Date: Thu,  5 Nov 2026 18:31:25 +0800
Message-Id: <20261105103125.2727341-1-chunyan.zhang@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MIGuSZJZg3QGnuivF94uB/SQtZveRJWXwr9qj/ZN4VKL3ddLulf9HXVL
	ev86CQAYYGkpNjg01/hPA/9CVdsd35q8rH9Nh0M7Lp9G44pCmcUy9UuPcgumLME7tEfj+ko
	snuvJ0Yi5zp/pcCsW66hKaLbXtHuvg27RLRGBbQhgsirbXr9kEOwDzDXRqm28aDCJRWbPrk
	45WH5hZAsW06jtDYQg84euE+L5kqSMBT4f2/0OSQ99fGHT6/jaqgzh9jBgNto7P+2b7n6uC
	zNrUWkqOtPkG5Jy3dFE42TfW11Iim81iS614o3V+D38YNbCXCyBRlrLzg+fC3HSN1SIZUF2
	/roy0ULTecSQLVur5tYoQsgviPnaPRqPTgkHn+oDyPplbL2i0lM/YuIgBsjnKMOaXdWlJCx
	1C/HVW6Kdceq9kt+XcHEyq2h+YES8G7uprvbdeHHGtg0WXeDRiFM7XPBNbL/d+8CBwxRYcn
	6dsaA1HwR0vlDRm/Ptbk8J5xJLHfJZhJyNMhy/MSGbLRxUsR+Ad8e/Jtn2Bm/nPD0tqP9g8
	qHqClFgf+6jiBL2AukhklwVqNyJl68jjxycKgLjsyvyRxTIyVylz2icwjVmM0kORB5jro8K
	RUeZToMOz6WDCHQNYpeBVA1wyoNYZnY/K8rGB/s6llKAM+ftYa5vHDFTv9zwiXSnGMPPZqX
	zGRuStyVcKGujVREmszCynQCy95dz0KGeyL/82B6pNvG/zjIBZnUF6Mr0nYwWLZqYsQilKl
	46caKi4jAJ7NPlCcg9wdcKJXAVDuvhQMJXFiw9FIux1LzizYz/HnAbzTSvGJmu9CMkc7fbd
	KEjc4zDljnXif1aptdNcHDN1C5auhQ6x20wFNto8Gl0NeMovZQ/jM/3nZ5+hl5PhSMyFFdy
	2S8CpGp+bzPLx7E1mgQwUrEFgkjna6PFS2ycMe44suVHQer9X4nDFk4hYGRRwUkidiAnlqf
	l0CbgXWITpcqBXJNnuFFUgyPw6Rzx6De2K3JpRCbqIc/FBc9rZts1hFH6FoN/Jw0+S48sXU
	jgmvFxeX10DOznwsAHG7M91kUVJY2ytjDU3mKzjTuKU3J6sGZlqbvyGOX6auYNkALRgzWPe
	w==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-SPAM: true
X-QQ-RECHKSPAM: 3

Describe the DWC3 controller and its USB 2.0 PHY for USB3 port A
of the K3 SoC.

Only the U2 lane is described: Port A's SuperSpeed PHY has no driver
yet, so the port runs at high-speed (maximum-speed = "high-speed").

On the K3 Pico-ITX, Port A is a Type-C connector behind a FUSB301 CC
controller, which is not described yet. Nothing configures the
FUSB301, so the port relies on its power-on CC mode. Enable Port A
with dr_mode = "peripheral"; it is device-only until the CC
controller is described.

Signed-off-by: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
---
Changes in v2:
- Rebase onto v7.4-rc1.
- Move phys/phy-names to the board dts, matching usb3b/c/d.
- Add snps,dis_u3_susphy_quirk and snps,parkmode-disable-ss-quirk.
- Note in the commit message that Port A is a Type-C port behind a
  FUSB301 and is device-only until the CC controller is described.
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 12 ++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 29 ++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index dda420900aa2..d0fbed23ccca 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -337,6 +337,18 @@ &usb2_phy {
 	status = "okay";
 };
 
+&usb3a {
+	phys = <&usb3a_u2phy>;
+	phy-names = "usb2-phy";
+	maximum-speed = "high-speed";
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
+&usb3a_u2phy {
+	status = "okay";
+};
+
 &usb3b {
 	phys = <&usb3b_u2phy>;
 	phy-names = "usb2-phy";
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index e89d2cc5ca8c..2d2569cfe676 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -687,6 +687,35 @@ gmac2_axi_setup: stmmac-axi-config {
 			};
 		};
 
+		usb3a: usb@cad00000 {
+			compatible = "spacemit,k3-dwc3";
+			reg = <0x0 0xcad00000 0x0 0x10000>;
+			interrupts = <118 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&saplic>;
+			clocks = <&syscon_apmu CLK_APMU_USB3_PORTA_BUS>;
+			clock-names = "usbdrd30";
+			resets = <&syscon_apmu RESET_APMU_USB3_A_AHB>,
+				 <&syscon_apmu RESET_APMU_USB3_A_VCC>,
+				 <&syscon_apmu RESET_APMU_USB3_A_PHY>;
+			reset-names = "ahb", "vcc", "phy";
+			phy_type = "utmi";
+			snps,dis_enblslpm_quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis-del-phy-power-chg-quirk;
+			snps,dis-tx-ipgap-linecheck-quirk;
+			snps,parkmode-disable-ss-quirk;
+			status = "disabled";
+		};
+
+		usb3a_u2phy: phy@cad20000 {
+			compatible = "spacemit,k3-usb2-phy";
+			reg = <0x0 0xcad20000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_APMU_USB3_PORTA_BUS>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		pdma: dma-controller@d4000000 {
 			compatible = "spacemit,k3-pdma";
 			reg = <0x0 0xd4000000 0x0 0x4000>;
-- 
2.34.1

