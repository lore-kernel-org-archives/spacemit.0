Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233053932C0
	for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 07:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065207; cv=none; b=Cv6wdLBGTDwJvs6jNCuHzx0oCsZcxtbOijp2mqS2EUYWk7M9jrhG8JaJTuJLJL7XeGB11lNtsWZ+gM86VtD9KWF+xxU0o2OkyHxr8j+ZWt6Xli6/QaOf8GBNFXt9UsKSZYPS2P7T659nZdlxJ6kzCg5MJVHkEImNCof3UPbisvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065207; c=relaxed/simple;
	bh=1HbIW6/OtwG0nzFhm8AN7DBXkGaNxAyxn8jiZchQifc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QQHefG8rpR69ygO+/XM9UhlYL+r0D1lTjtpuxAFgE+Y7n0oatAeYD5kdtvGgy5/VRmxNWgEnabhQ1iIWbe1vMAjA2n5010E8WIa332HZSpy3U/ASrPY5gpAKkDgCFWgD4zrCywKiM65zynU1oUF+6J0myB/nUmKviMIYe4Ibfwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HocJf5x3; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HocJf5x3"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso49954345e9.1
        for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 00:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065203; x=1776670003; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgUUdQtr/fVKD3Ff4J9UbF4I4wxaToLEFfaMYOrzMgY=;
        b=HocJf5x3xpDzEU65KucxGiJSI3Zv7JeK1ZtLZP+kg4LuJ1Ls1635TuBtHFmVOJnpPo
         214gjpE9WPPPWN0hZ+EHoT9g4eF8dwEg7Pn5O1tVgQxjFLf+njcQYmW8WmbRePpXIqvD
         tr9BB6Uw3i43o4a00QQJt2WFGqezfnSCdQPp0MdZZls8pqGb9GLM6dylcKkSF2mkas+O
         mIZz+ckL7qJzdoyN6xhgcqfTaujxewklpeZelxOFzQWpu6N/bQBcziGnkceavCCE2T4l
         QWKXJw80RXZlC1kTQ8xpnRa/tfC4dILCdslhG6Q7fClGfUXwMY/SlZJouqSeVM+uNUpA
         iYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065203; x=1776670003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jgUUdQtr/fVKD3Ff4J9UbF4I4wxaToLEFfaMYOrzMgY=;
        b=NDNowEuSweWhvRJWVadZVmEJS3unxPo2JdYNZqv+1/BoZzws+dxWNtRF1dzQkLIhSK
         IG3WTvb5xqE6C3a7T+6T+XKFHtJxbrd5kYjNu8+h/xyGTknNveOfwaNPE2BNfh1Egvhu
         7Zm+atOx8pDr5mcU0PUf6r35legJg9IlZ6sLZQbSqSCjal5hx0+0I84NjxnxIV8ITJjW
         Psc2HUu5UuxoJs5KZRrfcngCxYGGoSrD1WC8cSGL0IAyKQGyawRB4AaIRpeThQ76+N0X
         0RiCHaSM0wns1mMnV6DX/TWbt9nKDq8iWB5eYhT9s3QjJVI66qYrlfxP3MQbsJ+uxQOv
         bTvQ==
X-Forwarded-Encrypted: i=1; AFNElJ+aZzEJpPjSY/fMWoYIBd1qZBf+3woLHHblPMvSiAeh8thAWWdxJ89tTKN8Qggp1dvtyp6upyPLMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxpgm/GX3gW7BFxjrrDRMrVlqZhTxz+ByWdX3MSBrJBTWhHN5qh
	5KDPbpZOQJcAEi89HUEQRXqW9KZ54J4NiEyKrafgzAWvpl739VG8jTKI
X-Gm-Gg: AeBDiesPWEnyAg+bSjNPuklYgxrbO8AqbENaCkcrmKNKIU2CTyJOJH67DZ30AQTxVY0
	jCFlXh+KfElkUELmTbtdbhaF4yxPMvXQyXO7SfOzQSER+GLkVpf/Tl5FU2xXIFY0kA6mQHXkgb/
	xZpZxcd+gM+leKYqo95zC8LvBlmx/gnVz0SEElEGdVh1086v/ZyQGHXbXUKy69yPLUHNA1m9LyF
	QKeF2wlI+WIMqo51J6P8yUCErfmTFFlQmks+foE0/XvSmRCtEjBwc3FVc8GhuYF7yngWSFH3RKh
	VLWGNtXikkZsK5YTdcpr4TwcJJaV9DkpJnsJ7oqtklz0tTCNB+V31uz+b2sM8GJffT6pvxSH6Lk
	CXRFcYrW/3EkUSTOQckBz5TmN5ZxPTQOlhNp4IhEqSjJQ4EA5hAzCE49/sc6Pduym44LPAR/aKl
	YY2EPdrlN89IIrLz+VCMbZjRCWSF31/n1qvQrDKxLjMNPb73/kr1MH74vm8er4NTxe
X-Received: by 2002:a05:600c:609a:b0:485:30f7:6e88 with SMTP id 5b1f17b1804b1-488d68a10d7mr175221425e9.31.1776065203465;
        Mon, 13 Apr 2026 00:26:43 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488e4d0ed99sm85734235e9.12.2026.04.13.00.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:26:43 -0700 (PDT)
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
	Anand Moon <linux.amoon@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Vincent Legoll <legoll@online.fr>
Subject: [PATCH v7 7/9] riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes
Date: Mon, 13 Apr 2026 09:24:49 +0200
Message-ID: <20260413-orangepi-sd-card-uhs-v7-7-16650f49c022@gmail.com>
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

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Tested-by: Vincent Legoll <legoll@online.fr>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 9c417a483f6b..95cfb4681ced 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -140,3 +140,22 @@ aldo1: aldo1 {
 		};
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
+	vmmc-supply = <&buck4>;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};

-- 
2.53.0

