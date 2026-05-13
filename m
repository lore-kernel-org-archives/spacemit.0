Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6917C38B7CD
	for <spacemit@lists.linux.dev>; Wed, 13 May 2026 07:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778656806; cv=none; b=otwHeLVZNw8oKk8S5CREPd23CQs1HjTNzZG5EhR12X/jdPqnlB3bX3Et4HvnxNUev5leb08quR8AkkXTAdD2nZ5WzcnxxX1NmaITN9iiZq6LQ38nJpIznBVuSp4ZMiBoHAcd5E23G0dHhA+qCVkzCTEtUTdV4ixy6SRVuE95ruU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778656806; c=relaxed/simple;
	bh=Q9eLNePG/oRn7LdgnhZ+dJz78oMaxeM1LnMenEMoNFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pv7kvCUWyzfqlZOnZpPMwmINF5Hohn+E6C4yFdCNNk0RrUB5pF86kSsIU5qhlPdW2PNKXH8jxiy3+umzhKJ3JEpdiOkIm7ChkdJrIENYsBjppBWjjkx8F2HjKQAFn4FYcZ4QSWXkeZ+YFwoVQxE93lfV3DwL+EuvDFgxHCq0XEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cChCUarS; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cChCUarS"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488d2079582so66960665e9.2
        for <spacemit@lists.linux.dev>; Wed, 13 May 2026 00:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778656803; x=1779261603; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=krTwslWjVBfvmGfYM5PFKGSt7YkML+rC+mLvBW7WInU=;
        b=cChCUarSzBhhfd72bxKdyuXj5fmFv6GKFnNV5rSstSSJ9wCRfIiiuaovoyOP9rJ2UA
         7aJ6NZnHiFZSthGOW7rf6F/y/KUPjP66h223+e58y+VFPzh+jFIDbyJ9ohq0kXhZKhCL
         5UtzMg5+eLoh230R+clZjIpZiXIRDK2Weyqt6FfG0ipRHE0kngQDBz3PpSzqXbfyLGp/
         yQNSi0MpV1fNUmlf8zf2enZQELAoYwX4/GgTlrp0YbKKldfG+AeBug0U5GLfZXvI8mmH
         hxIczACyDerNZVfqrZfE8GptSIPS0y+/gjPMrWbc3l/4qgQ9p3mIhqkBgpfBZa6xlXg5
         BEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778656803; x=1779261603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=krTwslWjVBfvmGfYM5PFKGSt7YkML+rC+mLvBW7WInU=;
        b=I3cXqQOgc0GORMVEeaNE7EgfGNKbtAh8tPJ6LENjspO8kXXrqgSK1UK7mZ2qcVCJKQ
         WasddS1QXaMi4EcW96DZCmNrTMC8R5ifL6+rEeVXV53+5FnOrB6cPjjwjXH259Q51y0T
         aqDwX7T4TkYrAwgTYeVZbCiK3lXokeMbKgJyFaEqiU/wt1LfoSVbryc0zaSZKXtYxNIQ
         DceF22SEXF6TgiBq62iC84CdIsMBC/aX4NRcHT/sdh4LzveVOmqcK3G/iE4POiAa3nv0
         1rmZpu+bXarGP74kibsjyDGbgkvbGm1xqZLEwMWIpRKMJLec+JskVb1vXa4+58+TNDmo
         wtqA==
X-Forwarded-Encrypted: i=1; AFNElJ+/pQuSksEl0SZM/61Wh2ZFy7KrsaiBNlNrU2mtIQeCxEOUBIWLQFgp6DxYkGv7rTcZwTCow5vSig==@lists.linux.dev
X-Gm-Message-State: AOJu0YxHetCwNUk8Syvw/g5Hifh3M28BTNc/wx4urC7I+pvh3HoZ99Sc
	O3SULUUpwYCVYEcPksD2/3Ol3RtTNOplPfbPbBO4SYhEyaJdx1GDmpqp
X-Gm-Gg: Acq92OEO9nImwnSd9SjgMX6DoO3d89fejhW7O5XDxxa2fPqjVInLdH4Pevsqkr/HkA8
	MfWExeAuN9UgPFJhGiFhKht8CT4tmot1dBwOFbH16LyFMD+Q/1KHK6RzDTUS6j8nrjjZ+iMl93x
	wWJ1h7wIGl3t++RkgFOLKU3auNtKEVxQvO41mk4KXvkaGqacDDY2sDEShrHOyuTwGqgY6uJidUy
	+mUyzcrZ8YfvF5GgNhwOogYD5eXlhdv78f4g7H/kzV3VEPaAJtBdmGlHWbz3ujQn1cY9JuUe+lE
	2GOtB47KkUChEf7+F4Koj3u5GntDeUsrr0/a1kzz0/Qmb7QIWQ87baoRb+NZ4eKSHcsU3tOGqWJ
	qq71TwqrVG3h08rmmo1WSCy+0JHCk+/z3fc+Ce/VIQLYXuySO62IArayD0XTeMg+vn2PbBrDB8R
	vVNm4KcHKgALsDOAIqP2s3UxvntY4KcUsRLgF7o0V7C8Oc2Xx+2kjxhJrDt5IgLg1MOg==
X-Received: by 2002:a05:600c:c0c7:b0:487:4eb:d125 with SMTP id 5b1f17b1804b1-48fce9aab22mr14680495e9.9.1778656802391;
        Wed, 13 May 2026 00:20:02 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d62422sm58498115e9.11.2026.05.13.00.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:20:01 -0700 (PDT)
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
Subject: [PATCH v3 1/6] riscv: dts: spacemit: k1-musepi-pro: add PMIC and power infrastructure
Date: Wed, 13 May 2026 09:19:49 +0200
Message-ID: <20260513071958.29574-2-a.heider@gmail.com>
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

Enable i2c8 and add the connected SpacemiT P1 PMIC with its related regulators
for the board's power infrastructure and voltage regulation support.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 134 ++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 29e333b670cf0..e0b585c50014b 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -17,6 +17,7 @@ / {
 	aliases {
 		ethernet0 = &eth0;
 		serial0 = &uart0;
+		i2c8 = &i2c8;
 	};
 
 	chosen {
@@ -33,6 +34,15 @@ led1 {
 			default-state = "on";
 		};
 	};
+
+	reg_vcc_4v0: regulator-vcc-4v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC4V0";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
 };
 
 &emmc {
@@ -72,6 +82,130 @@ &pdma {
 	status = "okay";
 };
 
+&i2c8 {
+	pinctrl-0 = <&i2c8_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
+		vin1-supply = <&reg_vcc_4v0>;
+		vin2-supply = <&reg_vcc_4v0>;
+		vin3-supply = <&reg_vcc_4v0>;
+		vin4-supply = <&reg_vcc_4v0>;
+		vin5-supply = <&reg_vcc_4v0>;
+		vin6-supply = <&reg_vcc_4v0>;
+		aldoin-supply = <&reg_vcc_4v0>;
+		dldoin1-supply = <&buck5>;
+		dldoin2-supply = <&buck5>;
+
+		regulators {
+			buck1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck3_1v8: buck3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck4_3v3: buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck5: buck5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			aldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			dldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo7 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+		};
+	};
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	pinctrl-names = "default";
-- 
2.53.0

