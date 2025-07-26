Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C39253350
	for <spacemit@lists.linux.dev>; Sat, 26 Jul 2025 13:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753535427; cv=none; b=o3t2dog/vKNQPVTJaVeezk/93gBpH9AgU87v4t1wgzxe8pf0eFz+ObnNmgrOHiy2ED3rzIbWSXWI6nwjeQqb9EvB2NDaFXsTjQORVUbajmBJvmMGxEw5Yf//3YYPYXLRz3ElrB/z3APvV5JHBOF0GcbMQBCvUmJzJVG41TTlLOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753535427; c=relaxed/simple;
	bh=D00Agu9o5lMwHglRF8JEmN9Mz2SwGM8gIpQ2brQAJHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YDWwnXDM2wcwbhiZz037H68FuXl1aMyVvnZ8HQiZfLVJaIsq+T7nPMnqzF1U5HDuaVInWeKYzctrJD9bk+6cW/E+MX7lA/TF+aaXuvJpFwepno9Vz4bEgI24+rc+bUan7u/e6sCjEguY/iTJM+GQA+zxbaH8o0E8xlxrwG0tHaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=mAvXhKhz; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="mAvXhKhz"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-87c11fd5364so114352239f.1
        for <spacemit@lists.linux.dev>; Sat, 26 Jul 2025 06:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753535424; x=1754140224; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmHcfUIrXFFWAxyqlPf+YQqXo4C+Q0QbA66Hg5xFlzs=;
        b=mAvXhKhziaBJQI07JRoftHp9BlRPOG0oCc8ahs0HdNcBLmTfqTwIbxSmZ404CnUbzc
         3I6CsNe2S5RPf8gohOSetF3vxhdBE6OGuhDmQIF8j8/L2YTFWmL9FBHM4kPyfsgf6P7F
         pbzCTtEdUIPBKGL1x/SkUImqqJCco8I+iu5ZmhhVOB+pzgwpDbQqWziYavk7kehfN5Ni
         kXEK45msgkeGD+7aCaNqF4uI1w3V6sIwo5wBzHjZJ3R/oELy3MEQIUxIXb0udG8io+OX
         +4BAYcf3mJH/CGe77ZDySAmIGvYud9JxAhPpnLGFy8WJqTlEGxq60xahZoExYG7yiZgz
         veoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753535424; x=1754140224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmHcfUIrXFFWAxyqlPf+YQqXo4C+Q0QbA66Hg5xFlzs=;
        b=ik/GgXXuCDHvsJSh2Pc6auLxJShT44IzKj9NMZXF7eResllvSWWfOOUeM+2LiC//bK
         XlcjMmovJjXJ7wwto42iKQXhphAgzAUdhCnklkHnxHbkRAvByB8AHfPLJSc/VfNEf6ZI
         gu1B1egI0feZsyKxTSxFTsEVJB7I9lBbSx36XrdAb0iliUppdiOR+8Ufz1QWk8NOwt/Z
         m1TQ8GCyG39+Y1A/aBly8sZp2ytdlahrCOPxOkSYMq8/yhqtVy1tn9b1ICEcyabSxylx
         2Foz/o0y0yGiLxgdo8i0/QCJB3YPp59o0Ko7Xu1x3anQ2JTTlnQOvL5x8X3kQBn8kAe/
         wZFg==
X-Forwarded-Encrypted: i=1; AJvYcCVPO1XV3C497HLkB+drGDKQZni37m77FyWmsE+yFjsPq9JbcNKTa+rSQXrrD3M9O3pA7JDWVytLPg==@lists.linux.dev
X-Gm-Message-State: AOJu0YySpcg7MYkuNQj2u1DEbdj/m0M28b7RixqswbL/yqT9w+BFfXPo
	Mqp7pyMe+7G8d2IkoS0a/j/U51AIajQE1P2DYjTrWCbY1f0GlcJy4n/LrbuV++QWGlU=
X-Gm-Gg: ASbGncvC39T1gcPoYqw/Yn4IMxnDia2EnYGZzZmHuZSpzQGfNLwhpJ7xm5ze9lnNcQL
	Vzl/wlG+qSN3TBVGqQHeGGK3IWKRvaq3IJwCFgSOJEohUUITwrxqldmxdMOaPJ9uM60PuTKVDPt
	v0UEN1+17qOCu410iYxupqIHQvoLfZ5tPON01oqWwzdmYECRqP889WDub6vcxRXfnVfIgnv97Qj
	k3ww8K7Id1WLV8iNAuM3VO31cG9ngXv8EixFKGWMuDwuzRTLFu7Wq9SZBuZLBwneD0zxGSl7Xsu
	NVFb+uZOvMx9Ty7iZddkSAVJIIzOe+bnxcuLXnD1DI/dBcXQotLbo6HL6I4zdHjm2O4l4MEUN8r
	34Lb8qpxBwg1luCXtdQouKfwzRSVE82aXEFc/Sk/edyOEhXSckgqcSsOOAppIL6XrCQ==
X-Google-Smtp-Source: AGHT+IHnZ5VxjnvnLu84xJpltA7xsi0CvkodJCb16fAczrWGpj/N0ZZOz3kKEjYSRbp1bBk68OHmvg==
X-Received: by 2002:a05:6602:2dd0:b0:867:6680:cfd with SMTP id ca18e2360f4ac-8800f0e76f4mr1007709139f.1.1753535424237;
        Sat, 26 Jul 2025 06:10:24 -0700 (PDT)
Received: from zippy.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-880f7a4ee9fsm49551439f.33.2025.07.26.06.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 06:10:23 -0700 (PDT)
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
Subject: [PATCH v10 8/8] riscv: dts: spacemit: define regulator constraints
Date: Sat, 26 Jul 2025 08:10:02 -0500
Message-ID: <20250726131003.3137282-9-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250726131003.3137282-1-elder@riscstar.com>
References: <20250726131003.3137282-1-elder@riscstar.com>
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

