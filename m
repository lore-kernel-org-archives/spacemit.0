Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B04A26C398
	for <spacemit@lists.linux.dev>; Thu, 24 Jul 2025 20:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753388731; cv=none; b=jYB6XjgDzArPEEK/8d4h4DH+tPoLhivSN5xDXOzEoLqHaEmz5w0MdxH2zvSpj5uNW7jdUiJVgNI5PDLqUxmWJ9ZVoTkAb/yMpQMhRjXBE4ISCvzxhjSHxaYb058R+Pod9ntw4NKDlk9fYZLeGSxLQRb/+jqgYeMrB5yp3KhAxDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753388731; c=relaxed/simple;
	bh=jwtN0xCvslGhNw0OABByaDpfspJTfiR2J4AISKnWXAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jN+idoxv5BKn/VJuAnbQJwG/P7HNFKiw1SMIV9UkKQKSitGWh2rBggyR0igUK2YuNQTv2Ypzf+DhX/D//9OdBWOr+cXB4AAduVsP6qRdzcQmaNfnvS+c5hevlJQg3IlH8WLUHYCPNTXD3oWOddd/MefifCdePF360qZg5zcCdfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=3YoeuEBR; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="3YoeuEBR"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-87c14e0675dso46596839f.2
        for <spacemit@lists.linux.dev>; Thu, 24 Jul 2025 13:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753388729; x=1753993529; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBB5jxvs8tf52E+gAfvEPPxENYUnIxfjNegdT7+viL8=;
        b=3YoeuEBR1rCyyFAAnvmDJVbeShR31cjCW4Xjh39UlUU7r/fhF12Ik+R+dyB23zsU98
         BPSmy9vyw0Tta3yV9GrslDgMW2UPnSdQtDUd1/ff5h4LhfdqWfrj5EGATlvY6ZoiZpn1
         FEdF5VM71eS2IxKZGTFEbpv3CJONrmCyaRqsm/wy26HdT8/CQ20aaJMJIdLmmga79Rgm
         Ht3+YkN+WfL+xfJigKviAR7shqGNupO7yhO6YfssgxUKNutGay/0dMwLPz7OBTtvb6aT
         mMVHXZecU8gC9/FE30d7IrsfIuBXHSegLov++0INUI8+cXzxly5oUUFy4B05P3ye4GqO
         Ro4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753388729; x=1753993529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MBB5jxvs8tf52E+gAfvEPPxENYUnIxfjNegdT7+viL8=;
        b=r+Sk3ge9PLIVzibtTt/Ru+89dPoxMJNqrDkQUpUFTWWuJ4MSx3rNa2iZO/2ctcZx2Z
         b2Odh+qOs+MYFRFicIWQIhDdqZSqzozDjV8xCkgz+6YsYa/dQHuLD1kEZAjbrvCU74hG
         LpgrLdD6rEs9uDX8aojryWCM2foUrCaDXCt/A9HGGeJJFtqXQbXshuxu+f/+T7ZFDDCq
         4SeaRLuCi6BJPDLvQ6914uUIBM3cBIaNpWkMjuzbknwSonRgKg7ML1g0010v0PQLp4IJ
         evJJhifITSSd+E6u9F+ieGcK9feIy3bVYv8xGaBekQoF27YGrtfaUKjrVo3gDkBQM93/
         9BQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4Fo2WSpRsEkrqQRk5kGuqaVoJpmawWFygIep5MaH3WNVPprjHitAH+bGaKG9/xNE9RwvOB+oqzg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0dKDmp8w4nJngFatwiosYqFAC8naxd3XIKRzk76j9RExbLM06
	Lh3NPY3ygYZiXPVAXeTRWh3fEK90+BaaGA4cbq4UbIkn6iqCNq21EyM9kIcSUswxizM=
X-Gm-Gg: ASbGncvdNQsoC4zgVH+t3Amx1+MYt635j+QyalW3ti/C7FHFqCBhYiilsLHLJ/Ec5xJ
	hM3ZrWwmBNIb34DRA7UEhM0In8agMd1hLabDrxaVHZhls6/D27uSlQf7hXfeZSjkD98GK2iFrCK
	p+4nBN133zWTD9lKmczb+IRFGTm02Eex1dqkC3ZbWaY/wBlS8Bhv1PZUX3tzUo8zz9mNYDCTq66
	c85STWUQWmo/9z8304rWtxhnSPiECKGvbHNirq5dIp1pAYfe/NBykQi0n3jTjJZYol0gfiNyidv
	Yb0lO3LMTEVEwWZ5AieiTM++KKSs7+4123qM7IKRulyVAT6pWeFxwhAVQ1y9q3Z17SyoJ3Vlv+G
	5iy0qUZaIqLP1YzZCIKy8qavm4lL+OhCuxn69wx81
X-Google-Smtp-Source: AGHT+IFA8t+gyzjGKf5ISSrexvmdiq2MvEH9qXOnl6ziXQ6Yu+XepclK9trDk+vKuFcx+/4K7eM8jA==
X-Received: by 2002:a05:6602:6d04:b0:87c:3495:41b3 with SMTP id ca18e2360f4ac-87c64f2f532mr1543017839f.1.1753388728685;
        Thu, 24 Jul 2025 13:25:28 -0700 (PDT)
Received: from zoltan.localdomain ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-87c74316a3bsm63080239f.23.2025.07.24.13.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 13:25:28 -0700 (PDT)
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
Subject: [PATCH v9 7/8] riscv: dts: spacemit: define fixed regulators
Date: Thu, 24 Jul 2025 15:25:08 -0500
Message-ID: <20250724202511.499288-8-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724202511.499288-1-elder@riscstar.com>
References: <20250724202511.499288-1-elder@riscstar.com>
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
2.43.0

