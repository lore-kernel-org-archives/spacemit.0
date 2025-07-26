Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2590824EF7F
	for <spacemit@lists.linux.dev>; Sat, 26 Jul 2025 13:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753535425; cv=none; b=MupeL7MLVsxHBC6L7raN9+exKqBKCC75nduIda+ZQBMVrMuYJB0gP+eOx0M5vDSQUU1eGFV21mV0F1Zs/CcjXOK7Aq6ZVrCnEfrpZw2hv4MI0FZnBf2Bzw39Xh5C2BgguQd+nb9ytaZwTCed98nkOGhlPxjsytHs51If9tHcLDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753535425; c=relaxed/simple;
	bh=4MkO0yPVEXokF7BKWo63wkxjH8l6ox9Iw2xywkWl/sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qb8ogudDwtkKKYEVjaEIWl95Sn3GVMjUidRjz4ItrCrvhQJWk93RUOJmAmcmUtP4qh4XpPsD/eNISbi5I9m49xSvLusysz7DA0NjKN8tiQBfGu0VIx/zpNfYjgxnS3QJt/wEpn2x98Cn0N4kNK2sPcsGp0kG3eySzxaZnQbHx4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=hpkVXIZO; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="hpkVXIZO"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-87c205ca4easo70873539f.2
        for <spacemit@lists.linux.dev>; Sat, 26 Jul 2025 06:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753535422; x=1754140222; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzbsCOAJDq8e6tJqb71PLkWE7SOSqQYLq4powgsnVhU=;
        b=hpkVXIZOqUz8cNVbpR1Ss4X7ZHcEINCoOGdcgEtBOX94weDiw1/aPfUJulNPqxkVTv
         wK2ACiBguXPTa4y1iDKx2BEzXwQ3zJwp6JpgC5VMkagKOZtabP4zm9FH8LVDbcdVLzss
         n8p4kMnuIp9bvFtlJlL522F9WcJYQckGHrLsKEjU2GiskDtHdLYUqrzN1l40EBgpSHjP
         faf2vXpAWmllPdgxj/MBjBU6CAd4ACm2k/0DjmqF/5Fu2mBR1LFMsyvbc1wQQMbjkFqd
         CEC4uR3Fx6WNz/sWZ0o89KhcmPHgWiCMI4CMP0rHr8p1C5rO6PE0hLMtdpdwkJAKNrV4
         tpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753535422; x=1754140222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TzbsCOAJDq8e6tJqb71PLkWE7SOSqQYLq4powgsnVhU=;
        b=LuPBAp1UlKcDXluclUslZwniOvzMYDy21+35mmlJsomjtg6W7GVWudT1VzBwZcw99I
         7WJVh9AiEenp6OoB0mpXKwArXRIVXIpdodVU0AP7ALBRTv4kuRY/VBFSabfiyZaa2UHu
         o/ncTg2KVtlkz7KGYLSHrl+VjtnwDiKtF6sAKY+D7h6i4vAxKhA/PxHqzQ93OXMNBMrH
         jKwVaDGRpOsw+HbiIvqcblUfdwaAYox5iWyuPAVqilFvcHgAJYbwRGta42ZDPir/ARiS
         /6khSOgFXsuGOvJxeR36uo/T3d8NpjGBHzn5GluHV7lPgyAfTzLaM05Ew0knJt5k8pmj
         yJcw==
X-Forwarded-Encrypted: i=1; AJvYcCW2FFzQ6zDWiVy5mvHcd/4bZjcEZG0ji+ljqOivk3dgwFJ0NCvC+b9mZafPe+6wWTHnW5oaUZE+lw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2HpPyz4a8MYV2yL0ud468sUPIt4UwoBTMMCndKWc0rTuWRrH6
	YLOfL/Utw3gs4IrqqEKF2jM+Smuj1+oND1CR+NmhIzOa9ILIpaCKbdNVluwtTUP4JIs=
X-Gm-Gg: ASbGncswls40cXO63TeY4MQ/PrFU6gIS/2sMWTuZVPR/e5vxvrpY8zPezEiPC9ZA7CP
	0AVoB414iHjQsXx/8K4HzwuaUDB6pypuPQDv07fvmjgUfdbWvKgZ6581/zy5gFicqPTrXl8bBEV
	W+LAVVQyD5UuYftQ0eFfZKuI5WRlEnum2DDJ2yyWfM2bvISbpMkI4IGuu+3LssT1qzKjvOavtT0
	t72Tot1LYIN6Dtx4+HDe965FIni9usjmvh3MrVshtiBIllPSJFklZ5tgxxTQVm72PPl6b10C1s3
	IDB49zFcjb2FcP+NjvmgIK6D0NTYrwcVTDeh0xIWi+NBZ4NW5SQDLbBo0uQ6t8ODlkOsubh9FRL
	vC4EX/P2UkCFD1Hcawlhucc01a0WXQ1/7CCbJdMTIUP+661Xs+bg2EG8Tn21AX1Stgw==
X-Google-Smtp-Source: AGHT+IEpZQvcDQ2Fiuw6rkA+hiigtzBH5kJa9koi+D0lRnfSJ/J4FDcv2OYkyFVUHNTZGcQVha87bQ==
X-Received: by 2002:a05:6602:29d2:b0:85b:476e:ede2 with SMTP id ca18e2360f4ac-8802293bd79mr913033239f.13.1753535422246;
        Sat, 26 Jul 2025 06:10:22 -0700 (PDT)
Received: from zippy.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-880f7a4ee9fsm49551439f.33.2025.07.26.06.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 06:10:21 -0700 (PDT)
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
Subject: [PATCH v10 7/8] riscv: dts: spacemit: define fixed regulators
Date: Sat, 26 Jul 2025 08:10:01 -0500
Message-ID: <20250726131003.3137282-8-elder@riscstar.com>
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

