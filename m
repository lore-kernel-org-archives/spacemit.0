Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24B422173D
	for <spacemit@lists.linux.dev>; Sun, 11 Jan 2026 06:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768113699; cv=none; b=N+AD+EAWVaABwJpuruck9RfzjqQJ2PJaBoSqncwB9wiUe8HkUU4RrPN2qzAZVo2Y/BDCM+0Oe/cyqFWsF3fFw49/tKCqGtx/V9OJO6wZhBbShe0eZowFL/KkTOICX788XHXsTCox/SnCCT6QWigO9R42a49cIdWO7gphP2WzDVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768113699; c=relaxed/simple;
	bh=HZkN9hR2jiRoT5bv5LK/hpbCK9BnZnJ7CoVhUSI/eb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L1pO008WI5t4gaT7x7OKpu5OT8Qonr3852H3EAIDN9wbweWgG2oEMy4zFwbT29DutU7KDJAVQZLf5OQTz4feX2Xs+/YTpYIA4q1Zu9Jo0uKQE+nXw9qEXCgNyP97vNdjpklNRsJXqFcTzXldf5zXVP+wiQQV+miSMcOUa/XB9hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jqIfTj6b; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jqIfTj6b"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768113693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oi6LsbmDb8inhEq8SGuocpOwkdm2plqw8DXlm9DfGJY=;
	b=jqIfTj6bN20MYKJV2iuyLGXOjP5x2l7u6pUthhMXPWV6dPcorRc7ILdi2m/O3eA06F3Hcl
	Sw4ecm4R8tdEoT/GT96ivbrncApTJPx4JYzP6A36B8h7CPhBGiXsVCJsL32CDuijNCxTQQ
	30ZzYqaD3mSQvR0QdHDYD/JLDB3FJcE=
From: Ze Huang <huang.ze@linux.dev>
Date: Sun, 11 Jan 2026 14:41:03 +0800
Subject: [PATCH v3 2/3] riscv: dts: spacemit: Add DWC3 USB 3.0 controller
 node for K1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-k1-usb3dts-v2-v3-2-f5ebd546e904@linux.dev>
References: <20260111-k1-usb3dts-v2-v3-0-f5ebd546e904@linux.dev>
In-Reply-To: <20260111-k1-usb3dts-v2-v3-0-f5ebd546e904@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Ze Huang <huang.ze@linux.dev>, Aurelien Jarno <aurelien@aurel32.net>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768113671; l=1634;
 i=huang.ze@linux.dev; s=20250705; h=from:subject:message-id;
 bh=HZkN9hR2jiRoT5bv5LK/hpbCK9BnZnJ7CoVhUSI/eb0=;
 b=qOxvjMnCacTjIbo7wlXWoGGNL4BWa3URZzJLWNVbU4mDKv+swv8Qhcl+eMybhX/9bpklICgeZ
 Z3v8681Nu/kCAxMso++eMAfodlSSFV7bvXVolX4bsvZM80upEIQklqa
X-Developer-Key: i=huang.ze@linux.dev; a=ed25519;
 pk=Kzc4PMu5PTo8eZZQ5xmTNL9jeXcQ9Wml0cs+vlQpBkg=
X-Migadu-Flow: FLOW_OUT

Add node for the Synopsys DWC3 USB 3.0 host controller on the K1 SoC.
The controller resides on the 'storage-bus' and uses its DMA
translations.

Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Ze Huang <huang.ze@linux.dev>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index b44149f4f076..f40c2ce6d0b8 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -1162,6 +1162,30 @@ storage-bus {
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
2.52.0

