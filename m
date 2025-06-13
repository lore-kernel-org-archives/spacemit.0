Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE8725A34F
	for <spacemit@lists.linux.dev>; Fri, 13 Jun 2025 21:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848525; cv=none; b=RBiUcgXXrr4Iwvm99SVRRsMwvyJ5MTAoeQf4Tmljtyg3mcNBShM9RXQUrAllvsCyl0mlCH1kwverxa3vsj3TpsI5GvFFX5FBTGN8M6E2Jw+hyBblu4e7BkWEDOFreHECt5YzCr6dg1jPpeDTlwNk2rYOSoDZXEZADCHoWWHs12M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848525; c=relaxed/simple;
	bh=OIllGYSRU0SJagDHwnIsOjgKnsaQsAcmzSKro1vqi5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dqd9cDnRjc+fc/fatAvX3hUtMBdGNlBC3zT9uL21bNwCwfQjz0OYpLIFad5TVMOo9SySHO8aDtJdhDocy/LyIXE5pQuklzh3dp2jbFxp2sz3s5CE7QXpCwxf6Ng2yU0/CgR2BGKjNopKxesqi3GrC9JQAd7AuS85xSkg/3XcfV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=szJen943; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="szJen943"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3ddca4ce408so10072935ab.0
        for <spacemit@lists.linux.dev>; Fri, 13 Jun 2025 14:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749848523; x=1750453323; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gD7pkEGUFZ2r04BWnG63uJj9JKyQG3lB1lEXTm5IZo=;
        b=szJen943+EL1j/JuHIXKzWhKRnlapil1AWr7jlbS/raDtaLRcmywUpv67YOzt7tdfY
         4MBhuG8nNxggd2oMKwAZH/GQdZqEi2YfGXTiTMO/QRLLuWqCJW5paOZdtS3vrHE5eh2z
         E2+LnFDbq2+HavSA5N/Enc2+NdmM6zRwLpd38qurAQXMjNSJ7SMkxta8nYoC2BK6C3W0
         U9TXHqzZEA92uO78jmirCgskj+vmgqV/1ZfVSzLM8MRwVoFdaPHCIWDcR96E3/EeADhR
         B5JZcvei0pOYBAqbTvhxpY8qKg5OWekWYB9COpgvXD21z8Em/HHOVXAlV9/FDi1/u4ej
         rvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749848523; x=1750453323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1gD7pkEGUFZ2r04BWnG63uJj9JKyQG3lB1lEXTm5IZo=;
        b=o/dLD+4YGlxQEJYqxhCj1BKMcXsoHmZxB/roqPGHs/cqp83RcYSiTD7eVxP4ez/kMm
         UKSpFiVize3GffmRT2IvnBaZLjbDSldbyfl0Neo/q49kXrsftf/K/2GUQVP1gi7evfiX
         +s4MQfhaYeAJ1Elk1zBZbSbrSo3ULRZVk8ZESkpH3yrpXNEZibwgeHTE0+1UkEBSTKQq
         Ukrk6Yn5KdxdK/Bb6XWNCr3rAFDOWYyYjyZV/t/6C3P+RmlVIobaU4Kt5V0LsY+bfnWA
         7qa/k4et3dAVlxtDik/Jd70+D+G8uRY9zSiNVN7JsTW4vTq3vx7K8TnAb8ItoSgR0tAd
         glrw==
X-Forwarded-Encrypted: i=1; AJvYcCW68fZ/+Ikf9m07TGOLeNwYy/g6jMMY7xQUxpdJWHH883EXxFE6Owkz1PLHYvfpg2CSlr56hOJzxA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6xHPIjUbxw00VFCqNZABQcsXJHAzizQhNzhusDT3YGkXyYra3
	0RcxvJ+WQgGWC5YnM6gDy8ddvbDKjQYG17lIeTXoUAAqYkutic7uh2Z2xPyLlVPrv9E=
X-Gm-Gg: ASbGncuJiGiuP2dU+7PuYUGnMnqLLLLCbHnt/KoVlHaP1QAF46h+asRiHajSugxawG7
	YHfeQr3Fj4FmgpKH/JdZ4v2oTNifZqhv5GwQLEciSh4fD4mVFhEiMCfo2I+n6I/HVGg87UcFAXs
	YuWN1T5K65FhViBuTD9D4DqXXrVtFyDMfQ2RlqT/Avbx/73zFQwclw9ABFhs/S4o6vkQRO6UW94
	UA3paj5FOVqJyNnic5oMtK9cMWwGb6fzHLUo2XPAoNDWr6hPlonkdt1pJBE7NHHQrAohkHkEbIg
	rkG+k5NRqtn+QRo5tPIYmt9idkIpf1QJuROpPoYSWG9qE1fRZ1yofnALdTTOqI39rNwkGA9/9HP
	5CpnvDJWEDl8+B5HHytFB3XbUt6sPMV0=
X-Google-Smtp-Source: AGHT+IHXDat6NE+msKniBMkBKXzQ5OntQfEKX4Deb7fPFCE8SSfiXNxgPbBb3SmZKFUe07JWv37/DA==
X-Received: by 2002:a05:6e02:194f:b0:3dd:ebb5:5370 with SMTP id e9e14a558f8ab-3de07d3404bmr14113915ab.22.1749848523112;
        Fri, 13 Jun 2025 14:02:03 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019b44b3sm4996315ab.10.2025.06.13.14.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 14:02:02 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] riscv: dts: spacemit: define regulator constraints
Date: Fri, 13 Jun 2025 16:01:49 -0500
Message-ID: <20250613210150.1468845-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250613210150.1468845-1-elder@riscstar.com>
References: <20250613210150.1468845-1-elder@riscstar.com>
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
index 8003c8173a2aa..0f9a7f7a6c8b6 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -60,7 +60,111 @@ pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
 		interrupts = <64>;
+		vin-supply = <&reg_vcc_4v>;
 		status = "okay";
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
2.45.2

