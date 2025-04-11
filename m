Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C622367CB
	for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 13:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744377412; cv=none; b=UB5hq1sdE6Cdk+fNNYMowYBg0bI8eALd/b+ghiF2NhwDNZ2G4j+mJ3/AJKn1MmAQeYhLk957IujcEAjH0/w9pvN+US7oRY3gQ/YZMbsZxkGaljDmLEP5HvejavqK6VNUFwVbhmLF9p6xPepiZRU+AN0/oYhQAaOaX0vyEQooxYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744377412; c=relaxed/simple;
	bh=3q6LzsDwiE+yVVac9evuQozKO150MG55tmEaBUnFpq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MwmMMo/C0Qb6PNIP9KNqrMFfjhgduDQgYS83tedtGtMMH7ycMAMwgBltL/5XflgtUXwXb4tWdj9GWHsE5y8f3/PvDb4YuLKNOTurcsADvphVpkTY9RAhiLj5hwzEpn45u/7NfCi1c/x0Hx7IMHOrU2QsqCgZnPm61l12+bYXCqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=I6IgyPI5; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="I6IgyPI5"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-227b650504fso18823235ad.0
        for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 06:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744377410; x=1744982210; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8UqYwabiGCbW0lFM+J6bILwkNakAnqe4wz5kWFQbMVg=;
        b=I6IgyPI5tDO/pJAf8bpslff0wp0YTLyWOzabDfK/UTxjWU7bLonhYWKSf16HinrEOU
         UGLi0gW/4yKZtkCLzqkycnjdJ69eGXO/yWVKKbRcYDAKOETsQkaDaKtL8NCvpNQZCEGI
         gTBniB98M6aMpfDBwT8TpdGlJqDKk0YCxNNAwXZam+RZxisVFwi9OT4g2meuSgAyy9iH
         uw0Hr/GbobA/68BKxCpugNBuWw/MHInQ3IaBOU1vMN7tlDMe4S8tAGZyBckYMHFnHBlX
         txKt1ggzzl2OwXlsaqjTin4BTWfD+FpuhBYPRR3F/MlzpQs07TRmnSJHAPtzQ5jxZ+QX
         4qIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744377410; x=1744982210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8UqYwabiGCbW0lFM+J6bILwkNakAnqe4wz5kWFQbMVg=;
        b=W9erqpmAIzXvqvafYWIESB+R9vw4pkB/bWVSSKsXj1EIS27Jmks4hipMbRNVDNeo5H
         n9vHdCxF7V8sErFXZKJv5ZYFN2dbfi6IG4yTq9mafhzl8BYoYT7y9fZWJH0zGWxtNnNf
         qbMkk3jXRdsWi50SVZkTMsg+vICssKY9HuZhvipjSw3CZFxodQfR7x520N/39mzhTal2
         SgWjjDQLD88BvsXshvZYyzUjv0cxlIqoo1vL0ZodNt7RIboDv2H1iWtayjfB92EM/nOw
         EaQgq5bn9YYguutUEJXmm5Ue92/nwptv3AEQM9QZ6a/n/bbuTGt4RR6HjTjF6ZK7iq63
         8JgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkWNcX8WosrHcYNBerSVvELjpUdCqR3bba1iFS6u1F9PyMPeXJIOMlH3rIGLVl9FcIgKZ+Se+7Sw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9XGAmDpkIl4g4hCmLcg/rzn5Yb0AjMMWYVy+YGSBZQulgdMbP
	fdZtlGj3ylQ2qUGtrBnAE6Yv35bGYawqWag6UwWrnmX7yGzQyWsuVP26ILdyxAo=
X-Gm-Gg: ASbGnctrwOuPpC+TAYaCRqqclKvLV1wXCJ+Xus3ibT5IebJbWHrStCZySWBR2sO3E1r
	cJpuRKuA7Rm4yZ1KhtE6RxU2a6H/xN9hIatCUgJxvMzFwnrtMA3vypgcajulrbXe6UElJuhYppS
	ZOk7N/tqSmY59UhHp5SIF0pmfGF83hi1rM83a/A2nNSea0CvN58W26U2RqZPrKJdrVAqTyz68xM
	fRsFvkhDnlweJaidlbI1eBCnI5L020b+S00No0Auq5jtrW+JgG0NWD20T/qYmVOeW8000JZyKwN
	Ngar/h22/ubwA7IE4ak2JWy8EVOQKOY=
X-Google-Smtp-Source: AGHT+IECvokSxW4TE1t/6GjH2KzEiHk/fDfcTN3ty6UKV6n7k5pcSeZTqv5IfUu12KUb+He4PBCOnQ==
X-Received: by 2002:a17:902:e545:b0:224:1157:6d26 with SMTP id d9443c01a7336-22bea49616dmr42095625ad.4.1744377410365;
        Fri, 11 Apr 2025 06:16:50 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a305:4::308a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cc6sm48245005ad.122.2025.04.11.06.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:16:49 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 9/9] riscv: defconfig: Enable PWM support for SpacemiT K1 SoC
Date: Fri, 11 Apr 2025 21:14:23 +0800
Message-ID: <20250411131423.3802611-10-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411131423.3802611-1-guodong@riscstar.com>
References: <20250411131423.3802611-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable CONFIG_PWM and CONFIG_PWM_PXA in the defconfig
to support the PWM controller used on the SpacemiT K1 SoC.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 4888529df1d8..9bd972867e0a 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -259,6 +259,8 @@ CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
 CONFIG_PM_DEVFREQ=y
 CONFIG_IIO=y
+CONFIG_PWM=y
+CONFIG_PWM_PXA=y
 CONFIG_THEAD_C900_ACLINT_SSWI=y
 CONFIG_PHY_SUN4I_USB=m
 CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
-- 
2.43.0

