Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D93478E57
	for <spacemit@lists.linux.dev>; Fri, 15 May 2026 10:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842164; cv=none; b=oweAfBtHSgpfPtAj+EftYXeUhbSG3eZZ1wu9oVrwpSaH2YUnBdCA775zqHzsmPfzAw1AtnCs0XShyoHb3tUdbXI12lxZRrBOeaexTupMzHoUym3NvuM2QqbSu1GFsscyEXPxGT5guto5v9b0BDH6iOSD1csxZTIPfeeP2PGr02k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842164; c=relaxed/simple;
	bh=KB3wuZH2F9JZumML32p8FdbQDAbgo6ZpTAdn08jmQIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jSjL+n3R0s4BK+rMoUQOhglUmQJmQm7SNv08XQlCaIrU0/7dPlp0UZ0TuhbEqqlGVOHjjQYya7HBU3UUh2QZnuOITIlSCEeUwVd+am8UMi5fzyCHraN4oMw3Vnh33cHgCgNckCVErFQ7+rk1ven1Ho7cYjZrfKVlmXMvTt2EORU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EDdAOw8g; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDdAOw8g"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-448528f4e69so5153026f8f.3
        for <spacemit@lists.linux.dev>; Fri, 15 May 2026 03:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778842161; x=1779446961; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iB8eoQBD1gDe3NlGs/goqrqIf498nPGYBfRez10qXig=;
        b=EDdAOw8gwqmq8Zu9gLLNonb/ipCqb7o9OmV/wUGgt4tMN5ebqztUEyesX6LjgrponZ
         8/aPCstqRjJAgPQ6co3eRc3/IOvDJd65mSNinPSxhOwg+2x1E3wrfs4tSocLLOx1DWgC
         PVr9G5K3DngZ/4Yy8fpQscR169Ti0BvzNdbbARyl0Q/7PUJiMdcR9daH8TCqk1uadZue
         vkiqgpRy3WMuK+gxTfZ4M/yXTJPVCZXOouIOYCqC2S8lpyTAh1QcM3s8MlVhuc/cBSoj
         aE2WJmXHMpqhzcKvnA8QNE/ArU6ctCMZXZKFllMKBaDKvJ/fddBAAtIUid4o94a8MHVd
         W0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842161; x=1779446961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iB8eoQBD1gDe3NlGs/goqrqIf498nPGYBfRez10qXig=;
        b=QGyVBrdxSzsL6yTNpiWYJFv0/t9I8QkxpqWFRUAz8yXpZ1tB0jpH2hNXuxCMG+5wqJ
         fMElYN9Ix2FylGAfhOPxSLUjAwL1u4UWCo8BaalRhDmqWQ3xx2purhUjzOzam8cz7Gsg
         bPgU3lW85Jn74Ae/KCWIf7IYni3qXUtuTsfPqfNZzVNJ5//lgtJ32TlOAHg+2bKmb1/R
         s8HPwYkBsszQarcMybb3LAfD2FxLPrUoIHrs2MTv0K2ZnkQBQsNCSrh0Z6hbmtp7hZFZ
         /5icMURAa8Ofsh+PpJydbdC/m4At8TRq80IuRsHvDaD8BPrsIZHvrcQjODnChbBRdZU5
         wW8g==
X-Forwarded-Encrypted: i=1; AFNElJ/xzu08mILjglMR6TSfIiAnUYw04KOE0fzMgze+oko2eQJA2+jewqGYz/ZGrnc+8RVHK7CvNSa1Yw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3jhNNiCoZZZDgoiIk341QXlDsgPh3NK/l1qZfxj11xfmbWvM+
	0WTVF/URrICOcL2Qsb2EiI6kzoFNFKzzaJ/fSDeRksV1ONPQdBrXhpw/
X-Gm-Gg: Acq92OH8s+bTqWxJNoUhzq2N7uo6lKfUC0H5hbbdOxtVyDylK6quRuRakOIarJBVv3w
	NDtiZuqTNtiuzmWUwMp20KG2LTPwcCvnqodQhu0GOC2x8UzWeZzlofMqcnNXrDhbLb7AAw2GAHv
	d/czD6Mdo7zJ+cvubpgwx98kS5g2iAWB1tLeMFM/PgudhFDk6Clcs+8EFniSLX7pRIgU8v1rggn
	f9bzKBYuvA64JG7sQkjvV5ZNnua5wqY6m2v1jumEl6XFldmx1Ulj6IzvQXEivxXnMHaxC0CQT5i
	mLGIinuQzKxp1lhpBpYsEGZL2ssE6GDSNDidVPohivqCyTVT8LwalVEyUUdgPvLiYZc/+6wWWiz
	syF5FEZFsVYvLWrxJU7egSGazwy+uezJOI0jHnPLNRzVEOxViRA9ZeokdpyFhVXNdojyc4U3ccX
	v19Jk+8ZqOxfqsrOoodrSkQMQy0freG8E4AI7uIW1uxkWxGD5dL73KbCmXuEnbQ2mSig==
X-Received: by 2002:a05:6000:26cf:b0:43d:7a97:78b5 with SMTP id ffacd0b85a97d-45e5c5ccbe0mr4405213f8f.33.1778842161362;
        Fri, 15 May 2026 03:49:21 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3ac86sm13975602f8f.14.2026.05.15.03.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:49:20 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 15 May 2026 12:49:02 +0200
Subject: [PATCH v10 4/4] riscv: dts: spacemit: k1-musepi-pro: add SD card
 support with UHS modes
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-orangepi-sd-card-uhs-v10-4-094af27e310d@gmail.com>
References: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
In-Reply-To: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
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
 Trevor Gamblin <tgamblin@baylibre.com>, Andre Heider <a.heider@gmail.com>
X-Mailer: b4 0.14.3

From: Trevor Gamblin <tgamblin@baylibre.com>

Update the Muse Pi Pro devicetree with SD card support to match what
was done for the OrangePi RV2 in [1]. More precisely:

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with internal pull-up support
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes
- Add stable MMC device aliases (mmc0 = eMMC, mmc1 = SD card)
- Update PMIC configuration to use per-regulator supply properties

[1] https://lore.kernel.org/linux-riscv/20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com/T/#

Tested-by: Andre Heider <a.heider@gmail.com>
Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 60 ++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 29e333b670cf..81d3ce85d460 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -17,8 +17,20 @@ / {
 	aliases {
 		ethernet0 = &eth0;
 		serial0 = &uart0;
+		mmc0 = &emmc;
+		mmc1 = &sdhci0;
 	};
 
+	reg_vcc_4v: vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+
 	chosen {
 		stdout-path = "serial0";
 	};
@@ -77,3 +89,51 @@ &uart0 {
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
+		vin4-supply = <&reg_vcc_4v>;
+		aldoin-supply = <&reg_vcc_4v>;
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
+	cd-gpios = <&gpio K1_GPIO(80) (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>;
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

