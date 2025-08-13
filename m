Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA1720C469
	for <spacemit@lists.linux.dev>; Wed, 13 Aug 2025 02:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755053127; cv=none; b=tGAy5okzgOZwSSYfygVGCdbphuXNl7hYrEnZJzdPwd2bAFloHS4u+Z5CTa5AzkbsXOLqLGzy065fTqZlnLRIo/jYyVR2RX/Ve4nNtqa8aF3EuPVp/IVngQebgq/NRyxSWlL7uF8LAnGqRCvJFf9JjvNUcwCQf1zGSZ5mCoTr0aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755053127; c=relaxed/simple;
	bh=4MkO0yPVEXokF7BKWo63wkxjH8l6ox9Iw2xywkWl/sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ib2sTJUBE44PiAI7TcVZGdZ1GTwRo/VLo9dUzTTYKg1OSkaGyUZd72ovDbACPULOTtrUKApQuWRu0TmJ0Stna1r9TwUE66N3zgUYxoApo4oB5KReWhrHxQO3XsktDRlIpO//hps2ViExoed/zGhq/6inprhsciawRgw80kSw2J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=CkZ8/G/P; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="CkZ8/G/P"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3e545880582so28337445ab.0
        for <spacemit@lists.linux.dev>; Tue, 12 Aug 2025 19:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755053125; x=1755657925; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzbsCOAJDq8e6tJqb71PLkWE7SOSqQYLq4powgsnVhU=;
        b=CkZ8/G/PDsziLuHD/a/EuZwX8xjGHXcw9fwBMBslFe3bfSjwrnomoiwGR2cNgmxnqz
         ka6MrWwlgVO5Yq56stKEwkwrQF1r98V3KEcWBgKh0Ar8VhRXclFiDafjvpXv5Su1oGgM
         HE9Qimdr+MPe059846qJpQfk8L8WxBT3+vt8+stBxaD5BjJ059UtEqfj6MIYYGMK9KmA
         yCNNaJFiUTkqiuFLBGxPcAzW9o4pbaEvvsWtjPaQofP8e/S5uhJ7kX5EvKkMzpI7vESr
         JOMUygimX/VcChvWEs/ZgMcL+mskslJecnphAcaBkAl/je8OYrZXEAFmReOdtGeNd7a6
         SMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755053125; x=1755657925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TzbsCOAJDq8e6tJqb71PLkWE7SOSqQYLq4powgsnVhU=;
        b=Hw6vFvk8RHVoEjNNexpISJ1508Eo5c/ljGuxp3shuvb+9Lz0yciCWfTW894PZcb4nU
         Y8WiCHenV1Ql1IRx6a72mFnXwDya8dzHyX3B74oYY00U63AUyDg7Mil2lOO71VF3y2m4
         z/9hAMSJHCREEo/KXdhwFASCz6rPXaR9kEe6cIpakmfuD3HNxxHIuXbOHDU7Wz2iSmho
         3U89zssAzo3mxTs4C43ZcgsK/VbTdXbFLpz7PPAoFlPyusbNoL6wKwsX16/gc4gmYDDh
         VGoTm7g2erQpcF3jQViFz4MS3DEwDGnHkBI/Xm4ClqyAKlL0Uoh8quduJ+X/1tyQv3P6
         ZuZg==
X-Forwarded-Encrypted: i=1; AJvYcCV3PGi9V2FpYpfTz0RLTel2xV/55RGhrZlwd9KwpQJG2HU2dD2zvDjwRYlMznGnEPFyEUcuXeq7OQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxL0ZwyCX+qa1lhdLMaN+mDe0h/jj0wuwKn9tTAZjSjTFE2Hyj6
	W15j6et9GV7B6dR9MEoH5lA1y5M1BJygqi5c3G/E63KE9eIG3DFdg6jCZCB4JwLRYtk=
X-Gm-Gg: ASbGnct0oKgBTRyuRd6XYoX6f8XNTVjFnaEEabsnX8ed8GJollEL9jlTyx+elfP3p40
	s7x/ELGdcqu7jZuhXXXdjViopbiGzaFjLID1dlwyFtr8ektlqgarh211gH/aFfOq9804U1gNFoY
	0i7tCkE+HwIECdIHiP0aFijizvllChf7h0aU5/BO/ZhXbZZzzVtC5TkLyV/bWRjqKU0PM0b0Jz7
	2nCdd7QluyD3YiEOvkbXmHsuTIRLnUbcYsl4k6Yxic1X5apTl1MoqUf1iY23aEAcK6Ou0rrpnyN
	JeVoTCT8iQmlriVA6Ho3HvPdfAhdKp/TxQLV+jw1qMG8VRK3ikowgEt2LwPZ+WnZPf0xNebF+2h
	vhm+CFhhgprWwljToNzLY8y9zXL0eDWveg7310i4iTdvP1xlqOFYrxkvZs24JOzq5Sg==
X-Google-Smtp-Source: AGHT+IEsfC/IKzLwt4IZPy6SkPXZpTJu9PySwz9GRZIpUkfEiQ20Q0ptezwTySBlx0jjAkkgtyP2Sg==
X-Received: by 2002:a05:6e02:184b:b0:3e5:4a7d:2ae5 with SMTP id e9e14a558f8ab-3e5674b0c78mr21916045ab.17.1755053124757;
        Tue, 12 Aug 2025 19:45:24 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9bcfbf6sm3430829173.54.2025.08.12.19.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 19:45:24 -0700 (PDT)
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
Subject: [PATCH v12 6/7] riscv: dts: spacemit: define fixed regulators
Date: Tue, 12 Aug 2025 21:45:07 -0500
Message-ID: <20250813024509.2325988-7-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250813024509.2325988-1-elder@riscstar.com>
References: <20250813024509.2325988-1-elder@riscstar.com>
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
index ae9409fe398b2..a11a60b9f369b 100644
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
2.48.1

