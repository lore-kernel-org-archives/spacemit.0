Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21635253F03
	for <spacemit@lists.linux.dev>; Sat,  1 Nov 2025 09:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761987843; cv=none; b=u7sveVZ+D7oU2j7hNmIMS5psv8m1R/xndmiPqIe0taArbS1i06u3YSFqPYPLPBmiECkRDNQDCQFP497XrM8gwN4/h6SJs9j2EszpOWxiYWBu1hfFxp7rK3eZ9N2PAa00ieMU1dO8xdgZmOP543H/XA+HvXCbX6umDoT/VTrbTdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761987843; c=relaxed/simple;
	bh=3YiLR57+6Dxa5xB+On0XN2AuxKYOGj2xQbXtnep93Hc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QQZUtYlTZEmNMUlPIjXbohjlnxeo6s4pyuDmZQMkbaj1mr7Lk+Vld+RN8SZoZdnlf0dNUrrESu785gjBJKF7mJnAxLvmrhbExH91HX+Ye49/k8HGo5fudvsr31PBiIDgCl9+2bwW/q37l6C3HEc/NUndCPlXwBUWnTZWErFnnSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eKcrB4lf; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eKcrB4lf"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761987840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YBiJs2WQjHw8UYmAw8T778QlQ1tMZTE4odg9x5Nma9s=;
	b=eKcrB4lf7+ICg25rkrUi1rF6Ld0go7A3Zu3w+BzvbL5UK9y5J35vB3+FTZkvdynrMASvDA
	1u0XTIMTdm2uEOmnGQH/+PCetg0c0VcSB91MNyNKpCQK0TYHOG2qD8jyzS6/nwnpQOK2Ac
	mNMN2cCH4/mxbA9SLpEPBuKbwN0Dx0Q=
From: Ze Huang <huang.ze@linux.dev>
Date: Sat, 01 Nov 2025 17:03:26 +0800
Subject: [PATCH 2/3] riscv: dts: spacemit: Add DWC3 USB 3.0 controller node
 for K1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-k1-usb3dts-v1-2-dd2660e5740b@linux.dev>
References: <20251101-k1-usb3dts-v1-0-dd2660e5740b@linux.dev>
In-Reply-To: <20251101-k1-usb3dts-v1-0-dd2660e5740b@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Ze Huang <huang.ze@linux.dev>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761987811; l=1584;
 i=huang.ze@linux.dev; s=20250705; h=from:subject:message-id;
 bh=3YiLR57+6Dxa5xB+On0XN2AuxKYOGj2xQbXtnep93Hc=;
 b=RO46HnnWwT5Ud1pKk+OX7GYV++DZhj9XZff79ejdHzVGBoGqcQkQE+0tDK7JexlUvfaAjLgJM
 L2D8gdD/x7YBgwvzqJLmGowi92qLrPqw1qgxKu+ypEpEq3orMojnQUe
X-Developer-Key: i=huang.ze@linux.dev; a=ed25519;
 pk=Kzc4PMu5PTo8eZZQ5xmTNL9jeXcQ9Wml0cs+vlQpBkg=
X-Migadu-Flow: FLOW_OUT

Add node for the Synopsys DWC3 USB 3.0 host controller on the K1 SoC.
The controller resides on the 'storage-bus' and uses its DMA
translations.

Signed-off-by: Ze Huang <huang.ze@linux.dev>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index d4d3c6d88a29..1d1c6276e9d0 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -1010,6 +1010,30 @@ storage-bus {
 			#size-cells = <2>;
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
 
+			usb_dwc3: usb@c0a00000 {
+				compatible = "spacemit,k1-dwc3";
+				reg = <0x0 0xc0a00000 0x0 0x10000>;
+				clocks = <&syscon_apmu CLK_USB30>;
+				clock-names = "usbdrd30";
+				interrupts = <125>;
+				phys = <&usbphy2>, <&combo_phy PHY_TYPE_USB3>;
+				phy-names = "usb2-phy", "usb3-phy";
+				phy_type = "utmi";
+				resets = <&syscon_apmu RESET_USB30_AHB>,
+					 <&syscon_apmu RESET_USB30_VCC>,
+					 <&syscon_apmu RESET_USB30_PHY>;
+				reset-names = "ahb", "vcc", "phy";
+				reset-delay = <2>;
+				snps,hsphy_interface = "utmi";
+				snps,dis_enblslpm_quirk;
+				snps,dis-u2-freeclk-exists-quirk;
+				snps,dis-del-phy-power-chg-quirk;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
+				snps,dis_rxdet_inp3_quirk;
+				status = "disabled";
+			};
+
 			emmc: mmc@d4281000 {
 				compatible = "spacemit,k1-sdhci";
 				reg = <0x0 0xd4281000 0x0 0x200>;

-- 
2.51.2

