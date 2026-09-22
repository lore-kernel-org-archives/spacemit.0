Received: from va-2-37.ptr.blmpb.com (va-2-37.ptr.blmpb.com [209.127.231.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0189B539764
	for <spacemit@lists.linux.dev>; Tue, 22 Sep 2026 11:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790075094; cv=none; b=uYf0YzN2ThzGMjiPLsunEFZSXVH1FuXhVbMAmdYrXJEz6nZTbPmyza8PbuU17RIVKGRliRP7uICsUfRacccDJcl6ZIZINptzT/efwRc4ho/3fSZ64hzMFOQ6/xrcXeDmSzURXH0V2/Z9eOcF4jfN38qpsUUp+NBz9lBgFi2PYsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790075094; c=relaxed/simple;
	bh=48yPuF0tDHCncmBzIxe6Adixm4tcOkeCt6YRyk9li4k=;
	h=From:Date:To:Message-Id:Content-Type:References:In-Reply-To:Cc:
	 Subject:Mime-Version; b=omuOqJ68+FbC43q7NKpuJvmCJqE1sG6Pe2Ddj9Wh57AR6SdRGc9SYIJW1wmKQc/AFb6ahTjFWzYljWyTcFdJAxBJMN9cYmmHVnNhgz/ZdI3vLf3fXIn1Cs6qz5cpick0UYk3majDVaePte0XXZXQb22u2EjPnUuA1ztSVTnZtsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=BXapSEhx; arc=none smtp.client-ip=209.127.231.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="BXapSEhx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1790075082;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=rFGPbCu53GFL/4qegEhAxeYlom/jwwxA377ZvxKEsl8=;
 b=BXapSEhxXphY83h5L5pGHH2v417LgfhNbPAB+FbroRg0OUqKD0hE6o3g/0thrQlVE7maR9
 uVkKChscn8ErHMmdNmjoW1FUV9LnDurhGZOwbSx3qYp6ztzwMzt/r51JnuH0rTb577B1DD
 gckWUi0aeklkWYeAF7A5pLH0NkuMac62OH79AcBYckatpQEpXBCKU8sTGCGXBT3swNKVTG
 qeN80BQJvZZyg4lDKciMgE6W50Zf4Nrqv5kcGLcF96CXzUcUZRWjjTDSmkx6RPl8Fj2lmi
 SYHihH1z5KXk8Xk6oGT8BSEGX0z260R9YKTl/4ttnNno/2m/6C0kZCz3ngvklA==
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Date: Tue, 22 Sep 2026 19:04:34 +0800
X-Lms-Return-Path: <lba+26ab260c8+c4d5ab+lists.linux.dev+sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Message-Id: <20260922110434.3426051-1-sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <20260922110231.3426011-1-sandie.cao@deepcomputing.io>
In-Reply-To: <20260922110231.3426011-1-sandie.cao@deepcomputing.io>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add USB controller and USB phy support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([183.23.111.1]) by smtp.feishu.cn with ESMTPS; Tue, 22 Sep 2026 19:04:39 +0800

Add USB device node (b, c, d) to DeepComputing FML13V05 board.
USB A works on otg mode, it isn't configured currently.
- 4 USB-C Ports
     - Port 1: PD 3.0 (65W Max), USB 3.2 Gen 1
     - Port 2: PD 3.0 (65W Max), USB 3.2 Gen 1, DP 1.4 (4K@60Hz)
     - Port 3 & 4: USB 3.2 Gen 1

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 44 +++++++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi          | 66 +++++++++++++++++++
 2 files changed, 110 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index 804abc85602a..55b0f63dcb2e 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -179,8 +179,52 @@ dldo7: dldo7 {
 	};
 };
 
+&combophy {
+	spacemit,apmu = <&syscon_apmu 0x17>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_0_cfg>;
 	status = "okay";
 };
+
+&usb2_host {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	hub@1 {
+		compatible = "usb5e3,608";
+		reg = <1>;
+	};
+};
+
+&usb2_phy {
+	status = "okay";
+};
+
+&usb3b_u2phy {
+	status = "okay";
+};
+
+&usb3b {
+	status = "okay";
+};
+
+&usb3c_u2phy {
+	status = "okay";
+};
+
+&usb3c {
+	status = "okay";
+};
+
+&usb3d_u2phy {
+	status = "okay";
+};
+
+&usb3d {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index b9977e78e096..ae3f8bb1e5ed 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -441,6 +441,72 @@ soc: soc {
 		dma-noncoherent;
 		ranges;
 
+		usb3b: usb@81400000 {
+			compatible = "spacemit,k3-dwc3";
+			reg = <0x0 0x81400000 0x0 0x10000>;
+			interrupts = <125 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&saplic>;
+			clocks = <&syscon_apmu CLK_APMU_USB3_PORTB_BUS>;
+			clock-names = "usbdrd30";
+			resets = <&syscon_apmu RESET_APMU_USB3_B_AHB>,
+				<&syscon_apmu RESET_APMU_USB3_B_VCC>,
+				<&syscon_apmu RESET_APMU_USB3_B_PHY>;
+			reset-names = "ahb", "vcc", "phy";
+			phys = <&usb3b_u2phy>,
+				<&combophy 2 PHY_TYPE_USB3>;
+			phy-names = "usb2-phy", "usb3-phy";
+			phy_type = "utmi";
+			snps,dis_enblslpm_quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis-del-phy-power-chg-quirk;
+			snps,dis-tx-ipgap-linecheck-quirk;
+			snps,parkmode-disable-ss-quirk;
+			dr_mode = "host";
+			status = "disabled";
+		};
+
+		usb3b_u2phy: phy@81500000 {
+			compatible = "spacemit,k3-usb2-phy";
+			reg = <0x0 0x81500000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_APMU_USB2_BUS>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+               usb3c: usb@81700000 {
+			compatible = "spacemit,k3-dwc3";
+			reg = <0x0 0x81700000 0x0 0x10000>;
+			interrupts = <148 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&saplic>;
+			clocks = <&syscon_apmu CLK_APMU_USB3_PORTC_BUS>;
+			clock-names = "usbdrd30";
+			resets = <&syscon_apmu RESET_APMU_USB3_C_AHB>,
+				<&syscon_apmu RESET_APMU_USB3_C_VCC>,
+				<&syscon_apmu RESET_APMU_USB3_C_PHY>;
+			reset-names = "ahb", "vcc", "phy";
+			phys = <&usb3c_u2phy>,
+				<&combophy 3 PHY_TYPE_USB3>;
+			phy-names = "usb2-phy", "usb3-phy";
+			phy_type = "utmi";
+			snps,dis_enblslpm_quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis-del-phy-power-chg-quirk;
+			snps,dis-tx-ipgap-linecheck-quirk;
+			snps,parkmode-disable-ss-quirk;
+			dr_mode = "host";
+			status = "disabled";
+		};
+
+		usb3c_u2phy: phy@81800000 {
+			compatible = "spacemit,k3-usb2-phy";
+			reg = <0x0 0x81800000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_APMU_USB2_BUS>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		usb3d: usb@81a00000 {
 			compatible = "spacemit,k3-dwc3";
 			reg = <0x0 0x81a00000 0x0 0x10000>;
-- 
2.43.0
