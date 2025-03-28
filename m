Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7381F30CC
	for <spacemit@lists.linux.dev>; Fri, 28 Mar 2025 21:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743195767; cv=none; b=LQtIoFG26WvqZjHDZuze07GaZicaty45kXJN1H8IySJMM8bqUwhqzCpv51OmZy6ZUzP39OFvOjxf2b0U6X5FhmYzrhAeqQXeb1dSefK5sIvkAdIHxDfCRX09DcVB9nbeuaS1ZY1Lm8TOvXOBTACzWW73ECHHScJhCMdufoQiUU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743195767; c=relaxed/simple;
	bh=W73Khioo6n4aH3dJXKfZOTvx1lMN/9LyAeMHDZJ+yK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sNNvP/p5w9BEiBchopue8nePh/VgwDFrQ/GwhZrLg8whRXEur4VvRB6lzcOopZFyEVFt5dnFeomHBQLUt0ZJ+uTIWJu5QcwiBUn1dYjlKY218KomccEbv2EPLeNS0Aa3P3/PDtPu/A1eB0y6BBCkiSZoPfZjbFG1/GaZ2FTTZIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=w+1h//Pg; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="w+1h//Pg"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-85da5a3667bso75692539f.1
        for <spacemit@lists.linux.dev>; Fri, 28 Mar 2025 14:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1743195765; x=1743800565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rerGx2TveORsLjDrW3hkWd+yAs+YmYyP0wNHZuEm2gw=;
        b=w+1h//Pg4DkGCtULGypGFfoGKFXKba6Z5OhVugXnhaoN6OY7e8Eq8alOMZtY44RM2D
         zd7LxDdNk81PVxz69eLCzBSudVGleiiSPdqhkVEPC8fLxF0mCsQa3cHMVOEb7c2ZiCXr
         Gu8rsju35OR/Gkl+cZZU03wZ4Yo8h1G3qUXUuuHJmwDQ8UCnNDEHXXEnUcitqTsRjsBU
         FzurPZtfkqOpjwTJHXD7jH246RXM5MUApZsXnPryl5vx5EZYHbwsH1mQC0nB2wVUPwuf
         vQ/MwgeFUe576y4KB0OPshy8LgCdcJdu61ugzc+6hw5/p9S3aVXmy+1GjA65uHDhV7c5
         tntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743195765; x=1743800565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rerGx2TveORsLjDrW3hkWd+yAs+YmYyP0wNHZuEm2gw=;
        b=rXDM1Wiw/yYbIkwM2pPtmMoCBuJLmBZhiXpZt6+Uup9DQLtADW1XYWFDZO0ya+V0Nz
         hH3rMmhomN8liua4cuqLDCVP6NKOocAGUmuKdkqJwn3cXeo35U5939+T/tY5r9BWPpvf
         lSn8hkUdb9rwrB7XJ6QoHrv540ppD2fo3IZZDXiIVqU2kqv0q52d8efcx80G9+htlY0i
         cqQ0T2j59MdkJ0Pm32SYaN2Im237XBtRsQyjN9p+Rr1rz45GryIHyVNmfUeZDISweCY/
         vMzd1IFXOX8iTgqSUaFHFywZeJeL3nD7KFNqizef4K8iOwkV5AX4jX2+4qATFtunqxp7
         Nv4g==
X-Forwarded-Encrypted: i=1; AJvYcCVER7r4peTYheAse5miskzcHMikBfT0NsiEBu+KwpFw76ashE9CUfl8idSsnU9N6supJx/lOqgTXw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXiwPWkgybqsXewFAfBn+sQNH/s3KhqowCp197UlzwHs92nhvp
	dY3VAx/0XH2hhj3MDIlHb94M2M3rRSZHYQPNw7CTlQFxyb6XxBi2mTM16t7Q9cU=
X-Gm-Gg: ASbGncsge7+PjSwzO4zZ49dQ1uHG19Fe3iXwlOGvG6cBcxHcNGTNQxybgktVxN0RwrU
	Z0ChLDRTKlUfFaAzKEXgfol//NC9TdgsOOrH2zQwCQWlmTEuiuQYF4bB76rXF9xG5DHLZAKix1h
	7LQJDwiECajyWZiPBYXQizSFhg1ARN7iqcxxXlzPYUWTqpN7ouP4Qi8yczG1EZPLgCAxR/TaoZd
	gs7GqDrHEpB6mFOjqTnr9M2A0sRtUCb1CjhUO94+RsvQzhPx3YYG6iOrt/jdVnXXncVJiDpyWyg
	R7UxC2zgRHkW6MUGNu2G51FKP6VZ+vEAVmwau7zyQHv43Obfeo6H1eymEw7JgaaaLvBUIMnbKYv
	280sd8LCtgeAmr3Xmug==
X-Google-Smtp-Source: AGHT+IEkrPw2Xf+zBd0lVIv6FoNOsOZlQH+aK8mKUSksTkEV25RH9WtQ+nDLN/BB4g7AYZH94fGGSA==
X-Received: by 2002:a05:6e02:152e:b0:3d2:6768:c4fa with SMTP id e9e14a558f8ab-3d5e09fdbf6mr10526775ab.21.1743195764543;
        Fri, 28 Mar 2025 14:02:44 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d5d5a74286sm6769405ab.39.2025.03.28.14.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 14:02:44 -0700 (PDT)
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
Subject: [PATCH v2 5/7] clk: spacemit: make clocks optional
Date: Fri, 28 Mar 2025 16:02:30 -0500
Message-ID: <20250328210233.1077035-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328210233.1077035-1-elder@riscstar.com>
References: <20250328210233.1077035-1-elder@riscstar.com>
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
v2: - Comment explains constraints on match data

 drivers/clk/spacemit/ccu-k1.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index f837d2c2f31fc..6885fea81f6f3 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -1821,6 +1821,10 @@ static int spacemit_ccu_register(struct device *dev,
 	const struct spacemit_ccu_clk *clk;
 	int i, ret, max_id = 0;
 
+	/* Clocks are optional */
+	if (!clks)
+		return 0;
+
 	for (clk = clks; clk->hw; clk++)
 		max_id = max(max_id, clk->id);
 
@@ -1926,7 +1930,7 @@ static int k1_ccu_probe(struct platform_device *pdev)
 	return 0;
 }
 
-/* The match data is required to be non-null, and have a non-null clk pointer */
+/* The match data is required, and its clk or reset_data field must not be null */
 static const struct of_device_id of_k1_ccu_match[] = {
 	{
 		.compatible	= "spacemit,k1-pll",
-- 
2.45.2

