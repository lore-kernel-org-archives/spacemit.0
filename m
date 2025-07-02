Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17BA2D3737
	for <spacemit@lists.linux.dev>; Wed,  2 Jul 2025 21:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751492237; cv=none; b=t2ghviWgK/hvv8PhvfxCAwvw3zHF5X2aGsiHMTWUeC7Ptkqs+xmh6aUB3Bh0Sg1Bi2DI/nyIh+jtIUIMwuH2YqqLCBT+DY1RNvN/voQXEkztE/M6eqWDnKYnKUEWuJta6pgMKklYrvUPsF/y9X+ukWt+hQlXoMdgTN2RGTM6sFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751492237; c=relaxed/simple;
	bh=E/I9W6fX+DhSmsmtI3yC9YfnKc4TowcG2XvObw3IonQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c7iNIHOldHYvmC8tzqJTunZGw4z6iS13IvNr+9kT/PPtg3mUPNVocHAMU8A9dssjLdcQM60pvnYkPofARUwILiSKpSMmSXCBjyorX4sXuCgdsbIMpWwK9i25/xvsz+LZEwWrPVmPrMdzjnpOpgikEwmHct2aX2h9hPmspivKtI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=yoepI0/R; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="yoepI0/R"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6facf4d8ea8so43936426d6.0
        for <spacemit@lists.linux.dev>; Wed, 02 Jul 2025 14:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751492235; x=1752097035; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=yoepI0/RbIN6pXmj7Abcrwdnet05ha5rMI9YgIXQpO3x4pbn7YNKKJgqj1necQYbLo
         XtALengoWGPotVHr2ruxdZwBcs5gWVSXG/CE3OlHJsKF+gd0EWPIuUIux/N9KU2TbsCz
         oQcGssR5amLcoApigh1yp7wB7kgnnJaadgsKz6zZavCNrWyfLx7yom/1PJ8qx5nFyRO6
         FQ9pROmpzClGzivBe/6pak1JEPrpY/0MhEohQtf2kXlP3TFkWiJoKhANLuODJZFGmDhZ
         vU+QE/c2uIu0EvcpZdtsnfRqUPqATkNqfME1nJioociOr6wDGz+5i4OhYD1uBcoEjP6P
         wJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751492235; x=1752097035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=G06ya/mRT4JbJvrAEWQGouxy1bkKZjTdJvWSiR3Lp1D6+Pt/tjQcTZXDfFd9MzJWx+
         4ok1pqY/wcGSK83EZjhgwxtjz9cxd0yu4wmHCG6Id7J0vlnT/N0D+BTZS8lBRNPNfXuF
         QcrCIGvVtvg2vWbLlJV3AdUJI8dvdMEYNSDd32JWy5d9babtHtZWbEwpP7tk3OSisKg8
         xP0bk56IehMtLws5Fv0/NCfklF4OtkJhj9b8E5VsTDx8syJAYX3+XkWla21f0odmN5Gq
         1XiiLli0UzkiqfelMP5AxK6WDJ7S5v/8GPo40MqLD2ffq6J2t1cFReH0Y1hPvMGFPeq+
         dZWg==
X-Forwarded-Encrypted: i=1; AJvYcCWzmFC71XD9YHAlaErae0zLEDDR4Ru4KtzF+MAU9XEhkKjdUsuUOnu5l9xvOkroMf6z+XeYCJwT2g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw96gYgVNUhv/aHHWCr/tQThZwSR8HBBhzkXrr6qABv7wTXWiMN
	qpwsjNXmtD03QXINlONvUF0zXgqBe4mOG8nxG/lgg5xsIQxpfdHUrXZUWjpVo3AfV3o=
X-Gm-Gg: ASbGncvCKOfHde0dJzQwgpU+1nvLmbytPZ8JyX/67bhGMJzTXqS31weCy4N7BKmScy9
	L816xshnQ8Je6gTFdiRrRzeM4jNJauGvR8kQ62mHELyiCKVIFsT4GoDgZg/KlVxh98I9nde+ppG
	nVIUSWd7ip18ZJoR2NFHpVQWC1ndHFAZe9wqwasPjQxysIrfBBddj3ZRIsk5cIXGa3VrEaiXYZY
	HBKdagx0zWARayMSqZTdD7jqQHsc2uoi3PaiFg98MOobRIEhujZArlGy23Z08JRMA6DvYp3ww9F
	1yXzScDW/urm95Et7ElWUB+Z+lFB42Slh0OR9I7AdI878ZGc7BG7VfREPGgCktuxd2abnSUKxaD
	YKHPgTo8CxiNrZXCNQRVKooK6kyV1PWcoYEY=
X-Google-Smtp-Source: AGHT+IHmuE1Hb+fdqWuuRSoeZlf3aoCIg4RErjvlQJxeD9KbYWIor15tIIiabP6Dq/CTktn4FVDAFA==
X-Received: by 2002:a05:6214:c28:b0:6fb:4b54:ebb with SMTP id 6a1803df08f44-702bcbf5777mr14378456d6.14.1751492234758;
        Wed, 02 Jul 2025 14:37:14 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771bc01bsm105691746d6.40.2025.07.02.14.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 14:37:14 -0700 (PDT)
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
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 7/8] riscv: dts: spacemit: define fixed regulators
Date: Wed,  2 Jul 2025 16:36:56 -0500
Message-ID: <20250702213658.545163-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702213658.545163-1-elder@riscstar.com>
References: <20250702213658.545163-1-elder@riscstar.com>
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

