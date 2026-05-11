Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C8C3D16FD
	for <spacemit@lists.linux.dev>; Mon, 11 May 2026 08:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778489681; cv=none; b=bTpmd4o8nYPorMmtbwsn4CanltaDPkEyqoLHwjNWVLsGvTz8rtuOr/ljH0ZhOvP/uYWYPMitjx4vzvB1FUHD6NaHTZEG5OaycTOWGTmcWL7PkPDOGbMm5sv87/CWbEavUrnLHDuxLyhqI/wZ88mCh5ACSOnmJ3rBcmJo7uCQyJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778489681; c=relaxed/simple;
	bh=MIH0ATHC+38xHlXDPli/E7afDZIgbzPqgBozK7mYzwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=THYa8ubiRAye/DNBQt2lJJ4VcrRTYcA+ZziiwrSfv8GMhhq37P1ufmCXZ0zbd09iEJGgjlA6BUb/9nAcIWuntcc2iqr2f6AwWoVo57wOxNsGm1s/V/cPxKXj0K+ScRshpN9Wp1QwMlUL0kqptz8pqSfqiQch1yUC3AG/VBh3Q7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWdrbes/; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWdrbes/"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-459bf19e87bso233169f8f.1
        for <spacemit@lists.linux.dev>; Mon, 11 May 2026 01:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778489678; x=1779094478; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxFL8JcBleXAhQJnczy/XDAFmLI/O3K8Gh9JfAxOPq4=;
        b=PWdrbes/mwdixOMDr4ACZSADptV0cKorLBMHT8W37NwTJ1iWcJTgTZvM3F1zE37y2X
         LCEzo7fbsO2z9KHsgwumGIrFDNezfQVRlV55PGo7fxHnvg1hwh4QJs2+FHl69fB/HCWM
         BAGtpAb7HEMB9YHEG1h51/mPYVjbdIrfSaGsTr3o+yxRU+4FncvbTiR00JsJ4UwIDd7O
         vlL8uWsZBnmLIt1T9CevZgdWluYsTlujiutXb0395MHIxV6eGctBVWITA4kq+pDdTFjs
         FBXGLYa0O/KLHbGRQ6h/VyBwahH7ciP6doGAxLfpp+H9wlUWtynHviINL85z9xQPjTw/
         hefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778489678; x=1779094478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TxFL8JcBleXAhQJnczy/XDAFmLI/O3K8Gh9JfAxOPq4=;
        b=cjZYR2owZzgjQ2zw5oZZBWoaBVhLXZBAKcGSfQy/5iWlI1OnNZaTz2zhKBowQSQeko
         eC6FdZjyjTQCMlA1P/BmdeposwyIn5wvH6ILN7vC0kNitxBpq9nFtvweenNMeAcJ/ctZ
         wOY8Cfvh0Es2T+e1IFB20Qf7NO2alHPKrw1ftlopboyWrIuLR5+ZR4Fdsnh79s4aG55q
         otPvurGicojOmIV2w71RBeCDX/KnZSIJdLw9iDDEL8Ibgo0TUkRi30fzhzSBBpeEFaQA
         gsgDQzo1hETMULTLHD87a2GPBWE6RKofD0VHOYzOqdSYymH5v+W4rNvlHMoq63Fki5/F
         gCYw==
X-Forwarded-Encrypted: i=1; AFNElJ9yDsVfeQDVJAQo0PhcMWFhByCbb+3ggn4VZC+YJD64V5KrlsH+4rBzmuC2+EyP70lRpZlyzjoc0g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxBQrIhOH5iSzrgL++opYOMzjJtc7k6EYKmZH6RC1HzrN2rahA3
	Qsqjgj6H0IgGHkR4taBvO8jhjzk2v+DUABTTihEkxr1adFbFCAO3usf1msCUXw==
X-Gm-Gg: Acq92OFp0bAHkrqphjVa/60mN7o7Yrg0gN6zMSfjh6YVxv+qs8jan60eF7qyG3K4PXb
	JTthWHPaaAMStDh5KJMockLA96G9/Eggf/KSVAuz7+B+1up8dYgP5QRXKZOpph4SHeJYlEBOnyX
	oknefFAgn5/DfoPkRUuc1MRsDrp6aeqSFmXF4IyHXIxo4kWydR8kjbBCsoPsajdlJFdf3WUyezj
	seCt5Qe9HFG4OpbnRu3Nt0nmFx4tv/3ECq+L80wJW3ViT0v0ZZuRe2ubWGJxGitDJ8Dn8JdbUFb
	ZCEUBmHLmJPrWjTIr54GYoHQyV8/Dobc85rqDv6aoJmdbvqAKXJS2+CGsU83d1k5YnMiJXFJvhX
	6d2TwWvH6ehsd2aCU1qhKU6kpL9yNkcGX9rFh1T+QfYPFGsgQir92QqIYVrDWn4ZITuJyVZnJpo
	xK3umAGi1rwFi2dsSYwyfGkI+5MiEed7jNEDYJGU3q44QRejUn6c/aCYDHetKV+Wqw0g==
X-Received: by 2002:a05:6000:178d:b0:44a:b3c4:a04c with SMTP id ffacd0b85a97d-4546310a50dmr19851770f8f.30.1778489677417;
        Mon, 11 May 2026 01:54:37 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.237.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491ca2fd6sm24944189f8f.30.2026.05.11.01.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:54:37 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 11 May 2026 10:54:01 +0200
Subject: [PATCH v9 6/8] riscv: dts: spacemit: k1-orangepi-rv2: add SD card
 support with UHS modes
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-orangepi-sd-card-uhs-v9-6-ae48c0b2b2cf@gmail.com>
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
 Trevor Gamblin <tgamblin@baylibre.com>, Vincent Legoll <legoll@online.fr>
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

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Tested-by: Vincent Legoll <legoll@online.fr>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index c95ca38e3d4a..1ed76e0ff806 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -202,7 +202,7 @@ buck6 {
 				regulator-always-on;
 			};
 
-			aldo1 {
+			aldo1: aldo1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -319,3 +319,22 @@ hub_3_0: hub@2 {
 		vdd-supply = <&vcc_5v0>;
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

