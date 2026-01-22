Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C6F3128BD
	for <spacemit@lists.linux.dev>; Thu, 22 Jan 2026 07:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769067041; cv=none; b=rQwgWXCYcQ92AdVENulOHbhgfWvtYS49Jlx6qw0Qdlu5SswnMJIdk9w8rvlXLl6nnrDAIbqcE7mHXnzSZN3pDyo31lSUddQZTglnLRmf+zPHWf8Y09hNG1zRrkoeGlsq1RP7QY+scMNxxYNPD0DpWOjY9P6WlYnOJzDDYeug/lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769067041; c=relaxed/simple;
	bh=tJAdYB72jhqifCdwS3RSRbdshVA50wCwrrtAEwfIlnk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FTSC161cZlXTiZI8v/T5V3oXkElC3SX+jQN/mpXaJKBv9eXLMER1i7nrM58XJ8zQebNWNdvvmJE89txhvvRppgJO+oWv/LbEb5rtWHlf5invqe9fqpuzv47tPI+z0yCY3GzDP6goSSIQn4IsMltTPqxyrsOrTD3wtW7LpOoA0/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=bxjqDR+D; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="bxjqDR+D"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0a95200e8so4799585ad.0
        for <spacemit@lists.linux.dev>; Wed, 21 Jan 2026 23:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769067034; x=1769671834; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ELBSBXcYpRPoISeGMPMPpa1xgXhu62fyafslk8/Rm5o=;
        b=bxjqDR+Dd9QhJTATQ7FLXhuVbLPyvTahxW8Cdju6h7UXFaoaR0D7Rr/yWJH37yveMz
         UZnrU9FlWEI4hbdqMUO/VAzJVK4nvyuP8S3J3Yu5rGKjtUcP34bY0JnAMw7KnWY9X7HT
         L7y6GbYZ2O33JeLQDFtVwF3fDuHzIp4dYXSPcGXA0pHqcuRzixno8wCZHOu2fS2CbGwc
         /4dcbdG2RACPlcLWKGY4DQIMaRJ6vEwsG5pI7Cmi4UPRe6JQSDzd0P9pXxf8rotX23DN
         8I2AnOdVH+gVAjWpco8RJLWOK/wWvS6VTKMWcrIBY8ET9EIzNlhwfKpOQ2JzujHHHPPl
         4Bsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067034; x=1769671834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ELBSBXcYpRPoISeGMPMPpa1xgXhu62fyafslk8/Rm5o=;
        b=FFr3UkF+gRuOI9En7U1Tjye9I5O6+NEXeBtP24N11uTiHp1jcovFheh5htrHm4/md6
         FispAGSgw+7BGaVVzl6cYw7PvfWLwYcsG7hgMns6m6UigtqZW9CQUFmhPEND+F7/Ff0p
         DQLF0WIW7NDnKStCwQBx6QEhDMBtY+frEvmFJBc0r1i/lkeHmNJQLNC9MXNeGGcYjNEk
         kdP2ln8XYuUU9Q5DGaXnjBTpxkdDOSI1stFgdSGyGiegpbVkunmH4B8K4vNLmsKAWINt
         tQo2gDTbMuQB3b7paetYQX+sGaXwOStTHH32IQRb3J7h79+EztLQgWVobmGQcJPWugV+
         rwHw==
X-Forwarded-Encrypted: i=1; AJvYcCU8QLVaVU6iEQT7J5kCl61iDWeCGWzw5Bd1J5Rc2W1vQkSlaF6c0ham1GiNE71K1Ncnx+PoBdav1A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4ohyAJ4FGYxZESy4bxmmd8zqCShPvByPjymThctenRX+M7RA6
	1HEPpJRbTEqwfThafY9CRMmM/KZwGMu8lgrSwdjpsb9hkc0aUSGeE+M/0qIZjHONcl8=
X-Gm-Gg: AZuq6aKxHDUksgWlV7wQj1Lc8+3LytrP91z82FCvLtA8MIoxArWocrfrtMmSYJJviSe
	9M8YBWoav8CG/saFOQKtiOy/4jKY36vXtKctSQ6uhcxXTZ4B8T02sXHXnNrVz4Iq2GIvI4e6GI9
	4MI9IhrupYe6cYaEqiy9v/6ePHYTescFuo1uXTClOdhlj5mXwXH1UOI39zXnkQOP9mPtIPJcILH
	xCc7B41yySLbDAgZ8vVYazrwMcpk60ihd4a6guYoKqaWWb9wbY7wlZon6mggQztCmKJ6ntN3YoL
	TrkLNvrJ+oM9WE1BCXoAqimcMF38zDl7/0KM7ZcJCnrEDvAr7Vyjjwxr38yW/7GDlfvubxaAjSo
	7mhEzFZKd+5sK7D66YWju46GRRMiSU3ljwfHi6NgQHLASDl+SmDs8TDngf8hib6rb9QNioV9d2g
	Fjr4zWhtmhYrmgK/LQkqIEl5og7HiJwcA=
X-Received: by 2002:a17:903:2391:b0:2a0:9fc8:a98b with SMTP id d9443c01a7336-2a76b059dfemr61934475ad.40.1769067034080;
        Wed, 21 Jan 2026 23:30:34 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::30fc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190c9edesm171691845ad.23.2026.01.21.23.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 23:30:33 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 22 Jan 2026 17:43:44 +0800
Subject: [PATCH 3/4] regulator: spacemit-p1: Update supply names
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-spacemit-p1-v1-3-309be27fbff9@riscstar.com>
References: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
In-Reply-To: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
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

The supply is a board design decision and should not be hardcoded to any
existing power source. This allows boards to specify their actual power
tree topology in devicetree.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
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

