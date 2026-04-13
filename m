Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEB53A7828
	for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 08:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067374; cv=none; b=MFGWYltghbNnf87CVyYBrVMm41qtdStP4epooAtyVCcxwzWrFEykwm1/As4RmSaVTm3aSY1rOP74O98MqliI0g2W0iyZD+9fS1Zg2WqFTt/GvPE+XQO4PCBfD4ZrtGpNw1LQOmj3FQJi43mccxEQC3TgepMt0vN7PewZ8nxpGvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067374; c=relaxed/simple;
	bh=yPVLAlhkTA+kUGyF0dssolOKikJzb0AxKHREa9fEcLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nCf3nsQfk//5/Ww7yGejBpYzR1u5i6RpANWVntBzMo+O0wPYd1jZHURm9IPDKGttFlj5vzFKJpkggoQS4VLXAsfyY36+29F6u2VjSlbQk+fNngC0sDIH0i8iQkFKYlo8IfDVHSXEjscMpP8oMPv7phJpdXdebsK7GoKPpQBS6qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PtzUQNc3; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PtzUQNc3"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d03db7f87so2532398f8f.3
        for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 01:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067371; x=1776672171; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=39t86zaG16kXe9hLAHIjg+gQj/3rkIeOmwWRfItDZnQ=;
        b=PtzUQNc3LAX2XJe/rMV3wS3BloKLAhdq9eTt8XPwa6m8AZo8FhE/UcDwkT4Q/YvVQm
         0upRjnitK83jEzNiuci0or9H3/ngqFXS24fYjamBp5XHVePJujmj4hl6tAwF9/Q0pCJs
         isRNq3C4iAtQiZrWb77BtTEvc1OpIaQmtKdeOQIrFv2YodOTGP6auEeDLMiH+byQVjU6
         60bbs0d8H8XtEXBBZyd8Qej8lRd7fI+QJHYYx3Vv7JyEnRHJhYN7/mEwQrFKNeo12/WH
         XgbhW8dsO4WIuZYag2plvcgkXnitd4dIYs8NzLE+tOvsrJMU2xYQA/22z+159UIYsAOm
         YZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067371; x=1776672171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=39t86zaG16kXe9hLAHIjg+gQj/3rkIeOmwWRfItDZnQ=;
        b=SFBHzu7FTjJMu6yhJR91OjHv7LZWRAfPXgvcyXLsy3J23C82TA9cQ0tBEKVqx4Bbaj
         HVtBCg2ZWM8VrziqWg6O+phTUKS3rArWiCIxOcTZ8GyCnkMHi3chBqUxIO+or211dnuL
         Dv7UfY4pOydYHPtaqnwAbsj8VICWDA1UN4h/uqy8qd/+F/9lYxNkxn1WaRei9VVkK68u
         Weo4AWT7q5KOSnStepDBgLCg6mANTOhko12I/Gh5kNL/gdeVOnL4pNUpEOpvuay4aKgF
         iDO4uumlpp9Yqsa636QiTl5M2fA3giDEkctQAGSiIjj3kXv+tFk9C5WPGgdpObKyK9xH
         IRMA==
X-Forwarded-Encrypted: i=1; AFNElJ8cTUjcPX1BbPbxjI2s7iKZD4jkAibhXVoP6jdjVL3esHPKaa3ELDCiGnuy0aStvZV3Wd3YUqYJVg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxgJbwvqLwVX24h8uc/4AVkfdqKrYtQh5RQCg86lsXgIbUgayhY
	cmXqCPlwC9CjIQFoHLR8ywKsU3bbZKlStEHuom+alel70JDZ5prBomNO
X-Gm-Gg: AeBDiettBbqCMgm5rHbaVeLLMBbQoy+MM4Z2SH9dpDBRfv73rKyHByiJ4NFPQBs5knx
	h95t21Lmct6OSu/VPQKJer0H/UX/GtA1pIy/yTFtSn8zEN9Wx3m2PsTX4Hzfft5CSieMzp3VzWa
	AW53/Kn0S73bSst98mtkGfaGcCoSlMtXBVCeCOSWuUGajbFtLg5CP0sVe63wzM2Wa+ni4XTDYda
	J+IjK2WDzV59X/IQlPy2WOd28EkBPQf3LfeLpwhoiq0uLPy1pUGDUeaX5sbfaUOqnu7+CksX2Ae
	5TVPt66tNsE1rGDoHKxL68Rlmbn7w/hHlUINA2k2mOdz4e5DkAysdqq/2f99joY/X4PlPfzx4Rw
	pB8rPsaSbOZkn7hI0q+1oAp1UjKp9d512D6+4rUIWvygb7rYswoSNwkCYxIEfI2PFfuTgwTlze3
	105AHZROnrM/ZLMjhgWSLiMJHH1Nc0kjZiNRCrxn1A0nBFHRqI1cfoQkjtB6DSlF6I
X-Received: by 2002:a5d:5849:0:b0:43b:45a0:9df8 with SMTP id ffacd0b85a97d-43d642be552mr17751732f8f.35.1776067370293;
        Mon, 13 Apr 2026 01:02:50 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm32155932f8f.33.2026.04.13.01.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:02:49 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 13 Apr 2026 10:02:17 +0200
Subject: [PATCH v8 8/9] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-orangepi-sd-card-uhs-v8-8-c21c40ec16d0@gmail.com>
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
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>
X-Mailer: b4 0.14.3

Add complete SD card controller support with UHS high-speed modes.

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with inversion
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes

This enables full SD card functionality including high-speed UHS modes
for improved performance.

Suggested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Anand Moon <linux.amoon@gmail.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 5790d927b93d..a7d88564630f 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -220,7 +220,7 @@ buck3_1v8: buck3 {
 				regulator-always-on;
 			};
 
-			buck4 {
+			buck4: buck4 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-ramp-delay = <5000>;
@@ -241,7 +241,7 @@ buck6 {
 				regulator-always-on;
 			};
 
-			aldo1 {
+			aldo1: aldo1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -367,3 +367,23 @@ hub_3_0: hub@2 {
 		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default", "uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
+	cd-inverted;
+	broken-cd;
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

