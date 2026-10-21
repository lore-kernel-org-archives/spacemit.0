Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588899;
	b=Dd2svsdfYkQ547adB6CZXKFl0FuHlLOR6xjJo/S/SYMp+yjqpEjxf9mY7lAdi7x8nnxF
	 94CHpQXXtG+jtjmebNP1QGVV0R/G9PEihcYVIrN6l8EdU5eBBhVooXx35c1s2fwHv1bwZ
	 h1rE9LCUqEpOaZ7QhJFG2YbmDLgGnHiVsVAu8psKq0pMmzDvDybR/zsfTHngTcL2DkH3u
	 ki2kT/agVAaU/l32ahjTEswq0yzkimszqq3q82YxDIv48fitJhAleNOkdQbNYMjOi7nKc
	 e/FIOZfaFWuZrLB0TxRgzlVYnvyrVBZ3qimY14wI+GGH1UOpo99bMT7p2GXh49g9cjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=x0hyuR29EsatIH4jXUcnLqsaQxGY69D2I/F2suEOs6k=;
	b=BHVo47zKB5voHVHONBJ2DX53KN4fnATCIFad8XcSuyy7rknehhFj9+mdGz7BareQucL+
	 iCuni3LPD4FZ9dMCulj8eYC0FcVd71QFPaUiHLgBMgWYiV95JA3X6sSRxz02gxzeg35bW
	 t6maKRhFr0FOHPPvNQvAbr/IuLS5HX0BXZ7cIh9LKwPxxfOHJVgKsx06PECaiFbY5WMBR
	 1pb3vm85KdvB80MrttA7NTEn3zs5IBEA+nsh6a8dmUNYTvmY/i7P6B/PyZH13QXCnxSAR
	 ZnXg1+JwofYfQEJtD/4MaaZHA5RS55ibpiBIk99cWtI8U3WwneH4ksbDmlgyBQvxhAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UsaE6kPh;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F153606A31F
	for <spacemit@lists.linux.dev>; Wed, 21 Oct 2026 13:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F153606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UsaE6kPh
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-88cfa501c5cso264222b3a.3
        for <spacemit@lists.linux.dev>; Wed, 21 Oct 2026 06:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792588898; x=1793193698; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x0hyuR29EsatIH4jXUcnLqsaQxGY69D2I/F2suEOs6k=;
        b=UsaE6kPhtzXkRuZETBuQdHVLoGE6eJSk+lNyR/8buKRceLVWk7xECyh7Dw53Dhy9uy
         /I5ohK7Hd7QS2Va1KbrUXsydjYqwNOjrj/IhLXoLFdEDpdetNpBHYQpr6xd4BVlvSGmk
         Qz69CfIHiHsLLJZmUnDLPKq4HdzepFa9783xJclqyYk2m2dUsQ6GAE7FaItewgh/s+2C
         f0Hf15XKVc5xThNjHldx+pqpNp+oepWTCgtoGAcojCYIOVDzIOSlr/wwI7Am3blyv5Ix
         JyTkwe6fQWWW5pg0+AKbeT/6ijiZ6o+J+L7KMhIS+1GChX+HYlHryCoNcSfqR8cxK7Rb
         wWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792588898; x=1793193698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x0hyuR29EsatIH4jXUcnLqsaQxGY69D2I/F2suEOs6k=;
        b=gfp6hwVhtGhsQ2XIqTBw3p3Z7nDmYt/82yli3vce69oV4bKFNOoZg6jh4mleTIzz/Y
         JA6FXae0A7upub3oZfFNlsP99CYJBTSkHa1wEHLo50gOpHyt/2/r+nCg4SiYiECk25g+
         lcRPX58VG/5tNqTGg9OVuqYh33RqSxq7IUbm/5PgjxDgrhNwYkpRcsvyZSLjUr/AkIGK
         FxOcjg9dX12mmjYAXmNaHJJgf6/J5XaRoC3C7JIE7J2j5z1QvBU9JPiODsrjl7XhGwvl
         +IyQapShtDGFnF2OLZqMHp0QURPfTCu8fFtzoJiiKjjOCSOIn+c2ExPQLhlPSrYTiPiA
         yKow==
X-Forwarded-Encrypted: i=1; AKwUvByS68VKiuqSlaDNiqPcund0lM9Eh0BjcbS3gm+o+cyPXmEoSl37JB/21B9AdE3F5t/rOY2D82O1Xg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIJ3cZkWcRvhG7Kb8hVCneU1mlCquRz+BOt3Z4yRzr58i/xHHGl
	D3s6Xq6kHTeLxP/b1tIeVx513EMe13Ux8BoZhVRQya2in94aJwZmRBA4zNtiffT/sqU=
X-Gm-Gg: AYBFou3X1msiXWCmhGrYHEqigW0RmrV69di92CZd/Ky3jc1lzfmgkOWesOnc7Zog9iA
	bN2GehCRhHMwyyPHErE6SS8IMvxDL2gx8BqTvyMZHRSZa0KOrC8bE9Y3wxhsp/CId/khPzoRH9C
	6+nuN3HFmkaUUFe9vQOyhgLuPOeJ1LGOWyCFKkggUMYg+/dcauZK8oMnDgYJJlwa5+ru9nvDW93
	g4AD2vzn/NkkoE3ErCwgLVDnLZAGJ6AtnB1i3CJZj9p22sfWIMdZqc2U57xrowIeayxw//ebl6B
	pU/S2Oq8GxnN43OK3wXfjIdxTdSWZhaeKSjUKXX6/oFsqFWvbjHC6IBjaYQriqtuTjGrAi4+Zpx
	WYUDHyC5GVVMCX7BCS8I/Caq51JZHjX4ZDRp1Et9XG5k9aZ2gM22uaY95BCGAVVGuoA3YvL1ECT
	c1UZFCwdhbw6S1C7QZRP5qVFupNpY0E8FoiMJ+Pk8hn80lDuYHW1nUY4mT3PdEAxAxSBQOFg4RQ
	4nYd2I+YCvGAJ4govALslYT8kw0bRfUjwq6tXVoFQC7Bsw5uS14++2bUyJzxwAjFnNnyigOE0Rt
	E6C5mHF3jMOQ1g787SXY0Qm/sjnPzaWzb//squZzl9CZkyZPHveztB71Lo0xlA8k8egIJaJsWiT
	YEtOKnviE00WS5uzoY13/1X0XvUqaq+XpOZw=
X-Received: by 2002:a05:6a00:4504:b0:89c:6b2e:8413 with SMTP id d2e1a72fcca58-8a089d35b1bmr1709553b3a.40.1792588898285;
        Wed, 21 Oct 2026 06:21:38 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895ff8dbsm881861b3a.52.2026.10.21.06.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:21:37 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Guodong Xu <docular.xu@gmail.com>,
	Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Alex Elder <elder@riscstar.com>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] reset: spacemit: Fix the RCPU2 PWM reset registers
Date: Wed, 21 Oct 2026 21:21:30 +0800
Message-ID: <20261021132130.3026998-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Every entry in k1_rcpu2_resets[] uses RCPU2_PWM9_CLK_RST, so asserting
or deasserting the reset of any RCPU2 PWM from 0 to 8 acts on PWM9
instead. Each PWM has its own register, RCPU2_PWMn_CLK_RST at offset
4 * n, as k1-syscon.h already defines.

On a Milk-V Jupiter running the vendor kernel, which uses RCPU2 PWM2
for the fan, the RCPU2 registers read:

  0x00: 0x4  0x04: 0x4  0x08: 0x1  0x0c: 0x4  ...  0x24: 0x4

Only PWM2's register has its reset deasserted, which matches one
register per PWM.

Use the matching register for each reset. No in-tree device tree uses
the RCPU2 PWMs yet, so this has no effect on current boards, but it
would break the first one that does.

Build-tested only (riscv defconfig, W=1); the fix could not be tested
at runtime, as mainline has no RCPU2 PWM node to exercise it.

Fixes: c479d7cf06c3 ("reset: spacemit: add support for SpacemiT CCU resets")
Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Reviewed-by: Yixun Lan <dlan@kernel.org>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes in v2:
- Drop the Assisted-by tag (Philipp)
- Collect Reviewed-by tags from Yixun, Troy and Philipp

I used Claude to help find the bug and read the vendor driver. I
checked the register dump on the board and the patch myself.

v1: https://lore.kernel.org/all/20261017140805.3278709-1-alan.tseng.cs@gmail.com/

 drivers/reset/spacemit/reset-spacemit-k1.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/reset/spacemit/reset-spacemit-k1.c b/drivers/reset/spacemit/reset-spacemit-k1.c
index 8f3b5329ea..dbd783c138 100644
--- a/drivers/reset/spacemit/reset-spacemit-k1.c
+++ b/drivers/reset/spacemit/reset-spacemit-k1.c
@@ -154,15 +154,15 @@ static const struct ccu_reset_controller_data k1_rcpu_reset_data = {
 };
 
 static const struct ccu_reset_data k1_rcpu2_resets[] = {
-	[RESET_RCPU2_PWM0]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM1]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM2]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM3]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM4]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM5]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM6]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM7]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM8]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM0]	= RESET_DATA(RCPU2_PWM0_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM1]	= RESET_DATA(RCPU2_PWM1_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM2]	= RESET_DATA(RCPU2_PWM2_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM3]	= RESET_DATA(RCPU2_PWM3_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM4]	= RESET_DATA(RCPU2_PWM4_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM5]	= RESET_DATA(RCPU2_PWM5_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM6]	= RESET_DATA(RCPU2_PWM6_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM7]	= RESET_DATA(RCPU2_PWM7_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM8]	= RESET_DATA(RCPU2_PWM8_CLK_RST, BIT(2), BIT(0)),
 	[RESET_RCPU2_PWM9]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
 };
 
-- 
2.43.0

