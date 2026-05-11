Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA343D1CC6
	for <spacemit@lists.linux.dev>; Mon, 11 May 2026 08:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778489682; cv=none; b=DtZkewfIi85zJlTSRJ1XNgAuCA5b6E/4gdEwpNAkDsgYqLX/2Bt4OSV99zzS2Iy34n4uyXnD8iabuVbW/TT/wcInAZrjVY5UI3chg2Pn5NgvajCRM6kTGT7Gx0VO07Z/qKXzqrbBaKmtHVgf7vc7SG2VNOcmp9hZU8VIIpBzS6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778489682; c=relaxed/simple;
	bh=KCOvZYyTd7ld6R+DEiMgf0st7whZv7B/cS4xzgObkHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SVSOJW6XlwR7d8WR9zWUWUGFZTo4OBekFGQGVfw6EwctfhgQRS/5JalWtE5g2WHaT46XP5sm3zbWCVu1CStHnjDXnPcygcpoSmaamiG5l8nd8b5dAA6wvyRxYI1+eH0N7eSYJKv9ZEdsDkpzk7NLxqTuwh5gLyCfhv4ut5h48Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o9h/rz1B; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o9h/rz1B"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so2934941f8f.1
        for <spacemit@lists.linux.dev>; Mon, 11 May 2026 01:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778489679; x=1779094479; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TEIrqqD5+9V93nbJhziz0GoVKNocn+oS9pnFRNj6sLI=;
        b=o9h/rz1B9TTpvOgBY2fxM2k48+5fUWMbP9pC8Z7/UDASPzX3/RH7rhYAfa1yMf9maF
         qk3/Igw9h8mILYi+eWEuGU47hXPsSximnIWhJENy59sandkgmv8E+g5SrlcrKF9v/RdW
         YIyMVhA2g4ybn7wTuBiXCGQlHpkj5kvsnpFqQcDB2QoR1uVIu9Enjv05da/fxKR4gU7J
         j76w0ol595SBXEVol77rHd4vMRUw/bw4B1hoL3wmEkDoYFizanXqM3/qmL+dpdMW1RG5
         1iAudQUZnAQuO6v6Xl0fVLLvr1pwza7KTskbHQu+6kcemKowyM1Kr3qtJErARPndcz+U
         e+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778489679; x=1779094479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TEIrqqD5+9V93nbJhziz0GoVKNocn+oS9pnFRNj6sLI=;
        b=jL7ZoowGVos/ddHtisu5d78hPR4/vccMRx/8KzA3ML/Rter9zGwns3DB3qTAo9WHC6
         ZYbZoKTGIK5abbtkN2xvUFLxgox6KZQwEPbcC2KlEzpPfM9M8OOCxQmCyGzhfuAnWKPY
         KUdwbes0EG/4PXgpGB+FFIBXV0YQC65Kc9lTNOmZcn2rx/8dNg09NdIoHgUHKmK+dXRD
         Ug3alx3q2tjfIUH0dsl39Icbd6CQ46Eg2zy7RczFzWb9uvxMjreo+QTIHICf3mPSE1Mx
         yVtYkMgE6ica98WTFCSUbXCal/EQTwp00cGHIoEdMErMOLZa7QEBAMenfXEiHJxwWFxv
         Typg==
X-Forwarded-Encrypted: i=1; AFNElJ/yNeSxcoGrae8mM+IkTXNMHJpCJsqystqzPnRrESKcNZGT+Cdf5YZ+rvXS3AmIoPawHOoGNZMlRQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywn6Wuz/+8EwK6v6RolSn3eMEC4mf4WZIeMbjzMGhXA9ALlB0qB
	KeBenPlEN8ZwBHf/so0lgO0+TcEzs5f9EoI7uh/HRSsLa9d55cUjQWAI6M8Kcg==
X-Gm-Gg: Acq92OEO3WkFJQJl37VWVDVxLrr2mX+50lHjJQS+btqCCS5jqja4UNt6LS0hdmvk1MW
	i1U0Wpd4IFBWljUSob3t+lBX2WNGk3plwEcIhbKxsDH1XX/+/C0X92ToUJJTO4CTrJ4HLKq7W7c
	OyIM4a9Urc5UwgJ56ZuYzinzv4FIF99RSkuWMeUdPvuq9w0Y6MnSl5JvuDru+XUotyoWVm8KvU8
	hqyroqN+rH2GSV8S2x8XjBQqcZtttlnWUk1vGJ6pI/DImvqv3/KGOem+AoNd370DFkDGuiCWD1v
	0IORrkL7ymfBYUhF0dVvEB38DBHSzaFAKd+MppzjB6eYXLIo64VFj7TNAJJw4JAcLmfca5MfdUo
	r6SoOa3XqyKky03PrafBJYBMFRcOzgLvf75Wnu9dDm85W9mwe6VYToP9j9awh9uA7pPonnmovAp
	0hZECndOrp5Q1Wd2rK+6qQbr3WGVbgWJN8gyk1dXww+e81XefzkW6mhtx7X7oPP3ZY+zdVLkOSa
	PKQJHLU0YaqYKg=
X-Received: by 2002:a05:6000:4014:b0:44f:db87:8919 with SMTP id ffacd0b85a97d-4515b056a63mr33531534f8f.4.1778489679107;
        Mon, 11 May 2026 01:54:39 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.237.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491ca2fd6sm24944189f8f.30.2026.05.11.01.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:54:38 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 11 May 2026 10:54:02 +0200
Subject: [PATCH v9 7/8] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-orangepi-sd-card-uhs-v9-7-ae48c0b2b2cf@gmail.com>
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
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Margherita Milani <margherita.milani@amarulasolutions.com>
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
Tested-by: Margherita Milani <margherita.milani@amarulasolutions.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index e20daa50a152..8fea6e87acec 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -221,7 +221,7 @@ buck3_1v8: buck3 {
 				regulator-always-on;
 			};
 
-			buck4 {
+			buck4: buck4 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-ramp-delay = <5000>;
@@ -242,7 +242,7 @@ buck6 {
 				regulator-always-on;
 			};
 
-			aldo1 {
+			aldo1: aldo1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -374,3 +374,21 @@ hub_3_0: hub@2 {
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

