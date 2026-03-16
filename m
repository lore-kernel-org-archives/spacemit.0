Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D2639BFEC
	for <spacemit@lists.linux.dev>; Mon, 16 Mar 2026 14:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773669882; cv=none; b=BqKPwEwdML8nlJH2Pvf333xx1dlwx7D3CGTIKpqDgIRNeWlGNeua4ZEqCRNWeNTolff+aqURLZ0sToiPjqX0dKjW1AC6AgpXJjpnwinAslg9LwxhI88R8kZDGYJ2r8DUb4514gqUXd+PA4/UDFYMm1bjDPyhImg5uSGhsG4AjZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773669882; c=relaxed/simple;
	bh=TMuC+r//YMxau2/SdiPrZPIigFg5514fOWLlzC/iIWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k2xdFSoyy03tYf+lMtrSXT6JESgjEHkqKOvgZDVL4I6gOZ9LXxak0d8s24EqnYY5MSh67mSqA/OaY/MQayJr3JqvwhRG3cnJMe4TFV2q6MY4xsKMd3Fg4Dmg5Yygunl6lYNgLQXmc+waSVNHXxTv35KaDuj5BsX8wH1D822XOFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDm/5QJv; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDm/5QJv"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43b3cfc38edso1952425f8f.3
        for <spacemit@lists.linux.dev>; Mon, 16 Mar 2026 07:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773669876; x=1774274676; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bzdLQZF+g4qVulg9JsUgV+5Hi9wiigjRN7QwVdQTPwc=;
        b=gDm/5QJvb5ywRHeMQdTsE84dQs1+7xkH7RqnVg+CTJtYx+d3fhmn4frCxEUs5eJEih
         LIcgc0KkBxWnWbYalAfQH/Z1OPD0FaSqaWvWU1bCznxxcBfZRPsIy708gSKrNxwT324y
         8mZGuRul/twwsqidTYZOgnAyKaRMmvtL8V0cZNfS3q01Nq7pi7HAg8tAnKivYjDR+7Hj
         ulr8eoK4MAxI9ZIYgX/nQeEhY49vM92OI6PHNgteMDIwGsHMjo/xenXecEkr20LTSt4G
         dNrEVswJLPIowmx+/gYw+M8QaXOmGZ5Lx9C8PduSNs/gi24vzfhjNjjvAdl0xfeXVBie
         RWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773669876; x=1774274676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bzdLQZF+g4qVulg9JsUgV+5Hi9wiigjRN7QwVdQTPwc=;
        b=pIiVUlLoCsJjne7VyoI/QJMo0F+OaHvhd9xMJjC5cm+S/la/Ono+tan/woVNiU9bjU
         VeyLuA/WIDlz4IEsyOKT29xWh6cSUiokRF/8kCKLj10PL5EPr/lV+37eJMxvn6PAv4r4
         nl7qm1kO6F1qnDbE7cYdQ3pveC1kI2qQBs2/E29dKZJqKxO3XXPYzja4hEKEsbd8xk1I
         AFkeJaHZWCAp5IjjxS9WuHj0PahasufoKeIMaKF2Roz1AvLPYBlRwYSVJ1sfhgopCa4+
         pUOhVdRNTSR4WeM0NSowY5lOTixfZt7b9qWJiUisNPh+lwYM7jKGmEEPmg4j2mbBcPTi
         uVsg==
X-Forwarded-Encrypted: i=1; AJvYcCUL46d87RYg67lEiiNL4bIXjm35stE66Rk+/POs6Mgzc15hqR/wfviyH0anAmg54nQkUIt9A1/tkA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxh/eNlsNO9aPcLULsckZvU/7NA4fD8dwJmS190ORmqW0cwDYAr
	K+pwQNEFzcBIx58Pc//cHY8Gy+Z4zZYRkxAd57rpARCdzRZ974CmACl6
X-Gm-Gg: ATEYQzyuabB8nDfwhH5w444YrHrw0t2T5Ql2JRoQ3AKXA8k6+DVlvz3nPhH7Vi0XzTH
	rl1vjrT9yA8ccEC53htyQGzo9SJ1F4/vH8t8n4rKX7r2F6TxNFQCzLRmZYdFZLQXUptXlyn7bZ8
	IOgwMC5C0n5ZmsSvLmkNtXZuGO/CL440KaTYbxy7xfu6SDGNvP7QcNrgAKGsFZr3ctGCWvoPwHu
	pMzgwiS+P2bjBidNzpNSLgcbiCCKQGmbX5AEPDNcvl8TdAzvBYw6JjH/Ssto373zNSC1IjEA73z
	KhZDaqPf+tDlZ7CHz+wHqCgaDwNF4/qJwrP+pgckX0xOu3UuSxrFQqQhBOXnvM4x/7G9GTyKDfO
	aEQJuQQP3VZRgkEEbHTSo2oVDxwlpA1ZgoNlcbbjy6yoOLA3hLDWyuxTOaCulRIF+y775MgJF32
	J2/9KX+T/19cxCJ3y7AAE5m1hV3M39MKUGD3UFRU3c4ELeD8ADDDs9on8tX9GVJH6/5qkkxwGyC
	kk=
X-Received: by 2002:a05:6000:250c:b0:439:cbcb:5723 with SMTP id ffacd0b85a97d-43a04dc083emr24515986f8f.42.1773669875968;
        Mon, 16 Mar 2026 07:04:35 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.234.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b3a09e453sm20698725f8f.0.2026.03.16.07.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 07:04:35 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 16 Mar 2026 15:03:33 +0100
Subject: [PATCH v3 5/7] riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and
 power infrastructure
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-orangepi-sd-card-uhs-v3-5-aefd3b7832df@gmail.com>
References: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
In-Reply-To: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>
X-Mailer: b4 0.14.2

Add Spacemit P1 PMIC configuration and board power infrastructure for
voltage regulation support.

- Add board power regulators (12V input, 4V rail)
- Enable I2C8 for PMIC communication
- Configure PMIC with buck4 (vmmc) and aldo1 (vqmmc) regulators
- Set up regulator constraints for SD card operation

Tested-by: Anand Moon <linux.amoon@gmail.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 48 ++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 7b7331cb3c726f11d597f81917f3a3f5fc21e1b9..f1533c99881dbf38e16cff5e91e33253cfa7a56d 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -19,6 +19,25 @@ aliases {
 		ethernet1 = &eth1;
 	};
 
+	reg_dc_in: dc-in-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_12v";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_4v: vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
+
 	chosen {
 		stdout-path = "serial0";
 	};
@@ -92,3 +111,32 @@ &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	status = "okay";
 };
+
+&i2c8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c8_cfg>;
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
+		vin-supply = <&reg_vcc_4v>;
+
+		regulators {
+			buck4: buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1: aldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};

-- 
2.53.0

