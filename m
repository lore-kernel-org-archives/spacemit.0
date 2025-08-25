Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5DB30748F
	for <spacemit@lists.linux.dev>; Mon, 25 Aug 2025 17:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756142476; cv=none; b=tlHV3sGGIQsB94yJPmMiJfDSmzn9naND1eqexHQp7LC+fWtGkveJ/u22lai0HresQpuZeyv2/OvjSabGeKuHg2T7qOnjUp6OsK6Y69VIIcSaBEMeGXUpvuaHyttuBLEsuc/1YnYIHVdNFxNNmF9OMyJ6S4g/mNEemmPrE1Bs5yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756142476; c=relaxed/simple;
	bh=4MkO0yPVEXokF7BKWo63wkxjH8l6ox9Iw2xywkWl/sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WSsTBVr3+ivM1l2Sebd0brg+bYHfPpomKFe6CJjlk8QxMzdigYIKvHsISj30auAAJEe7dykdqb3MXecgfwAMindY2b+8z6rFET+0qgi/YHP+UxDWwDIc/fo+oUs3l7VUkC6SHiKsRGejeoD7z72Wwv1FztKyn1OaTbjQ3xCAxvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=vTQ0S0WA; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="vTQ0S0WA"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-8844ee2cb61so124357639f.2
        for <spacemit@lists.linux.dev>; Mon, 25 Aug 2025 10:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1756142473; x=1756747273; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzbsCOAJDq8e6tJqb71PLkWE7SOSqQYLq4powgsnVhU=;
        b=vTQ0S0WAG6CVmahXcsZQu4KwHeOp2wpihC8doCM3fWV92Zgwb5zkY+N9eihd+fF2yF
         b8D1z7kV8ibqrw2NPn5ize4kYw+xd8t7AFDJGCRQsOY13sngQP/BZu746wJ1D21TwcYi
         N41ZiYnoKRAcruWzo/IqiZs+JUhbUXJPuMP+TVtJc8vZJ+P3jd0L/AoFv3g73pFbrtcV
         OSvPN4YNojCenBPpfL6uuv8MvAMES+bHg94QC+9d4aH7LHHt3E3X2gGSwChsZnLVncC2
         yA2qbfQx1+FFcehb+ZunyU7sbS87xXjqAbbSRjeN6jInYLw6HUIFEqzRUQDiLw2vcgdE
         IXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756142473; x=1756747273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TzbsCOAJDq8e6tJqb71PLkWE7SOSqQYLq4powgsnVhU=;
        b=ERI+AHH7EvewxR+4UwnJFJHDjaLRPPYBIvCuirWJe0vbp16gbi11NGHcAT+y6mKL8Y
         9lMsfoU8MU3I9E5MeaoB+KzP6d3NXOiNANMQivEPEiGSfyqFIU30jq8j9dBLKD6SJT19
         MWzYmmXB+JB7EbtM+4RyhamgxOVfsVDD9T3tgXe52kvdbAsNWNHb2y/+0TuGK8JQY4ZS
         8ZDGUsRSfIwnhq5c4y8c4YF/6T4NzHRdPNxrEKhTn75AR5UmepQoclHE1E4XiUkTx3P9
         NmAiZ1hbR9/iwLsxUoANKwdSDR16JHAFMs9J4+KJ8jMPBqyCP4qxXbhHYnFtXMFDzQQc
         QptA==
X-Forwarded-Encrypted: i=1; AJvYcCXKyrhtZTVzHXZbl/r2h3T1PPUaHXWyjWo7D6XY9sozQfQgRfss6YACeFfOfZgZMqZzhoiyU2DYZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywfw5Ze/6HmMS69rplsr3ARLTH6IoUCsOgVeRJg6zQLMIECKHxO
	i5wIs8kRLyiYGHf4WFA9b27jnG7AYrMmKwdehfruqiT06w7rtQVk+68lWM7MchPAQLc=
X-Gm-Gg: ASbGncvH8eJqi+vUFMy3aPFLy8pMulnZrvU2VGkayllJKnH4JiZiJclU8alDL2Ue0au
	N3zwQ9eMRpGgxoAQdhU9ZQTa+BB76WhX6oZ6tMDJZIFnh4ib6KCX8XQ/0/ZOcb3/y4+l9EZZ/Pt
	VAI7dnxLuBeZeQdYxhnOmR+aDsp8JcWugFVj12siDjxk32TywEuNnl+r/ushKLjVgLfb3S+36Q+
	KJiSpvxfJVYHOUmNdzLAj7HRpvSaXQr6ZJEE3Dr8i7JEKDlsOqOJxD2KB913dCvoty4ewaGOxnI
	aTCfsMBtNk2neptQzVJ3HPumL93YPxftG9UNisbw1xtSXNgvPnI8zJnPM1gShYDhQLhCLwoL1zf
	iCqGuP/XMz/ibUS9j5/hE+hkyoFIGtNR3eoRZziS1QkN8vOhOes+yh1x/LQ7Hlqu5s6gcXqqcFS
	pn
X-Google-Smtp-Source: AGHT+IHaZdCnT4aGtFFcRgzebFZsbTIztmo+Z151ok+iHPQRKBlJjXS71cSRNdn35Lml0SBstQEFDg==
X-Received: by 2002:a05:6602:4c10:b0:876:19b9:1aaa with SMTP id ca18e2360f4ac-886bd1cf44emr1652168639f.9.1756142473552;
        Mon, 25 Aug 2025 10:21:13 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-886e60c4737sm76275439f.26.2025.08.25.10.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:21:13 -0700 (PDT)
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
Subject: [PATCH v13 6/7] riscv: dts: spacemit: define fixed regulators
Date: Mon, 25 Aug 2025 12:20:55 -0500
Message-ID: <20250825172057.163883-7-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250825172057.163883-1-elder@riscstar.com>
References: <20250825172057.163883-1-elder@riscstar.com>
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

