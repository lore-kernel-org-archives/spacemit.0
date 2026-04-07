Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78703A6F04
	for <spacemit@lists.linux.dev>; Tue,  7 Apr 2026 08:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775550374; cv=none; b=sYk6jhkz4zbtZJOh3DGwaBOlqb+zLEDCsE91vNz+5uVlYyPBoQ8OqTPGJmwFqiLL4h+nmqoMSMqoY9ytwmI1TWDBpZ+Ew/xljESISuGCOFeyy7ZlAMx1gHZt+WY9Y3Fkv24o+eNdAmMIsjiZ0/tJPR2xfHpPPZbbW2T5Oxjf01A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775550374; c=relaxed/simple;
	bh=mH1spPeTCHz8roINYMnma7FI82vi0r8vKKTb06yrJYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fr8xsq0Dn+ku5YXOYATdqCnKwx+qZQVOSYwLPlkX5JIFbLz+9X72HoER5rotqxiSr+3jfBWwQlhdiYqkF3bZSEutqm0NLmvvycd2VG0J70WTM8/szqYVNQVxhqW090QRjQAAsoO0K0dLByO/vMwmFRxaTqH56Utg9S9nqobzVlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akKSOlD8; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akKSOlD8"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43b949bf4easo3681651f8f.0
        for <spacemit@lists.linux.dev>; Tue, 07 Apr 2026 01:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775550371; x=1776155171; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MilkKS52ju+/z2QrTRIvbE7nHZSA0fcfW7w+lU+2hFc=;
        b=akKSOlD8vRmRhkoPGwu9a9IJaFnff0CG8wAeNZ14mgE659kToeDJNJf5l047Vj4DjW
         OvJXjqkJWLY3lLyWnuUhrMuPa2T45/2+Cc0R8TPCyF9w9BR/AwofWa5Hk8+HKi77uIhz
         XJ/gMDEnD/c01NLNFb284MkF1EKjqRxqcx9wWgvP5pLDCD5apEVzeaXpf4dJR5Wm8gli
         hfd90roeWj+7Ty2bXfdrzc1fUpsNSMN36ZPbtt4gF/h7IE8HwsAnIgCVPp86A3lnEfQj
         LnRmuuDBeFGPt6hJIZW8fzrZw0fpLuKkElmbmL5c8FCjoy3Qats6bDtKvc6xNTzTOGKX
         Izeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550371; x=1776155171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MilkKS52ju+/z2QrTRIvbE7nHZSA0fcfW7w+lU+2hFc=;
        b=bb3Y919jayAgcDnbBR2MjDWPmiKz85JrJBBu7/NetcOLzQHjZWWdHRA/cqMVGYWVJ3
         0MloJWnp2B88+3/nKVYsI620JpeT41ANjGUldYHEc7t9U2wmumf+nH0QPknf5LJb7jKW
         kdT5OtMq1umcrTLYWKOBClB0ymyQhGgGVUQSFKIYrpCIB4XrD2iWHjF/ebmVVATrc5A8
         F/lSA5UL0LvSC4t9bpt9qgPmFiZxfu5ivjv2if+8+Oc/VM/CCG6GjG6IjEtp8aOO3Dk9
         yrOa5fRjgvYurmRgoz+tKRpzWR12Etf01Jhju+VSr16V7u8IauGiXl2CrzumWPiKdlQf
         bJ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxSzaY4F5q8HeTjkbzchhFaEOUxBp/MYoZVCx92jBNjJf3kOFXRo+r+aR8vpkQ48qa3DPp2fydIw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+rm9XG+y/rGu0xIlFZpKpg0keEwB92vN92YeKzmWFSrf5u1q0
	vhFYSg4w2RSELF6TC8Xoheb39jz0kLcH+SnClOO/vkV3GjJl19sjnaW9
X-Gm-Gg: AeBDietrTE+7YLM7Ad+2jNyHnybTxbEeq4XQn65NFyq560C/QWkTg3+4vgT826PRz1R
	ULmCDCJzOGLzCA48pCI46IeUPWNWHoGtgbIZ18Wi/NLxpAZMVsf3ezGV5QhmjoA8l4S/qzMPSXB
	F4j5X1VeXqrCfV6JVbDRKxFuEZoRiz5rk01wiOGHyHPOVWGI9N1USAbKZr3CYDRCuYHjoWnhcmu
	0s1c2986kq7hIKXLGKIYONh4/rib3l2PcqZ+PXlZRcZ0I1sw3Gv5UFiEEuNe1GAR2D3Ptn2usHM
	JPK6BLtw8hvXHOXPUWcrUPysmrTRH+jR1K1+bh4IppZwKqyiomDyZUMylQ5cjyW+M5WsHGHA1VQ
	UszmUSHuM6M/TWAyJdO2j93zM63VCKkN6ZPHM+NptfnWuN2Nl79O/8nR6JghSSWIo4+xCVIcTlo
	NuLVY6EATALOo0kLsox0mYPXsb8o1iiv820AIKq/EnO/MGb0eL/2qNgT6gHbmwi9A6
X-Received: by 2002:a5d:5d0a:0:b0:43c:fac5:d382 with SMTP id ffacd0b85a97d-43d2118dc50mr29229253f8f.12.1775550370963;
        Tue, 07 Apr 2026 01:26:10 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm48669958f8f.21.2026.04.07.01.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 01:26:10 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 07 Apr 2026 10:25:26 +0200
Subject: [PATCH v6 6/9] riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and
 power infrastructure
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-orangepi-sd-card-uhs-v6-6-b5b8a1b2bfc8@gmail.com>
References: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
In-Reply-To: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2

Add Spacemit P1 PMIC configuration and board power infrastructure for
voltage regulation support.

- Add board power regulators (5V input, 4V rail)
- Enable I2C8 for PMIC communication
- Configure PMIC with buck4 (vmmc) and aldo1 (vqmmc) regulators
- Set up regulator constraints for SD card operation

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 48 ++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 7b7331cb3c726f11d597f81917f3a3f5fc21e1b9..9c417a483f6bad6e60617cf8d5400ca079588726 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -19,6 +19,25 @@ aliases {
 		ethernet1 = &eth1;
 	};
 
+	reg_dc_in: dc-in-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
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

