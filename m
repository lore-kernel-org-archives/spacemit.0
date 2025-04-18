Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EA61DF26A
	for <spacemit@lists.linux.dev>; Fri, 18 Apr 2025 14:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744988059; cv=none; b=YNdGWWFk0bH/Z+zSaV7bUE31YRR/j5Lm3ysldsd1H64nXFf27U++5+ddF7BhG3e6wYIYsqqu/5zj8TjcACDEaBxbTYnzwaH2oRdLtdgq/FRS+A4PsYoRITsRwp34mspZ4ZBDdjnLy2TgATpXXl0A7YiEy1/XoTe7Fm9VQwKN2Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744988059; c=relaxed/simple;
	bh=WK+79Sgay1nnVSQ9s+Gs0FXqatmC3OKXtMgoy/+gdS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mrYbON/IHJd9ScP0XIQLMs/UA6USatava6/C/xSolzwVgaUM92kRGeV4+zPSXSj00+lB4vzgHlTL46gqLMFVkC19gdn+TnZe3YhXEsmebi9cjaD4Er1wtF7lvy+zUMKK6ZQVta6ah69pbQdP1Xzrgqk9f5QFLHTWJNPtqh8OrZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=mjkaq9sj; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="mjkaq9sj"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-476a304a8edso20873771cf.3
        for <spacemit@lists.linux.dev>; Fri, 18 Apr 2025 07:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744988053; x=1745592853; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0cRJZr/QLbnC//i+6RCLRRi6tJxaoAhZJAaalWswhg=;
        b=mjkaq9sjC1Nv1RiHdEMNVjelN+6UgGSSdUC8L2m0Fz/O5YEgWoR36HUs8lifdaKeT1
         UdBLlk9RaKhLSnLsC/v6Q9TBlo0uormueOxWHnm9sOjr73RlnMsuJrkiP/ufzvnTkw9m
         mg3Rt4/IPI0Q9d4ZyWRBy0dG6srSeukg0D7oG9l+P4LkfsP8ZP+FfAas4Z0QvrKNn2kY
         88nOmw8m6csiMpsoLRZHUZSaXY0ojKUCsQf9t7uQUa+3Z9o9TP+AzVZ0zaOy54U8qfJc
         6d6p21vlQ6zkO+cLQ8NhNa5A+rFabs9oLqhMRXsDHXewJDCd1zlgAltjiq4pBO99yYhS
         /6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744988053; x=1745592853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q0cRJZr/QLbnC//i+6RCLRRi6tJxaoAhZJAaalWswhg=;
        b=oudklOwCairRPvtXKl44ol3+NL9nKqPDIPB8sxDU7OLvwaik0my1eJYg1rCglt/zS/
         VMxvNBFmLGq1ueWp4jdjk4ywK7HHub0Psk+lm836LkkcNtri5vfIPOcZmYEeDfuSr02d
         hwT+WlXg/2SSqcOFQE2m+lFZOqX/1Zmiu8Ixa2e4L6i382z/Yh6kv0i9CC7F5nOkl9pl
         uR01OzfCdsQcC25iEzFvLsD/MlSki3qM22Wu+0NhMftFTP/phIZ5s6o/2M8BO94pXGXy
         0xdOVhnPYFjGqlHR5glt35CrMph7tQNvJDc5i590PP5gbEO2G3w+q6q80sXwGwKUyzLH
         L3Rw==
X-Forwarded-Encrypted: i=1; AJvYcCV6CJPrJz4/iPbyR5isL7KGyQ2ziVQ9DvrMCE2FZl+b/PbB5iP2OuodlVcm+WZ4/q2HD9lpjVJJbA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxiQrZItTM22yxwZE6uBmJTbaQiSEszJJeKUxthh3Pe50M4MxCW
	BN/W8GNb9xsvSWyhZqysPbZxuNRBUxlHbnpQN5MtgWBP9w0GvDshRRILjQ83m4g=
X-Gm-Gg: ASbGncv/nO503ZioI3Q7+WnvhpjL2Fh3YciujfPRPE0PMLAMySMKk/N3tRMB2nf5dnv
	w6LK0EIaUnlNxUR1naQdzuBsnBm9dk4pICG9dTwOeffcTXB60JEa/gN4yn2eh0Es5xZFt7uDzHE
	vZC2pO4kPL5YtC7ezKDiO0ty5O+8k/8+Vde0VujFGZ4zoYiFPa5j03x4Q/XPY0llHxU8w+1RJLs
	Hr4orPDJk73PIMizJ4ZlbYOAhE4lNNhxADzRrXlB8TLnKgcm7G06yncNoR/BpCuev9fqrYFPoiq
	nCeTWQ5s/YDSeozKqMvUBVeNTsdNJV313dzT81PBo/7qUq7Auop5OKYt7LY0Kdf5a4AAd9vagLE
	JCXRll+xojz0vHQ==
X-Google-Smtp-Source: AGHT+IFZ0pFYNx2snWn3YpkMMZYSR9nF5fcb5GLtk7fhZ50PwkaLo1+AOy6UlMO++lE568O7vJ+T8g==
X-Received: by 2002:ac8:5f89:0:b0:477:4224:9607 with SMTP id d75a77b69052e-47aec3a6358mr42212621cf.12.1744988053257;
        Fri, 18 Apr 2025 07:54:13 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c16ddesm11329201cf.3.2025.04.18.07.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:54:12 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
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
Subject: [PATCH v5 5/7] clk: spacemit: make clocks optional
Date: Fri, 18 Apr 2025 09:53:57 -0500
Message-ID: <20250418145401.2603648-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250418145401.2603648-1-elder@riscstar.com>
References: <20250418145401.2603648-1-elder@riscstar.com>
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
 drivers/clk/spacemit/ccu-k1.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index ad5f41695f8db..dfc8aa60d4345 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -1218,6 +1218,10 @@ static int spacemit_ccu_register(struct device *dev,
 	struct clk_hw_onecell_data *clk_data;
 	int i, ret;
 
+	/* Clocks are optional */
+	if (!data->clk_hws)
+		return 0;
+
 	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->clk_num),
 				GFP_KERNEL);
 	if (!clk_data)
@@ -1329,6 +1333,7 @@ static int k1_ccu_probe(struct platform_device *pdev)
 	return 0;
 }
 
+/* Match data is required; its clk_hws or reset_data field must be non-null */
 static const struct of_device_id of_k1_ccu_match[] = {
 	{
 		.compatible	= "spacemit,k1-pll",
-- 
2.45.2

