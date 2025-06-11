Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA922857CF
	for <spacemit@lists.linux.dev>; Wed, 11 Jun 2025 13:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646851; cv=none; b=u1yhmBhr6/E36sYVGWJlg1sW8ofxsA6BOCWAE1eEopGAZEw1F9UgYT90a7TBH0oCL+amqx6jJdJ8Dbp4MVoAZkDrYX82yyXNn/j2vOsO9bmAlQvUCdiWCQEIhin1iXV4/R/7LY+/Uc/LjafuJBirCGYe4uwIKhyGzVUAdP8ZMZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646851; c=relaxed/simple;
	bh=BsrvoibobNdRj5bx2FV7FFPriwpl6oIPTWKF+TJb8js=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IUMcaaFjtX8Mmrr+iKAAtufvFhyLibefHuPM8zkKd7BWdnoatjc9Uepdy+sA8pNq46n3HJVQ/k5oGB42EbFZaFac3VDAkKnsLffeCCw6b6+kaLHSRKKGK9pTxSr9/qkOXAIy/+HVVFY1NC5UhzoRiHY7jcAapzx6FNks4rJHirE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=fSn4GP0P; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="fSn4GP0P"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-234f17910d8so64285735ad.3
        for <spacemit@lists.linux.dev>; Wed, 11 Jun 2025 06:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749646849; x=1750251649; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3Hj23NsfOD62jCqYZdTyo05Iy3n4LV0OoIjBt95NQs=;
        b=fSn4GP0PF+2ocesbX1HXStEou9i7vFNo0f9sntjWVK4z93QXBXqfMAa7VdV95xhLD7
         NM71L1qiSnT03q6VU6cO7MbMPdc3gM0N8BYe1MtzhiRzZm6WOIWJegUmCYE8u1zd0kS6
         c1Kn0H1uMUnru/7dXz/BqE+Kb0guOgAbZz/JUk6mrgjAjLPYHjc/StRLm/Lsdywlw9TN
         p58Sppn0lLM0GAKa6avPCjcbSQ31pWRYoQCP+t6Jzz2GfnrsLE+pLbavNcKqaJb5zQOt
         sCJy/1CQvorqvaxQCW0tq7Hj/8uT84PwnTEUQ9eq3miapYlZ95oKLz9+eWmHHheR7bIr
         GW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646849; x=1750251649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3Hj23NsfOD62jCqYZdTyo05Iy3n4LV0OoIjBt95NQs=;
        b=kcVhDtdwxaoVyWjOeBPo1y/YFyxNZTRrwYKczrnu1dw7uMpJSWSdSVCbMXO8l6Ewws
         9T/72qLe/ozd9YcZhrbuoi7wsqg10JrT54GV9WpdBkpPutaF6LrDNaZRgE/PAH4vfQht
         0HsYotCMEYHDVHLVTdVTheyG+YpmqQV0m3g312iylmMRKp2iT0OAHruKVR5tItzR+a5R
         P86yxYWPCDrBk8Uc9kO1M89NtQJeiW2PwfIg18wKb5lgpU3E5IoUKMSvNYVOFOvBVDq4
         AkkYacIHZ5nPUl+xrvNJuoprFbdBX8QEWhcld1dc8+MC8v5TfMi0GXOffSMpxefBjh4f
         mq4w==
X-Forwarded-Encrypted: i=1; AJvYcCXBN1TqJpSkdcQHy+TCE2JQt3uTBF/xIMegqyv2uosJ3tZpQY8/kYg42lKAvFl3rt90k0owgmWzZg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzyEFoLW7YsZFGsemmaeGznlbQqK9Hes2AqXtUfnXvrQOZSbP7m
	ZMzL74mq80gp5sVhhgiI3MyYvZ4rd7BzdjF9HTz02RZ6nofxdb+726DJWx5l72rLqkg=
X-Gm-Gg: ASbGncs8moPKCR6rdeKHKPkO99GcbyoMMj5JlcsNL19nCfGPwr7JcqAZV+ze4ZipZzO
	Jtqyprulven1yP6WEvxJwyBeiVp0RuHtdSxkgC2rVOQOqNwVoaq+Txn/sTpr0oz+WgT0HCPrMt7
	eC5H/3vUvIjKBBDDhQJBs3zZ0pqzcbZlNs9ODEofNb2J4VmhaIUlv1SNYWz0wMXmH2Q4MFV9iZb
	arlJfTBWBwS2sdopUa4wjQg4l7azXf5WbbCh+S4XMLJokva9XznyzwC6Ekzl/M2lwZytDmfOF54
	z7t3eblzvXKtzk+grdfSP4MRPGaIAMRKD7aCHASHaQQz8VcQsEYdWPFf8lJdEC0Ki4ge+NRlFQ1
	KOVb30y2seYnWJd0Sfj63Rg==
X-Google-Smtp-Source: AGHT+IHVBo9LkzNee2JKYrKdwtZHZLkreGBOXP7vX/U81FjBHvUbwcdU17sovy3MyAgANjjIbprzmQ==
X-Received: by 2002:a17:902:fc85:b0:234:d1f2:da31 with SMTP id d9443c01a7336-2364260d38amr40073705ad.2.1749646848615;
        Wed, 11 Jun 2025 06:00:48 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a00:31a4:6520:3d67:ceb1:7c60:9098])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030925e3sm86984115ad.53.2025.06.11.06.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 06:00:48 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	emil.renner.berthing@canonical.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	joel@jms.id.au,
	duje.mihanovic@skole.hr
Cc: guodong@riscstar.com,
	elder@riscstar.com,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 7/8] dma: Kconfig: MMP_PDMA: Add support for ARCH_SPACEMIT
Date: Wed, 11 Jun 2025 20:57:22 +0800
Message-ID: <20250611125723.181711-8-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611125723.181711-1-guodong@riscstar.com>
References: <20250611125723.181711-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the MMP_PDMA driver to support the SpacemiT architecture
by adding ARCH_SPACEMIT as a dependency in Kconfig.

This allows the driver to be built for SpacemiT-based platforms
alongside existing ARCH_MMP and ARCH_PXA architectures.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 drivers/dma/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index db87dd2a07f7..fff70f66c773 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -451,7 +451,7 @@ config MILBEAUT_XDMAC
 
 config MMP_PDMA
 	tristate "MMP PDMA support"
-	depends on ARCH_MMP || ARCH_PXA || COMPILE_TEST
+	depends on ARCH_MMP || ARCH_PXA || ARCH_SPACEMIT || COMPILE_TEST
 	select DMA_ENGINE
 	help
 	  Support the MMP PDMA engine for PXA and MMP platform.
-- 
2.43.0

