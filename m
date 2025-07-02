Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC69267B68
	for <spacemit@lists.linux.dev>; Wed,  2 Jul 2025 11:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751456243; cv=none; b=gCtIdi/uvB97DRWvj+n/luMunF+cqDCwuFrbmnpAuGqZie/Sg7Do4BBMd0mVgh3ez2t7rfBOomEdJODZTgMjAa73K+6wbTszZVuevpNPCL5KwHk43F0qtpBOqPSxdOrx0oW6vpgvFZwOIGWIGS3rIBe6kynXmESfy0rCXfLq3ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751456243; c=relaxed/simple;
	bh=x2bb90yd/z6BGWxPn6MrfwFL9GBhzPEVY1PUSblaovc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GSDvGUiURUw760h1MI/E8zwfbm4or+QRlNBC1yLYsswXZej97G4fArvp7yP+w64dp/KZESzJvWkVvn7teu/BdyRmVgmRndVrochGps4kQJOJX8GsPuYto0PeausGuEFTNFKqpI4/mk06HBV71I3YKqDYqxhwQm/B9VAWA3w2yLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=v4E0dDsc; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="v4E0dDsc"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6faf66905baso51643976d6.2
        for <spacemit@lists.linux.dev>; Wed, 02 Jul 2025 04:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751456239; x=1752061039; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cjpgt53WofqzbGA4fRWGXisKKHuRc8Ezyw19NVROhHY=;
        b=v4E0dDscmCOb+m6bSlijPn4kdHf3BJ5uRfu9S2FWaK9xJSMJiZf6BnjI4eSbQUJUkt
         aghnjUNZ1ucHOw7anLYHIGvrWmfho2AN2k3yVmuDyltOb1bYprnm7Sb9QDvuyEFBOsEg
         L7faZHSUG/biVlV9F2Kt2GZEP4+vhVHQ9RffKET6jGvz4nws8D3yTUk+vvVjVwxSTvdL
         QlWfm5a8hUPUDgUPkPLYbexzBYzl38MfdmhkAwrv2zMzKKvp7Gf9o5GEsPwRxVDF/b8j
         6TC/YMroaqVYSKr2vY2etM28+XFk6Veww+zaYIabtPFmN5xuSSdB3ezOrfpXTZwCcnOw
         F4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751456239; x=1752061039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cjpgt53WofqzbGA4fRWGXisKKHuRc8Ezyw19NVROhHY=;
        b=eqISdC+m9XGdus+CJT8eAlOdPbabCoNb6nIpT0cQi9vEBllnTqLWRCMoc/jrFxvgSM
         hBrg4tL97rY5NFrZJTt2E13ail/IPxvCfCctWQsI5m8u2HokuN9HvfFKhofOuSeCTlKb
         KCssO1ijYWM/ZE5w0pjTCxnYK6JIdwmuWXZX1oRhnEcD3Zr/AhYYMkdwGYWe0RTYlTJP
         fRlQ9h3kwwDnDlB2vmQ2bYh8RPaDyr0w/5qK721HZSQzzApQTYWPFE/cCusS/VDTCt3E
         jl4oIB9ENIgheAYgZcoRpBIeGQ2MqnbwT6voYrrr0qrldzH9n93OD3yzgC8I1XMreMqL
         KMEw==
X-Forwarded-Encrypted: i=1; AJvYcCXn+RaSK7JYhH7YOJshN4cZ3jdraopN9puz78yZJm+O8YnoEBHpxNhugK4Dr2UW3spP5FGYOKK2ew==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCMQAIzPTlicmMomU8JdHpa2qq2KIa4iFqhX00NaK0k02qLcvC
	HLSI7qZqfP/6I2nEEjrcwkZQk9wvaNJ2Rl3iOyFV1LTJFPJU2/wBEpWnothvc1GXiOc=
X-Gm-Gg: ASbGnctTwcRBvLaydAKc3RmiEOSt0RTe6a1LGmdHiwKTSee/HdoHEsCsP34dwE4Fq1B
	BAQ/yEGyyj8UhWMBfHU1+/9BPcQMd933HCmGLe5lBqdOIMT6pJfu0opTLVicAMbD9PNja50w9fv
	HghfLoipzxnPG7K2WCPqj3ps5BeXuXGNgo6rjnKMztm25qQLqyGQeGwfm5WkEZvWl1+YpYWFeEK
	zC2l79aRSqHFPr+33bRIj4o0wOGsS8WYqMrpNBF9k7dmjSLy2SglZb0GvQU1cwPzkoyvJDh0Uo6
	yioA4QoCjzK5mdPs5JmA5LY5LBCe7L2TkdfDd1N8BQEpFQWHGu89YrzFpsH6CMaEJVit+5d6QBC
	c957SE0S5i+mJlxh5XU12j0ns5XQ96UG1biw=
X-Google-Smtp-Source: AGHT+IH3LET1MT7KHlQqUntAkhS1H9AgE3UHH6mD+JJGc/1gby2zMVvKDZcLFLc/p0vmKgudXAnAAg==
X-Received: by 2002:a05:6214:2587:b0:6fd:6e94:9dee with SMTP id 6a1803df08f44-702b1c04d50mr26220596d6.41.1751456239572;
        Wed, 02 Jul 2025 04:37:19 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7730ac6csm99218046d6.103.2025.07.02.04.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 04:37:19 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 4/6] clk: spacemit: define three reset-only CCUs
Date: Wed,  2 Jul 2025 06:37:06 -0500
Message-ID: <20250702113709.291748-5-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702113709.291748-1-elder@riscstar.com>
References: <20250702113709.291748-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three CCUs on the SpacemiT K1 SoC implement only resets, not clocks.
Define the CCU data for these resets so their auxiliary devices get
created.

Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/clk/spacemit/ccu-k1.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 1c9ed434ae93e..f9e2200d1fd04 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -943,6 +943,18 @@ static const struct spacemit_ccu_data k1_ccu_apmu_data = {
 	.num		= ARRAY_SIZE(k1_ccu_apmu_hws),
 };
 
+static const struct spacemit_ccu_data k1_ccu_rcpu_data = {
+	.reset_name	= "rcpu-reset",
+};
+
+static const struct spacemit_ccu_data k1_ccu_rcpu2_data = {
+	.reset_name	= "rcpu2-reset",
+};
+
+static const struct spacemit_ccu_data k1_ccu_apbc2_data = {
+	.reset_name	= "apbc2-reset",
+};
+
 static int spacemit_ccu_register(struct device *dev,
 				 struct regmap *regmap,
 				 struct regmap *lock_regmap,
@@ -1121,6 +1133,18 @@ static const struct of_device_id of_k1_ccu_match[] = {
 		.compatible	= "spacemit,k1-syscon-apmu",
 		.data		= &k1_ccu_apmu_data,
 	},
+	{
+		.compatible	= "spacemit,k1-syscon-rcpu",
+		.data		= &k1_ccu_rcpu_data,
+	},
+	{
+		.compatible	= "spacemit,k1-syscon-rcpu2",
+		.data		= &k1_ccu_rcpu2_data,
+	},
+	{
+		.compatible	= "spacemit,k1-syscon-apbc2",
+		.data		= &k1_ccu_apbc2_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, of_k1_ccu_match);
-- 
2.45.2

