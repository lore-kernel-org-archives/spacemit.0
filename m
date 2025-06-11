Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B7B2836A4
	for <spacemit@lists.linux.dev>; Wed, 11 Jun 2025 13:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646838; cv=none; b=cnnP1ixdja4cbcT99JHnpC48fHukjZwacLPWDaj7emFb+LFC+AYuBjLF+EEqCqFGayLoY21ZrYbbK2tSTCezXbQ1aHIePk6o6a04j/74tD/X1J+F2SMVjxcdjn2CpdXHh51IgKsHk1ciFCU0twUGmt8hyso6PNatcZYg+krH7r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646838; c=relaxed/simple;
	bh=Y/UVoA63Ub/h5tAaXT2Oci9EF/b7F5JY0JZpRJfHkVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bi9VJopgUfgNVOPxNf9FDO/gZIu3zGu0a6LkVuZ4TLoHfa7MyQvmXPmWyShx82T8OBKGTLHn/BoKZtZr2KHqjpYQueUR8DKdgb1fEKwdWg+r2rlsLsg+eh/W5W+ADp0GzC1IzaPHkeGS7y7mjtTgDuuN0NDE03kva3RvHV1e05Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=tuDf/LZL; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="tuDf/LZL"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-234fcadde3eso77780115ad.0
        for <spacemit@lists.linux.dev>; Wed, 11 Jun 2025 06:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749646835; x=1750251635; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QndPkvYOfHZnlmLnlurnlWYXTuNHVByXqbm2h3XNBdM=;
        b=tuDf/LZLWZh5eFvQca2c+Dvkdzku6Q08MDUs0/16xLTpyzLjQcnvmFPU9uR2X+gWyf
         zq2lmqMGzIZznFbxigiWiLnXebwVkazvy9YHZ5wvIEnmYua1zO3kqldffciWcJ824uAH
         lWfrvUzlFbDjuiomNJ0ZiLAo0FTTDs1VExG+7cbNYkkRAXZ4lP8X+RwwlTFmUntorf6G
         a0kb8K1EEQRH5N9T1fIwcE/zLaFD+vqR7ulMruyEaThlsmfYq+mOK9FjkCoXgyeyp7yq
         7xLvKYQQZ2tH1LMTmME/nmot8M/j1wTxYs0AFy1k6tYQuPoJhL5y/jbMhhhPVkKVBnQO
         KneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646835; x=1750251635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QndPkvYOfHZnlmLnlurnlWYXTuNHVByXqbm2h3XNBdM=;
        b=uxTAoekF/cP8Qa4T78WVjfGkSEHp154gsfmy7TsjzCwpGKQ5MoAYCB6YGKyP6nx3/b
         NMjPUSmidzf1lJG10CLFUPxTYTV3vK7rPf4DKLx5nq+idKHgZawV/VIoaWADrV3A3qEC
         GbaWbdcuaLw8NNSW5v95bouCvJmd8mf9h47J8P3omBh/kZd5q07AbVBRbJE3Tjp6QkSI
         8uNa8GChvN+wuiQrGA7pDwUbH2ZyUa3T1Mp/cHBjDpSHs1cV5Lz3Y92lkjnAKeBG+uTt
         leZCGYS3ceeJqaBATezwC/WwTZ3Oc4pgfdkybt8iNHX46tox6B+v/p6UjS4tz5X7VKuY
         9o+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfznnZeMNrAZtNy+LTWIqmULPvaBM7WyzQTHmAnoaj38tey5BXKIsp79CgCuDltGSxFJ/yU1BpDg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKxyScpQdwWWG8L4ZTQfxaHeOiACVZIFJpp39iJydMFawDi7Vb
	8STrq6I9mjXl21w7BapZyc0m6gyLGfAxPBU8W5+Y0UJ6E+B9iao8qXr76ZxduJmwu9M=
X-Gm-Gg: ASbGnct6onBDovta+hz+YxEpdTo9iY4hbV9kD4wZ9PMKvsKCEkOiasIPDj7rKSAVlUd
	GQ0geCRw4Jhqty/S1wju3fH62KN52fvkbdPFVcNRXD/yYVLHIEy2Lvu4t8B7r9nnEwlP+RHt7ic
	KFcjlrOq6julABC5Jq6cA6LatSjHBXT92CaPKOAq1zmvc1soIguG5vDeV7wqSpw09RCrfBAC4ms
	axTNCKGul44w1lBKp6d6tIBJQSLErg8VdynS8Xracofg5BstEs4d7UNT/hiVuug50iwkj5kkVoD
	70S2+qZh/pC3+p4e6HNNFMz/aZ4YN1qCqMU2kXi58uvhj+JOx6l5wKkWfkKRr1q3F7q9+XPB7fg
	/vn1TNDmLffr4/ebnSGZw8ZQ6U/UkfvnF
X-Google-Smtp-Source: AGHT+IE0KPlnWtgzReoKrdu9Pb1wUUDfgiReHhnIgJSTpMfI8WW3eLySP02w8+TUc5Yxq8BHiDxUbA==
X-Received: by 2002:a17:902:d547:b0:235:ea29:28e9 with SMTP id d9443c01a7336-23641b15570mr50780235ad.38.1749646835028;
        Wed, 11 Jun 2025 06:00:35 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a00:31a4:6520:3d67:ceb1:7c60:9098])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030925e3sm86984115ad.53.2025.06.11.06.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 06:00:34 -0700 (PDT)
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
Subject: [PATCH 6/8] riscv: dts: spacemit: Enable PDMA0 controller on Banana Pi F3
Date: Wed, 11 Jun 2025 20:57:21 +0800
Message-ID: <20250611125723.181711-7-guodong@riscstar.com>
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

Enable the Peripheral DMA controller (PDMA0) on the SpacemiT K1-based
Banana Pi F3 board by setting its status to "okay". This board-specific
configuration activates the PDMA controller defined in the SoC's base
device tree.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 2363f0e65724..115222c065ab 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -45,3 +45,7 @@ &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	status = "okay";
 };
+
+&pdma0 {
+	status = "okay";
+};
-- 
2.43.0

