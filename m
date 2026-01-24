Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8099520A5E5
	for <spacemit@lists.linux.dev>; Sat, 24 Jan 2026 04:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769228993; cv=none; b=r0tGsxPxvIqHJTKIYA7RWMgRPJ4Z3YMgOqCkFI2GSUXUOqdkdgxk5f9x4fagHTNqMcQo+IzJy9LYFgx8HJuN4nDPMOGzaDJ28Pgo2GebkI3JR6i0wSdDiOetnISEqv43bfph6PBWPjNBEZ3altIYCrvfrlt4WAu11/V1rMC7Efw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769228993; c=relaxed/simple;
	bh=VJ7ICvLmTJ1YvBpVw8h95hbtFUhM+sT895O3kbXFvvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tBtIofdQzqnA6XGLhICe4pd8qu447r2lpR7Ypn/gFzLK0bgZz9ZtFMDYLO1jYS/OUpl1RMHj/CwTQ2FlSckUlyM1J7qdGn0ryzJxTpihQSD3NoVxfkj3bc6mreIdirplTAqPmhrO7/ntOqwve89ssOng+kifMHoTH+n/Ln4N6D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=JMiABDUF; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="JMiABDUF"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-81dab89f286so1481196b3a.2
        for <spacemit@lists.linux.dev>; Fri, 23 Jan 2026 20:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769228991; x=1769833791; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NyfRLNITYR+AOfB6dobWT67hhjvc5+SsVTabgpbO9i8=;
        b=JMiABDUFlbKwfcURkRc779Z6StftrtVb5quVNA6P9rHesvCiVNiufmMhJ7FlI0nqVI
         qj13ZXl2Rgl5s8t/G+Kk2JRa2UeYlEXLNuQ2WQH0dODKZ0RbF1JAEft1LVu12vLZ/58Y
         eHMxTMWtQqC51rmkz/FB3fUsPbr7DZvEZrMO7GsLcoGNSM00wnpqZE4x9Gacz4lherqw
         H5h6lsZWakmgRVj1hc61LvYHHOpeQBQdOv97Q6qJob6f0sxR76F2M0hfWB4T4AEZxLwS
         2lfUKmLeHalxB0yXioD8k+aKehEeRec3KhUuSRB8ain/FSVmyb5Pw1UIV4Sg1Ay+zHGP
         LmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769228991; x=1769833791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NyfRLNITYR+AOfB6dobWT67hhjvc5+SsVTabgpbO9i8=;
        b=bbpMSb5DIqUrDJyruTqfrcpQ94G7JYQHBvvgb0swfdV4fuZp2772L6BpetgVb3nFnn
         3akalvEekfFNW2s/XpZ19bNP8Gj+T5Du5HjLty7Z/ePmOrtpndukGnP18N8aje2wbjyA
         Oiu5PI7h2awK7gXBbJ/QJbL5/apGxwl4O8DKNBllf0gBYmUDyxX+VxkDRdGADZga3M6T
         cUl6RE4ZMS83ne7z6dMUrq35sJivcCYPdoz/fX+H1G0AAjx30eaeTvWWA3T5H2N0wmAW
         l5lm6ifi0r1fXUALAZ/1SFV/wK8PkUxJWFdOpX377+24akIn7ym80i4iVb7XUvbb4dmW
         JXBQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3cjnFmjsngyKYIzfxXYmAp8ovriSBXkRqLlun4qSFjKmH2KRLGPJ4Fz7YuZrfFQOh7xre1Jfy3g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxQ+BMYoUtW9z0MfpfZA4yfVYUgaIg/S12wvfTQnDmrLvv3nGlp
	kM8W0j6Hn2e9jtBln3L17q2Kr61Arm28WsHwUw8SRu3uInmkmzfK1BGEXP4bls6+0pk=
X-Gm-Gg: AZuq6aIjLoXtBX921EnaBYK64qAbzjYJyrJUgoNlLl4cKGdX7qP1vlPbAs9MSDTcAwT
	GfjmQM0is8j+zeIE+bABur5yXctX2+1hKIsKODa9WLC4l5c5O3DUTzDkRWQS/sSy03Ut1jUutns
	3DYtBBvyCjes354WESvUMxXE4IdPJnBZTD9fN0pVt+HHSr8enw6UFNTK/KsPvOCzpX/XZRzy+Rl
	+bJYXqTyi9O4sWBdHFl6tBkbrzyovtfGQGiCb1BNncSV+5Ixtvm0A6Rgmh10l3B9UmkH6FyUK3O
	QaG9th8xZGcgRREBjJ2L4su+RZDBAfA1FQoW3TNsjSL00UImbUGfbz860FKGXWDCzwtSN7B/WAX
	OQWiIzi53yK1UwGA3uHy21JvJOkA4pqlJjYz0lfwkCZcukn/wCwevS9fNPYnT4iODk4dl0vGm9Q
	mVvWLgNCj6rCFTzi3U6zHdVe48bLKcAqc=
X-Received: by 2002:a05:6a00:f08:b0:81f:2b25:ca73 with SMTP id d2e1a72fcca58-82317e00e76mr4405493b3a.38.1769228990885;
        Fri, 23 Jan 2026 20:29:50 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::30fc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231871d51esm3469423b3a.38.2026.01.23.20.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 20:29:50 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 24 Jan 2026 08:20:18 +0800
Subject: [PATCH v2 3/4] regulator: spacemit-p1: Update supply names
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-spacemit-p1-v2-3-2c86b06694ba@riscstar.com>
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
In-Reply-To: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, devicetree@vger.kernel.org, 
 Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3

Update supply names to match the P1 PMIC's actual hardware pinout where
each buck has an individual VIN pin (vin1-vin6) and LDO groups have
dedicated input pins (aldoin, dldoin1, dldoin2).

The supply is a board design decision and should not be hardcoded to any
existing power source. This allows boards to specify their actual power
tree topology in devicetree.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: No change.
---
 drivers/regulator/spacemit-p1.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/regulator/spacemit-p1.c b/drivers/regulator/spacemit-p1.c
index 2b585ba01a93..57e6e00a73fa 100644
--- a/drivers/regulator/spacemit-p1.c
+++ b/drivers/regulator/spacemit-p1.c
@@ -87,13 +87,16 @@ static const struct linear_range p1_ldo_ranges[] = {
 	}
 
 #define P1_BUCK_DESC(_n) \
-	P1_REG_DESC(BUCK, buck, _n, "vin", 0x47, BUCK_MASK, 255, p1_buck_ranges)
+	P1_REG_DESC(BUCK, buck, _n, "vin" #_n, 0x47, BUCK_MASK, 255, p1_buck_ranges)
 
 #define P1_ALDO_DESC(_n) \
-	P1_REG_DESC(ALDO, aldo, _n, "vin", 0x5b, LDO_MASK, 128, p1_ldo_ranges)
+	P1_REG_DESC(ALDO, aldo, _n, "aldoin", 0x5b, LDO_MASK, 128, p1_ldo_ranges)
 
-#define P1_DLDO_DESC(_n) \
-	P1_REG_DESC(DLDO, dldo, _n, "buck5", 0x67, LDO_MASK, 128, p1_ldo_ranges)
+#define P1_DLDO1_DESC(_n) \
+	P1_REG_DESC(DLDO, dldo, _n, "dldoin1", 0x67, LDO_MASK, 128, p1_ldo_ranges)
+
+#define P1_DLDO2_DESC(_n) \
+	P1_REG_DESC(DLDO, dldo, _n, "dldoin2", 0x67, LDO_MASK, 128, p1_ldo_ranges)
 
 static const struct regulator_desc p1_regulator_desc[] = {
 	P1_BUCK_DESC(1),
@@ -108,13 +111,13 @@ static const struct regulator_desc p1_regulator_desc[] = {
 	P1_ALDO_DESC(3),
 	P1_ALDO_DESC(4),
 
-	P1_DLDO_DESC(1),
-	P1_DLDO_DESC(2),
-	P1_DLDO_DESC(3),
-	P1_DLDO_DESC(4),
-	P1_DLDO_DESC(5),
-	P1_DLDO_DESC(6),
-	P1_DLDO_DESC(7),
+	P1_DLDO1_DESC(1),
+	P1_DLDO1_DESC(2),
+	P1_DLDO1_DESC(3),
+	P1_DLDO1_DESC(4),
+	P1_DLDO2_DESC(5),
+	P1_DLDO2_DESC(6),
+	P1_DLDO2_DESC(7),
 };
 
 static int p1_regulator_probe(struct platform_device *pdev)

-- 
2.43.0

