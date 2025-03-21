Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95828228C9D
	for <spacemit@lists.linux.dev>; Fri, 21 Mar 2025 15:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742570324; cv=none; b=fvKU/rvg6yKJH+KP1ufdVJDwOW3Zy5WbjqeUHtA3hHbYFISqM3SBHihrnF2ps1KYMfapxODPH0UxSW1WKysdhE06zSMOJXY8XRz4xtQOfZQ8QPrPdXkDeHbnWWPl7gGaniJHH3yvfVbeQRnXY6cZ2chcT4yZWjY58ScgV3H87Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742570324; c=relaxed/simple;
	bh=Kk9IOSp5FpiJPK6DAw2Z9Z0TfklnPeKukCwW/BwUYxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ch+jBkLqG/qvozJViVd5cz1i1hZIJ7pm9ZXCofIylnEIZQaCKNn+8J76PO+pKGupkJW6p5Vhj4HSLeMecdLJ/T5sB/AZpGlcb8C2d6POJjPrYNC/FMPEPb734c4Dw/+uzkpDid2B1AEcxB4kzF9tqy2ccF28Kb+JrjvAG2eM8g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Jk3LasHI; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Jk3LasHI"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3d434c84b7eso14750025ab.1
        for <spacemit@lists.linux.dev>; Fri, 21 Mar 2025 08:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742570322; x=1743175122; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9/aOcBOjeqmg8r4cUHY2uYIdNBiCau+sheqrs82fvw=;
        b=Jk3LasHIYxogQFE/ax52drJT7eWiJhUBudSrzhtqevaKORD8+P5Uoy29iHyvXDnNcC
         AUTSF8i5rkCEd+lAe1QTDq/TbYqhaymAIMHXIwnGsNM23wvo9bwaaofCyiBVrST3EgRX
         R+SSRnUTwjUqdKgK2Qbg0HXXdgbsaEhwH/FP5FDBiZS9ggT+XRnjJmgwafCwnP+I9UjA
         1xP273aMRtmL9a5FhaKkD1VwfVnavVC6Dl63SPzdhD9sRa9YvlMOVW2uY/GLSUAKpFUa
         lQpV66J5xwtQ1rJEUn1eYivZauTa0QLN1hrYT4NpQnhUmRXTMh1i1iLJVZUqF6IsLHEQ
         gISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742570322; x=1743175122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9/aOcBOjeqmg8r4cUHY2uYIdNBiCau+sheqrs82fvw=;
        b=v9JY+KvGC9WBrWHluxyh6YJiIM/GJGwbHZRSVBf6RV25gC6nRm0Kps8e9N+amyUa1W
         ds6ZL3kGHKNiyzeqEW6OEhW5pBNYWuXvqOxSJEj81z3uhXfMi0CRpaSvzhk03VcXkMMX
         Vz3cNx4CYEh5zvuYYRlQV1NjqOBiDZazBk6c0mV/TBDcwbxrZ/uaLL1fHGJ91T9bhQXE
         yLNPady5VNavdB2zzyFhza6Sucgd/oEUPHtcjo1rp3LB6l5Tn/kShP+oA+FGyyzjZGzV
         K9t9c7xvnF4v5Gebmvm31KDnEijrMZAYcaM4+cgjfjzs4dF1pKQIgJbaqfscKaCuaf4A
         T0GA==
X-Forwarded-Encrypted: i=1; AJvYcCV3Y7JTQqUJ/tGcbZccdKRiftqVaK5nLURcea9699bibG+ndIjN0xtg4q0aizRo9wHi9ckeaUObYQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxzoihD+y0Oq1QVqV9nCGS6u0nv5uwI77qrMeByJRHYIgfFyTVt
	txQuSii2E9JYoDy2rUf0MduS4/CM5Fu0iaFWlv/25iAQ/d0SIq5ciaClwW+iDUQ=
X-Gm-Gg: ASbGnctaQt+IbikDWmPW5EfuEIHul7hmL2GiTEqKPdZq6bcJLUH6jCNHydcAaps25O7
	Gpl0dnMUjD6970UmxfS44NvdvpmfqVb0XO0DSb226/m7AU01LriLu5GxjkC1VbXYHG0e71Zz6jU
	ued4+srJrNGzyraBcke68lR+ZMuNAjrUEVmKPtY41D4UkxgXe9R8SwM/ic0ytZRPJ8nch7IyntJ
	2LcY/aXUEO2FOYiaIPKtVvz047yS7s2MrdexiaHhPR0U+gPDpFFaIiWpne9ffbuSrn9XZf+V+rP
	Q79v8DxRtU1PryuZhVDekfVL6WJXx6A+LxzOhghkXxEFAlki+pD12bShbIbzWZsOW/3MTz7lc9S
	zgHp/qCPB97lU5aHntwIWnFHs
X-Google-Smtp-Source: AGHT+IFo/JEVnsqki/6fdgfg3xjuRm3SDdlZLf3knFyzM9tCDQmdiRd3jcBZUEzW8DfADwT94MufXQ==
X-Received: by 2002:a05:6e02:188a:b0:3d5:8103:1a77 with SMTP id e9e14a558f8ab-3d5960ce9b6mr45841105ab.1.1742570321661;
        Fri, 21 Mar 2025 08:18:41 -0700 (PDT)
Received: from zoltan.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f2cbdd0a21sm475553173.41.2025.03.21.08.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:18:41 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dlan@gentoo.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 5/7] clk: spacemit: make clocks optional
Date: Fri, 21 Mar 2025 10:18:28 -0500
Message-ID: <20250321151831.623575-6-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321151831.623575-1-elder@riscstar.com>
References: <20250321151831.623575-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some syscon devices that support both clocks and resets,
but for now only their reset functionality is required.  Make
defining clocks optional for a SpacemiT CCU, though at least one
clock or at least one reset controller must be defined.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index be8abd27753cb..17e321c25959a 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -1830,6 +1830,10 @@ static int k1_ccu_register(struct device *dev, struct regmap *regmap,
 	const struct spacemit_ccu_clk *clk;
 	int i, ret, max_id = 0;
 
+	/* Clocks are optional */
+	if (!clks)
+		return 0;
+
 	for (clk = clks; clk->hw; clk++)
 		max_id = max(max_id, clk->id);
 
@@ -1903,7 +1907,7 @@ static int k1_ccu_probe(struct platform_device *pdev)
 	int ret;
 
 	data = of_device_get_match_data(dev);
-	if (!data)
+	if (!data || !(data->clk || data->rst_data))
 		return -EINVAL;
 
 	base_regmap = device_node_to_regmap(dev->of_node);
-- 
2.43.0

