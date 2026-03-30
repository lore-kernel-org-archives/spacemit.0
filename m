Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DF03B4E97
	for <spacemit@lists.linux.dev>; Mon, 30 Mar 2026 08:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859922; cv=none; b=CUOmbKPDtnSMj7agsf8mXkfRyVaKhd9GHllFzvFrHrnJqXBYAd86qQKIrC2h8u34LtlC40+Nm1hXcYj/2CW69d0Rlsv/ZbN3vTeofkX3Q1B4kHtSovR+mAVpyPnADbyDgc53QnTZUN6ZbJc8DXTCf/gNMT5lF2xUltcF2JCo99Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859922; c=relaxed/simple;
	bh=/XgektwUTyrRiqcljig24LQcihgwiimxLKBfjjRqYQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vg7r4Md2Z/Ge32u/0pmVOnuLP8wTH86j6GMpe8TJ3DFuV1pRV28oULPEU7FTWuj1/SOOoVW7PiSVVa4T70i7ppBJqU3PoOCNtK+zL1Vw7w8NnCtI1TtaXfQNh4+67Tjrx5LfiZyDeSz0pQkR2+xFNR3uyOzj69jRNabPtnCJQ7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JU9S9Q4a; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JU9S9Q4a"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43cfb723698so655267f8f.3
        for <spacemit@lists.linux.dev>; Mon, 30 Mar 2026 01:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859919; x=1775464719; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s2b3A5VlJa4lpM7E2GeEDRbbHgTsaHKFUASwgrv7Rf4=;
        b=JU9S9Q4aTFAhkrs2xDk4Oc7RVCtFky7Pfw4vfP6LHZ2b9jALNsank8LeFfbFkr1k4+
         uko1ZeR3AjfXcpw58O9A00fNDhr8QqwIPHGwVVCNggMwXU6OJmk2EF8eo72EhCkg0AxY
         BC1n358ofnThKjFC/e1Wj9QyH2sAQZYO8qKOQ40hP2I3rsmeiRj8u9ulN81C9nwqogRH
         HRgBD0VAhW+S6DX24UTio/k1Tz4K5cBKYvLBE6NqugC9r3cbZrVvEl0b81jcGYGdcY43
         /bGxv/qcCoVwaCisqOipEC915Dkq8KGShJUtih2k1kgyg6w8PHIhV7XtpMzFOBE075a/
         1kOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859919; x=1775464719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s2b3A5VlJa4lpM7E2GeEDRbbHgTsaHKFUASwgrv7Rf4=;
        b=JEXXpVUzQZhyFZbKbCmjgIBtoQsYSJB6WxEth4AFFhuoKLYtxfbf/p7iS8BW6pigJt
         OpdBGHPlcTB2gZzVUmHASaBhUuH02FwY40ynyslIOKNewkhaORcc43Lfedamv9L5TBF3
         jdGMHJUutKy4mw03diP16h2frOUvg4wnkbM6LC2NzzgLJl5c/95Jjo9qxkR3gzyeYeHD
         7NBqFihSLmukeffc3x1hz8LIyeS2mtGFgMbu5YCs3CmD4dy8rcGBfUd/jNNFbG+ePE0t
         GdtO6VCU7RlDbA9eXW6+/8oHVcOLWAa/+ooCn0719WqoYef52jDqwwyQLG0aKPHMvOVR
         u6Xw==
X-Forwarded-Encrypted: i=1; AJvYcCVJMAJaNg1iSYRd3KSz29BwHWCQK0AmQl98KkdRgyoOEvMlBR7BLTwJW64hKzn65vJlWkIvKnigrA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywn2Dv07JZd9c+1D0VmdhFpeJFo0iVRCc9njmwei6ufHpmh+nLm
	Z6D+ecW9t/VwB1LKj+6Uj39/uAyEHd2TgW6LNn5E4qPXSEKKtEem0uO1
X-Gm-Gg: ATEYQzxFe7GW6LHmol96YZAB/64gp3T/29HKdnJTwde/lnhwZr4+96i2LuccOALIDGO
	SWhee8YQy/VC+T/n8PvzkPYdyIXbgFZ34RdSEViHD3d0eTzHde2VIIf0QFp9DCDdxLmQC8o5w57
	3V09S8y6okNOXDnTlh6PEs63G3f0sydjxb5WSOH4mIra/8y3P0t0TbTjkfG21SCA2grsZEf/n2s
	6eam6YdChOBRtShPqtdYyIdEvmj+UfKpGMzds/a6e7tRqkhDgrwDrBD75AX89dQsax53yuKzHB4
	NJnHoELW4gD8JVVat2LEY+raM4H1K0gMUrca8ug31pvemqIM7QQy3ICYiV48Amdo8w+sBiorlpU
	0YIupzW12IKVzEwKpPT72XDpn0gQKEuBwbzAp8CAaNzLnbhkiIlyw6vAj4xmG4KLyUH7AMz1se9
	bLbhba7bqMoU0NHyKUUMTLXtnWM2n9CwrfGxA3Tb7UPHd82C9ket54EkF8L+kpIESd
X-Received: by 2002:a05:600c:4e08:b0:485:363b:fafe with SMTP id 5b1f17b1804b1-48727d5e971mr206919765e9.1.1774859919161;
        Mon, 30 Mar 2026 01:38:39 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872712c236sm74063315e9.14.2026.03.30.01.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:38:38 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 30 Mar 2026 10:38:10 +0200
Subject: [PATCH v5 9/9] riscv: dts: spacemit: k1-musepi-pro: add SD card
 support with UHS modes
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-orangepi-sd-card-uhs-v5-9-bd853604322d@gmail.com>
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
In-Reply-To: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
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

