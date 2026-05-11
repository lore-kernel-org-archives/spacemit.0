Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376621E633C
	for <spacemit@lists.linux.dev>; Mon, 11 May 2026 11:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497883; cv=none; b=ImXTzxTM7Dit80Elc5QzYg4dRWkAYHf/OItASsYjRXnv7+eGh5u3o8pdA4ju3HpKTc44wlhlldnYpKxbRhk7Gj16yEwT2CVe6QcDdC0HQycsgu5j+y1CcTDpK3kwrZ8ct1bKStUKyRTdKvcd9kpNxzTVmrdRtTLpjb/UBl4bmts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497883; c=relaxed/simple;
	bh=gs0Y2Lbcv1mmKGEWTiw2jaiqo/77zhkqJu5nGMoodxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V6HpK/tmJzJudXop0NPOZ9pksvTRgYR3XEPITqHOhK5gZaYhUwvaug9gWPl/Cxl+6p0DQNTqAMjS2RdkItkw2ci8soUfiE17zNc+7AeDduhZfCKza4PR6EqEtjpCOpGkACP/otzWY0TB45x0hbMEXrBl0rlbmJd4/mreV7XwgI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iExWkqh+; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iExWkqh+"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488ba840146so36919445e9.1
        for <spacemit@lists.linux.dev>; Mon, 11 May 2026 04:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778497881; x=1779102681; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtTvf9vsfLePhnbh9KXY1gq0CLeR2YIl5j5cO/hpSW8=;
        b=iExWkqh+IllSsbGIC/qy09ir469sBoDip1IsIcCur40zbIg+6hzU7lLKL9IG+hU8kM
         Zpu5aD6T+gVj+Frs+wO71K5ssP4YVonxw3CP/npKRvWaki4WNveyWHTAfbEzg3BYxBLa
         9xG9Soj5f54yzOJ/J4TDLm2NM1bKVf5Xqq/f1ZAHm8ZWtixYVIVRDF5ot0NTVdnkjL7+
         N+Drn+gtykWfh+Hc8vE4es6mn8P72n+e99keP51ZfC5luT2RIwF+2g0NvxtE+3qUt44Z
         67NKY/Dpz6y1g6pYMOZhvjBkrIObuCaogFmD25iHV9bvJqBNxRg6yx9HIgWLBU+ib5Hr
         IGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497881; x=1779102681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GtTvf9vsfLePhnbh9KXY1gq0CLeR2YIl5j5cO/hpSW8=;
        b=jNDj/hSnajSflfzyYR+pkUepgUTY4nZ1Nk4ViZF2sqOo84LXxDuq80khwFXtenNXz9
         V/JPoJVUGXi0ScHWeopSMwSOj+ILQMbgMYCtS3fjSKG9Z77ilLigy52ehrqAA6ndG8YM
         Esf5KyF2Z2+nq/lTqkGWEVTQirhndODiBQC9ion37vhRsXPYl4xby1L/uIN4IsSreCGY
         wUt2H8cwoq7SkMGZVQpYUYIuXpc4jyprXazB//pwN2QjZGFwThzPCnOENbJopODNer+O
         GMMZQJnClxebO9mcdKiKt1c7KBxVGeKk+2t6dtr19lujYZrHOQ+l5tVQziW6G+MNwVdp
         ZbPQ==
X-Forwarded-Encrypted: i=1; AFNElJ//2j35/tJBI5v1mfB0mAYnFPHbnWvR9NBsWj1LuwJOUSTnMhBeBA7/ahxMq1UBMEr+L53lR97gxA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxmJ8MpJoqZy38unuy43ohZOaRCUujDkCqXnOK9+uPXEva2z4XT
	sLMy0RzfLgD9rEkMv7aQBYnfNSZ8bYKH9gnd8njRCGyMZFqVCTC7PE5o
X-Gm-Gg: Acq92OHGaszN0Ih+AMBmh3kDx6ffFtSY15HKoLEX9hsDZWqSOOwVxibSPXstB1n5snT
	6CCSRgoIAecZUUbu4MtizDt976jES1RGH00Rcx62maCvZy78e8h98P5FS/U9AErLU0GTsbwddtN
	rjdiLj+xYVVb8vSnF6GNTLd4AdHcb38AO7ja+DkmN2+eH7kjm4vV+O7RbeRI2HWwxgIrZfZ7qvH
	3sBpVamGDS5CV+pjByf+MNAlI6Y4EmhP/fxnLIZnuLAYuBXXxM33V0JNWYoN8oQksy5uEuOD11D
	AUwk9kjAjtzgfatpWFSqF11TeGpe4wdOnf+S2CYLZhe6pE1SsiShQqLGKtwZW0TnB2+Ob7Ro66B
	wIqvM2PrmnKrSKTMqySv3ddrm43/NtAVdktOUJkGd1uMU48GbRTq0C5vjhqaOmr+PRUEDwbljWR
	Z+/SLLWljOdXdbw+ovEV9jMtA7tCWFFe//bbjvJHtHvAIYAW0TbP6ujnbdw2kWQOoHoA==
X-Received: by 2002:a05:600c:4512:b0:488:ac01:72b6 with SMTP id 5b1f17b1804b1-48e51f3a538mr373235125e9.21.1778497880440;
        Mon, 11 May 2026 04:11:20 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e701e9585sm175077375e9.5.2026.05.11.04.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:11:20 -0700 (PDT)
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
Subject: [PATCH v2 1/6] riscv: dts: spacemit: k1-musepi-pro: add PMIC and power infrastructure
Date: Mon, 11 May 2026 13:11:08 +0200
Message-ID: <20260511111116.1109643-2-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511111116.1109643-1-a.heider@gmail.com>
References: <20260511111116.1109643-1-a.heider@gmail.com>
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
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 144 ++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 29e333b670cf0..88c35ad1ef2ae 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -17,6 +17,7 @@ / {
 	aliases {
 		ethernet0 = &eth0;
 		serial0 = &uart0;
+		i2c8 = &i2c8;
 	};
 
 	chosen {
@@ -33,6 +34,25 @@ led1 {
 			default-state = "on";
 		};
 	};
+
+	reg_usb_vbus: regulator-usb-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USBVBUS";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_4v0: regulator-vcc-40v {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC4V0";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_usb_vbus>;
+	};
 };
 
 &emmc {
@@ -72,6 +92,130 @@ &pdma {
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
+			buck3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck4 {
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

