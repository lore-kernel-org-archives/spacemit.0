Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425BD477E4B
	for <spacemit@lists.linux.dev>; Fri, 15 May 2026 10:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842162; cv=none; b=di91li/zZPvC64NzUSoSAMdVG0LQmSnHu0WQroOgBTG0lxPNLFakRPamvIP+Y5rAy1I0GWPUTkVkRArx6PCWYHm93+1X3KSNLXUEPIRMpqRpM+CCsNEraaHPMrqSMqEndH/GX8DYpW5AyS2V1C717BbIQyjC9aQMDO2iJnufjQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842162; c=relaxed/simple;
	bh=ljxUsigqx79h/ONm6GNMgplDs+bMqcAhgwy6ceKWN2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y8e74vDq9W0zqTixPxm6vKakh3oj4ON4MoqhnnncHMEjwhFPTJFrREYH+SgFNVrGf4HSlhB7VAfkhO8hDOVn12T+wOSYkV2+at4TTsfjGg+vS+0CkQoNKrCt7wknfUFSAzj9mrpWTTT9biNVutZ18tTIlxVRRJHJUn3Xrhtxexc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dkPdcZqK; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dkPdcZqK"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so7920309f8f.0
        for <spacemit@lists.linux.dev>; Fri, 15 May 2026 03:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778842160; x=1779446960; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cdO1zzlLKkykrIptdTOfySnlGfDlrWt09hUBxB4Iamw=;
        b=dkPdcZqKukw/liAkE5PNZHgHmiCCr3bjVnAygWRxoYIjePxwQpYc6wf0aa3hu43BDT
         dn2hjq0u+pLq9ZWCqZf7JVMEZ7Jy2nykEIL9hAWxTVFdjgTRme+Zo5H74WaIEjFkUtTB
         Eluxhv9vOXVFRRyB57fapUb9rwbLUg7+4tpDfYPcj+kxM9EEvAjJwkL+mp6ufjF7wewk
         WGDOMoLZRJRlyiL7Mm7pfD2rJWbTXO7H46MrkeSemKtjdKYSbv4KSS64I3vQ88gq5Tng
         n1ZO/xx33Z24xvyAnQYyGlDYkMecD9Fz7kkodBfxVGp2mBP/ruxuUik6SOiVVXRNskNp
         rqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842160; x=1779446960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cdO1zzlLKkykrIptdTOfySnlGfDlrWt09hUBxB4Iamw=;
        b=fNHPxO3JWrdvPNH1pjUYjjDxUKwMC9b8RzbTs0aHSts3SzROsGnwTr3WgrwTLrctBR
         zteT2DvJHlUvqNI6txh5KyyHDkjSr7DGHKvYzR9k5ozue2xj18H0ODmWzfL35yUzNY/c
         4kGLK2q/xZWj4oHMWVy6uX7f8GihIFQdad3H6Xzp39s/Ule4S9NlepYEQOVjY2fxNmte
         eeT/+byxdhylxAwHyf/byWQrGRkqw4u5eQjj+17j/me6X9TdcIv9Tx7ALVEJAIjdF38y
         1CbbTczi4CvJZiiOS0ERYHp6NowY5pCLU6ld8nB1Ab7KX+V6niHu1xPRytqMOYXGP1Tf
         2fgQ==
X-Forwarded-Encrypted: i=1; AFNElJ9L9fquKTf7t2qPpb4Njdqz5OKAFDSSb3wWi3WCSEKZN2mGDl9ANlN5HaVhwL/S/2LCQOABozwi3Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYHf7OEHM9ltLMoCE2XlTzhawN3qz242dsnKdiiFoOxfYJNXGV
	nG77LoGrAJj4s2xh1VM/zvoiofJST8plf/6qGQEfG+vnewkL+eAr2eBn
X-Gm-Gg: Acq92OEEmYv4tN6e5hRRriPoZWCm8p9je+yNFHkF23xWNrMXFYwcZzMe8CtM4V4hA25
	S+6vFOP/t0Ik+4HbZTxgPVWx/wXJEzj1NMqKk06znYtxT8LDYzUO+H7uj7cn3mRk/ASPvxf+UsY
	ObF5WHIM+2jAUzQU/Wf4izkfKC+qkr2nc76QpF0pxC3ZB4sBMVZ2wye73PFHVaCnwIZsDTO5Ofx
	WkszMVsRD3iIevV7IlTQFNrMcv4EpwB4xw816Zo3mjmAcRzF6nuS11KIU8JSqosTljRaPzlZUOv
	fjvcTKtdf8ig2ESBNOU9XqnC60xN7mWa8VnxZkT4Tjh30AUSYQab3hkpBaPdYmVi7BV+CRDf620
	yb6cvM1rConssALjzmBYaLUtGbRv+Pq+GH5Sh5G9Hj0I6ycwsi8QofZU0yEkYxwoHGlx4Ruqym9
	wLXCGn7v7Fq+a7I4woFBNVBIKwXWpgEi9vVUFRIeLYcskbBFL+791CWrRHK3kpm5Lkgg==
X-Received: by 2002:a5d:5d10:0:b0:44e:1984:5f3e with SMTP id ffacd0b85a97d-45e5c5951f9mr4409926f8f.31.1778842159282;
        Fri, 15 May 2026 03:49:19 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3ac86sm13975602f8f.14.2026.05.15.03.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:49:18 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 15 May 2026 12:49:01 +0200
Subject: [PATCH v10 3/4] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-orangepi-sd-card-uhs-v10-3-094af27e310d@gmail.com>
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
 Margherita Milani <margherita.milani@amarulasolutions.com>, 
 Aurelien Jarno <aurelien@aurel32.net>
X-Mailer: b4 0.14.3

Add complete SD card controller support with UHS high-speed modes.

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with GPIO_ACTIVE_LOW and internal pull-up
  support
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes
- Add stable MMC device aliases (mmc0 = eMMC, mmc1 = SD card)

This enables full SD card functionality including high-speed UHS modes
for improved performance.

Suggested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Margherita Milani <margherita.milani@amarulasolutions.com>
Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index e20daa50a152..72f77e9edd63 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -17,6 +17,8 @@ aliases {
 		spi3 = &spi3;
 		i2c2 = &i2c2;
 		i2c8 = &i2c8;
+		mmc0 = &emmc;
+		mmc1 = &sdhci0;
 	};
 
 	chosen {
@@ -221,7 +223,7 @@ buck3_1v8: buck3 {
 				regulator-always-on;
 			};
 
-			buck4 {
+			buck4: buck4 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-ramp-delay = <5000>;
@@ -242,7 +244,7 @@ buck6 {
 				regulator-always-on;
 			};
 
-			aldo1 {
+			aldo1: aldo1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -374,3 +376,21 @@ hub_3_0: hub@2 {
 		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default", "uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
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

