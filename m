Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404A53016F2
	for <spacemit@lists.linux.dev>; Wed,  7 Jan 2026 12:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767787558; cv=none; b=Rpk5x6gfSETYYDzisrtHjuV6YCWEiLb8W8RJK3Oocqt22XWlanPy4ZgVUwDIquGc2Thl/x8LV+bcwM3zgaIoshzPUN5Li+2xeATws0vpqxQs/VRi050kDPFHizyzpbS+OZhBi668nqPNWAESnBIkHzMYfyoLhJSz9OfBy3NApm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767787558; c=relaxed/simple;
	bh=HZkN9hR2jiRoT5bv5LK/hpbCK9BnZnJ7CoVhUSI/eb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h1MR3iwdOf950DNvNOyo90nwIP9l4vUSgCsm7H+llvcXWFT2/BO88I50tsOWBFmi0gzQlUDnkWgXO3xhEoKDJvjCKqnbfN/TtemPQi3g2HXavDD/sRzBLEq7pN7gjvyHtUF/Jwgu1hfWI8yrFjKfahX0mQZvyP+C8PiXFzxBlis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AqqM5smT; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AqqM5smT"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767787554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oi6LsbmDb8inhEq8SGuocpOwkdm2plqw8DXlm9DfGJY=;
	b=AqqM5smT9VBFq/xIK9bguxUl+EIObs691EzsqSrxtGTr0z7eANlfCxB3u7aLP4mYU9qh/X
	69tycrSGjz2YnZUxMlHqKAtCvrmovgQh4j7glLqQJbP2piioEuCA9GOVxEWHXIhMxIYCZp
	1V6YWjWez7akULlp6cEN2P6wNQiAzY4=
From: Ze Huang <huang.ze@linux.dev>
Date: Wed, 07 Jan 2026 20:05:31 +0800
Subject: [PATCH v2 2/3] riscv: dts: spacemit: Add DWC3 USB 3.0 controller
 node for K1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-k1-usb3dts-v2-v2-2-e659b0f8fe1a@linux.dev>
References: <20260107-k1-usb3dts-v2-v2-0-e659b0f8fe1a@linux.dev>
In-Reply-To: <20260107-k1-usb3dts-v2-v2-0-e659b0f8fe1a@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Ze Huang <huang.ze@linux.dev>, Aurelien Jarno <aurelien@aurel32.net>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767787540; l=1634;
 i=huang.ze@linux.dev; s=20250705; h=from:subject:message-id;
 bh=HZkN9hR2jiRoT5bv5LK/hpbCK9BnZnJ7CoVhUSI/eb0=;
 b=LOOTGYpu4r1GeF1+ZyS58DJw/1hbywP9N3DkzYgZCvwDdcZBS6KFSIqjsGwaDh4edroramK/v
 AcnkUB4tACAD88XyGYZuQnNMf8JPOsb00KvtY2T7kYUufGDMmMdGvt2
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

