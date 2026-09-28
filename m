Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32FE49B44F
	for <spacemit@lists.linux.dev>; Mon, 28 Sep 2026 23:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790637581; cv=none; b=oCcXLsF5MplkCuSFLeRdg+09g1gqxkzQQzB5S8Ua/QJoaX66ec5a9Z5DOVOKgXFkrZEjguVdPjfHcXVvbvc8wsVh8GhC3CyVPTJrETTBnXAhZoKFIQWa5jZVHqR+Jf9rghSC8SrTcy8CJGbutEfdY7hK7+LRrS2lShlk4x2LLdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790637581; c=relaxed/simple;
	bh=8zeoktIy+usUIFH1w4ionuLiRCFm3l7V7ss5bkINDA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=O7tomcsbqCFx5mY41uTC5ye1Yz0W+I5Z49lTdzFdY+NIgA3hfmsQQcFqDtso286bU6ExqT2jdHAOkIhSsqW6mfZjOj0fIICX0MDQvxzBt1KX/bErv58BEFyGPfxNLMTQwISn3YjxFbmB70xxEljEsxMZi9ZlZAVC6xtezb42S38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fgPg30rO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fgPg30rO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790637578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3yDoqQ26YFmJbrXP16xbG9Lltps7LHScJ0yfk3VKi1o=;
	b=fgPg30rOoCAIKvqz/Ya8c+V39WEYkt66tL2JJCUTHypGYdZDFBUQVQa69DS6PqfW8lyGL3
	fGFxWhcau64ogEYZBj7gw03wrGAyQU7iGWIszy4mbFBu5+TYxG1zbGRTZGXRNZNz7GhCNH
	16zzEh3rLqBt8C3cS4WkUUiphksRCpg=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-dK0BNb_FO1qGlgfSoN-Huw-1; Mon, 28 Sep 2026 19:19:37 -0400
X-MC-Unique: dK0BNb_FO1qGlgfSoN-Huw-1
X-Mimecast-MFC-AGG-ID: dK0BNb_FO1qGlgfSoN-Huw_1790637577
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8a847ac0386so8589087b3.2
        for <spacemit@lists.linux.dev>; Mon, 28 Sep 2026 16:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790637577; x=1791242377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3yDoqQ26YFmJbrXP16xbG9Lltps7LHScJ0yfk3VKi1o=;
        b=GuZ+1w/egfemItxILOIjC6avNaNylgMFPP8YrqHDtcgcHqbfmszPzribuHhi/PoHA3
         OWuUZL/95hv60ePBYQ6E0goP1RIBtDrU9+tY/AinPfTf9hRriHYtv56tPll0g3WQdKvY
         gASM5FtHM3XFXiijcdHMcCf/qjkPB1V0Z85EqkLVLXgXAObnKCJYn9FPsVxhycYUD56q
         tHp1xNMhZXgpeGwUdpezm2WtlZYKYrjZUbDJGmwBfUcTIRl2VJ6vtdGADKlBGoyWMT9I
         PS84xKU5hEhjYn5jwssbWfWOXGC8+HuQfaRwx5XBTP0xQP3DVjVPjMiDacmDPxPZ4lso
         shlQ==
X-Forwarded-Encrypted: i=1; AKwUvByDDTv5BihI1D9WMR/RD2Oafsi2JK/VnyvLIT3tkQWGRwEegT9Kmk4dywQDkTwZyZNiJTFxxn2AbA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLcKhemA06QQAZ1+uil/eykKa6CiS42z3Khh+C74E7w9e+eCxNU
	1JE2WZcCM/F44GkysYdJ8yyFWvtFqcd5nNENOnOY2RYWxMl6Q0KEFWGPK6JROPHNGZxyserRBhn
	nDLjLoTQ8kQrZGTfC8rUDVhmyzXd5brr50Avh0Z1iVKTVK0QMQleCbPmvUCjk
X-Gm-Gg: AYBFou2+HWFwO5vEQD4GgznyvXWDwKtTWnhZN11o2dDv79ErW6QvzXG3aIrtlUAM1+F
	M4tV3yzFjdNqz+uHStkXna0JYyXnA2AJPwKeESQrZchGk8c48yOfRhat1KZMG1e6N299+qryESe
	tpwlhNISlcQ2DCIZom8zikFz932dDEjqgV+kDzPWyVvrKppcWUe9U3ilHxY4Q5Z4FqNdR8rpMjf
	AA2pgGbMs8Ea6JzWv+eu3dRj2ZzVDo+CMT0Ll7p6E8MOnl0SH1jSOcV9ju9tF+NBznru4QT2Yer
	RooDeG0k29et/LZ2UppL8rvXHYnN8UvBOEyKhv8B0krzsvt1eZgllw==
X-Received: by 2002:a05:690c:60c5:b0:873:5c6b:a304 with SMTP id 00721157ae682-8a86d7e29bdmr40056187b3.50.1790637576967;
        Mon, 28 Sep 2026 16:19:36 -0700 (PDT)
X-Received: by 2002:a05:690c:60c5:b0:873:5c6b:a304 with SMTP id 00721157ae682-8a86d7e29bdmr40055957b3.50.1790637576516;
        Mon, 28 Sep 2026 16:19:36 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f9cdb0sm51374117b3.24.2026.09.28.16.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 16:19:36 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	James Morris <jmorris@namei.org>,
	Jennifer Berringer <jberring@redhat.com>
Subject: [PATCH 2/4] riscv: dts: spacemit: k3-com260-ifx: Add USB nodes
Date: Mon, 28 Sep 2026 19:18:05 -0400
Message-ID: <20260928231807.1757995-3-jberring@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928231807.1757995-1-jberring@redhat.com>
References: <20260928231807.1757995-1-jberring@redhat.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: opNECs5y6BejP7XzzIpG2ltb4FcVRIU3iwe6IfOdtfo_1790637577
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

K3 CoM260 IFX uses usb3b for a VL817 hub providing 4x USB 3.0 ports and
usb2_host for Bluetooth through the M.2 E-Key slot.

Signed-off-by: Jennifer Berringer <jberring@redhat.com>
---
 .../riscv/boot/dts/spacemit/k3-com260-ifx.dts | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index a5c08a7a781a9..a4dfa25c837fe 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -3,6 +3,7 @@
  * Copyright (c) 2026 SpacemiT (Hangzhou) Technology Co. Ltd
  * Copyright (c) 2026 Yixun Lan <dlan@kernel.org>
  */
+#include <dt-bindings/phy/phy.h>
 
 #include "k3-com260.dtsi"
 
@@ -18,6 +19,31 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	reg_hub_5v: regulator-usb3-hub-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "USB30_HUB";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_5v_sys>;
+	};
+
+	reg_vbus_5v: regulator-usb3-vbus-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "USB30_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&reg_5v_sys>;
+		gpio = <&gpio K3_GPIO(67) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&combophy {
+	spacemit,apmu = <&syscon_apmu 0x14>;
+	status = "okay";
 };
 
 &i2c1 {
@@ -35,6 +61,43 @@ eeprom@50 {
 	};
 };
 
+&usb2_host {
+	status = "okay";
+};
+
+&usb2_phy {
+	status = "okay";
+};
+
+&usb3b {
+	phys = <&usb3b_u2phy>, <&combophy 2 PHY_TYPE_USB3>;
+	phy-names = "usb2-phy", "usb3-phy";
+	status = "okay";
+	vbus-supply = <&reg_vbus_5v>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hub_2_0: hub@1 {
+		compatible = "usb2109,2817";
+		reg = <1>;
+		vdd-supply = <&reg_hub_5v>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&gpio K3_GPIO(53) GPIO_ACTIVE_LOW>;
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb2109,817";
+		reg = <2>;
+		vdd-supply = <&reg_hub_5v>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&gpio K3_GPIO(53) GPIO_ACTIVE_LOW>;
+	};
+};
+
+&usb3b_u2phy {
+	status = "okay";
+};
+
 &sdhci0 {
 	pinctrl-names = "default","uhs";
 	pinctrl-0 = <&mmc1_cfg>;
-- 
2.55.0

