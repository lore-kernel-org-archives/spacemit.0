Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80801E5B9A
	for <spacemit@lists.linux.dev>; Sun,  3 Aug 2025 02:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754189912; cv=none; b=hIIiVjXv8ohsYuSiSN0nAmPKEqzJ/71LU9A9zEPQLRRcpb+279O+PfCrGStTfmeQOlwhUdsueMj/Ac+sRd5aDKTeN1lhg6ipKMq3Vo1cpgOiH7zHSAsXNrbUOtCvYIyZ7qefZsv4AFtseO+95eom8qFr4UJKk/y5wEtYZKiC1mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754189912; c=relaxed/simple;
	bh=D00Agu9o5lMwHglRF8JEmN9Mz2SwGM8gIpQ2brQAJHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V8lxVgaciDBmAGdd1LBfLDASGuoklFK6nQfHzyaJ+RUB8DyE+jgL+z4r0ZL4zm4syNooh1wNVuiBDzhjxozgbwsfOdWB94rHCGH1dtUY79+QTuvP2/eBCL27W8h6Bzl2efOyQcJzq9dLWJ2o3th0g27LcBaLEx38m8EZJ0ZuI/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=bi8pb0mI; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="bi8pb0mI"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3e3ff43383fso24443635ab.0
        for <spacemit@lists.linux.dev>; Sat, 02 Aug 2025 19:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1754189910; x=1754794710; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmHcfUIrXFFWAxyqlPf+YQqXo4C+Q0QbA66Hg5xFlzs=;
        b=bi8pb0mIyQ98W4svCXaaysxcLde9PKY8oAdxnXTnJ4sD0+1nwmPlOkhEoRll/f2a85
         3cDIUDPs1qzHiguggVUYsOBvyLRdOvZhCDiKMvY4Kr8KV3Ld7GHJHMtSCtwpU0PcOdyp
         W8r5i2ZWLt8Qx/tzA7kMKdzBWPVW6mBXwvnFLH1/DVphWi5KKyNdcdfTEUpbzHpEEXpC
         mvaTNd8F54g80OSShguKbuHPm4G3x9ZpU8bD6Zr16pI/ew8Bh05qfq7GcWvWcI5MPwKs
         7s+XB7DXH1oDNdgYgW3LG35Vg70iakaw2WPrdCFb7xjYDVsVjJ92BLUgIcrOz9pmOuBh
         PPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754189910; x=1754794710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmHcfUIrXFFWAxyqlPf+YQqXo4C+Q0QbA66Hg5xFlzs=;
        b=AGr4NiAKaNLyF53Y9n/ho1VzLgLUA/7z5WUZODoOnuUdF/7qjvSPGDRiMf1+r8+STN
         LEdavL1gbdHQfl8VqWchffPwXUWhFGPhQvoS5X4t5XrRZxhHVG5vKnBhVHd0U19P1+ir
         PdgPK9cYsNbBJn7b9AkoDIqKgPn59D7xm8JcYhmHyIQUnWsXIMzFLR5907i33ro1Bjwb
         lt8OkiEW/bSVLI2OzG0dX7pInI0SDwML6o/QoZUiTndjK4fLiQjWFNjsmZ/4koUHDHxW
         v7EU4WU/dKUYEqeHOTcfQ0KXwG/KbJa5jyoONDWrvz1XbiTXQ8SoKgAD8MN4uPcwTU+4
         92dw==
X-Forwarded-Encrypted: i=1; AJvYcCXXGATzF7CAbnqv1XCOsLEnrkMLtgE5Q9fff9lLJJAAQRxezQByFZ/HP9V6har6K8GqS70r9A/6lg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwoIn8OoXnjAIUAd3e+9taVoqW9rKBKfdeaxOz5FvR+Bb151/nW
	XvFttOww/NpakgpgWlQxcToyO/By4cNOrytSlV6ZhKJ5/1ouGKWOVw32aWr5flOhO3o=
X-Gm-Gg: ASbGncshbDJ/nReRnMhG0WeYPzxZzKDRPvEKT6wf6ruJLix9FZ5eBz5fdqRhhxqd88m
	VKwtXPjeKhBAvPgml2Zeum3IlwBqs5wBzN6N9DFMWYdIsVgQ2v7p96VproZ3sFFYoGIlQfcoa6G
	Ybw9xdycpu/cvDGkBHAqMK7uz+SdgpVAr8kKAc1b51OEfq4MOezhfDyLUI6v70CtVw5aD2L51v4
	fLoA5rFBYeGcLtX+hCrA6Ai+E2C1j47mj+LU0XOeJB6DTHSS4UTpwfV5cpr4Y8GmWqK50LPausW
	OoHJtk/xXCRO5VNFqBvHF7GtGP/W6MTGpuR2r5YcLHVudsQuTm/pxB+t8ioU9sC7Zg5jus3bVj6
	3s/Fryl+G522/fBQf+vP/AhMrnBR3EXyCp6T/4F6h1weT2DheRt6/OH1mZTUiDz556w==
X-Google-Smtp-Source: AGHT+IF+PU1Ww8JQGqYmDAP1BywlMvxMvsGkL0JMtzACHATEhfoG3q29UZAUTYQ4U26WEgaiO5kgRg==
X-Received: by 2002:a05:6e02:32c1:b0:3e2:a749:252e with SMTP id e9e14a558f8ab-3e416109acdmr88472255ab.4.1754189910159;
        Sat, 02 Aug 2025 19:58:30 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50a55b1ac2esm2251906173.1.2025.08.02.19.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 19:58:29 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux.amoon@gmail.com,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 7/7] riscv: dts: spacemit: define regulator constraints
Date: Sat,  2 Aug 2025 21:58:11 -0500
Message-ID: <20250803025812.373029-8-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250803025812.373029-1-elder@riscstar.com>
References: <20250803025812.373029-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define basic constraints for the regulators in the SpacemiT P1 PMIC,
as implemented in the Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index a11a60b9f369b..a9a2596a94e89 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -68,6 +68,110 @@ pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
 		interrupts = <64>;
+		vin-supply = <&reg_vcc_4v>;
+
+		regulators {
+			buck1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			aldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			dldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo7 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+		};
 	};
 };
 
-- 
2.48.1

