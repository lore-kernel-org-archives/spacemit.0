Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F66D364046
	for <spacemit@lists.linux.dev>; Mon, 11 May 2026 11:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497888; cv=none; b=bWOfyppShB0r0a6NEBO5Tq0iQqWnySrmk5yxcu2nyFOZa01TO8RHHgTVPayhGezS+2wuVCq8yGw10G2BjX2Iy0pzP4DFTeFric/q+UtUGb43p/xvvACzdJk+gvJxS6gnSb9viPfPa6UFfb3zzHOkx8pho4VN7vhpyrhwjxX4pFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497888; c=relaxed/simple;
	bh=5v3roHgyxPFWJERolB69r03uiYR/bdqt20byUWfycz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VnzPyVxXEk0EGk6P4T35+9tpnbPpeLvR2DprHiM7/c9f7xjNA6/B5XvoAE7KaCii+T075iW1nU3L1DPTvuj3Sot8qiPhtlYb6jGUWQ/9PI0SwOuXzpVlfSCjXxhSUNfchf3K1kmfD7VRUGkkfX75hy/AVNsO8a7PVmZHHnifYbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+hXzP0u; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+hXzP0u"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4526a8170ceso2248891f8f.2
        for <spacemit@lists.linux.dev>; Mon, 11 May 2026 04:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778497885; x=1779102685; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uuhQgbnX07N+cc+OsxTKWXB812yLSeaSn+CoDTYEUU0=;
        b=O+hXzP0uin1jsikljpdyT3Hg1mQJ6dKXuXaD3tBvhOhT7l/GLD3jzOq6lMyeoSgiGf
         z5KkdpM4H/wjs0Ivc6i7YyrFTk+9ac0cn7H0kaDZk4kUwUJ9akVj5WmmBy+Atn2HIZm2
         K/wzuUKReZOtZ4QpyZDwrD7YlUSSZH5o2j+piLP+ZN9Ka2DIjrypkkQK+ms6rFSw806Q
         J0QpfEbdtGld/eg5v+kLQ0xEgSi8QI7sLS5/LBC6bN9sMvWKSELBOjfY85/yfTHn63Qa
         O38gYUBh7joKlYbmG6r4FdEQ88qYJLyEQqPDp2j6JZ3+11WwTVrWHzveXUQcDRRacEL9
         J82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497885; x=1779102685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uuhQgbnX07N+cc+OsxTKWXB812yLSeaSn+CoDTYEUU0=;
        b=VaYkRs5PRguhIxwQd9TvvJ9Nu0yI/T0wrx50FMMxx5R3OYjBfnuYxgy+SNHQHusCcQ
         9uKwpFqDuoaVdtKpBRKRVvexw6X32xULeF0hGe1VLSKfeey8M9KUjm55sp3hBdWkViNW
         vUPyYgA36cXm340JPgVydJqPmFGYNT5HLXXm1pab1Y7eRsllXhdQ/joAg801m6M/HzPz
         hqCKvw4T5z1nobt2ZAa99q5pdLW49/YYcZSFaLWk5xc8iuBthtL7DwiHsTsPN7Lp75uq
         FgFROrX57RQK3YRjwqgi2+fGnuHfoGLRTpko+0gsmMDKIIH1AKnTa7Hrdu4AwGjP4hhK
         urgw==
X-Forwarded-Encrypted: i=1; AFNElJ9gsUhdRi3nOLzKaCSwjsb2XsycSN02cWrnVmUVxpfGXODotMFrz/j0Q5/wmnv+wxpph1Lij2RM1A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxm7kAT+Xj2f2aFsbJMkfGhtwjqfmYtAR5+CDsB9XSXytWBKuYj
	8M+XlVuYeh6ULOyw4bskVVgc5gzHPYjKuRq5DrAmIWnGnNSqrACvnBwR
X-Gm-Gg: Acq92OGxmB6RmbGyLCfmCa2eCzo9q0H9hkOLrgyvvMvOGPrp2nCovNFagc1//r1LHPy
	fDyokTRovnSz1NM4KYS72bG/syeVrFY/IAKM5XLa721s1KZel7/TBi5kWjNyquJNkfpgfNGgH1x
	CfnTCqS01ynog4uhZ1INp0YgOcJlrogLNAgznDsr/do4SmebZcB8J93cOSSNLbRqChRxbxX6hRx
	XeaGW0LOxrAA+AliD192cCSg9IoBDS0VGRdHJmI8dmKJJmt9YipQWJFKMKWP1fu52Zn7UMbyPoA
	7bn21gVI1mDv1Gl/DLG1/kLHMOx1y1YDtbDwBPwizoeWWIYZJIIbQEqLL4MXU12VjNkQTo8C/Y1
	axmickqVuZM6JRAWbA+hEUbdUOqx60gKYwSoqj56wPsStaUJW66vfpKgTagN/ZM8eB0XDjbgT3E
	fvUZhoFCG9uEtHvdktZB0s4A6ueAeKt/mqlEz6cMHkO9sDMZk/WcZm/xRycMOxMyOWYqRWA39bX
	WeN
X-Received: by 2002:a05:600c:5296:b0:487:219e:42d with SMTP id 5b1f17b1804b1-48e706932d5mr140407925e9.11.1778497884730;
        Mon, 11 May 2026 04:11:24 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e701e9585sm175077375e9.5.2026.05.11.04.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:11:24 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] riscv: dts: spacemit: k1-musepi-pro: enable USB 3 ports
Date: Mon, 11 May 2026 13:11:11 +0200
Message-ID: <20260511111116.1109643-5-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511111116.1109643-1-a.heider@gmail.com>
References: <20260511111116.1109643-1-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the DWC3 USB 3.0 controller, its associated combo_phy (USB 3 PHY)
and usbphy2 (USB 2 PHY) on the MusePi Pro board.

The board uses a VLI VL817 hub, providing four ports.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 7ebace0e46edb..9c90c2817ecb7 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -54,6 +54,28 @@ reg_vcc_4v0: regulator-vcc-40v {
 		regulator-always-on;
 		vin-supply = <&reg_usb_vbus>;
 	};
+
+	reg_5v_vbus: regulator-5v-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "5V_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		vin-supply = <&reg_usb_vbus>;
+		gpio = <&gpio K1_GPIO(79) GPIO_ACTIVE_HIGH>; /* USB3_PWREN */
+		enable-active-high;
+	};
+
+	reg_vcc5v_hub: regulator-vcc5v-hub {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC5V0_HUB";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		vin-supply = <&reg_usb_vbus>;
+		gpio = <&gpio K1_GPIO(127) GPIO_ACTIVE_HIGH>; /* HUB_PWREN */
+		enable-active-high;
+	};
 };
 
 &emmc {
@@ -66,6 +88,10 @@ &emmc {
 	status = "okay";
 };
 
+&combo_phy {
+	status = "okay";
+};
+
 &eth0 {
 	phy-handle = <&rgmii0>;
 	phy-mode = "rgmii-id";
@@ -295,3 +321,31 @@ &uart0 {
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&usbphy2 {
+	status = "okay";
+};
+
+&usb_dwc3 {
+	dr_mode = "host";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	vbus-supply = <&reg_5v_vbus>;
+	status = "okay";
+
+	hub_2_0: hub@1 {
+		compatible = "usb2109,2817";
+		reg = <0x1>;
+		vdd-supply = <&reg_vcc5v_hub>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&gpio K1_GPIO(123) GPIO_ACTIVE_LOW>; /* HUB_RST */
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb2109,817";
+		reg = <0x2>;
+		vdd-supply = <&reg_vcc5v_hub>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&gpio K1_GPIO(123) GPIO_ACTIVE_LOW>; /* HUB_RST */
+	};
+};
-- 
2.53.0

