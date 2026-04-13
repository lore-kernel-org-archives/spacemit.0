Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63C43932C0
	for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 07:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065198; cv=none; b=jDgXGcaUbC4CNqHHEBERNF4xEC3fLa+hr20kT158T3BhjEjaxz1KQGq7fj1f48oRWy6BM8RiXLrP59mtNpfHAfptKfx58khu3Oj6jSQjt+HZcqXPP0bXkvzWBfKh8dfctLztvGeTfjTPro5WiA/bu3QJCc9AFGdQLzoG4c1zTHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065198; c=relaxed/simple;
	bh=jzMsWwDIkxOKSax6gl1IICe0yAnfuQo2yxPv0AT8qsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=atpCdwzU/OO8Y85y+eeGiF//i/MACdwjAGKZRd9324gSD/6tcse4jU7YHjoBUnrfxEMk2RNm8ZTJKowP56uaQI8AmYZ8ygPXQZEGy3sKGKjUjhOnw64M0m91xjWnvBoSC4oYCw79zSdRcMGsDMQmdOJR+Iu83D4P8v07aNLkq7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4u9xRmd; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4u9xRmd"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d74086e5bso710682f8f.0
        for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 00:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065194; x=1776669994; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Bt7k0zpH6EPz3nKG6vw5G/jzVLlNuWcFiRyZwuaAKY=;
        b=N4u9xRmdvXG2r6evA0Up7CGy8/lZPc6uqLcKdBb2n+yl7DQpLhq/1++6DBGS88OAPP
         c3hTjEslgTDXcQ86zFFypMKCRk/Y5ibVjQM3StYbzT1Mr9I3dJPDUivcVCQk4j4L904m
         4jFBBKoIHDuxcvguaVqNpvlRQ/aHF/UHECgC2dfAripk07wZTegnHwvE23InA9Hf9p9R
         q2FkCDgkgHpbOCHeHsd0z3GYIwqlfKTOdsgzuyq9GaTv1/fHXyG6c0gowglkCcYDye5i
         9pvB8W39mftULgD7AatZpYecBSXv2HWvk2xOXxSDuEYwmYMGT7iKImB8LdOdlwuDuQVk
         p+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065194; x=1776669994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Bt7k0zpH6EPz3nKG6vw5G/jzVLlNuWcFiRyZwuaAKY=;
        b=YI0q8PRqfD9zt/RJcKBpfSfWxy57DxS6Id/AhF2e3EXQkP/HLpafVwbAq6X1gUZnds
         VQ5gXm3rFq/UBtJ6cCHmtbG5apaP4JhacTpIiIIWeguGrfzjRq1r69qnr5BvlUI6qzrq
         8u4Ro0e5XPgbaW1yZwO1ZjAS4anQczvAEvb5s10kUkDDPGRpb+i1q4nqaBzTqNU31By/
         YpUGGsG5CH86PcpO8FRsKo0Ou1550HtocZSyw0zzSEtaWVVNkEoOo4DJ5k1pw4DNAM7q
         i7APog+vK4gHr7QB3tUUraV6+Wb09DZePjbTultUZht0hoR/Lh/8qM1oiE0mfOdI3WWB
         +IEA==
X-Forwarded-Encrypted: i=1; AFNElJ/4NmXh1/RG6GxvfKam0u32yj62MwR++CA64sRYmzve9izugDjapa8cGjrI8NW40N9UHO8RsjfdSg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyuy4SU9d0ujSEFwULDcbm6akabN+4+O+iz9/dJDZ03ClRYjr5A
	CvL1aXEqTaFFqgTnEgKArnImt5o87+WUG+MyD1Uk8r/snfSSBuh2rluv
X-Gm-Gg: AeBDiesHi5Y3iSk02lDfam6FWa6hZNnmKNO7494E7T53oZgld8/IcMcJ4ziNyhywVzv
	5g5wZwP7u/AGKccuSDftT4muFGiLv3M0n6SKc8uF9ln0kBHNkYaIbt3YwzJ63pBXaHNTn+bt+vd
	bWoOviiN2ESCiIvMhoN1JwBT9SmKOvAkVpZUpNXRNkPnTO0YXtljhMB8fas9DOdczrWd5Y3JqTA
	H9oB53g+QdhIsE4zjy2tE3tepEIoBduDeKez+7jUy6o1SdT1sYVmM+McZu+Xlc2jA0YbIy1mClo
	abIZgF2GKXBNoWmznO9sFzvgW23R6l4xA86NaojOaxVRIbFayC2VLeAderZCOYbFS6ahXXG96zx
	AcxMGWMw8lgIMBM9R4FApv4hMKxkxYnkbWWH6NQRdTw2FpdkGC6l7ZG4lN08dsEHqOqL7metvhk
	5h5Oh1EFAV2Hawz0YcRQ4ULo9DPFbAB7J7OwjyniLTtfJ7InDMHSecXSaanpUw71o6
X-Received: by 2002:a05:6000:1788:b0:439:ccd7:cdb6 with SMTP id ffacd0b85a97d-43d642a4dd9mr19113605f8f.14.1776065194020;
        Mon, 13 Apr 2026 00:26:34 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63dec27fsm29788453f8f.11.2026.04.13.00.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:26:33 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Anand Moon <linux.amoon@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Vincent Legoll <legoll@online.fr>
Subject: [PATCH v7 6/9] riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and power infrastructure
Date: Mon, 13 Apr 2026 09:24:48 +0200
Message-ID: <20260413-orangepi-sd-card-uhs-v7-6-16650f49c022@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.3
Content-Transfer-Encoding: 8bit

Add Spacemit P1 PMIC configuration and board power infrastructure for
voltage regulation support.

- Add board power regulators (5V input, 4V rail)
- Enable I2C8 for PMIC communication
- Configure PMIC with buck4 (vmmc) and aldo1 (vqmmc) regulators
- Set up regulator constraints for SD card operation

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Tested-by: Vincent Legoll <legoll@online.fr>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 48 ++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 7b7331cb3c72..9c417a483f6b 100644
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

