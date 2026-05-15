Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCDA46AF3D
	for <spacemit@lists.linux.dev>; Fri, 15 May 2026 10:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842160; cv=none; b=XL5INNmdNm1EVDIR33Io1LIOzFU8spCdvWm/7Q/2+dpQsN8hBNpqwPMET0Sm4IUG2NDtc/btqTTq5KEPyKuA4qn/NSrCYaOzd4+uWGw7razjflZiuifzJQdMlAIKyl81SmJtqTvhT2Y5z4AyPN+EP6GqXTG0K+ut7+McSUuRPL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842160; c=relaxed/simple;
	bh=AE9piC3ZJIVgnZZvOh4UzzLQvqXylhoIUDIYukgk3Ic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YuFOUf3m2Nt6527+oiIyPr0NaIfRwO+oOvI5qOc74JITmifl4z8MPELCn69vXBCtrr972ViWFP+qM5+uanMUfTBlGrXigCb6gZljWIrWtctDgRrMRdPHGAnwMGjX5WDKy6qPEBK8fZ8ku6Z6wsX3u9TQ0mWc+aQEuN9QsabLuBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddHcqA74; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddHcqA74"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so56694375e9.3
        for <spacemit@lists.linux.dev>; Fri, 15 May 2026 03:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778842157; x=1779446957; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gj+gGcawYCc+wqAPbdfgxnVj/lSmz4s1J3fKvDtI2Ic=;
        b=ddHcqA74RQrChhZbZLFVJ6lEhgukyrZBLHiRl8bEF91fvB1cGwQiGHgy5uR0NKFdWd
         OaQcetF5L3uP6cfASmAaDwRiDx7TRNaI6cCInWhfpMQXW16TD91XnYttUhPvV7T75c8U
         B+LCoUu/VRZQSZddS5huxETkvHUFY2Ty1IhbAB5bHv7lS1JJHBvZcz9IMnfJzKfKjWuE
         YdmsJGZ9g3Sc158BLmxqu4thfTipWSy7yXS5Ix/eC5Q2bHqEj0cTDNQAbODtGkkQY+3g
         iy/pCkBPKyPB8kdGblNWUXnbP/HD0IZqjBvvXa+5mo9ysjLtXVfqsArZGC1I1sSmdRI3
         6rFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842157; x=1779446957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gj+gGcawYCc+wqAPbdfgxnVj/lSmz4s1J3fKvDtI2Ic=;
        b=VPu1bL8wEaFuvN/Ux1jZykOqH9Srcz1RRxRcNYqk1uHpMTZqn/eqoz4E/gDww9FFWg
         gfzgsQO2FTJacRMKR9KhdLuMxuAsXFcDvAjH2S1yaNtxEJi+Thy4bAPoIOwdAEq3WaOA
         TDMY05i/MCNW7iehMUMKlCucE9lTJ8fQs8vdJX4JffO0UfxStiSceZ8ecXkhMXghYCQQ
         LkoHt1XQ/EDovWJME19njh5/jnYPe7QV5p5+2d1skSCRuCl1JpTBjKoaBdOx3fj6uaGJ
         mycTpruCkouwKPk8x2Esas0+rRJBdWbxrOG3WgBzCWSSYiLf4SSZZTf3RZKRHVuD2JC1
         FyEg==
X-Forwarded-Encrypted: i=1; AFNElJ8mdursC3MgnW5YfJPsKs45i8uENenafMxwUln/JmxunH1ck52DQLQP34kWVg3gkMMqRS8WKeJFYQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3ngDIINc8thfvX56rD62+myCzft0k7w10bqFxvzUyTdFjRJiN
	QkwlYkdBpZBvLKfVnden7sIa8JDCkangnqUuivDuTK3SR1Bj8cbCVQQf
X-Gm-Gg: Acq92OEYkM1ATVK8+hW5bL8bDDA3P+kw1AvOHeMvPw5RV7WsfG6P8mBVNQ5zxsqKxkc
	DoiKYN/MfTc5ARkD968frq3mo2a/TvmRzKq2tWU/RnrbelzkNFleaLSE4vDVxR9jGljgA08fz1C
	4v6U+pu7SAV8NT2xhvfVF+fQzgRHKvbv3+aqHGtVclFVLQXhMmGpTbIsRD2ZNDX/CZu6cdGOQSV
	n0JyfCqCaUkKnl7yKhfHwRVAwET4EBZOC4y59WpxNhYpO8drTG+82RTHw5eFvRCwKai0mO1YvL8
	hxyjyVgg6oJG+4pSy4UfoUzo0q7iEgOIM/MBcwcrslz6fa0j5Mo7wJzUPED253VnCC0gIUmpv8A
	Mpsz9GbIVz8I6L96aqdTnLK0y9o4K/ddMBFmUsy73ppwzW+Dxrmjg4Q3yO+TRVOAM3GHTfVljXo
	dz+kgMDlV5TWl/Z1T5S0IhFhvAfGovttJ2/oUUm8/SVqdPtzbYHo6YC1lkeo3+BUa60mExUd/Wn
	iD/
X-Received: by 2002:a05:600c:34cf:b0:48e:5990:9698 with SMTP id 5b1f17b1804b1-48fe651588fmr49447535e9.24.1778842157464;
        Fri, 15 May 2026 03:49:17 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3ac86sm13975602f8f.14.2026.05.15.03.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:49:17 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 15 May 2026 12:49:00 +0200
Subject: [PATCH v10 2/4] riscv: dts: spacemit: k1-orangepi-rv2: add SD card
 support with UHS modes
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-orangepi-sd-card-uhs-v10-2-094af27e310d@gmail.com>
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
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>, Vincent Legoll <legoll@online.fr>
X-Mailer: b4 0.14.3

Add complete SD card controller support with UHS high-speed modes.

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with GPIO_ACTIVE_LOW logic
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes
- Add stable MMC device aliases (mmc0 = eMMC, mmc1 = SD card)

This enables full SD card functionality including high-speed UHS modes
for improved performance.

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Tested-by: Vincent Legoll <legoll@online.fr>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index c95ca38e3d4a..bd40bc9011e2 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -17,6 +17,8 @@ aliases {
 		serial0 = &uart0;
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
+		mmc0 = &emmc;
+		mmc1 = &sdhci0;
 	};
 
 	chosen {
@@ -202,7 +204,7 @@ buck6 {
 				regulator-always-on;
 			};
 
-			aldo1 {
+			aldo1: aldo1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -319,3 +321,21 @@ hub_3_0: hub@2 {
 		vdd-supply = <&vcc_5v0>;
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default", "uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_LOW>;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&buck4_3v3>;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};

-- 
2.54.0

