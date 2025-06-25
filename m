Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BD02D9ED2
	for <spacemit@lists.linux.dev>; Wed, 25 Jun 2025 16:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869695; cv=none; b=Z/+H17MsC8nMt0P+w63/RT+SvRrsoGC9gY5mllKDNeok5MoguonSW3tZBSn/neYxT3HEzqYXU0YZoWdvIbikx/CEpn5Xa3Hv7MDqZmW7eAfkOxjatmmei5yva2vaMa3SxjTY9bekiDKfFGh7myunij9PvkYZmj3df6YmVoLh+hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869695; c=relaxed/simple;
	bh=E/I9W6fX+DhSmsmtI3yC9YfnKc4TowcG2XvObw3IonQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ftH3e2inVPQl7raY5dLgL4eNhuryiz66GXSS0rRFVUYqM+mdyEOtQG/IZCRfBfJ73NwetAJqOFM+s/yUkznpwhdTD+Dcdj7rr2J41F0mTyALdq4g8g3C1pf72hEOapm2yPNuTq9Hz81rJ3n2zX2xHe5uz4PQdLKp3lel/UJkhzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=xK7h1x78; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="xK7h1x78"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7d425fc4e5fso8148285a.0
        for <spacemit@lists.linux.dev>; Wed, 25 Jun 2025 09:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750869692; x=1751474492; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=xK7h1x78QVoWBW9G+uZxot4wHkRQq4AT9UEYicrBetb/7/CjQ0HYCnwcK0zaKldCkV
         CYfgP0SAzLNDZnZE1lCoi0heQbinQTCg3SeKx486R952GXkNXl7f2KTcT0LVSNwlIrW4
         Rdbs/Ni5JkjtSKn2Mw0Rvkq06D7BR9XqqTViMfJEEpQ1Ke/SI0MnmnziTeVNeDU8Lsbx
         LAWREvWjPxmNbw/E0NW6gOpuEbFo3n+5vNUSRVoiuNChANve7ALekHbaTyfQuYzTHhk+
         dOBQ+dJI/n5mbL8pb9MHnohd/+99gjiFpOrDU60gxWR1qV5sMmgWEgpR9ohBXboOSrWd
         QaRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750869692; x=1751474492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=Al/xFt4e20p45KiDM0BMMAWnb0xSsaVtmefQYASxd3S6SzedZ/xo6syN1M+fGqYZk0
         EWAwk/eevixJkCo6PkcWBuXQcvHjMT4TGYb7H3s5J7COdw8/VM5YvvMypxcp3d6Vp4h1
         vDdmAnMJpJL7lJmpN9xqjnkwWScaQCaZV4qRNEF+NobDTBu0xnFXsdhDSfPhmFgW950L
         ux4CJAp5eMeUMQzJX9ls9kQA07d7kXEbZn8GZfAefAa6E5aXiAXPeYe9tj4b4L8xCqsE
         EDMdrY7SMlAMyR7Qpo2KQaPCiS6wQfEWoxKdcu4Xqtf+1SZLi+TXLsjKjLTm/vUHJ4+X
         9xAw==
X-Forwarded-Encrypted: i=1; AJvYcCVdDr8CdzVVLgkYPCo2btW+zfWU4uY9cPGlCojEcgvxXVWL78ZZVblCpCKkhUlez92imr+Fw86+2A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBjWtrRh3Pw6eYlOwsXES2DBBLXQ2TAI1hQ9NmEjtmwY5E7PIk
	mUB1dRh5ouZCmHSz+47g6CHerbMLs2KUDwiQL8mDFkRpOiTGxiAwQHg7pwa2l7AsGuk=
X-Gm-Gg: ASbGncs7NIN/sZbrTeTRft0O2wJyhRhs/tUhrlKTv6Kl6699sHcamSRY5rJTrX4dCxr
	WKTnV3JDTMW9YXhNepyXDfjw7SVoDLaqpTXMEW7visLws2gp9lPVPzhw0C9eokP4sv/jskILHT7
	eQxVS4RSiDtAwz2nAdzLgIT09VhDy/KECGqXZvF3lECssAXIwEznUJFXwMEhXWS/3WxqtSay6PB
	R7ou/vpHZHpyuVPcMVEsFdRD0dur5kAwaxSkxoqQZEmsRcnnqFpUk4vEsgFIuZLqjhlN5kXXxKB
	RGfH8szBMbuc76xr4r+1vGtytCIlJiidOQYYpkSTvJqWB04hW855QTvJFgy87MXHwDD+7ajEkw/
	9/sm5eAQ1EfceW4sMAmxA17wBa9HEeei9Jlk=
X-Google-Smtp-Source: AGHT+IEwItQMBBDI1vzRkKuMV76VC7n5WgZIJe9oGLx0Xn+RTJyLSXPBEu2hmGxf93T+cVf1NqqyAw==
X-Received: by 2002:a05:620a:3186:b0:7d2:26e8:d186 with SMTP id af79cd13be357-7d42971d918mr638041085a.36.1750869692268;
        Wed, 25 Jun 2025 09:41:32 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3ffdb190esm576783085a.86.2025.06.25.09.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:41:31 -0700 (PDT)
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
	troymitchell988@gmail.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/7] riscv: dts: spacemit: define fixed regulators
Date: Wed, 25 Jun 2025 11:41:17 -0500
Message-ID: <20250625164119.1068842-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250625164119.1068842-1-elder@riscstar.com>
References: <20250625164119.1068842-1-elder@riscstar.com>
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

