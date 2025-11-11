Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6146336A019
	for <spacemit@lists.linux.dev>; Tue, 11 Nov 2025 15:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762876219; cv=none; b=tKG7klDZbH7WhxkAdLviK3exbixOi9ooLI0vFv7coQfayt4Grmr9Neo1h50r+GocNK0GaQFmW33G9CNkCM/Drl275++NZOb7BQc4sqTTpMC5FzwF0nKfXk7sYjbOD9SnEK3itffCv2D0PNB+KUGMws/UwyDR9TBkZdwYIvJWNXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762876219; c=relaxed/simple;
	bh=DHlxEl4Cm3VRdwsbOA/YSIyQycDreMiqXswBc5rWTMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Zs+eFuahU+uir1NaeQaAjDvKMocil0j2dycVeu1HvoFVJvRupTvzpPZHT0VQia7syyiMKQagqSTel7Q3GU5EjbDYzRGbxW7jwPUSG/zNcNLltHujTJLr7oPxBDoPK9DczvQhtzJO+8HHFeJJKuMuc4FkNFq72xqc5VWLyO1cKRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PRisvdYW; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PRisvdYW"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-794e300e20dso698261b3a.1
        for <spacemit@lists.linux.dev>; Tue, 11 Nov 2025 07:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762876218; x=1763481018; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kwxwWH0h/k86KA6Lqbt4Xcny5Xif9KRZerM8f0+lE/Q=;
        b=PRisvdYW+GORTGzbXpm+ZLgB1bfhBtkTX9oIl9UDCGqBxSj+pr/wvAwtIYSoG0nxkB
         EQyF9pvakitDKR9OBud1dSwg9zhmKg6rgcHDboh52CnA6FSrQlSJvuIp16qjxTXOowQF
         DI/rCnBAdxJonOSwlO2SdFRQ0rdnzGfCrcweWBFQbMCM/wYgCSlRvHbbyyXwbdbRJ7G6
         4xqcyKhJRWzjXIu7NrJalRDSKX8/svbc+NlisxO8qUTOp8Bim8sBjK+s1egM5Zg2RUVZ
         td5ShsGBSPXFGHkw4j1mSqE1HqmxnuilU/Tsl6zYRnYUzv714VybT8z8AKhb6y+Z1ciE
         1eMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762876218; x=1763481018;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwxwWH0h/k86KA6Lqbt4Xcny5Xif9KRZerM8f0+lE/Q=;
        b=nnMuqfOhNYNgKvxmrVq7qkikG7IA/L4vKAaOP/wn4VIiGUruzr8SwyUFEQoSusybpa
         q5kyo+zXMWqc2cwfgFB4qc2EYgmC30x0pd5irMJJpy5rNXvHmyUIS5k10byZ7hF7GHU5
         EXoS/MOlEwyf4Ebs3hc9xWiH4RLuJycFbe0yTgLZOHITrOHUvSIvxkdXJPSubI8D9s9m
         WNITJR8zj3jxKqhsRLWq4vs51qydf3LCQphWW6D/3BhXLpn3cVeEXwl13xjs/1izsuUC
         Z9w1y23XfGoZsjVEQU2DFxoky8w9bz5HqE15Jvv3viDoI9xmJeIc602WcrJ1r/SV6R/N
         i5Rg==
X-Forwarded-Encrypted: i=1; AJvYcCXhQzeyGB7TGIBX3FBc7CK8Ddj+hOwV8bn+cCiDCMyQKwZv+gquIgMWz/4snIgOkJIzPKo7Y4QanQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXa0sdb5VWaP8EDIFH4xYC1FHIAIehNq+DtN7uFUxlkcTQA8AR
	JlrTmS5/1ZmrWk0JliDuWs61EaTDFSRT0IYVMUHUU3gLoBkjCFLbUH9X
X-Gm-Gg: ASbGncsSMopDnJFDXl+Pm4HgRsykoOfr4n9C2o8uo2X0CzE7S4zuP0oS08au3c6rFOT
	Q2BpDrcpeGyIypTn1H3b3SSDJPdNliVj1YBQCO9UyDRSAVpt2j7QvvGhPOHQ1PNeH/Dyyh2X146
	OXBxC3J7ChwJflzYn15rX6GFTsq/qUaPPgXNvzmlInS47t+8GCQOfpS62t0PPpA5zvkBJ2gli9m
	5sqP1c/n0ORS2m34XtkOgDOErTQ7O/W6u/H46CfYlhtilUyDrAo1rN9BZjLuUfiRZCVzJEQhhvP
	HcTGMLUx6bQAbCarYCY/xx7HmvsIjKfS5vm5FTbSg9lqkebjlb5DQe2uLT8W9P3gfVkQEirKC7d
	Mb6wlH0OiXZl2FaWoCq3G/7OxepzZQdkM7XHz6sdfxjnjZkTfRxiq3ZgkxPn7S5T+0OL8AGbK47
	j/4A==
X-Google-Smtp-Source: AGHT+IFUeZ86WNREaY3JnN9DeD2rSCTPmqw3Crt4HqqKMYEinhAe5X1WLVaqt8s1Jagy5zo/mu0g8Q==
X-Received: by 2002:a17:902:fc4f:b0:295:55f:8ebb with SMTP id d9443c01a7336-298408213e4mr48838695ad.21.1762876217391;
        Tue, 11 Nov 2025 07:50:17 -0800 (PST)
Received: from localhost ([111.55.24.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dbdb09fsm1087615ad.17.2025.11.11.07.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 07:50:17 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
Date: Tue, 11 Nov 2025 23:50:09 +0800
Subject: [PATCH v2] clk: spacemit: fix comment typo
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-b4-fix-ccu-mix-typo-v2-1-d64b97b48d1f@gmail.com>
X-B4-Tracking: v=1; b=H4sIADBbE2kC/22NQQqDMBBFryKz7pQkatGuvEdxoeOoA9VIYkNFv
 HtTobuuhvf5/80Onp2wh3uyg+MgXuwcwVwSoLGZB0bpIoNRJtfKFNhm2MsbiV44xbtui0WVFqT
 LnlNFGcTl4jh2TuujjjyKX63bzidBf9Ofr/zrCxo1UtN1bZoXim9ZNUyNPK9kJ6iP4/gAIVCcB
 rYAAAA=
X-Change-ID: 20251028-b4-fix-ccu-mix-typo-038c19fe30c4
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Encrow Thorne <jyc0019@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762876212; l=1164;
 i=jyc0019@gmail.com; s=20251009; h=from:subject:message-id;
 bh=DHlxEl4Cm3VRdwsbOA/YSIyQycDreMiqXswBc5rWTMo=;
 b=y7lORg16U5lsvcS9/DoSo7mwT5fo22eEVpj3gCoSuWbYgbLul4lhSwzA8UAzZmSxgvPPJorn1
 KMkTZ/dZIi5AGLNsXQ9FoACulckMazmMA6jsBicgtNXnh6nT7N+o4BK
X-Developer-Key: i=jyc0019@gmail.com; a=ed25519;
 pk=nnjLv04DUE0FXih6IcJUOjWFTEoo4xYQOu7m5RRHvZ4=

Fix incorrect comment to match the filename.

Reviewd-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
Hi Stephen,

Could you please take a look at this patch for inclusion?

Thanks!
---
Changes in v2:
- Simplify commit message.
- Link to v1: https://lore.kernel.org/r/20251029-b4-fix-ccu-mix-typo-v1-1-caddb3580e64@gmail.com
---
 drivers/clk/spacemit/ccu_mix.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
index 54d40cd39b27..c406508e3504 100644
--- a/drivers/clk/spacemit/ccu_mix.h
+++ b/drivers/clk/spacemit/ccu_mix.h
@@ -220,4 +220,4 @@ extern const struct clk_ops spacemit_ccu_div_gate_ops;
 extern const struct clk_ops spacemit_ccu_mux_gate_ops;
 extern const struct clk_ops spacemit_ccu_mux_div_ops;
 extern const struct clk_ops spacemit_ccu_mux_div_gate_ops;
-#endif /* _CCU_DIV_H_ */
+#endif /* _CCU_MIX_H_ */

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251028-b4-fix-ccu-mix-typo-038c19fe30c4

Best regards,
-- 
Encrow Thorne <jyc0019@gmail.com>

