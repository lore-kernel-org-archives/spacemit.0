Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795AA28F51F
	for <spacemit@lists.linux.dev>; Mon, 14 Apr 2025 19:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744658250; cv=none; b=WILuG7hVx080JPZoAPWWA5L0us8w7b7gBJfU/0w5QvBAypS86yeDltIH9nd30igjYNAvQlTh4AgK9OlowrLMOKkPBjijMgwG34jCfF3XZf1YY85hUAaCwXuSc/NXPJ5Cu/pB1ZSTdiNcTDwdisEmytlkdptCzLaYVcnYtO1zC5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744658250; c=relaxed/simple;
	bh=VngyX6/mQNFodLjeygVOszXh7E8fNJcmhtKdA0Y9TqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T1jtxrKsJyWxgx9cPc1P09Bw6BkVNXTLmFMN+QGowB9BjpaAEEnOKa9YZrWmy8XtXMtltDjtzRBQ0hlfhrHY1ZW0hISgag/dNIjx2U0LbOSfXJIZt292ltfOVzg+tgmnbrDLwyJAPiahoRk1jX4nknIlTs/14cyFOViEe8HmeVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ulomdHL8; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ulomdHL8"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3d45503af24so44077345ab.2
        for <spacemit@lists.linux.dev>; Mon, 14 Apr 2025 12:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744658247; x=1745263047; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDT0XH54WFDdqavzCUnk8zHnVq9DAgWjCd2zBxfaNdY=;
        b=ulomdHL81UDkS3attySGBqgaEqW+aRroYJDBehoaP0Lx9XPaGAElaQ+9cbl2yl6M3b
         trlyfRJon01/7PtbP4lV/zZ7u8eQUWloo0naaOBH1/v3tk1pr8fCYslfoFaypIODJXI/
         unoGvnhbcSE2jZE3meO7FJTVoXWwymbjJKCyP9mCOzHx4Flrkqx9YhfOPL4wPArMgGyw
         D0Q9Ug0uYUEIrnUF0zPA9OLfisUGi1B7wDIvMbLDON0b+Ztj56ScBuRJkVbkzyqrWmRm
         SmyBKx3K9KZFKLgqbDunxWeH8nwMIpJ3/2TpeGhmQymgoLUySIFWujMiL9x5FocMRxtx
         SnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744658247; x=1745263047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDT0XH54WFDdqavzCUnk8zHnVq9DAgWjCd2zBxfaNdY=;
        b=nFZK98xlWLRfhLdNHvf/2XpmDTarnw+8Ew/mKooPyqVl37Cp1xNHMnwpE9XUJ/z+lr
         AsHaobD813CidEheylOgWVmgr09sNsoq9bFAkj4ztQHJ9ySb/BgCf1ruBcJ2MQyfJ+n3
         mEm+8U4cncp2HnAFPMEGjst7RE0Wn4ALmfVcDDxDux7AhHq7VTCh8nuH5YgGLnLv/nVl
         Qvpv9qKSVoAd++EdMvd4KPQliZKQZbhLY6YjnlU3S1izRqkTBG1kmrYLyGK3+TpiagXo
         Q+idV4WMcNX6mFc4r+zp8ovvoVwMiohFySBAHv64zz8Bam11JH04SabSfD2e4pqei6jY
         SWjg==
X-Forwarded-Encrypted: i=1; AJvYcCXQXl2icS6pr0/5cby0uu3J5RDZwkKx9WrSKkplF3LwCyTorKrL656PC41SHSlHQebW3c9xcPqqfw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzzCMFjhOvLX8iKsi6AenOiXz30s9dOT55UhivAj+vYtgi40BV+
	7RKVEJILG/cxWH0mUWPjfKbYaCi9Bfzm3eOoz/6g9XJs3CWe4rYRkx2K4rTF3ek=
X-Gm-Gg: ASbGncvgSmVTzbnCdUlYuEBddYIyoH28MhabM8IeBaorG2pmNqa6/CNXcXTo7+m9bSB
	mkSfj0oz/wJ8uQE7ynNnYC3qeXz5LWq/EKmpNNPgitwO98kFTZowxWrLnkG3bODAb8rXcRwMXAB
	QqE0cOajawvrAEvlVzMksdzooran4NrJB4XCHAv/B82LCO4HcYIyU5Q2p47KyMiEmbSzeX6Nntg
	gcYRsNpTpgwl8dKjZ8Jy78b4a6i42lFGsvdTU9xUQrjHmcNKj5/9IjihF7aEgnRYK2r6jcGaiJo
	/VsFViSE2VTt7F1qU8qHHqUkxZtSq6ZvpzsAJaS2TRaVg8ms+YTi2b4yHCexl5c2Vwae8RPhifa
	9MR7HNdAdmEWlbQ==
X-Google-Smtp-Source: AGHT+IHJnhTbYGz+3fsC47NWjJwKIj8trSko9MC7l40QBwUPgSKgLh4fWO2GzddHNuwBXhAUnso6EQ==
X-Received: by 2002:a05:6e02:1945:b0:3d4:2306:6d6 with SMTP id e9e14a558f8ab-3d7ec27bd0cmr159074725ab.21.1744658247528;
        Mon, 14 Apr 2025 12:17:27 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e026d1sm2715662173.94.2025.04.14.12.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 12:17:27 -0700 (PDT)
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
Subject: [PATCH v4 5/7] clk: spacemit: make clocks optional
Date: Mon, 14 Apr 2025 14:17:12 -0500
Message-ID: <20250414191715.2264758-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250414191715.2264758-1-elder@riscstar.com>
References: <20250414191715.2264758-1-elder@riscstar.com>
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
index 09f101a52b1af..7494c97c3c7ec 100644
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

