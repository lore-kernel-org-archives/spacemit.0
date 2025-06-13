Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF7624BD1F
	for <spacemit@lists.linux.dev>; Fri, 13 Jun 2025 21:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848524; cv=none; b=A2BjNB1oEEs8G4FJgHn3yVgC16VBQKr3xLEUZ7/rI1E8zI3QD3Gh22bvLtSDm/ItQFo1Isv5fyoxsNumRRxSVMYJQMXTIOS37HoF/vyK7thXCpPOQ7Rp7d8mS/rjQYdPkFVuUrnPnqOFThc1TmJ2cCZywNJ4Q+iPmVrKaxvet/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848524; c=relaxed/simple;
	bh=mXD+KmmzczPBBdFZkWMZATRKtOxlsWbA1f0YJbPau8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W9NsMqYZA3N+v4XOSVA+PokRdbuHZw8jOkTcNMd/+PNCAAZY4MAGqRizrz6LegfFzt6sa39SE/euWBrdrbBeZA9Ksyc/xNiN8+xQ93t9BkF4GthtEKwh/GFgJV8bowBaF83H4PxojNWcJwnfMQMEHQc5uzBy2WdhUplrvecHQbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=uSqy6nLd; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="uSqy6nLd"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3ddeaad6036so20139825ab.3
        for <spacemit@lists.linux.dev>; Fri, 13 Jun 2025 14:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749848521; x=1750453321; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWQTiP7h7eL+v8/SbkMciwBHxZWg6y7ToncXXww7MfI=;
        b=uSqy6nLd4RCCo5rgtOfJutbnDCm5/cn0CMnDgqMeuf/ggkp6gDbXIE+Ermmh9iemEs
         WkECTKVdJgeX07dHU20llD+bQRufqWk7LYlTt7bF9RGQTWJndtEnFeqMPkOWs/uT/8kQ
         yaFvTREDF/AV+JIOXCAoC9bQiN6S2qerF43qS5xOhWbiNJJ7Htz9qcXcISOazaUNG0Ch
         xNaN4hg4vKqkm5pAquasmA09SGFUEwpzQnqJ48WUwd0LR+EHeVxxntztTH/LBD5skiyD
         1KZ3xOuWg7JCDy6DBx4Fq2Y5hYqFXF7C5UVaSQQTWw1QTh6O7G8m/9PtcTj1u6Gd/sdN
         h+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749848521; x=1750453321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cWQTiP7h7eL+v8/SbkMciwBHxZWg6y7ToncXXww7MfI=;
        b=GGAshIiNkqy0UFauROGPW0V7S2/+j1Ep5JUuzvwi4HFPtKRm+v6XP2AUNSt3tc2bXc
         ldfkhOORPeJrQruX4fp/kZufCZenegDnKKJ/DncH2Ng3PsWirnRH50vZ9vCpXuJS2LAq
         oAxvmV1A45n61KuWqP5TGZQzCd66i7WZwatij5jky1syiO6ag3bCMlo59hzVvbGUVrE4
         jPMuiYal1SGSiAkOXEfPLIgUrG6JoELXiMPhB8Jo+zbSMoE/3XmLaOsLe7p8b4oe/XI/
         sFA5Fj12dO4OisNIHEJFExh6sFnuKm/nw0zQtmMlLfFgk+U14UUm63+ZMZZ+74+LXV6n
         jT4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWqetY0zR+rsws87JxmE/rAjepHGPSkj3rur0o1sl+Y1HyvSFF96Zi8HZfXa2bPvSYb2iWviydxyg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5iuX1wg/UYCbuM+lQTuu+hv7E5Q1rZHGGwFskRubf1+9ANGoo
	1I/PNFDMq4pvl+8QhLyjnumgqFQqKIIN5uO8hSJkpkMkZJUXg/9VPCW3iilwnSVWlgM=
X-Gm-Gg: ASbGncurRHh0vcFp+FsuYD80KxFu/M53gzXdKzhSwEi0l/i1JBZPhAdozLQLvtyqIXN
	nbLUks20FgRapcGzvICtaYdr0N8TWUOVHfjNj5ZBR60Q+khLsLTW5nEJ2p+EgswysmjXFSsGLkL
	sZl4SW4ozsxj/TFWe+uTo9B014vz12ZBIOvKXVPpIGlbuK3D+9lihm0lF7t4z/VX7q1+1e5LIAC
	Pa0SdvYj6e1BODrXmo/KZ7DA07g6i9X8m8fqJEG7jX0o29R7l/c9Hex+nmJgNkkqgntzsw5ueGY
	rSl4B85XdVo676ZERgvH/30bivjnZjyM8N0pqwohJdbYFAZ6aBWftL4KTpKlNpyw5853QwpL96L
	rf+qCyurAf6qYSrz0a/yppfQb4GAiaJA+xttHyR92MQ==
X-Google-Smtp-Source: AGHT+IEecP3cifD7NNtM4x0PtjYEOx4vfWTMQlcOrKZqxEcJodip8ZghPio2mgJZ/Wq7eeZstJYUaw==
X-Received: by 2002:a05:6e02:1f07:b0:3dd:88da:e7de with SMTP id e9e14a558f8ab-3de07cd355emr15624215ab.19.1749848521613;
        Fri, 13 Jun 2025 14:02:01 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019b44b3sm4996315ab.10.2025.06.13.14.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 14:02:01 -0700 (PDT)
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
Subject: [PATCH 5/6] riscv: dts: spacemit: define fixed regulators
Date: Fri, 13 Jun 2025 16:01:48 -0500
Message-ID: <20250613210150.1468845-6-elder@riscstar.com>
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

Define the DC power input and the 4v power as fixed supplies in the
Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index f5d454937d300..8003c8173a2aa 100644
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
 
 &i2c8 {
-- 
2.45.2

