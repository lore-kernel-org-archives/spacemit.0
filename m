Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA3F28BA89
	for <spacemit@lists.linux.dev>; Thu, 19 Jun 2025 13:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750341124; cv=none; b=F1xzq7CyhYSJN1WkQAatRZOGO5+k9nYUHKh225xOs9RI1ZPOHcC6nwf9uLWj+s0mNXjoEdCfNBZtgQNfGjJ5GITuSdrWM83aZZuf20oFY4ikmY0rPIjJbo6ZBlltmXyqh4tw+p26DviGg/bzST6Mw4L9pr4Lkf+9gEed3czkMUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750341124; c=relaxed/simple;
	bh=E/I9W6fX+DhSmsmtI3yC9YfnKc4TowcG2XvObw3IonQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cn2EOrqley/u5vSxvyVTYztP1OmM04MlT/gw9ulFccapzaJnS6LMtOEKhAl4YkwuSMJs4FIvZbxS3DRPgj3QtNjWaLUCDjr2H83WgwahZ8H8P+5JIz1p2J0v+1hvGHrV2Jrn4fRkq9X5AlKfXhXf4dJhwUb8oJwZTKfe5YMRCzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=tIPZTMxz; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="tIPZTMxz"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3dddc17e4e4so2617095ab.0
        for <spacemit@lists.linux.dev>; Thu, 19 Jun 2025 06:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750341122; x=1750945922; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=tIPZTMxz4Y1KigQfouJAsuYRMirMShDbsX2nEVqakLEJrwdmjpTpEz7KhFAEcVWO8k
         79KyHG86OrU6p0H7niL8N4GhzgM6t4C//L6eQ3DXyvVYrRudfriBl6OIXfVmG/t4dDX3
         m1caM45ZQI+I1dTylrnelxsdSl0w+tHCIQChtYclo8+j3yHUBlIwx5D6BySAtBvgcaAH
         YbKU94H2nOIkV+8d8YstoJ7UYN/M9ADCB2ckAg5Yfe1oxCF/npD87t1XcvqBRbyNUu2s
         efJekx9IL4hV26/czAQGn1hm9KOZWgfDpjQUol8CO8+U/BXoCgPwdLpvaofUUVcdLyx5
         B29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750341122; x=1750945922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=QuWrozeuLB8xBWzTLc46OAmwFx9kVnhZJB7Twv5CCAfPSbD0EoR1Y43osF6dBti3Vy
         YIGTIN5VDVsjwYfOLIao+G50nyTqmbyF69pKdY2YPzOvXS6t+WD/xURZzDZDbEASDnOF
         3wd0jMvZT6gJILKGIVZoHumDxQjyQeHlkw8oE/WANkSDqMM8z+8+7bjEdxIg6anxRIC0
         rxpuM/PZiizkQ2QG0WCanvzJpYixfqKk95xF0xGyn+q5zBgADCbMGJnDvAf5G1/JNijQ
         3D1dZpDd4wmyGa+l3oOCCpb8Jcg662OaimxIz8ivo71uOYgKG9h0atD9Ir5x2fc6Wtky
         Q54w==
X-Forwarded-Encrypted: i=1; AJvYcCUWkX67HOh+/qWVY/vbyCENgtJcRK1dwFn3fshWU9+r9JWQeJ3e5Ub9P7zv3EZbMwLe9zvtuiqmUA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yysq/I81Px9s9ZhOGEEQKcyfJS4QgqVNcjVz7uxBIuWUi//hxtL
	c4yQwQLhCYEEuJgWNs3q7u9KwVFkDefoowLGrYYMCXW42jDemglSjuftsmBcsX7eTrM=
X-Gm-Gg: ASbGncvQghTnHZKAhPiOAPIYMGA4wFct2GR3daYIYXb0GldR3T0iva+TzkuXmMwa7E6
	gP/aYTrC1IqSQvcFM5m1nwcXDHSKRbOEyYFo0q37Yilz+ORr7J4s0kSIibIILNPjz3K/D4jq934
	kCZIGEDS5ZLGrtJfsg/8jL5WJALM2RK4L0MYIgw3qlZ1v+683GHL0Y5Tfca05mohGilAJy6m8Or
	siDbQz0A0vq3f8OSLOiR9Iy2hnGxMFONy6PI/qAhI+0dvbW/eSOuvb1TOaztdH1i4feKHvwLA5M
	hHr2FuuJdyElMNYFlO5f/5r3oFcgTQ758nVGvcSe1LkufocfJBKQMkv29mlfGrHo8TzAstWTQOB
	wep96ZpfJbb1bn6Hedz1bMhgH+v0p7SU=
X-Google-Smtp-Source: AGHT+IGE/+9c8lEGLG5Mz9Y+oJ+vIpq7U0/P4Uj/YFoaee96+eti9bY0TLGKxf+d/f/CIswKZrljdQ==
X-Received: by 2002:a05:6e02:168b:b0:3dc:7cc1:b731 with SMTP id e9e14a558f8ab-3de07c21db4mr231847495ab.0.1750341121785;
        Thu, 19 Jun 2025 06:52:01 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de01a453b4sm38246015ab.47.2025.06.19.06.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 06:52:01 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com
Cc: wangruikang@iscas.ac.cn,
	dlan@gentoo.org,
	troymitchell988@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] riscv: dts: spacemit: define fixed regulators
Date: Thu, 19 Jun 2025 08:51:49 -0500
Message-ID: <20250619135151.3206258-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250619135151.3206258-1-elder@riscstar.com>
References: <20250619135151.3206258-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the DC power input and the 4v power as fixed supplies in the
Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 7c9f91c88e01a..a1c184b814262 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -28,6 +28,25 @@ led1 {
 			default-state = "on";
 		};
 	};
+
+	reg_dc_in: dc-in-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_12v";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
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
 };
 
 &emmc {
-- 
2.45.2

