Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.40
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484339;
	b=TvKVqwX4h9EBSyBst3xt7bVzzJqtjdpwjb0bGS4n17drzs3Q1qbcyVjgESHYNfWNBQk+
	 q6HxvVviynNRbGAOajXUg2kmfjpmns5NBXqin6lxms8pwh3h1xfu/3NshinmgaR38VvTU
	 WEKE0mLMJCiFydM+svhweZ/4b2o5w9EQ8vYeojCCVWcIalGjPyM3B9Mj9vYiCiiHly7ZD
	 +WNwhRLDYx+h67p6fI8D1K+V8W8Hi5SKJsSSrBQfz+ZcuE8Iw/sWY7SF4vmqQoarHGQf8
	 3lh6naL3K67RPN3RM+ylJR8u9zj8LRneDIBGB0h1f1s+J5G5cP8weaUASg9PaHOCnRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484339;
	h=DMARC-Filter:DKIM-Signature:From:Message-Id:References:
	 X-Original-From:Cc:Date:Mime-Version:Received:X-Mailer:In-Reply-To:To:
	 Subject:Content-Transfer-Encoding:X-Lms-Return-Path:Content-Type;
	bh=kV+ysOu+6F/RM1Ge8MteVU55Vww6sMy8zKEuNEbejKQ=;
	b=GHFpkl3GjEJK39I/MHaiJIuK/sVdsWdKD+x7xkhU1fdaoTa1m5u1Ehl+iAY4wavQEDwR
	 Je3HB1VsyX5GcUk1t6YXsjn+WeMTqin16wbXnqdFbB47qu+K4bL9ENItMmiT+75hEnbkN
	 S28bwphWZSjoNb3GOiMGPFVd4zNxtQjVByvUjCWIbuowCWKTKFZ0KPsitg//d63+ulhlT
	 kOi7bK7B0EDp/JLpLIfktp6Lcg5pFV6yX8VnTPjlY1KoVaf7niODoOICBIL4JtXNPvtF+
	 BymtuVz1v87ZVOv4cnb9telh/JoR1PT2SWQSRKRndQBXCyWBvnDSRXdcrthkDrdEh6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=FiLvyq58;
	arc=none smtp.remote-ip=209.127.231.40
Received: from va-2-40.ptr.blmpb.com (va-2-40.ptr.blmpb.com [209.127.231.40])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D33606A319
	for <spacemit@lists.linux.dev>; Tue, 20 Oct 2026 08:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0D33606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=FiLvyq58
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1792484326;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=kV+ysOu+6F/RM1Ge8MteVU55Vww6sMy8zKEuNEbejKQ=;
 b=FiLvyq580fFQCchZIbCnkjPzhgqv4WAQoQ1FEiLCPYEKHpYu486MobiCQ734/F5ulBb2rQ
 2l3sZuX5TN2zhqYHbcH/zGxxGk1lP2Ct6KApfdrE3JFqF1f7GW3TIykuLCHfTjLCkF97yn
 fzkMeIxnqa1tKMIzxMfFH5RPnw9ryb34/ObEFevMeeUu/Q+0iPeccgzJjTya9pX7zwPppO
 qL8F3iLP0vQ3o93EsphIUsSCAGjjO4WCu2f6HAdygv/8wwqgUyT17JpW0ifOB3X9VByXFe
 1KrmWUUmCIcaO5QuVt/EHwXKWyw6RAHUdinqT4Cjg3pmwM9kPe2CFvG8hxYITA==
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Message-Id: <20261020081831.3673722-1-sandie.cao@deepcomputing.io>
References: <20261020081633.3673704-1-sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Date: Tue, 20 Oct 2026 16:18:31 +0800
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([14.155.180.235]) by smtp.feishu.cn with ESMTPS; Tue, 20 Oct 2026 16:18:43 +0800
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020081633.3673704-1-sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Subject: [PATCH v2 1/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add P1 PMIC regulator tree
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+26ad723e5+5f656c+lists.linux.dev+sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8

Add the P1 PMIC's regulator topology tree for DeepComputing FML13V05 board

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 155 ++++++++++++++++++
 1 file changed, 155 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index b5d5112de358..804abc85602a 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -22,6 +22,161 @@ memory@100000000 {
 		device_type = "memory";
 		reg = <0x1 0x00000000 0x4 0x00000000>;
 	};
+
+	reg_aux_vcc3v3: regulator-aux-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "AUX_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
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
+	p1@41 {
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
