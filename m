Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA75A235BE2
	for <spacemit@lists.linux.dev>; Fri,  6 Feb 2026 02:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770345154; cv=none; b=SjNhaDny41RRN31drmxJRAx0Bm1FuB5FhaXVFNreBtTAnhxwNN/XTQj6cJNrbz9hoxHISkmi/RRuDZYknaGik5Ncn2DQRwHsQHeInaPNB6/iTnZDVE85nWBrSkYYAArqpwbpIdrWEoGDeWkJu27Vw+IsrH/Ge/Hw1DBvbt7x5vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770345154; c=relaxed/simple;
	bh=+EeOMbsrkVrQ/nWNRoy6GEJ8PsMj5M2eB9aEmRc4lyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WDC25Axmv7RVT+HiPkuffKC90u+KM8qInNawBScKNJ9pWxc+qY5pee0gMuxA03IbBMEAFqOHPMfu6Gpi1o/UhLG2LQvolpgKy02ke0SjPxScZKWUlWTITN2u8vkXLeThP8Kl61X/cX3zd99R3ZfOKA7uyuhIDMqX1gHqrciIsB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=MEp4hWEa; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="MEp4hWEa"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3540266d356so1067725a91.0
        for <spacemit@lists.linux.dev>; Thu, 05 Feb 2026 18:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770345153; x=1770949953; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ZvkXVSIOYFCtEBxE0jhzmf26iD9qAK0/wl2dxGNFLk=;
        b=MEp4hWEaDdn9XWQ+qBr1IbSqYHv20XwvdXpbHpPVFlTOEmf1kBoEym7dKydK3E9BO3
         DWyZn9E1m2Pi1ofgY+2DZFzl4tEBqL5RgX8w3oHKEKU2zi4eDPGWglvJG578VOCesbeN
         GLMxJjNcmBqkgWEU2SnjsgKFzi83ZT0CzJpaQkx324TwF3bG5ECT9ZgvOYjZtvy5wj/k
         wzstwk6qkVIsrVkgcn9aNuMlht2jipfMnwE3S73HcX9lZ0mU0Rw/ZIFQJS9deHlkuXKL
         xgxdlbmYjMXObLvqDQcPQSaKf1c29aNLhJIm0VvGqk4JwR6yokZPH/jGO1AAPKgYboYJ
         V4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770345153; x=1770949953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2ZvkXVSIOYFCtEBxE0jhzmf26iD9qAK0/wl2dxGNFLk=;
        b=IKJfsbY3nCbGUdPrwH4wakF6YxyDQnyzDFwy4O8A91XOnog+5xEz4CkdXcivvqSSnN
         HR8IacO5md8QPmKTdZ8YgC1jzgxTeFrqlOGEq4WIC9N4Ynz4JoiMlpu/tHWXVBYzDIDi
         7jJGcC/eLj81bqUSfh2Xeoh83YosNEKiVP20hsf6y6G0FnbaqtLRooiZUMgYhk+OT/MY
         SLAJXmnMjPrFUpQjtwWFtUZQF/1gt2U8NpJhpX/WfCVcGsEeqf0BZa5rDHpJjK0CZIsT
         XO/0Cf0mbVN0yPJ7FujNFsFTAASb5ZDUrO8hVz7t1miSY8q29hoVoGHG+Vfc9O1o6Lgs
         wK5w==
X-Forwarded-Encrypted: i=1; AJvYcCVeV8x+atTRuw4GiygLh0kcY26jP8Cfj8tLggvl0Y3iBt1Z6EXTtIhgYxMS9s+COthHaMOWnsQrVw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhnQQND/q4joWRmCnILt1ea+/VivYcFBsLX2SZo+jO0w0V7Lrc
	jgYgy4IG/9uX+BOgfzZKOF34MHgmTocIXk24l2NFBrTp5tGR6bC89aK/HskTipEzzEk=
X-Gm-Gg: AZuq6aKzCy7cy7pm7ZhNRs4V7i1GWyoHR+/Ku+HA425ncbB8zBPqZY2wNf9MQcsNVEm
	WyFCJQGJXdN/5O0bdXMuCVsM3P+TwRKyRxUl3ylxfyXnWO4sMaLsWkM3zcoLBnd8vjC6S+0HUli
	ODb1pJQVLF5q2UAFLs7YVHV1y7shKuZn+AgvIB3yBGlNLkMKgfK08V3Qa10+kZMY+bas6D8OXLT
	7HgXVAUigbyvnYcWi3DSGYKigHo+lig/N2GYrPRxyOsjmBRyG594DN5hYCzo1zrmAYMUIRs0CLo
	LaW5Kt9dkn9dzi7A4TQ8h4ansyf7qokBHCA7ypOyrFkO/yOBgFbTcvQWCjSBON753H7JnEj/ZUE
	enVxi3FvNzE3uXLIsFy/iITPuKmZSiVTTVmIsnMPX/vY1nYL8BCVQ7vvHL2bCp9QtIrjpAk1zfB
	BN7LbVSkq55mymA82oLMT+dVKtG25aT1dHiBuCxPu8VT2BvxWxBTHivQx0n4Z3WzZdT/0JHS2RM
	xO1QDCiHeoHSebArBU=
X-Received: by 2002:a17:90b:4e88:b0:34c:2db6:57d5 with SMTP id 98e67ed59e1d1-354b3ac0385mr944309a91.0.1770345153341;
        Thu, 05 Feb 2026 18:32:33 -0800 (PST)
Received: from [127.0.1.1] (61-221-120-110.hinet-ip.hinet.net. [61.221.120.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b64a8a9esm158419a91.1.2026.02.05.18.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 18:32:33 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 06 Feb 2026 10:32:03 +0800
Subject: [PATCH v4 2/3] regulator: spacemit-p1: Update supply names
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-spacemit-p1-v4-2-8f695d93811e@riscstar.com>
References: <20260206-spacemit-p1-v4-0-8f695d93811e@riscstar.com>
In-Reply-To: <20260206-spacemit-p1-v4-0-8f695d93811e@riscstar.com>
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
X-Mailer: b4 0.14.2

Update supply names to match the P1 PMIC's actual hardware pinout where
each buck has an individual VIN pin (vin1-vin6) and LDO groups have
dedicated input pins (aldoin, dldoin1, dldoin2).

This is an ABI change from the original "vin" and "buck5" supplies.
The P1/PMIC regulator has no consumers in the DTS tree yet. For the two
K1 boards in-tree (BPI-F3 and Jupiter), power settings come from
boot firmware, so a probe failure has minimal impact.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v4: No change.
v3: No code change.
    Update the commit message to state ABI change explicitly.
v2: No change.
---
 drivers/regulator/spacemit-p1.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/regulator/spacemit-p1.c b/drivers/regulator/spacemit-p1.c
index 2b585ba01a93d0ce163c33e14c8022a506bdce11..57e6e00a73fa416fd6e557eb5bcada7dc69df444 100644
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

