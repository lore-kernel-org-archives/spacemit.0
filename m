Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFBC3F23A4
	for <spacemit@lists.linux.dev>; Mon, 27 Jul 2026 09:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145665; cv=none; b=fZF4ZJc7jTeTNnVCD4nVtGFZEGhLg43WMaGJxFo5WfI+w5HdiUCqKmWUChthACMdqSWkjgJZDa0SslquVwBtETRv0N5cTdzLkg4b8on4iKLhAav65zwn1IRjKjxQAwW60o7OSV6/8tFffOWPMHsg9UOz5BOESODYF3ZXG5NQ1I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145665; c=relaxed/simple;
	bh=rplW+HwOp3qf7OXyNELEnQynbww+W3JHrQvDBdAxtio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oRYGA1H8koyhHV88q8ktF6LxoKeq+2pqOxpFLu389bjVS6Lk+fx29tYEFkBvOzMeveKWMmUiM0zGOttipixOS77sWFXQwT+ZF2R/Uebm00wJc2mWGjwr3X1t0Sug4nN2eyR6fjtVWrXKcGW+CpoV1IZloxOiSc8/CYmWytUxRWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=czc/WxDA; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="czc/WxDA"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cacf197759so35654555ad.2
        for <spacemit@lists.linux.dev>; Mon, 27 Jul 2026 02:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145661; x=1785750461; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dh0DZFRQSMXyojhiGXgYXVI9ooE3AUB1jkilp6F9ssI=;
        b=czc/WxDAL0PKGXfyUg+kxAtf0NsZu7Xg7eZ6sZIWsO9g4/FidE9Hr6Yhe5CbSITToK
         b2DxPSXdZXp1oYJHNOuPHomPCzKQYVaKpjhvLaeCk/xXj1MAw0R+94wbofxut9EDupwR
         0RkIWq8f74ik7C+Y05H2lo4TEJfxRlU1J6S050OeFENxLADupINP1GPd6s5IYo4CjoHW
         RKloASxkSCA1dLVJm+MjH0gIfDD1govYqKoS+yLiGunemZXnFKFmI8TiXtaRj7y/FUyq
         naMGoAaZA43lg/eGYO0bmqaWvx7JQsWnnXXQBednxFEO5OUEWSoJOj3aM3pXiEuJQ42o
         FcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145661; x=1785750461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dh0DZFRQSMXyojhiGXgYXVI9ooE3AUB1jkilp6F9ssI=;
        b=DJ9jEasBik/MlbWvaOXB6D7LgPMrB+7O5Qsu6kdZldt7cxoNu2sALylAAAabTwPdId
         JaUoL9PWbhn/pbv5wX54D3GoIm77POPGuzqlvI3dn4vx6/ksz09cZ6kSlK94f7n6gRMY
         THnjDOuKyb4BEacltngona3gF6gDtigQ2lP6GGdaJqXUIM87KUFsJVusKf1n96jnpjsO
         SUCTU9EY/tK/U0/Yex5YWfMScKGRvdRLnM3KLIxTvVjJaMD21KnB5d1eIX/gk6J6J8YF
         wIrStjYBZchILK76vpadithi0gHdvGeE5jxGB3Ey7UV589ru8mTQluKq/VY8vl1BgdbD
         JE8g==
X-Forwarded-Encrypted: i=1; AHgh+Rrp7qtSvlL7fDD9fVZDJBqjIcBhIqVcCadDeMjPmOl3+ElNY1t9Sg655XqK7jPR6plVUpNlKWBXpg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyhDKf5T6m4udNAhBVWQza/5bqt1clrHcUWDDLfASoDXbMjIDua
	7CEf4pavhuck5PnMZe+DfUs2MRliXGIakUt/VAv8teR7OMM0FsZiDriO
X-Gm-Gg: AR+sD11Eq9/5b5CzGk/gMKjZLpngkk81pmasknPEDGOe594nImSTek5Pg6AArPOHJBT
	Jt+fkXH7C1V1C9XHSl5cBZqLsZ8CwIOBsEk0WYkMPxAqOnEymk+E1wrFt+95uW+bqYVKo2MhyXk
	1tSieuVj3GKAQCZxyBsVgNeziWrl1H2sneZw2v9DQ+idE+9/d22ykjQFn3hKxWjXkii/YdbDFxQ
	2F1UXgByD3/B4EVFjBXo4h/E9s5sj5mEUtyboT4UxBAcFpZEE04pWMJwxWm6LD442dEdQCphMrP
	/uMXlznxXaxD+Ga0KeTLhGUlkyMMhEtD+/x1SPy4rVlh7EiYgrUn+NgK1wlyCQL3WAbouOhnVs+
	0h3H9UaROGzpr5mRAsGgU/uAnITnJVAXg6xecdXFJvz/DolLkeyqXNe1KeiSCDoy+UeeyoNASBI
	yj
X-Received: by 2002:a17:903:3508:b0:2cf:ca89:4990 with SMTP id d9443c01a7336-2cfde7be87dmr72267495ad.17.1785145661135;
        Mon, 27 Jul 2026 02:47:41 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59bc49sm31701585ad.7.2026.07.27.02.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:47:40 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 1/2] riscv: dts: spacemit: k3: add USB controller and USB phy support
Date: Mon, 27 Jul 2026 17:47:23 +0800
Message-ID: <20260727094726.890179-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727094726.890179-1-inochiama@gmail.com>
References: <20260727094726.890179-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add all USB device node to the Spacemit K3.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 13 ++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 42 ++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b89c1521e664..2a6d35a64d5c 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -182,6 +182,11 @@ dldo7: dldo7 {
 	};
 };
 
+&combophy {
+	spacemit,apmu = <&syscon_apmu 0x11>;
+	status = "okay";
+};
+
 &eth0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&gmac0_rgmii_0_cfg>, <&gmac0_phy_0_cfg>;
@@ -221,3 +226,11 @@ hub@1 {
 &usb2_phy {
 	status = "okay";
 };
+
+&usb3d_u2phy {
+	status = "okay";
+};
+
+&usb3d {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 19fc9b49668e..7863ab7dd308 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/spacemit,k3-clocks.h>
 #include <dt-bindings/reset/spacemit,k3-resets.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/phy/phy.h>
 
 /dts-v1/;
 
@@ -438,6 +439,47 @@ soc: soc {
 		dma-noncoherent;
 		ranges;
 
+		usb3d: usb@81a00000 {
+			compatible = "spacemit,k3-dwc3";
+			reg = <0x0 0x81a00000 0x0 0x10000>;
+			interrupts = <149 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&saplic>;
+			clocks = <&syscon_apmu CLK_APMU_USB3_PORTD_BUS>;
+			clock-names = "usbdrd30";
+			resets = <&syscon_apmu RESET_APMU_USB3_D_AHB>,
+				 <&syscon_apmu RESET_APMU_USB3_D_VCC>,
+				 <&syscon_apmu RESET_APMU_USB3_D_PHY>;
+			reset-names = "ahb", "vcc", "phy";
+			phys = <&usb3d_u2phy>,
+			       <&combophy 4 PHY_TYPE_USB3>;
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
+		usb3d_u2phy: phy@81b00000 {
+			compatible = "spacemit,k3-usb2-phy";
+			reg = <0x0 0x81b00000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_APMU_USB3_PORTD_BUS>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		combophy: phy@81d00000 {
+			compatible = "spacemit,k3-combo-phy";
+			reg = <0x0 0x81d00000 0x0 0x600000>;
+			#phy-cells = <2>;
+			spacemit,apb-spare = <&pll>;
+			status = "disabled";
+		};
+
 		usb2_host: usb@c0a00000 {
 			compatible = "spacemit,k3-dwc3";
 			reg = <0x0 0xc0a00000 0x0 0x10000>;
-- 
2.55.0

