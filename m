Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819688;
	b=j31hCuQecyZR/JHaiSrFrxKaFNouULLaO+y9CiZUW0NOqN16yetzrbhzSqDA/14emh/E
	 JEnrRepztXLZzZnsRV85yDjI9RDi8+7zIEd6hyzA8HwSSNgqbOMRJw70ilcgXYByPIyUa
	 dpatQeAXV3w949jtUPN85IaqKTzo34aHgn2pYD5BWvNFquHj6A/buGD/zKqH78AoazXLl
	 Ct8FVGiVt4otLyItk3I11nNC33b5sIt59vDs5C1GjlzUvLys6Bb8HeVy5D7BDg9OqCUa+
	 LhwkQSAfKgemERPGxKxPXsQ7zyYbJGVUXI3/pB3OM4ID5ZmO0qUtcN606qZwMFPd/fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819688;
	h=DMARC-Filter:DKIM-Signature:References:Content-Type:To:Mime-Version:
	 X-Original-From:Content-Transfer-Encoding:Cc:X-Mailer:In-Reply-To:
	 X-Lms-Return-Path:From:Subject:Date:Message-Id:Received;
	bh=K+SHc+Dz2bu6gR+hGPRdpnsUFNLQ0kuFmQnGIRcMA1w=;
	b=kABnuQELBxgah3PMlOTa40pxWD0rXUGIPhxAC9fLxJ8CuXy2bBsfaR6C6s3bRnA6DZr5
	 8L7o+oazdwLVEXeF4DKKzjoqpfgzGAnuD0/SUu+vaTdGUIkpXZ/d+L5RWlR+E2+sPCfye
	 iWrnDQYgla3MCsdZhbxoCapTaMMvHF/6bm+rXOjWyvzhe6AELdFMCOtCN6DMkUJzGjB4O
	 9zauFKhnmjTLKQf0QejUiswUv+4Jwcb637PXvY5vGpC1iz2PwHI3pL0PsEyF+eGvIfLSK
	 3Jq2ffmQ6CPRglHe1F17qpiSroqfxVGNnC/JDzH8cRdKwN6BJb6L7tJscH2R1HFZ25g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=WCnLCG1c;
	arc=none smtp.remote-ip=209.127.231.39
Received: from va-2-39.ptr.blmpb.com (va-2-39.ptr.blmpb.com [209.127.231.39])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1AE606A31C
	for <spacemit@lists.linux.dev>; Mon, 16 Nov 2026 09:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B1AE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=WCnLCG1c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794819678;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=K+SHc+Dz2bu6gR+hGPRdpnsUFNLQ0kuFmQnGIRcMA1w=;
 b=WCnLCG1cuyfOBrs+E5ZWksSPwXc66ekBeLAaesTOuqwr8L4ptpDZX2v/5eYy/NvKakIl4K
 P1Q0vd7mvq7Qt+Rq3Mr5f7ZvXasA+nKVJXLUT9xNSQJ7rxh2mUbCzS1AEzIa8W9ei1mUWe
 akX8Ev48taefKUlnkR4vZnCDLQQ/0qawUUGTTmsHpcHaw4m+IE5mHi4knleddWrv3Sv822
 dylCF7gcuBaNnQscY1reX+0o4besaizztBwvFSC9J4od06VJuU4fuPJQ0VxtGlyBV/Kp5c
 SOcu9ASlqwGWGawL8Ok8W+qxp3o+T79Hwh0DmiKcW+W5NcyYTJlv/jbXZRseWQ==
References: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+26afac64d+8c2c9f+lists.linux.dev+sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH 5/5] riscv: dts: spacemit: k3-deepcomputing-fml13v05: enable PCIe
Date: Mon, 16 Nov 2026 17:00:44 +0800
Message-Id: <20261116090044.951354-1-sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([218.17.141.187]) by smtp.feishu.cn with ESMTPS; Mon, 16 Nov 2026 17:00:59 +0800

The FML13V05 has two PCIe root complexes: pcie0 with four lanes on
combophy channels 0/1 for SSD and pcie4 with one lane on combophy
channel 5 for Wi-Fi. Add the 3.3V auxiliary regulator that powers
the PCIe slots and enable both controllers.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index 2e1ad0929ee5..ea37981a86aa 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -23,6 +23,14 @@ memory@100000000 {
 		reg = <0x1 0x00000000 0x4 0x00000000>;
 	};
 
+	reg_aux_vcc3v3: regulator-aux-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "AUX_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
 	reg_aux_vcc5v: regulator-aux-vcc5v {
 		compatible = "regulator-fixed";
 		regulator-name = "AUX_VCC5V";
@@ -202,6 +210,31 @@ &combophy {
 	status = "okay";
 };
 
+&pcie0_rc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_0_cfg>;
+	num-lanes = <4>;
+	status = "okay";
+
+	pcie@0 {
+		vpcie3v3-supply = <&reg_aux_vcc3v3>;
+		phys = <&combophy 0 PHY_TYPE_PCIE>,
+		       <&combophy 1 PHY_TYPE_PCIE>;
+	};
+};
+
+&pcie4_rc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie4_0_cfg>;
+	num-lanes = <1>;
+	status = "okay";
+
+	pcie@0 {
+		vpcie3v3-supply = <&reg_aux_vcc3v3>;
+		phys = <&combophy 5 PHY_TYPE_PCIE>;
+	};
+};
+
 /*
  * Onboard SD card slot:
  * Please insert or remove the SD card while the device is powered off.
-- 
2.43.0
