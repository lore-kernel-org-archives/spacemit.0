Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794195184;
	b=fYXIVVYYOGmKFhmOooPsUQjDuib4BxcSBrdVQst2UQld3gyWpA+SgsCmyh9Pcay1aFPI
	 CsY0JQ53yJf8BWNZjBkU152DSzT91w4sDHSF28YD0KvCjqCOKtcMqBnoFhEJoxsHUTOo7
	 uKPYlxLqdTl5HZlJ8pCrrtG8hMSfYxQBp7elh7GO1AOrif8iIKL139np8xEZ8k0WS8hCR
	 WtRkbi2joKbCsMRI0sGTxeZp9G+p39OIoPqq55J7Em5di93QXpPkqd2qywmZPu+M0H8/a
	 AWKOK5MRYWuSMQLRprmjE1QhzE9eWr7YLZ/CNWn3o6BQNLgBUX5xDK7G4XZla3RysfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794195184;
	h=DMARC-Filter:DKIM-Signature:Mime-Version:X-Lms-Return-Path:
	 In-Reply-To:References:X-Mailer:From:Message-Id:Subject:To:Cc:
	 Content-Transfer-Encoding:X-Original-From:Received:Date:Content-Type;
	bh=PJxndX0XDADBhoVnQbXUa2d6kB9IkQ9K2h0BNMt2SW4=;
	b=ghbmIaOuLq+dunCRybuzp053ETOg4I2l3mkY52NpmN4LdnJmnnennGie9N0wwaz+3K7G
	 u0Zu63gcsXS+WmmYukYPn3IAeYi0qfOaEnKBt43lg1iFfsESFXDY7djnn4qmJ9wZSHr4G
	 goB+OXI6Z/sY6B3rHBtaGkiYsDRGCMmZrj8b2gSzn/zpGFFQYdwIn2YaDPbS5ySXSUGzC
	 RHXF+dtgpsbnHsEYDin/xLvOptM4kb9EFyDE1BysOtK7Unv1E2LHsvHxhoMsTYAJuJAPv
	 QET6gEBMQVF7pTJ1Pg8ocGdhYCL05poHJH4d2CcG4sO1b+C7gnhi2XutWZwkqUrN/WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=UXyyR+zs;
	arc=none smtp.remote-ip=209.127.231.36
Received: from va-2-36.ptr.blmpb.com (va-2-36.ptr.blmpb.com [209.127.231.36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85374606A33B
	for <spacemit@lists.linux.dev>; Mon,  9 Nov 2026 03:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85374606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=UXyyR+zs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794195178;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=PJxndX0XDADBhoVnQbXUa2d6kB9IkQ9K2h0BNMt2SW4=;
 b=UXyyR+zsNpKPq7/jqJN4IDe60dz0NJSD2+cXIQQDAH6mmct9Ob6L1wUIgYSGT15k7bSQyR
 IsCpNpL3VaVkScrY2WnW0iHjdRqtiOAVCW/HRAjWdJYHPng/G2haW8GerV1SQgHdcTFF1n
 dzOCtSSl2r0CBb4m4h2tT1taojUt3v6XQ7kU0wE0ze/XFbDgFez+roFOU/OYmX0LFUxAI0
 5t4+DfYTj4YDG1n/9QMBiUWBvXeO4z7dTds0U952Xgtk3ieUFh/iqbxcsYp11IYzAFYM/4
 FaJevjHJFGKSGfoWsG5AlWxZeJ9ETt0PsufAEzDcgkEdIELXfLn/nYVKpAp7Cw==
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26af13ee8+df8850+lists.linux.dev+sandie.cao@deepcomputing.io>
In-Reply-To: <20261109033154.361399-1-sandie.cao@deepcomputing.io>
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Message-Id: <20261109033240.361416-1-sandie.cao@deepcomputing.io>
Subject: [PATCH v4 1/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add P1 PMIC regulator tree
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([183.23.98.251]) by smtp.feishu.cn with ESMTPS; Mon, 09 Nov 2026 11:32:55 +0800
Date: Mon,  9 Nov 2026 11:32:40 +0800
Content-Type: text/plain; charset=UTF-8

Add the P1 PMIC's regulator topology tree for DeepComputing FML13V05 board

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 148 ++++++++++++++++++
 1 file changed, 148 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index b5d5112de358..e061233c15a3 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -22,6 +22,154 @@ memory@100000000 {
 		device_type = "memory";
 		reg = <0x1 0x00000000 0x4 0x00000000>;
 	};
+
+	reg_aux_vcc5v: regulator-aux-vcc5v {
+		compatible = "regulator-fixed";
+		regulator-name = "AUX_VCC5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+};
+
+&i2c8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c8_cfg>;
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
+		vin1-supply = <&reg_aux_vcc5v>;
+		vin2-supply = <&reg_aux_vcc5v>;
+		vin3-supply = <&reg_aux_vcc5v>;
+		vin4-supply = <&reg_aux_vcc5v>;
+		vin5-supply = <&reg_aux_vcc5v>;
+		vin6-supply = <&reg_aux_vcc5v>;
+		aldoin-supply = <&reg_aux_vcc5v>;
+		dldoin1-supply = <&buck4>;
+		dldoin2-supply = <&buck4>;
+
+		regulators {
+			buck1: buck1 {
+				regulator-min-microvolt = <1050000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck2: buck2 {
+				regulator-min-microvolt = <1050000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck3: buck3 {
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck4: buck4 {
+				regulator-min-microvolt = <2100000>;
+				regulator-max-microvolt = <2100000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck5: buck5 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck6: buck6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <500000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1: aldo1 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			aldo2: aldo2 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			aldo3: aldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo4: aldo4 {
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo1: dldo1 {
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo2: dldo2 {
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo3: dldo3 {
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo4: dldo4 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo5: dldo5 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo6: dldo6 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo7: dldo7 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+		};
+	};
 };
 
 &uart0 {
-- 
2.43.0
