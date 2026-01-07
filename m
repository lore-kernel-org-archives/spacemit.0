Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B147C30DEA6
	for <spacemit@lists.linux.dev>; Wed,  7 Jan 2026 12:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767787563; cv=none; b=nCT5cBuYnfH+0yOwUpvT/XqRp3B13gKd19+PvNYyH3WMDhmwm3N0eC5LNtJHm4Lwbx/MXWCI5NnDHLk0vrL/sUmq5CdSq51tsETPoLvV2YuC6OWfhWekeec3BES5SyFHhRm5l4G8aNS3W1Pw2eoX7IDyF2BDafPb83FHNvsgdMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767787563; c=relaxed/simple;
	bh=nVRiEQf0Hh/YzDLl2mmNv+fKT8Qk/IAVG8tDqFYpKSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CuQO5PpJEDkcMR/vHCuSVwDu5KWE6EU5+uUIAF7AdzP2Xd0KehVioXfXvS1JNOecwnFX/7NP6T/gShp4+WhbM058YXl0s50UOXDrv+bRMFEWVgXcfPJjHKb2a5tNUcZGlMuCzqyMXcs+LlSE3f2+TrcJPiv7wpB5Z9jyVQxMCAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Gwf3bGle; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Gwf3bGle"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767787558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mq9uhddNWpxDAmVHij7TLry3eiH2O8cUCAEcdtnNtMo=;
	b=Gwf3bGlewiuQh2xLdaaS/qsu6JoSDtLugf8ufN80Wz/crPRYKJGF3pw7hY3jMAY44aDvBN
	U3D3x+ZB6GxcURMmwBMsbJc5JGjNOARpKv4AVxG5OAHKCHOHF9VoFrn9/5Z770MmY392gl
	FW++DsRvud8K7zZYSBSon+4KnW1KiKs=
From: Ze Huang <huang.ze@linux.dev>
Date: Wed, 07 Jan 2026 20:05:32 +0800
Subject: [PATCH v2 3/3] riscv: dts: spacemit: Enable USB3.0 on BananaPi-F3
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-k1-usb3dts-v2-v2-3-e659b0f8fe1a@linux.dev>
References: <20260107-k1-usb3dts-v2-v2-0-e659b0f8fe1a@linux.dev>
In-Reply-To: <20260107-k1-usb3dts-v2-v2-0-e659b0f8fe1a@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Ze Huang <huang.ze@linux.dev>, Aurelien Jarno <aurelien@aurel32.net>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767787540; l=2157;
 i=huang.ze@linux.dev; s=20250705; h=from:subject:message-id;
 bh=nVRiEQf0Hh/YzDLl2mmNv+fKT8Qk/IAVG8tDqFYpKSs=;
 b=MReNNYtvWmEVP8eQa2CesjnaU8ruj/M4WdplYWUic5GhkraYuN276YmGEmGqv6IqPxfq+/whB
 Y5YM5We/Vo6DMoxfmZ1VEbmJ9O4ffxJSVpJEAb6obLa+wj1VyDxEqic
X-Developer-Key: i=huang.ze@linux.dev; a=ed25519;
 pk=Kzc4PMu5PTo8eZZQ5xmTNL9jeXcQ9Wml0cs+vlQpBkg=
X-Migadu-Flow: FLOW_OUT

Enable the DWC3 USB 3.0 controller and its associated usbphy2 on the
Banana Pi F3 board.

The board utilizes a VLI VL817 hub, which requires two separate power
supplies: one VBUS and one for hub itself. Add two GPIO-controlled
fixed-regulators to manage this.

Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Ze Huang <huang.ze@linux.dev>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 48 +++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 3f10efd925dc..013df91c6a4c 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -59,6 +59,26 @@ reg_vcc_4v: vcc-4v {
 		regulator-always-on;
 		vin-supply = <&reg_dc_in>;
 	};
+
+	usb3_vbus: regulator-vbus-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "USB30_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		gpio = <&gpio K1_GPIO(97) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	usb3_vhub: regulator-vhub-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "USB30_VHUB";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		gpio = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &combo_phy {
@@ -67,6 +87,34 @@ &combo_phy {
 	status = "okay";
 };
 
+&usbphy2 {
+	status = "okay";
+};
+
+&usb_dwc3 {
+	dr_mode = "host";
+	vbus-supply = <&usb3_vbus>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	hub_2_0: hub@1 {
+		compatible = "usb2109,2817";
+		reg = <0x1>;
+		vdd-supply = <&usb3_vhub>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb2109,817";
+		reg = <0x2>;
+		vdd-supply = <&usb3_vhub>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
+	};
+};
+
 &emmc {
 	bus-width = <8>;
 	mmc-hs400-1_8v;

-- 
2.52.0

