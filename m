Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E81220E70C
	for <spacemit@lists.linux.dev>; Tue, 13 May 2025 21:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747173238; cv=none; b=nm4RmvtDLJtntU3q4UTovIGB0mYFVRwykcDoxFA4TioS+UQckmqUyxbZIou8FfqNgxshDK+qqwrkZo5IWrsNGHThwH1rSBYr7rabDWu5rMdgEkNS5A6/22b3thK/PX4AxM1+v13gkje0XV4V0qtLZws3piIJs2aCJ4RbmauqImA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747173238; c=relaxed/simple;
	bh=xdzDwczN4n97NqtrDQa5z0IlAhOrsZ/pz/wXFFvPRjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fwBbhWSCgz8sfIE/SwtrHhAabIYCDihDBsAcSZfGhXsoFK7Yk/1ZZF8E5ug92/DuLpXmX7hpxJhvrqthAuaeZTAP1o9I/ZKCyzjsphddU7PepqBYA0nEgr/y+8yDLyii0JbJq8pUlZVJR+Y4wUzl9ToSC7RsiZCjMKofTVfOjzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=RJmxpTwX; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="RJmxpTwX"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-8613f456960so155700239f.1
        for <spacemit@lists.linux.dev>; Tue, 13 May 2025 14:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747173235; x=1747778035; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVooGR26bxqbC5iLeacMbQ0G9vLAHRMKZeClAxN+yvg=;
        b=RJmxpTwX4yo4BNV1BuTd4vr2nD4nhaIgsfi5FUetclZkjv+goHmPqldaDcOLGVaizZ
         Bamv0d8GCGLAg1oGQ0STCsvQE98sW5KTAKjY1wfZE1aiBqsEjwr7in/0HufUQn1NhOgQ
         AE0U8o+Yg/tCfjMKcRPtnmepgjCUh4l7XWd0CxeqpljryAAstlrDMo1heM9YzH8SsoPz
         vYPVoEZtP+en8rgprwdd7yJzRnESQ7rX1OZ0eRoF2GbgtwWm11taLQWK+ijFxZiyMFdy
         vYW2jZO30nb6JAOLSYEqwhViHoTgOmcgOrd9/lgdFKgQky7v9vkHay1PyTYdpI56alFL
         6IgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747173235; x=1747778035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MVooGR26bxqbC5iLeacMbQ0G9vLAHRMKZeClAxN+yvg=;
        b=dbCbVZv5cPzZh/Gdh7wK3pmJ5ccJ4ZrfyVsjd/L6CwB/kQXkRwx/FKjfkYA8t8uj9d
         t5bVbapOiW9golvDokIExFKGGBVn0Oqb7UZebnKQRah89L7s8T+oiCZdPomHzX0IkRft
         FZJDcye+L58Wq8gWyJupYkob3YpkOwsHFIrxIXWqCUFESgI66G+njamFq3v6NwZiBxnZ
         oPVX3CYlr8vYRoAe/t5U9eVtXw9jq+LRYgB5NZ9jNB7so43P0LQVYylMGicXAvr8vNBF
         D3YW+hiBhXwoaoJ3eKdDEofM0JUBcNsrwC/N1J8mChS9e7q8xPzrD+MDG6fpmUPa7Q5c
         1G5A==
X-Forwarded-Encrypted: i=1; AJvYcCUQHP4tFvOdJTinQyZGhwXDA5NkkSKQsybdQmd0rjlWneB3wNrGitPuDIxW4YvznWiG6lFmUexxkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWfOVoU/Cs/PmN9Fj3DyYjJYeNXjg9AfuVSGUroi622RiROTXX
	+kxk4aYytDuAB0zlaiZd8uKwROTqJvpMHjcJHOieY876bOJs1iFKmyVHPhACle8=
X-Gm-Gg: ASbGncs56OT6Xw4dBZiD0oIzKhsr7JGYUOPqsDhKwlFGiq2oQVGlGkqU5JcIcbBaiBy
	pSXJryMlJypQ3FYoXT7NmbRkH/YHGSOazKYNdigSoBIl2Kkt+uIg9nA9P3zRvjlhpSv0JhQTkkJ
	sTabhQnTv4lipY69o2aEUxjCZeCr5oO2H8vaw23Z6PnbOtZNpAIrlVJYW5rOateZ26Vgq+GDuiB
	bWyi9OVXJeqraUxVELgNQQ00Y99jh4O7zPDs39vbPY8YQfB2ztHpYGxtblzizEUjHrZtpduiOR8
	J25TZQP7FWv5K4nVFWm/WB+womuJeJKg1FS5wA6RvjYFESaYwU1Kg2pYd1XChmmf8LqTgEyHhd7
	PYbRqFxHu9g3bsM1HfJ0IEXJ9
X-Google-Smtp-Source: AGHT+IFgAAov0WDbucAa2d2uLkEZNpDggOUKIJvl7ysoc5mJk7YSXRkmxd0htIHYmS45AM68y0mEAg==
X-Received: by 2002:a05:6602:368e:b0:86a:870:67b with SMTP id ca18e2360f4ac-86a08dd24e2mr166204639f.4.1747173235161;
        Tue, 13 May 2025 14:53:55 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-867636e0dedsm239622539f.32.2025.05.13.14.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 14:53:54 -0700 (PDT)
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
Subject: [PATCH v10 4/6] clk: spacemit: define three reset-only CCUs
Date: Tue, 13 May 2025 16:53:42 -0500
Message-ID: <20250513215345.3631593-5-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513215345.3631593-1-elder@riscstar.com>
References: <20250513215345.3631593-1-elder@riscstar.com>
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
v10: New patch, same code (extracted clock parts of patch 5 in v9)

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

