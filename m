Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C003D3318
	for <spacemit@lists.linux.dev>; Mon, 11 May 2026 08:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778489685; cv=none; b=pFffT39MUXdCZnvAFS3ghQD7FFeNe0qQL8FjibjYCCLZYabpmID4ZWT8UZZAGw3/tsiat40g50c3UW1o6dqSKRqI8nITLXwQPHMD+SzI9VZVjQDO6rHum3OgSMmwpL034ufyveuk2XIEXar4TzAwQfjrCaYOuYR+0epHOkxabck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778489685; c=relaxed/simple;
	bh=qWfPi3P6okakNMl35wSrQSu4TCMbhk88UU7A4K+g+ks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fmN/x+Qu0IRnEPHYIhfVU2Gf7sNgDsCGRMXwvcwJBFp43fKtz0ZAUlnSarnC2ajdzT4Eu/8S7a25J8/afYc14JOfeA/zuJcwX6lC2RpW0MWmnbTB8MRO5Mgbwq2JhTMBbq36JED0XSXoF+BKgYG7mCEBvxl/W8Qyr4dkhMej1eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TtuYEumj; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TtuYEumj"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-44985f4ab0fso2253291f8f.0
        for <spacemit@lists.linux.dev>; Mon, 11 May 2026 01:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778489681; x=1779094481; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4H6GewK9XOsCgFQsCNGKQNCNtvjUJJHPrHSaFKR1jE=;
        b=TtuYEumjP6E7cUxeM6Nz4IKMS3S+sCFadhO+FUPkmY2UxjO3Bw/e7tXQzuyblWav8d
         XnaYD4qimrJEy9g0squMfotR00b0Nj6zzUoZSW56iCg4cZ1sVRl4gjsBp3tWcArA2DBq
         L7ft+7AwL14eEs45o8OLnjV3a2fe1bQ0dohMdpHxYj9qH8xSZ1/SuNk8Uc1ssJHi4u7/
         VBlQ6AQMg9MIhLYhnOcomSx5tUYAyKyHLhtu3HTpieZ77j4uIHjbGy10d4Z/uz7u7RN7
         Hjqsv/0f+ffYBjyl4GTmiABEprRNSDvsPifIxhY3aUf8RbOMZTOixSgOXBll/5OZi+P0
         c6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778489681; x=1779094481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f4H6GewK9XOsCgFQsCNGKQNCNtvjUJJHPrHSaFKR1jE=;
        b=Z20Iu6L/xZ18OqZvVVR3GyhN7CEM9W4LnQAhgSs7R7V51KdKcKjj69mX7MHM3n7hd8
         9L/n3KwuWpGogdNIzHFVgdbJe//HJ9baIi+m8k5lTu4O46E/qHsoszX31jV19WIIo8YU
         5iNYOPZonMCptfmooJzOq7n9ga0PMqYaZcH8O7SJsJAsSVo0evY3Y6EFVAG3Z2OiCTjT
         6Netgsv/RhVtbfP1Ulf9CzewCBBer0aHA7Pu2JX42FYt+Z4YwzOf3T1WPBEW0O0inPZI
         Xe3Dw18wDI57bevXUPv+Dsc+7tqQHyzEIDg3xr7H4hzkFWFi2F5Tss0DRJ+aKbI1bOoU
         3bfw==
X-Forwarded-Encrypted: i=1; AFNElJ/NVIEIqE0iGkkwB4ZD7SKNjeiZX+8vBi5aTjwOI4z2eBY+soRvASSWmowDxVCpJoXQN7sHkGBRgg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywm5BsOAGv61tUP/TuGu9Yht2ezHK4eIFx3A1ENy2/6xAbey90d
	VRt1K0fEew82OdYsZ4Ap4QfjVAxuC3tiVYZdl5g0kR5/pZEYyCWdIJ8H1bXjqQ==
X-Gm-Gg: Acq92OHh3LhOamdBF2FZdo1SjiNdkAm/MjPOdqJva0emXwPxipQd1eOaEw0pPSbiMPF
	Q2PPaqjqcZSr5IoKrRQJEzdyoebq0npyJEy/w0cntkQcI73zjtyNzjWik+0OBQ+90W6pOyHV3PH
	XIh4SC9YRRybpzkmyOzgYpsg+g9CtJaaTrt5rI9mv3WbyHcdeyHG40lBgUr6/mrhe3GMAc/5iYA
	28cbNWyOeIAonAbEEOk8CcjAGMLlmq+7Hb2sanba6/m9kTET6pfOV3VdyODIHq026BjeN93Ngxh
	l0bF3dy5ajkpRacXGu6B6iokBhK/WuRjfMgQR6GvNVZDQUf9xKiwaOnP82QgeZ+q/zjRmRiovuz
	5Io6mvCTK5tuxGek9np7abnsgqu/ek5BPp0/PYuus2KlIQbFVeQ8oEXjdCSF8lUgy6+KUIVk4+H
	WUMqofKkvZ6QEi3my3ajbXOIrXCV2fQJ1e8uXVKEoc4Dqpzj/DrG91ihs4gLXUyFEzkA==
X-Received: by 2002:a05:6000:22c4:b0:44f:d9da:2c40 with SMTP id ffacd0b85a97d-4515cf125d1mr36512294f8f.21.1778489680789;
        Mon, 11 May 2026 01:54:40 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.237.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491ca2fd6sm24944189f8f.30.2026.05.11.01.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:54:40 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 11 May 2026 10:54:03 +0200
Subject: [PATCH v9 8/8] riscv: dts: spacemit: k1-musepi-pro: add SD card
 support with UHS modes
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-orangepi-sd-card-uhs-v9-8-ae48c0b2b2cf@gmail.com>
References: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
In-Reply-To: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.3

From: Trevor Gamblin <tgamblin@baylibre.com>

Update the Muse Pi Pro devicetree with SD card support to match what
was done for the OrangePi RV2 in [1]. More precisely:

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with inversion
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes

[1] https://lore.kernel.org/linux-riscv/20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com/T/#

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 66 ++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 29e333b670cf..774a4640f065 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -18,6 +18,24 @@ aliases {
 		ethernet0 = &eth0;
 		serial0 = &uart0;
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
+	};
+
 
 	chosen {
 		stdout-path = "serial0";
@@ -77,3 +95,51 @@ &uart0 {
 	pinctrl-names = "default";
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
+
+&sdhci0 {
+	pinctrl-names = "default", "uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
+	cd-inverted;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&buck4>;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};

-- 
2.54.0

