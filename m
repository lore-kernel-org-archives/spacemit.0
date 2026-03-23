Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C5838F648
	for <spacemit@lists.linux.dev>; Mon, 23 Mar 2026 10:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261189; cv=none; b=CrzxloqQn4Z2fp+cya72B9g9o+dz7u9SfI1VkqAjNWQI+tAPjubkkIToCd7ySwAHATKbMD7O01cupJXcLDoNguabdTmP9kj5ZnjMaPDIflD9dYEu95D9M70IBZRK2UBSAmqBUT/FVsRGQ2/96NCGsyfUPncNsCIsEY61DhosS8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261189; c=relaxed/simple;
	bh=/XgektwUTyrRiqcljig24LQcihgwiimxLKBfjjRqYQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=enV7qiXYu/Cefvf6USAyvUgsMezl4SddZ+rat0cEcVxp6hGXr58T0EVoA4y1EW1cc7fYek13u2rc/EwIyK7CngNJDMbPEb5PaQoyRKz6u4KZbqCMoLBkEDxF0H604Wzw9E5v+4Bzkvle8/PFgd7j3SxsmhjgD4Lpgz3Uz/QDQ2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AS2Nwe4q; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AS2Nwe4q"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48704db565eso16547025e9.1
        for <spacemit@lists.linux.dev>; Mon, 23 Mar 2026 03:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261186; x=1774865986; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s2b3A5VlJa4lpM7E2GeEDRbbHgTsaHKFUASwgrv7Rf4=;
        b=AS2Nwe4qJSgEhLdpcZs9kTkincf/pWj9VxlyM3YY8xHmuGoV303ORvPQKJucHpwjOl
         p0f1PMJjbSOwvPm91TfCVtSWR71RHOhaaxQDeXNUILcK6ktWGLx9izyHWZsI80o7O5Dk
         sSDDvtoRzmYFjdKo0r5UnIYYKLk0xhtJQ3QkB6/P8TvUCsrUKpmYOJCAAspA0QQJSZ+a
         h9GCGf+MFsN1e/RT/B3WT6g7GCtDIAWnaWw+HbcS1h+Aen8MBC0btIOkatY9gcu3n4BP
         fYcGu2qw4qm2pabvm36KNAqdB9SZko9GvT+0mG0RXRuqJXxNaPnBWMS1gn7fLHnAAWiw
         riTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261186; x=1774865986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s2b3A5VlJa4lpM7E2GeEDRbbHgTsaHKFUASwgrv7Rf4=;
        b=Ar1eRBRMW9yJwcJ09cLVvPQl/aAvJss0xz/skHoo/oaM2boafMm1EKqR0ZzXpEqdBA
         bJ1RQvvzFuvNFsq7K34MrtOyFSqmGXzWhKr0gBSUNFepvjicLQhsrFv42g/jv1SFTpxr
         yU6xtdt18ps52VFRbFenGJVO1HMSWJZ+/6voHJPLSxf2aeRJvjresphp5tGWrrufDc1F
         eBukQv+OGdrxXMJuLyJyibFOoJ7kDxgBGSxl5WzD0mM3oVGzrxGqzjN9HrmHERyBo8nh
         pmjdh3PvuZ1GF28HMBg8Ukcj17g7ghxUbereSXRtyQ9jnkWfNL5JXbIbkkNC3I+yKevb
         raUg==
X-Forwarded-Encrypted: i=1; AJvYcCV0bhwri8XYsWBkkb/K1pt8XznotTIHkBVqCnlquSkAV+Hk7asyCKIfDAZWYeO8ggoBYfjHDOJONA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7BeaEfCpfBjYWjwH6OAJaLw/DfmVOtCbgY6z1X6Bqag0glbbz
	r4Z2TPryREw0PdmNo1lWVgml/92KkSx43ZfFHLtM2MJcTAJigs8nZuRm
X-Gm-Gg: ATEYQzzddx6UqLJ1oxP7ujiA+UvwDo2czVH1kj1JJxjkquDo89Y+wzVYM3k0ENMd25u
	kpg2TqYfBsghos39gsuO74Rik3FJi5Cw87YcvjD041AaPtjl2px5GYnFqmzayQBEdsGYvx2DqsD
	bcc1u/S4TAQIkg4sMCl35SfLUOi+q9tSas2AMUlnF2bnGEKwwVSmylsHFS4j+ezVXLrtANK2uPU
	YWbzCEp++MnFpB+z/GYKxsfrUKcghP0ymd+gnSz0cQScEy39zCTDcJwidSuFlIwjSd6vWlrusJ0
	vBd9EeOlYdXALaTUQuD1jFdq67kvjeEqTenXoRjRZnEP1HeGE2PZozDkPqcNILYPzws8vxH69Z2
	XyUAHvkTEsl90gF75XEGIZybU0f4jauEOghfxckSR33dgbUA3YS0wvOtnFVQd6TJ6oXuoYSAz9W
	u6J7OU/2uMVVh8P26/fvWybffzS8iJGUJccylAOZgnZAEV6OUPzgOldAUgQa/OZn3J
X-Received: by 2002:a05:600c:530f:b0:485:2ce2:4c87 with SMTP id 5b1f17b1804b1-486febb455dmr171394665e9.4.1774261185644;
        Mon, 23 Mar 2026 03:19:45 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe86acb0sm78755445e9.6.2026.03.23.03.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:19:44 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 23 Mar 2026 11:19:11 +0100
Subject: [PATCH v4 8/8] riscv: dts: spacemit: k1-musepi-pro: add SD card
 support with UHS modes
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-orangepi-sd-card-uhs-v4-8-567c9775fd0e@gmail.com>
References: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
In-Reply-To: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
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
 Iker Pedrosa <ikerpedrosam@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2

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
index 29e333b670cf0a5c4ed852668460db475b9c44cb..b63723978a4b5317c506c6df6ad410d23b0f0ea0 100644
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
+	pinctrl-names = "default", "state_uhs";
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

