Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474063A7F40
	for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 08:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067376; cv=none; b=QkbnB8pzeK8EJ9r8CgQhYn2vwe9zhX7bx5raYHsvuoMwnjyH4/J3tx5Yhc89JAtsksfSFtah+pj/OJlYEQmlBiRuUMQCeDRLWQeQ6Y19mifm4HNXHVogQRFiseVBOXoE6+Y6N3ZQwiB1AGbXP6MPibjrPzYKHV97yUTRjEzCddU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067376; c=relaxed/simple;
	bh=hxs3OSpNzHQmcxvHvXpddESvsaNDoOgB9L1Rmxo+7a4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RLGL2CDbskdWbuDA1GU+IICICTri08AJDXbkq5zb8Gn/V9j9Mb3IZ3yl9q3foqPJgLOAkGccb466JKfVLTl+5lcLqWGjiic9189dr3JJuW4hx+O0s6O5pqpqkQoTW3xwM+rrnpZwmz4UyboYo6xHbmsKwXc/wGN3u3xxLSWPgBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X44ZFwu0; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X44ZFwu0"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b9c11eba219so489537666b.2
        for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 01:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067373; x=1776672173; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPuO322us0uZuJ4hizKSGfFjcUXHsAzG0IoitERG8vY=;
        b=X44ZFwu0aILdaoObnQzeTBEeD7keb0op4wtI0yUOE36wZ1crZPziVQaCKGufPBgNaJ
         2XygVXBQsY2KV5rC8feEJlgCNGNNMCNey2SGJEBxSydBIbBvUh6QQATLR92LIP3OIN/c
         UElxOJq9+jWdq6/Fu/R5ozNdO+G6fzeoMjTe9UdMcpAqE3biT4rVtE/BUoW0CSLu0IDZ
         xBdaHDpjxtNAXCzO/nrw+vfdOqm6XSeq2GdaQlJjO6/zcdeqPegjVnGchv0eWtixwOae
         xnFiJ+M3a4GoLpwgypYFGUGB1irAW/gQXvOrSSRml49chKT2BkzcCN26MYRxGnCw3ENe
         yDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067373; x=1776672173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rPuO322us0uZuJ4hizKSGfFjcUXHsAzG0IoitERG8vY=;
        b=quGk3IMv9DG7vbejlNKWI76g6gv0QYuuSyqFxbCalDEMJLH626K509sZufpfBID+BH
         GulpC8PtwJi/UZ9I1u8N02fdv+m2VCU3S4S4e9l2brfOp5V7cjyKbSWv4X9v/Hfl6Jal
         ZNl3jme7r9tHlJcPlvtUaS0MZfFJxXGjNE8MKmAPQffEdzlLUjiedLtkRLdhg1dATaIR
         KVvnTrnRNQLJKY/x/Be8s91VsHzHD0CPhnY6CWVSTCd1fmPCm7Q9tsMEpISCicobc6qN
         UwoJw3h48c0LJBuKMHDVq7eg8juqPjtw65meSxzyr4wrHwDtkDDAuFTy9GXqzIAAEDtM
         cxKQ==
X-Forwarded-Encrypted: i=1; AFNElJ8e8MH7AC5erib0n7SIlwSv5NQywZEbGWsLHs1bBxOs83v3NqGA6qjJeINN0cYfHNOU/sJRDesoCg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCoYtwI11I5RiAEvR03KYURFcfwII2GDDDp4CughBnUFcn1bR6
	3XlGNJIwucDZ/2UZibWh9dZ3nzPmfmKbx9K4WPSEuQVVMRqXJ+CE2/2A
X-Gm-Gg: AeBDievkdGIcdyXHd1ZDLqt4LDRvEuBp6dCq7KKFbvoocYNoKc2agKEbKffLgGvSLoA
	JfAZN1qvhoamzvJmrb0NedySgSLJBsZXZiRMgfN0DTPH+JZCdKCgZXFJDJde6aomtVznj9wioXK
	QQZ6Kawcc61k9zf6ig12K6+JyJo+2GuHQOReJV00v4aMxyXXiGSPNOrgOCDuK+ULYZMHS8IM21D
	ualZzQs/MLtCbC2TKdxEX6UfcrNz3C0uwvKxETsvOAskVnhDlP8yrBfCZnAamffMa3+/jQp+ejX
	tRKIVDZ76x4MVitKxe7A1udy/DJ4hCeHOZ/JQtYMo++fYCTzgE7ZZrfjvnK9DwaFplrLou+EpXA
	HHYTYC/TCSVk7+avY2QMKpQm2ifzZCHrQH5oQZseMCllXPgiufw3Uka+uiu5FiPRSqmGcmIHOnq
	lsckGbE4+fcXlNU13jcO05ZIVc0Mw5lHiOeIR8dppq647AKSh4PICQJu8/NsLnot2G
X-Received: by 2002:a17:907:788:b0:b9c:b682:83ba with SMTP id a640c23a62f3a-b9d7277c7admr701543166b.4.1776067372290;
        Mon, 13 Apr 2026 01:02:52 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm32155932f8f.33.2026.04.13.01.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:02:51 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 13 Apr 2026 10:02:18 +0200
Subject: [PATCH v8 9/9] riscv: dts: spacemit: k1-musepi-pro: add SD card
 support with UHS modes
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-orangepi-sd-card-uhs-v8-9-c21c40ec16d0@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
In-Reply-To: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
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
2.53.0

