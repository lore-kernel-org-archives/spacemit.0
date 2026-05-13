Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8212C3D34BF
	for <spacemit@lists.linux.dev>; Wed, 13 May 2026 07:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778656811; cv=none; b=jV5UOlcIZH5jbl8gXxoSuh42t6c9LU/tuYwOxMhfAtXNFrEyjPF5ml7aFgyTxPhqMUXgxNCN1NcuR671/lOGiwU2I05deShWWiXoi3c0cgtb1RfYH0UnUK/sQUdOHI+OY7hyLF4Na0DbUEE+t5DS0izu8AJOWQAtRf/6ylJTRiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778656811; c=relaxed/simple;
	bh=uNSwcyUwEwn/AjpWiIsnTrOKx1GlTbDyhEAmHx5+bes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ltVB8T7BqA6pvfIVTDO6+XgsjQX0uiq1+igjOfAogaAGC47RSIHOfA3pMhgj3anE4kNRCBKA9oZg+OPr46UWquGTU3oQiNZOQ+keq4PZsWy78vNbwCu59KFnQBqUGRex780u9QQOnP9e7Y8xQgyxaozViwFaB1TcRAu5ecQn0ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PCn3lFgK; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PCn3lFgK"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so107475145e9.2
        for <spacemit@lists.linux.dev>; Wed, 13 May 2026 00:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778656807; x=1779261607; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TyIQ7iWPDNCyYdAg7Qk9EkFJ3vVi7O0lfN1qGYuYqLo=;
        b=PCn3lFgKPaauKCsi8hp/yugNhbJDZkDxvYFi/0ncUO4KcLPrlV+kd4qHW0kDfJEcyJ
         fAhO6/2gAhjJ6d5RtvNVzoYxBQw7pnoDQDtXmLQYPR2Nq5rAs+BtGFNA37v+PLrIlFxg
         AA61r4b5wOHCFUOQTNLQWl8ZRjTCql5nqF1W8JCH+3I+psjThZbRtWQmTamPJtDMeMyC
         Clik1tqOw1EAYSWUAthCeZYVNtXVYagYiFJE+Sxor8Yp4MqIjNNWCaH5qGan8y1gNONc
         20yo/QP+P9IdHDU+Y84sjsJhmQvNFCUc+p/ee7QlIDE1an+M1R06kXN8cqEjnDBKDdWe
         Wd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778656807; x=1779261607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TyIQ7iWPDNCyYdAg7Qk9EkFJ3vVi7O0lfN1qGYuYqLo=;
        b=S0zFEGg0Y4Cuc+C7UHu9+jQw8wZBgdZfGFt79bK0gbwQTCUcWEKr7QK4WhGxKhV3Ul
         ksKw1Q4JSjM14VOeLpHlFtCJ9xdySag+1uxD72oR3g21Sep0eXoldoQoO3fAgue43EE1
         5uSAr44OXjZIu6KqncGzRWB272HDVAt1b31YpCplRu9j2hp0HNulHq47Eo668Cv/n+ya
         2RnA8F/2ozzRFX3Uh5lqegpQnmXQz2iD3eXHOBug95h+zjF4KsdBA1H9t2Oc1grapSet
         9QbfoGVCz+TjVcjFsTI2s0VgS09cnOWd7Xl1Xjs9E4aQA9SW22u6tFy1GlOvrxdus02s
         D+bQ==
X-Forwarded-Encrypted: i=1; AFNElJ+adcCZljkQ60c3N2E6g2ckJaVa8FaGDHZkpZKrVrY4zPx0erdlxqhOt8Gi+mFsSsSgzKMb05DlvQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywz11nHF3AXvWE0pQHg8U4HzClo/w1kD0F9nq/rbvUChKcbxpAc
	qe47ylfhzed6bKbdUJ5tr2ZqN8D9gXQV26dawKUDVGmCKfqIgsGVTWZo
X-Gm-Gg: Acq92OEzoleh3IVTtUZujrqqrK9nrKdDR35G8n3Dl1LY6qod1w9UVhidDMqKSeYnBTf
	4rPRnTvKcBVLTI7M5OaAk8JUr0p0qSGnqmbDNtGq9iFTMBjwZ2N+v45YVaEyVB6QQGvxDSvh0Ba
	rvAgFnyusvYeScaMAAIB25cOAy+C4iqy924YWdNetu9emWjBHiko1g0Ns+SiiOqx7FS8ZpZfAY0
	pWlAgFuw6KVltf6p408a4JspU13XiyJ1EfSFaiSjz03xFBUU2uw+rn6Nde8b5NyNlY8GFKzsAoW
	FHC18yh0dL75XSr3utHzNfXaoTSdpKg6aJfdekPlYqzi/BShDuVtc+DAbHggJwBK7xTQiUuflnU
	7w1cD/uQdKLsIPpV4InL2ESMgueEeoM8cprNpu4km1mAsEPHdMA0WZ78OR5iQPSIMvUO/YL/QRt
	gOfp7ft9x6HvCyO5AlVYlNqbixtA5Y70R0OEwhkNWNl5nsq4JjriG5NhHOVlderE/+cQ==
X-Received: by 2002:a05:600c:8b86:b0:48a:53ea:140b with SMTP id 5b1f17b1804b1-48fcea207f4mr20153515e9.28.1778656806489;
        Wed, 13 May 2026 00:20:06 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d62422sm58498115e9.11.2026.05.13.00.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:20:06 -0700 (PDT)
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
Subject: [PATCH v3 4/6] riscv: dts: spacemit: k1-musepi-pro: enable USB 3 ports
Date: Wed, 13 May 2026 09:19:52 +0200
Message-ID: <20260513071958.29574-5-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260513071958.29574-1-a.heider@gmail.com>
References: <20260513071958.29574-1-a.heider@gmail.com>
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
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index b0f66f49db4b7..b24b378b1b220 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -53,6 +53,26 @@ reg_qspi_vcc1v833: regulator-qspi-vcc1v833 {
 		regulator-always-on;
 		vin-supply = <&buck4_3v3>;
 	};
+
+	reg_5v_vbus: regulator-5v-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "5V_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
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
+		gpio = <&gpio K1_GPIO(127) GPIO_ACTIVE_HIGH>; /* HUB_PWREN */
+		enable-active-high;
+	};
 };
 
 &emmc {
@@ -65,6 +85,10 @@ &emmc {
 	status = "okay";
 };
 
+&combo_phy {
+	status = "okay";
+};
+
 &eth0 {
 	phy-handle = <&rgmii0>;
 	phy-mode = "rgmii-id";
@@ -294,3 +318,31 @@ &uart0 {
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

