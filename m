Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2076A1EB19B
	for <spacemit@lists.linux.dev>; Sat, 24 Jan 2026 04:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769228979; cv=none; b=PaI1XO5ux6Fi68tB+HLRNysyND7dw1mzF0VWD9jQja5RDtxinme4qaG/9PBFBnLdxtTU9rNMSLCVHFk9UgLnTsXsZnw8ld3Ear2fHjOGXBWgbBRY//uwmvO3yHZlY2/PQhYw5XYhc8J6KgPyoNA4vQSc28X+k81mOaPRmZ8Kark=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769228979; c=relaxed/simple;
	bh=sx3UyKFDuIEPkkHlPx4r27kZUF2Y5+jMgWB9/8tyLq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DWpdoLB2WjWu7t4AKNxfvg78hLGcPFsrYSDRfdE2I/dzNdRS6j/KTpuBRVDPDnLMv3gKpwRQIFnYJVgMrwQIC8OQDPRHmqlH/RP33gKmn20j0MNhWs+1RfsOfxjnKxkIutH4ks07mYejLjxfjZd7brzzTWCdUnsGgS3rktmjlV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=VjNfCZs0; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="VjNfCZs0"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso1102938a12.3
        for <spacemit@lists.linux.dev>; Fri, 23 Jan 2026 20:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769228977; x=1769833777; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzuiHQbYslZI5xHIBCbYXnuCh07OaFGFeD1UZM8yZnk=;
        b=VjNfCZs0ZsohiJ3qBgt0L2Mi/Y/hDuiObmDCTbU6BRDcXVUPYA9oOKxwylO8MNo2z1
         Dkd/I4i0vkN5nDml0RocYen+Igjr7ONLLNIfg6dfGLMWE50668VdVrDmwOC6VqIw9qm8
         YYKG58SyjhkWHFjUj8s42TZIhem04CfMzl9w1sYQo8OmFB+SRjdTgtc2q77ZoXQ632iI
         2FWl687tA3MIxXuLFUb7ZlCqvM5bRDU5rXBqbU5KSIlUP+UicJyppLe/9zT6mZ2AP/AS
         jx1jGmWFDrXBWwhMdglldBx/w/aqZGaqrkrRZrPeduVtngerTtzJIdXApYMeuM/LL3/X
         7Gig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769228977; x=1769833777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jzuiHQbYslZI5xHIBCbYXnuCh07OaFGFeD1UZM8yZnk=;
        b=Q3TRJ6r6lPx9PVbWvNGi/V9mM1Ps7GWnWgrS2ZbEZFcQMw/Antf3T3+Ipnb4XRkAF6
         xDOuYtb/YCMaaD/it5TFhtpsVKx55y0Zs7bbj6V4IGNRmyF7nzBxsVQ6bi7p9qomP3uz
         XPGDZ5ZK/bpaHQSdUqdCHDpRYUXvASJAWrG4da7vd4L0Ey7KqH7D2kpWm/m6Yq40MeAv
         KjHyTkfH2eA9Ku6UsEGTvK78gN/Lml4CmFOcR9QKhDfnSAiJ2bsAnyJq77PIaxtFEWxb
         zh7RxgqfYam5B5OK/Ra8kKbXt19/S0ggit0prWWLCGDtx1wvrK5YaqOwxzJY78BMNeXo
         RhMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWg4Y+ax0RCvjcOl3+DuinVEZ9VVRUIzdxCibvpwLxVaw0iQNLIhL4PLhgiLYLMmyAyhaOX2EQbuw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxxTZW6V2cLtG6acGIF3mA2Q2EFIpAJLw5D90wbMR1YKXWR0934
	XI9FnD64QJ8jm85/XkT/6sClqyzSnzhdgGGUnHRidU7taosaft1Fc9H1TFbcFN+Zkyw=
X-Gm-Gg: AZuq6aKc/Vo/bXodY0P9rvs6E5bqXbcsEG1SjLL/ebJ7npGXJRQdiAUswmAig3sVLKY
	JOan5aU1T+cTcJML5lB9fMOhB5NFLps9FgTGWn6xF33cClZHGKcScHiLz/6MGJ0I8erjZLE65f2
	LCzVmG3YG6/hlBXDk6VOTymO2dBo7GwnQhzq6uM7rNroN7l1GEsqUhd+iuRzo/ydpMKo/UUP1o/
	emBPkC7lkgE/wx9UZBTxWSt+r70te9FSZXOcIBE+g55udK1ZegjU96+vyHJZhmbb+53WOFNJ/1G
	7yLAcYtR3PDw/FdQ2uY0SvRruv11MZZRlwRfq1p+ybjU7wecOTqf1lNL9o5CM6JUkrq/pGtfNUm
	wTyjHqI+XABFjc6cGOTjvJOflwrGvehlUIbk6IOaDX1ZcZKEodrM5pNmkEmwuZAOGTfmcRbVLAy
	C8tdw7qd0dQvluHcHjBoOauYLj/Xx0JLo=
X-Received: by 2002:a17:902:f68c:b0:2a7:99c9:1086 with SMTP id d9443c01a7336-2a7fe74572bmr45740975ad.47.1769228977300;
        Fri, 23 Jan 2026 20:29:37 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::30fc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231871d51esm3469423b3a.38.2026.01.23.20.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 20:29:36 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 24 Jan 2026 08:20:16 +0800
Subject: [PATCH v2 1/4] regulator: spacemit-p1: Fix n_voltages for BUCK and
 LDO regulators
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-spacemit-p1-v2-1-2c86b06694ba@riscstar.com>
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

Higher voltage settings were unusable due to incorrect n_voltages values
causing registration failures. For example, setting aldo4 to 3.3V failed
with -EINVAL because the required selector (123) exceeded the allowed
range (n_voltages=117).

Fix by aligning n_voltages with the hardware register widths per the P1
datasheet [1]:
- BUCK: 255 (was 254), allows selectors 0-254, selector 255 is reserved
- LDO: 128 (was 117), allows selectors 0-127, selectors 0-10 are for
  suspend mode, valid operational range is 11-127

This enables the full voltage range supported by the hardware.

Fixes: 8b84d712ad84 ("regulator: spacemit: support SpacemiT P1 regulators")
Link: https://developer.spacemit.com/documentation [1]
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: No change.
---
 drivers/regulator/spacemit-p1.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/spacemit-p1.c b/drivers/regulator/spacemit-p1.c
index 2bf9137e12b1..2b585ba01a93 100644
--- a/drivers/regulator/spacemit-p1.c
+++ b/drivers/regulator/spacemit-p1.c
@@ -87,13 +87,13 @@ static const struct linear_range p1_ldo_ranges[] = {
 	}
 
 #define P1_BUCK_DESC(_n) \
-	P1_REG_DESC(BUCK, buck, _n, "vin", 0x47, BUCK_MASK, 254, p1_buck_ranges)
+	P1_REG_DESC(BUCK, buck, _n, "vin", 0x47, BUCK_MASK, 255, p1_buck_ranges)
 
 #define P1_ALDO_DESC(_n) \
-	P1_REG_DESC(ALDO, aldo, _n, "vin", 0x5b, LDO_MASK, 117, p1_ldo_ranges)
+	P1_REG_DESC(ALDO, aldo, _n, "vin", 0x5b, LDO_MASK, 128, p1_ldo_ranges)
 
 #define P1_DLDO_DESC(_n) \
-	P1_REG_DESC(DLDO, dldo, _n, "buck5", 0x67, LDO_MASK, 117, p1_ldo_ranges)
+	P1_REG_DESC(DLDO, dldo, _n, "buck5", 0x67, LDO_MASK, 128, p1_ldo_ranges)
 
 static const struct regulator_desc p1_regulator_desc[] = {
 	P1_BUCK_DESC(1),

-- 
2.43.0

