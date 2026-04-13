Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E20B392C46
	for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 07:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065215; cv=none; b=iQYg7wPT0u7IQXWLeGkCMXcaKQ+8wsPWXDsPpYd6OwbUMO0b4VbGpRVewRc2gn0Cjknyxectug4TSR4koGO6N+PG5OupyeOzVdjuh7v92PtaS3EzLhQPd0EgJc3aJ0pF6vmkNCjIN0hQyKG/t0T6aylGyMGvNI2/EaY4OF5hgd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065215; c=relaxed/simple;
	bh=yPVLAlhkTA+kUGyF0dssolOKikJzb0AxKHREa9fEcLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qfz3fx36yckB3sefCEgWabmrmP8IkPoLwQVO59jbf9RFP2yAvXtmlPSSr5NuGtpXamVy4NYOb3Kodt/zdc7Bj0mHUQzyTZ7QxGQdAP8oSGXRy5bnP3Pm0jWRrv138QBTvpTj+uzaBRnTnBMAEmsvIZiIlPcV8cjhbY/6vKn+Ugc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ShIOUnOU; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ShIOUnOU"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488afb0427eso51383085e9.1
        for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 00:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065213; x=1776670013; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39t86zaG16kXe9hLAHIjg+gQj/3rkIeOmwWRfItDZnQ=;
        b=ShIOUnOULSGCLoRYUxIVrx/kZCaHVtntn7ExZJ7ZSwJdAfYFVnsdQXoqxhjTC4h2Ls
         JnwJQj4+ypcGzYFlSbcVQ+r2X1XywL5eFewuYzY6h4N8sT7UwwRPwXnDpqbebhuO9vFk
         JzxXllKQcR1xiQUbrOZi7mSgF0gZuBjase6wOHCOXQAEqcG+gCzTW8J/mP0RIea74I8w
         HB9gLx6VIgfCLAJSHEn1TqdyPnGwPAbW1erEfz6Gu5ZW4RjCQd69hfi7iiMjPtw57y8w
         2FoPbeKGsu5QwwQF0QQxs/9VHYR218qac4TqkOLkzKlTGIDNah631g4PmjiIUvpCL6uZ
         e/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065213; x=1776670013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=39t86zaG16kXe9hLAHIjg+gQj/3rkIeOmwWRfItDZnQ=;
        b=BdaFEiAYTIKGuCgZpTf0iU9nxJJqWJIAGXxHbJogJpA+RB22mJVhDVcvagVaYa+XbS
         XRKC6DiKTV43bwli+0vyFExlrOWdOkBcz4BrCjNNAdV+xQz9kLyqVEhJAJRESWC7GWQo
         8Eu+TvRLAjAAQA1IvVRC+KiixiSDiPdLMmFUl9YaFLHilZ9YYae8XhCD+0ERdRhjU+5B
         fCWHo0DYqjICZ++HkfvIWoz6qJNhFaatHmsjCJ/jb1GRB5UgnJbqTMIz7Z7p5tYqB94y
         iJ5+0W/lSNHuK7j2aL3Mjpr6kAPQkO2GU1mygh8CvOrhA6Otm9DQw8kP9S8PuSVEuYk8
         5C1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+95vihi1gHGQdYcJ2dLyNb+jitMU0C0V7iL+dkiQ243lq7WYzTu+1Emj/ir7MG2KTtp46rGpXZgQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxqs+SCM8juBaip0BkBcElD+4JLZ8Ga49NSNSBzKsFo6mLtIBQj
	SnTJLSDhbLn8B8CLW8X08fdWUuzBhBb7uop1GX4ksYd0AqHDOyTafBY5
X-Gm-Gg: AeBDieut/7NMQn0d/FjP8kqL/Zxap4CazyJUuAtsdurCJBAoFokQBc6zQl05BHTifIB
	qRu/eeC8XpHtSyhQSK7lg65H8dDWYSrR1V2AgumNqOKKFhz5W8wOXl28AvnMarj5x/iNffbN9In
	esex0cqmMtDHqQCYYhOebnewmDC4agSTIN+lVT3DZ6ulCV779hHuwG+1Y/9C388N+i/7ffOkfyR
	Z5pJ0/y3nsM9wiic+KjhtPgeVQAdqkxQY0UBR2cMwplcDgZ8N03DWAM0ZXeYSY9OL/UAASlBNku
	VlCvc+K6ZWa/DW7hsTJKs5rUs/eo9VSWHMYyoDtbWotBD8KgHnrW17Hn5TN4PS1Lq5+cOI+22EZ
	UuQjF0luGmPk9qEQEnyu6suAv/OHE/IkANaNkf2MNpVb8GecKsGVe3lX+T6ePqRH7mZBnQ93jkF
	n+/Rs9Ob4Ry9lWaNHsMKHqz17lbJaYJj/4x/wqHVHI96NE/WrUMU5bhkvmYS+hplp9zQO8JBRD6
	9E=
X-Received: by 2002:a05:6000:2586:b0:43d:1c7a:8b59 with SMTP id ffacd0b85a97d-43d642ea4c9mr17192774f8f.40.1776065212404;
        Mon, 13 Apr 2026 00:26:52 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7d5812dcsm340817f8f.32.2026.04.13.00.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:26:52 -0700 (PDT)
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
	Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v7 8/9] riscv: dts: spacemit: k1-bananapi-f3: add SD card support with UHS modes
Date: Mon, 13 Apr 2026 09:24:50 +0200
Message-ID: <20260413-orangepi-sd-card-uhs-v7-8-16650f49c022@gmail.com>
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

