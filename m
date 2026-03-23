Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FB438C42C
	for <spacemit@lists.linux.dev>; Mon, 23 Mar 2026 10:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261180; cv=none; b=q9q0yTYDB9Ybl9c4mc39nPxVVLPcoyj6ri5aEG5Id9FPi4oso7cHa2j6DoEJFuF0Vu7PfNtkVWDPZ+JPEKDi0xuLrWnDOcFE1aXYGoch/xM9cC7czEJRuyz6FlKZnkqC3KgtaMWY4Y1QwgM/a+mzO0Tz4XFp0uc7UZS0sA2obCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261180; c=relaxed/simple;
	bh=UQ7f01+3cOZP1rigv0i6MWf6GRkDoBBSKgBLPigIAzc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SrCGhgj0hGMoDCarTOgW6LmozV6LMYtuDM5rv33JoRRNMrBBVvSOMm3WpgEkIwExFXb6uNxRKaHf969wRsUKtjT9EfDzHiAZwEVKw4MewGb2wZ6WXJhVitPmk9LqNdQFmQqXceOrayS960UNfLY1RxhRJEQa2UvG2zwAyr8axo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/moMcDf; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/moMcDf"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486fe36cfabso13894875e9.1
        for <spacemit@lists.linux.dev>; Mon, 23 Mar 2026 03:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261178; x=1774865978; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzM6tXzzJeFaZBA5QZ0/60M4eJdHh0h1cI1z3A71Evc=;
        b=Q/moMcDfs1du1gIofAxU/RDxv7BTSHz6sWz/nOIpVfQkX5wvWLLLTxPqiJRaP9Rd3v
         qncBDZj4sNEP47i6VlJV5ka5u1Qv0dRVcHDVBq0oBp3vF+CKx3l4gtFcAn9IxA3Lbkht
         FruiMboBmQZ+a+t5vzym1VrGjsRNyMSLS73EhEOHTRsh3jYWdvTUO8hKs6Pap7AmKF4x
         YjUGDUCqqSkN0Ot2DM6QDAt4IjPYslGgHTLasZHA2VvAsjTyMLqfT/Zrrx/h4Xcfi9lL
         mtcFHzD7t+HELYbIwotE/mDf1GtQzycdysqYCAdBX0imaN7O4c1QPpsv+6owXtAFPhwq
         +eug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261178; x=1774865978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LzM6tXzzJeFaZBA5QZ0/60M4eJdHh0h1cI1z3A71Evc=;
        b=PSaqZoJXRDOH/4z94BnfnMr/zVsXh5pFXYFQSMquKb6N07442xc0af2fxEW/doibpZ
         fa31Kbk+4FyHMC0DDuKqUWI1qRy6eIZMLc1webWuif7PWvhXTvqCj+Y0tKF2obY9va0k
         8intYMiotevysCpnXxbrSB95OCSQYZb+ss4FMWHGixOj6btAkwvTw4yKK8f5WbbVoZhI
         jfHdl+CJIbdab2ZvDoIjGbxfAlcdguqd+ucBCvkVUKMCI6JmyvRo++PRUFjv0Tb6f809
         jg+S3jkgdilg8ZnkgCbPEggu0cYxRAJAJ9pzaYGFkftv7om7b5FwHz0rh6/VntW3eHde
         H2hg==
X-Forwarded-Encrypted: i=1; AJvYcCVJCXSy0Bcci2gwMEcV/1E7v1ywWda767F5oy/23gpU5zqyAhyLcTtZ7LeoI5IKWhRrnUd9tpHwcA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTpx9jQ7DP0yyfYyeshkVyUdf2KIIht0iDfxmWbyivE35Qh7Xz
	Q/I/J7iF9y+D2hWhh8agpFs4RK6yw5IiYbfx2kfbegswHPSY2NeJ3GYV
X-Gm-Gg: ATEYQzzezD8eMcu3japGcFjvzcHIaMRfTlnMl6bbOnm5pGYGf1CgD7ahP3l7WYbAvAm
	ZQb9NkcT3XjTxo1UAteyqDg/ycIfwAozom5VfH6SIKoMkk3Dz0hoLpILrqKzoKjXsSE1e7Amy+O
	HB3xhbAlyo4NkFt5bUhzUiG89PmW88fbcZOOdIzd3UQdnmsA2b5L4D1p5BiNB/tPjlUX5XOyxiX
	xFf96C8EjIGGzJgLiGPKkuUyadrghnn51ccz9sYF9nWkCkxSr41L7G4TpgpP3iIG5+7yR9HGKm9
	f9VN3So4vtmWynjJOYilv+/3tRbU3/RM61Pvlddvtntp3A+uaLw1TD7efy+tBlaLGq+UIA8xEpc
	lC5IdskEV4A05VoQjSHx5e46Y0mTlw/9wtr7vvC2oV0K/26rzrX4BGjjNYpMRzvkOsAFd5Q9Ex2
	xpzmoQZf6Nxj8xHNoWr8LXbTCspTsrStb8X3ZeyRiUk9/Rs6/ZXyT10su+J11HnyBreautXgzHM
	Fs=
X-Received: by 2002:a05:600c:1e0d:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-486fe8efb0amr191701715e9.13.1774261177699;
        Mon, 23 Mar 2026 03:19:37 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe86acb0sm78755445e9.6.2026.03.23.03.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:19:37 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 23 Mar 2026 11:19:08 +0100
Subject: [PATCH v4 5/8] riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and
 power infrastructure
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-orangepi-sd-card-uhs-v4-5-567c9775fd0e@gmail.com>
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
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2

Add Spacemit P1 PMIC configuration and board power infrastructure for
voltage regulation support.

- Add board power regulators (12V input, 4V rail)
- Enable I2C8 for PMIC communication
- Configure PMIC with buck4 (vmmc) and aldo1 (vqmmc) regulators
- Set up regulator constraints for SD card operation

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 48 ++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 7b7331cb3c726f11d597f81917f3a3f5fc21e1b9..9c417a483f6bad6e60617cf8d5400ca079588726 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -19,6 +19,25 @@ aliases {
 		ethernet1 = &eth1;
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
+		vin-supply = <&reg_dc_in>;
+	};
+
 	chosen {
 		stdout-path = "serial0";
 	};
@@ -92,3 +111,32 @@ &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
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

-- 
2.53.0

