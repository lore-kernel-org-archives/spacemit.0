Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA29148B38A
	for <spacemit@lists.linux.dev>; Tue,  5 May 2026 16:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997194; cv=none; b=d4svNBpHa4Huw5bG1qU+v2BprHVJAcJ0CSA+TxH6lo52hhclzmLbUWX1mzpRRv2E2/ul2H4OnnTfOxQSCEuF9n0wqeQOnj5/a7jjXIa6AuEiEiKVPFEdQ6CPBwuPjlFXMOdsPAKe+1vQwSy5foDfVSwD+P3WeHFGtK8qRX8Zl5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997194; c=relaxed/simple;
	bh=UX9TvseaOrqVn8GZy8hKrojLPdk3nOofrI1Vgc1wgWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jc5PG5zOPmRHiaoS3zSwxcj9f23td/x0fEoc8KpMwPdLnR1qrYu1Qv5CpikbBxDEWvJj326EfoMMiEkPmGKxLLjxCzSOuEMSBwDXUfLM5+iyw9G0bFP+VJ86tw/he6nlZRNAg7hMLdMA2sV2hkPqjBQR9Nt2cggS+T+pIdmhNrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZ68RNYM; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZ68RNYM"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bc2301be8ecso387809366b.3
        for <spacemit@lists.linux.dev>; Tue, 05 May 2026 09:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997191; x=1778601991; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFVRK+/tJ5TyBkXs2ToW3IvAArIzFRTr/jPdIAnnb/Y=;
        b=SZ68RNYMzSBfEwSnKIjxXtGleQ+jRPa4VJD5Q2ZU6A6loLVoBbPYFgmxiOz4P5X1Bz
         QK5JsIn+87OGqSnADUgLk+ZFcbLNWuxUEAXPa7eLfhHATT5m3d+jeF+5Y458Ttujqojs
         nCk4IiE07tDzNZ3N/Eomv9Jgj6meIJz7kjoBTh6SSkySyKhew2HWaKZJBH9HGMRDSJXE
         e/CvF4ExoNY0vtCxdxNJzd3KEDyyVLI+4CkKwYrAkyVWEZNkWmpwrpxhoE1tOEDO5bHn
         x4tCwflV/gIxZK9GS+pne3UVtV5YeeC90CQZfbMxIQcIU/9b3c96eWr08rexadUSstsR
         KeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997191; x=1778601991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uFVRK+/tJ5TyBkXs2ToW3IvAArIzFRTr/jPdIAnnb/Y=;
        b=QLskp73py9C5+5wQuvbzaKxYFc09iWLWY6sswco38HkkuK/9WjUuwyoFCYPVs+GzMk
         MGNBaJvo6rwgfnlFXXHKGrI38h9GNVFIZlXicrtEWvXf4660bEcSIroQOUjeB6VYO9Vj
         7h2glsnEv4GyplxP3SuKRxIcNaCbYeGhdQasMMpBIUJMBKaC6DVRDNQYvd1O/LD6JUZz
         vsCgh/h9D8EhMphxFz+dWKYUHqnhgAvE56YfYDdjw9f0vFSe/Z9A0DFrYdYW5P5sgqk+
         np0ax1K1OADPyRTkdcpy7XoR9csvdvjzsB3P/19XoUM/1umRd+1nlCd5AJyGkwSDbKj7
         BiCQ==
X-Forwarded-Encrypted: i=1; AFNElJ+A/BVno2zvixAdNy/387tA8y3kPvQ1Xy1tgHfKdtt2YDlr8LpY/tqOubqyZ4z9FydJRK+PmHXBzg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9SJS3Hyj6nvNtw1cC6FabHVmxYmDYfv+sz7WqayM4OEdVCi8d
	2LmubNLvCCc5gLRNFXUv0JdVESgwQebggQZbBRydlQyTBdvklStnRN2y
X-Gm-Gg: AeBDietmYqq95yJBSndnxV+IaSFTKlqntSwqUsHvBYH0cVV599k0m/lDXK+cBaqHz49
	NeYnvq75QJuDuVAv+7eo3/EfPgrQxn9UREzgFelAQ3HZKHyCgctHVDE8OzsTPflYtWvr2siprqW
	+oB+2EfFvv4K9RP+pCiyphpbLvDAtwy2DeC0e/jKCWYOZqnZkQ3CbAsxLdbm3X5AGM24yTKE2JT
	Pb0mZLbPHk2iCQlyVTHBHG3d4m6LJmiIq0mMVo9gYEypU2bXvoe0ZhUc1mLXQFLwLhmjLbrlrQe
	LS9JC3bg6Os+0CkHbDBpN4AwGOagnULW1sZOtCHQAlfU5NgX/R6r3waaz7yps4LiBGAS8TMThLF
	59bAiwC1U1hRa+/FYF1jT10vmE211vn/CvhbA+L+hrOUPlXjhkwpM+6bHE3UNwn2KTo4jA9ET3L
	ESW42J71A8axce5VQViB0Uv6mjQGXOYBQzH0oYw15ic/8S2l+ZDSfeQGdynEfAql/iVLEtyABmR
	PizR0k=
X-Received: by 2002:a17:907:868d:b0:b9c:b069:8ab6 with SMTP id a640c23a62f3a-bc40f43860dmr230618766b.7.1777997191045;
        Tue, 05 May 2026 09:06:31 -0700 (PDT)
Received: from mamamia.internal (a89-182-137-143.net-htp.de. [89.182.137.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055d36dacsm5398891f8f.32.2026.05.05.09.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:06:30 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] riscv: dts: spacemit: k1-musepi-pro: enable USB 3 ports
Date: Tue,  5 May 2026 18:06:18 +0200
Message-ID: <20260505160623.1369347-5-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505160623.1369347-1-a.heider@gmail.com>
References: <20260505160623.1369347-1-a.heider@gmail.com>
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
index 32599082b3c36..869172d23e259 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -54,6 +54,28 @@ reg_vcc_5v0_sys: regulator-vcc5v0-sys {
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
+		vin-supply = <&reg_vcc_5v0_sys>;
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
+		vin-supply = <&reg_vcc_5v0_sys>;
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

