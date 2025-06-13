Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44F41EEA5D
	for <spacemit@lists.linux.dev>; Fri, 13 Jun 2025 01:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749777114; cv=none; b=NPowtK3A4V+2D9CHc9DH3wMCbb+gRyu/4BzHenfklAz4A9sSYjBnKr6EkM30W1N6gTvCTrr//o1gnRC0Ckn+Lm+X98vNsmAZ+PFcbNypoy0VWa1Ki9QDpU0RkY19OO2asmah6D6iu+nvYV9AYpXs3kjLskSCiHOHIMND1cH1uVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749777114; c=relaxed/simple;
	bh=x2bb90yd/z6BGWxPn6MrfwFL9GBhzPEVY1PUSblaovc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t4y3g0uIhh6lVJxnSIHM3b05GHMRTSk9+i+6VU+8/Kmz+N8V49KgP7RAgH7JTHPMrOgPKEK8EjwdMEKQjirEhZmUtBPzt0K9EPc+Qq0klc2v1Oz45PZdruGhYDbx9m2YcJlSEWEpgxC7K/WX12IXDpow6m7gWADXC/4NPtnDh2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=KytAZcd4; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="KytAZcd4"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2ea83f382c3so924505fac.0
        for <spacemit@lists.linux.dev>; Thu, 12 Jun 2025 18:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749777112; x=1750381912; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cjpgt53WofqzbGA4fRWGXisKKHuRc8Ezyw19NVROhHY=;
        b=KytAZcd4Cn2weYEx533/zglQn5p+peEKaQGbby3xuC2P/onpIT5O9/PC9cylXweaK8
         IsgS0M94e6mC7brzLfmDA35ybdP0ZLn4ArElnomyQpSXyo8V8j2SO2CtQ4lKNduVDNCV
         E1jb9b8IKFlyJ4CRd55v0wvbU4/qovElhwhMYkC9cZMJN3j9wKA3ycxhLm5kd2kC7/dc
         dAAT8Cga9jGlCzioklozPxozxEIKtSqFJ5fWsu9TIMpFlxBlUa8P2iHKm+ZQSlusCW8Y
         g1q6QnRXPeavCytlKHYOqR0exTJGWT0pnr8DKIsbalWYMhfgJoMi32mwt6eYQIaGAiXk
         oCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749777112; x=1750381912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cjpgt53WofqzbGA4fRWGXisKKHuRc8Ezyw19NVROhHY=;
        b=Dm4U3R5Mad8a4Ss00ncOi1AEAwacoXlLOEEG6+w2q0eqlCr0igl802/Ewu5EpbQ70d
         VTUCEwNJVqHoVFEw24M/8ccwylqgSkxaGShcRW7Ofuitf00nyU+0gjjfKgD1IGCfhmH2
         5WHIFTYl5LkfuZ4otNYL2HgJbJvJLj8n7L+0MB+u13o8YqK1X8IGUKQdEpEv+AvlQvcX
         Cg/k0m+wVzSG8jH0FGR75fhy3+K1VgrDhPzoCbt5z/U7Oy5Njq7uDdeux+TgvGyOmuE4
         dxLCewBF6qWy2flbm2OQwBoGOx1tetmwlooso+2ahtwhlUFhLHmlL3R/3jHv+xPaKrXX
         o9HQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG/Li0PL4iITG9k29a1bBgbLj4twCh3J4JxNB26FSFFDZSfMpV2cnrq67WjzdcF3+FKmpfVOYoRQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2AJTZ+C6c+P1/WDPOBg8T63VOr9IZh8zxvkwMJ9vRzvMpSnZG
	5rHmnRoTlf4b0ASm1A4sr9G/uEqOStfpZDU1MjNEbrsA8SzRvt+bBGE2ersZkn8mToY=
X-Gm-Gg: ASbGncunQ4RcP6vT3DJdxXwGLLP3Hb1lz8tYhQj6dF7T9XFHZ7eUsiZO5xeudpfbdTg
	5UBBRLS5kunYIk/Rp82P/FgBM/Fz6B2Eg4DOq689b5FZAIRF/y+k8Nc53hndIW9aE5zMC958sLB
	mHpL/73GyWslJBsXVS48zCBYNJoaPcRjTYTUFELKYAavbk59/gKknV3rCh8ciWLfSQOZ7RdB5dY
	eMXZoVl4Q8DCIdHQj3rdZflpc7b782eBl2YOZS7645YOu3ztUo/RbVd3KEcXpXZ90gawA85E7rl
	SHLOhM/ZNgPFekJfPslQSLwgnZR/5CBqVIAW14IUN/B2XBWjmEsz8Pmm+SduFyXeK9kIDuGn1uZ
	BQnHPF0q6D5d3Qq5tEWxVXBTkaEsNVU4=
X-Google-Smtp-Source: AGHT+IGLAOVwGQtHFMenQ5Pjgus0rfvs97TiY5MGJ1T6U7O3FKYbF5dGtfPW1aRPNW1u/ydyiJ4KnQ==
X-Received: by 2002:a05:6870:8091:b0:2e9:95cc:b855 with SMTP id 586e51a60fabf-2ead5157caemr853318fac.34.1749777111937;
        Thu, 12 Jun 2025 18:11:51 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eac0c17211sm407685fac.18.2025.06.12.18.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 18:11:51 -0700 (PDT)
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
Subject: [PATCH v11 4/6] clk: spacemit: define three reset-only CCUs
Date: Thu, 12 Jun 2025 20:11:36 -0500
Message-ID: <20250613011139.1201702-5-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250613011139.1201702-1-elder@riscstar.com>
References: <20250613011139.1201702-1-elder@riscstar.com>
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

